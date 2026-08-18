Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D1CC5DF81
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 18:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE6A10EC39;
	Tue, 18 Aug 2026 18:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9y1g8/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B4D89496
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 18:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787078461; x=1818614461;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tlXTG4O86Obn8XfkA6voi+XXHJGBwlkcMqLx62ealIQ=;
 b=G9y1g8/2wDYelI/H+MS4bPzUsCOJEzrJIhwpkJtepQCSVtZ+rmgyL9np
 eb8XnjnqQz9s13LOAG2SVX2+OJj81khQZgMd9XK1ikreVfkTLaOK/xHNm
 tBm66DhMUylduxDxJZJTZv1FecDz7xIPfLJtHXspLFB5jVoSK/Ls4hE9C
 IUAfDbJYa4VnzoPv6DMkkaPZFqwd1EQr+1KcXYej6q+/+fMTibolgJuH7
 ODd0QnMNE6YrQPIl6G2anF12qMn+/7djOKtzziBmgig1fhYq0nfiZamBx
 zq/hVYJAh2lCGODb+xv7ViPpXtu8dvyuVL3A6/hZRJKxHOTgFcp521xhD w==;
X-CSE-ConnectionGUID: 8qCnACndSuWbzIL+P2eaOg==
X-CSE-MsgGUID: TekQMtx/RjG0woeDWCPDWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87436972"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87436972"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:41:01 -0700
X-CSE-ConnectionGUID: ExCS6PnpRKGXfrc/Te6tAg==
X-CSE-MsgGUID: gcM264YHSkK0KppL4kHJmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288822558"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:41:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:40:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 11:40:59 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:40:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcNPtoqOWIiU/dPAL/ZBW17/JJu7XWeQQRWk6uGfdHlo6HilaLztAUDy5HEfyQWsjxV9CXUgKTOFix4LpNo56JPbqQRbEqQC8hKOp1ev7p18V8LNTAyqPvOBD7CACR0r+8Bbb6UfQ+BXB67gWklgSoXvBKjd8KLoJCAx/ZDmIZ+aqnAIpyN7ZWVsSf5D9g7hvN9xQDwZV674zg0aF+pvGWQifE5iNkzP3rg22mfNtfLDqY4YbBkbwy9JfjlW5d2ZnRMO8zVlPlg9JS+863i7fyOPgEZxlyfTOV4uwlhyXeHPBtZA9uCIxJ3ih9eh9aQOw5ejtRMUTuJI/naF6wXdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEYd2hx5YbgnK0L8VOe9h5ruh9yN3zlq4z7jk0dQXOc=;
 b=K/ahX7eHKXlu0swXAKqt9mMPTyLYjCs9vfzIyVPxhLWEkIKlYT4J/viGjSJzMMl8VrBiejf6e/ph0dXFiqd6nW8iyqK2+aenvgyoOsr/HAfeeYzJ2t5BW8AwAIXe9mkHRHcxfi9BSOdGhWKMP5BsxUIydle7KvI3CwEIOUSu5IlNmPNvEXhx31e3NxT4OdNPl9CjHHMRU70+8a3TieehS5HhA/f9KK6Sd4odAa3NOa4zeLdpUB2lGwBHXggT5laQRt69Rn65J6dNt3PNJbVwdylxS3tC9BFF2wnc597X9yWMNIoGwMU6FTF9B3pcLS1Lnbe8hAGNoRnrEC/klJntlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 18 Aug
 2026 18:40:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Tue, 18 Aug 2026
 18:40:48 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/10] lib/xe: Use stricter line-equality check
 when checking for workarounds
In-Reply-To: <20260729212333.GB7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
 <20260729212333.GB7790@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 18 Aug 2026 15:40:44 -0300
