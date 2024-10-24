Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87903CE8E64
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 11:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440A810E288;
	Thu, 24 Oct 2024 11:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KH214wBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ABB10E288
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729770056; x=1761306056;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ICgDhymPaEbUrnT+JmF9FudE/C1axrg00wMSfZcqW/4=;
 b=KH214wBIc1ytca2jVYMKLT1Hut1iGotUXQA1GiM7x36edlVx/E1jGYLf
 ED0fRS+GDrOR7MNcqgzhUKdr5TSd8qIfykARocbHE6phCNNeez5zOhxXP
 /VfzbGdLqJGgttv0MBL6boe2KGOUMy06zc7D15aJS7qBl/2XwJKU3RVDQ
 aZEmFriv6UsYGG+jMXZ6EWKgpf7S+v6xJvMMEAV+siUskUlfiWqIUSjmy
 a/CEDgQ3qU66hQ2EAKOS+jgpMOQZoTOzNZTqAACV3Bp3B2X/++H08jVf8
 T7xlSIDzP/jXf8qLhyh27xXFAPEzPZTH2S1lHqeMfYoQSY/p0MHx/Gfju A==;
X-CSE-ConnectionGUID: 4SkYxPgGRg2TbyAK1s80EA==
X-CSE-MsgGUID: cKAFGwtaQdSA3sT8UxC3cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29166886"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29166886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:40:56 -0700
X-CSE-ConnectionGUID: uMxar9i9TJSixDr4v7pSyQ==
X-CSE-MsgGUID: I5pc0n7wQ02XBxRmg0irKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="81383990"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 04:40:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 04:40:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 04:40:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 04:40:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcLbW8m0d5WoJEQp5A9IJKHA4j8NpkR1Le6ZGfukQK74Iq1uHir+N4DsowcDFDjZDlLfBZSRlFX9dFa2lSNI4OKIWH6XEjxdp7WKlajbz87iwS7KHGugp4+RZUKf4GvopXIGfgDT4jsVBuZW6tFJXfztBDUr88v7BWS5ISUDP72oiUlCLWPDmuDxofUz9TLCY2vXDxaQK5PJZyGQpkBf4P/gee+SGeVCAE/jA5prZo2AMnfDwMs9u1mkfcmZdIc2Cf5dkFkgsA82nyaWA6wQ4+WC14zIvYw3pKtc4m6ni7QI+C2gCE3Qajd6FLjkv6IKatOUIth/XwI0UZTQG3/m+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICgDhymPaEbUrnT+JmF9FudE/C1axrg00wMSfZcqW/4=;
 b=TZk02snCRSiNd9fIzUAUFr2G8Pkwr5jFxErRHASZaSjdHM2QqaBLgPRKSLLNgRXZ6Z8jOhqdPcvk7ZgVGquFMJK+hxpBkrY6n37z12Hbxd115UAmekPlSapqPV5wdnE/3VCutXc0/gx1BocVx/NSqmtyqdvFpseNw0i+t2s1byNhuigBGmATCxS5STGpCDknw1AyAPgonwwQbDtHgxo0I938FRhQ5ONsYLdjBKnOKJR7kbdUp3XrYZNU4i+L2mUxe4UYQObz5YmeYWq4I4lUgTmWWI2WEgNu2fkFWOxaExPwGzG6krrb3fJsqa5uk+zXBzGfc54sk4w96KEk3bUwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 11:40:53 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 11:40:52 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: Re: [PATCH i-g-t v1] /tests/intel/xe_eudebug_online: Remove
 vm_open_trigger on debugger reattachment.
Thread-Topic: [PATCH i-g-t v1] /tests/intel/xe_eudebug_online: Remove
 vm_open_trigger on debugger reattachment.
