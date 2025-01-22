Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DCEC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 15:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241DE10E721;
	Wed, 22 Jan 2025 15:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVO1wNK0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E64210E721
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737561448; x=1769097448;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MTPzkcXf9vsuaC7ipjks45JFWcL+wsPUuMGxQXP8zfU=;
 b=SVO1wNK0R//xQrs02qYpdENSUhleE+XLsf3B7yrTjhvmP71eZRrhQVct
 bxdDdZbXvJz9q9f5lqIZbuXuviH4d6XHxTaYgQRMyHb5Any5di/98SLPf
 EFelCFG/CkNr6qhWYHMVK369aogmLUQLJS8senOC+brKR0auCXwTh8aDR
 O2zMV2jE3M1n4MOXiE/gFGeYG8Lhx9Jxq/5bMZCdzFqH/4vycMkJtQu/e
 448hIZQv8ASyzwF3tyrrdghMEpRMv3cjpPGsx0zfkev1MB8Ezy2KVf2x7
 dD7JW42W923abovQuqvOK3wV7mdCHrp4mAjvB8e+EZdA7knnsonUkvhIZ w==;
X-CSE-ConnectionGUID: cqva+Iz5RMyTDb/3BPaFBA==
X-CSE-MsgGUID: tRqZ81dDRCaXq3XM3UdfxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="55573578"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="55573578"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 07:57:27 -0800
X-CSE-ConnectionGUID: 6EYEyOtgQoK/ZsCem9MWPQ==
X-CSE-MsgGUID: 2AiyS1XYSOupI3dPjAFTaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111820016"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 07:57:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 07:57:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 07:57:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 07:57:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evuf2EUp686OoCmj7VRIjWoYu8SmOEwBqC8y6HMXlYdKoCYyq2ygZGmTzAlK3z6ewJibX6IKRw1R4q7MCnKOfekooEDfdDSM49ctCCDxcj1UmDqmNwstoWuUm9yBQykVvCmmYm7Tm64H0Aawi9UM6NNDSKrhLupAiv8PebwmJjg7p7dONzDno0qASfYJ+v45UsYoib7EaEniqoYM5JtTkK2wWzTgO5BFeWaPWSrK3skDLf1ba5XAQHTvIRgiCEcJuogLDTehOlFsyy3k54oOWLPGWfl6cJ8Q6ttbtyc+bZc3XQfbmaqko/G51PWLPqBJu98lW0H9zLuFvvZ9i4fXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nJFDxdXtrtpp07Sb2MBFq7gEk1DmBlT9FQfTEm7CM8=;
 b=DX6gqIejKeK4ukCNJoKHukrEL5bUS94SQ4gdjYXVL6WxUzZPKDt8CO2pI4i3KD7YzGhvApxK8ZvX0Oc4ibfKhaSryyJyOACo0xWW/dC21d23RCTFEvujPFw5W95JXew+KsZfQ6V9m5S2VczTBfiSjRZ7DrYRSpGf6IwH/jiLlqUrJCIO0PKPoqIIp/Xmg7rA+vZfPmZQ1drfaq3jHOR1i3c6+Gkaz+SOp1lfXXlFusWiNK4akuZXBZTNR4vXKZOvRd7kONBwoOCB68T0dEvSdPg6sZKw+4SAf3jSzou0nKqIuyw5+NGCNNKsI1dhrxT87gB9kJ5kfmb43y1G0TZbww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 15:56:54 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 15:56:54 +0000