Message-ID: <87ik57b7bn.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 39da8820-c942-42e8-4716-08defd58388d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|4143699003|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: ePeXAqV9joBL7hMm28MW7xqA+sKjPGwVPlibbElc9Zq2Gqe77QBlZpze2Ne1Qt4pFkmVD41adXkdmkv3ORuQdiVqOeLzL50vS+ZuchpaJdPVzER3PL1sIrA9qF1c08sP09WEUX49pp7HbsJ1G/oH78pHJwFKCHAeuOksSrtrdlleYzwPS1MZniyUS2H7/ohcwGhK0qF1BSOl8UpQFaut3H7uQ7OUczDqmND61BsCYKTk2UOpsUsAILe+XFqf8P3SwjIVJKcjglssc17NMmUn9h63YND1yOOxwYB/TwmPB/TiZmOsBybK/+KMfx34TyoDqksEPUDqq6KB6wELp9YpOjxzkbF9LE96Lv03XUa4GliqrMJQfPh6yUiE9vRHMjpXKcdvHffgpIarzt+b+M7sSB9yOaEzDbdRYCvERNJIVSayXm7bBvJ27JvZBaLqjEXQF11l1GFvLtbU69WV7oKr/VXkyrNSOEWeV3ZVXv/GwEYQ0k7ccWQ2d75rOc1r39L9c97M7KHX1LxkSadcyHKZgVGq7ycIlENUH08pwmCSggD9NsX5T1Qw2It4lSezrQK6h3N8AtNTtQoHupdL1ME2TGWz7Df2//toP0svmQZcShp72hZKXbaB1ICDkRD9akX1ul+rozT/kM2BakbwTH+GrYC04RGK9EY7oTzoWUNB9yA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2cks9LDvxN7DdPT997Fwa6hzzrsCFwOaieyk/THxb0CRqqlHjFR/W1JlGz02?=
 =?us-ascii?Q?Jt/BYYlOpyH6K0wKMAyR/SMlgFijkkln56htTj70ehFt53sUS/5sLKkyDINn?=
 =?us-ascii?Q?ImgFZjp17Ol3SyP2R3cYYl+UeUZbjDfwhL+n7bLo2MoMVKEhn2UK9h+TJI6Y?=
 =?us-ascii?Q?AK4cIc/LQdgm0/KR55azHmWgiBONHqU6mbFrVsdEPsXxykBGxeEpjVdnkZnG?=
 =?us-ascii?Q?E2U5bLRq7M868TPwo89sCcI25sj95ycArNpDNFZ5NKepKkk0HAV2lZBk8UZZ?=
 =?us-ascii?Q?XpwOJFWo2HvpZ3g1jZmuB2RB+JOQNIKVGOdtI2mrTJGYwixIwF+PmHZGaxRC?=
 =?us-ascii?Q?ykqgryblWUAAf2vIhpcl+qSetkd8BASCgLwhcG0udCyl+iXRJX1thO8lWVLP?=
 =?us-ascii?Q?2EfIKQsqKQMw7Or5nFnBEJ7ZSB7QYjfnGn1+S6Jtq4URLhJuanN745vKdjZV?=
 =?us-ascii?Q?Tu34lmPB0Gn2Z9Ce/XoS1M4DY6Pol5vzkYnRQEpv81CVXYP4vzu9evVkmiht?=
 =?us-ascii?Q?/GDHxwuTIDKCYzFLAtys3PHGElGhG6vhKJDN/27wvaFJUEGlO5d803jL+7WD?=
 =?us-ascii?Q?WmRMnfuhOfggePMqoNv/X1EF1Ik5xeLTCKRJjFhtRMyJluM2q8og6zcUOoY5?=
 =?us-ascii?Q?UNJwGR37gfrpaAxRPdqM5AMhZjb9J3PqZOIStKRAJOs0UJMEW26YnYybv7cm?=
 =?us-ascii?Q?7P+nJsLzPYEXoU6LZoQYHWeFE++AlvPY6YSZYpvd0S1hAL3KybVukPldZ300?=
 =?us-ascii?Q?7aQhihD41xDtj4ZSqX94f4hsfwFyVhZPUpB1eo4CosGe5o5rEtn+vcpfBu3j?=
 =?us-ascii?Q?IJioRv0t38C98qC2W9QbaMVUVT3rz7k9c3WmJvPJTl7/qtDOI0Pm2T/T1Qf5?=
 =?us-ascii?Q?rWCkiNdojF7si94G/SWwMubA/a4NS/P88OSqG+F6xllSZh3xL7Zjv6qjoWvE?=
 =?us-ascii?Q?fZcryQkuzqAju1lYEnKkUAzHy/M+DmgyVyRJenDZfbatTX1RYraLfEOh3QMM?=
 =?us-ascii?Q?JZUfxlYx82AkPxo15CMNJDZIRY4kMM68+w78NX2dQGp9tmC0hxhq9uV6Nc5e?=
 =?us-ascii?Q?fc0o0PIu8A+LS3n+NB5dhWNua9RWgPS/NP4IvrKWnsoybAoCbRFq5lWo/KxK?=
 =?us-ascii?Q?/ZR8KCna0/4qRgbAopSlFve82O3q7H/F29WKNxWgNeAuT7snq77Cz3NiFNrI?=
 =?us-ascii?Q?ZvMNVX/1q4yjsFxl5n/877yYxJF3q97JB3xudhFcFW+DN1efO7/BvdkRVCmE?=
 =?us-ascii?Q?30KsGUtXExshNNVC46aFHDNxcrUvkptOvfOd5VEv7Ypa1sKRORRvzzeL4j+9?=
 =?us-ascii?Q?diHsU5fbXniQ87qWWfOxakzjQz9bmfT6pAorNNLSwJ9nyGZPGFzPlrhQ5di/?=
 =?us-ascii?Q?kw2/OjO+u8W3SmbZRVsaSE3nGMY9h14hWhSUuLPHnfxYJhY9HDlCMzgtajhl?=
 =?us-ascii?Q?C80C1g3UakT68Cv5HdAuB7gpvMORxISrTx8WwoS/Oo/5gm00iDjPv4Zf0COl?=
 =?us-ascii?Q?Ekx/z1G51kIk4dPFXufoY9xBy1g00jWIiebeThQ+v9Zbsa5GeZFar/9sNgJs?=
 =?us-ascii?Q?L7ZF+dJVBAWZqDdVzmc0dmPWw6a7pSVFUQ9p1Dv26+lq9GjlkHvkzZQb5xm9?=
 =?us-ascii?Q?WG0bBqtHZU7kYrcx9zU88kfFWInFN97XmVv9SBneS0WDIRGBa/BEjBWB81d6?=
 =?us-ascii?Q?MSs4CYa9967cul8iOuAO/C99E0etGOZqw+TK2uUDHwjOkmV5pect1jA5to7J?=
 =?us-ascii?Q?EqJMiunDKQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: IiprQwkfHcwDgQopRFzi+XNG5m2LEsoFFdxCmh1FXyaSmGAgpllr5zrsKk6bF8hjhg6bg8GdIRS3FPAOFkt80tOQ5b/gQp6C3vQMxT833ie/zz3RUlZVYd9RliH/6ApPd2H9vVAeS7rjxWkbaQQ7nYSGLG5gfY66CdUdfda3qIc2ygEZVhOxOwhW8w8o8Jb9cmcMHVUqqDSM54PwIFGl+JJQhGzFIRQGwt/cEBrepx/He9fLXyNoSXZSNalK+j2qdiGennm58CBKNf385wj/0R9a6ZRTGDaAcMU3MYi/e2Vvs042voJ/mZt78NZyktACezV3xrrprA/rggPMU0b4Hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39da8820-c942-42e8-4716-08defd58388d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 18:40:48.3424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQHiLuh3O8cU7xv1pjxe4t6UhhsrzGReRZKdTb5Sk7wgIaTEgvme/ckXyibT9zzgEl31O3qVgPwge7G/7Zqrwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Jul 21, 2026 at 03:59:55PM -0300, Gustavo Sousa wrote:
