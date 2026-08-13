Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B32C5CFEB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 13:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2F10E4C4;
	Thu, 13 Aug 2026 13:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5MuBaMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA33C10E4C4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786629457; x=1818165457;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RjzQPHWGYQeDV+gfSPxdArtBy2YANeAYPoGSbBAEupM=;
 b=X5MuBaMvAEW4o/GtSVcZlPIOT3ckTo2ObCed2n1ZX27YeSnoUvMLZJZD
 ihVYh5fN9QdEdqupGxWbKN0pVMamus6r81YA6GdjlbhJNX7S3i6FcMJjs
 LoGUoEQVBjjyVbi5NuseWYs7wH7i7Uuv5lgHiQYY/8fyD/pvznT0t0Y1N
 z0oMWOTMj+AHnvhMR1n+XttbvgoQZTEKrxC4kpwNhFhkr5AAsJt3mOBOm
 s0mf5iyqcEjbL5zPBdYyk0Sc1hB9Me/2wpfTmbv1dtarOR2P2Z26vWEwm
 13EyfBNK6szY56JHuQRPlyKt2kdeQdZQxZqzwvy2cdrLXAm/9CedrUtt9 w==;
X-CSE-ConnectionGUID: KiAGNDmwTNiijthYTn5G+Q==
X-CSE-MsgGUID: bNH+dDVuRaipEmPglC98fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="112746329"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="112746329"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:57:37 -0700
X-CSE-ConnectionGUID: 9qYS5/HNSgmb4Dz0+GeG+A==
X-CSE-MsgGUID: jr+Dqk4tTHKFUPKjVJUVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260675733"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:57:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:57:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 06:57:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:57:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6AgqHgA57awsuE3M4mQ6ZAyRqyeWaXeXCe3DNKTVAz6efDRzo44kPDpn9Is2exuTTKAedyjTCNprinafGW4Xewf16C5W8RV6/l9sHYd1KfgTp3rHj6G16N0LoVeKQSocGrVGJTmc02e23MKiawDym7bUR4vT9GfuEDixTdu1ALurnP+XPCvKXnG0YyW/oLNNf8FX68f6iForhApSaIfAUkR09UaylOsqWcEgZ7/26Uo/YpzjrQ/p+hoM66/5G2DFtTaT8SxPFu0BhZ5Be9LJqlvfOMkOASFeSeNxX+Hx3N9PaodegtEOjtukvZn1eagfKgBU/l8P2ssFaEBltRUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ1ds5rN5eGc+7pre5QHgpICKcTvf0GWkcyn5cGL0ng=;
 b=M8vtwxge0fA+Ktyjp/LG46tPsnHEsS/Wq5CntNNdvcs9Kj/5eRY7ot8D2bhXcMVGlH3knhcQVLxH3uyzbU1ZKoUme+tkm3h+Se/a/MCfA2dgKfGjkcZ7foIRaNc1YjW/YSExbIWB7Rhv1/y1CpJU+WExFfXgNMrYSp/Slqc7Ie+w699QeHXoxob/+yN8K5CP+11IkKrV7cz4+RaCN1MPAwFbxYPLVnmw5C2Cln23yDMGSIbZpfnyYvbbJBNq9ab8NMMUmvXoee3/NA7SF+1hMOH7R8NL6ihGO+xYUDSqVim+CACMd/Tlfd15uct8ejSe80lUsieStfMHdOxIFdv5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 13:57:30 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 13:57:30 +0000
