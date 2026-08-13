Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54924C5CFEB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 13:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD68110F36E;
	Thu, 13 Aug 2026 13:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C87zmOrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B0510E4C4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786629437; x=1818165437;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZdDzpHAELA7H1TcyGR5f8eieUW3Usy29LIymM3WGT34=;
 b=C87zmOrLjwvQk6TyigA5RNsIc+4Kw2Usf8Dybn6UOYN4aDF3KDnIkmkJ
 E1hwqRFRmagcxfsDMzG9GV6l1aa23oW4xiPnwGwUMFBgVBwb0amGWzNa9
 0UyP3pQ/5Mgr4++zHFrb19HJQV/DyHmIJW6zSc/vPIsn61fUdpDCj2B1k
 WNn5297z9E1v2anvYp/lSPEX4yahOId3V8vmYyxAk0b7VT9ZbTvtH0lrQ
 kbZvD4+j+VX+I8NRJAsHC2djW6inx88Fr5IEm++lMS1fyOKTuu/3F2JB4
 knAAF8QX4iPmQ8sJ9vGhHdAVzakRilQiCbuHsnzlDBmNlsGWldga5fQqu A==;
X-CSE-ConnectionGUID: cvXO1b8bTtquYnkv4h9BFw==
X-CSE-MsgGUID: sbmtWu63T9S/WY+sSX3v+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="112746293"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="112746293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:57:17 -0700
X-CSE-ConnectionGUID: zEQwfkOgQJKwiOCqdOJLYA==
X-CSE-MsgGUID: CylKsBJqTxuv1yTbxKZBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="269144157"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:57:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:57:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 06:57:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+M/Hn1qcpnLbhfFpCTgpJPDOc3hZUZI5U8jz07uROCsymE9McIDd4rZwOSA+QmhyRFDuCCZDUPqt/IzvruVSujYGA+d/1UaSXq/tHaDfC4+NkLWWKrftunb9IR9beww9CKSl4A2CYkjmLtEpTIIGJjZyPyF88CYoo1FPvUaxqItjgm803awj/q2a7tbNB2aOhhikw3fOhZXTqBSagV7NS11HoFfnxXJA9wGNqvsWHa70asSHuGeA+2wCmCZQ14cJGzOMzI8E5LrYk2p5lasZ8sblK+UtyjSt7ww92f/5KY2yMziF6ll/DCGNJ1BQSuLkplH7b2AygGs5xE+wjjqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQzFHG5oO/iBjC2SSRr2DQHF2pgmEcBfTtuEeuSqgMw=;
 b=DFU+D7MUFTJlezqveOSa+wIHJnA05orkfVtvN5iuWZFEtUcm/RmDw5p3bPuJIGCkdB+XGYZfcbPThLr6eqEuthn9IVXWL3IKwQuwfWe2C30u9npU2w1E+T9/UJ/RvCUPJqnsYL844ynO+4Qw9GJmuI1kMp5BgdfQR0dYaINxdGU325GEikmSuHrUjFtTIG7cygMwK9V9/Lue8TCrEbcewHd5BaX9Tpdbwee0lspsOgZPEQb5tbcp5Hdni6zhU1ldhp8Oeqf0zQkEaAGULqapM9DNx3JkbWS6lS9S2n57GPxf8vY6Ep3WAcoQI2ADZ4W5LvMRcU7M44VW4eD072bHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 13:57:13 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 13:57:12 +0000
