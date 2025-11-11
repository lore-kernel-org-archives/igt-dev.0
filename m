Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1D0CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 00:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB95A10E243;
	Tue, 11 Nov 2025 00:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwHDw9Bg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A2710E243
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762821609; x=1794357609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rXCdzDaoTI2oSUIcbPpijvMpcjiRLAXLoo5Fhj0Fp1w=;
 b=RwHDw9Bgrvs+fQZ3DyBk+koY+yhtdaaiawkJafoNDQb4vPzv1+Auo7+S
 SPj8cXgAFzwLr2ULMqd8mnT25uVr90eTXaxpWzyKODauGafqW0KB47p4X
 ifkIAehR6Y4Wb+XNjv9T8FaDjdlFls2IJekFRrxGvp9yRi5n4K7MUqYuB
 +PjXB3G2dMpoUbMbHC66zzjpOtZkVUMn7vyCxWd1FFeDRr1Beswc7CyJ5
 VduivsVSr2YToZwA6DUI/YFr3QVpmP7UelUf3iM7w9xXQxeVpym5M/v6g
 z/nq5Anrz+wNJ0x2/gTw/iu8RmQ5aMZO9/xY63k5YXXfPb2bt5ve/IyP5 g==;
X-CSE-ConnectionGUID: KicOpVZkRJCI+ATLGIXH2A==
X-CSE-MsgGUID: 9DVtz5HsTxiRCINcbQXpnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75491276"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75491276"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 16:40:08 -0800
X-CSE-ConnectionGUID: GVsNx+hGQkiBTZmLn+MZXw==
X-CSE-MsgGUID: h8zCD1+9Qpm/AnrY9xBCsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188651387"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 16:40:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 16:40:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 16:40:08 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 16:40:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbRnF3g2VTRdCKVXrhgURdQBIlxDCB8LjVtDjC485CHDClSt6D1uDeWbulBohzEvtQUEAXPIhSJICvcTRmQvjOABb63GzFKWY9RM7fsSWcxiIU9JLpKK8enj6PxRbpf07dsjlwfyHT7K3doKhJZCsvnPCEgof4ciXJBZmeV9jd3qdV+yJX9uQJlXV0+aZRefAxo4/W2tgya8wa0gnFu4j6nMIrLdGBtWYGJpGYsHELZOwKL/dcVku7279KWLjFB5w1adqGlk3EVOJrmmDAQlUJSzQSFFBqmZ/8LE11by5hPwpH260ekHTt2jZSWXPTdf5WmMYmuiSG3kyHHJ20yCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76YAe1ra/XYL1UHYzibgPHPtW7+bQtblkhM4YmOPpn0=;
 b=tXSmRMjLjdr67d65F96rei5C1gJH4ijNC/HrFrtWDMkVb8xPIPdwaieX63R48ZYGIh7Dafxy100gMuKwmJh6zWRmDwVCJ5eiD+Ab4UA+DzvrMcnKT3xuyTfrXzOq6bw4Ul8DMlkPvl9iXvK2Epm9NS064qLyYYNLRzRT2dkd4bn1Tm5aJK6VPE/mvGw5tL9t/QdIJ438pG8N4ZU9Ra8VsZT2KV7EQU+oAbD07RdQf28/JcCRPBTJSF+8PYf1iEF/qDXFQQM6YzXEq0lG0O7NWxKL8yEceS9v4Y7Dc8pM//JEAsdvIBo7R4TLngObNCV7KDBpf98YDT5FurAwXV6RRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8481.namprd11.prod.outlook.com (2603:10b6:408:1b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 00:40:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 00:40:06 +0000
Date: Mon, 10 Nov 2025 16:40:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] xe_exercise_blt: Insert a flush between two
 consecutive FAST_COPY
