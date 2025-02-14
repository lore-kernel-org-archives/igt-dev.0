Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9893C021A4
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D87010EC34;
	Fri, 14 Feb 2025 10:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMXs+8a5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE69110EC34
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739528555; x=1771064555;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h+eOtffACfZa0x/2FmAAXebhzfvYGz5idz1/aqIzCIw=;
 b=FMXs+8a51j9Sr5E4t2fgFVDei+Xozdzax+DuinmCHG+pGJShv5/qtQrv
 OFMQsgsx5OvJVhyqGwTYvRhQAlont/HZHol/01P8/uSJ7YcyI9f7H2pT6
 SFzswaCRZgSrmbyqGnwYDJYijn8zG+v2dqcjBQynQSD8MkttQV2Pw7+9o
 +BKh+3nGALuh9gpL5qDTmETTe4RzWbmvxJZJ1isD98UyBu4s58CcQrh6l
 KnFOKCAzPbI+YMn0wGijVvSJdm+mqGAQAjXiQwF2vT4Wm5Cg8GqQm09rg
 NyOmmTR0/wl/V8AX6ZdPIFe57c8Jbi4M9fYbSpkLr2z0JS5SEHjwAIPrH Q==;
X-CSE-ConnectionGUID: VWTan8ibTIaFpMCk7n5BAg==
X-CSE-MsgGUID: 1l45cIhjRLupHhimPJ2QVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40305405"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40305405"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:22:35 -0800
X-CSE-ConnectionGUID: Qu2fRvQDQUyC+EA/MiZ5zw==
X-CSE-MsgGUID: HcAaUREfTg6Mxiyn6uUxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144353683"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:22:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 02:22:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:22:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:22:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpNZ/Px6CmGJebQ2UicJEpm+PZCZoAxKAKkd0bHcT5RuSBe67XXDbyHCgPTJvCA+4RcI7PvwtCaJLA54hKmmZYM7KU5o0/xMmGjNY1RhN7o92Vj23fPXARZbJv9FmheR8xGPK4M32j6KOtFF1LhhIZ6gCwvxK8W6KQROxaYetRdRk+4NGDzMnY0nexc95F/lQgyKdkavsipbDbj9YXhLTzZD266aAgNzSVdBVGrYCyKumC9gAkkN2uWGchM1QTmSNmM4wwnMEngdLSS0FHsnAvSetrYJQyQteK2gqQUD6yqWUbNDvjkiLmaP9WqSfaAAWIwV9io9NLXYkVr/v7MI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+eOtffACfZa0x/2FmAAXebhzfvYGz5idz1/aqIzCIw=;
 b=hDSuVs4qbqJPanPyv56bAPgmjC9AvZcsK99CVQRZp97LJ1BNFN1q93at8oCioKfYhTvsxJY6ouIGil2YcA2QiXmJY7qitJn87CRjLkxa3M/PdpIUAfPUehQsxfOQAqSC6IDu0VDZd6gB6CdM6XA6LnSHnPsnApsWclK7MKLVXvyoQdpQ1ZUXml9KjUt9EUsTnj/J239xR8LdLNpMPQ/yBrJQzYlRjhtJSteHmhmb05IpbiFpfAQB9DLTNb9r6gLV2w/qY3pts6agY0MeqsXZaTxi3qHq32jI/oQR7FzwsBt2ChjSe2AB6trSgXUQ5gs34AoAOas4vqj5P5O4vXIUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DM4PR11MB5264.namprd11.prod.outlook.com (2603:10b6:5:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 10:22:32 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%6]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 10:22:32 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 2/3] tests/intel/i915_pipe_stress:
 s/i915_pipe_stress/kms_pipe_stress
Thread-Topic: [PATCH i-g-t 2/3] tests/intel/i915_pipe_stress:
 s/i915_pipe_stress/kms_pipe_stress
Thread-Index: AQHbfH+rr9pTyNrfeEiUwSRajfyJZbNGm4eA
Date: Fri, 14 Feb 2025 10:22:32 +0000
Message-ID: <IA1PR11MB6097528D1483088FFC638D1586FE2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250211122743.329838-1-swati2.sharma@intel.com>
 <20250211122743.329838-3-swati2.sharma@intel.com>