Message-ID: <cd213040-adc7-4d4e-a489-72f06f1651a5@intel.com>
Date: Thu, 13 Aug 2026 19:27:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX
 definition
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
 <20260806120345.19406-2-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806120345.19406-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0280.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::18) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c2fef2-32e2-40d2-7916-08def942c650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: E0+O3HPR4JoyN0yfykXvshbOuPuAu4ylDQ66OR1qT3EMqFGjyfRIAnNQj4hU1uwmWPckLftQbY2mpkTWFqo7EouBop9/Vbs79ZJyQ+HkwK1PJ2KnA1atCGfMHWlFoblp7FuzWY6O1DC/ECGgsdB0GyWJ/1AP5B3Y+UhCpsvRKWbaH6mOcXXRNbYw2+GmYMOEdONk0R+levrDWC7wl2zwD3Urdc5fbgUbvox0M3RYQ1U7tdEQGbe8HJYBpvBQ4pQQXdZBGdaSv3IK0l03t0g11qYK3BFLC60VPojADZTEltA5XBkAoh5BTDC5LBY1/aboAJw0A2+/76b/Y/SpMvTTN/PBl26I+x1/p2IRsou9aKINCbmYkcKbJ6jLPJE3Gg9jKNMOyLAlT5qqvY9Zm3a2mjt/OXkc+PtxCiVndW/GFAt+DLTMIlVNilOgt1yzmSl1eUeiFfxvsyxUl/Q1surUOEdsqqe+7SxwxDtg6+8XjZPv1ku79IfAR313aCxNdMQIkZjI46CNG6mjpwr+UB3LWArabtV2e4Jh6qrOSe8cI10BBxaAGuUoo+d+UL8vKb1d9zSmcP9KV+kHLPm6RPt2/GSkg5SgDOHtJTi1jTWIlP8eCTCO5/3xOmssk4iGUEX9oqZ5Mj4/vMKklKCCi52tZu1lQuAC9kfjXnxOJQUGgE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkVPU3BxWTFMcVVMSHQ4MjZkQVRVWkRTWWtYRUZSaGlZNCt3MEhsSFloTmhq?=
 =?utf-8?B?ektpeUpWemo5OVUzbVpNamwzRTVUWGorQk1DZUd0UmtndmlJb3lJcnpFVUhC?=
 =?utf-8?B?RndKc2JSdFYveTA0L20wZFNxbXZPVThPOWFYaG9xTC9IQWtnL1JIM1lYeWJl?=
 =?utf-8?B?TFRMdEpBM0t2b3RDdGZEUU00YjlpVEkvbU9IS05KaDVraS9CWFZocEtzMVFR?=
 =?utf-8?B?KzYrdXBCdE9ZVGlOU1d5MHBZS2txVmh0US91ZG9IVE54OENETFd4OXhPVWs3?=
 =?utf-8?B?YVFseFB4TDlCKzNPdjBPUkMyVTRMMUhzdmNaaWhpTWdLeWZ6ZDZyWEFXVkRC?=
 =?utf-8?B?TTd2VjA0enVzWVpUZGQ4RThOUTNtcExWajJWRmRROUd2ZzRwck15bXFLSDNo?=
 =?utf-8?B?elFKWFJHVkdwazhwYzY4OFdXN2dZbTYrTDJyYXdZMmRkM3lSL2puU2o1OW5a?=
 =?utf-8?B?QUQ5dG4vZ3I3YUZPeG1ZM0ZVWDJZdXd3eDZlK215N3Y3MVpkTUhlemtmRUhS?=
 =?utf-8?B?cVo2UkNURGZlY2tGMkViTmdiMW8yaEJldHJlS0x2U05kdmZEOUFOV2ZIWlc4?=
 =?utf-8?B?R0FmaFVKZ3ZidEVIYVZhMVI4d0RoelczQXZUMHNxdjAxK0IrMTUwSm9XSG5a?=
 =?utf-8?B?c0dDcDl2eUZ0K0pUR2U1N0xFY3BmQURLR3BmV1hOS3lob1M5Y2h0R3VaQmhB?=
 =?utf-8?B?d29zOHUweWJGZ25wMWxLUmw2Wk51NXJVZEdkN3UydlJDcitNaXB5b0hYTy9U?=
 =?utf-8?B?NEpTall0ZWZQSmdGVHgvVFp2S0E3SzlwMlE5Y2pDVDNFNFE1UExzV1ozMXZJ?=
 =?utf-8?B?N0ZpVTJGUVhoWGFGT1E0L3VpZXFQc3U3RjZ0TU05WFVtR2E3cmNialhwOTZw?=
 =?utf-8?B?ek1wRUVmMkhvOGdsbzRMdWNiM2tGODVDTHBidGNwOGtIL0d1Y3hVaFNHNklW?=
 =?utf-8?B?WE9jSWlEY0N2YUxGb2JyZWEyWThLMnJ6Qk9JdDNZZkZycCtpSkQvYUxaRS9n?=
 =?utf-8?B?VnJmU1dvSXlNMllIR0tLN08vZUorM2p3bUNKb0o0M2oxZHhRYzBudkhoTEhB?=
 =?utf-8?B?U09mU2xURlV6VlZObU1LZzQ2ZVlNbmxtQ05pZlNDSWQ0Rko1NGdHeVozUnM4?=
 =?utf-8?B?NnhOWEI0MFpPSTFJNllJQlR0WVdhN2YrMWZWUU1qWm5LOGx4cEpSeHdkWk5N?=
 =?utf-8?B?a2tFTndQTVdDRytVZnByOTRFZW5iaC81TEI4QkxDZG5BdHpqVmVmZjh1TTZZ?=
 =?utf-8?B?c2c4Ry9Kd21CNHkwWUVuWHhCc2NZUG5Dbm5uWnladmVBMmNGbHpwR3g4NkJq?=
 =?utf-8?B?Vi8xMmFEVVNrV2ZOaFpwNFNnVENRZTArVHdSamRuSmxTVE9xWUp4ZTlVZkRD?=
 =?utf-8?B?SllZTnZ2SHZ0ck0wZkl4ODlLV0JkbkpNTFhVN1RuRkF1Y043ZUhjeHVzeFcv?=
 =?utf-8?B?M0d3M3cyVkRyOFMvRXBNbm5aNWJ4RG43QW1CUXpzQzZGcXdzeFJlckcya0Ey?=
 =?utf-8?B?bDNnNkI5Tzk2cHRtMEt1TStXejd5YkxRZUZETlR0RThiWE5SSkMyU2RqMTk1?=
 =?utf-8?B?clkveDg0NjE1bU41OTN2K05LSmR4Z2szdjlJZXJuVkdkZ0hPR3NDK2FBd2p1?=
 =?utf-8?B?SkhSSEtmdUh3T0J0SHRJaXcyVEFjUW9PbkJGZ2ttNG9FUTRYMnh1ek5pdWVN?=
 =?utf-8?B?cENzVlBtTUc2TFFEVkNIOGh3N0FVVXEwSjZHTXMrc2JhcXErY01LaW9uaDRD?=
 =?utf-8?B?K00wbTh2WHhvVksyZ1hnSG1ZRE1TYmg1ZkJFT3NMaDZUMmZmdmZLTGRsY0ky?=
 =?utf-8?B?QVlrVnQ1a0pBL1RmaGFOVVFkUE1XN2JUNTdadEIvb01hUE9UR3MxR1dheS9a?=
 =?utf-8?B?am9lRzN5MGI4a2J4SlZ0ZVZhMTBpQ0RYTUFpRDY4S2pCQnhxWlM1bGhrS0h3?=
 =?utf-8?B?T1RQYkZabkpBQ3NsdzJ3ZUJLcU1XZTVxZlZrWHNWakl1cHNHRXQwUEtwQnpu?=
 =?utf-8?B?NU9WR3hOWkZKKzdMdWVqYngzWGlFOTNuYXBUanlabng4YjIwbTI2ZUlzemdS?=
 =?utf-8?B?Z21XckZVRmF2dHJtRDYxa0Y2dXV2UDNnQnRyUTlIL2Rmc3IrKzJUbU9oREd0?=
 =?utf-8?B?U1RvWnRid1lvYTB5S3FPM2dVUXFWakhPdEFkSDJla2hoV2lVdllqOExIN0ha?=
 =?utf-8?B?czNhRHZUTTE5Y3lTaVcxUTladyt5UEIxdWpRaE9oZkJEVVVENll5ak0venB6?=
 =?utf-8?B?WTViSXhpekorVXErWVFHYXNVTmlzRUYvb3RSQlBZYVVhZzZTZVlRdk9rUlpw?=
 =?utf-8?B?R1puNlFnaENmUG5SL2FSR1B0Wko4akFHZ3BsVDQ4ak94L0sydmwrNGlXQTBT?=
 =?utf-8?Q?W9xOnDMlWHMqcnRI=3D?=