Date: Wed, 22 Jan 2025 07:56:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_sysfs: Multi-Tile support in IGT
Message-ID: <20250122155652.GM5109@mdroper-desk1.amr.corp.intel.com>
References: <20250122150051.8154-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122150051.8154-1-nishit.sharma@intel.com>
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 542ee7f3-3139-4080-27f6-08dd3afd64a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4cnWhvpGFMX//Rso/MY/OzX1Nvd8DJmG1wNsbKKJdquBHsBD3Nok8e4Aml?=
 =?iso-8859-1?Q?l57Ruqq2ALISN5PIf/ZSkMbMjr3auiqDGvWhvAesAf8nNtAiRVreuQNSo5?=
 =?iso-8859-1?Q?uMAwZbkZQl5PzikxpXtwRSXhkw8HBDUYn/HGXPO52yUZkJZSjw1Jh43NeV?=
 =?iso-8859-1?Q?TEi8UChLn1Swt5dGPQo1XgQ6d2MNzTuB8D/3sPEwcpqYb75SAAbFoXI1TG?=
 =?iso-8859-1?Q?40yCEV1sGZcANB/Erup68pnSwTgGYScBdI/1IcoEir9k5VRLq7USnf+Zwp?=
 =?iso-8859-1?Q?/AyPmZqICOqGmqjGdNexCDQ7WsycZc8Y2kbxf1ET4TKR5158X6VAFsb5zS?=
 =?iso-8859-1?Q?1RhrJBrTjJnekGuJIzNj5JTg/TIp/pFM1szYzUXeNzu3UfFPh84MyO455J?=
 =?iso-8859-1?Q?JeWI6KjWhNS6XmOnWJAb9RLiglFLLojvPFbAs+SCTc54TKvNDsKtfwSQk2?=
 =?iso-8859-1?Q?rSWcEzCfssrmzAdcuVJagknFOxsm/lP+UiFXbGhrU2u/pRbjoC2uchURVy?=
 =?iso-8859-1?Q?eSLmbS3RbJ/vTta4D3Yedrpe4DWDxCtuThKMdmdpwfP+9JifacQkdgr5LZ?=
 =?iso-8859-1?Q?JqQPRN3bxG4wXT3GstUZ+G8it4hzmTHq6nHhgoCRHO1cTwtK9iGpnGHIRZ?=
 =?iso-8859-1?Q?XD6FlwOp8/ZRbJWy9VbQ6AUEH50g8p4/bqP72ySDF1/yeyQZhrVwXExDCD?=
 =?iso-8859-1?Q?2yAhgyuqpnLudSMRmXVRu0bgsscdlOagJAeILpsk3sAqcaIBuq+thN5BF4?=
 =?iso-8859-1?Q?GdX9qBkTVudF3WA2K3pxzEh5TCRlM0kRg3G7ckM4msL4BRxGio4HYhDT0p?=
 =?iso-8859-1?Q?DUt9H6exBIQCStxouGzr65wN6UjzTkCLkBknopwyZQjkBRf9JeWPV6VLDh?=
 =?iso-8859-1?Q?f3ikuUMYUV3j0SyndPvzAnDaFGT/Oofk2iROv5MIk++E9LeqwpoPRQ7VuB?=
 =?iso-8859-1?Q?3FVIOVoi7f9KNqXMtiGlCCTacsvZFHj0yeE6EirfkHbUvHSuTo5Frrg2Uc?=
 =?iso-8859-1?Q?EOEZoZVKfQNyQPqRlTQS0cHWff8anM5RDu7mGJstqRUZRAB/vKTBgJydrH?=
 =?iso-8859-1?Q?UpT6fDCXmQ17dZCS/kCNAXTulhDhCdrzwozQpv9tFB/zb+cEIOBn1E/ZVv?=
 =?iso-8859-1?Q?GK45m+pV3oX73ceamYN6DTrwY9wxTEsBbS3yYB57H++ZMlrWNW5+2MqPtJ?=
 =?iso-8859-1?Q?ZAksj9hTWLHI+Z61KtvhXwhexUBi71piT8EqAyIl+YR8yoqdR+lwt3wcOC?=
 =?iso-8859-1?Q?6933xrKBQ8DHlbtlPkZ6+YQE0FMIxJHK5olJnnEseFrI8DOEQ0cbukhZ/j?=
 =?iso-8859-1?Q?0Nf0yHLmqX2UhWZ2r05T/6NdH3/EgGrdqjHAgv2cIT9M7QK9O37qV9dadF?=
 =?iso-8859-1?Q?6Ows8HFL9XfPSRM+9MK8ge8hcxSCtB2tr8viobILentxpDt2m0OkuK9rVN?=
 =?iso-8859-1?Q?f7JnihQThc6hvPfC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ue8wbcXxg8IntxsCbtXIRupeRRCB0ToyOfpcQlCsyge+QQZLpj8uh+t0fq?=
 =?iso-8859-1?Q?yOqPsur0MNa/QZlrjb3cApTluQllu9LIO3EiFadolNUd1MVSMyodNL3llm?=
 =?iso-8859-1?Q?YCfyRmexSO4AydB7reHQp4owsKnKpwX1WTsdrdB74L+ugDa1eJ2coYE77G?=
 =?iso-8859-1?Q?04yT91U7c/OZRYjb/7L4yH8tcbPWmB7vC30ByhcBh8oF/aFaVfjO8/RifF?=
 =?iso-8859-1?Q?NfsZDVjbxEpq279Q2z3vTerCfTwKUDzeK9AYFhPWStmbUBpFVyHLx/zbi2?=
 =?iso-8859-1?Q?AaLYgBMz76KMgVHBBS8BWhD8cJMIigzKLAAw3pZ+afwYDwEBO0bK+nllCE?=
 =?iso-8859-1?Q?ii+WCSO7fI5nGlDTL6dHs46jsyMR8vI0UGpoaXA4GiOYGV2Mat/ehEVtyr?=
 =?iso-8859-1?Q?5P7Kuzzj991PNNegzt5Z806VWL7cGfhf9thZNKq6R6xJMXHKLfRTRNrORp?=
 =?iso-8859-1?Q?/H4sHgLzZ0Yo7JcayxDAIiJNfPcUYLaa7udyCklevtADX5DQEV2sR+YRCJ?=
 =?iso-8859-1?Q?yHROFVFzd++qKu0oMUhrsOplyeW1IKVtjqliH+dyxdH9ks6ygSexaBVdZF?=
 =?iso-8859-1?Q?OnZjraNQiJ1HHvTMz8F28X9Nog5rFDJO33Glie8Vr3cL0CEtQr3TI2DqS8?=
 =?iso-8859-1?Q?4XYZuivDWe0HmboNfZ9CP3r+4C7a59sCgcQhnV5iKHJ2fXXhn5KkAn/fY2?=
 =?iso-8859-1?Q?4fskkqSuFFXsv3rCFoiMU+ngDGNdN7GB8OX5RYf/bEjF7QcGnaqd56jBN1?=
 =?iso-8859-1?Q?uFhvCqH+71dFouJaayuVQBbjj6nbXpdiTjo+Vh+mqOtzKnBXZAkEIOFcx9?=
 =?iso-8859-1?Q?2mau5S5tzb7FI86v68HcKvZFNah6ah3XLMXtwd7c3ChER14AKVkEdy5DBW?=
 =?iso-8859-1?Q?W9fxsBSpuVBFiUJEV7MyI++0tI+cWxy5eAufgViWqNjmTfvcFj04T2/XrX?=
 =?iso-8859-1?Q?oiqBhFHIOZsk4vRLX9D9enKIm5h9QavzV7Em9qxFVVNR59wVPWF88d3at8?=
 =?iso-8859-1?Q?ocwpbw+7dDBc1hH/aiGhd+1yBvPYl5w72XG9cwGVPP2EOfXUMfdTxfY1MK?=
 =?iso-8859-1?Q?cYeUAdS+612EBtJtkUqeT1kq/QvMm9iZn46DqLcGyfRRLmTaeittXma5VR?=
 =?iso-8859-1?Q?B9mXx3hmqNz1e2jEu04z7KggHCfuEolvurXzMTUZ+t14KJ932ye4NnJi5b?=
 =?iso-8859-1?Q?vX3CBF8bL/TTLgKxUSCmaFW8Wh/UN7iLIfaJEZZw4TIPNzU5kJn0USbKE5?=
 =?iso-8859-1?Q?Vd2cNbEoHhqwKyl8COQpCnr/HytW9+anze9bzr21ng5H6fE2T0XZBfwbv8?=
 =?iso-8859-1?Q?Z5pBrwRjYWPb1yHaqXunND4wRWq/birm8xKbj1ngIBlByAPE/2LuyGxO+K?=
 =?iso-8859-1?Q?Cva3Ot8cjzdMcZx8cOa1rmYzKoyJk18AhBHUHF52P+THvDnnfA7MmnJiLf?=
 =?iso-8859-1?Q?HAEuWOA1Sn3qVzOG8SMt9NyJAdkFh+VoCu7U+5M7M/v5UZ+tQS0IXtgrM+?=
 =?iso-8859-1?Q?VoBBqMPZwke78ynjhUKc4lBMhOrqFr7d4+eDSN9xf5Key7swfr8mDZ2Sk8?=
 =?iso-8859-1?Q?Hnb7k+lzY6TS135zEKS/ZOIBIAqxVI0wPBmT8V0jRTwisPC83gEsfWnHiH?=
 =?iso-8859-1?Q?sjlRHVMENQZuIIYnmKi5D9KjTQg0EeGAeg5LVgI4KtodSqC1DmUFvJjw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 542ee7f3-3139-4080-27f6-08dd3afd64a7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 15:56:54.7701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ux+kb2Oga1a9GBZEI+Cm5fu6ey3grTDkfj2BZuZ5pP22h0Vd0LkRoeugyRiYHFOMY6VNw/s86Ol7x1RD5pgap4ARDNp/1tm65bv0tmVsBp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
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

