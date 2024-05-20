Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5C3C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D0510E920;
	Mon, 20 May 2024 19:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzAJZKGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574B310E920
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716234980; x=1747770980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Is52XnQ7KolGmj9WiIDU1PrgbjC6XIpBtCXhgyFEgSs=;
 b=OzAJZKGVm7cMf7J1JZ9znlpRkxWodoOQiqaLlrrRZklc17n0NBJ05815
 kDeoi7Ah7SWx2VlrzvEhsZLRZL4Xps845WDQhmidNGfbb0PrfImQBRnxv
 vNSGdMwjoHKerm0KI1byi9DJlsou6ff4E/KlZFV2MT2UH9k7PE7tHgnZ0
 U0ysxTDmqGn7Tm9mMVWAzpGUvReuM3vXpUNYGBukf8X/26stbQrsxlP06
 q3WQEdjtaVsP484a6THLmqHewYrUlY4KbjdtbDDlr4w0sUsPSny1mPTjd
 QaiFHa0YWFMYNovscFc0oLKvcIU8Z9CXzb0mAyderYgwWvdG0bmqHtjZV g==;
X-CSE-ConnectionGUID: AJ9/++50RrOl8JzXrD2WrQ==
X-CSE-MsgGUID: wKsBknSqSTeC4TjKbAyy9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12498691"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="12498691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:56:19 -0700
X-CSE-ConnectionGUID: 9CNaYut8QACSXBZNkzu0FQ==
X-CSE-MsgGUID: QJr4em2KSSylZ8JMhqeelg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37032582"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:56:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:56:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:56:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rme7IWe9i6RMLeeJgdGqGEJ+BHn9F61Qs8ttI2gXAkXl63DMnk/JbFONz563DLaYDtFOQrk7VW2tSz4MX0IQmV9XI4wyn71T+XkSc9Phh+lJEaKrgpniasDodVgycRYLofnIEbjBsQtfM3SrqitMIfV6hfXdtofqFH8c1B0kIV5Bqne0T/JrnheMar7GdQwu0s+TW9WK1I+nwAxtrv7BnnQr8iPh0/IYTsjHX+ejYNULvl3Suspoj5FaafkqXo8UJlt26H68XFFEyk5zsDcejwEVTcnT7EFtoKkgIW8q4aZpO45MrzXj6Zye769lNOKYG5KAEJ4t3BguCuljHxn4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtCt8TW8d5U9tkGhyWM9185JPXn6ymoyGUIwDJtGppw=;
 b=jNT6bxGf9N624ZcutdazJicGQxgjQFNYGaK7Yt8IKjmI9mez0jlJ8me2DiFpJpEnKvEHb+XTgKGJzKU4cCDDh7myebPmy+p/FyIgCxTCxp4FiDGQKal8OuR6kukTGvysTdfT5fs70aXoHjF6jF8QD2KgQEtfMSACCY5W7Qyh1hRGUDEIszIjBSPBh1vewNre72xslucFf2cyk8pa/ibS9duj01jYzoa5gJ52RT+LY3YrmpirQql9C4sn6OnaP6/ikvoDpFsiT4cGM6rhpI84MZX7hYsDg+C70j0F9ExXO4REbbrhpT410pQKboTybom5h7cni1klv3n/CEjaSeXypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 19:56:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:56:14 +0000
Date: Mon, 20 May 2024 14:56:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: s3 vs s2idle: Validate only the
 platform default
