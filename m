Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8970C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 19:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F8B10E235;
	Wed,  3 Jul 2024 19:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLqICFNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EEA10E235
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 19:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720034839; x=1751570839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fJxgFtDyZ5IqhAN2pSI6dezd1PrzepLerPwVYqQju8k=;
 b=BLqICFNXkLW+pRuQoRGUKbeKOX4PpZfr7eec9EK2VNhryS1+Zd83tKP2
 6Hd+aH55cFqtk0dVDND5pJDt5WxNL+Yh/VdiqKTI2+tyecrDv653S+iwZ
 QW1UjJPblNaHfmN4ozvzzX659SSrkOPxg/TPAnbKe31Fq3JwzlbwskeJ+
 v2kv667byjgm8e2SERtoHsGnGAYfag3Gx4qcTBiqW58xX1l98fIczTOoF
 RnJulvZGjLDgnQW3D8rlm7hyOvU9xcUoUu2b/eoqmvzHafpnXFAKE63nG
 RiwOyGqSqQa0iLb4/aqehAD0X85tNnsiO35L4S8hYccOHWZmP+6yHve48 w==;
X-CSE-ConnectionGUID: obNIp2i9RgK/pAOuwLqu+A==
X-CSE-MsgGUID: g5fXP/HpQUKTY0Z7/YnVTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17498858"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17498858"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 12:27:18 -0700
X-CSE-ConnectionGUID: ufnXWGhoSwCeQHkZBIDXwg==
X-CSE-MsgGUID: EF55lVSESTOVojwEis8C4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="51307777"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 12:27:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 12:27:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 12:27:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 12:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9G5fLky5jtJwHbAfg3kTeqhQrz6lU8HlzTKRM0LiFuPc7xa3djVwGCvpsNCNWQtOQUdNe6LA32FVUNlABQF/f1LBqy+gEcN7R+rXiFpp9HIzO3RFyClbwNCyfDAI5nX8FgmNS6oW05nJOhj8crVHxV40cngc+jMdTVjoQ/Krl3DhM99fl1pSmN3C494PmjA6V9SYTp/AZ/9H5QZfBcrJHaxxBu5U5XWVsbaBxEgJ9jFNxvmnm4WxQnqq8ysuTCYx+4c+N7ZWaqLVa9Tr4Q/yhgLMCzoDNA7CzyECwOflzcdrD1CywNyNFpIrPQ+BUR0VTxX/ODa1scllJxLo1MHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvIQbB5FIaGm6i1FWJUEJPp+Wf+45taXsCSPeRvHQ1Q=;
 b=eyb7r0skzE8M9sDqfcFFfUKxeRcxznxuFTFQ40yHK9Mdsw+aNeYkItryXob0DN3yYxSh2WocbdwChBAp0N/3DRnlQKPUUgvSp5GC8/I8yw8szHh/bXtZa2iRmb621eJjtrcQua+WaYBV5Q4oAh2wvGeXihMUWKlQxyXiXibgKrPGW3x4lmZps7eiixaFajtadPJfaHDiL9/c5o7nxLZGqjyVDEFV0eYlBGfTQtxgrCQhrJBjEDnzV1XSD3z3aC0VRDV3P7rB2AAm4wu5lNfAkHrmvWinOa41jCTsrqDZCLCCIm7p+bJ4JWqsKqcaXTxzpEaWvrRxW/xEhKcBA5ozhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 19:27:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 19:27:13 +0000
