Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47061E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 23:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC5010E1F6;
	Fri,  6 Dec 2024 23:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDekNNPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208CD10E1F6
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 23:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733527327; x=1765063327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zC77MRi6HW2E3I+bV4/UpqdL3zlBnuv5hbXGhECUud0=;
 b=iDekNNPAdd4aJWIVT2CouLdNzaQrnoAeTZqUhaTwmqYwyuuuTl7gTyON
 ahiGkv8J3pn77VVMfECBN4pU8uW2w88SdS0C+xuUzA3ULq1JAC1leXv29
 svR4jKONaKyN/S16OtEkErFa0G6ErOgMSN5gHQbXnBzuqb3YyWbevyG5n
 /UsxLuyFvvzgP1SDAVbufZdsq5ku1b5FPmkJWVtzlTdivs2eY31W5JFfJ
 komwXlUkn9hOsfEa/Y5Ym5eHyEtxOi7GULmOIUKcLyE1jfzdp2Hpc6YTy
 ycu1628H0+fH10B2pUvB4/4W8jZquKrvDdebNJyyvTI5L75Nre4hOmB1w A==;
X-CSE-ConnectionGUID: tIiL/ToGSKCJIjyX7bJvoQ==
X-CSE-MsgGUID: RtFUSFwORu2JwBwyEPDvJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44364221"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="44364221"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 15:22:07 -0800
X-CSE-ConnectionGUID: 6LM0V7BHQ/S96ZCIJK9v6Q==
X-CSE-MsgGUID: 9+UEoeJXTSi4W/U5J1+S/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="94905364"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 15:22:06 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 15:22:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 15:22:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 15:21:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txyDhqS5rRRfBlWHSJZRznN+6l0L4nlwRfPdwnbdA3ElGx8/FFoNo/Y9nVGTewlU5ZmKmKmnRsZVvae5xPlGWZ9TaZa0tDrRO3loZn1T6iL/EKdarYQl+rs3IKIZSI8PX19h28/MlvZ5tHpQYVzkYnUHPvXFHqU3wb2+CgXSqDRrPp1VwhmsyNng1pjEGvD3tsdZkxXiSf0r0b7tF9ATQiGCWpe4Z5+gBX2k3rDMluC7agGmUnwiqj09qhe8vukvtBLmt9+BmvmZgCB21tTrbjBvKoZ4VSKBJyBWcl0PI84duIlQ+7dSRIXYGt8a7vcYkNx98uh23jwGS6Izvz1OmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2jnUHYMg1wQTHnIyjTV6BSTeREYjuJyLKbEq8/thSA=;
 b=PUm2PQ8Hd0w8W9L2YrXpziwbE4U/WgcaTzzNVeICNDcH96WqdKr7OUVDTG8LR3cvO9WBA8rcx7piD6EWt3uqpS2VSpFyJrU5Q5PBXN6wfhAlckorF81ofxYXwKi2HjZwUKb0aFzzNOk0GsxZwCSWWkvvd4MDpIuhwZAFdWgkxyciSLy2zoWapm9x3iELdEaLWibWLWESuaz4WrMb0XeVz4IZWgkm8Q5gBh4s3pQ439NkQAejExOLGDYeL+GWgEQn5z8qvpJ1OO1+3sLCmdkdVtmyRAGchAjcDeDn/UCYuaOukVPy8mdaoXZqfmyjdFx48tCggkv1GGrQlWY2np+sGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 23:21:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 23:21:57 +0000