Message-ID: <nprozwlpjzyhw2k2ab6ynqq2denutk4mpbvcyms6s6ehkuksbj@hlenzwahvpzl>
References: <20240520190857.242928-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240520190857.242928-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:303:b6::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 143e2e3b-9cbd-41c4-7d82-08dc7906e774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005|27256008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7LI0P4ZMo5gpa9DZBbsWM1iAcT7FqrMDmY7r+z2zotqmy8twJwpFkvk1gWw5?=
 =?us-ascii?Q?KnQF+wTZeZ3U5jOtSsPodySjj8vGe8aRTeBOs4H9xZfh04KQ3LkM5Tcd4wcp?=
 =?us-ascii?Q?h/Nqz8SsjrZO5QxoH0+pUM9lAvpf8trw2Na0+MoOhXhsn+5fv1yQBRTUMh2Q?=
 =?us-ascii?Q?sohepYWvkx893ecFpu4+WbXdlYd8tvNv0i+i+mr46Br+604lWtXaX7EPrwJg?=
 =?us-ascii?Q?LEkg0Mbqzt4LpG2OnYZBorWRtIjU239sLwYLQer28JBGfEECLI9WxURHPyup?=
 =?us-ascii?Q?/bpm5q26o/7Z5JP2zmky4zZgBa0DwRE6FbiQTKW0eM5PV1+3WXEl/EYDT6x6?=
 =?us-ascii?Q?KgjtsE39lJ3jXD58GSvzO/VVotFmgMofJ63Eeq3PmLLcC0iWXKuNviqOpJsI?=
 =?us-ascii?Q?SdICM0MB6cuieKbBu3TSdlinYdjtFXAU9r12CiALA7IU3EbktMGVtm/82g50?=
 =?us-ascii?Q?s6aSc0W8ChYaZu9tvbH+tymcIiusqFzFykXaOw5xg7KjRJcifSqdqC+Mihge?=
 =?us-ascii?Q?xmPx8XpOK6uZ6F0Yoo6r3Jm2i7VChDEue3yJ0o3kUm6wjQDdwZ1jzPHrsp7C?=
 =?us-ascii?Q?4qGxHt2mSyNV8HCCP7lv6AsZ5g5Of8q46rE4bxxSGID8HtACRpQPmFBEz/F5?=
 =?us-ascii?Q?T783XJ+icKrr/bFf2UjRB9mRhkqTIEoUwvjB3k8yYMuDhWRoCQLjklCU5B7f?=
 =?us-ascii?Q?vheVO21s+kreDFTZKBFbujXFZzARui4OLG6P5p5OoSIs84oduMOKPj1M49Kv?=
 =?us-ascii?Q?njoPTbw6dpvGaD+FKS2lALDnyWbuYI8Edkc7w41p1RxQSM9kD8qtuP/os55u?=
 =?us-ascii?Q?1ovmgE5kg/XQcpJyEP/D/OezGwz/pb3SbivNqNqCn1BC3jOk4X3NpdgwVrpu?=
 =?us-ascii?Q?rCCGfDAlJ/VkIyLmT1z/FJI+jfBCagiN3dARgEYshwWOJqO4B6GWZbWizbrC?=
 =?us-ascii?Q?tMeDV0soriL0wHx01QS02rq/47uIxYOI2XxjzngG2oB3FJxXtDEo/MLRT3nt?=
 =?us-ascii?Q?+5Lr9VHNkhczKD/Clqd0JVOE8hTKui0857zcAcVQfLoLybrmqrjz0FOORUfZ?=
 =?us-ascii?Q?kmZw6fXi45MixqmRL/OLORyBEfELzgz3dKjPVH4Y5LVUVTnwVISfnTVOf/lQ?=
 =?us-ascii?Q?7evRlpD/LKAdhcRU4MAmUwP3FmU4Q1YNE/xABl/z/rDkx5ft8g1PeEPBYH+1?=
 =?us-ascii?Q?pOBFZPycwn/7qb+Jh0BzYcv/1L1da0REXFUpd/Lpeg3+l9VF4zeXNVI3MrLk?=
 =?us-ascii?Q?acyFMFGUbYbFAtO2gjnC+Pob+sBTUkkyVjVuhyGm2Y4WX5efUoOmIkHesROQ?=
 =?us-ascii?Q?5acgDVo7vtH8QeHDXimfXjYJsaN1PX63tbxhRmhqYlgpKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5X7iW1VpazakiKDTTK2DMeAKXqtyaz9DlddKJRXE2PIiNxebRyN0VfAKUz3?=
 =?us-ascii?Q?flNdDJsNEHk3EVMvPY9pDDFVToO65yPkZV99w2A3xg1hHZ4yvz5iec1zq6C6?=
 =?us-ascii?Q?BT+PGQ9aOZp2YcwgQdPOC6l8fhDpGxy8U/Ci4FlcNBLl7NeBIxj5NJSDPM8c?=
 =?us-ascii?Q?YLthAcMP1q+uvIxVpKBzb/pJW47SaFufv+GYqwYxWfb7DZsCm0sXaelAIy0Z?=
 =?us-ascii?Q?x88uSQNxI5xQcWeOJob4huEWvdHcyJRNJ4FZrfxQwllZPEnfU60jlERs6cb1?=
 =?us-ascii?Q?6WMFYJEOLvTohCutqNEc90xXnU8OigW8vyse9DzDSqRg1mrg5YF3JPdUTxah?=
 =?us-ascii?Q?Z6Xr6X+Sgg5hEV+BE8cL0eAuUerKIsKhCf0W9/XmqUqxGB00kZqeoxRoyjEC?=
 =?us-ascii?Q?5gNPe6+tnXiFToRaLUe6X5zEkfa5Xon9WfHyhD3GW+Fy4vHE2xnyt/NMJ/F8?=
 =?us-ascii?Q?yD7XZo54JyBWTpOQIysfeg9ob7S1bmb+dxn1ExDKbLyWsbFDBT6GCFGbMm+U?=
 =?us-ascii?Q?OlcTuw9JMAp1+F2a7vWyZDF7jpaC2B4uLPnJ3X37cjIo/dxDqvky1IA+hAIc?=
 =?us-ascii?Q?zVoxBAng0y69g+g9ljPF4JqK1lnuMxdbzSmlGp1NKGzXHYn2bHi7u3RrZNIw?=
 =?us-ascii?Q?vyx+tbqMnruFMGuIm5mlou3owDTVf/BBxcHavJJ8XLgf2JNBRATCv7BC79Jn?=
 =?us-ascii?Q?gY+UHn0awDd5D6HbiIkKSaJGNJGEVl0FuUyrgQfu78V8dVqS7WVIUMyPjBmL?=
 =?us-ascii?Q?Tmt9D0aibZqPGKYfFqrN5931/Aa/0khkTekI14efu4p4llSOibvuKoksLT53?=
 =?us-ascii?Q?tdKyShasRxoQWkDwWPG0YFmV7aTB6LyJAyEYXxhVf7ushLXjkB5vANIqbnUl?=
 =?us-ascii?Q?pZ5auO5ZqDQw3CDBWVcJqRrN+e+IYKFl6TVYApMpNI/43Jcu+Q3Qqvrc605E?=
 =?us-ascii?Q?zVL+18FeLKmkKlxK5v/ZorwhXAVePPcN54fOak1ZgoaZQ+NSf/HIUC7tuA5R?=
 =?us-ascii?Q?GwEI9qLKbAVGau/Yb1F8Ly2kJhSFFdYBwF2b35YQVOGcMVPW4U9eWQUKRWIq?=
 =?us-ascii?Q?KgTh8iFHLTQLTg7nmtZU/nKoEfG7HiXht0oOMnjtPAuNrtVGL+K2y+hW/jXp?=
 =?us-ascii?Q?UMmjfgWM1Cr3h9JCMDPqdxpQ7DW2jKvMtgQ4NgugDHWnW+ct703J3MBXMpu8?=
 =?us-ascii?Q?2+wwZoYUM+WjI/G28lAHOBmYXSyDJqC8Nok9jjM55H+7tX21zDXvmZPOgLlB?=
 =?us-ascii?Q?6TmyVTqNuEo0jrTRDFSoJT5TiEGJkkLlSzfmmOakuojoFp9GuLILesiDeRXo?=
 =?us-ascii?Q?J++Bklj5+KvAbOLFAsG10GEdYPztpZ9Fqgde8Cgys48kxy+Obv2+1hgEDCk+?=
 =?us-ascii?Q?GvlE2vg9V30CqT9MVykQ+++RRYy7ca6vim30A1JaDcZJVh/EHkBR2ekdkahs?=
 =?us-ascii?Q?YlZT7w8SEriyG4aMEiiwHTvlZ6SFsh/TXkdW7qoe8a2EO/eObxC37Aj1Lw3P?=
 =?us-ascii?Q?rUggXor2egZ2IbyN6A9SYbzuRoJXfMXB2NKZHkL+dQs1vnoKrhZxmo0amkKA?=
 =?us-ascii?Q?KidNcjLpX7eF52YQmDh0leuleuL73JuYuK2tBx+mqp9fdP7ZZVb5CFc5KO5J?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 143e2e3b-9cbd-41c4-7d82-08dc7906e774
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:56:14.2657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FP8+9mjd6AdE6kzdx+h7qrDLrTrA2q4cF7fL6bI+GvkzrD8ZWePGLO6xA4Zh9GwRfQjT0IpdoB5fdEZWUrcyzvwJpruH/jecNKRma+RiqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
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