On Wed, Jan 22, 2025 at 03:00:51PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Added functionality in xe_sysfs_gt_path() function to get Tile ID
> in multi-tile platforms. Added IGT test tests/intel/xe_multi_tile
> to verify Tile IDs and GT IDs
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/igt_sysfs.c             |   3 +-
>  tests/intel/xe_multi_tile.c | 109 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  3 files changed, 112 insertions(+), 1 deletion(-)
>  create mode 100644 tests/intel/xe_multi_tile.c
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 00d5822fd..37f1716e2 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -234,7 +234,8 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
>  
>  	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
>  		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> +			 major(st.st_rdev), minor(st.st_rdev),
> +			 xe_gt_get_tile_id(xe_device, gt), gt);
>  	else
>  		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
>  			 major(st.st_rdev), minor(st.st_rdev), gt);
> diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c
> new file mode 100644
> index 000000000..222da9389
> --- /dev/null
> +++ b/tests/intel/xe_multi_tile.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation

Typo?  We're in 2025 now, not 2023.

> + *
> + * Authors:
> + *      Nishit Sharma <nishit.sharma@intel.com>
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "xe_drm.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Test to get tile_id by iterating gt on xe
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: mapping tile/s with slices available

What does "with slices" mean?  Slices are a different hardware concept
inside the GT that we're not doing anything with here.

