Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84587CD3427
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 13:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574310E162;
	Tue,  5 May 2026 13:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lw9ULwDi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4F210E162
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777988076; x=1809524076;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=d/xmD9VyLkJ0YI/1MBloRWwrDEDGJ3S5xMjL9Yo/SkU=;
 b=Lw9ULwDijgtPE6/AOtCYg/5B7OTpxjoTG0VFAUTygY3Q3D0n7MBxQXqh
 ARii0OJC28llmHf5E8bsK93DdARF79lyJ/B7IgoI2WnXaPrCjTzgmxjuC
 1YD3coPC38hcWjzSncU8hNMnFBBWtlP+7s9PstRlS9R+wTNZEYucX2gKf
 K8gYnATtZ3hZW5oirnZYDaIm8y413OV8k2tooe5dm/gdFPRCWZapI7p4p
 QcW1kzRojQNMyEKj40Ym9KlUc8OOXQUeqfDEtqe24USJLbvlc3aQp0te6
 UgtPoXaw8k0lekAsshlOUij7tAcc9fV6BQX1h52BhxkGnvD9noCZt7hSc Q==;
X-CSE-ConnectionGUID: a7CfjUv6RSy4bcknAtL90A==
X-CSE-MsgGUID: ZPX3zkz9RVSh1/FA88r4pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79048217"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="79048217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 06:34:35 -0700
X-CSE-ConnectionGUID: kXvL5uxUSKGoXW/ewOTGiQ==
X-CSE-MsgGUID: PAjw9pTaQ0qZW45pRBRPeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="259163912"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 06:34:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:34:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 06:34:34 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:34:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cE1o6eCJH2/C5prE9LR3SOHtAHbyTAmuiED4RgY/uANoJGZlQfz+eUkhJ9YeaPcE8ikDyl+acWV09yKzHN6ZvrdqwpmLdcHuVSDF5LvS5no9miKsnOEJZZHo7VqWtFa+5KPLHEF/Ul3iU+h2X3eTNtrW1Zs6kZujU/5SXjPjLcbyy1Liz1GsuZleigv6jK6Fm0/e34IjSC76SZ53vFtGUH9GLToaS+SB6We4+OMAV3P5YvptrohUYB4bCOoLneYMv8QbZjeDGPwW726YwcAvsgQMpjG/ZNVpv6GqyqKkYZSr1GsYnpfs7vPDoK6HYkJFQA0v/7D7F29hn5yY3sx3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFzyXefgHFQOpJnCx9lQjfSRWUWvw7T8Fdv2MMqo2qI=;
 b=CzePyH1/vCLmyoq0bewTCNl9HsqW5sE79M2o0xIONXwzzT2vIQGB3d2amfVrwAHVP5wcTpDYpWqg0jLdGpbzgxTdLkHUmta6aPcJ4A50uWMImDmv2kACggrDaPu/+YyAKiKqGAErE+Y6AgbdDFGqj0iBSNnxZcGL09PjHLRkh0R79l8G+ithCepQnWLXWJZ8C+uygjMYx7A7vRsWYG+a6/rBn2SqgbEBGuaTR9NyfWq9EiFIouYgn4jeoVJYQfOaJYAJTh0ETYpI40upnPIWbzfAm/u72mNQXn3ZA++YhQBCXFpfFKMBZedFicB4L6Y6BOfYBTVJ6puAH1HK/xpGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 13:34:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 13:34:32 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <shekhar.chauhan@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v4 1/2] lib/intel_wa: Add workaround check for a wa
 within debugfs file
In-Reply-To: <20260505054741.486361-2-shekhar.chauhan@intel.com>
References: <20260505054741.486361-1-shekhar.chauhan@intel.com>
 <20260505054741.486361-2-shekhar.chauhan@intel.com>