Thread-Index: AQHbJggIZvVFT40ySk64pyLKKdD5RbKVxxUA
Date: Thu, 24 Oct 2024 11:40:52 +0000
Message-ID: <de2dfcd96e63597e4eb6ed6a44089195bc2d2923.camel@intel.com>
References: <20241024112917.327660-1-jan.sokolowski@intel.com>
In-Reply-To: <20241024112917.327660-1-jan.sokolowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SA2PR11MB5049:EE_
x-ms-office365-filtering-correlation-id: bd60ba83-3305-456b-61ea-08dcf420b724
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QmZuUERVSU9hOGNkdk5kejJPSlpPMFgvOXFraDUvRkY5K1pLajB4SzVKek9N?=
 =?utf-8?B?bm94QWkwWFQzdkJtUGRLTkh5enBFb3dSdGFpVFVOZWZ1c1QxNkxwOVYwRmR0?=
 =?utf-8?B?bjg0ZFFqYUE5V3BvbXVzWHBoOWZZSmxyYWhTWkRnUnZjUVgxalRFZDREdzFG?=
 =?utf-8?B?dklLdkFvLzU5U00yRU5lVXhrZlN5SWRIaW9malgvVlNUMzNjN01JbThETit2?=
 =?utf-8?B?SFZDaGhob0JKYWFaRmRHQzRZVDh2ZDhGZGlvcUcya1ZRS0Z1ZnkrV2dKMGsw?=
 =?utf-8?B?d1lRVkh3RGJEUm1hMlp5ajBZTCt2VFZEYjNGVFVuT25SR2FSbk8xaHlpaE9G?=
 =?utf-8?B?eHBHWlhaZjVIUWJ1WW5GcmhxWFl6TldRZmU2clo5SHd5dW9COWRtUElVcHVT?=
 =?utf-8?B?eXNIRlZIa3RxUVkzKzNST0JVVXN4RElralZFbCs5SCtYSksxLzVLb3ptcjhQ?=
 =?utf-8?B?MlYwdjRkVkxzM3hoYmt0OUNlSEYvN3k1Q21vbjgvWlRURDJyOEhUUEpWVnky?=
 =?utf-8?B?azhLM1l5bXNXVzlMSG8rMGpsaEFnMUFiMzRMclA2L1FvSndkT3dxUk1sdHJi?=
 =?utf-8?B?cjdIZjlocnUvNmZWa21JM0p2cm5sWTVLMWwwenNkTmFwMzJVcEJaRTE5blpu?=
 =?utf-8?B?MDIzNzNMMHc3OXpLN1hSUW0wVmtNaGlabGROakxFTmVXbUFhTXFIUXFBMytI?=
 =?utf-8?B?RzJiV3JndUJiVE90WElFNWtlTVpnUGVyU3BjRGp6MTcvQVhKMUVLWnVvakox?=
 =?utf-8?B?c1gwSHZyQ1lycTYzMHVtb0lMdkdDckE4NW9sTzE4WnYyU2lvUGJBWU9ZQWJN?=
 =?utf-8?B?RFBKb2tJYjZES1RjaGFJOE4zaHJVeEN2YUVtNjBDc2JsVFNkMy91ZU9xd1lP?=
 =?utf-8?B?eEpmOVJuU1BDYllhVkFlSEJLKzJpQ3A3a3YraXpscXIyY01HbW56QndmZlBD?=
 =?utf-8?B?WDhLMmxEQTlUNGNnUyt4MDF0RWR2bERPTW51ZzFLUy9tNi9wUTRMVCtobnN2?=
 =?utf-8?B?UW91NTh0eU9tcGVZdEN3QzJIYlNPTHBhSkU4RnpuMVRIU3ZRYURkcTh0TDVL?=
 =?utf-8?B?RzBvTDltZGs3eVhpUFVIY1I5YkltdDc2NjJDcUhHKzFlS00yR2FEVU5rNFNw?=
 =?utf-8?B?RFpCRWtkRGdZWmcwT1V4Smhhb0U3TmttZ0FzRm5jRDg0ZHNKSHNaUFRKS1k3?=
 =?utf-8?B?bm04aGpERDBpMWxrQU0yVGlGcDhNTGVhUzIyTnozMGxzOHlwUUtTWUVFeGpQ?=
 =?utf-8?B?ODVwUnRVR3c5VVJwaitxMWNVdGRZVkEyUWRPcHNHQkpMU0s5elpJS0poakxl?=
 =?utf-8?B?MU8vQ1dnbjd6dFdNZVpXNzFVZHpMU1dVMElWSllBa2JoVUZNd1NadFhKMDNo?=
 =?utf-8?B?QTEycVdIUnZ2UGF0eGRuMFFtNE5iR2pETFVCckZ2NGhZRmFvWE9yLzd1MTF0?=
 =?utf-8?B?QlJQTGFlZVZINlBMeVJDR1FiajhCUFlOT1JoNnZWMVpCdit6WTkwalpWaFdC?=
 =?utf-8?B?Tk0wS3llbVRVbysxbWU2THI4UllHVkhSeWtrRlNBOUZTTUFTaWNsS2FWY2Ri?=
 =?utf-8?B?cVlJaEZwbytmTkRBb05mRWpnbUUyc0MxMHNuUlZGYkVrQ3ZnNGdHbW1peGJo?=
 =?utf-8?B?ZVZqQTM0ZWY1UWxSVDY4NWNtdzVrd0xMem43ZVhOdW1ETDFxNnczYTBBMlA0?=
 =?utf-8?B?WFdTdEN6bkNaNk9VVXY0d1lLQmxXRTFXR3gvYXorbzhuTnlGUjhqYVNra1ZW?=
 =?utf-8?B?cVJhdU9UTDhndlVKRkdwQ3pwaFFRaHdJTHZWWVphMmxzZVlQcnd4ZGhjbTA1?=
 =?utf-8?Q?6eXdDp7KJuyirzAkzBjdaFYo9R6967KRwCyos=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGRWMTREZnpSRmxZT1NLRnpyVzdBc1AyOTFWRTI3a28zL2UzYmRhN25BajRw?=
 =?utf-8?B?Vld3NkJkVHpGN2M0NTV5elhCQUNwMHA0OHpVcGVTcXZ6L0l3ZWJ6VDBzRW1a?=
 =?utf-8?B?RTlUMlBJSmRyT0dBVDkvOGYxaktPeFdmeTBWcVRUYTRrVitSS1BPcnN1K1FO?=
 =?utf-8?B?K3phTmR6anc1VE5JeGpDMUVXTUNnME5tanhoeWJKSVArdEZhV3B6Uk9UUkNG?=
 =?utf-8?B?SGkrRHNNeHN3MDhQSWF0Z1Q5ZmhucDBDYkJSdUpoVVJNVGpaSGs1d3JnQjZv?=
 =?utf-8?B?a0tTc0diMDltc0Y3bGZ4VVFIay9jcURDU3pKN2dDQUpFdWR1d2R3VGNPMXBt?=
 =?utf-8?B?SVhCbU9JL3JPUGs5VW1IS0N0RGJVTmZIbzdyUTRtdUpoWXFCcnJTRzYvM1dG?=
 =?utf-8?B?L2tYOHFUZEZaTkpoUmVURGN4Nm9yTzJqcnhDS2dYbWRUVC95R2JWTDREeTFX?=
 =?utf-8?B?T3pIdFIyRGgvMGRNTHNERGR6VTJ0YU9SWHBKS0tsSjBXd0ZQOGxrbmZxSUpy?=
 =?utf-8?B?aUlsSEtlWEZ5M2h1WFpUTllYVUZ0aGtZUVNuMCtyM3lESFp1QW5XVERKVXZq?=
 =?utf-8?B?bkk2SjE2L2Qvd3p6bTI5SS9pdkxrblY5Tk15S2l5UGRWNVR6d09rSjEra2VP?=
 =?utf-8?B?bHVyY0twMGJ6VzlkTVdhbEF4elZyYUhBUW13SkdGMHVSZGo5V3BQQ3UweGNr?=
 =?utf-8?B?VEM4aUQzdy83TmNIQ1Q1aEkxTWZRUzFJbEFQa2dFQ0FwSHhhMm9RUWFNUGJH?=
 =?utf-8?B?elArUDh5UFVFR28rQ1hsVHpvU1NNREU5VDJrZk5pL3Z3SGI4OTMzMVBHQXE0?=
 =?utf-8?B?M1NXVllnZlloZ2U3UW5mOE5iaVpROXZodHJCTjRmTnM4QUtKYk8rVC9Dd2lL?=
 =?utf-8?B?R0g3Y3pLdXNNajErVElxVkRiTVduLzlTbzVyRzJRcmtPc054OHUrR2JXWElo?=
 =?utf-8?B?VnlBQmZhZFltNEYwRk03dm9Tc25ZQkcwMXBvYWs0d1FGdTh5M0xWVUh1WXk3?=
 =?utf-8?B?MGtWd3M4Wlp3aStXOWgxSk1RdnRpaXJGK1VIMmZaR25kaUpKZ2RHVTNsY2ha?=
 =?utf-8?B?b1BjRk0zR0gvRmc3dmNUdUJmdWFIK3JVRFJHTUZVdTVmVXd1L3hJQjVjcTJK?=
 =?utf-8?B?a0VrUER2aG9JSnFMQngyaDUxWlZkelBFQ015bXUyQzhabWplSENWNlNvUzBP?=
 =?utf-8?B?VUtETTlnaGtUL0kvYXcxWXpUZ0ZpTXREaE5UeHBPRVVHSFRhUHROdWVUM3Ey?=
 =?utf-8?B?WlhIS1BiOUFyUlV5VUhKWTVqQUlWMDVaSW9HZVArYjZNWldabktpOWsvMTVX?=
 =?utf-8?B?VlhXVjN1cUg5dkdmRGxzQ21pclJBMXRtSytTdHBHejB5M3JxVXY1cEZXeWJt?=
 =?utf-8?B?ZDk3UGh2R08raEd5OXRRWExPcEZhekRPd0lJK3lxY2tqNys2WmxmRGVrQmE0?=
 =?utf-8?B?NXJKVzF1emhqbktCNzZTNWdDUjF6YVV6aFFPQ1dhYWd0RXdvK0lHNjVKNjVs?=
 =?utf-8?B?V3Rad1ZJTnJHRHBkWWtaZThTRnkyVmJldE1aOFZ1RFVUblBobmNuNi9OcCtI?=
 =?utf-8?B?aE50bGZuNmNHZTl5S1Nod1VRMHVZQ1hRUFkzcTdPdFlpWGVjOTYzemx1L2VH?=
 =?utf-8?B?WTJIQTRORmlRVExza21KaCt1Zk03ZzdWWXE5TldHYjZ1bGF6YXA3bjRoUE1t?=
 =?utf-8?B?bVJDT1ZvNXVIaUd4SGdURVpYWTRwY2xqMVQ1NVJzb1FWM2pyNklaTnBZcmxT?=
 =?utf-8?B?dDgwZEZuWXkxTmNFUFpKMkpjSTg5WWRsaU5TRUh4aysxVGFGdThQM3RrRFlW?=
 =?utf-8?B?UzFFWmlhTSsvOUdyRWJldlZPTlhOQmxlZnhMQU1SMkJHUFgyOUxWT1JLcC8w?=
 =?utf-8?B?VThTdnpBdklsTDVVSm5WQVF0MVJWRTJicnNxV1I0UjV4YzhaUHhzOEFVM3pD?=
 =?utf-8?B?eWNpSk42bXkzeGNCcXYrM3E2aEdvbUpkQU1tZm5PSjRqNFJtUzdPR25NMnNJ?=
 =?utf-8?B?UHlCb0VPemErREpUdlBCQ1pmZE9QZjlNOERxbHlLMk5pdU9mZzFUSDM3d20r?=
 =?utf-8?B?V1l5azh5TE41K0N4YkExSmRyNzhDL0wrTlpBQ1RhWHBpSzA3dnpSR2k0bDJL?=
 =?utf-8?B?Zk9KZVNUd2xRNmdIRFRvRTJjdGlkZXBzaHdIWVdTK0V5TFh5TmR2ZVNDTUhF?=
 =?utf-8?Q?McJiZQF1OmDb/qUpCkOWrCA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64F606DA02530E468F70591C9476734B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd60ba83-3305-456b-61ea-08dcf420b724
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 11:40:52.8139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rl+mC/GHX/E9PIoUlLNjQUBCJG9ZuAA1w5fuUmb8waZwhn5s22iyXqeZWPoEDiHEerAPVWZHC3okBgXfHa35WrumFdf1ZrFeD/svhM8pjRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
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