Message-ID: <20251111004004.GN3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
 <20251110135805.3620715-4-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251110135805.3620715-4-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:a03:80::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: ca82b165-b334-4002-59e8-08de20badc01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3uQ0Ts9/KElUavPFqC2XxppNVHy3/KmU3a5FBRwzLSXsrkSrJyR64VUvP8r0?=
 =?us-ascii?Q?COAe2lbqMYFQoGkQaWwrAG6wJmEXqydY1Rte0wsNhCmFEjwsinRMzlwenE7d?=
 =?us-ascii?Q?qejCyhzSy+CgB+IjURbhrEshmZZBjvzFia0DtD462sjjY4rCW6oQJHBQ76DB?=
 =?us-ascii?Q?vpvfg+SwWxjD0IOlITZUNbNCtX639X9Atff/8QC2LwpWjb/71jHRSnSN91cg?=
 =?us-ascii?Q?kRmgF5IBDg2FqDne/VNj6hiA7ZAgKLxfylzIbiwky2Gz/nvXRkEvsmfxW20l?=
 =?us-ascii?Q?CaLMjpAWiVxWFroEWRv6RHIigIOfekTSBn6DB9hP0RtKbJpYgC2oeZPCywYh?=
 =?us-ascii?Q?tFU0Ejn+BUeP6Y/22OekeyBuNsa30my11mf/9LnowchysC9cylBGYin8JccH?=
 =?us-ascii?Q?xs/13b6AIbd1MZEz+PXMZEFsqCjTdNInnwJV6uJFBexzH1QLtV2sDfpkL52t?=
 =?us-ascii?Q?yZMT19n6HJIscJgLYYKqT6aicJOzee9aEtN35b/XMDbSEExzLPUhzzXO/sc8?=
 =?us-ascii?Q?2w+MUrf1V3XK4ckKDyP5a2rZZtQ283V0BWsRRTn/B1QpEiKTzVoZfPay794a?=
 =?us-ascii?Q?L26eL+RJCYmV9tgwhI6N3PnJzEm0puiyMPJLvDGyfMK5Q0f9LEkEDVbAkj/D?=
 =?us-ascii?Q?lWvijc7P9DzZgO6cZblHrSNDvgiUjnrr8TXa88eW1uhbYdjh4TOgGwMuLOKb?=
 =?us-ascii?Q?2Q5ia20EXYTVIEdUM4laOv1LmuAKfBZy9m0i4+x0eJ20mfy6fMvs5exbGsWy?=
 =?us-ascii?Q?pqZiPKMhV6KnStigVz17HI/V3eNoV32v/JHTWiatvbPxaUeVQimkxfI3xaWh?=
 =?us-ascii?Q?Ce/MryxRcqwv6z5VKKhw+/XcxjfEJCC2jetRpLqxCBy9LaAX0JuAqEqndl5X?=
 =?us-ascii?Q?Iddnmq2lnOA9ANJwcrRlT36TA3aaTu2/0kayt52/7QsB6Sfw0ApdIz27Qh8Y?=
 =?us-ascii?Q?IZnyvxnbEUzdCpdnoUNhUuD8nm00ZQlzcCKi/xDzGEjn1B1GtDoqEsTvnbHa?=
 =?us-ascii?Q?JLpaMBq80fziPQ1AiJKUphpVe27cGWjN6LjKNcMJJ5i62CMyd58UwAM16Ryx?=
 =?us-ascii?Q?KzZoyaLLB+V3l0jV+BMRvCaBdNIBsg9lORcpI4EXDptHTHn9NFdSfNvxh6e9?=
 =?us-ascii?Q?I/i8DilWiDxUfK7yTQVvBpauiW/FTZhBDWi3s+kHFMbTwhDt2q3aqQKozbXw?=
 =?us-ascii?Q?ISRNCORP7QbImnmhPwI/hy+rwuqDvFAqHrZAfY+XN1f6NLrWisIiB8GKXwFB?=
 =?us-ascii?Q?dtCzbhEjjG8P8tbdiMF/2im2LAHUxZpNnnoccCkIuR771roZVTeoNRlKk0wV?=
 =?us-ascii?Q?G2XP410InA9NS7hSNYJa0oDTRi5s/h0RtDewOAQ39uL8yItHZyc0PcBdeIoB?=
 =?us-ascii?Q?G4fKiOxFk4o7h+uJZ+W1KfU5Cmx83eyd/bsPSjnQNXO9vWq3DbXFNr1xF00S?=
 =?us-ascii?Q?RKcFZpZZM5e3lgg+ArMTn0m9O8WSMtGt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2FTznIcOHNjm8r59MBF2mZjFH04qFjoQryHcGmptD2Q52gDFDwoWhGCD6x2H?=
 =?us-ascii?Q?Ts7mX7+yrRUUOwdhWKsJmgbb5I8DPi+UlRFOticSdAXK+ewy/AiKgDvnWKNC?=
 =?us-ascii?Q?YplLuiGXSk4pY9oboYDeHK5K0nyk7HjUp3gDTzR0rxjui4dg5xdgvKhppz6n?=
 =?us-ascii?Q?wYv5mbNprqCj5so9TjOihLYH93Joi1DrODYjpa/cUOlUvLeQmhEBd7lxkxyq?=
 =?us-ascii?Q?8SkGoh2htPddhFf29xFmtniBLU3oQF8RrjuAi1JurflY4T8YYAupoSf8hfQo?=
 =?us-ascii?Q?Z30Ta99OJXYeSDIMQTTiCh+ci4dlpcmozfG4/lcFoEE1vVr1SC3rbAPuR8I0?=
 =?us-ascii?Q?U/rgSiv+ERrwutZBlhPpgWTr4bD3AdVi0NdtovHCxO/EdgUf5F55+OnNVZOd?=
 =?us-ascii?Q?UNBngs2hGBiFaiDaPsFz6N3aChsUSYFAhcnFVQ4omslRdmERHHrNcLoV0nrk?=
 =?us-ascii?Q?jOP4D4Hgyfa7Ewsw8y+QQdAxhW9cQ09QzMCh+EEKSYKNLHmLRRDMsH7nENLQ?=
 =?us-ascii?Q?Um1M/w6SIFMQF2BvvJmf6hvo526cY1Gr4wV9GKAOJ4W0YcTN4RcZuy8v0vXr?=
 =?us-ascii?Q?L7Gh9D5EVLsOtHFBEW8g8nZ+OzaOUOFjisiuJsMxqBq//8j0nwZI2jbVIKQ0?=
 =?us-ascii?Q?115f3cb9iMas/tVC2Qh07CfcX15/tF1yK8um4lTw2Sd0PlS/5krzs54J+d7j?=
 =?us-ascii?Q?NTwK+EdCMwo2+wvA2r3mdzXW7lWMZBMdMl7Rluj+WfAtWDiBdu5rbcSEiNi3?=
 =?us-ascii?Q?sOT+bCId/AY/gITWH4f7zmUdxrsTvpWKyyuE35g6VPSHmU/KCOqvbb5ovOpp?=
 =?us-ascii?Q?Vi9Fe2nkY0eLFP3PbIIDQz+6ONHtqB1BLzOa07He/wnASdumrJ/bvgDI3iMO?=
 =?us-ascii?Q?LrBiawAHLigifeZMrvsBQ9si1QqrIWFa6orDz7Zx4rb+uw1qTPcG+nbnI87v?=
 =?us-ascii?Q?eHjjgnFhEXqsIulv4gxsOxSq0lvuhQtoD0PAUAf/3B2ufCnhSTM4BHwwna/V?=
 =?us-ascii?Q?3xnlerZ1QCOmFRjqUzMIMUJHKm9ztJgyKZXYbSeABO4SVbSRxnz0yMliQRCJ?=
 =?us-ascii?Q?grVmq/VSNucspCsXNxcLAzHFFbtqCQrIyXkRvzCBhX0kGGE5LsTPNqRLyNjV?=
 =?us-ascii?Q?GIOMmdzlzmLsrbb0eVvTTXdb9h9ryMsXwgNPBlcz38NxgHHvewTytKQr4/e+?=
 =?us-ascii?Q?uqVCNNvc1B47zwm8ELmanzquIYioHg5GCzbdJuD2w2QFBXqrKkvjODWB3XLh?=
 =?us-ascii?Q?PZByKF+85FRcUwqjYGK/BSk2ZPkjMHpJhV3NvUbkGracNa+tEo2A7vMrP3XX?=
 =?us-ascii?Q?R7UhbkXvkBxTRe2fjPrlsnOYf1QKfkK3xwVvDKsn2j+rrK0+ST8qNZe2EKgI?=
 =?us-ascii?Q?o45rYKxQ0mXOa9TRnCvlMopflphCJg3Sw3ZZqKk6+xxVWRQFMqJHRzeSUJn+?=
 =?us-ascii?Q?z1yHo3NUTKrHuy4TPUQoqfL4Vf+i75Dxo/1eqQhOnH5FvuuDIwW7NvU5QTyZ?=
 =?us-ascii?Q?+gGks6j58U6AQ8TOLSQQfqlCCxfI45uPcrQYtMVKRirfoYPUSqNFgo+o4dco?=
 =?us-ascii?Q?d0aKwqrgKpS8KltBVXcPx2GbbMJAeVO+zlFHkTmUdjvG45ioBQdzgFNyg3nB?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca82b165-b334-4002-59e8-08de20badc01
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:40:06.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikYolG/eit2BkELHjt714BkYF9POpcO/6pyGMXUiK8XMFPdkmxA7peTLGHZr3AnWBPVDBmgphHIiBkM0dfZtuYLnSUa5aeJUiu/LSlFVg70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8481
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