In-Reply-To: <20250211122743.329838-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DM4PR11MB5264:EE_
x-ms-office365-filtering-correlation-id: ee96d411-9ed3-47fb-7358-08dd4ce17df5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VlJzOW9pYU9ERWZERHdWS3dCQzIzUkN2Z20weVZRQklSRzhGdS84aXFvZXRv?=
 =?utf-8?B?MjlPdFRVZEFrbm1YSG5UYXpzbVRlSXVMK1RMS05aQmJaNjlveGdHYmRMQmFi?=
 =?utf-8?B?LzZobFB1MWlDY1FUOTREb1BpeDE5OWUwbldJdGFuYjg3VXFzamc3MVM3Smwr?=
 =?utf-8?B?THlzRXozMFNVSUcxNFdCQzVWSjF1U0hMcGpiUkxkZ3JEQXpHVVlRQ0tDN3hI?=
 =?utf-8?B?LzFyZnV2QW52WXpoVExjVWt3Sm5jRENqcmRkWlZIQUVuZTVIckRlS2VJVnZa?=
 =?utf-8?B?YS8wSkl3QVhRRG5hYXQ3UkdKUGRYQ1oyUnpKVXQ3UXNicEhIRnVOOW5ZSWdo?=
 =?utf-8?B?TW9TdjBRY2dvT3FDdEdGeUZzTVZjQUVybW1WWTB0T2xrS2RuUjIxK2JnWDdS?=
 =?utf-8?B?RWlCWXRxbzZPSEVyMmkxZzkyRC80blk4TDJqRnBNRFN6WHMwMVRjTmJ2SjNv?=
 =?utf-8?B?K2J5U1B1SG1VUGRiakoyc3V6LzZJbTJMNUxGeHA1TFkzZnRveFd2RHNTTFZL?=
 =?utf-8?B?ZmdqSVVrWk5EcWZCL2NkeGM4aTM4b29VRmhsajA1T3djczVoYUk5RXVsOHla?=
 =?utf-8?B?YStBbVZiWUZtRnFrTzc0a0pnMlNXR2JBUDVoRlV6R0cwMGFWeEZaWkxMdDdG?=
 =?utf-8?B?T1FuN1habC9xWmVLZUFMclR3TnlwMkxRNDI5MXJ2YlJDSGhld1BLWTJtdEF1?=
 =?utf-8?B?QVRCUnpoL2xkNXk2U2l3V3FJZG9WaERyVVFJUW1mZFdacFNKaTh6ZlhTSnNI?=
 =?utf-8?B?cU0zZUxoYW1qbHRxZ3c4RVA2bzBXaUxOazRQRDNFTnhNdE9pSmUvNUp4WllK?=
 =?utf-8?B?VFNacHpISGR6TjhLNVluVXVFQldOVVV1cHlSVVJXWUlEWmQ4dUVua2NwenIv?=
 =?utf-8?B?ZG50RTJISUJjZFFNOUpVam5KdDBxTnNHWXlZMmx5STVZVTVZRWdaNGRLZEtW?=
 =?utf-8?B?Z1o3VmxiNXVpV2xaRUoxWEFHcldhdkdOZURpdENOS2lUeEpyRVZxeWQ5ZlZ4?=
 =?utf-8?B?cWtGeU5CKzRmYUQvbC9yMzVmWlBBL1N2YjlxeC81NE5ObklqMHB0YlBKVU1w?=
 =?utf-8?B?OC84dkRHOTdJalZIVk5uUjBXNE1tODFHZ05UN09OUCtxdi9NaTJuSW96SlV5?=
 =?utf-8?B?MmNDWmxsUGlmclI2akREVmdXZ1U5bUJtUXNtbDNxOGFMMUdwS1RZUDg0cTAw?=
 =?utf-8?B?R29KTEJMeXBjYUlQT045b2dGOGhGeVMvbitDU3R4aWdSdDIzbWltbldMbzln?=
 =?utf-8?B?NDhiZDNhd2c4d0Y5czJSRGU2bm94OStMYldVMmFNcS9qTk5xNXJvVzMvaENI?=
 =?utf-8?B?QkU3S3ROYXNjeW90NUZqa0VYTGN1OFhzQzk1NG1xdEpzWnBsVFpFTDhEY3B5?=
 =?utf-8?B?cmJqOWtxaGZUUDdrZC9uNmwvS0xMejlLSGpPaVQrTVpQc2U0RjdRU3Yvb3Yv?=
 =?utf-8?B?NzAwTzJod24wVjZhbDBLMTRkajF2M01FOS96NGtaYVBwelMwb1JZUmlOYWNM?=
 =?utf-8?B?NUJhSUlHNG9ROEgvT3VIVVNacytyQ3B0dXpLOUl4dENyNzhUWWZLWCs4d1lW?=
 =?utf-8?B?YzM3SGdocTM0a2Q5T3loSjBYVVI3TC9qZENuaEZ1Tjh5UEh0OElrWndBenVX?=
 =?utf-8?B?Wk4vd3Nodk1QSm9BenJwOEpqRTRMSWc4WFg1d1N6MlFHZTFnc0Z2VTl3cGhp?=
 =?utf-8?B?T0dEdTBHbHJjNzVkOThMS0VabW9IMEM3QWJTcmx1MXNtRWtpRzlwQnZEcHR6?=
 =?utf-8?B?ZjFYdm1Icm80eFBhVzlGdDJiVTdWSU8ycWsxSVlYYmdVcm5WbytaYWsyNmVW?=
 =?utf-8?B?eHBjaC9zVGhGRlJMR05zRS9Gb3VDSU9jNGU3TkdkM05XcHQxZ2ZKcU5tSktV?=
 =?utf-8?B?Q1VKZDhPenljdWFUK3FvalBzUkgwbUhtS3JwSGlWbGkySnp3ZlVYbk45aWZ2?=
 =?utf-8?Q?OBAVPiTXVwDMdNghzFt+sBdp6pPilEjc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0dsckN1Wi9xbER6eVFLNkRhZDg0endsT29uQlkwUHlVcUM1NjhsM1QvZWFZ?=
 =?utf-8?B?VHBWUmFHZGU4MUxvMXNiQjJqQnJhbDBqZnlHcWZoZi9HMHBEZjFzeWtKcnVV?=
 =?utf-8?B?bDQvcisxcm5XOFhLVFczVW9mRFZteDJnbS96R0JoeDFXdmZqNnZLUHNHeE5l?=
 =?utf-8?B?eFVrN3VZcElzVEtqenluVi9IdWFnUnd2MGJGWGRDcUcyK3VCT0MxYStBSzhS?=
 =?utf-8?B?Skt0dVFqNnUrVnVjY1lmc0VUQmpQK0o4NmtnN1EvM3JKdWxQMGxjczVMWGVo?=
 =?utf-8?B?RzdXV0l0Ti8vcjBvbHdJMHF5ZVFOaExPSDVSZkZXNEUwUTZhU3lBb2FwRzdr?=
 =?utf-8?B?L3Y3ZXYwaVhjaVR0U1ZqUWdrWEdaTWxjeUl0VUR3bFZOdUNOY0lCSUZmNmds?=
 =?utf-8?B?ZWxsdnU5OVJZMjdueU83bzE0dUtWMGNoSWE1TVhCWEhSVlRCQkpPM1o4MmRU?=
 =?utf-8?B?K2YyeVdicitYT1BvSWwwODUvc2Q5eDY3L3o5VnZGN0VTRUtRd0JuNHVST1Nt?=
 =?utf-8?B?RmVDWkxxKzRmeDViaTgxN1NhaDdvaGROZEJkNjJ2Q0R6ZUhnNVN0Rk11YVgw?=
 =?utf-8?B?aHArSkJDOWdFbHdjckdGbzdDd3BNZzBCQldWWjk5em5XaUFNSUZJUjdkNVo2?=
 =?utf-8?B?Z3BoK01EOWU5OUVFbjhubnBwS0tIaWx0TGhvYUZuMURQOCt3WHdPMVU4RGhO?=
 =?utf-8?B?L09FcGJtY2wyK24zVW1xNCsrOS9yeWM3M0Y3cHVSeEJrREd4Z2gzajRYZzk2?=
 =?utf-8?B?WXZ3MysveFBDa1N4OGpBaUg1NjRDYndtbnpJSWlRSm5tWnZ5bHloSWNZTmVJ?=
 =?utf-8?B?WFdlR1JUTDJ5R0hpZkZnQ1FtS0xXOVM4dGpPZnVsT3VCOFBWWWlmK0t2Rkxa?=
 =?utf-8?B?OGFDTjJvK2pUdzA1bjJnMllQVXo1WTNKMkh3K0pIR0o5Z1hQOG44N3J6VHZN?=
 =?utf-8?B?a2ZIekxpSlc2akIvZXVjR3EweGljUDZaemF1ZXIvUXkwS0dLaFZTS2dYSW1X?=
 =?utf-8?B?ZE1KdXMzckorWVAzTUVLTXlVbldVd1VmN1Z1WENFUjA5YXpQRmw3anN4SFU3?=
 =?utf-8?B?M1VqcFNER3pxTlNRNkk0TUpwclFybitlNG95alFYVVJMdDg4TVdHM1FtcUFV?=
 =?utf-8?B?bDRpVUNpZEtZVnZ3SmRLMjZKd0Y1MHlrRCtNVE9MSlBxcWRoZnlOeFBVTXVN?=
 =?utf-8?B?dXFRcWJFa1NNbDdiZWRya1htVWE0ZjJJb1VIMEVmd2Z2c3hnODAySUY1ZWlZ?=
 =?utf-8?B?YUFxVkVkQnlKLzFFNE5DdUJueGN5MmE1cEZqRGZYaUlwbFAwMThZU1BESEZE?=
 =?utf-8?B?M0VGd2VNeTJpODdxTW14U1ZIS1E1NTBJdWF0b1gyb0prQ2VlUnc2MDVuS1FO?=
 =?utf-8?B?Zjd1Y2hVV3RwTnAwMXljUmhoa2hrYVlVRnF2WlpPd0lobE5sdEsxbzdGUFYw?=
 =?utf-8?B?WkxFS04zUEJrajEyNm9hK3NQK1c4cWJYSVo3UUF6T05tU1VlbDRCSzdYeG1h?=
 =?utf-8?B?Q0tMb0tLVGhkZC9GS1NVeUFOS3ZQL1lVNHAvNFhDdWMveGRnc2l6VTA0a1Ar?=
 =?utf-8?B?RmV2RCtBOS9BTnBJbG1mLzVEQTMyRmFwd1MyZmxPQWNIN2FjSll6RnJ0MVQr?=
 =?utf-8?B?NERsS21TandidE1ib1cwL1dudVUrVjBWd3NCdlZIWXhUSGQrV3gvKzExL21P?=
 =?utf-8?B?OGN4OENWMkQ5M1h1NzRxMTFEb0FJUS9IM0tSL2t4dTZjeTFvU2lnbFVnMWk5?=
 =?utf-8?B?NHlUd1M3ZVdHVHU2cmJDN1lucWZ3VnIvQzRWckRPdEFPVGxpSUttNHg5YUsx?=
 =?utf-8?B?WWZ3UmhHRGljbUlpakRJbHV0dXZkYTNuK2RpU0ZUclN2L1dxZXl6YzBteUk3?=
 =?utf-8?B?MDQ3VGVhbUpwR2NnZG93RUZadzNzSXQ4UWhsNG1oc2Izd0IvVktOZ0RzM0xP?=
 =?utf-8?B?Y09jcHYvdWx1SW5BSVFGbjlvWUY1SVZOdnJOazJYNTZBTkNEWjZHMC9LdDFw?=
 =?utf-8?B?QlJIZDJaWWZrL294R25QMlJ1bi9mblZRM3dRVE8wR2FxcFFZZ25IaVZLcWJH?=
 =?utf-8?B?aXB5OVB0ZS8xYzBmYTJrRUtlY3FjVnhWRnNlRWJHQXJwR2ZMRysramU5SVlF?=
 =?utf-8?B?RDhjMkROSzdnWTdkMGM4ekhXcGV4UnU0cHc5MTR4bG1IT2piajg1V0JYY0li?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee96d411-9ed3-47fb-7358-08dd4ce17df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:22:32.0839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d8EywPH+rcdbOwxJME0sc/o/WB2TKDlVTT01RmYt5uKlD3qrvsW5/ZKJa8x9ZQ1PVqipyIJsg8dQ7bSEkZR2diy7Nvd1XDRnZOkn9i4KQqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5264
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgU3dhdGkgU2hhcm1hDQpT
ZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMSwgMjAyNSAxOjI4IFBNDQpUbzogaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRl
bC5jb20+OyBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVs
LmNvbT4NClN1YmplY3Q6IFtQQVRDSCBpLWctdCAyLzNdIHRlc3RzL2ludGVsL2k5MTVfcGlwZV9z
dHJlc3M6IHMvaTkxNV9waXBlX3N0cmVzcy9rbXNfcGlwZV9zdHJlc3MNCg0KQXMgaTkxNV9waXBl
X3N0cmVzcyBpcyBhIGRpc3BsYXkgc3BlY2lmaWMgdGVzdCwgcmVuYW1lIGl0IHdpdGggdGhlICJr
bXNfIiBwcmVmaXgsIGkuZSBrbXNfcGlwZV9zdHJlc3MuDQoNClNpZ25lZC1vZmYtYnk6IFN3YXRp
IFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBaYmlnbmll
dyBLZW1wY3p5X3NraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KLS0tDQogdGVz
dHMvaW50ZWwve2k5MTVfcGlwZV9zdHJlc3MuYyA9PiBrbXNfcGlwZV9zdHJlc3MuY30gfCAwDQog
dGVzdHMvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstDQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSAgcmVu
YW1lIHRlc3RzL2ludGVsL3tpOTE1X3BpcGVfc3RyZXNzLmMgPT4ga21zX3BpcGVfc3RyZXNzLmN9
ICgxMDAlKQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwvaTkxNV9waXBlX3N0cmVzcy5jIGIv
dGVzdHMvaW50ZWwva21zX3BpcGVfc3RyZXNzLmMgc2ltaWxhcml0eSBpbmRleCAxMDAlIHJlbmFt
ZSBmcm9tIHRlc3RzL2ludGVsL2k5MTVfcGlwZV9zdHJlc3MuYyByZW5hbWUgdG8gdGVzdHMvaW50
ZWwva21zX3BpcGVfc3RyZXNzLmMgZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVz
dHMvbWVzb24uYnVpbGQgaW5kZXggMzNkZmZhZDMxLi43YjAyMGMxOTUgMTAwNjQ0DQotLS0gYS90
ZXN0cy9tZXNvbi5idWlsZA0KKysrIGIvdGVzdHMvbWVzb24uYnVpbGQNCkBAIC0yMTksNyArMjE5
LDYgQEAgaW50ZWxfaTkxNV9wcm9ncyA9IFsNCiAJJ2k5MTVfaGFuZ21hbicsDQogCSdpOTE1X21v
ZHVsZV9sb2FkJywNCiAJJ2k5MTVfcGNpaWQnLA0KLQknaTkxNV9waXBlX3N0cmVzcycsDQogCSdp
OTE1X3BtX2ZyZXFfbXVsdCcsDQogCSdpOTE1X3BtX3JwbScsDQogCSdpOTE1X3BtX3JjNl9yZXNp
ZGVuY3knLA0KQEAgLTI1OSw2ICsyNTgsNyBAQCBpbnRlbF9rbXNfcHJvZ3MgPSBbDQogCSdrbXNf
bGVnYWN5X2NvbG9ya2V5JywNCiAJJ2ttc19tbWFwX3dyaXRlX2NyYycsDQogCSdrbXNfcGlwZV9i
X2NfaXZiJywNCisJJ2ttc19waXBlX3N0cmVzcycsDQogCSdrbXNfcG1fYmFja2xpZ2h0JywNCiAJ
J2ttc19wbV9kYycsDQogCSdrbXNfcG1fbHBzcCcsDQoNCg0KTEdUTSDwn5iKDQpSZXZpZXdlZC1i
eTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbT4N
Ci0tDQoyLjI1LjENCg0K
