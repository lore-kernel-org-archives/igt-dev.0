Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61908C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 22:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAA310E249;
	Tue, 21 Jul 2026 22:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkOhItiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47EB10E249
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 22:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784672456; x=1816208456;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mwss0s2DD79jZbrpXfvusVKTnEQtku0F0rBg2vJktkc=;
 b=QkOhItiLE5JQ9Ody51Anix6bBOe2LpYikJkcd42qwXkZUES5KcmSubN5
 xbU8dRTYnQmOl8nWaJjQTi5ayX90sQ8T/H1s03ZqNSGLdRdwYg/tRRIKR
 SXg8SQi54tTVTzzDMceeI6jpQ+mDQRrowVzfgJl/ebXpxmnwpuyVGlrS1
 nvU2AkIgZwAxPcNkjC/GSJI/IOH0cpWeBah6RB/YYUV1JWLOxr4oh21xj
 g+mgM5Weoq9gMKnHjf5WdECW3lhfNtedlciS43qHSZizrIEDcR3TaJWZc
 1vGeixqDlclYhxZvw3qis/NXpIueDt8bXUP+z+Q9Y7fRP6n8ADQYIrP1h Q==;
X-CSE-ConnectionGUID: 1qHvUhAhRlGoWh+9CxI8Gg==
X-CSE-MsgGUID: 1S35AposSdSzkg2EMgINaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95946695"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95946695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 15:20:56 -0700
X-CSE-ConnectionGUID: yB9x97YSTEWEudGpBoP/KA==
X-CSE-MsgGUID: N7fGe+urTV6laSNCLLNvAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253531792"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 15:20:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 15:20:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 15:20:54 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 15:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjjAlgP4svlFr0lwSEx1H51iq5197Kzf1RS/POMW1JqsM7/ro8UeYWJmo3wmnv8irENKWseHmeSTHqDIerT/IZzFLnAZNIg2KYfKdHRIcKuCSep1wChTXPQ4EBsD12UXcnsLe3VP0HCSLDFhl1en0O7F8DQzXhv6nQy7fp5GiJlm81sejLqmIENB5hpvn/zXPCW0XZHjql6r9GL8ePZ4xmxbE1jRz37bZLxiVxJU5IAJvfvFPxAZczyq/1xSxXjloTXiCNyLpEHTnVW0+CGYgIW07Fxg70uh5wA7xVOpRIn18f3wqoDXzTh44nASVLHevbR0DHG0Iu3rOiwuF/XzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOI7pAd4vFq5CaWOQZBAq91pP1Wp5mJcQos3z9GL8RI=;
 b=wOOovuL3OXWQWF2O6k5m1RT7fInok2dL6XfoFUghS9rxk405dJBj8SUbAnNNTupSKGHkuemVa/tXW65P8BX73JJF7AFnBxDFbvKbRzh3c3dKVqwSfkfFMJ0PrkE4uZYl8vHsvo79WqxtqWw/hE1g2iqKBboQ2vTz0wRN4N9iKD+lYQfDI/Kzj9v6k8tk7m1QZa5+4qLmer3ykm1Votcd6cAxZ+x98tAfGQnQgwPhNLDPIQhWxgduUUQcqiwu1RZ+retxrSF3AgOMiO7ojVoepBvLuk1Ci/hVT1qAP3IUmMahbvmZtwmdeMqNE/WiPmQuiilG8Rv6DQ0ef3pkN0C1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 21 Jul
 2026 22:20:51 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 22:20:51 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ewelina Musial
 <ewelina.musial@intel.com>, Ryszard Knop <ryszard.knop@intel.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t RFC v1 0/2] runner: create results incrementally