On Mon, Nov 10, 2025 at 07:28:07PM +0530, Balasubramani Vivekanandan wrote:
> As per the spec, a flush is required between two dependent BLT
> instructions. In fast-copy-emit, the source of the second BLT
> instruction was the destination of the previous BLT instuction.
> Therefore a flush is required between them.

So this is effectively a read-after-write (RAW) hazard, right?

> 
> Bpsec: 57567,57555
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  include/intel_gpu_commands.h  |  4 ++++
>  tests/intel/xe_exercise_blt.c | 14 ++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> index cd281ba89..f6d367442 100644
> --- a/include/intel_gpu_commands.h
> +++ b/include/intel_gpu_commands.h
> @@ -445,6 +445,10 @@
>  
>  #define XE2_STATE_SIP \
>  	((0x3 << 29) | (0x0 << 27) | (0x1 << 24) | (0x1 << 17))
> +
> +#define XE2_MI_FLUSH_DW		(0x26 << 23)
> +#define   FLUSH_LEN_DW		(2)
> +#define   FLUSH_LEN_QW		(3)

This isn't really for Xe2; according to bspec 6997, MI_FLUSH_DW switched
from taking a 32-bit address to a 64-bit address (and thus the size of
the instruction increased by one) all the way back in gen8 (BDW).