On Mon, May 20, 2024 at 03:08:57PM GMT, Rodrigo Vivi wrote:
>It is very common to reach issues from other drivers when testing
>the full non-default cycle.
>
>Get back to i915 approach and validate only the default mem_sleep
>level of the mem sleep state.
>
>However, keep the option in place where the developer can force
>the validation of the state using an extra test argument.

so this will read /sys/power/mem_sleep and execute only that level

why not "up to that level" so we still catch and differentiate issues
about failing to freeze vs failing to suspend?

what current issue is this actually fixing?

>
>v2: Fix Subject (Kamil)
>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> lib/igt_aux.c       | 31 +++++++++++++++++++++-----
> lib/igt_aux.h       |  2 ++
> tests/intel/xe_pm.c | 54 ++++++++++++++++++++++++++++++++++++++++++++-
> 3 files changed, 80 insertions(+), 7 deletions(-)
>
>diff --git a/lib/igt_aux.c b/lib/igt_aux.c
>index 3407cc4f2..7770a05fc 100644
>--- a/lib/igt_aux.c
>+++ b/lib/igt_aux.c
>@@ -852,7 +852,15 @@ static bool is_state_supported(int power_dir, enum igt_suspend_state state)
> 	return str;
> }
>
>-static int get_mem_sleep(void)
>+/**
>+ * igt_system_get_mem_sleep:
>+ *
>+ * Used to query the current configured mem_sleep. In special to stash the
>+ * default of the system before any test operation.
>+ *
>+ * Return: Current mem_sleep configured.
>+ */
>+enum igt_mem_sleep igt_system_get_mem_sleep(void)
> {
> 	char *mem_sleep_states;
> 	char *mem_sleep_state;
>@@ -891,14 +899,25 @@ static int get_mem_sleep(void)
> 	return mem_sleep;
> }
>
>-static void set_mem_sleep(int power_dir, enum igt_mem_sleep sleep)
>+/**
>+ * igt_system_set_mem_sleep:
>+ *
>+ * Used to configure the mem_sleep. Useful to return the platform to its default.
>+ */
>+void igt_system_set_mem_sleep(enum igt_mem_sleep sleep)
> {
>+	int power_dir;
>+
> 	igt_assert(sleep < MEM_SLEEP_NUM);
>
>+	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
>+
> 	igt_assert_eq(faccessat(power_dir, "mem_sleep", W_OK, 0), 0);
>
> 	igt_assert(igt_sysfs_set(power_dir, "mem_sleep",
> 				 mem_sleep_name[sleep]));
>+
>+	close(power_dir);
> }
>
> static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state)
>@@ -1018,11 +1037,11 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
> 	igt_aux_enable_pm_suspend_dbg(power_dir);
>
> 	if (state == SUSPEND_STATE_S3) {
>-		orig_mem_sleep = get_mem_sleep();
>+		orig_mem_sleep = igt_system_get_mem_sleep();
> 		igt_skip_on_f(!is_mem_sleep_state_supported(power_dir, MEM_SLEEP_DEEP),
> 			      "S3 not supported in this system.\n");
>-		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
>-		igt_skip_on_f(get_mem_sleep() != MEM_SLEEP_DEEP,
>+		igt_system_set_mem_sleep(MEM_SLEEP_DEEP);
>+		igt_skip_on_f(igt_system_get_mem_sleep() != MEM_SLEEP_DEEP,
> 			      "S3 not possible in this system.\n");
> 	}
>
>@@ -1034,7 +1053,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
> 		suspend_via_sysfs(power_dir, state);
>
> 	if (orig_mem_sleep)
>-		set_mem_sleep(power_dir, orig_mem_sleep);
>+		igt_system_set_mem_sleep(orig_mem_sleep);
>
> 	set_pm_test(power_dir, orig_test);
> 	close(power_dir);
>diff --git a/lib/igt_aux.h b/lib/igt_aux.h
>index 4664559dc..8fd21c37b 100644
>--- a/lib/igt_aux.h
>+++ b/lib/igt_aux.h
>@@ -214,6 +214,8 @@ enum igt_mem_sleep {
> 	MEM_SLEEP_NUM,
> };
>
>+enum igt_mem_sleep igt_system_get_mem_sleep(void);
>+void igt_system_set_mem_sleep(enum igt_mem_sleep sleep);
> void igt_system_suspend_autoresume(enum igt_suspend_state state,
> 				   enum igt_suspend_test test);
> void igt_set_autoresume_delay(int delay_secs);
>diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>index b4a8c4d15..29d576522 100644
>--- a/tests/intel/xe_pm.c
>+++ b/tests/intel/xe_pm.c
>@@ -44,11 +44,18 @@ typedef struct {
> 	struct pci_device *pci_root;
> 	char pci_slot_name[NAME_MAX];
> 	drmModeResPtr res;
>+	enum igt_mem_sleep default_mem_sleep;
> } device_t;
>
> uint64_t orig_threshold;
> int fw_handle = -1;
>
>+static struct param {
>+	bool ignore_default_mem_sleep;
>+} params = {
>+	.ignore_default_mem_sleep = false,
>+};
>+
> static void dpms_on_off(device_t device, int mode)
> {
> 	int i;
>@@ -221,6 +228,21 @@ static void close_fw_handle(int sig)
> 	close(fw_handle);
> }
>
>+static void assert_default_mem_sleep(device_t device, enum igt_suspend_state s_state)
>+{
>+	if (s_state == NO_SUSPEND)
>+		return;
>+
>+	if (params.ignore_default_mem_sleep)
>+		return;
>+
>+	if (device.default_mem_sleep == MEM_SLEEP_S2IDLE)
>+		igt_require(s_state == SUSPEND_STATE_FREEZE);
>+
>+	if (device.default_mem_sleep == MEM_SLEEP_DEEP)

else if ...


>+		igt_require(s_state == SUSPEND_STATE_S3);

isn't this actually killing the S4 tests (which right now are up to
device suspend only...)?


Lucas De Marchi

>+}
>+
> #define MAX_VMAS 2
> /**
>  * SUBTEST: %s-basic
>@@ -327,6 +349,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
> 			  d_state == IGT_ACPI_D3Cold);
>
>+	assert_default_mem_sleep(device, s_state);
>+
> 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> 	igt_assert(n_execs > 0);
>
>@@ -636,6 +660,8 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
> {
> 	int gt;
>
>+	assert_default_mem_sleep(device, s_state);
>+
> 	xe_for_each_gt(device.fd_xe, gt) {
> 		char path[256];
>
>@@ -669,7 +695,28 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
> 	}
> }
>
>-igt_main
>+static int opt_handler(int opt, int opt_index, void *data)
>+{
>+	switch(opt) {
>+	case 'm':
>+		params.ignore_default_mem_sleep = true;
>+		igt_debug("Ignoring default mem_state!\n");
>+		break;
>+	default:
>+		return IGT_OPT_HANDLER_ERROR;
>+	}
>+	return IGT_OPT_HANDLER_SUCCESS;
>+}
>+
>+struct option long_options[] = {
>+	{"ignore-default-mem-sleep", no_argument, NULL, 'm'},
>+	{0, 0, 0, 0}
>+};
>+
>+const char *help_str =
>+	"  --ignore-default-mem-sleep\tUsed to enable s3 tests on systems where s2idle is the default and vice-versa\n";
>+
>+igt_main_args("", long_options, help_str, opt_handler, NULL)
> {
> 	struct drm_xe_engine_class_instance *hwe;
> 	device_t device;
>@@ -705,6 +752,7 @@ igt_main
>
> 	igt_fixture {
> 		memset(&device, 0, sizeof(device));
>+		device.default_mem_sleep = igt_system_get_mem_sleep();
> 		device.fd_xe = drm_open_driver(DRIVER_XE);
> 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
> 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
>@@ -725,6 +773,7 @@ igt_main
> 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
> 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>
>+			assert_default_mem_sleep(device, s->state);
> 			igt_system_suspend_autoresume(s->state, test);
> 		}
>
>@@ -738,6 +787,7 @@ igt_main
> 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
> 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>
>+			assert_default_mem_sleep(device, s->state);
> 			igt_system_suspend_autoresume(s->state, test);
> 			xe_for_each_engine(device.fd_xe, hwe)
> 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
>@@ -848,5 +898,7 @@ igt_main
> 		igt_restore_runtime_pm();
> 		drmModeFreeResources(device.res);
> 		drm_close_driver(device.fd_xe);
>+		igt_system_set_mem_sleep(device.default_mem_sleep);
> 	}
>+
> }
>-- 
>2.44.0
>