Date: Fri, 6 Dec 2024 15:21:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 0/8] Initial PTL support
Message-ID: <20241206232154.GJ3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: cad291d2-007c-46ca-4184-08dd164cc70b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?992U/JNO24iNuzc71NCd/xkF6/MIb/wbh/CQu8TlynkMl9IzGBUdegJZGBKA?=
 =?us-ascii?Q?qNnCqvMoSvYknu1BXYApPDZMTcIzfqzzY1iSgADeHCKKwn3RRi8QMrF1H8CM?=
 =?us-ascii?Q?OBqO6L6hJJfKZLTX9lqW31i/dcqsg6ErJ7wvvY1IOAWo13lV8bkEL5pcTYHh?=
 =?us-ascii?Q?ibdSNUbRyU8UkoAL14ZakLEshf2n2/6GcLRGCRts/3wccu5QxcekM6CVrc6t?=
 =?us-ascii?Q?SMuMxuSwbC8dUw94VdnrsAES1Q4KwT4QFDpq002WeD7LatABn0UZhOv+Zg96?=
 =?us-ascii?Q?zUmA6VuUmzhwX/7az/m9ipZrGOOH5v7R5tdOvgwo+hJs9aMCzsTn9jI58r8C?=
 =?us-ascii?Q?mV64SgDx77wQsf5MkSTyV7+ngXidi7OjLoObD2jdyTHkQ8E4SyowcPTjxdDl?=
 =?us-ascii?Q?aG7rZ0pDijyOfIZ6GFZID0J91p8rZJfPs+VYnFr6R7jOwUrHIVRC9zPdAboQ?=
 =?us-ascii?Q?1uJZu3hG36h36kXKeWduqj89WB4meuFo5OCJ9yj2a69Fv06tkJAmak0cZay+?=
 =?us-ascii?Q?sd1wC4Xxd8sHxZGphgkZZECuhK9TnrnKRsEkqF2kmgK6kXxucjPq2i4yJud+?=
 =?us-ascii?Q?ty2/GmAUUTVXrU3l5dZSsNlepvsBpZz3CgGfhSd02dyEEtYlKsTJNXZ/5LaX?=
 =?us-ascii?Q?Bzh/dMjr37cOQd6aZzhHLjQGKxSEIk6EtNZRkkZOF9P8SImhTX4EKRQHs5vv?=
 =?us-ascii?Q?z1WVUlGSjGvCNsT4qvo0bfXFFUsXFSNQQAEcuQr1XPBPChwYYPmPdASJxX5f?=
 =?us-ascii?Q?56titynLNrKJnVckqy4cmD95/UaXjTlXC0io01D81DFAcNSMkPDGkXx/HCZm?=
 =?us-ascii?Q?OMEBet0ISQl7MLy1DingaZtJu09GjKnDlXoUWeqE8Sdf6X/+F1jZEUDZojwT?=
 =?us-ascii?Q?yO9PgEFCcFmAKUhxBcAC/NqrGTAyWvsV7+NNae2qVjvjMr0ScPHSPGA3vw0F?=
 =?us-ascii?Q?O5PnYwMtMcmn68zmlguCUVSfYFzIq0BU/3EuGmUhGctQ86o2UnvqaMMC0YuR?=
 =?us-ascii?Q?XitzDlaBH7zuiULLtbh28Oc0PsmaG4ZnGVV9JRJishbW2m5nzDNaxjrtLMdT?=
 =?us-ascii?Q?P544IsheLjJnPdgXBs0whkGJvcnM/Q4jKOt0u/qJSIIEE8jkQIQRVuEs/9+5?=
 =?us-ascii?Q?/cT0ZZmnqbB5+RchE1xTNOg6Dm+PXA+DMiYoLEWx6wT0dZn+xBlxV6I9Kxag?=
 =?us-ascii?Q?6mXYiiVgBwBjoVF1egXHxqdCblX2hvhwGryWkSeeGx4YWksbdQFCUtMQDav2?=
 =?us-ascii?Q?sYjCgpFQx0/Q12GuRvnLlzfr0on1/12UuI/tpXKknc9h4oPCEp4zgvvjBzLM?=
 =?us-ascii?Q?u2pztmsj9crZ02CvI02R9yREwdmjFA+aeT7UQx6dWxy9Gg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PSPbceF3RWDB4C4+dw0WJuKgx1HLhyYBK6pczjrb7vZUUo1wPOZ6CXVcrzFq?=
 =?us-ascii?Q?c/pTj9YOBVKRp7drTuA7R/W2LqBp+GbspTyS/u/jtQuef5XhJEjMPZrGP4Up?=
 =?us-ascii?Q?elT1ASmu14wFN8X0YjCn+qx6VNTMm+9jO2Dpk1pOWyE3oeKa/qPZQbW6fml2?=
 =?us-ascii?Q?XLSbpaGmEi/hxUnJJMxC1X+37MWp77qKEgfDe2us2yirLKpJsqzJapZI5sR3?=
 =?us-ascii?Q?o15UTwbiGRNlqygyD1/DiASRHKaXXAWoxpO10ViPM3T/ukVK5w1K1SNDLZoV?=
 =?us-ascii?Q?hpdcW86EF+Pvlbv1k84RORb2MIIUi/ywnPw6ULkw9L+V/LDeqmBXxitGAB8X?=
 =?us-ascii?Q?DGPsrmZQ09PG4t6vtD9GyuhIMSELvi+q+8n2fomlEWHZqqZhUz4m/5wa3Gc8?=
 =?us-ascii?Q?jr9AsNmcs6LstPceSBMkVEKIE4JfmslNsP1M9q0h8NaRXy9RpA5QAKGGzzry?=
 =?us-ascii?Q?rBx3EQCqGYMMHZY8PrX5awItpk8VkbIvvHjLTXGLeq2TvvkqEzBNbVsXr54M?=
 =?us-ascii?Q?oiK1xgEYzL9W0rWgoumLO532RiC1nDHxnZM3twTx6sMXlXO8GWXrYMW0GVkR?=
 =?us-ascii?Q?VR3E6OD76Cv558nkEMjDZIBIxsklkTR21SWCUQ3lVm1L3krUQfe09VM+XzLK?=
 =?us-ascii?Q?e1Yx772I/lAJwXG3vY7NVrgnJqMZ0Nlmay7Rv+shGXKAAzYU/zaL0sAsL7gC?=
 =?us-ascii?Q?RlmDn5B2QU6OKZh9W9zHewAwtnKqZYQGzfOcldyOyHutK4CzUtVNMXOGbLbK?=
 =?us-ascii?Q?9m5weTjHDziSEOE/uSmDWyqWd95kO0AMKqETjcxolGJU2ppqECYQKVFkp8k1?=
 =?us-ascii?Q?h/KSOuWabFC3oIsgjnNI9xxIGTcYcTT71IArFKbbCJKwlVGPKM/51nAg5U4s?=
 =?us-ascii?Q?l89DhXXVjT7LNwFZwFufFJj3bEZUr4l/pL/00IoPYvUiuE5ubMUvVoYXEi+W?=
 =?us-ascii?Q?osaJDxvejHOUe0gu3j+XgvD1l26rCZAOlgf85p0TEcoqamuWRQf2Je16q7ab?=
 =?us-ascii?Q?PAXmCSI198dRyh/8/pZOyZCiVn/8lPOdComY0NQqf0vUlL/h0ScKkLI9EXcr?=
 =?us-ascii?Q?tbejdfYSSSgc7LzPlvqFTJsaiO3OpeK8l3fIa07BPChbuJDHifURbv3zmVEX?=
 =?us-ascii?Q?EXMgX0v1cR4IlysytBzq9fyAeh/nLF8Efz+THjkdozu7bX3bLUGIn1WBT1Xh?=
 =?us-ascii?Q?iQBP3/fwdHw3jCunGZ4TzdxTmxORNJBM+9FkLUaIor0vGhU98ggPYsAfFdhJ?=
 =?us-ascii?Q?HnY0+/DNN1UmpIwRZTBi0S8rOnVau9z0pkD1onwvuSJP4aI4K5uij55SmFzX?=
 =?us-ascii?Q?iXqv96v7+5NQOmDgintOCYCv6aMuvXTYqeYooxV36Z33Q0+tqEwLaMyvLcs5?=
 =?us-ascii?Q?yQa7GYGNBT/RF+cqZ+z/csDM/lB56QP+FgCdCKDv67D2hpxrG9J6O5W/jG8W?=
 =?us-ascii?Q?OAV8pmTJ7tTbkq8UDBBrh3dVlic3IpsJisD2bqP9mRxbdlfrR+cWxHCSKtF4?=
 =?us-ascii?Q?xYsqh2AT523IHpdpeux1yE3yG5ADw0DQyzyaXxooNr4Wus59DOQeTv8v0eS3?=
 =?us-ascii?Q?pcJ+c56Jjs1c1NW54E63UyDdU6VLotLzOMFM35C5ET04O+QdrToUcHd2kJUC?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cad291d2-007c-46ca-4184-08dd164cc70b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 23:21:57.1175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0vXifJ7ZQOHSDDZLLRGZzhLJjITxX9DJl6blGG3dNOlxY4q7YSIi2FMAd9y+h1rB1Nho6B+JbbkxD8FFd6FMvnBnj2l0s/Xzj++7vokToQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
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