X-Exchange-RoutingPolicyChecked: MgRQB8VI6PiwF0N4zpaalFD6oI1RzAGpf64zXjIQycNvOctlZ+NkJK5hzMUoW2XZPYHE2KVVK4rnTG/AU9jhpV2OeQbP1xXdbif8lrRoCgnmej1ui+YNvhQezmSXZIJ2VPG1MbIBVpoEVIOu453MO7DsSFkgbc6w4rvUJMAVabgAW858Qf0BmJ72hq6ZLujSFNqnCKRd12iORI1q+e0/BmTVKzH6qrYN5I95kPXUNhV8B+RxDgMytLHfknB3mcsI3GsqJghE8vzYMtNJ3XoPE8AeRVxECloQLn5xSsgAKVUsvRMVPmSR7xKhsY5sMbSXmHEcjBtAq2Gw8vvFd7A+Yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c2fef2-32e2-40d2-7916-08def942c650
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:57:12.6904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwRaHShMZ3W+S3PJw+MV3YSI8g7XfdzMfnnGPJ50TyBQ4znOZ4aNAmiyIH6TUMBP9mVgEgSPGOjLY6v6CFOrVrwmxHsmi3X+CBzWfyrqlT8=
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
> Add DRM_COLOROP_FIXED_MATRIX to the colorop type enumeration. This
> colorop type represents a pre-defined matrix operation selected via
> the FIXED_MATRIX_TYPE enum property. The driver advertises the
> supported operations through this property.
> 
> Aligns with kernel commit introducing the Fixed Matrix colorop
> type for Intel display hardware.
> 
> v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
> 

I am not sure how strict is the rule for adding the kernel patch's sha
to the commit message but the change itself looks good.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Assisted-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   include/drm-uapi/drm_mode.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index de10ce859..0924e38af 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -934,6 +934,17 @@ enum drm_colorop_type {
>   	 * LUT size is advertised via the SIZE property.
>   	 */
>   	DRM_COLOROP_3D_LUT,
> +
> +	/**
> +	 * @DRM_COLOROP_FIXED_MATRIX:
> +	 *
> +	 * enum string "Fixed Matrix"
> +	 *
> +	 * A Colorop block that performs a pre-defined matrix operation selected
> +	 * via the FIXED_MATRIX_TYPE enum property. The driver advertises the supported
> +	 * operations through this property.
> +	 */
> +	DRM_COLOROP_FIXED_MATRIX,
>   };
>   
>   /**