SGkgSmFuIQ0KDQpPbiBUaHUsIDIwMjQtMTAtMjQgYXQgMTE6MjkgKzAwMDAsIEphbiBTb2tvbG93
c2tpIHdyb3RlOg0KPiBPbiBkZWJ1Z2dlciBkZXRhY2gtYW5kLXJlYXR0YWNoLCBkaXNjb3Zlcnkg
d29ya2VyIHdpbGwgcmVwbGF5IGV2ZW50cw0KPiB0aGF0IGhhdmUgb2NjdXJyZWQsIHdoaWNoIGxl
YWRzIHRvIGEgdm0gZXZlbnQgYmVpbmcgc2VudCBhbmQNCj4gdm1fb3Blbl90cmlnZ2VyIGJlaW5n
IHJlLXJ1biwgd2hpY2ggd291bGQgbGVhZCB0byB1cyB0cnlpbmcNCj4gdG8gb3BlbiBhIHJlbW92
ZWQgdm0uDQo+IA0KPiBPbiBkZWJ1Z2dlciByZWF0dGFjaCB0cmlnZ2VyLCByZW1vdmUgdm0gb3Bl
biB0cmlnZ2VyIGZyb20gbGlzdCBvZg0KPiB0cmlnZ2Vycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBTb2tvbG93c2tpIDxqYW4uc29rb2xvd3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGli
L3hlL3hlX2V1ZGVidWcuYyAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gIGxpYi94ZS94ZV9ldWRlYnVnLmggICAgICAgICAgICAgfCAgMiArKw0KPiAgdGVzdHMv
aW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYyB8ICA2ICsrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAzMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2V1ZGVidWcu
YyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gaW5kZXggMzY3NjNhMTg0Li42MmY3ZTczNjEgMTAw
NjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gKysrIGIvbGliL3hlL3hlX2V1ZGVi
dWcuYw0KPiBAQCAtMTIyNiw2ICsxMjI2LDMxIEBAIHZvaWQgeGVfZXVkZWJ1Z19kZWJ1Z2dlcl9h
ZGRfdHJpZ2dlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwNCj4gIAlpZ3RfZGVidWco
ImFkZGVkIHRyaWdnZXIgJXBcbiIsIHQpOw0KPiAgfQ0KPiAgDQo+ICsvKioNCj4gKyAqIHhlX2V1
ZGVidWdfZGVidWdnZXJfcmVtb3ZlX3RyaWdnZXI6DQo+ICsgKiBAZDogcG9pbnRlciB0byB0aGUg
ZGVidWdnZXINCj4gKyAqIEB0eXBlOiB0aGUgdHlwZSBvZiB0aGUgZXZlbnQgd2hpY2ggYWN0aXZh
dGVzIHRoZSB0cmlnZ2VyLg0KPiArICogQGZuOiBmdW5jdGlvbiB0byBiZSByZW1vdmVkIHdoZW4g
ZXZlbnQgb2YgQHR5cGUgd2FzIHJlYWQgYnkgdGhlIGRlYnVnZ2VyLg0KPiArICoNCj4gKyAqIFJl
bW92ZXMgZnVuY3Rpb24gQGZuIGZyb20gdGhlIGxpc3Qgb2YgdHJpZ2dlcnMgYWN0aXZhdGVkIHdo
ZW4gZXZlbnQgb2YNCj4gKyAqIEB0eXBlIGhhcyBiZWVuIHJlYWQgYnkgd29ya2VyLg0KPiArICov
DQo+ICt2b2lkIHhlX2V1ZGVidWdfZGVidWdnZXJfcmVtb3ZlX3RyaWdnZXIoc3RydWN0IHhlX2V1
ZGVidWdfZGVidWdnZXIgKmQsDQo+ICsJCQkJCWludCB0eXBlLCB4ZV9ldWRlYnVnX3RyaWdnZXJf
Zm4gZm4pDQo+ICt7DQo+ICsJc3RydWN0IGV2ZW50X3RyaWdnZXIgKnQ7DQo+ICsNCj4gKwlpZ3Rf
bGlzdF9mb3JfZWFjaF9lbnRyeSh0LCAmZC0+dHJpZ2dlcnMsIGxpbmspIHsNCmlndF9saXN0X2Zv
cl9lYWNoX2VudHJ5X3NhZmUgDQo+ICsJCWlmICh0eXBlID09IHQtPnR5cGUgJiYgZm4gPT0gdC0+
Zm4pIHsNCj4gKwkJCWlndF9saXN0X2RlbCgmdC0+bGluayk7DQo+ICsJCQlicmVhazsNCj4gKwkJ
fQ0KPiArCX0NCj4gKw0KPiArCWlndF9kZWJ1ZygicmVtb3ZlZCB0cmlnZ2VyICVwXG4iLCB0KTsN
Cj4gKwlmcmVlKHQpOw0KV2hhdCBpZiBpdCBoYXMgbm90IGJlZW4gZm91bmQ/IFlvdSB3b3VsZCB0
aGVuIGZyZWUgdGhlIGhlYWQuIA0KQWxzbyBpZ3Rfd2FybiBpZiBpdCB3YXMgbm90IGZvdW5kIHdv
dWxkIGJlIHdlbGNvbWUuDQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICogeGVfZXVkZWJ1Z19kZWJ1
Z2dlcl9zdGFydF93b3JrZXI6DQo+ICAgKiBAZDogcG9pbnRlciB0byB0aGUgZGVidWdnZXINCj4g
ZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9ldWRlYnVnLmggYi9saWIveGUveGVfZXVkZWJ1Zy5oDQo+
IGluZGV4IDZlNDY2NjMzMy4uOWFhZGJlODQ3IDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfZXVk
ZWJ1Zy5oDQo+ICsrKyBiL2xpYi94ZS94ZV9ldWRlYnVnLmgNCj4gQEAgLTE1MCw2ICsxNTAsOCBA
QCB2b2lkIHhlX2V1ZGVidWdfZGVidWdnZXJfZGV0YWNoKHN0cnVjdCB4ZV9ldWRlYnVnX2RlYnVn
Z2VyICpkKTsNCj4gIHZvaWQgeGVfZXVkZWJ1Z19kZWJ1Z2dlcl9zZXRfZGF0YShzdHJ1Y3QgeGVf
ZXVkZWJ1Z19kZWJ1Z2dlciAqYywgdm9pZCAqcHRyKTsNCj4gIHZvaWQgeGVfZXVkZWJ1Z19kZWJ1
Z2dlcl9hZGRfdHJpZ2dlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwgaW50IHR5cGUs
DQo+ICAJCQkJICAgICB4ZV9ldWRlYnVnX3RyaWdnZXJfZm4gZm4pOw0KPiArdm9pZCB4ZV9ldWRl
YnVnX2RlYnVnZ2VyX3JlbW92ZV90cmlnZ2VyKHN0cnVjdCB4ZV9ldWRlYnVnX2RlYnVnZ2VyICpk
LCBpbnQgdHlwZSwNCj4gKwkJCQkgICAgIHhlX2V1ZGVidWdfdHJpZ2dlcl9mbiBmbik7DQo+ICB2
b2lkIHhlX2V1ZGVidWdfZGVidWdnZXJfc2lnbmFsX3N0YWdlKHN0cnVjdCB4ZV9ldWRlYnVnX2Rl
YnVnZ2VyICpkLCB1aW50NjRfdCBzdGFnZSk7DQo+ICB2b2lkIHhlX2V1ZGVidWdfZGVidWdnZXJf
d2FpdF9zdGFnZShzdHJ1Y3QgeGVfZXVkZWJ1Z19zZXNzaW9uICpzLCB1aW50NjRfdCBzdGFnZSk7
DQo+ICANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMgYi90
ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+IGluZGV4IDAxY2NmNDVlYi4uMGVmMGQ4
MDkzIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+ICsr
KyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gQEAgLTE3ODUsNiArMTc4NSwx
MiBAQCBzdGF0aWMgdm9pZCBldV9hdHRlbnRpb25fZGVidWdnZXJfZGV0YWNoX3RyaWdnZXIoc3Ry
dWN0IHhlX2V1ZGVidWdfZGVidWdnZXIgKmQsDQo+ICAJZC0+ZmQgPSByZXQ7DQo+ICAJZC0+dGFy
Z2V0X3BpZCA9IGNfcGlkOw0KPiAgDQo+ICsJLyogRGlzY292ZXJ5IHdvcmtlciB3aWxsIHJlcGxh
eSBldmVudHMgdGhhdCBoYXZlIG9jY3VycmVkLCB3aGljaCBsZWFkcyB0bw0KPiArCSAqIGEgdm0g
ZXZlbnQgYmVpbmcgc2VudCBhbmQgdm1fb3Blbl90cmlnZ2VyIGJlaW5nIHJlLXJ1biwgd2hpY2gg
d291bGQgbGVhZA0KPiArCSAqIHRvIHVzIHRyeWluZyB0byBvcGVuIGEgcmVtb3ZlZCB2bS4gVGh1
cywgcmVtb3ZlIHRoaXMgdHJpZ2dlciBmcm9tIGxpc3QuDQo+ICsJICovDQo+ICsJeGVfZXVkZWJ1
Z19kZWJ1Z2dlcl9yZW1vdmVfdHJpZ2dlcihkLCBEUk1fWEVfRVVERUJVR19FVkVOVF9WTSwgdm1f
b3Blbl90cmlnZ2VyKTsNCj4gKw0KU291bmRzIGZpbmUgZm9yIG1lLiBMZXQgc3BsaXQgdGhpcyBj
aGFuZ2UgaW50byB0d28gcGF0Y2hlcywgb25lIGZvciBsaWIgb3RoZXIgZm9yIHRoZSB0ZXN0LiAN
Cg0KUmVnYXJkcywgDQpEb21pbmlrDQo+ICAJLyogTGV0IHRoZSBkaXNjb3Zlcnkgd29ya2VyIGRp
c2NvdmVyIHJlc291cmNlcyAqLw0KPiAgCXNsZWVwKDIpOw0KPiAgDQoNCg==
