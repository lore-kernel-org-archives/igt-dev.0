Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9F0C282DE
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 17:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB83C10E81A;
	Wed,  5 Mar 2025 17:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhn1FLuW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573FA10E81A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741194598; x=1772730598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PrhhcjlPFCihBztwNB7cgCcb9Hse4JTX/F9Fpf39IM4=;
 b=dhn1FLuWXpitqyY65VmlBfZWj2JxUo/TkQV9so4lKnSU4NL6EBcIG6oy
 Urtf84o+p1j7DzJ0jfYKBWsA6GT1qR3zO5hkeXqz7HDqbDV7Ve9suTGLK
 /G/HcOjR6S+gME/kvoqqmr4N7tf6YAFTqsyQcnKhJ92lFN9FHqDZYGqyd
 j7xRqYiIMg5XJOZSzbkyFTnsMV3YSvu5pbnNTj/SBgKbEmXeu5BJYiid0
 9dXLFIOKXHkfvRJyYF3NZGW5nLjhuiblbXdhMevnrTN1LUpvAlgmzc4Se
 RKkMA+8VBaMvR3C5tujiR0LycPaPrwhivEQGpTsuHbNJI7USVrh1JCbaq A==;
X-CSE-ConnectionGUID: EQgnE4YZSASWKdh+LmSC8A==
X-CSE-MsgGUID: Hgs/oBBcQVCcuwieIHL47w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53581252"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="53581252"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 09:09:57 -0800
X-CSE-ConnectionGUID: kQpYBodGQEujAmVJcKEYHQ==
X-CSE-MsgGUID: Wz7T3z72TFWt6FpaKQK1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="119253241"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 09:09:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 5 Mar 2025 09:09:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Mar 2025 09:09:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 09:09:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl7U0kl6Wh+JEo2llCLT8yVUvdFY+9oVJQoPONB+gLT6b3GWW6u2yndRxRc4YEGv9U25iyaQNbt5PjtN1hiDUvgUz1JnCujGHKP/K7b4wd6c8q+F3XS2cEFEBeFdf0Lq1oMuk8XZWWxxfoabPHpAIL6u6gSXDLTtPrGaJgNbbve2IKfKRlafIDoiF2C5TzPZ3UIMxzdYXIHIlyY+MNwM5qevAoX9Y0wgTFZY+OFZvxd3BhhG7cE6HopnMvax55JcGvJS/jKXdR8Vcp5Tz+nq+4XN92BZWI/1KvKpODRFKe2hsdSIHU+prOMFguzB/atK94OBxuwg3VbaB6kZIy4iLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R46Fj8egTZ4wN9/wqt8zSV5dCdArslASczKf2gN2lEg=;
 b=LElfo/t/MN/yKCMByThLz/lGNx7YnF+3RqUiKFutiI/wKn/ZD1gD9mPNhBKZTc6HTQZ5+/qT6i9IsBUipUSewUS/+HkGGesjVcCaZhJcc6tvTfTrMJYtiZdoqZs75gNUX/Lb0IFWWTJxNqVxHEUKIHmkVOUvhzhaAMmpLPB/93qqHL+eSbliDkUSfniqsVpJJdBBtdPuJjS0OebrAHuVQ/dC4JS529j99bIMjUCWmBfqAtryw2/zZzl1/IS/Z21i8gJrGcS+NkYiZNJ11qugoVITImJTgkB+7Q6Pxi5/Gu5zO4dSmpIgwRehwNhflM+Q9eQZvU3vW9BvjlQoASAxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.29; Wed, 5 Mar 2025 17:09:00 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%6]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 17:09:00 +0000
Date: Wed, 5 Mar 2025 11:08:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Group utilization
 tests and skip when no utilization data
