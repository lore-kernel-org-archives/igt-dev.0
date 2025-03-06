Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6088CC282DE
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 16:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148C410E826;
	Thu,  6 Mar 2025 16:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSheRj4X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295910E826
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741277476; x=1772813476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+CkFXiCBNJR8ozMJVpTehBvN/bm6Bx/URaoFalPwRIY=;
 b=RSheRj4X6BUkLoN0MDvhUiiTdXx2DupouQG/9p01Fwo4t0hgtVnahz/x
 OhO8Wq4wu3MP/F+IewMEc5BRZe6rrV8J6vVwRZ6/aqWeQ0CPHOZgUPkAF
 flhLjHxLaQBt9alWeRvlrXTw7Hnscocb+2dr4fkzbQ/E6qUTzOXXRMzi2
 yxKK4al7P7I05ZkarGlfZad7y1yo5Q2GMQp7dQh3uDLMJ4w9qMzv3F91h
 JS2yzbVD2fHiHrz62l7wijStz1bmIltho8Gd0Nt7bG1/liQQktVcP/NbX
 Wq4Zm3wdXP286TfDwbR69RWVXYsH9AOcDInuG+mgR36ORUytHU1VMcU3P A==;
X-CSE-ConnectionGUID: ZB41z2lgTeWB0TURsBRi5g==
X-CSE-MsgGUID: a/6SWhtsRe+RvYdYq8W8RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42495808"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42495808"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:11:16 -0800
X-CSE-ConnectionGUID: n2qz6xPcSnSLJCbASNzg+g==
X-CSE-MsgGUID: e/+OCWHcRKCmuoyW4MgNzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118983433"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 08:11:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 08:11:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 08:11:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 08:11:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWcVqUjw+qX/U+7bKDUkT8Ho8lTWh1r+xfPIU1/ndQtwiP4jWNb9fFFJmsIBSYNNeYVGYlYaBWPIjAnVTix7NSdop/u/aRRtQVBm6lRpyVn898LvWqK37q2HnrCwaqlpMitZqs346EOjuEOa6nIDvwuyRFoPcZd+r+j7a7VFZJBhM/9UQcyvqNuDaDSFalUI6kSMjroWbWD6a4f0U+UrH/MW8tAX4hhZTf9Uc+C2v9+uKxYQ84iSsVmh4VrNfqNjQV+6vh8Jqv3JQQc2RCRHGkALFNmKijjZ/QLHkdscod5BgTOj07hd0ALr0CBs4+i9PO+7c3c3cfecmIsIMht+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YrpNUdytGmOt2pM+2oKVLb/KYm5Xw7HIH/7Za0bJBk=;
 b=s5KWQskguNiAXLO/XcPvAXAr4QtbCMRqJoFbbu7QgFMoYcygr5vhr4huP86c/v9N/RPlykcDk66Nx/t4aza+eO/Pm1CJ/9/C1HD5Gky7yUrygHw3MHBmHfpU4ps3fYZvTvGuWu34vMvvH+bzRcJhmNgfjw9orz8I7SNLTG/bnsb7V9S11tEy68FuX2fkM6G4Q561IDNE2WB2yv+hhn3uOJcSJyRiWbM7zOKxI0DLj298ECMFkaOe0oEOOyMGOvBj9Uwuw356qg6pR9P4kcXZMj2ozSsnH/T5JXMcBFRN+hpBNf3EXeYU5E0Jd2g8x0MdeRfZPERTBjoLvuHE4/Hlsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Thu, 6 Mar
 2025 16:10:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:10:44 +0000