On Fri, Dec 06, 2024 at 01:27:40PM -0800, Clint Taylor wrote:
> Initial set of patches to enable testing Pantherlake.
> 
> Heikkila, Juha-pekka (4):
>   XE3: tests/kms_addfb_basic: fix x-tiled tests for case when there is
>     no x-tile
>   XE3: tests/intel/kms_draw_crc: fix x-tiled tests for case when there
>     is no x-tile
>   XE3: tests/kms_cursor_legacy: flip_vs_cursor_busy_crc was requiring
>     any driver but used intel x-tile
>   XE3: tests/intel/kms_frontbuffer_tracking: fix x-tiled tests for case
>     when there is no x-tile
> 
> Matt Atwood (1):
>   PTL: lib/intel_chipset: add pantherlake definition and support
> 
> Matthew Auld (2):
>   XE3: lib/intel_pat: extend for xe3
>   XE3: tests/intel/xe_pat: extend for xe3
> 
> Vinod Govindapillai (1):
>   XE3: tests/intel/kms_frontbuffer_tracking: platform based handling of
>     x-tile cases

It looks like all of these patches have unwanted "XE3:" and "PTL:"
prefixes before the real patch prefix.  Those should all be removed.


Matt

> 
>  lib/intel_chipset.h                    |  2 ++
>  lib/intel_device_info.c                | 13 +++++++++++++
>  lib/intel_pat.c                        |  3 ++-
>  tests/intel/kms_draw_crc.c             |  6 ++++--
>  tests/intel/kms_frontbuffer_tracking.c | 20 ++++++++++++++++----
>  tests/intel/xe_pat.c                   |  4 ++--
>  tests/kms_addfb_basic.c                | 22 ++++++++++++----------
>  tests/kms_cursor_legacy.c              |  2 +-
>  8 files changed, 52 insertions(+), 20 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