Date: Tue, 5 May 2026 10:34:28 -0300
Message-ID: <87wlxix9nf.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc22bba-eb0c-4c9e-2a26-08deaaab0a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: lWSK79Ou2CTCJhypT4Pc2rpUp0nhU/gRq58QNknUgnVoh9l1LZSjR6mEz/7tvdPre0Hzd93t+1BGPMzJoQ25MkxIlia/PWWUMdezN5lLbc6bvAISBH+AzpXgACV8HmR7SeuHt5q4h5wxhQBQ1SiL78tdJpzPzKB0df66dR3dHKIaaFYHB7RZ3HG/j5VyPkfWGj6Z9tuKxrNfwLopuftzl6Dpq0WzM9sX5qNKjPhtcE8FkKR//hLhtBI7782qjzOcA2e+Gmw75XL2HLq1S9xxZKlv+msl6YUVuBX2BlbvsIwrUh5oIpA9IZn2yeRIpq3f26IPdOwJaCSDDtlxPjLcGqjz1ocAOd3Y63XFvnWrvC8Ps3ssK1Qa+zwZuZAY61FALqavuBQM0YVrEBqYooG4d0vKORUfJZqblGinqoYotF/gH0DMs30zrpO3aILmG9pMWtvoi0IzcAHJ9tsWQxMf8zt/ZDrGfDF9os91Tbkl6KDfIl7Muks6Q3JguBcUVqhFhDEniXffhWJtiy3bTgLl4Gm525udyLroeIaAxmr9KC+x6OOiwk2cUTwLGvOcv0B0R3yr84DFPaJn+Bb3cH3PWRe/KjaWqmk3VOCnJ6gME5EvwHYPyqmibLJQEgc3zq24WtCijldnfFrcg+bwk7xl6OhabXiQETrZJSHf19WpqU43mzs0dBYKXWYsvbUSjoYg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VNJnxV7VFIT1C96okZ/HE1KlJaXxAl0pKNzTFqCP3YLxAi3IwwBGzp/sPEpF?=
 =?us-ascii?Q?5ya0tuI6aFT7MjAQfuF8WbAnQvGdwRcPkygWH6wznnEkFOLn063S7j3f/zAB?=
 =?us-ascii?Q?ALPK3KuYcABRoYT3aKzOziD84kldOfBcxLPYaXvW7uzuI0/BlXsmm8Fnj6aA?=
 =?us-ascii?Q?KSb8VNNKRJK4NyZvESO+Q6kLUS66dTzB56NGmmeidkIXdbJiDR+FKA6lhMra?=
 =?us-ascii?Q?C9E9+kkopRbbdGrqB+RqSqudgVDVbYVOF/3ikK/ETKbRl/xlu+kJ+qL/7kbQ?=
 =?us-ascii?Q?JTf2mMUstcbkDETnXSijk2vKQyyHjkA1mn4qEHxKa4iWg3e/l4ZQqF5iJLUI?=
 =?us-ascii?Q?pB9vUK21y/ssFtAVsecCH+PEID5y07NFkb+9Pa8JpPeCGKlGNej/YRoBDplv?=
 =?us-ascii?Q?XYWDeSzr8ynZpMkjox1UVw0HLmtEBTfS5lDuQgjAgjEbRnoNmXG1x7OUBsUK?=
 =?us-ascii?Q?ywSGju978uXlko1d3PpTsqQou9ySH79HoHK79eit3gpIjWIvWBiTIgfxhru2?=
 =?us-ascii?Q?k3/LXA/Zbj5EPwP2eJvK/EPx2fmouYul+Asj6IwSb3YmIdAO/6q/JJ/A8Gki?=
 =?us-ascii?Q?ve7aVKwMy7h/VGKomSQcPnx876dFCLQz+bV0M+0zVgYDCrHZsusAjVO2SHnn?=
 =?us-ascii?Q?j7CkrusrsBLpGQRu/FFUEoy/J5fBAx81FftANtnLbrNej7jDJbJ7KFZQa4IW?=
 =?us-ascii?Q?MHokPZ+8rzFmZxPwtzwfwjC2lUOtK3yWkiBO3Cgt0X/xRi8kWC1Ocdzu84gk?=
 =?us-ascii?Q?gQg4xA9bM2kYPh4eo52kqw27IZ6SaH4exfFgAAejTeausxsBi5bm1cCros/M?=
 =?us-ascii?Q?VOXtEMNCI9zHwxGk2Hr7GMBqBFgsiBzFpAD7eTfvhBtmvN2MB8aeww7WsRfT?=
 =?us-ascii?Q?z34cJhamNnwUn3D4PhXf/bJBRzvcLjDsujNJW/M3NUor2OhwddjXVt8YO/gU?=
 =?us-ascii?Q?V/VWzrnA7a41d4sFLgJct8WQZLXNI9IgIof4Ok3Q9EtrDqKpCPUSvXxQbPHD?=
 =?us-ascii?Q?AMdwnC6GQkQjwIabbwq6GQwSOaV63s84xzSa6gqpX+m27NoeEGAT06Sl+kqm?=
 =?us-ascii?Q?lmAC/ylX+l+G7hRXl6eh9zwQkMMEE1OxtpmtfKDJQMTZ4rT+f9yK3tn10Wji?=
 =?us-ascii?Q?kC/4/GrA62FaNCUqiCWT1yHnWSj99VE66c7zJb2M5G5qV4dws9Y/ySIYTesA?=
 =?us-ascii?Q?nFluV0F/fkD7/I3T14ZKFuSCMt//rdpJ2Ynny7ds7S5CIYGSUtEQWaarDGwi?=
 =?us-ascii?Q?JqsJP/aP55cFEPsdrEg3gb/AsK0sNjPuxrhrIf4A4L3l40DtKhbH86dsXnJg?=
 =?us-ascii?Q?vL1OJcQ6jki4y3dNV59v04XvPdwsK/tYI9njOLhWYERUA24aqXIcvn69s7Pu?=
 =?us-ascii?Q?eQAgkGzVQQFun4r3wfJ9E/tEfqBk6YiQgjfVWI1VL6xUiwX6EaLbbBYt+7f8?=
 =?us-ascii?Q?P0XbmUWv3ENsE5dJbIwbqxS+s0fCMrS2iitr1IfSwqepJBSK3+ONfbARPx73?=
 =?us-ascii?Q?wqM3+au3E4x3sPcKwXMl3UxIVz9Z+YbTA7ZsusXb1WAJW0Dv/ZNkxmAjLTrT?=
 =?us-ascii?Q?Krx3z0g70BL4W0eJeGM4yyBeBnNcB/puIrabb/6a7IsAoMqXOLmv42hf1lMo?=
 =?us-ascii?Q?RF3PC4+XDeGO/7IPbJNIHIX/YXiObXgXsYITaDBkbchkRXdBPwMKdKqyx0K1?=
 =?us-ascii?Q?CyuYhfESeMf0kdWHgLHIH9vlv68azx/45D41J/4KD049YwQMkPzAnhuZHklA?=
 =?us-ascii?Q?aAftZC4nqg=3D=3D?=
