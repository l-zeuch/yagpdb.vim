if exists("b:current_syntax")
    finish
endif

" Keywords, as per <https://pkg.go.dev/text/template#hdr-Actions>
syntax keyword yagpdb-ccKeyword
    nil
    if
    else
    define
    template
    block
    range
    with
    end

" Functions, defined by <https://docs.yagpdb.xyz/reference/templates#functions>
syntax keyword yagpdb-ccFunction

    " type conversion
    json
    structToSdict
    toByte
    toDuration
    toFloat
    toInt
    toInt64
    toRune
    toString

    " string manipulation
    joinStr
    lower
    upper
    slice
    urlescape
    split
    title
    reFind
    reFindAll
    reFindAllSubmatches
    reReplace
    reSplit
    print
    printf
    println

    " math functions
    add
    sub
    mult
    div
    fdiv
    log
    mod
    pow
    randInt
    round
    roundCeil
    roundFloor
    roundEven
    sqrt

    " message functions
    addMessageReactions
    addReactions
    addResponseReactions
    complexMessage
    complexMessageEdit
    deleteAllMessageReactions
    deleteMessageReaction
    deleteMessage
    deleteResponse
    deleteTrigger
    editMessage
    editMessageNoEscape " why does that even exist???
    getMessage
    sendDM
    sendMessage
    sendMessageNoEscape
    sendMessageRetID
    sendMessageNoEscapeRetID

    " mentions
    mentionEveryone
    mentionHere
    mentionRoleName
    mentionRoleID

    " role functions
    addRoleID
    addRoleName
    getRole
    giveRoleID
    giveRoleName
    hasRoleID
    hasRoleName
    removeRoleID
    removeRoleName
    setRoles
    takeRoleID
    takeRoleName
    targetHasRoleID
    targetHasRoleName

    " current user
    currentUserCreated
    currentUserAgeHuman
    currentUserAgeMinutes

    " miscellaneous
    adjective
    cembed
    cslice
    sdict
    dict
    exec
    execAdmin
    hasPrefix
    hasSuffix
    humanizeThousands
    in
    index
    inFold
    kindOf
    len
    noun
    parseArgs
    sendTemplate
    senTemplateDM
    seq
    sort
    shuffle
    sleep

    " execCC funcs
    execCC
    scheduleUniqueCC
    cancelScheduledUniqueCC

    " ticket funcs
    createTicket

    " database
    dbBottomEntries
    dbCount
    dbDel
    dbDelByID
    dbDelMultiple
    dbGet
    dbGetPattern
    dbGetPatternReverse
    dbIncr
    dbRank
    dbSetExpire
    dbTopEntries

highlight link yagpdb-ccKeyword Keyword
highlight link yagpdb-ccFunction ccFunction

let b:current_syntax = "yagpdb-cc"