Date: Thu, 6 Mar 2025 11:10:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Message-ID: <Z8nJAIyhgqhVUph7@intel.com>
References: <20250306112754.1483363-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250306112754.1483363-1-soham.purkait@intel.com>
X-ClientProxiedBy: MW4PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:303:b5::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a9c800-e991-4fc1-4834-08dd5cc972a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V0gR7FiezT3xe8hrwlKJdsOjHjSRWtv6lDgvSuiRFoO5gcPpGWL93VUIRoP1?=
 =?us-ascii?Q?R4DBhte9rwIK2u7pUL9B+jIXJ14Iy14HqX0FU49sXvOnwv7ADhb+kTwWzRUS?=
 =?us-ascii?Q?5xAer8wZMiJND1j8eBrThlIedR1q4g/iSIXTMVpzo1Z6ZyJ6PlWd2fztXZlB?=
 =?us-ascii?Q?h8SQn/D6EaXZy3AA2IK7nCwdL3ounI3AHVHDsj+DvTwafLK3gPmXB0zl9ca5?=
 =?us-ascii?Q?UEAWn55ZwbTdOKWsI9SN4Oob9BOidQeKME42zsfAcZKDXrJxC471eiPD9y9t?=
 =?us-ascii?Q?Mfr5iNoL8M1ATTRYvXlQpZaFc6bwyXLwv7KvI8j9MLXduM64wi/C6cS5TTMo?=
 =?us-ascii?Q?uUH/+c6rHdie6O6YZKePyMiHXPfU1/C1Bk3IqXBAueH/WTScl2vWEQMcgyO7?=
 =?us-ascii?Q?aH3fgiI/09xtb0eHRBz3IW63/yGE5NMz/E//BUBkxHF9Ns+YhfBFEUpEwneg?=
 =?us-ascii?Q?w+ucuuul3X8vjVm6dbvtLBWnzUdrX8S5LCNUmebJlo4rVb67QzzvPmIXSxTI?=
 =?us-ascii?Q?/+V5bFDFAZ2gIT+dVZ9wTVY8IYP+UlhL6PuFA/s62eTuCzQ5A5l5XpP2UGMQ?=
 =?us-ascii?Q?V0nPqHw8FbZG7rdbmzaEf2V+2XWLJnPT4dEjw9A+1DXz6mcsm/K90C6GzUP+?=
 =?us-ascii?Q?tDhcla1y+flZM/tNjAngK3bskISEZRWYvbU8gq3oMwF8BvIE9NDAuz8wMsIr?=
 =?us-ascii?Q?H6bDJN3sVnXYgv+cM6j7/kdzLPHlB8DHE3yIf9kLSy9dvvGHCuYszOg8apOb?=
 =?us-ascii?Q?CY7yvqjQAzcpwWRjFldIUPVryZIi0d5iy9fIWDjyP3Wnr3l5Qg0gzBldZtM/?=
 =?us-ascii?Q?Ga4LX3cpKt0sgcIziogKjOtYekUEGplfnrFXn2BtekCroSYc+cGY0oLOZRXk?=
 =?us-ascii?Q?c4psWXgZ7V0AfNpBV+VxndmOqSupwW6ul1T3yDXDMaDY0kIqI7OZvBKPEL/1?=
 =?us-ascii?Q?G39V4r8gOisaby57mITFbmvhbo58WcUDhRV3Nktm6Su+JQLhD84uoelJi1rr?=
 =?us-ascii?Q?vGSyqyFoJWc2zJeZlzUwc9uehCvvfy+gg3fPHRYRK+vIhvUQkXqh5WkTxVG5?=
 =?us-ascii?Q?ESRUmFJvSIxaZJ2U/xoW++ZkiEG6Ih+lwnINAF2Q3uxmAC88qzX4LXsMdjUI?=
 =?us-ascii?Q?6vQkVsitMJo/cNjc2ApFEJtA2zgwbAk8xYPt8fJmmXifO59hJlldDrk2QdlN?=
 =?us-ascii?Q?nSF4KETpKOoCfLqOzakSbLnLN2A9G4aRA8zzJ0Rgi1eHurNy1V68NifDmpj5?=
 =?us-ascii?Q?TRiUYGasbs1UIfhD8OMvvGWVygvoPdLF83NFLTlCbKZ9rqTm7VBYb+Pq7kSs?=
 =?us-ascii?Q?BaGDKtkzV1+HpHOMwAb8hvUU1yGtq/AHWr6KB5hbdp6ZI5WG+UNaECIqjiId?=
 =?us-ascii?Q?TklzhlJpI1V4xeaWQPgnLN6mgDu1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7368Qt3Z9Zb3IGJDe/168IyJeKeCU/qNyXWsjQbA1gbBDR6Gca6JmXqKe9xD?=
 =?us-ascii?Q?IYdUD9X53TCjdoe9XPJs3QDMVqeMWnJlGh+nWv5fHCDoCttD0xocQFY/9GGg?=
 =?us-ascii?Q?QfgXh0Y+elGB5gtCIAoUcJf4yOM75R7DcmQPh3A3JW3gJ6ymZGP+lR+Eut04?=
 =?us-ascii?Q?NMRuvkRMySDhdFQ0er5lCF+0yP5zlNa0RXnLnjzgzXFaGbVzMAhW95/3PuXB?=
 =?us-ascii?Q?BBPujzeIWYjGXYlEFWu3J9dzskJPOrl8l8KfHzajK6xosWq/70VP3if1zoUf?=
 =?us-ascii?Q?qom1PLguDWBoXZldcKwLAUoiNXsTdMrB2HDgXJSG+LSWDB3N98jH1GL8DRd1?=
 =?us-ascii?Q?mL24wD7r+67g7D7nO4nEGlXhSwujKKVzutPjSytEqohmXfrmGcGpheXVY9Rl?=
 =?us-ascii?Q?4eRBWk7ZL0oXJjS8q4oJ7lMOWu04v6bFjmS80i+RLBQDHZa3pUMhlgk9YXPv?=
 =?us-ascii?Q?fsI5Y9XIPVSBb9WvavJIH3PG1yhgoHru76TczWKep82Szsl0/sQnmBCiT7oK?=
 =?us-ascii?Q?PHgSgdf+I4u5hG4WUCEhWjajiroQsiHyuPN/0WXfr6S61rK/IBWEGfJocLWp?=
 =?us-ascii?Q?bOK5bZV2mFjDpgPZnNdxZLPC1kyGow7rMDICjYTUT8KIaxVhY8jLOsKd5UND?=
 =?us-ascii?Q?CliZKbU81eBKCnl3o3BIRc996kf49z6+9g0Kgsnc/u4Nozwqfz6PMhHyKFIq?=
 =?us-ascii?Q?ICE092ohBpi5i8ykv5dE/hEcwiX6a2yaWQJ/L7i1qRrZu32IRP+CU+TZ9HvI?=
 =?us-ascii?Q?KEGrE+vKVuFy7SGkLfccOLv4yvaNRM1KjxsCVLkuZY6LQRs5cQxCGBrCKA/A?=
 =?us-ascii?Q?piSBt8gSl9WDFmVgV0u30KvotubVWHHIfb4kXrDYKYFhgTHsTN90g7rHLziP?=
 =?us-ascii?Q?Icebi7ZxtjAPcVYw5OL7Os9clMiWiqeiHaSzcmxeyGPE2z344LeoS0cLmIy/?=
 =?us-ascii?Q?Ramit+7gDwSzx1nXFCMeUycoX5IieGUFnLOnZNRLmgrUiSxsdanKqmGJi682?=
 =?us-ascii?Q?9XwzZKBjCsYDTDcqoG6wlj3ZHqrAWM9zXexMrLPb+pDCwjZ69wiO67Q3vaNw?=
 =?us-ascii?Q?XCoLeJhQG3JSzUJTzImCvAAC/6WeUu5DDPjPqoRDHkfS8kymwLTya36Evn4j?=
 =?us-ascii?Q?szLAgnREq8cJ5yRZk+rscmbA0d4RRwEgEjP5JrnLFmYDfQX6Ryzhqn46L/hF?=
 =?us-ascii?Q?B7BMmqm6VMYdQghY0K5bkg5qBLNyM7WtJQRwAlmkt1zdmU8pZ3lcyhZZsHL8?=
 =?us-ascii?Q?JnJVnuLHMXGWC1l8PPGecSl+ik/XBFFKnKk9uJ1JFPpLqzY/VUIWcanRLBJn?=
 =?us-ascii?Q?0kukof+EoFJclOkEw5OnOwL9liiyuYRC+THNw9Nt+OXQQY7rB64dDxjhaQGw?=
 =?us-ascii?Q?eOeooDXT/qoqefZbv5hCb14HjO6We4bzmqUepuey7kXhqICisZm5/Lz/oKQS?=
 =?us-ascii?Q?2ZwJtO+tu7n9mJhFoNKXz/dcFNgccP+ocYRgO3sXXkvh11v9tZfZA09vgaC0?=
 =?us-ascii?Q?mT51QPgDdWRzH4Qd623cvOahEZUCHPmBiDijKPB8RLoIyElMw8vTRwuY/LFv?=
 =?us-ascii?Q?5CufZ1HHYThsyqhtoLgxM+GG2a7Aso5ddCR59AZ6QnEOauB28R9YCY/aFBQp?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a9c800-e991-4fc1-4834-08dd5cc972a0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:10:43.9595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMIglKCkWX+lnabd9pchy1tYu3QRTrdPJTIAqcjkHD/uK6Egk8j9ywTtyQ6FwNR4A6DfljylBD/eCVkrg4ysSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

On Thu, Mar 06, 2025 at 04:57:54PM +0530, Soham Purkait wrote:
> Add support for runtime power management
> for Xe driver.

Why?

We already have that covered with xe_pm d3hot and d3cold tests.

> 
> ---
>  tools/intel_pm_rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 08c25ca8a..945247d2e 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -151,7 +151,7 @@ int main(int argc, char *argv[])
>  			goto exit;
>  		}
>  	} else {
> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> +		if (!igt_device_find_first_i915_discrete_card(&card) && !igt_device_find_first_xe_discrete_card(&card)) {
>  			igt_warn("No discrete gpu found\n");
>  			ret = EXIT_FAILURE;
>  			goto exit;
> -- 
> 2.34.1
> 