Message-ID: <2e17e3e3-2fa0-413a-920d-1c6b55e84bba@intel.com>
Date: Thu, 13 Aug 2026 19:27:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/6] lib/igt_kms: Add FIXED_MATRIX_TYPE colorop
 property
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
 <20260806120345.19406-3-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806120345.19406-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0268.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 10af2c09-18c3-4fa7-a296-08def942d0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: W0OAw5iOrFb8nPm+7W73lO45EB1Ln3CFVT9ZaayGmEJoFI+qgLbvRXF5SsUtvQWBgNnF1S2ZJLIoyABm1ULaX5GI0E0dMRn6aKPdzITkM0lZ+cu/dq46aJjuomOI/hOfU/fMJoIF7Y/v6NZYsX9wDyCvJd4IyD9wAGemQEBQGbOBku3+fYnYWArF4W9BkPaUYjW0+/kA+giWyG28IHDgfW/xdFisDt6XecIm3j+n/3QkW3hdDLcRCZ7v5IzxLO2zH5mduJMFr4CtObH2vrpo95r2qVuj6FeHFOklVQBuhjhYsVjNycl2CTns6oGfSVxr7TPZ4XtBwC5KbuHUW3duozUOlj5ngLfIojIWId9Exdo4kgHc/rYf9zFvykkahVSZpLVA3PuhZmFR/feEao6sL36ogkJTzeyz54eMVyNBfou3IAyDjbhUcZ3sWthW+Qy5vF5ADuXi8JtXRrUQ6nE5WSENbV76NpgX2bCBX7cqvotn64ra//9UouaBuvFIDK5QH8YA6kLJToSucXQwPb9vkyfXGqb6EbvX6zzf5WAYtJ2VimmKXBFqLZG/6J2uW/op102sUWDjpFCwchniPNjP4BT83BsWQasSglBHuZHhocZpXKu3axQf+jErRFtyy3jdGeJj0102QgF2ZHO/dIqnPkp4VoE8YHWCvwQJ+R4LuFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzdDT3FKWldORzdLN2I1M3FtMDVVTjU4dDhDWnpyRlhCVFVScFA0Z1NxcDZ1?=
 =?utf-8?B?VnJBVElwNlB2K3BuMk1VUXR5NzBpbER3clVUUC9KSXBlR2VGZU9kaEsxb1Ns?=
 =?utf-8?B?NnRkSHp4RW5IWUdQc2JKSmZyM1kzU3RIUysxS1ZsRmNPRDZ2aVQ0RzBLTHFN?=
 =?utf-8?B?U2N3TndCbWJiZEplVTNQWGZIVm5jZGpHS0VDajE5Z1BLekVwVURocjA4cVZX?=
 =?utf-8?B?MDBWL0ppZzBaN3JYNjdwSkVydzc1ZGNvQnQyY3JZc3JXVUh4eUR1MDlBWmNM?=
 =?utf-8?B?amdkMGROUzM1ajF2RENBd2ttbHZxUHZaVjRTaFMyNFpkeXAzek5oUWU5bDY5?=
 =?utf-8?B?cU4vZUZOUmlZbTBOdU9YL0MvZkJ1T1dmd3pvNUREbW5YR0xFT1VwKzRYY0F2?=
 =?utf-8?B?ZFpTdUVIaXpDQnBnTlJ3cEV5dnFiNjJnOGVMKzIyVkdJdjE0d3FFZ3BlMXYv?=
 =?utf-8?B?SUtpQ1Y3ZlFrREp0ZEZHS1hCVDFzUlRiVXlRQ09ieVErM2RZZDVzdVBPbUxS?=
 =?utf-8?B?NVh1UmxqaXA4MnpRMStONy9neHQwbEJKT2hvQ2NIaUtvcElHUlBReHpXckdx?=
 =?utf-8?B?U2J4bGhnN0Q4VE5sV0lXWXJVWGlpMis3QkVjZkJnUFZCMDRSbFg3TTB2amlP?=
 =?utf-8?B?eUk3a2xSbDVtVUJZVjFPOWNybzR5UHZyb1E5NFNyby9SblZvczIrOGZzTU9N?=
 =?utf-8?B?WTd2TDVYTVpURllFaU1Qd1ozZTRRUFNxLzZ4Uk5hTHJ0QVhNaDhqN09jak5J?=
 =?utf-8?B?aVpYS1NQbnlRRlVlT0pWNUtwbndmZFRmbzY4VW1zRGQyUldjazlmQW1yc0RD?=
 =?utf-8?B?Ly9Bek1uMzYwbDVncHFVemVhUTJhV090TnFHUnZYRkMwVitQTHNybFAramt0?=
 =?utf-8?B?bXhrNEprcTl5VUxCN3FrNW9rS1gxTXMxTktnejdTeVlvYXZlazVha3lSTXl3?=
 =?utf-8?B?T1F2NzJTQ1BkWGNxazBhQUhnSWJFYW16bnlxS3JzdVBGTjRTeTY0UkQ2cDEy?=
 =?utf-8?B?ei9IMDl4bnhJM2dHakQzN3c2bEI0cWFvYVRmbURkNXk3ZkpFeG5GU2xyVXBm?=
 =?utf-8?B?ZnM1b0s4cjM0NnhIeDVOdmt5TWJIQURwNFFmNDJzN1NFRDlNQXg2RnlTWTlP?=
 =?utf-8?B?SmhUMWRFTVBDMmtBVldLRHdWWFkrVFFjaytiMTVVRmxpT0djd1p5dDdZelpx?=
 =?utf-8?B?UkJHc1RZelJNMVlhQSt0YS9oK21aUDNXT2I3aXBzSVpiZWs5aEFjTEhSeTZl?=
 =?utf-8?B?UnRCazlOdnB3dDg3TzV4eWNBa1QzTVZsRGtjelptakxvZ05IYk40Z0s2dHZr?=
 =?utf-8?B?MFY2b3ZxWGRLY01Ta0Y2bEkyd2UzZmJjM0dmVXFTWm1XRFR0dVN0d2lRZ1VF?=
 =?utf-8?B?Y3lzWUQrWHJBTjcxOWVXanlXaENOYzFINEw2dzhXT1YrQ2dReEFQcFNoaXMr?=
 =?utf-8?B?TE5BS0ZUQ2NNenAxQzVXa2I2eFN0OG9BWnMrbGRkMnNvSnJIQy9UdURDd2RF?=
 =?utf-8?B?SDJ1MXlFdUJTSUkxclpueEFkNGJSWENtenc5aDkxOGlUa1BKVGYySlNsUzB3?=
 =?utf-8?B?akp4Nm1DMUhFb3NPbEgwcldzU29wamt5Y0FaRkFzN1FEQTRIWTlFTUZ1MWdl?=
 =?utf-8?B?MnFpYkZsaTVOYmxDUHFXcDV4eU11aDZxdHpjNGE4WThxa0sydUJlMEU4TVJr?=
 =?utf-8?B?VUwrTEhtZDMvdWRVVEZmUmNISjl0UWNuMFBOL0YrWnlJUFRraTdTRThCUWRk?=
 =?utf-8?B?MmZveXowUjN4ZTVoUjliN0x5VWRscVdwa3FPQVhkQXRNSTlDL3c2MlRvdG50?=
 =?utf-8?B?aEZrUHl6bm92aXdEZUlub3dRVnhUeHVyZVI0R2pHSVJBMTBidFlQRnFSRW16?=
 =?utf-8?B?V1hka3EwaTVldGdZSjBmUTJhS3lQbkhYdDBTYXBVNUJhSXF2MDNHYWxEQzJI?=
 =?utf-8?B?L1YzS0pkdytzYndvVkVzVUdDQzd6emh2eXZwSW14VG5aRWp0M2ZvU2FGQVd0?=
 =?utf-8?B?WDJIS3k5ekhjMWZIZTNIeVFudE5BaTdwc3d1NUxRUHl4ZUxQRnFRNWU5c3Ni?=
 =?utf-8?B?OVIxNHIyTlpDRnozbGRpTFJSaXJ4ZmRlaktyL3lDV1VyTGcyZDFBd3hkOXJn?=
 =?utf-8?B?RGNGSHhhKzN2RXZnZk42UHZWVUI4NStBekN2UTVvb1RPVWYvRmhOMnFrdE1T?=
 =?utf-8?B?VWRGWi9LQmN0NkxZTkFXMGhSUFJ5RUNVQVkyblFmRXQ2ek5PQ2o4TVhQb3pl?=
 =?utf-8?B?U1Via1pOOHhHQjM4T2FBcEhxdmcvc1JQaDRqajlPT1Z5RFBoSDUrY3FWYUNQ?=
 =?utf-8?B?bkc5dGJENUxhQW1MUElUVStBYVJESG9vWnA1RzNQaFcyMW9SRmlCVmtucXMw?=
 =?utf-8?Q?3KQeUea484Fn+6T0=3D?=