Message-ID: <ip3lgnjby4aeplweqxvtcjubj27hktvzciqvvu5r7u7vkzqs4n@y7uomewtoetr>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
 <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:303:8c::31) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|DM4PR11MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 612c2c37-dce5-448e-3cb2-08dd5c086c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sWzjd/X85CSiQGy3cy5ji8QmLGhh+rKdrOjoIdU0yHm3uDZmv4t9U2WJUm5O?=
 =?us-ascii?Q?9BLCqTRkcQhB0KtybTNf1bK09uE3POOzQsmqxXoSUL163o9kLaHcO4CSfkL0?=
 =?us-ascii?Q?zTZbMcZNxaxh0yxF2sKTpqrWTmX7bn9t55mFqOU/N3X4qI5MQdpxWsHMYH0z?=
 =?us-ascii?Q?/Zx17vTpjufnMexLAgZLXObb8Y/Hl1Ji9OcaJSMqwgzKnPYut65IHH8/VIoQ?=
 =?us-ascii?Q?sTTkCqSOqqjkOCEf89dHk2uS1LaYgfOmxtL2LJEkaITwUuXgWcOGFhKR/zU/?=
 =?us-ascii?Q?1WMyEuqOKrwnBF6+t05KC/JvpJ+i+3eZD1OTW8npouQZiCgIzVToTmUf4u90?=
 =?us-ascii?Q?mEPiCDmwdmTa09KXUfj+Xar4SMO8H7NuGFt+jH7DZuwPPc3i2RHIhYXaZLLQ?=
 =?us-ascii?Q?17/fl+Vov17zgphwvXbDj45LjM6Y4o+meIpOLhzCpGfJ2WU0VHBc6CttQqP8?=
 =?us-ascii?Q?R5Xmp8vXnPNjpoKru3jQapSxpqLqQKdpgJhS+oXcHo/Ax3LgdwQWlIwhOPC5?=
 =?us-ascii?Q?581AJkZ0YRjRDJADclYMy/TLijEgYhTAigQ1JmwHPV2QUUu8QoWr42GQ/NB5?=
 =?us-ascii?Q?jpTIYhLohXAvyHk2X8xRt8M4prmEcq7CPF7C0zHhqlebV+xJOXXWbJ7w9XpR?=
 =?us-ascii?Q?3O54iGri//nGZX420zIIHjI9U3SvEaBpYr+z7kGLw6XMI0YrUlRQPb4/EKAH?=
 =?us-ascii?Q?1b69HuJgXjbscUi49bOPX4/jlokDjjPfd/0XSyduGOcQrVkimG/1ZT7Z76Fl?=
 =?us-ascii?Q?MCIQqKZEmu44dyz6jX3KLVc/Ico+FWFzgyeH6uS+kAsAn63SyORWeZ+kiFcY?=
 =?us-ascii?Q?FRQOmk2tY2h+giNaVmU18D+taGaZU8zmONSdQLFZjsvmxb7zBXXhIpwCdvUK?=
 =?us-ascii?Q?IXJXtRk2UMg9LP4E1OuWF4uol9vK+Ropyv0a2FOwzY/4JkK8RC/1X0dkric0?=
 =?us-ascii?Q?eoCUOGectxro8D4g93DIX6JJKr8zmv81jwUWQNQMpsp1W/DXPRQ27ULlRF+k?=
 =?us-ascii?Q?2doDR4Fmm612dza9jjfJYYctMyt05MJ1c6ITyRnQ7RjnQ6dxUkqkAqw939vi?=
 =?us-ascii?Q?3UEmgW4YudFzaAh7nfw3W/Qq993DP/yO7ZdM13o8riMfxQFRCgBL17TrwUMz?=
 =?us-ascii?Q?JRRAeNIt+xRWKMDTnN8c6zAUl7TOJtnSfZoWLi+Cbh/FqDnK7zMRAkHH2MvM?=
 =?us-ascii?Q?dnjby9LxhzoqsoFOqD6oBOB44YExzYU3/vTm5LPmKuOknusHtKnnF6/10FMO?=
 =?us-ascii?Q?Jw9zbcnFbxHF6u5hhKfR8b5JuH7uh4VK+V0cKQwB44RNwao4XKB907w7knKe?=
 =?us-ascii?Q?1ITAR1ECSl+zYK4JPWCX2bsz87WM2R0U37/AaIHkjomJ4rQ7MqMbaHrIq8P6?=
 =?us-ascii?Q?NDWVouccJS5BOmnXx8gUDBHJepKN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UIKfvFU38OGfKfFn3LxoZEkCF0rhgb1QCfyjWBC+eA+fosC+VoZVGlcrqhXx?=
 =?us-ascii?Q?vPz2oW4hkA8NLbvN5ebf/W0vsz3S5BW1jnwtG2Ivi0ioU2uEPOGtYowGjF/n?=
 =?us-ascii?Q?zeO4ypMth7nlgPw+z+3O0aft/1vn8t2Ihy0DDVAb3gH0dROhAlpGk2ZPtC0Y?=
 =?us-ascii?Q?BZsqOhh2FN7Re6p7U/aySfyFUwnfADVqM4GWmliTaPpSuPIQ9tnosxKnrb6e?=
 =?us-ascii?Q?oCQfTJ34Iig0GTgnId6A8vOlV7FBQDlA2acrVtG4HyN6RTuQ23WMtfmdNgCp?=
 =?us-ascii?Q?pPwmX/9XWxfUWjTV+nZ/tdtG+dGfYGErnNuL0bnG5Jx7QkWngmVa5jcRCOHo?=
 =?us-ascii?Q?jez3QukvnYBI+ucr69xsxgT85RXl8LhnuFHWWqyDmVkB0BqyvXJYDKADvM9m?=
 =?us-ascii?Q?q5094JthuQpf/nfhw0d5JAMKi7S0Al0pKFjcvpgVboXp0FjxPRe9SVGlhxO7?=
 =?us-ascii?Q?kyBnJ/O+hLqPHqnH/c4aoDQ75nG/+B4ZHqzRM7xS1IidPnRFNxJLwihd2d9X?=
 =?us-ascii?Q?so6lHrqlL4JBzaicfbj9DluLf9Iz6eIviBLBZ9FD7tUN4NmPdiSrWvaByWII?=
 =?us-ascii?Q?F8NPT6wzyf2qLFbtnrG+Y9cH08ttxpBIn0m97wcEaVUW05idbefsir7s7WXo?=
 =?us-ascii?Q?m26kjk1A9JK6RqXzY9qEbE2BPMjd0RevzxH9IyeKo3k25aizuFqww40cDQ6o?=
 =?us-ascii?Q?d5uMqDehR+4EEpFR5dRvX0Dvqg3+d2BfcZupK/g9aQpfQiwTp5rCaokYxqjF?=
 =?us-ascii?Q?HHNvp493ie1D3LbwxsFa4A5T2CeZJIEgL/dqKlP7hzS1R7A8uUM2oNfbYZeD?=
 =?us-ascii?Q?qLgXVMcvUFdlXlnh1cy6xna4H7+L10ttlgpfjqz6/XyKAxk0Hjzqs922ou9Z?=
 =?us-ascii?Q?6VGtcPAHirNeNBcYudB/J9oiwQtlFgoFpQnj5CUVLHHZh6gATC4ojbvGDH04?=
 =?us-ascii?Q?m7waev9YXzJYZwE77S2gNXiYkd8elh3GW4w6jIiHF6tP3lyJ4J+4j7JGATu+?=
 =?us-ascii?Q?s7sSGrn69UEBM8hh1H/cIpQ/aqfGCxMrpT9BbGZv2vdTs5dGrY+JaEEEJkKM?=
 =?us-ascii?Q?MqM4ULVq8TBs0rIpZ7S9PzM8j0yrAMvH0bzmjbKHAzopHOoNVDJj4o0ZIy+6?=
 =?us-ascii?Q?JYVEsn9JhDCYd+74QmnJ/jMQrx/X6maTE3b7Q+c3IyxYgRE0qEYZhGYLHlgi?=
 =?us-ascii?Q?I8fcglnMNlxCsOP+PKvfU2ahcCocNz8thti0MvzzJEks0wFy4rZqn8MIgjUg?=
 =?us-ascii?Q?PWH9uaVwxUU77DXr7xkeFVG6qR25rQiN9V9BbJDzfHyFkJl/Bw+RCuePO+RV?=
 =?us-ascii?Q?J6bDvM1Tht7CViY+9Ggmyoh3S3T/rr0DWguGmc7DoRwsQJobGvA1sv9C61DO?=
 =?us-ascii?Q?A7tW9RvOt1P3d4bLWaCrVAZ+c4Z9kJbGcqSms8top/PGCsS1IBuTJ+AJgX88?=
 =?us-ascii?Q?JPr/30Ylsp1iqsO1enzuoTqImBQbRO/Qzef3MLsqx3iHNDzSThzFXZ0/puzb?=
 =?us-ascii?Q?7G/DaYv5rl5aDdhfIhKp8oX4sdE3MiQeilM/zZgSgxfPFlUERFbFGF0KrIvB?=
 =?us-ascii?Q?LsCUWNzfVFTwp7MMGYc83LzuQ0gbAi2cQdpfnkO7C8RXRuyBqRnFiwSbdRkA?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 612c2c37-dce5-448e-3cb2-08dd5c086c23
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 17:09:00.2574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDYf+jkxi1tFN352dUjJh296TiY1rmzvEKVp0qHTgZsOrRZ3gaUnTj7ilSH7OSAJHeH1Gy5Kn1VvTdvgeVhZVbBfhETgURkGJxl1im2JgmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
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