>> Currently debugfs_file_has_wa() uses strstr() to check if a workaround
>> name is present in the debugfs dump.  Using strstr() would match the
>> workaround name anywhere in the dump buffer and with that we risk
>> producing unexpected results if the checked workaround name happens to
>> be a substring of another workaround present in the dump.
>> 
>> Fix that by making sure we match the workaround name with the full
>> line from the dump.
>
> There are other parts of IGT that use regular expressions from either
> POSIX (regcomp / regexec) or Glib (g_regex_new / g_regex_match).  Would
> it be possible to use one of those here instead of opencoding a match
> function?

Yeah.  That could make this function more readable and easier to extend.
I'll take a look at those options.

--
Gustavo Sousa

>
>
> Matt
>
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  lib/xe/xe_wa.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 38 insertions(+), 1 deletion(-)
>> 
>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>> index ff5daf529831..d44431e7e61f 100644
>> --- a/lib/xe/xe_wa.c
>> +++ b/lib/xe/xe_wa.c
>> @@ -13,6 +13,43 @@
>>  #include "xe/xe_wa.h"
>>  #include "xe/xe_query.h"
>>  
>> +static bool debugfs_dump_has_wa(char *dump, const char *wa)
>> +{
>> +	char *a = dump;
>> +
>> +	while (*a) {
>> +		const char *b = wa;
>> +
>> +		/*
>> +		 * Each workaround name is indented by one tab
>> +		 * character; unindented lines are used as "section
>> +		 * names" identifying the type of workarounds that
>> +		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
>> +		 * etc).
>> +		 */
>> +		if (*a++ != '\t')
>> +			goto next_line;
>> +
>> +		while (*a == *b && !(*a == '\0' || *a == '\n' || *b == '\0')) {
>> +			a++;
>> +			b++;
>> +		}
>> +
>> +		if ((*a == '\0' || *a == '\n') && *b == '\0')
>> +			return true;
>> +
>> +	next_line:
>> +		/* No match for this line, advance to the next one. */
>> +		while (*a != '\n' && *a != '\0')
>> +			a++;
>> +
>> +		if (*a == '\n')
>> +			a++;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>>  			       const char *debugfs_name, const char *wa)
>>  {
>> @@ -23,7 +60,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>>  
>>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>>  	if (debugfs_dump) {
>> -		char *has_wa = strstr(debugfs_dump, wa);
>> +		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
>>  
>>  		free(debugfs_dump);
>>  
>> 
>> -- 
>> 2.55.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
