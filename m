Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCA6C5AC67
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 23:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D17310E3AE;
	Thu,  6 Aug 2026 23:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUVAzEQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE5510E3AE
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786059963; x=1817595963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pEihoOd/EGIJircdhg43Ys+LEUIO3VSGdkgwVx1d730=;
 b=BUVAzEQwfIvIDROKg9pjkKIP3slnVBg4jSWr6vAl/tD34z3ZVzH3a4DM
 nUMAGZQI0tDRB3Ioh8CNOQKVtUQzMGOYpAjLc0aIAslBL1IVOT6u229DI
 YO/xQOyNoW1OvpnqMmuyHYvzr2V/AvcpvWmB6YpeUzI2EnkzP+TfOEGVS
 vco+id3g6PVHBHOjnxzD2frgG2LFrafJ1L6yJUPZPtp/PUn7Wjk0UO9uw
 j/2RyLbf2TteJGbVo4OYsgOoFHsYO/Jt4ijbXTmRu0rhDqt+pqdU22d1B
 HKolF/Boy2tMVtL4Dfl01Hn48NdNFAzkhXcA0k4y4KGmG1PAJFH79ZSA9 w==;
X-CSE-ConnectionGUID: b6oGGc+ZRjydrxm6xnfIeA==
X-CSE-MsgGUID: wBQgc5N/StqH4Yi3F4nybA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86606571"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86606571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 16:46:02 -0700
X-CSE-ConnectionGUID: 5TooSbpVQCuqOT/+EHPkdw==
X-CSE-MsgGUID: BrS126m1RheRUd/Blub8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="260963451"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 16:46:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 16:46:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 16:46:01 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 16:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YD768zuiQbfqowoIMnBpU8pbuVmNTwai5uzDlixYk6GtakrdCBg+u9Hh1/IEuP5IX3fiJ9xrQRmXSLghn+Hn0WQ2wEFxCnhITxGdQcc4w3+6gfjlDnG6CHemSubbBVYALdJO4A+MfvrXsW8Bj8f4wdJAffZPgKhO2d8zhh9XP8R8Ags5fFva0VLAWz7doFexyvNF0/+ZmzHiNtOkzJjaKU+ZNhWaa0KEggDK2uRBAdNIo6w2yzQqLk3A9zLhF+CmeH2/wCCItivIVZYnkUdp5zPhwQajS0wt8vZPBjoeLBjTR8T/1BrSB3/Tp+Z8lJMIKj03ip+v1+DPM9BgOFr0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGPFmMRQk0zAfBiPUl3Xln4fGTUl9usVnsDJANmH5Yw=;
 b=Cp9ZVz6zVofHBTFh4qMrwH5AMVa26Mztbg9oyrjm9PEp1d3ftR2TN5wva4W29FYrtGxHO77/vcnE48S3OkPJN5ZfuqjCFo0yizIYlwWCpbkqjZT7VC7ZTt/gzi5QaIAPsaFdfIXwsxxdeaUm18MVhvrgYsmOSFQJQJkMgG6we3CCVz9CTDcwKQA/CbBjIrSoEBqHC82k/17ulD3D62FO87Xk8QAxBsoOrzfopzT8707jCc9hzDGoSfbsP2kSS8jq69wDDSTZLFGlZQRS9LZCpyITZ/tMMTar+sLzaq7q7jhi1tgC4mElp5yFgH/uBmWh7cUqgaVh4CmE+KsgbQyZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA3PR11MB7980.namprd11.prod.outlook.com (2603:10b6:806:2fc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Thu, 6 Aug
 2026 23:45:59 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 23:45:58 +0000
Date: Thu, 6 Aug 2026 16:45:55 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH 1/8] lib/igt_drm_netlink: Introduce DRM RAS Generic
 Netlink interface
