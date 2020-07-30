import inspect


def flatten_list_of_lists(list_of_lists, remove_non_lists=True):

    if remove_non_lists:
        list_of_lists = [l for l in list_of_lists if isinstance(l, list)]

    return [v for l in list_of_lists for v in l]


def get_methods(Class, startsw="check"):

    return [
        member[0]
        for member in inspect.getmembers(Class)
        if inspect.ismethod(member[1]) and member[0].startswith(startsw)
    ]


if __name__ == "__main__":
    pass