Date: Wed, 3 Jul 2024 14:27:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v2 1/7] igt_hook: Add feature
Message-ID: <d2bmnw6jnz4encqian5z4xy5uk3f3kmigew7zjdpjsuq6ud5p3@nfsu3lszt4eo>
References: <20240621195150.390462-1-gustavo.sousa@intel.com>
 <20240621195150.390462-4-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240621195150.390462-4-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 358887e5-3031-482a-5ef9-08dc9b9623e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XRJMOH1f4S8GA198KlXvU45v5v4fDRsOoSFqakafKXZzncaZuoc+EjyBZQzq?=
 =?us-ascii?Q?7puMBMZIO5T/opH7HSRiqwzlEosJOW0SDk3o74wCVlYhEE1NZAm0v/Zs+zSu?=
 =?us-ascii?Q?yxgt7atCbajofypR0HBr6cQPYXUyHJwnfxmeR0jrDVGpyZxHv/EqqUm97o+u?=
 =?us-ascii?Q?Z1FEXoIYJSvG46MToTd4lsZsZH4lEC79CBEc/zOZ13kNX3xrGqh3IYAlBw/O?=
 =?us-ascii?Q?MLI0Z5LUru0/hKbPPP0WcDcIAyERg0AvW9dpVul456UhdKPJHd4sh6hJOyup?=
 =?us-ascii?Q?89ytnUPxqri48mqYJs1fIYyq65tdfL+Dhl/u3BN+0/alw0ipP6VeUPGU1WGA?=
 =?us-ascii?Q?e/k3zIUYNzJogkGYD3hZ6Mm4gSuTbbVtCSEpMWaJ5oeUlhdbuEnxR9IZiaKR?=
 =?us-ascii?Q?/zF/KKmz9RqMvIWzNZD+JvbzIwQDovy860zumeJlNyl6IRTrz9ELDNj7aqwu?=
 =?us-ascii?Q?9MgRkyUbCkgdLp49QafqenZcK6oKT1tGj5sa8LnWzlmdFZk1CwidTJr5p3re?=
 =?us-ascii?Q?iHDqo+iGTtkZv0jckRB8w32ikQ9x22ZySB0ACE3W5v5Kt1FQBnwaY+tjYd1C?=
 =?us-ascii?Q?/l5cPnT/WGraf/7BWO6LSynKIo3wzp68zOnia1DNklHqmk90bCwFwpNciZ4K?=
 =?us-ascii?Q?ycWRzLsCJbllJwhQobRYMRvUlZXLZfhOcw/nVjBxPIiViJxxFu6fc+2sPo6Q?=
 =?us-ascii?Q?b+asmlsQuzsCjnLkIsSCOcHPibR2mXx609FUUvX0TOCM9EfRzvvBWDHc4oCM?=
 =?us-ascii?Q?NmyCBVsxtPyw1vczuY+JVHqDxx2rSfq9d2ZwIW5WHmz0xpAvKq865/OOgIBf?=
 =?us-ascii?Q?KnrbOQj+AubvRPq8ubfPfyyftciSWeGfyTcaefP6T11ZnL01FUgFv50qE6y6?=
 =?us-ascii?Q?vl1P09pKB9rY9mU438aCBA7o58XN/tkZ45/wxFRo3sR4jyGGKkRWpX9mVhQo?=
 =?us-ascii?Q?+alDkZBcKtM3Fq7k8LDx1akdNPJOMDLePJsSZ6dz3xs4SJs3rR+vrdVyL8HC?=
 =?us-ascii?Q?fY5Qv8F0boFzURYHX6hlsYjfGYQleg2hc7XMZxkH0CbpIlpz9Nu6l4WFTPb3?=
 =?us-ascii?Q?FRkvq0RbTrEieK9XqhcXY+LHTxZOD129IpAp12Y/oDHiu8SDpPM0jR8T+AV+?=
 =?us-ascii?Q?DsxJb6QTlNDzbW+NytbV5kRHfmR2tLGEaZ27CAYsd6A2IWvSjwCnhhu3erEq?=
 =?us-ascii?Q?A21k8AJWSPV+xWU5drAdEImcZ7JwXkpXYvmNfDdzAr/ap0Wyi6p4G+FQFIgc?=
 =?us-ascii?Q?M45y1vrBIAR5RLSgqLngo7l1EsafNfBSXNUeXHOgZQeznTVvMMqd2vxapwfJ?=
 =?us-ascii?Q?uZifiCUXTrXILuVyAIJ1ATmZ/rGvxCSAgspY8Sp05QVP0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+3pzfAZiyC0rJTH13k0/CvNgZAIKCOaLWE+pRcoUi9RmY4dXJDL5aXeMdh5?=
 =?us-ascii?Q?nfbCZOTZWH60Md/NND+rJwWXZot6CrFbYj9VFTvCOMwld8oDOHRfTsOimWmT?=
 =?us-ascii?Q?2FO9qwzUhrlulhWZ/Nh7v8F26yEV4B/H99h7bn9kgAJuG3J1TbWGdxntfgUA?=
 =?us-ascii?Q?36YRRGi36R4q23c4iaLJDNIFvG3de82D8p+VYP2NoVYZr+NN/sG3+lYUwnu6?=
 =?us-ascii?Q?UIZg76Egh18+pd48CivtYGIyMX6Mccx6LNg3AKHqxoG5ldtgqMsUNwOyCJCn?=
 =?us-ascii?Q?d9/MDg3SCmNRXDVuZUL+alVgXT//m3HDoWhGsJrudy8velfnu1shOgf+tdss?=
 =?us-ascii?Q?n3077sYt3IInEjzM6IPQf7V7jAyRurk7dshh1sD42qpx8rQx94v7tPji5dXm?=
 =?us-ascii?Q?UYkNX8+RjfX9ODDum2bY/P9MQDs5L/tHPWQvdOG84rcfZA5hKXH32iYOlDS9?=
 =?us-ascii?Q?G10qIS4YxSCR2Jvgx8vcQVyIYPo5nLzRXGK3JVetStVOzVZUgoszrFOpnY3t?=
 =?us-ascii?Q?ESDl9VThuSgMAFBnw3nvSxVWE0LW6f1m2SMmuUmUhgx6RTrnJbQctQjljNJa?=
 =?us-ascii?Q?Fme56JK3Q+lN35LQpbBT7i71ZWgJoovp0Shb7m7gi83foF4i97N7mfFOOVWx?=
 =?us-ascii?Q?3EWCGXJUJKbdEeMtBr9TWRqLmeuvVkIn1NiEwL3bn0PxC8fnMjZMNtMACqG6?=
 =?us-ascii?Q?yw/vInUuwzKfUtyL0u8jHLd7QIs4YcGq71sGJDlpHI9sWmYtIaZ7FQPDj+5D?=
 =?us-ascii?Q?tbDgtyJDpEg/ITgt4UjwuF/Rbii+DsYtibclKTnB27hM5WeFbc1EtJ//IGG1?=
 =?us-ascii?Q?CZ230Kev0Ll2CfhD2I6U8SElYkrJUSCnFq1zKHUWhdLsni64KAgzIX9+L4WA?=
 =?us-ascii?Q?y7f28YRg7DXTkPhfQ+I2/+FyACQXHK0NoXHrEIMQfNDUlCIUVRxJU7lSuc1U?=
 =?us-ascii?Q?dmFkbBWgoW9rS5j8CwVNaqHD5JDR1ExnD+bRrVKDdH9kNkNvJAm5dX6IdNbD?=
 =?us-ascii?Q?iI1cTf0G26JgDdNE6Wt+Soe+AbKu00+da6aRDqAskcG8yUygjTRlF0jLenO0?=
 =?us-ascii?Q?8LGc9blaHCEFpKFk+fYHP/xY54dIQwEyYjK84orXsxIb0MT55GZ6+KSawuEz?=
 =?us-ascii?Q?O48hpD89s7mw5ULVSddVKBFOMwgq6FCSTZzpLTRxGWTqnyHWV2BIsWXAKAS/?=
 =?us-ascii?Q?U8CUk++h2hju4MFP5b3fJ2S3upTOxMaI4nw9gqlTBtTl0Qg/stp3gFYBwgJ9?=
 =?us-ascii?Q?PdMLxF2xKtkKL0IcVBI+mt1FnCzXf8kRDNQXZ5lRcM2OFOY2pBdjJsF2XmQo?=
 =?us-ascii?Q?DEnuBjPQNpkk3Wj33NI0675xlRTyfEqlVuA7NUogc9lLshLcSCz8LqP/FEf4?=
 =?us-ascii?Q?z3eEjDBmygaNwgtpMPk/nJfDo0Rg2AAc1gnwAeBc8X2OfMcWlClRTBIg69TA?=
 =?us-ascii?Q?WdO33Yn2E4Cl52tQcDLPiSu3zlO5PtNF6fvRgyMT9/Z1TZ1nSAcMYV9VKrBq?=
 =?us-ascii?Q?r3LvTnGPUGDvJdHbZS5M9yUZbPUW1K+2RxR2jmJYPuEnb0R5UucmjYBGOU2N?=
 =?us-ascii?Q?pJyZrFBs8bbl1Mt9tZsywwT72kR8OggiGdDii8wkEJjfqwmgTLNiMXtoA24R?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 358887e5-3031-482a-5ef9-08dc9b9623e6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 19:27:13.4045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3Tvs/qVcee0oAMQ58phTqofgOOrjYidP79/6h8Qg1CG8PogvCnQXmMxi1khrkX8P/MgPu0iLbBQWyDwiiOAQvziUHmzztlRUlyHNP4G2HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
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