X-Exchange-RoutingPolicyChecked: l0CpP5FnxrQ26RFmIRGvJ9ftUTXlqwzc80cTfkhqtSiQ6PEKvfry024KvL8OZ5mbrRTSx0YWgySevwsC5RoBkuGGSY7f13O1KaE5JIrUp6jVIC/tqR6SvR+e60n4FpYcrE1ygBo5XgauPqU9s6Dkt0e4Swnz37nUJNsNpW4BiGdXXdtRHVKZEi2gwgsZT31ZVFXj1UZYQlF8ax4NjSRqSB3SKufIcphQdmh/a256W+rRapLLLm72iTauabocfMs/BQBohFHxqdI3yygzRHkUi8ZRez5dloUtWqvG8r7y7uPd/u5hyJUPlS2gqH39sUClZM/ClBIAA0NGszenDTbqJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10af2c09-18c3-4fa7-a296-08def942d0d6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:57:30.2968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEHHzS/fGuMItYq9aeeOVg28qqjIzw1uL9ND67KJ2DqT16ESsA4ruaKB9kNZPED5UY/FkS7/0XajZU0EgPGGZu5ocbkYZ7RJL/jdaPg2UdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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



On 8/6/2026 5:33 PM, Swati Sharma wrote:
> Add IGT_COLOROP_FIXED_MATRIX_TYPE to the colorop property enumeration
> and register the "FIXED_MATRIX_TYPE" property name string. This enables
> IGT to discover and configure the FIXED_MATRIX_TYPE enum property on
> fixed-matrix colorops exposed by the driver.
> 

nit: Let's keep NEXT as the last property defined just to represent its 
unique role as chain-terminator/pointer.

LGTM,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> v2: -Naming changes (CSC_FF_TYPE -> FIXED_MATRIX_TYPE)
> 
> Assisted-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 1 +
>   lib/igt_kms.h | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ef9496741..9095aa634 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -725,6 +725,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
>   	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
>   	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
>   	[IGT_COLOROP_NEXT] = "NEXT",
> +	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
>   };
>   
>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 521a03c01..22164fca9 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -363,6 +363,7 @@ enum igt_atomic_colorop_properties {
>   	IGT_COLOROP_MULTIPLIER,
>   	IGT_COLOROP_LUT3D_INTERPOLATION,
>   	IGT_COLOROP_NEXT,
> +	IGT_COLOROP_FIXED_MATRIX_TYPE,
>   	IGT_NUM_COLOROP_PROPS
>   };
>   