In-Reply-To: <20260720161526.64709-1-kamil.konieczny@linux.intel.com>
References: <20260720161526.64709-1-kamil.konieczny@linux.intel.com>
Date: Tue, 21 Jul 2026 19:20:47 -0300
Message-ID: <877bmoq91c.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:217::30) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d419905-1298-4874-756c-08dee77652d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|22082099003|11063799006|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: pTW3I5L7QUXGRAelQqBTFphnQC0RAIF2f0QS/7cT7c7O5bv+6uLSA0U+Jz1sVG0MBE6Lzpfm0iSdM1Ix2gHuGtnTj/JXEwvxdLdQx++a7NZpuNh6cJJiCBXyFz6ZSbNHnYeQD9Dxvh/bejo9hwbuYMpm+CL/n0BOOabo4HeZj18mYz7sleNyMtubH14Vo1OPm3E6wlH0GASNoxHCHdMPRphqjipMbw4vtadGinVxdF5zDOiOXHz2E9NuQyp5jlJB5SBnqDasRbltdQPqCsTxvA7u9BfjUL/qpbemzxpTe9ZMO68DLLKds2b/1ZbwvdqoGlaR5vW21eKrXOIuTm4u8ORTfNhMYO86Hhj+Y1mYC7IXsWzUyzNOu3HoS+HluXqE0zL4Vhmhp92t4qC6MRpMDeFq+vtc0E3ZSkZ6BgxHafgirnNllcGQtbSv7ITxlQkNljaA74IgS1fvRD77gfMHkWUhKMnbEJgAk7XK1hIoFBoptvmi6kltR7lqLlmcywAN0P3Iu74iJ7nSNdSFxiEKHWHlL/2UgpJUM4/jHBknEX6KbHZww9TkoZ+SVVXjANLy8STatgdEMb9RvlNkxxkUFZS21rONFTCIdqoxtFjOosZsPgsNipibrr3Jf07NdPFTSf1fcOTGHOVdNAUKvcDhSUAg/lRiVal9rHKTTPqpCKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(22082099003)(11063799006)(18002099003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UN9ZhGWGw+wzFqcCDVCebfj1r3zxhI3ZdFNnH62NpMBjtzUvf2fHTwWdEu12?=
 =?us-ascii?Q?0w8RjbOpUKWoOcAsK42YTn9A8pue2OGL308P3WDTaFx73RbDTWOMG0okQ/9Q?=
 =?us-ascii?Q?wJY4QbCK8U53WBy4OFzMK6ugqJ029OKNQNz5ngIXTv6FDcDGrCAFPZAAQ+Fu?=
 =?us-ascii?Q?3I048lqSFWikMPKBWQznDXce+qbSvfjggQyYnX/EP6UtbvaFIzWm78GMxlFq?=
 =?us-ascii?Q?4QfQu2x0o/Bm/bd0aC75CDHSilGrY3h84SxwXm4RBfnbJt4PGVYjseiTADkX?=
 =?us-ascii?Q?dndFWIgWQ6zc8IhSeRMlZQrZBF92LbXOPYbDryCp1do14nz8M26D10LIKUqS?=
 =?us-ascii?Q?ppRwjhAnEaoWThroXevexX7MZNJOCSAm2BRq+52YiGl0Fsfdf7KR+b+mJNu5?=
 =?us-ascii?Q?JZo4KyPV0JVH/BuCrmxDX4NBkRZFK8Tg6yKxjhWGFnqBn8zrwB1zWQelfI81?=
 =?us-ascii?Q?l/9pGX2NoOEWN0T6V7sI05Tr/8Mr+mAV8UTPI4A+AQhdH18IVNjr6jAYvk4T?=
 =?us-ascii?Q?4MaomgouAMprdVHUujohrxQ3rgg4KjST5cp+5RVm6m6SzHX9dSGqHiECQx7t?=
 =?us-ascii?Q?DOkIBg9T5OELp4sPi6MkvHXJJS+8e/IkmlVYlP5Kxm1m2++6O93940Rbv1v3?=
 =?us-ascii?Q?7Jw40tRiwnFz/1IpbxRXBIDHWX7LmAgah4jTUusCF1ccKyIYu5KceqrEwfyl?=
 =?us-ascii?Q?90+XTK4J75srHtDcnq/zWrEenc1WXaZCCmWSgzPVz1iHiFpXNMZDrvTLwmgn?=
 =?us-ascii?Q?S1bsDVl+VeNQi3ghJADJyPmB9HQ8QNgGgQBUQg5Y1cfiquXVjYOOFrJlx7CK?=
 =?us-ascii?Q?cwkuFrDitX8ouCOtNdxOwXxf2fdjNZHLqrWuFfZP2BLmHuSJhjrWQsGNHBK/?=
 =?us-ascii?Q?vgPEJqx/ls+wC3v/IN6KE7qB7Q+NwSEu/EBwOF1ZHLF7dVkDOzSWcC2y9K/Q?=
 =?us-ascii?Q?KBBeQWr22Xm9FuF8dv0uTMbtl21V34/OHYiPhDFDeT6mtAQy4+OllfTZ3tIv?=
 =?us-ascii?Q?ftQpuylkLeNTgiF+Bw3wVozcHBovV24S1RL5HJJyYgCCWG3h7fm0C/ThUQ0k?=
 =?us-ascii?Q?1Qb4X0PGogaVFGQnndw/1u4Is0Yr8woBAQzYDWHjFLBhKjMS4Y2wgOdnpZ4E?=
 =?us-ascii?Q?deQpXo8Q2eXvjYs2tin1aqQUs/bRAvpRRKNr0PurH91vjTFCS/a7BQvg3yGv?=
 =?us-ascii?Q?XZcEAlJ8DGoHsv5nffSo9bI1Lbihwfa82BWFiLPYrmFZ4zWmi8Lzmg3JnkpZ?=
 =?us-ascii?Q?bGGwHCtvSHfKQFn8agjNEabwcYqZ9MH9zmp8Ytz3qRUFQ0fcJNT6XYmScRa2?=
 =?us-ascii?Q?ZauGXFEw4b5ogI586b0sdq8RBh8Ckd8MnpfxJu1iR8SU15BG172g0oOLu8xt?=
 =?us-ascii?Q?kMHR4vrO+dulcElcKf9fobUiVGQhK33Uc8zkZEpZxuLWZqLR1nSiswJYojx6?=
 =?us-ascii?Q?7hRBv8C3GkdQgRp252jjVTK1uZu2j5QHghsHGcQcWVCoiDwFSY2oVg3mzDZQ?=
 =?us-ascii?Q?Fhn5ri9fEyUJrJldFg3Y1KDJpXhR/O8YU/rDJit04UM1taqoHWRwiTQOPHbI?=
 =?us-ascii?Q?wNCUxVh97BNmNiYGMUKS+QEEijSaR2WvNj3WeXvita7aPy3+Tru/B4LGQjS9?=
 =?us-ascii?Q?XXq8xb6duQQUeXg/W7NaTcIlzRswnMizFjli3D4WTc9Jr+SCzTZU+pqiDbNx?=
 =?us-ascii?Q?pkhA6SkUod6jTg6XrJq5yxHw9Y6u291VWr7elu+InESgeXOXDhNF337fiiBt?=
 =?us-ascii?Q?bbyz0d80+w=3D=3D?=
X-Exchange-RoutingPolicyChecked: GlhjHxD8B9WE4f+5kRM4xM4q4ahplgSCMq+f919gkp1s6biZzOKE0SEtjH96VtjOJ6n98swpncPFcuip/R7IYrHZ8Oh7g9X/KWn2NybdzIOcXA1JOf5tNnIyDfIf3Ov7QaxMhzY6aBG0g1eNufHamY1gzXUZm3ZVOkZ494bWP8xkVlfWpxjgB8pAOxZILH6sDmF3c8AJBcPot2Pyzwcm1aeijtz460LzQZ+wH9KYtzeW3dNT4M9lGICeeC2eFcNYBXZECUACdfku+QZBCOA1h2r9RykxpKnvDvRgewidXDZBEARDZtowCiefCL3m3rNjZHlpTv0QUAWbQ/LRh0O2OQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d419905-1298-4874-756c-08dee77652d9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 22:20:51.7080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMWdEqsJOhLtTdxSlyJUZrKpsbfcUu19gJuNFdDnnI1xEp946fc/uLHHY6jLH3CazC6hKh0G65h1dTTPrOs8NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
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

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> Create results incementally during run, e.g. after each test end
> its execution create results.json up to last one executed.
>
> One caveat is that it will still not hold last one at which
> sudden reboot happens, for example after a kernel panic.
>
> In such cases there is still a need for calling igt_results to
> collect all data.
>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

An alternative option would be implementing this as a built-in hook that
the user could activate, e.g.:

igt_runner --hook 'post-test:builtin:gen-results'

--
Gustavo Sousa

>
> Kamil Konieczny (2):
>   runner: Create results after each tests end
>   runner: Create new option for incremental results
>
>  runner/executor.c  | 57 ++++++++++++++++++++++++++++++++++++++++++----
>  runner/resultgen.c |  6 ++++-
>  runner/settings.c  |  8 +++++++
>  runner/settings.h  |  1 +
>  4 files changed, 67 insertions(+), 5 deletions(-)
>
> -- 
> 2.54.0