On Fri, Jun 21, 2024 at 04:51:46PM GMT, Gustavo Sousa wrote:
>For development purposes, sometimes it is useful to have a way of
>running custom scripts at certain points of test executions. A
>real-world example I bumped into recently is to collect information from
>sysfs before and after running each entry of a testlist.
>
>While it is possible for the user to handcraft a script that calls each
>test with the correct actions before and after execution, we can provide
>a better experience by adding built-in support for running hooks during
>test execution.
>
>That would be even better when adding the same kind of support for
>igt_runner (which is done in an upcoming change), since the user can
>also nicely resume with igt_resume with the hook already setup in case a
>crash happens during execution of the test list.
>
>As such provide implement support for hooks, integrate it into
>igt_core and expose the functionality via --hook CLI option on test
>executables.
>
>v2:
>  - s/igt_hook_init/igt_hook_create/ (Lucas)
>  - Use SPDX License Identifier instead of license text. (Lucas)
>  - Do not rely on hard-coded length 3 when generating full test name.
>    (Lucas)
>  - Do not pollute current environment variables when running hooks.
>    (Lucas)
>  - Change hook string in run_tests_and_match_env() to use "printf"
>    instead of "echo" to be compatible with CI environment.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
> lib/igt_core.c                                | 116 ++++-
> lib/igt_hook.c                                | 489 ++++++++++++++++++
> lib/igt_hook.h                                |  69 +++
> lib/meson.build                               |   1 +
> lib/tests/igt_hook.c                          | 170 ++++++
> lib/tests/igt_hook_integration.c              | 281 ++++++++++
> lib/tests/meson.build                         |   2 +
> 8 files changed, 1120 insertions(+), 9 deletions(-)
> create mode 100644 lib/igt_hook.c
> create mode 100644 lib/igt_hook.h
> create mode 100644 lib/tests/igt_hook.c
> create mode 100644 lib/tests/igt_hook_integration.c
>
>diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>index 9085eb924e85..11458c68124b 100644
>--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>@@ -32,6 +32,7 @@
>     <xi:include href="xml/igt_fb.xml"/>
>     <xi:include href="xml/igt_frame.xml"/>
>     <xi:include href="xml/igt_gt.xml"/>
>+    <xi:include href="xml/igt_hook.xml"/>
>     <xi:include href="xml/igt_io.xml"/>
>     <xi:include href="xml/igt_kmod.xml"/>
>     <xi:include href="xml/igt_kms.xml"/>
>diff --git a/lib/igt_core.c b/lib/igt_core.c
>index 3ff3e0392316..6463a5bdcae5 100644
>--- a/lib/igt_core.c
>+++ b/lib/igt_core.c
>@@ -70,6 +70,7 @@
>
> #include "igt_core.h"
> #include "igt_aux.h"
>+#include "igt_hook.h"
> #include "igt_sysfs.h"
> #include "igt_sysrq.h"
> #include "igt_rc.h"
>@@ -241,6 +242,9 @@
>  * - '*,!basic*' match any subtest not starting basic
>  * - 'basic*,!basic-render*' match any subtest starting basic but not starting basic-render
>  *
>+ * It is possible to run a shell script at certain points of test execution with
>+ * "--hook". See the usage description with "--help-hook" for details.
>+ *
>  * # Configuration
>  *
>  * Some of IGT's behavior can be configured through a configuration file.
>@@ -273,6 +277,8 @@ static unsigned int exit_handler_count;
> const char *igt_interactive_debug;
> bool igt_skip_crc_compare;
>
>+static struct igt_hook *igt_hook = NULL;
>+
> /* subtests helpers */
> static bool show_testlist = false;
> static bool list_subtests = false;
>@@ -338,6 +344,8 @@ enum {
> 	OPT_INTERACTIVE_DEBUG,
> 	OPT_SKIP_CRC,
> 	OPT_TRACE_OOPS,
>+	OPT_HOOK,
>+	OPT_HELP_HOOK,
> 	OPT_DEVICE,
> 	OPT_VERSION,
> 	OPT_HELP = 'h'
>@@ -810,6 +818,8 @@ static void common_exit_handler(int sig)
> 		bind_fbcon(true);
> 	}
>
>+	igt_hook_free(igt_hook);
>+
> 	/* When not killed by a signal check that igt_exit() has been properly
> 	 * called. */
> 	assert(sig != 0 || igt_exit_called || igt_is_aborting);
>@@ -907,6 +917,8 @@ static void print_usage(const char *help_str, bool output_on_stderr)
> 		   "  --interactive-debug[=domain]\n"
> 		   "  --skip-crc-compare\n"
> 		   "  --trace-on-oops\n"
>+		   "  --hook [<events>:]<cmd>\n"
>+		   "  --help-hook\n"
> 		   "  --help-description\n"
> 		   "  --describe\n"
> 		   "  --device filters\n"
>@@ -1090,6 +1102,8 @@ static int common_init(int *argc, char **argv,
> 		{"interactive-debug", optional_argument, NULL, OPT_INTERACTIVE_DEBUG},
> 		{"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_CRC},
> 		{"trace-on-oops",     no_argument,       NULL, OPT_TRACE_OOPS},
>+		{"hook",              required_argument, NULL, OPT_HOOK},
>+		{"help-hook",         no_argument,       NULL, OPT_HELP_HOOK},

I'm not a fan of having --help-*  for the additional options.
I think this is being added because of --help-description? However
--help-description should really be just --description (or removed at
all since the tests aren't documented like that anymore, which IMO is
sad).

I think we need short explanation for each option, and then probably
refer to a man page where longer explanations can be given. I'm not
blocking it on that though.

> 		{"device",            required_argument, NULL, OPT_DEVICE},
> 		{"version",           no_argument,       NULL, OPT_VERSION},
> 		{"help",              no_argument,       NULL, OPT_HELP},
>@@ -1225,6 +1239,24 @@ static int common_init(int *argc, char **argv,
> 		case OPT_TRACE_OOPS:
> 			show_ftrace = true;
> 			break;
>+		case OPT_HOOK:
>+			assert(optarg);
>+			if (igt_hook) {
>+				igt_warn("Overriding previous hook descriptor\n");
>+				igt_hook_free(igt_hook);
>+			}
>+			igt_hook = igt_hook_create(optarg, &ret);

usually functions like this are done the other way around: the return is
int and the pointer is passed by ref.

ret = igt_hook_create(optarg, &igt_hook);

>+			if (!igt_hook) {
>+				igt_critical("Failed to initialize hook data: %s\n",
>+					     igt_hook_error_str(ret));
>+				ret = ret > 0 ? -2 : -3;
>+				goto out;
>+			}
>+			break;
>+		case OPT_HELP_HOOK:
>+			igt_hook_print_help(stdout, "--hook");
>+			ret = -1;
>+			goto out;
> 		case OPT_DEVICE:
> 			assert(optarg);
> 			/* if set by env IGT_DEVICE we need to free it */
>@@ -1274,9 +1306,24 @@ out:
> 			exit(IGT_EXIT_INVALID);
> 	}
>
>-	if (ret < 0)
>-		/* exit with no error for -h/--help */
>-		exit(ret == -1 ? 0 : IGT_EXIT_INVALID);
>+	if (ret < 0) {
>+		free(igt_hook);
>+		igt_hook = NULL;
>+
>+		switch (ret) {
>+		case -1: /* exit with no error for -h/--help */
>+			exit(0);
>+			break;
>+		case -2:
>+			exit(IGT_EXIT_INVALID);
>+			break;
>+		case -3:
>+			exit(IGT_EXIT_ABORT);

I think ABORT shouldn't be used... this is for when tests can't be
executed anymore due to one of the monitored abort conditions. Not if we
can't create the igt_hook, which is more likely because of an invalid
option.

>+			break;
>+		default:
>+			assert(0);
>+		}
>+	}
>
> 	if (!igt_only_list_subtests()) {
> 		bind_fbcon(false);
>@@ -1284,6 +1331,15 @@ out:
> 		print_version();
> 		igt_srandom();
>
>+		if (igt_hook) {
>+			struct igt_hook_evt hook_evt = {
>+				.evt_type = IGT_HOOK_PRE_TEST,
>+				.target_name = command_str,
>+			};
>+
>+			igt_hook_push_evt(igt_hook, &hook_evt);
>+		}
>+
> 		sync();
> 		oom_adjust_for_doom();
> 		ftrace_dump_on_oops(show_ftrace);
>@@ -1487,6 +1543,16 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
> 	igt_thread_clear_fail_state();
>
> 	igt_gettime(&subtest_time);
>+
>+	if (igt_hook) {
>+		struct igt_hook_evt hook_evt = {
>+			.evt_type = IGT_HOOK_PRE_SUBTEST,
>+			.target_name = subtest_name,
>+		};
>+
>+		igt_hook_push_evt(igt_hook, &hook_evt);
>+	}
>+
> 	return (in_subtest = subtest_name);
> }
>
>@@ -1517,6 +1583,16 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name)
> 	_igt_dynamic_tests_executed++;
>
> 	igt_gettime(&dynamic_subtest_time);
>+
>+	if (igt_hook) {
>+		struct igt_hook_evt hook_evt = {
>+			.evt_type = IGT_HOOK_PRE_DYN_SUBTEST,
>+			.target_name = dynamic_subtest_name,
>+		};
>+
>+		igt_hook_push_evt(igt_hook, &hook_evt);

I'm wondering if we shouldn't make igt_hook_push_evt() accept NULL as
argument so we can use a compound literal like below:

	igt_hook_push_evt(igt_hook, (struct igt_hook_evt[]){
		.evt_type = IGT_HOOK_PRE_DYN_SUBTEST,
		.target_name = dynamic_subtest_name });

>+	}
>+
> 	return (in_dynamic_subtest = dynamic_subtest_name);
> }
>
>@@ -1602,6 +1678,17 @@ __noreturn static void exit_subtest(const char *result)
> 	struct timespec *thentime = in_dynamic_subtest ? &dynamic_subtest_time : &subtest_time;
> 	jmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
>
>+	if (igt_hook) {
>+		struct igt_hook_evt hook_evt = {
>+			.evt_type = (in_dynamic_subtest
>+					? IGT_HOOK_POST_DYN_SUBTEST
>+					: IGT_HOOK_POST_SUBTEST),
>+			.result = result,
>+		};
>+
>+		igt_hook_push_evt(igt_hook, &hook_evt);
>+	}
>+
> 	if (!igt_thread_is_main()) {
> 		igt_thread_fail();
> 		pthread_exit(NULL);
>@@ -2274,6 +2361,7 @@ void __igt_abort(const char *domain, const char *file, const int line,
> void igt_exit(void)
> {
> 	int tmp;
>+	const char *result;
>
> 	if (!test_with_subtests)
> 		igt_thread_assert_no_failures();
>@@ -2318,12 +2406,7 @@ void igt_exit(void)
>
> 	assert(waitpid(-1, &tmp, WNOHANG) == -1 && errno == ECHILD);
>
>-	if (!test_with_subtests) {
>-		struct timespec now;
>-		const char *result;
>-
>-		igt_gettime(&now);
>-
>+	if (!test_with_subtests || igt_hook) {
> 		switch (igt_exitcode) {
> 			case IGT_EXIT_SUCCESS:
> 				result = "SUCCESS";
>@@ -2334,6 +2417,12 @@ void igt_exit(void)
> 			default:
> 				result = "FAIL";
> 		}
>+	}
>+
>+	if (!test_with_subtests) {
>+		struct timespec now;
>+
>+		igt_gettime(&now);
>
> 		if (test_multi_fork_child) /* parent will do the yelling */
> 			_log_line_fprintf(stdout, "dyn_child pid:%d (%.3fs) ends with err=%d\n",
>@@ -2344,6 +2433,15 @@ void igt_exit(void)
> 					  result, igt_time_elapsed(&subtest_time, &now));
> 	}
>
>+	if (igt_hook) {
>+		struct igt_hook_evt hook_evt = {
>+			.evt_type = IGT_HOOK_POST_TEST,
>+			.result = result,
>+		};
>+
>+		igt_hook_push_evt(igt_hook, &hook_evt);
>+	}
>+
> 	exit(igt_exitcode);
> }
>
>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>new file mode 100644
>index 000000000000..a4421e2b1543
>--- /dev/null
>+++ b/lib/igt_hook.c
>@@ -0,0 +1,489 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>+ */
>+
>+#include <assert.h>
>+#include <errno.h>
>+#include <limits.h>
>+#include <stdbool.h>
>+#include <stddef.h>
>+#include <stdint.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+
>+#include "igt_core.h"
>+#include "igt_hook.h"
>+
>+/**
>+ * SECTION:igt_hook
>+ * @short_description: Support for running a hook script on test execution
>+ * @title: Hook support
>+ *
>+ * IGT provides support for running a hook script when executing tests. This
>+ * support is provided to users via CLI option `--hook` available in test
>+ * binaries. Users should use `--help-hook` for detailed usaged description of
>+ * the feature.
>+ *
>+ * The sole user of the exposed API is `igt_core`, which calls @igt_hook_create()
>+ * when initializing a test case, then calls @igt_hook_push_evt() for each event
>+ * that occurs during that test's execution and finally calls @igt_hook_free()
>+ * to clean up at the end.
>+ */
>+
>+#define TEST_NAME_INITIAL_SIZE 16
>+
>+typedef uint16_t evt_mask_t;
>+
>+struct igt_hook {
>+	evt_mask_t evt_mask;
>+	char *cmd;
>+	char *test_name;
>+	size_t test_name_size;
>+	char *subtest_name;
>+	size_t subtest_name_size;
>+	char *dyn_subtest_name;
>+	size_t dyn_subtest_name_size;
>+	char *test_fullname;
>+};
>+
>+enum igt_hook_error {
>+	IGT_HOOK_EVT_EMPTY_NAME = 1,
>+	IGT_HOOK_EVT_NO_MATCH,
>+};
>+
>+static_assert(IGT_HOOK_NUM_EVENTS <= sizeof(evt_mask_t) * CHAR_BIT,
>+	      "Number of event types does not fit event type mask");
>+
>+static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt_type)
>+{
>+	switch (evt_type) {
>+	case IGT_HOOK_PRE_TEST:
>+		return "pre-test";
>+	case IGT_HOOK_PRE_SUBTEST:
>+		return "pre-subtest";
>+	case IGT_HOOK_PRE_DYN_SUBTEST:
>+		return "pre-dyn-subtest";
>+	case IGT_HOOK_POST_DYN_SUBTEST:
>+		return "post-dyn-subtest";
>+	case IGT_HOOK_POST_SUBTEST:
>+		return "post-subtest";
>+	case IGT_HOOK_POST_TEST:
>+		return "post-test";
>+	case IGT_HOOK_NUM_EVENTS:
>+		break;
>+	/* No "default:" case, to force a warning from -Wswitch in case we miss
>+	 * any new event type. */
>+	}
>+	return "?";
>+}
>+
>+static int igt_hook_parse_hook_str(const char *hook_str, evt_mask_t *evt_mask, const char **cmd)
>+{
>+	const char *s;
>+
>+	if (!strchr(hook_str, ':')) {
>+		*evt_mask = ~0;
>+		*cmd = hook_str;
>+		return 0;
>+	}
>+
>+	s = hook_str;
>+	*evt_mask = 0;
>+
>+	while (1) {
>+		const char *evt_name;
>+		bool has_match;
>+		bool is_star;
>+		enum igt_hook_evt_type evt_type;
>+
>+		evt_name = s;
>+
>+		while (*s != ':' && *s != ',')
>+			s++;
>+
>+		if (evt_name == s)
>+			return IGT_HOOK_EVT_EMPTY_NAME;
>+
>+		has_match = false;
>+		is_star = *evt_name == '*' && evt_name + 1 == s;
>+
>+		for (evt_type = IGT_HOOK_PRE_TEST; evt_type < IGT_HOOK_NUM_EVENTS; evt_type++) {
>+			if (!is_star) {
>+				const char *this_event_name = igt_hook_evt_type_to_name(evt_type);
>+				size_t len = s - evt_name;
>+
>+				if (len != strlen(this_event_name))
>+					continue;
>+
>+				if (strncmp(evt_name, this_event_name, len))
>+					continue;
>+			}
>+
>+			*evt_mask |= 1 << evt_type;
>+			has_match = true;
>+
>+			if (!is_star)
>+				break;
>+		}
>+
>+		if (!has_match)
>+			return IGT_HOOK_EVT_NO_MATCH;
>+
>+		if (*s++ == ':')
>+			break;
>+	}
>+
>+	*cmd = s;
>+
>+	return 0;
>+}
>+
>+static size_t igt_hook_calc_test_fullname_size(struct igt_hook *igt_hook) {

{ <--- here

>+	/* The maximum size of test_fullname will be the maximum length of
>+	 * "igt@<test_name>@<subtest_name>@<dyn_subtest_name>" plus 1 for the
>+	 * null byte. */
>+	return (igt_hook->test_name_size +

no need for parenthesis

>+		igt_hook->subtest_name_size +
>+		igt_hook->dyn_subtest_name_size) + 4;
>+}
>+
>+static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
>+{
>+	int i;
>+	char *s;
>+	const char *values[] = {
>+		igt_hook->test_name,
>+		igt_hook->subtest_name,
>+		igt_hook->dyn_subtest_name,
>+		NULL,
>+	};
>+
>+	if (igt_hook->test_name[0] == '\0') {
>+		igt_hook->test_fullname[0] = '\0';
>+		return;
>+	}
>+
>+	s = stpcpy(igt_hook->test_fullname, "igt");
>+	for (i = 0; values[i] && values[i][0] != '\0'; i++) {
>+		*s++ = '@';
>+		s = stpcpy(s, values[i]);
>+	}
>+}
>+
>+/**
>+ * igt_hook_create:
>+ * @hook_str: Hook descriptor string.
>+ * @error: Pointer to error number.
>+ *
>+ * Allocate and initialize an #igt_hook structure.
>+ *
>+ * This function parses the hook descriptor @hook_str and initializes the struct
>+ * to be returned.
>+ *
>+ * The hook descriptor comes from the argument to `--hook` of the test
>+ * executable being run.
>+ *
>+ * If not #NULL, @error is used to store a non-zero error number if an error
>+ * happens. A human-readable string for that error number can be obtained with
>+ * @igt_hook_error_str().
>+ *
>+ * Returns: The pointer to the #igt_hook structure on success or #NULL on error.
>+ */
>+struct igt_hook *igt_hook_create(const char *hook_str, int *error)
>+{
>+	int err;
>+	evt_mask_t evt_mask;
>+	const char *cmd;
>+	struct igt_hook *igt_hook = NULL;
>+
>+
>+	err = igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
>+	if (err)
>+		goto out;
>+
>+	igt_hook = calloc(1, sizeof(*igt_hook));
>+	igt_hook->evt_mask = evt_mask;
>+
>+	igt_hook->cmd = strdup(cmd);
>+	if (!igt_hook->cmd) {
>+		err = -errno;
>+		goto out;
>+	}
>+
>+	igt_hook->test_name = malloc(TEST_NAME_INITIAL_SIZE);
>+	igt_hook->test_name_size = TEST_NAME_INITIAL_SIZE;
>+	igt_hook->subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
>+	igt_hook->subtest_name_size = TEST_NAME_INITIAL_SIZE;
>+	igt_hook->dyn_subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
>+	igt_hook->dyn_subtest_name_size = TEST_NAME_INITIAL_SIZE;

if we store test_name, subtest_name and dyn_subtest_name individually,
why do we need to store test_fullname?

>+	igt_hook->test_fullname = malloc(igt_hook_calc_test_fullname_size(igt_hook));
>+
>+	igt_hook->test_name[0] = '\0';
>+	igt_hook->subtest_name[0] = '\0';
>+	igt_hook->dyn_subtest_name[0] = '\0';
>+	igt_hook->test_fullname[0] = '\0';
>+
>+out:
>+	if (err) {
>+		if (error)
>+			*error = err;
>+
>+		igt_hook_free(igt_hook);
>+
>+		return NULL;
>+	}
>+
>+	return igt_hook;
>+}
>+
>+/**
>+ * igt_hook_free:
>+ * @igt_hook: The igt_hook struct.
>+ *
>+ * De-initialize an igt_hook struct returned by @igt_hook_create().
>+ *
>+ * This is a no-op if @igt_hook is #NULL.
>+ */
>+void igt_hook_free(struct igt_hook *igt_hook)
>+{
>+	if (!igt_hook)
>+		return;
>+
>+	free(igt_hook->cmd);
>+	free(igt_hook->test_name);
>+	free(igt_hook->subtest_name);
>+	free(igt_hook->dyn_subtest_name);
>+	free(igt_hook);
>+}
>+
>+static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	char **name_ptr;
>+	size_t *size_ptr;
>+	size_t len;
>+
>+	switch (evt->evt_type) {
>+	case IGT_HOOK_PRE_TEST:
>+		name_ptr = &igt_hook->test_name;
>+		size_ptr = &igt_hook->test_name_size;
>+		break;
>+	case IGT_HOOK_PRE_SUBTEST:
>+		name_ptr = &igt_hook->subtest_name;
>+		size_ptr = &igt_hook->subtest_name_size;
>+		break;
>+	case IGT_HOOK_PRE_DYN_SUBTEST:
>+		name_ptr = &igt_hook->dyn_subtest_name;
>+		size_ptr = &igt_hook->dyn_subtest_name_size;
>+		break;
>+	default:
>+		return;
>+	}
>+
>+	len = strlen(evt->target_name);
>+	if (len + 1 > *size_ptr) {
>+		size_t fullname_size;
>+
>+		*size_ptr *= 2;
>+		*name_ptr = realloc(*name_ptr, *size_ptr);
>+
>+		fullname_size = igt_hook_calc_test_fullname_size(igt_hook);
>+		igt_hook->test_fullname = realloc(igt_hook->test_fullname, fullname_size);
>+	}
>+
>+	strcpy(*name_ptr, evt->target_name);
>+	igt_hook_update_test_fullname(igt_hook);
>+}
>+
>+static void igt_hook_update_test_name_post_call(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	switch (evt->evt_type) {
>+	case IGT_HOOK_POST_TEST:
>+		igt_hook->test_name[0] = '\0';
>+		break;
>+	case IGT_HOOK_POST_SUBTEST:
>+		igt_hook->subtest_name[0] = '\0';
>+		break;
>+	case IGT_HOOK_POST_DYN_SUBTEST:
>+		igt_hook->dyn_subtest_name[0] = '\0';
>+		break;
>+	default:
>+		return;
>+	}
>+
>+	igt_hook_update_test_fullname(igt_hook);
>+}
>+
>+static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	setenv("IGT_HOOK_EVENT", igt_hook_evt_type_to_name(evt->evt_type), 1);
>+	setenv("IGT_HOOK_TEST_FULLNAME", igt_hook->test_fullname, 1);
>+	setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>+	setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>+	setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
>+	setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
>+}
>+
>+/**
>+ * igt_hook_push_evt:
>+ * @igt_hook: The igt_hook structure.
>+ * @evt: The event to be pushed.
>+ *
>+ * Push a new igt_hook event.
>+ *
>+ * This function must be used to register a new igt_hook event. Calling it will

"register" IMO is an odd term. This is notifying/calling the previously
registered hook, not registering an event.

igt_hook_event_notify() or igt_hook_event_exec() would be more
appropriate I think.


>+ * cause execution of the hook script if the event type matches the filters
>+ * provided during initialization of @igt_hook.
>+ */
>+void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	evt_mask_t evt_bit = (1 << evt->evt_type);
>+
>+	igt_hook_update_test_name_pre_call(igt_hook, evt);
>+
>+	if ((evt_bit & igt_hook->evt_mask)) {
>+		struct igt_helper_process proc = {};
>+
>+		igt_fork_helper(&proc) {
>+			igt_hook_update_env_vars(igt_hook, evt);
>+			system(igt_hook->cmd);

humn... we don't care about the return?
also... Why do we double fork?

it rather looks like we want an igt_exec() to complement
igt_fork_helper() or at least a small wrapper around
execle() do exec /bin/sh passing the command and env to use

>+		}
>+		igt_wait_helper(&proc);
>+	}
>+
>+	igt_hook_update_test_name_post_call(igt_hook, evt);
>+}
>+
>+/**
>+ * igt_hook_error_str:
>+ * @error: Non-zero error number.
>+ *
>+ * Return a human-readable string containing a description of an error number
>+ * generated by one of the `igt_hook_*` functions.
>+ *
>+ * The string will be the result of strerror() for errors from the C standard
>+ * library or a custom description specific to igt_hook.
>+ */
>+const char *igt_hook_error_str(int error)
>+{
>+	if (!error)
>+		return "No error";
>+
>+	if (error > 0) {
>+		enum igt_hook_error hook_error = error;
>+
>+		switch (hook_error) {
>+		case IGT_HOOK_EVT_EMPTY_NAME:
>+			return "Empty name in event descriptor";
>+		case IGT_HOOK_EVT_NO_MATCH:
>+			return "Event name in event descriptor does not match any event type";
>+		default:
>+			return "Unknown error";
>+		}
>+	} else {

no need for else


Lucas De Marchi

>+		return strerror(-error);
>+	}
>+}
>+
>+/**
>+ * igt_hook_print_help:
>+ * @f: File pointer where to write the output.
>+ * @option_name: Name of the CLI option that accepts the hook descriptor.
>+ *
>+ * Print a detailed user help text on hook usage.
>+ */
>+void igt_hook_print_help(FILE *f, const char *option_name)
>+{
>+	fprintf(f, "\
>+The option %1$s receives as argument a \"hook descriptor\" and allows the\n\
>+execution of a shell command at different points during execution of tests. Each\n\
>+such a point is called a \"hook event\".\n\
>+\n\
>+Examples:\n\
>+\n\
>+  # Prints hook-specic env vars for every event.\n\
>+  %1$s 'printenv | grep ^IGT_HOOK_'\n\
>+\n\
>+  # Equivalent to the above. Useful if command contains ':'.\n\
>+  %1$s '*:printenv | grep ^IGT_HOOK_'\n\
>+\n\
>+  # Adds a line to out.txt containing the result of each test case.\n\
>+  %1$s 'post-test:echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_RESULT >> out.txt'\n\
>+\n\
>+The accepted format for a hook descriptor is `[<events>:]<cmd>`, where:\n\
>+\n\
>+  - <events> is a comma-separated list of event descriptors, which defines the\n\
>+    set of events be tracked. If omitted, all events are tracked.\n\
>+\n\
>+  - <cmd> is a shell command to be executed on the occurrence each tracked\n\
>+    event. If the command contains ':', then passing <events> is required,\n\
>+    otherwise part of the command would be treated as an event descriptor.\n\
>+\n\
>+", option_name);
>+
>+	fprintf(f, "\
>+An \"event descriptor\" is either the name of an event or the string '*'. The\n\
>+latter matches all event names. The list of possible event names is provided\n\
>+below:\n\
>+\n\
>+");
>+
>+	for (enum igt_hook_evt_type et = 0; et < IGT_HOOK_NUM_EVENTS; et++) {
>+		const char *desc;
>+
>+		switch (et) {
>+		case IGT_HOOK_PRE_TEST:
>+			desc = "Occurs before a test case starts.";
>+			break;
>+		case IGT_HOOK_PRE_SUBTEST:
>+			desc = "Occurs before the execution of a subtest.";
>+			break;
>+		case IGT_HOOK_PRE_DYN_SUBTEST:
>+			desc = "Occurs before the execution of a dynamic subtest.";
>+			break;
>+		case IGT_HOOK_POST_DYN_SUBTEST:
>+			desc = "Occurs after the execution of a dynamic subtest.";
>+			break;
>+		case IGT_HOOK_POST_SUBTEST:
>+			desc = "Occurs after the execution of a subtest.";
>+			break;
>+		case IGT_HOOK_POST_TEST:
>+			desc = "Occurs after a test case has finished.";
>+			break;
>+		default:
>+			desc = "MISSING DESCRIPTION";
>+		}
>+
>+		fprintf(f, "  %s\n  %s\n\n", igt_hook_evt_type_to_name(et), desc);
>+	}
>+
>+	fprintf(f, "\
>+For each event matched by <events>, <cmd> is executed as a shell command. The\n\
>+exit status of the command is ignored. The following environment variables are\n\
>+available to the command:\n\
>+\n\
>+  IGT_HOOK_EVENT\n\
>+  Name of the current event.\n\
>+\n\
>+  IGT_HOOK_TEST_FULLNAME\n\
>+  Full name of the test in the format `igt@<test>[@<subtest>[@<dyn_subtest>]]`.\n\
>+\n\
>+  IGT_HOOK_TEST\n\
>+  Name of the current test.\n\
>+\n\
>+  IGT_HOOK_SUBTEST\n\
>+  Name of the current subtest. Will be the empty string if not running a\n\
>+  subtest.\n\
>+\n\
>+  IGT_HOOK_DYN_SUBTEST\n\
>+  Name of the current dynamic subtest. Will be the empty string if not running a\n\
>+  dynamic subtest.\n\
>+\n\
>+  IGT_HOOK_RESULT\n\
>+  String representing the result of the test/subtest/dynamic subtest. Possible\n\
>+  values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\"\n\
>+  events and will be the empty string for other types of events.\n\
>+\n\
>+");
>+}
>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>new file mode 100644
>index 000000000000..a7b67837e5a4
>--- /dev/null
>+++ b/lib/igt_hook.h
>@@ -0,0 +1,69 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>+ */
>+
>+#ifndef IGT_HOOK_H
>+#define IGT_HOOK_H
>+
>+#include <stdio.h>
>+
>+/**
>+ * igt_hook:
>+ *
>+ * Opaque struct to hold data related to hook support.
>+ */
>+struct igt_hook;
>+
>+/**
>+ * igt_hook_evt_type:
>+ * @IGT_HOOK_PRE_TEST: Occurs before a test case (executable) starts the
>+ * test code.
>+ * @IGT_HOOK_PRE_SUBTEST: Occurs before the execution of a subtest.
>+ * @IGT_HOOK_PRE_DYN_SUBTEST: Occurs before the execution of a dynamic subtest.
>+ * @IGT_HOOK_POST_DYN_SUBTEST: Occurs after the execution of a dynamic subtest.
>+ * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
>+ * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finished with
>+ * the test code.
>+ * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents the number
>+ * of possible events tracked by igt_hook.
>+ *
>+ * Events tracked by igt_hook. Those events occur at specific points during the
>+ * execution of a test.
>+ */
>+enum igt_hook_evt_type {
>+	IGT_HOOK_PRE_TEST,
>+	IGT_HOOK_PRE_SUBTEST,
>+	IGT_HOOK_PRE_DYN_SUBTEST,
>+	IGT_HOOK_POST_DYN_SUBTEST,
>+	IGT_HOOK_POST_SUBTEST,
>+	IGT_HOOK_POST_TEST,
>+	IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
>+};
>+
>+/**
>+ * igt_hook_evt:
>+ * @evt_type: Type of event.
>+ * @target_name: A string pointing to the name of the test, subtest or dynamic
>+ * subtest, depending on @evt_type.
>+ * @result: A string containing the result of the test, subtest or dynamic
>+ * subtest. This is only applicable for the `IGT_HOOK_POST_\*' event types;
>+ * other types must initialize this to #NULL.
>+ *
>+ * An event tracked by igt_hook, which is done with @igt_hook_push_evt(). This must
>+ * be zero initialized and fields relevant to the event type must be set before
>+ * passing its reference to @igt_hook_push_evt().
>+ */
>+struct igt_hook_evt {
>+	enum igt_hook_evt_type evt_type;
>+	const char *target_name;
>+	const char *result;
>+};
>+
>+struct igt_hook *igt_hook_create(const char *hook_str, int *error);
>+void igt_hook_free(struct igt_hook *igt_hook);
>+void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt);
>+const char *igt_hook_error_str(int error);
>+void igt_hook_print_help(FILE *f, const char *option_name);
>+
>+#endif /* IGT_HOOK_H */
>diff --git a/lib/meson.build b/lib/meson.build
>index e2f740c116f8..10b8066647f2 100644
>--- a/lib/meson.build
>+++ b/lib/meson.build
>@@ -109,6 +109,7 @@ lib_sources = [
> 	'veboxcopy_gen12.c',
> 	'igt_msm.c',
> 	'igt_dsc.c',
>+	'igt_hook.c',
> 	'xe/xe_gt.c',
> 	'xe/xe_ioctl.c',
> 	'xe/xe_mmio.c',
>diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
>new file mode 100644
>index 000000000000..c8a93952abed
>--- /dev/null
>+++ b/lib/tests/igt_hook.c
>@@ -0,0 +1,170 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>+ */
>+
>+#include <stdbool.h>
>+#include <stdio.h>
>+#include <unistd.h>
>+
>+#include "igt_core.h"
>+#include "igt_hook.h"
>+
>+static const char *env_var_names[] = {
>+	"IGT_HOOK_EVENT",
>+	"IGT_HOOK_TEST_FULLNAME",
>+	"IGT_HOOK_TEST",
>+	"IGT_HOOK_SUBTEST",
>+	"IGT_HOOK_DYN_SUBTEST",
>+	"IGT_HOOK_RESULT",
>+};
>+
>+#define num_env_vars (sizeof(env_var_names) / sizeof(env_var_names[0]))
>+
>+static int env_var_name_lookup(char *line)
>+{
>+	int i;
>+	char *c;
>+
>+	c = strchr(line, '=');
>+	if (c)
>+		*c = '\0';
>+
>+	for (i = 0; i < num_env_vars; i++)
>+		if (!strcmp(line, env_var_names[i]))
>+			goto out;
>+
>+	i = -1;
>+out:
>+	if (c)
>+		*c = '=';
>+
>+	return i;
>+}
>+
>+static void test_null_error_pointer(void)
>+{
>+	struct igt_hook *igt_hook;
>+
>+	/* Ensure passing NULL error pointer does not cause issues. */
>+	igt_hook = igt_hook_create("invalid:echo hello", NULL);
>+	igt_assert(igt_hook == NULL);
>+}
>+
>+static void test_invalid_hook_descriptors(void)
>+{
>+	struct {
>+		const char *name;
>+		const char *hook_desc;
>+	} invalid_cases[] = {
>+		{"invalid-event-name", "invalid-event:echo hello"},
>+		{"invalid-empty-event-name", ":echo hello"},
>+		{"invalid-colon-in-cmd", "echo hello:world"},
>+		{},
>+	};
>+
>+	for (int i = 0; invalid_cases[i].name; i++) {
>+		igt_subtest(invalid_cases[i].name) {
>+			int err = 0;
>+			struct igt_hook *igt_hook;
>+
>+			igt_hook = igt_hook_create(invalid_cases[i].hook_desc, &err);
>+			igt_assert(igt_hook == NULL);
>+			igt_assert(err != 0);
>+		}
>+	}
>+}
>+
>+static void test_print_help(void)
>+{
>+	char *buf;
>+	size_t len;
>+	FILE *f;
>+	const char expected_initial_text[] = "The option --hook receives as argument a \"hook descriptor\"";
>+
>+	f = open_memstream(&buf, &len);
>+	igt_assert(f);
>+
>+	igt_hook_print_help(f, "--hook");
>+	fclose(f);
>+
>+	igt_assert(!strncmp(buf, expected_initial_text, sizeof(expected_initial_text) - 1));
>+
>+	/* This is an extra check to catch a case where an event type is added
>+	 * without a proper description. */
>+	igt_assert(!strstr(buf, "MISSING DESCRIPTION"));
>+
>+	free(buf);
>+}
>+
>+static void test_all_env_vars(void)
>+{
>+	struct igt_hook_evt evt = {
>+		.evt_type = IGT_HOOK_PRE_SUBTEST,
>+		.target_name = "foo",
>+	};
>+	bool env_vars_checklist[num_env_vars] = {};
>+	struct igt_hook *igt_hook;
>+	char *hook_str;
>+	FILE *f;
>+	int pipefd[2];
>+	int ret;
>+	int i;
>+	char *line;
>+	size_t line_size;
>+
>+	ret = pipe(pipefd);
>+	igt_assert(ret == 0);
>+
>+	/* Use grep to filter only env var set by us. This should ensure that
>+	 * writing to the pipe will not block due to capacity, since we only
>+	 * read from the pipe after the shell command is done. */
>+	ret = asprintf(&hook_str, "printenv -0 | grep -z ^IGT_HOOK >&%d", pipefd[1]);
>+	igt_assert(ret > 0);
>+
>+	igt_hook = igt_hook_create(hook_str, NULL);
>+	igt_assert(igt_hook);
>+
>+	igt_hook_push_evt(igt_hook, &evt);
>+
>+	close(pipefd[1]);
>+	f = fdopen(pipefd[0], "r");
>+	igt_assert(f);
>+
>+	line = NULL;
>+	line_size = 0;
>+
>+	while (getdelim(&line, &line_size, '\0', f) != -1) {
>+		ret = env_var_name_lookup(line);
>+		igt_assert_f(ret >= 0, "Unexpected env var %s\n", line);
>+		env_vars_checklist[ret] = true;
>+	}
>+
>+	for (i = 0; i < num_env_vars; i++)
>+		igt_assert_f(env_vars_checklist[i], "Missing env var %s\n", env_var_names[i]);
>+
>+	fclose(f);
>+	igt_hook_free(igt_hook);
>+	free(hook_str);
>+	free(line);
>+}
>+
>+igt_main
>+{
>+	igt_subtest("null-error-pointer")
>+		test_null_error_pointer();
>+
>+	test_invalid_hook_descriptors();
>+
>+	igt_subtest("help-description")
>+		test_print_help();
>+
>+	igt_subtest_group {
>+		igt_fixture {
>+			igt_require_f(system(NULL), "Shell seems not to be available\n");
>+		}
>+
>+		igt_subtest("all-env-vars")
>+			test_all_env_vars();
>+	}
>+}
>diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
>new file mode 100644
>index 000000000000..f5ba25e92897
>--- /dev/null
>+++ b/lib/tests/igt_hook_integration.c
>@@ -0,0 +1,281 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>+ */
>+
>+#include <stdbool.h>
>+#include <stdio.h>
>+#include <string.h>
>+
>+#include "igt_core.h"
>+
>+#include "igt_tests_common.h"
>+
>+char prog[] = "igt_hook_integration";
>+char hook_opt[] = "--hook";
>+char hook_str[128];
>+char *fake_argv[] = {prog, hook_opt, hook_str};
>+int fake_argc = sizeof(fake_argv) / sizeof(fake_argv[0]);
>+
>+#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, result) \
>+{ \
>+	"IGT_HOOK_EVENT=" evt_name, \
>+	"IGT_HOOK_TEST_FULLNAME=igt@igt_hook_integration" fullname_suffix, \
>+	"IGT_HOOK_TEST=igt_hook_integration", \
>+	"IGT_HOOK_SUBTEST=" subtest, \
>+	"IGT_HOOK_DYN_SUBTEST=" dyn_subtest, \
>+	"IGT_HOOK_RESULT=" result, \
>+}
>+
>+#define TEST_ENV(evt_name, result) \
>+	ENV_ARRAY(evt_name, "", "", "", result)
>+
>+#define SUBTEST_ENV(evt_name, subtest, result) \
>+	ENV_ARRAY(evt_name, "@" subtest, subtest, "", result)
>+
>+#define DYN_SUBTEST_ENV(evt_name, subtest, dyn_subtest, result) \
>+	ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_subtest, result)
>+
>+const char *pre_test_env[] = TEST_ENV("pre-test", "");
>+const char *pre_subtest_a_env[] = SUBTEST_ENV("pre-subtest", "a", "");
>+const char *pre_dyn_subtest_a_success_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "success", "");
>+const char *post_dyn_subtest_a_success_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "success", "SUCCESS");
>+const char *pre_dyn_subtest_a_failed_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "failed", "");
>+const char *post_dyn_subtest_a_failed_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "failed", "FAIL");
>+const char *pre_dyn_subtest_a_skipped_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "skipped", "");
>+const char *post_dyn_subtest_a_skipped_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "skipped", "SKIP");
>+const char *post_subtest_a_env[] = SUBTEST_ENV("post-subtest", "a", "FAIL");
>+const char *pre_subtest_b_env[] = SUBTEST_ENV("pre-subtest", "b", "");
>+const char *post_subtest_b_env[] = SUBTEST_ENV("post-subtest", "b", "SUCCESS");
>+const char *post_test_env[] = TEST_ENV("post-test", "FAIL");
>+
>+#define num_env_vars (sizeof(pre_test_env) / sizeof(pre_test_env[0]))
>+
>+__noreturn static void fake_main(void)
>+{
>+	igt_subtest_init(fake_argc, fake_argv);
>+
>+	igt_subtest_with_dynamic("a") {
>+		igt_dynamic("success") {
>+			igt_info("...@a@success\n");
>+		}
>+
>+		igt_dynamic("failed") {
>+			igt_assert_f(false, "Fail on purpose\n");
>+			igt_info("...@a@failed\n");
>+		}
>+
>+		igt_dynamic("skipped") {
>+			igt_require_f(false, "Skip on purpose\n");
>+			igt_info("...@a@skipped\n");
>+		}
>+	}
>+
>+	igt_subtest("b") {
>+		igt_info("...@b\n");
>+	}
>+
>+	igt_exit();
>+}
>+
>+static void test_invalid_hook_str(void)
>+{
>+	int status;
>+	pid_t pid;
>+	static char err[4096];
>+	int errfd;
>+
>+	sprintf(hook_str, "invalid-event:echo hello");
>+
>+	pid = do_fork_bg_with_pipes(fake_main, NULL, &errfd);
>+
>+	read_whole_pipe(errfd, err, sizeof(err));
>+
>+	internal_assert(safe_wait(pid, &status) != -1);
>+	internal_assert_wexited(status, IGT_EXIT_INVALID);
>+
>+	internal_assert(strstr(err, "Failed to initialize hook data:"));
>+
>+	close(errfd);
>+}
>+
>+static bool match_env(FILE *hook_out_stream, const char **expected_env)
>+{
>+	int i;
>+	char hook_env_buf[4096];
>+	size_t buf_len = 0;
>+	char *line = NULL;
>+	size_t line_size;
>+	bool env_checklist[num_env_vars] = {};
>+	bool has_unexpected = false;
>+	bool has_missing = false;
>+
>+	/* Store env from hook so we can show it in case of errors */
>+	while (getdelim(&line, &line_size, '\0', hook_out_stream) != -1) {
>+		internal_assert(buf_len + strlen(line) + 1 <= sizeof(hook_env_buf));
>+		strcpy(hook_env_buf + buf_len, line);
>+		buf_len += strlen(line) + 1;
>+
>+		if (!strcmp(line, "---"))
>+			break;
>+	}
>+
>+	if (!expected_env && !buf_len) {
>+		/* We have consumed everything and we are done now. */
>+		return false;
>+	}
>+
>+
>+	if (!expected_env) {
>+		printf("Detected unexpected hook execution\n");
>+		has_unexpected = true;
>+		goto out;
>+	}
>+
>+	if (!buf_len) {
>+		printf("Expected more hook execution, but none found\n");
>+		has_missing = true;
>+		goto out;
>+	}
>+
>+
>+	line = hook_env_buf;
>+	while (strcmp(line, "---")) {
>+		for (i = 0; i < num_env_vars; i++) {
>+			if (!strcmp(line, expected_env[i])) {
>+				env_checklist[i] = true;
>+				break;
>+			}
>+		}
>+
>+		if (i == num_env_vars) {
>+			printf("Unexpected envline from hook: %s\n", line);
>+			has_unexpected = true;
>+		}
>+
>+		line += strlen(line) + 1;
>+	}
>+
>+	for (i = 0; i < num_env_vars; i++) {
>+		if (!env_checklist[i]) {
>+			has_missing = true;
>+			printf("Missing expected envline: %s\n", expected_env[i]);
>+		}
>+	}
>+
>+out:
>+	if (has_unexpected || has_missing) {
>+		if (expected_env) {
>+			printf("Expected environment:\n");
>+			for (i = 0; i < num_env_vars; i++)
>+				printf("  %s\n", expected_env[i]);
>+		}
>+
>+		if (buf_len) {
>+			printf("Environment from hook:\n");
>+			line = hook_env_buf;
>+			while (strcmp(line, "---")) {
>+				printf("  %s\n", line);
>+				line += strlen(line) + 1;
>+			}
>+		} else {
>+			printf("No hook execution found\n");
>+		}
>+	}
>+
>+	internal_assert(!has_unexpected);
>+	internal_assert(!has_missing);
>+
>+	/* Ready to consume next hook output. */
>+	return true;
>+}
>+
>+static void run_tests_and_match_env(const char *evt_descriptors, const char **expected_envs[])
>+{
>+	int i;
>+	int ret;
>+	int pipefd[2];
>+	pid_t pid;
>+	FILE *f;
>+
>+	ret = pipe(pipefd);
>+	internal_assert(ret == 0);
>+
>+	/* Use grep to filter only env var set by us. This should ensure that
>+	 * writing to the pipe will not block due to capacity, since we only
>+	 * read from the pipe after the shell command is done. */
>+	sprintf(hook_str,
>+		"%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
>+		evt_descriptors,
>+		pipefd[1]);
>+
>+	pid = do_fork_bg_with_pipes(fake_main, NULL, NULL);
>+	internal_assert(safe_wait(pid, &ret) != -1);
>+	internal_assert_wexited(ret, IGT_EXIT_FAILURE);
>+
>+	close(pipefd[1]);
>+	f = fdopen(pipefd[0], "r");
>+	internal_assert(f);
>+
>+	i = 0;
>+	while (match_env(f, expected_envs[i]))
>+		i++;
>+
>+	fclose(f);
>+
>+}
>+
>+int main(int argc, char **argv)
>+{
>+	{
>+		printf("Check invalid hook string\n");
>+		test_invalid_hook_str();
>+	}
>+
>+	{
>+		const char **expected_envs[] = {
>+			pre_test_env,
>+			pre_subtest_a_env,
>+			pre_dyn_subtest_a_success_env,
>+			post_dyn_subtest_a_success_env,
>+			pre_dyn_subtest_a_failed_env,
>+			post_dyn_subtest_a_failed_env,
>+			pre_dyn_subtest_a_skipped_env,
>+			post_dyn_subtest_a_skipped_env,
>+			post_subtest_a_env,
>+			pre_subtest_b_env,
>+			post_subtest_b_env,
>+			post_test_env,
>+			NULL,
>+		};
>+
>+		printf("Check full event tracking\n");
>+		run_tests_and_match_env("*", expected_envs);
>+	}
>+
>+	{
>+		const char **expected_envs[] = {
>+			pre_dyn_subtest_a_success_env,
>+			pre_dyn_subtest_a_failed_env,
>+			pre_dyn_subtest_a_skipped_env,
>+			NULL,
>+		};
>+
>+		printf("Check single event type tracking\n");
>+		run_tests_and_match_env("pre-dyn-subtest", expected_envs);
>+	}
>+
>+	{
>+		const char **expected_envs[] = {
>+			pre_subtest_a_env,
>+			post_dyn_subtest_a_success_env,
>+			post_dyn_subtest_a_failed_env,
>+			post_dyn_subtest_a_skipped_env,
>+			pre_subtest_b_env,
>+			NULL,
>+		};
>+
>+		printf("Check multiple event types tracking\n");
>+		run_tests_and_match_env("post-dyn-subtest,pre-subtest", expected_envs);
>+	}
>+}
>diff --git a/lib/tests/meson.build b/lib/tests/meson.build
>index fa3d81de6cef..df8092638eca 100644
>--- a/lib/tests/meson.build
>+++ b/lib/tests/meson.build
>@@ -10,6 +10,8 @@ lib_tests = [
> 	'igt_exit_handler',
> 	'igt_fork',
> 	'igt_fork_helper',
>+	'igt_hook',
>+	'igt_hook_integration',
>         'igt_ktap_parser',
> 	'igt_list_only',
> 	'igt_invalid_subtest_name',
>-- 
>2.45.2
>
