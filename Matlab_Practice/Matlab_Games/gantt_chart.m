% Define project start and end dates
startDate = datetime('now');
endDate = datetime('2023-01-30');

% Define major milestones and their estimated completion dates
milestones = {
    'Define Game Concept',   datetime('now') + days(1)
    'Create Game Design',    datetime('now') + days(3)
    'Implement Basic Gameplay', datetime('now') + days(7)
    'Add Graphics and Sound', datetime('now') + days(14)
    'Test and Debug',        datetime('now') + days(21)
    'Optimize and Polish',   datetime('now') + days(28)
    'Final Testing',         endDate - days(2)
    'Game Release',          endDate
};

% Plot timeline as horizontal bar chart
figure;
hold on;

% Plot milestone bars
barh(1, days(milestones{1, 2} - startDate), 'FaceColor', 'b', 'BarWidth', 0.5);
for i = 2:size(milestones, 1)
    barh(i, days(milestones{i, 2} - milestones{i-1, 2}), 'FaceColor', 'b', 'BarWidth', 0.5);
end

% Set y-axis labels
yticks(1:size(milestones, 1));
yticklabels(cellstr(milestones(:, 1)));

% Plot project start and end markers
plot([0, days(endDate - startDate)], [0.5, 0.5], 'k', 'LineWidth', 2);

% Set plot properties
xlabel('Timeline (Days)');
title('Taxmania Game Development Timeline');
