function varargout = snake_game(varargin)
% SNAKE_GAME MATLAB code for snake_game.fig
%      SNAKE_GAME, by itself, creates a new SNAKE_GAME or raises the existing
%      singleton*.
%
%      H = SNAKE_GAME returns the handle to a new SNAKE_GAME or the handle to
%      the existing singleton*.
%
%      SNAKE_GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SNAKE_GAME.M with the given input arguments.
%
%      SNAKE_GAME('Property','Value',...) creates a new SNAKE_GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before snake_game_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to snake_game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help snake_game

% Last Modified by GUIDE v2.5 05-Dec-2023 00:03:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @snake_game_OpeningFcn, ...
                   'gui_OutputFcn',  @snake_game_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before snake_game is made visible.
function snake_game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to snake_game (see VARARGIN)

% Choose default command line output for snake_game
handles.output = hObject;
set(hObject, 'Tag', 'score');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes snake_game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = snake_game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in up.
function up_Callback(hObject, eventdata, handles)
% hObject    handle to up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction;
if ~(direction == 4)
    direction = 2;
end

% --- Executes on button press in left.
function left_Callback(hObject, eventdata, handles)
% hObject    handle to left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction;
if ~(direction == 1)
    direction = 3;
end

% --- Executes on button press in right.
function right_Callback(hObject, eventdata, handles)
% hObject    handle to right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction;
if ~(direction == 3) % If snake is moving in left direction, it cannot immediately change and move to right
    direction = 1;
end

% --- Executes on button press in down.
function down_Callback(hObject, eventdata, handles)
% hObject    handle to down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction;
if ~(direction == 2)
    direction = 4;
end

% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in start_game.
function start_game_Callback(hObject, eventdata, handles)
% hObject    handle to start_game (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat_r mat_g mat_b;
% 1 -> Right; 2 -> Up; 3 -> Left; 4 -> Down
global direction;
global points;
points = 0;
direction = 3;
locx = [50 50 50 50 50 50 50 50 50];
locy = [60 61 62 63 64 65 66 67 68];

mat_r = zeros(100,100);
mat_g = zeros(100,100);
mat_b = zeros(100,100);

handles.figureOpen = true;
guidata(hObject, handles);

update_snake(locx, locy)

% Position of the target for the snake
% So, randperm(size(mat_r, 1), 1) generates a random integer between 1 and the number of rows in mat_r (inclusive), and assigns it to the variable pt_y. 
% This is often used to get a random index along the vertical (y) axis of a matrix.

% pt_x and pt_y give me a random point on the screen between 1 and the size
% of the rows of Mat_r.

% If a target is placed on the snake, it is invalid: so to avoid it,
% generate a different point
while(1)
    pt_x = randperm(size(mat_r, 1), 1);
    pt_y = randperm(size(mat_r, 1), 1);
    if sum(locx==pt_x & locy==pt_y) == 0
        break;
    end
end

mat_r(pt_x, pt_y) = 255;
mat_g(pt_x, pt_y) = 255;
mat_b(pt_x, pt_y) = 255;

imshow(uint8(cat(3, mat_r, mat_g, mat_b)));

while ishandle(hObject) && handles.figureOpen
    try
        imshow(uint8(cat(3, mat_r, mat_g, mat_b)));
        pause(0.1);
        len = length(locx);
        % Reset the colors of each position to black -> (0,0)
        for i = 1:len
            mat_r(locx(i), locy(i)) = 0;
            mat_g(locx(i), locy(i)) = 0;
            mat_b(locx(i), locy(i)) = 0;
        end
        % Check if snake bit the target
        if sum((locx(1) == pt_x) & (locy(1) == pt_y)) == 1 
            locx(2:len+1) = locx(1:len);
            locy(2:len+1) = locy(1:len);
            % Generate new target
            while(1)
                pt_x = randperm(size(mat_r, 1), 1);
                pt_y = randperm(size(mat_r, 1), 1);
                if sum(locx==pt_x & locy==pt_y) == 0
                    break;
                end
            end
            % score after eating the target increases
            points = points + 1;
            set(handles.score, 'String', num2str(points)) % In handles.score, "score" is the tag for a static field
        else
            % Shift everything to a position behind
            locx(2:len) = locx(1:len-1);
            locy(2:len) = locy(1:len-1);
        end

        % Moving Right; X an Y axis move from 1 - 100
        if direction == 1
            if locy(1) == 100
                locy(1) = 1;
            else
                locy(1) = locy(1) + 1;
            end
        % Moving Up
        elseif direction == 2
            if locx(1) == 1
                locx(1) = 100;  % Change this line to a single equals sign
            else
                locx(1) = locx(1) - 1;
            end
        % Moving  left
        elseif direction == 3
            if locy(1) == 1
                locy(1) = 100;
            else
                locy(1) = locy(1) - 1;
            end
        % Moving down
        elseif direction == 4
            if locx(1) == 100
                locx(1) = 1;
            else
                locx(1) = locx(1) + 1;
            end
        end

        % Move left -> No need to update locx(1) because the values are all the
        % same even when shifted if I am moving left. It only changes when I am
        % moving top or bottom with: locx(1) = locx(1)- 1 for UP and locx(1) +
        % 1 for DOWN
        update_snake(locx, locy)
    catch err
        fprintf('Error: %s\n', err.message);
        handles.figureOpen = false;
    end
end

% --- Executes on button press in end_game.
function end_game_Callback(hObject, eventdata, handles)
% hObject    handle to end_game (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.figureOpen = false;  % Set the flag to indicate that the figure is closed
guidata(hObject, handles);   % Update the handles structure
close;

function update_snake(locx, locy)
global mat_r mat_g mat_b;
    mat_r(locx(1), locy(1)) = 255;
    mat_g(locx(1), locy(1)) = 0;
    mat_b(locx(1), locy(1)) = 0;
    
    for i=2:length(locx)
        mat_r(locx(i),locy(i)) = 0;
        mat_g(locx(i),locy(i)) = 255;
        mat_b(locx(i),locy(i)) = 0;
    end
    
    


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global direction;
% disp(['Key pressed: ', eventdata.Key])
switch(eventdata.Key)
    case 'uparrow'
        if ~(direction == 4)
            direction = 2;
        end
    case 'downarrow'
        if ~(direction == 2)
            direction = 4;
        end
    case 'rightarrow'
        if ~(direction == 3)
            direction = 1;
        end
    case 'leftarrow'
        if ~(direction == 1)
            direction = 3;
        end
    otherwise
        direction = direction;
end

% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global direction;
disp(['Key pressed: ', eventdata.Key])
switch(eventdata.Key)
    case 'uparrow'
        if ~(direction == 4)
            direction = 2;
        end
    case 'downarrow'
        if ~(direction == 2)
            direction = 4;
        end
    case 'rightarrow'
        if ~(direction == 3)
            direction = 1;
        end
    case 'leftarrow'
        if ~(direction == 1)
            direction = 3;
        end
    otherwise
        direction = direction;
end