On Tue, Mar 04, 2025 at 07:56:39PM +0100, Marcin Bernatowicz wrote:
>Wrap all utilization-related subtests in an igt_subtest_group and add
>a fixture that ensures utilization data is available before running
>them.
>
>Link: https://lore.kernel.org/r/20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com
>
>Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 122 ++++++++++++++++++++----------------
> 1 file changed, 67 insertions(+), 55 deletions(-)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 7330b4330..d18fe10d8 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -735,10 +735,6 @@ igt_main
> 	igt_subtest("basic-mem")
> 		basic_memory(xe);
>
>-	igt_describe("Check if basic fdinfo content is present for engine utilization");
>-	igt_subtest("basic-utilization")
>-		basic_engine_utilization(xe);
>-
> 	igt_describe("Create and compare total and resident memory consumption by client");
> 	igt_subtest("mem-total-resident")
> 		mem_total_resident(xe);
>@@ -751,57 +747,73 @@ igt_main
> 	igt_subtest("mem-active")
> 		mem_active(xe, xe_engine(xe, 0));
>
>-	igt_subtest("utilization-single-idle")
>-		xe_for_each_engine(xe, hwe)
>-			utilization_single(xe, hwe, 0);
>-
>-	igt_subtest("utilization-single-full-load")
>-		xe_for_each_engine(xe, hwe)
>-			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
>-
>-	igt_subtest("utilization-single-full-load-isolation")
>-		xe_for_each_engine(xe, hwe)
>-			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>-
>-	igt_subtest("utilization-single-full-load-destroy-queue")
>-		xe_for_each_engine(xe, hwe)
>-			utilization_single_destroy_queue(xe, hwe);
>-
>-	igt_subtest("utilization-others-idle")
>-		xe_for_each_engine(xe, hwe)
>-			utilization_others_idle(xe, hwe);
>-
>-	igt_subtest("utilization-others-full-load")
>-		xe_for_each_engine(xe, hwe)
>-			utilization_others_full_load(xe, hwe);
>-
>-	igt_subtest("utilization-all-full-load")
>-		utilization_all_full_load(xe);
>-
>-
>-	for (const struct section *s = sections; s->name; s++) {
>-		igt_subtest_f("%s-utilization-single-idle", s->name)
>-			xe_for_each_gt(xe, gt)
>-				xe_for_each_engine_class(class)
>-					utilization_multi(xe, gt, class, s->flags);
>-
>-		igt_subtest_f("%s-utilization-single-full-load", s->name)
>-			xe_for_each_gt(xe, gt)
>-				xe_for_each_engine_class(class)
>-					utilization_multi(xe, gt, class,
>-							  s->flags |
>-							  TEST_BUSY |
>-							  TEST_TRAILING_IDLE);
>-
>-		igt_subtest_f("%s-utilization-single-full-load-isolation",
>-			      s->name)
>-			xe_for_each_gt(xe, gt)
>-				xe_for_each_engine_class(class)
>-					utilization_multi(xe, gt, class,
>-							  s->flags |
>-							  TEST_BUSY |
>-							  TEST_TRAILING_IDLE |
>-							  TEST_ISOLATION);
>+	igt_subtest_group {
>+		igt_fixture {
>+			struct drm_client_fdinfo info = { };
>+
>+			igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
>+							 ARRAY_SIZE(engine_map),
>+							 NULL, 0));
>+			igt_require(info.num_engines);

humn... is this fixture exectuded in addition to the outer fixture
for each each subtest? Otherwise it won't have the fd open and thus no
client.

Lucas De Marchi