Message-ID: <anUcs2D7ud7oCSyi@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-2-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729121959.603890-2-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA3PR11MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 155fd410-bc47-41e7-4ee8-08def414dd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Hinq9insg/Y7coUg1q3rsB/sGQF92fbC4xtbZeFC5MoTMK1+wt443ejFRe6YQhCtMW3WeLkoD4wrwJdia/bwmdVjeA6EgzZCrMBG5QVZZS0kND64UCLHDUJWV+2R3sPe5ZHJtcmuTOM03LdDMsQNUvZ9Sj4zTMHBm0BFJ0voMzAdXlDPneWoeKVY8QqX9vhjQzSaYY6A+Jl0XC4PQO5qEM3yhmc3qqQXE+buZAxMYT2z/RKt+R0tB8LO/LkQn/BH++1gebUvJo4iEqEaYv9EeuAfGcIkyBFWSxKngpjle0d28EeqHLh58/076YZ7lrXJD1sWqGB5Rzup9Nei449DSlkSB5BSacAsn7yrcU3Vv94CGC1M8Xp/bZI46N8kp5Wz2MbfBIUYGfqG+rDZpNGq5z15DJW2mk0/JyDcBSjXyH49oP2AFHMHIwUcfs8AuSxPQjpPheOCBzTugvCVboYoD4zxGDRzrsXK+H2pckAfPIAX6PUu5aHd64YMQFJYVmBTWuuEz4yphXxLay6fGXhQCVbe/wZ2vCKNBO3hO3MXK2XbbO9/6dk2IRvXNoYqPu34bhs78qUQE1oK4e/ScXJcAq3e2EiGnfqRo3IclYBsnhyXLsy/rg40hDBrtGVlaWcJ7LqxFnc1ByUU4uwlO39427ALySEiMr2ms53/JVp48qk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(10067099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3dsVmNuUVNYckMzY1UyRnZTVnIrV1ZZVWJhYjlGYnI2VVhTTU1LZld0bkxY?=
 =?utf-8?B?NXFMazQzbHJ5WFdpekUyMFhBdnFxRVB4SWk0dHkxZGNWZGhqTXJ2dHl0cGJ1?=
 =?utf-8?B?OXEwUjUwL3M0S2tnK0pFemVKcE5pZW1EUEp1ZWJoVTRQeUxDS0xwV3ExVmI2?=
 =?utf-8?B?dkxYT21aR2lVekFSYW5QZTEzTk10K09ZOThJdWU0WThRTHlGL3dMWUZ4MG0z?=
 =?utf-8?B?WjkxcUptbU11ZGVTVmROOWltcHArMm9jRU80cnF5MnhRRndINVBmUy9mV1RP?=
 =?utf-8?B?THQ1U2tHN2pqdksweVdUTmdCbkhuUEh3c3ZCVi90TXQ0RXl0VC84QXEvWWo4?=
 =?utf-8?B?ZnVHb2E0MTRhU2Q0NFRVLzZhZWZHcW9OOTQwTEZ2MzNyam9PQTNmK3dveWxo?=
 =?utf-8?B?SU5wWjdYa1ZTcndJWGVuNUJmZUpwUzZZc2czbzVEMi9VcjVvenl2WlYrTEIv?=
 =?utf-8?B?QkVGdzBnenROOGxKNjlxZmdqVVdtU21UZXhqOW9EYnBZSVQ4SzRiaVVtdGht?=
 =?utf-8?B?L1Z0dEJybWhaZnJ5RzR6aVVUbXZTdkttdjZ3Mjh0V0FJTXV2VDh6UHNYTmNh?=
 =?utf-8?B?Tm83WHNiZzVzVXZ2SC9pVmg2eFoxYVBPcEU4SVpZWmpjZWVhMUxETEwvRWlk?=
 =?utf-8?B?MC9pYW1RZW1PV2d4WHN4cjllTENUN3p2NXVOVFU0WTVNYmhOZnlMTXYyb3di?=
 =?utf-8?B?SktmbVhXTk9kalNydEhYeDNPeWVHLzlsbmUrRkdyLzhhSkE5Vit4V0g4WjRn?=
 =?utf-8?B?dnIrRDNSWFBaNW5vM3MzWGdFb3lybkdsOHczc1Z3MTladGpmbFI2dE8xK1Y4?=
 =?utf-8?B?OTRXdi9UQ2pjNTNEUWEvM3hvN0FSUlF2M3JZZzVRRDl1NnlmOVMrZ1krSmZZ?=
 =?utf-8?B?eHphd091bzdtSmdYWWhUVG00M2I5MUtkWXl4dFR2YjBGUHErME5zbzNqSmZl?=
 =?utf-8?B?ZFl1cElHdzE3cm5ROXdLeFhBQWhJNTNDNUh3TTJVQlhxWGlzOWU3NS8xeHJ0?=
 =?utf-8?B?LytKUnJZKzBTQXpjdnVWSjdqMnJvV3RRdFZCUURhY1k5Z3dlMHVIZW5UL2ht?=
 =?utf-8?B?NGgvZWJpd2J4bDhZdHhOU1ptNjRqc2NHVXczbkRTdCtLVFcvbit2b3Vtc0lN?=
 =?utf-8?B?dnlqUTRWa0FYTEVKZEdubkJuTHBDT2Q5ZFdCdzBlQkRuUm5qa3BPcUtJRHlX?=
 =?utf-8?B?ZkdySEdQVFlKWUR4TS9Qd3JRY2JPaE9zNU02amg2VUNVUUcvOUc2T3BEeG5r?=
 =?utf-8?B?amZlemgwb3crWU9QZ2UyVFcyUkh4WU1meW5iVWEvMUpPc3EyMzAzUTFDKzRI?=
 =?utf-8?B?bklTcFIrL0owRWdYeXBUSGFVYnZmZklaSVRucVpkSm50aGt3MlJLNVRGQnpr?=
 =?utf-8?B?NEY4M0xqQnNlQldXdEJSRmNna1pHSXE4RjV4RTVUa1E2bXdGVWx3N2F2NTVW?=
 =?utf-8?B?MG5mcjluUy9NSS9Sb0pCc20xN25wK0xwOUh0MmRsZU91Rk1raEhxdTNjWU8v?=
 =?utf-8?B?N1JiUDN2M1hveGFZWU93Qkd6SEFld1pZbHg5Rkd5TWN4QmpiaFR5UXI0ZndS?=
 =?utf-8?B?RXZWbEdRQmFkVWcrTmNHc1FEZjJJQUtCZm5qa2F6YTJGVyt4T3cvdWRyYmYy?=
 =?utf-8?B?TVZKR0ZiRTJHTUxvUWtaWnpzQXFCS21oNm9vTmlWaEE5NHN6RUpEMlZtQWtl?=
 =?utf-8?B?My93UFp0WDZ3ZFRkZllXbklZQXdXd2RzMWZRaklLcmluUkdVRFlZUCs1azc4?=
 =?utf-8?B?SlZPYXU1VUdVTTVLc1gzMDI3NjZRZFV4WmdFQ0RhR2xxSHZoOU0zUFNtb0Rq?=
 =?utf-8?B?eFZZa0FaSklHbGRhaEg2MTUwTnl1SHRiTzJUN3B5SDh6K2gwcVNqK1FmWmFS?=
 =?utf-8?B?VVdCSFlyRTFnQUN2ckpFek9uVWpEM0hScEg5Q2Zzc2FMRzVRRFBwNitvR1dV?=
 =?utf-8?B?a2tGUC80UmEydUl3OEJyVkNMdDE4NEFnbE0xVnJiUUZsMUhnaTFhMlJzbURo?=
 =?utf-8?B?cXNVMU9LTi9EMng0NkV2QjFPYWlnVXAwTFJoVU9vejRVV2lpdWRNc2xRVGtS?=
 =?utf-8?B?OHJuL01QS3ovYldGMHQ0eU9yOVAvSHNpMG5JbGtOOHVteGg4WWhkanJhQmVZ?=
 =?utf-8?B?c2M1MmxubmEvYS9oVHFoSmprd3BlU2g0aVZjeU80eU4xNWdEMTRQSHhFVmlO?=
 =?utf-8?B?RHVpcU45TC9jYnJIcHA2Uy9Hd2xhQUhtSnI2QzdJbVN5TVVBQU5YZWJqVkxJ?=
 =?utf-8?B?bXNpK3A2TnBmVXJRY3cxa0V5akV4SzBTaU5lUldjSTRDVXIwZHBMeEwzUUND?=
 =?utf-8?B?U1lPUjB5ZE91bVdpQU9hZWJsZThlS1Fyd1ZHOVMyTk1CeXFpQUlSQnQ1ampo?=
 =?utf-8?Q?7aTsLI0Clg3xBy80=3D?=
X-Exchange-RoutingPolicyChecked: jiBSmfU+mjL6w+7aYskfbFjUBstklHKGOBukL5yi6FDxit4tpWMELgU527Aj5kJizW/g7M3WR3YPBlfHTTcyMqHkshC/Cx8pdAlsiU5ByalzWCj1xX732hHBBDVWDg2i3ZMZCfulexLSumVqU3fe7dx1JpqbuTk3y7afZTwiuJ6K/ytRuC7oIVkJDzl1RVQWo38U1b/Cq9a24tAAyy8vCkjhNzgZxTAVDIgERn4tPrB23oAPcRohEB3ogVYDCbbFrlWj8WuJZMZ/THezk1ZOe3nR7PslorEbKQvYHJRzi5DNRGYcRjg0xVsVELZFcMd/5cS56AiRkm+z8jTKXUW4Eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 155fd410-bc47-41e7-4ee8-08def414dd68
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 23:45:58.6209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il7epfRS601ND+WxwLLYdkH9Q23yCVnKObc8zhXzfhsO+mEsV/ygMYBshr7fv2+hZSSZXi75PSWvbU5+gbeSQRhgnz9BTznvFFLIaI3v0Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7980
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

On Wed, Jul 29, 2026 at 05:49:52PM +0530, Ravi Kishore Koppuravuri wrote:
> Introduce DRM RAS Generic Netlink interface as a library
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>  include/drm-uapi/drm_ras.h | 50 +++++++++++++++++++++++++++++++
>  lib/igt_drm_netlink.c      | 60 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_drm_netlink.h      | 25 ++++++++++++++++
>  lib/meson.build            |  9 ++++++
>  4 files changed, 144 insertions(+)
>  create mode 100644 include/drm-uapi/drm_ras.h
>  create mode 100644 lib/igt_drm_netlink.c
>  create mode 100644 lib/igt_drm_netlink.h
> 
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> new file mode 100644
> index 000000000..218a3ee86
> --- /dev/null
> +++ b/include/drm-uapi/drm_ras.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN uapi header */
> +/* To regenerate run: tools/net/ynl/ynl-regen.sh */
> +
> +#ifndef _UAPI_LINUX_DRM_RAS_H
> +#define _UAPI_LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +
> +	__DRM_RAS_A_NODE_ATTRS_MAX,
> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
> +};
The above enums doesn't seem to be used anywhere in this patch series?
> +
> +enum {
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +
> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
> +};
Is this header file auto generated? I wonder why the above enums have an
"A" after RAS but not the below enums? I think it would be a good idea
to have consistency in enum names.
> +
> +enum {
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +	DRM_RAS_CMD_GET_ERROR_COUNTER,
> +	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#endif /* _UAPI_LINUX_DRM_RAS_H */
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> new file mode 100644
> index 000000000..1c07bb2db
> --- /dev/null
> +++ b/lib/igt_drm_netlink.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include <netlink/errno.h>
> +#include <netlink/genl/ctrl.h>
> +#include <netlink/genl/genl.h>
> +#include <netlink/netlink.h>
> +
> +#include "igt_core.h"
> +#include "igt_drm_netlink.h"
> +
> +void cleanup_nl_socket(struct app_context *ctx)
> +{
> +	if (!ctx || !ctx->sock)
> +		return;
> +
> +	nl_close(ctx->sock);
> +	nl_socket_free(ctx->sock);
> +	ctx->sock = NULL;
> +	ctx->family_id = -1;
> +
> +	igt_debug("Cleaned up netlink socket.\n");
> +}
> +
> +int init_nl_socket(struct app_context *ctx)
> +{
> +	ctx->sock = nl_socket_alloc();
> +	if (!ctx->sock)
> +		return -1;
> +
> +	igt_debug("Socket allocation successful. Connecting to Generic Netlink...\n");
> +	if (genl_connect(ctx->sock) < 0) {
> +		cleanup_nl_socket(ctx);
> +		return -1;
> +	}
> +
> +	igt_debug("Resolving Generic Netlink family '%s'...\n", DRM_RAS_FAMILY_NAME);
> +	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
> +	if (ctx->family_id < 0) {
> +		fprintf(stderr,
> +			"Failed to resolve Generic Netlink family '%s': %s. "
> +			"This may mean the running kernel does not expose DRM RAS support.\n",
> +			DRM_RAS_FAMILY_NAME,
> +			nl_geterror(ctx->family_id));
> +		cleanup_nl_socket(ctx);
> +		return -1;
> +	}
> +
> +	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
> +		  DRM_RAS_FAMILY_NAME, ctx->family_id);
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> new file mode 100644
> index 000000000..c20d5452b
> --- /dev/null
> +++ b/lib/igt_drm_netlink.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_DRM_NETLINK_H
> +#define IGT_DRM_NETLINK_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +#include <netlink/netlink.h>
> +
> +#include <drm-uapi/drm_ras.h>
> +
> +struct app_context {
> +	struct nl_sock *sock;
> +	int family_id;
> +};
> +
> +void cleanup_nl_socket(struct app_context *ctx);
> +int init_nl_socket(struct app_context *ctx);
> +
> +#endif /* IGT_DRM_NETLINK_H */
> +
> diff --git a/lib/meson.build b/lib/meson.build
> index 4af346b43..79674e032 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -27,6 +27,7 @@ lib_sources = [
>  	'igt_device_scan.c',
>  	'igt_drm_clients.h',
>  	'igt_drm_fdinfo.c',
> +	'igt_drm_netlink.c',
>          'igt_fs.c',
>  	'igt_aux.c',
>  	'igt_dp.c',
> @@ -141,6 +142,13 @@ lib_sources = [
>  	'vendor/uwildmat/uwildmat.c',
>  ]
>  
> +libnl = declare_dependency(dependencies : [
> +	dependency('libnl-3.0', required : true),
> +	dependency('libnl-genl-3.0', required : true),
> +	dependency('libnl-cli-3.0', required : true),
> +	dependency('libnl-utils', required : false),
> +])
> +
>  lib_deps = [
>  	cairo,
>  	glib,
> @@ -148,6 +156,7 @@ lib_deps = [
>  	libdrm,
>  	libdw,
>  	libkmod,
> +	libnl,
>  	libpci,
>  	libudev,
>  	math,
> -- 
> 2.34.1
> 