X-Exchange-RoutingPolicyChecked: qqzwPkA45qeVFzWBZe+k4mxdqiZCLuDA+jFA32Y+EUq/Tfp5zjIkRZ76RaxoT9UfNy2VGkGFEAx2qjCtBC/fkHTUAQfoav7H0X1pDDquGafhorvoEk/0qsciiO9058smhm/g6kYfHgvGZdAsmStLSbRiONy34ck1vBVdJXCkyRv4Y3FoEX5dwwy1IbkdNw84tKM8oPyAlXLJis6/lTwurkMJliwuXZ8XavRgOJrEoF/67JitXw9sM3dpePAks1aPmfp0DgqTdVnXloMAOkz3E9wysEgplza3SAPy8+19DAKsPwfv40w3S7Q8eDuxymiYLAsHn5PQ4wWm+mblFmMFXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc22bba-eb0c-4c9e-2a26-08deaaab0a1d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:34:32.1639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6X1rk1aW/fpmjvDWBnwxzYEbQmkieaL6rnzctnS+0oyzjidXdoRx+tzBkUBLfO0Zzme4C3OJGGxtamqYj9yxgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

Shekhar Chauhan <shekhar.chauhan@intel.com> writes:

> Add a check to see if a workaround exists in the debugfs file.

The commit subject and body are a bit vague and doesn't quite reflect
the purpose of this change.  The subject should try to summarize what is
being done; the most important thing in the body is the "why", although
some details of what is being done doesn't hurt as well.

I would go with something like this:

  lib/intel_wa: Also check for device workarounds

  Currently igt_has_intel_wa() only checks for GT workarounds, but in an
  upcoming change we will also need to check for device workarounds.  As
  such, update igt_has_intel_wa() to also check for device workarounds.

  While at it, make sure that we do not duplicate the logic for reading
  from the debugfs file by extracting it into a separate function called
  debugfs_file_has_wa().


I think there is room for improvement on how those functions are
implemented: the use of strstr() is not very robust, since it can return
partial matches; and this function is currently xe-specific (i.e. can't
be used for i915), so we need some assert to make sure that it is being
called only for xe.  However, those are unrelated to this patch and
could be fixed as a follow-up change.

So, with the commit subject and message fixed as suggested above,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

--
Gustavo Sousa
  
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  lib/intel_wa.c | 40 ++++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> index 685df106f..727dd6c98 100644
> --- a/lib/intel_wa.c
> +++ b/lib/intel_wa.c
> @@ -12,6 +12,27 @@
>  #include "intel_wa.h"
>  #include "xe/xe_query.h"
>  
> +static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> +			       const char *debugfs_name, const char *wa)
> +{
> +	char *debugfs_dump;
> +
> +	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
> +		return -1;
> +
> +	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
> +	if (debugfs_dump) {
> +		char *has_wa = strstr(debugfs_dump, wa);
> +
> +		free(debugfs_dump);
> +
> +		if (has_wa)
> +			return 1;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * igt_has_intel_wa:
>   * @drm_fd:	A drm file descriptor
> @@ -25,7 +46,6 @@ int igt_has_intel_wa(int drm_fd, const char *check_wa)
>  	int debugfs_fd;
>  	unsigned int xe;
>  	char name[256];
> -	char *debugfs_dump, *has_wa;
>  
>  	debugfs_fd = igt_debugfs_dir(drm_fd);
>  	if (debugfs_fd == -1)
> @@ -33,22 +53,14 @@ int igt_has_intel_wa(int drm_fd, const char *check_wa)
>  
>  	xe_for_each_gt(drm_fd, xe) {
>  		sprintf(name, "gt%d/workarounds", xe);
> -		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY)) {
> -			ret = -1;
> +		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, name, check_wa);
> +		if (ret)
>  			break;
> -		}
> -
> -		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
> -		if (debugfs_dump) {
> -			has_wa = strstr(debugfs_dump, check_wa);
> -			free(debugfs_dump);
> -			if (has_wa) {
> -				ret = 1;
> -				break;
> -			}
> -		}
>  	}
>  
> +	if (!ret)
> +		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, "workarounds", check_wa);
> +
>  	close(debugfs_fd);
>  	return ret;
>  }
> -- 
> 2.53.0
