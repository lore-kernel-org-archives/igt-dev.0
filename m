Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3FAD12D6E
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 14:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4127710E7F0;
	Wed,  3 Dec 2025 14:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7I4kFlN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA9A10E77A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764772517; x=1796308517;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=CLlmmPJAIGUIYBAoOuPZeFRqdcfr/OUl5em77DPd040=;
 b=g7I4kFlN4ap4Y5Qpi8WS5p1T6TBdfI5NzDGDoQ2YwHlNfQmG1qpJGhDC
 sdXvMlS8he2b6EsyLBVzVMt1rqNWC6yHW1WXR4Ps6dECgYMo+sVSAa0jQ
 nPmAM46Sth2EXW6RB3jUmM9xUDZJqTOB2LjmCM3GTZaMUBA/RJBeERfc1
 N4k3mFx8SdBpWV5WvTuf3/M07/lQ7Ly+O4GtCZad1GW0h2NzcGmJiKDiX
 j9ZYcu14BKADMDNMpI/lAGMm57RZgrXW51h8kh05iMJlLHvjBzvrKB+da
 jWy+/dfvOR9Wp/nHgwX2nS8eAFict5FgRobm+rE9V6eqAc42kekyxDr6V Q==;
X-CSE-ConnectionGUID: AcWgwSZvRwGJRdLufRYNQQ==
X-CSE-MsgGUID: BRyOP3rfS2uzihh2MoJovA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66809261"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="66809261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 06:35:17 -0800
X-CSE-ConnectionGUID: WAr+0A4zSu6fkfPNk31ofQ==
X-CSE-MsgGUID: VMo6/op+ToqA+8GbS7sMiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="218024711"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 06:35:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 06:35:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 06:35:16 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 06:35:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rf6ovu9T5dGFOie2QlKuADaMZIzJqoD96W9k8FDB9K9ctcXsiIQRj98+0JCIafSDu991BCa11SXrRYsc0YHH2S48QPcT19oJoWMPgankgSy1spZ+uRwjgyXI2nDt04Ld2iOL7jYKoFPcPTQvG79FZRYHzeSua35FtDkhp9soSZA3WUYnwtr/dE4rkf4n95cDcduWQLxufIebeyXMeDayalovnVWzLMc5KcjGcfEz+TeDdwwHfwxxqleW0tTkixJnBRAlGiugTFaX+MtWSqoo6IHoh0JaN6/i5yWQZ3UDaCDhwOkB6M1bLaPMs0QlngfsB8XAbTFpbNyNKZ0ygZ4wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLlmmPJAIGUIYBAoOuPZeFRqdcfr/OUl5em77DPd040=;
 b=eD2CEV9xP4xlFD8/eK9fQ/lbOLIVtTA8m1F8KH9MZO2/RxWkf+6Y2wJAjuhCsPpWoAxCEwLlUy+9RdxQVhKGY8MhAVKaVxMxTq/apFnOpDqRAKBeRzPEhDLoClGnWznL/MzTv+7CQ7dyY39mFfv3VQYtYVFMQ3AftzgipBPmXXMd/raWavrLjU4jBd0khpNrXUXWnFmtS6UOejNIScwULl3tLGmF8tDAub2Vtc17moAlrHUnXnpDh8noiOCQkMdSAtOudynhd5xKFl573W6F5k2Fz8J9qBMU4SkwTgLLkwaig78ZfSmTePeLUjyM1M850OE9AvQW3ygM7BYZ57kazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DS0PR11MB7877.namprd11.prod.outlook.com (2603:10b6:8:f4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 14:35:14 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 14:35:14 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH v10 07/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 fault handling test
Thread-Topic: [PATCH v10 07/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 fault handling test
Thread-Index: AQHcY6S+vPpTbmn2EEarOnGQNXSDerUP/MQA
Date: Wed, 3 Dec 2025 14:35:14 +0000
Message-ID: <95c769c9a1b16ccf00f371c83e79c10432b11371.camel@intel.com>
References: <20251202155951.21369-1-nishit.sharma@intel.com>
 <20251202155951.21369-8-nishit.sharma@intel.com>
In-Reply-To: <20251202155951.21369-8-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DS0PR11MB7877:EE_
x-ms-office365-filtering-correlation-id: 967fb929-1c43-4870-2937-08de32792beb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eW1oNmc3TkF4WEdYeGpHd1drblJPNzk1c2MweGxIVWNSbmh5NHJTenY5anVP?=
 =?utf-8?B?S3FwOG9mWE5wSXNNWTVncDJRSFMybWM3VHEyOHQ5TDJhcnNwSk1OeldFcHNI?=
 =?utf-8?B?TGNOdkk4Qis4aUpJNnVPUkkyMXhFR3h2N0kyREIrY2s0czhTUHdNNUV6LzZH?=
 =?utf-8?B?bzB1MlEwV0c1WDNiSmUzbTJUR0UzbTdhc1lDNGVVdDdwenJuclJuemd6Mm5K?=
 =?utf-8?B?TEdTTzNPUE5taVBRYVEzRkN1OHdGRU9PVCtqWlJIUnEvZm1PMXpKdWo4TWs4?=
 =?utf-8?B?RkxZNGdiM3JaTUdpOUhNZDB6SkRuK1ZxQUQzQXljSUlBQW11elVCWnd3cGNE?=
 =?utf-8?B?S1FZYUpzZlE1d21SblFpak00em5XOHVtZWZHWXpIeGt2dGNvTDlBLzNKd2JK?=
 =?utf-8?B?Zi9PMzNLNmd6bEp4R2pQV29aSG9UZnlIaUZ1bWFQWk9qZDFKWGRlOVU2M3Nu?=
 =?utf-8?B?M3JDVFZ5Zy9KUWM2WUlqbjdVL2FDTkxIcklJWkJFUlY4aEhXOEY0anBxZ0M0?=
 =?utf-8?B?QjNtMjlwcGk0NThwZlFSNXd5bDZWdXQ0dXBkQ21jUzNMa1d5LzcwRERPRS8z?=
 =?utf-8?B?L2dDKzhkQnFXa1NDMEEvU05JZTRyNk5wMkJlK0xOaUU2UzRSNmZ1dllSNG13?=
 =?utf-8?B?RExaSGttcFl4RkpFSjJIOFB0R0dSbnlIWUFWTStTWldKVUhQYmxuK0ZOOTJk?=
 =?utf-8?B?ZFp1dnFOSisrMFBLZXpza1Vhb1E5VnVjdFp0V1dwbEZtZWN0WmRxWlFuc0NC?=
 =?utf-8?B?NXNHRzJFWFQ1T2M5bnF4SmJ4bmd4clpyek11Ym5pQjg3NldhZ3NibHlGLzVM?=
 =?utf-8?B?bmZDU3ZCbnFBSU5GYzhYYlZ3aHhjMGxackp3U2dVZ29GQTF4ZzBrdExycHM1?=
 =?utf-8?B?NUF4eEZkZ1pJb2l5b2lZemVpNDhhMS9XTGwySUhrYXVqYmV5WmJGSEN6UXla?=
 =?utf-8?B?UmJmZVdCZGhSVk44eXFYU2p3N3I4eFllc1VRUHMxRFo1WXNLem9kYVJIZlla?=
 =?utf-8?B?WTVEa1RmUjVNTkx5TnBERkx0OTJWd1gwalExTUlDbEdHRHVpSFh6T2plR3Iv?=
 =?utf-8?B?Y2pJUUxUSzM0Z3ErdDlxZnUwWmZ1eVcyOHh4SWlVOWlvNWhxVWF4TCt2dnpn?=
 =?utf-8?B?WGZpN0NFc1RUY01wcEdFKzg5UEE0VkpFVTVZMWNHM3kyRDFoV0RjME9HTFlB?=
 =?utf-8?B?OVlocFJzZzdqWm8wbzN3Q1BzRU1XNEZCaGxjQkJIbkJDNWVUYU5ObW5HOTJ6?=
 =?utf-8?B?bUJZb25iRjAxV1hsbEMzMW1WTlJ6S0k4Qnk1VUJpTnFJUnM2UzQ0SHNTRm1I?=
 =?utf-8?B?Ri8xWloxQkxOS2h6bDc0L3NlOURpUTdNYmpoV3JVb21aNUNtTGtuRHNXSFBt?=
 =?utf-8?B?WFJPMCtGRWlYWXZoQWhOQk1yUHNuOHFPM0tRd3ljWG40MjFPMDdleWhyNzlE?=
 =?utf-8?B?NDdnVm1xRlExVnFCNFVqVTk2RkR5dGhISG1DWEduQm5kcWhPQkdXTkp3dVpu?=
 =?utf-8?B?TzZXOWgyWGs0NFB1Ny8zSjdJMjlydE5sQU1QZElsMkF6OUZkSmZ1K01YVVFW?=
 =?utf-8?B?YkZITHB1L3Azck5RRktON3lqbWh1UzFrNnp3dDFLRFB4ZERKd1ROK1hWTDBH?=
 =?utf-8?B?ZnpNQnB2cHBkUDI0UkxlS0NxSS9YT1pBNk5BbW1VdFNyd1laZXlnSUl3Q3hG?=
 =?utf-8?B?NDdoZHhsQXBGc21hUks1VjBURDJidUdJM0dBdzA0UUJDZWsxTENGckp0R25E?=
 =?utf-8?B?akNtWHplYUxCVDZNQkM3QmY5NVRFQ3M1cVpPVjNzaSt3b210TDgyOWkzSWNH?=
 =?utf-8?B?dk5YOHZqV2NjTHhoa3pjb0hkd0p0bTFMQnltb1MvNGJ6elJLUURDcHBPK0FW?=
 =?utf-8?B?NFJCRmtLYUI1aWlpdW03QnpaYnVFZVZzNDQvbElLL3g5bmNjZHNsYUJvOXJ6?=
 =?utf-8?B?ZDNjT1AzbXNDbnZkWmg4bDVVYUhxVExMOEpoeWN5bGM2dWx1U1p5QTdkSE1N?=
 =?utf-8?B?bVA2UVh1K3Zlcm5nWUVPSGtiK3ZNMThtbDNzcmlEa3VPRktHRTFBaGlwby9t?=
 =?utf-8?Q?x6Tbkd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckdiWVRqRU85cGljRXBITFZWeHVxd0tOaERrQTI5MjVnZGsvWFJqNEdyc0c1?=
 =?utf-8?B?TDBBemlDcS8wZzVteVFkdHlVY1J2UmJqNWFjTHdJemNqMzhHd1ZPcUlkczFl?=
 =?utf-8?B?dU41L3ZjdFZGcDAwVkR3bWhkTTZWR2NWQ1VkdklTZjlmdEplajlNNnFiUDls?=
 =?utf-8?B?VEZvcFRFT2kwVHlPWUErN084a0huODVPd1V4aUZ3QmdDQ1NEbnN2blRkRnFt?=
 =?utf-8?B?cWd6Z3ZyM24xcld4cm1RaHVQT2pmc3pyNGxoR0RxaVY0K1lCc3hrU3NLSVJ0?=
 =?utf-8?B?RDlMUGFoZG9NalF4NDlkNVF2R2tRMzFHbHN2SUFCaFkrOUVFTTlqYjhFZDJB?=
 =?utf-8?B?WFJ3dm1OL053WFd5ZEdoVlY0RElPSDIxVWc1UXA2M0lkQ0RkcWxXeC9sNjZU?=
 =?utf-8?B?UW9iQmNPYTBMcnVZTUxTdVAvc1ZERm4xeGdXckRuUVZoSlhIdGg3SmcxbFFU?=
 =?utf-8?B?d3J1WnVLc25OMDk2NC9mcjJEbXVtbWo0RVJOTUNiOUFOblUzV1ZEYjVnN2xk?=
 =?utf-8?B?eUU5cEExZ0JIOFBqWk8zWE80WG5WS0Y0Qkd6NlhUWGZRQVFwQ1hSZDBJWnc3?=
 =?utf-8?B?c2ZOc0JaWVBGOWZ0OGlHWDByMEc3UDIzcjBBVDdxYXNmTzVQMWhGUURzUGFv?=
 =?utf-8?B?L1dhUExob0dVVUxXVzhYempGam5xeUw5RXNvVVVRMnRrNlNBS1JrSjJRdThP?=
 =?utf-8?B?eFI0K2JhNmVLaVkwamhwaWpIUDRpZFNMbDcrL08yYUJaQ3RmYlh0eWFxWjJx?=
 =?utf-8?B?aGpTSEd3WXJ4czNxclZwRTc5SU9nWU9ORHhMSFYyZHY0SThqSDFWVXBIejhR?=
 =?utf-8?B?MjBlbmFTNXlDNzNtM1FsQ3pobzZUNXVaN2dLOXA1Mk9hZ2tvUGFBVmt0dHQ3?=
 =?utf-8?B?MWFGK2FMcFlQL05YSTZFVlNVQjJGenNPWWkvSXNUOHljZS9NS0ppTTdJc0ND?=
 =?utf-8?B?S3hkeHd0dW8yVHF6NFFpWVRxakxIRFdHSTAwc1MzUjk4VFh3N0lEcTZSaXNi?=
 =?utf-8?B?NlVOMkZ4VzhuTUpORGpXMzZMSkNqZmkvdTlnVlBkOHo0c3hJKzNTN3R4WHkx?=
 =?utf-8?B?U0JJcTRONk55U0hNOFMyRUI4MjJjZnZUM0J3dXgyei9lNkl5cFhOekFkejV2?=
 =?utf-8?B?SmlUYVNLZHVFandlalNxK1daMlVpZ1NxUktURExJb0RTUTBwSWRIRW9TRVlD?=
 =?utf-8?B?NlV3amovMnN3dmlQLzZYVlROYWJZSzJ6SVFPUlZXYkFVeHF3OGdiUW56MUgw?=
 =?utf-8?B?ZWVQcFplRUM1Q0k3Um02RGZoVVEvTU1CV1ZIbjBRZHg3ekw4YUdERWlrODNF?=
 =?utf-8?B?K2FwSlhZWjdLb2E4eG5uQ016WkthMlg1anFIVnRZL1RBenR4NWlzTEVkdXdR?=
 =?utf-8?B?VUNZc0dRdXdJeFo4TEdaUGF1SmdRV0xXT1JtM3FJTzlnQlZYNTRiL0tPUEFR?=
 =?utf-8?B?TVR2TlJUbjNQcFZHVjM0c2hhRWFscWdTc0pCcnhTckpZTFFnSS92Tm1WcnE1?=
 =?utf-8?B?WXBFVUxOaFkxRDk3VXlZcGcyTVdXODlWNkRrRTFZUTFwMk41T0ZJN1BCSlBi?=
 =?utf-8?B?SFE2aFBWeWN3V0xrL2RmdVMzdEdUckRYUnY0ZHJ6M0hvWCtEMHBVWEp0RlhZ?=
 =?utf-8?B?VmpxcitrZUo2UTRNZWNIS2hlUkd4SlVoYlM3RVpNeFdmdno3UGd6NERVZGNN?=
 =?utf-8?B?NFJ5akVkeFNCWndrb3hFaXEzMWdOSkEzNjdONW1Zdm9HVFBBQ3A0SDZzWVVL?=
 =?utf-8?B?bDhWZDVHOGVsUHBYWG5teE1IbndRczdNeHhwSkkyNGJ3ZFY0L1dQblRSR01X?=
 =?utf-8?B?R0ZVU2hRcFRRREp1bXpiVWVCb2R4bWhIV2lobTV3ZTJ5NEpUNUNWdE02K0pS?=
 =?utf-8?B?ZEdpUSt6N0ZYci82bHNtN0JWdGFPSkZ2SEd5bmNqcko1ZHRIK0RCb3MrcmpW?=
 =?utf-8?B?RkFZYy8rcDV6TnM0Q0c5bVQvVkxjemlqY3BwYk02OUROTUpBaE5WVyt5NUNo?=
 =?utf-8?B?ZHdRR3lDZk9TOEFmd1d1cTJ4eS9HRVg2aEprY2UwQnp1QS9HNzZoZ2lQTGhX?=
 =?utf-8?B?K0tlQmpEVzhxalc5eC9XM1JIT2JmY093dStoNWppU1lVQ2xCS0J3aTVhVmJP?=
 =?utf-8?B?cTVYZ1VseGt0RjZqNW81T1dlVkpvUTM1OG1UZE1YcHpQY0tKZmlvcWh0b2Zt?=
 =?utf-8?Q?8fFlwrxV6jK1NwiHjkciI4rPHiUwf6vXf9e5DqYC6Qzm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A7F28E70856D742B4CAA90856EF0D3C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967fb929-1c43-4870-2937-08de32792beb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 14:35:14.2429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPzJQt5Nz10IKLP9EgpelR1NpLDsgsBCDLhVVUZ1KtPanCIMyOw584AhNBFywpyzDJb5vKl7TUfueUUsAMIqhIObUaAxGpv9IVG+P9kSBog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7877
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDE1OjU5ICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgaW50ZW50aW9uYWxseSB0cmlnZ2VycyBwYWdlIGZhdWx0cyBieSBh
Y2Nlc3NpbmcgcmVnaW9ucw0KPiB3aXRob3V0DQo+IHByZWZldGNoIGZvciBib3RoIEdQVXMgaW4g
YSBtdWx0aS1HUFUgZW52aXJvbm1lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQgU2hh
cm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFByYXZhbGlrYSBH
dXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRl
bC94ZV9tdWx0aWdwdV9zdm0uYyB8IDE0Nw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE0NyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfbXVsdGlncHVfc3ZtLmMNCj4gYi90ZXN0cy9pbnRlbC94
ZV9tdWx0aWdwdV9zdm0uYw0KPiBpbmRleCA2MGMzM2I2NGUuLjhkMzI1ZjU3NSAxMDA2NDQNCj4g
LS0tIGEvdGVzdHMvaW50ZWwveGVfbXVsdGlncHVfc3ZtLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwv
eGVfbXVsdGlncHVfc3ZtLmMNCj4gQEAgLTE1LDYgKzE1LDcgQEANCj4gwqANCj4gwqAjaW5jbHVk
ZSAidGltZS5oIg0KPiDCoA0KPiArI2luY2x1ZGUgInhlL3hlX2d0LmgiDQo+IMKgI2luY2x1ZGUg
InhlL3hlX2lvY3RsLmgiDQo+IMKgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+IMKgI2luY2x1
ZGUgInhlL3hlX3V0aWwuaCINCj4gQEAgLTg5LDYgKzkwLDE3IEBADQo+IMKgICoJTWVhc3VyZSBs
YXRlbmN5IG9mIGNyb3NzLUdQVSBtZW1vcnkgY29weSBvcGVyYXRpb25zIHdpdGgNCj4gcHJlZmV0
Y2gNCj4gwqAgKgl0byBldmFsdWF0ZSBjb3B5IHBlcmZvcm1hbmNlIHdpdGggbWVtb3J5IG1pZ3Jh
dGlvbiB0byBsb2NhbA0KPiBWUkFNDQo+IMKgICoNCj4gKyAqIFNVQlRFU1Q6IG1ncHUtcGFnZWZh
dWx0LWJhc2ljDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAqCVRlc3QgY3Jvc3MtR1BVIHBhZ2Ug
ZmF1bHQgaGFuZGxpbmcgd2hlcmUgb25lIEdQVSB3cml0ZXMgdG8NCj4gbWVtb3J5DQo+ICsgKglh
bmQgYW5vdGhlciBHUFUgcmVhZHMsIHRyaWdnZXJpbmcgcGFnZSBmYXVsdHMgd2l0aG91dA0KPiBw
cmVmZXRjaCB0bw0KPiArICoJdmFsaWRhdGUgb24tZGVtYW5kIHBhZ2UgbWlncmF0aW9uIGFjcm9z
cyBHUFVzDQo+ICsgKg0KPiArICogU1VCVEVTVDogbWdwdS1wYWdlZmF1bHQtcHJlZmV0Y2gNCj4g
KyAqIERlc2NyaXB0aW9uOg0KPiArICoJVGVzdCBjcm9zcy1HUFUgbWVtb3J5IGFjY2VzcyB3aXRo
IHByZWZldGNoIHRvIHZlcmlmeSBwYWdlDQo+IGZhdWx0DQo+ICsgKglzdXBwcmVzc2lvbiB3aGVu
IG1lbW9yeSBpcyBwcmUtbWlncmF0ZWQgdG8gdGFyZ2V0IEdQVSdzIFZSQU0NCj4gKyAqDQo+IMKg
ICovDQo+IMKgDQo+IMKgI2RlZmluZSBNQVhfWEVfUkVHSU9OUwk4DQo+IEBAIC0xMDgsNiArMTIw
LDcgQEANCj4gwqAjZGVmaW5lIE1VTFRJR1BVX0NPSF9GQUlMCQlCSVQoNSkNCj4gwqAjZGVmaW5l
IE1VTFRJR1BVX1BFUkZfT1AJCUJJVCg2KQ0KPiDCoCNkZWZpbmUgTVVMVElHUFVfUEVSRl9SRU1f
Q09QWQkJQklUKDcpDQo+ICsjZGVmaW5lIE1VTFRJR1BVX1BGQVVMVF9PUAkJQklUKDgpDQo+IMKg
DQo+IMKgI2RlZmluZSBJTklUCTINCj4gwqAjZGVmaW5lIFNUT1JFCTMNCj4gQEAgLTE2NSw2ICsx
NzgsMTEgQEAgc3RhdGljIHZvaWQgZ3B1X2xhdGVuY3lfdGVzdF93cmFwcGVyKHN0cnVjdA0KPiB4
ZV9zdm1fZ3B1X2luZm8gKnNyYywNCj4gwqAJCQkJwqDCoMKgwqAgc3RydWN0DQo+IGRybV94ZV9l
bmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gwqAJCQkJwqDCoMKgwqAgdW5zaWduZWQgaW50
IGZsYWdzKTsNCj4gwqANCj4gK3N0YXRpYyB2b2lkIGdwdV9mYXVsdF90ZXN0X3dyYXBwZXIoc3Ry
dWN0IHhlX3N2bV9ncHVfaW5mbyAqc3JjLA0KPiArCQkJCcKgwqAgc3RydWN0IHhlX3N2bV9ncHVf
aW5mbyAqZHN0LA0KPiArCQkJCcKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgKmVjaSwNCj4gKwkJCQnCoMKgIHVuc2lnbmVkIGludCBmbGFncyk7DQo+ICsNCj4gwqBz
dGF0aWMgdm9pZA0KPiDCoGNyZWF0ZV92bV9hbmRfcXVldWUoc3RydWN0IHhlX3N2bV9ncHVfaW5m
byAqZ3B1LCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiDC
oAkJwqDCoMKgIHVpbnQzMl90ICp2bSwgdWludDMyX3QgKmV4ZWNfcXVldWUpDQo+IEBAIC05Mjcs
NiArOTQ1LDExOSBAQCBsYXRlbmN5X3Rlc3RfbXVsdGlncHUoc3RydWN0IHhlX3N2bV9ncHVfaW5m
bw0KPiAqZ3B1MSwNCj4gwqAJY2xlYW51cF92bV9hbmRfcXVldWUoZ3B1Miwgdm1bMV0sIGV4ZWNf
cXVldWVbMV0pOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2b2lkDQo+ICtwYWdlZmF1bHRfdGVz
dF9tdWx0aWdwdShzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUxLA0KPiArCQkJc3RydWN0IHhl
X3N2bV9ncHVfaW5mbyAqZ3B1MiwNCj4gKwkJCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlICplY2ksDQo+ICsJCQl1bnNpZ25lZCBpbnQgZmxhZ3MpDQo+ICt7DQo+ICsJdWludDY0
X3QgYWRkcjsNCj4gKwl1aW50NjRfdCBhZGRyMTsNCj4gKwl1aW50MzJfdCB2bVsyXTsNCj4gKwl1
aW50MzJfdCBleGVjX3F1ZXVlWzJdOw0KPiArCXVpbnQzMl90IGJhdGNoX2JvWzJdOw0KPiArCXVp
bnQ2NF90IGJhdGNoX2FkZHJbMl07DQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMgPSB7fTsN
Cj4gKwl1aW50NjRfdCAqc3luY19hZGRyOw0KPiArCXVpbnQzMl90IGZpbmFsX3Jlc3VsdDsNCj4g
Kwl2b2lkICpkYXRhLCAqdmVyaWZ5X3Jlc3VsdDsNCj4gKwljb25zdCBjaGFyICpwZl9jb3VudF9z
dGF0ID0gInN2bV9wYWdlZmF1bHRfY291bnQiOw0KPiArCWludCBwZl9jb3VudF9ncHUxX2JlZm9y
ZSwgcGZfY291bnRfZ3B1MV9hZnRlcjsNCj4gKwlpbnQgcGZfY291bnRfZ3B1Ml9iZWZvcmUsIHBm
X2NvdW50X2dwdTJfYWZ0ZXI7DQo+ICsJYm9vbCBwcmVmZXRjaF9yZXEgPSBmbGFncyAmIE1VTFRJ
R1BVX1BSRUZFVENIOw0KPiArDQo+ICsJLyogU2tpcCBpZiBlaXRoZXIgR1BVIGRvZXNuJ3Qgc3Vw
cG9ydCBmYXVsdHMgKi8NCj4gKwlpZiAobWdwdV9jaGVja19mYXVsdF9zdXBwb3J0KGdwdTEsIGdw
dTIpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwljcmVhdGVfdm1fYW5kX3F1ZXVlKGdwdTEsIGVj
aSwgJnZtWzBdLCAmZXhlY19xdWV1ZVswXSk7DQo+ICsJY3JlYXRlX3ZtX2FuZF9xdWV1ZShncHUy
LCBlY2ksICZ2bVsxXSwgJmV4ZWNfcXVldWVbMV0pOw0KPiArDQo+ICsJZGF0YSA9IGFsaWduZWRf
YWxsb2MoU1pfMk0sIFNaXzRLKTsNCj4gKwlpZ3RfYXNzZXJ0KGRhdGEpOw0KPiArCW1lbXNldChk
YXRhLCAwLCBTWl80Syk7DQo+ICsJYWRkciA9IHRvX3VzZXJfcG9pbnRlcihkYXRhKTsNCj4gKw0K
PiArCS8qIEFsbG9jYXRlIHZlcmlmaWNhdGlvbiBidWZmZXIgZm9yIEdQVTIgdG8gY29weSBpbnRv
ICovDQo+ICsJdmVyaWZ5X3Jlc3VsdCA9IGFsaWduZWRfYWxsb2MoU1pfMk0sIFNaXzRLKTsNCj4g
KwlpZ3RfYXNzZXJ0KHZlcmlmeV9yZXN1bHQpOw0KPiArCWFkZHIxID0gdG9fdXNlcl9wb2ludGVy
KHZlcmlmeV9yZXN1bHQpOw0KPiArDQo+ICsJLyogPT09IFBoYXNlIDE6IEdQVTEgd3JpdGVzIHRv
IGFkZHIgPT09ICovDQo+ICsJcGZfY291bnRfZ3B1MV9iZWZvcmUgPSB4ZV9ndF9zdGF0c19nZXRf
Y291bnQoZ3B1MS0+ZmQsIGVjaS0NCj4gPmd0X2lkLCBwZl9jb3VudF9zdGF0KTsNCj4gKw0KPiAr
CS8qIEdQVTEgLS0+IENyZWF0aW5nIGJhdGNoIHdpdGggdmFsdWUgYW5kIGV4ZWN1dGluZyBTVE9S
RSBvcA0KPiAqLw0KPiArCWdwdV9iYXRjaF9jcmVhdGUoZ3B1MSwgdm1bMF0sIGV4ZWNfcXVldWVb
MF0sIGFkZHIsIDAsDQo+ICsJCQkgJmJhdGNoX2JvWzBdLCAmYmF0Y2hfYWRkclswXSwgZmxhZ3Ms
DQo+IERXT1JEKTsNCj4gKw0KPiArCS8qR1BVMTogTWFkdmlzZSBhbmQgUHJlZmV0Y2ggT3BzICov
DQo+ICsJZ3B1X21hZHZpc2VfZXhlY19zeW5jKGdwdTEsIHZtWzBdLCBleGVjX3F1ZXVlWzBdLCBh
ZGRyLA0KPiAmYmF0Y2hfYWRkclswXSwgZmxhZ3MpOw0KPiArDQo+ICsJcGZfY291bnRfZ3B1MV9h
ZnRlciA9IHhlX2d0X3N0YXRzX2dldF9jb3VudChncHUxLT5mZCwgZWNpLQ0KPiA+Z3RfaWQsIHBm
X2NvdW50X3N0YXQpOw0KPiArDQo+ICsJaWYgKHByZWZldGNoX3JlcSkgew0KPiArCQkvKiBXaXRo
IHByZWZldGNoOiBleHBlY3QgTk8gcGFnZSBmYXVsdHMgKi8NCj4gKwkJaWd0X2Fzc2VydF9lcShw
Zl9jb3VudF9ncHUxX2FmdGVyLA0KPiBwZl9jb3VudF9ncHUxX2JlZm9yZSk7DQo+ICsJCWlndF9p
bmZvKCJHUFUxIHdyaXRlIHdpdGggcHJlZmV0Y2g6IE5vIHBhZ2UgZmF1bHRzDQo+IChhcyBleHBl
Y3RlZClcbiIpOw0KPiArCX0gZWxzZSB7DQo+ICsJCS8qIFdpdGhvdXQgcHJlZmV0Y2g6IGV4cGVj
dCBwYWdlIGZhdWx0cyAqLw0KPiArCQlpZ3Rfd2Fybl9vbl9mKHBmX2NvdW50X2dwdTFfYWZ0ZXIg
Pg0KPiBwZl9jb3VudF9ncHUxX2JlZm9yZSwNCj4gKwkJCcKgwqDCoMKgwqAgIiVkIHBhZ2UgZmF1
bHRzIGdlbmVyYXRlZCBvbiBHUFUxXG4iLA0KPiArCQkJwqDCoMKgwqDCoCBwZl9jb3VudF9ncHUx
X2FmdGVyIC0NCj4gcGZfY291bnRfZ3B1MV9iZWZvcmUpOw0KPiArCQlpZ3RfaW5mbygiR1BVMSB3
cml0ZSB3aXRob3V0IHByZWZldGNoOiAlZCBwYWdlDQo+IGZhdWx0c1xuIiwNCj4gKwkJCSBwZl9j
b3VudF9ncHUxX2FmdGVyIC0NCj4gcGZfY291bnRfZ3B1MV9iZWZvcmUpOw0KPiArCX0NCj4gKw0K
PiArCWZpbmFsX3Jlc3VsdCA9IFJFQURfT05DRSgqKHVpbnQzMl90ICopYWRkcik7DQo+ICsJaWd0
X2RlYnVnKCJHUFUxIHdyb3RlIDoldVxuIiwgZmluYWxfcmVzdWx0KTsNCg0KVGhpcyBkZWNvdXBs
ZXMgdGhlIEdQVXMgYnkgbWlncmF0aW5nIHRvIHN5c3RlbS4gSSB0aGluayB0aGlzIHdhcw0KcG9p
bnRlZCBvdXQgYWxyZWFkeSBpbiBwcmV2aW91cyByZXZpZXdzPw0KDQovVGhvbWFzDQoNCg==
