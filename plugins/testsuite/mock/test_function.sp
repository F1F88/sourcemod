#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <testing>


public void OnPluginStart()
{
    Test_GetFunctionByName();
}


void Test_GetFunctionByName()
{
    SetTestContext("Test GetFunctionByName");

    Function func = GetFunctionByName(INVALID_HANDLE, "__Func");
    AssertTrue("Valid function", func != INVALID_FUNCTION);

    int a = 1, b = 2, result = 0;
    Call_StartFunction(INVALID_HANDLE, func);
    Call_PushCell(a);
    Call_PushCell(b);
    Call_Finish(result);
    AssertEq("Function result", result, 3);
}


public int __Func(int a, int b)
{
    return a + b;
}
