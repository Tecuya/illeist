from django.shortcuts import render


def browser(request):
    return render(request, 'home.html')


def showtpl(request, template):
    return render(request, template)