We should either make this something like MI_FLUSH_DW_GEN8, or just use
"MI_FLUSH_DW_CMD | 2" down below like other spots in IGT already do.  If
the former, we should also use MI_INSTR rather than an open-coded shift.

>  /*
>   * Used to convert any address to canonical form.
>   * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index a545654d3..06a2eedca 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -86,6 +86,7 @@ static int fast_copy_one_bb(int xe,
>  	uint64_t bb_offset, alignment;
>  	uint64_t bb_pos = 0;
>  	int ret = 0;
> +	uint32_t *bb;
>  
>  	alignment = xe_get_default_alignment(xe);
>  
> @@ -103,6 +104,19 @@ static int fast_copy_one_bb(int xe,
>  	blt_tmp.print_bb = blt->print_bb;
>  	bb_pos = emit_blt_fast_copy(xe, ahnd, &blt_tmp, bb_pos, false);
>  
> +	bb = xe_bo_map(xe, blt->bb.handle, blt->bb.size);
> +	/*
> +	 * Bspec asks to insert a flush between two BLIT instructions to resolve
> +	 * BLIT level dependency. Though the spec is not clear in explaining
> +	 * it, HW team requested for a flush instuction between these two BLIT
> +	 * instuctions as they have a dependency.
> +	 */
> +	bb[bb_pos++] = XE2_MI_FLUSH_DW | FLUSH_LEN_DW;
> +	bb[bb_pos++] = 0;
> +	bb[bb_pos++] = 0;
> +	bb[bb_pos++] = 0;
> +	munmap(bb, blt->bb.size);

This feels like a general facility that should probably be an emit_*()
instruction somewhere like lib/intel_blt.c so that it can be used in any
test that needs it.


Matt

> +
>  	/* Second blit */
>  	blt_copy_init(xe, &blt_tmp);
>  	blt_tmp.src = blt->mid;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
