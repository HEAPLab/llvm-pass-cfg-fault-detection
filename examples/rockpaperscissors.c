#include <stdio.h>
#include <stdlib.h>

int COUNTER = 0;

void cfg_err_detected() {
    puts("Control Flow Graph error detected, killing process...");
	exit(0);
}

static int advanced_ai_play(int choice) {
    switch (choice)
    {
    case 1:
        return 2;
    case 2:
        return 3;
    case 3:
        return 1;
    default:
        return 0;
    }
}

// return 1 if the AI won, 0 otherwise
static int check_winner(int choice, int ai_choice) {
    switch (choice)
    {
    case 1:
        return ai_choice == 2;
    case 2:
        return ai_choice == 3;
    case 3:
        return ai_choice == 1;
    default:
        return 0;
    }
}

static void you_won() {
    printf("OMG you won! How did you do it?!\n");
    return;
}

void you_lost() {
    printf("AH-AH you lost, AIs will take over the world!\nWanna play another round?\n");
    return;
}

static void play() {
    char *moves[3] = {"Rock", "Paper", "Scissors"};
    int choice;
    while(1) {
        printf("1) Rock\n2) Paper\n3) Scissors\n0) Exit\n\n");
        scanf("%d", &choice); 
        int ai_choice = advanced_ai_play(choice);
        if (ai_choice == 0) {
            printf("Cya!\n");
            return;
        }
        else {
            printf("You chose %s\n", moves[choice-1]);
            printf("The AI chose %s\n", moves[ai_choice-1]);
            int ai_winner = check_winner(choice, ai_choice);
            if (ai_winner) {
                you_lost();
            }
            else {
                you_won();
                return;
            }
        }
    }
}

int main() {
    printf("RPS-Bot:\n");
    printf("The unbeatable Rock Paper Scissors bot trained with the most advanced Reinforcement Learning and Neural Network techniques.\n\nSelect one of the following actions:\n");
    play();
    return 0;
}