Actually, it doesn't seem like this IGT test is actually testing
anything multi-tile related.  The first subtest is just printing debug
output and doesn't have any checks (i.e., it can never fail).  The
second test doesn't appear to be related to multi-tile since it's just
iterating over GTs, independent of whatever tiles are present in the
system.

It would be more useful if the IGT test was actually checking the
behavior of the UAPI to make sure it's returning sane values.  E.g.,
E.g., we could check stuff like:

 * all GTs belonging to the same tile must have different types
 * we aren't "missing" any tiles (e.g., if the uapi reports GTs
   associated with tile0 and tile2, where was tile1?)
 * ...etc...*
 

Matt

> + * Functionality: gt operation
> + */
> +
> +/**
> + * SUBTEST: show-tile
> + * SUBTEST: gt-configuration
> + * Description: Test prints the tile_ids and gt_ids available in GPU
> + * Test category: functionality test
> + *
> + */
> +static void engine_test_defaults(int xe, int engine, const char **property,
> +				 uint16_t class, int gt)
> +{
> +	struct dirent *de;
> +	uint64_t property_value;
> +	int defaults;
> +	DIR *dir;
> +
> +	defaults = openat(engine, ".defaults", O_DIRECTORY);
> +	igt_require(defaults != -1);
> +
> +	dir = fdopendir(engine);
> +	while ((de = readdir(dir))) {
> +		if (*de->d_name == '.')
> +			continue;
> +
> +		igt_debug("Checking attr '%s'\n", de->d_name);
> +
> +		igt_assert_f(__igt_sysfs_get_u64(defaults, de->d_name, &property_value),
> +				"Default value %s is not present!\n", de->d_name);
> +
> +		igt_debug("Default property:%s, value:0x%" PRId64 "\n", de->d_name, property_value);
> +
> +		igt_assert_f(!igt_sysfs_set(defaults, de->d_name, "garbage"),
> +				"write into default value of %s succeeded!\n",
> +				de->d_name);
> +	}
> +	closedir(dir);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	struct xe_engine_list_entry *en;
> +	struct drm_xe_engine_class_instance *hwe;
> +	int gt, tile_id, prev_tile = -1, gt_num;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +		gt_num = xe_number_gt(fd);
> +	}
> +
> +	igt_subtest("show-tile") {
> +		xe_for_each_gt(fd, gt) {
> +			tile_id = xe_gt_get_tile_id(fd, gt);
> +			if (prev_tile != tile_id) {
> +				igt_info("Tile id: %d\n", tile_id);
> +				prev_tile = tile_id;
> +			}
> +			igt_info("GT id: %d\n", gt);
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("gt-configuration") {
> +		for (gt = 0; gt < gt_num; gt++) {
> +			int engines_fd = -1;
> +			int gt_fd = -1;
> +
> +			gt_fd = xe_sysfs_gt_open(fd, gt);
> +			igt_require(gt_fd != -1);
> +			engines_fd = openat(gt_fd, "engines", O_RDONLY);
> +			igt_require(engines_fd != -1);
> +
> +			igt_sysfs_engines(fd, engines_fd, 0, 0, NULL, engine_test_defaults);
> +
> +			close(engines_fd);
> +			close(gt_fd);
> +		}
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..2cc01aa0c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>  	'xe_exec_reset',
>  	'xe_exec_sip',
>  	'xe_exec_store',
> +	'xe_multi_tile',
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
>  	'xe_fault_injection',
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
