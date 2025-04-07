Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8C4C36010
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 07:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B10D10E29C;
	Mon,  7 Apr 2025 07:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTBGMFYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DEA10E29C
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 07:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744011455; x=1775547455;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/ePlsySADw5JYyB7pW5MyjtIUXzs1GdmpbUFmfJs+l4=;
 b=DTBGMFYd1w4on2vUXLOq2r1CGJz3iULMPbzh4mxbUqR3y51IumuasbZe
 TCJp02cWUAJbwTX4oSFe+NyoL5h+FRq+NWaTfqmjlbg/nochFq0HntA0c
 gPWfJ3aiovK++L69Ovx1g5pJqBAz2eD+/5pqAD+MpisJODFd4TxcL2Qd5
 0h3aG82nEIlbY0XiliFIOcNN+FGY1TkB0TpprRDS23Uq1j7FOW1Z5G4Ro
 IhieD6Yue/LjhZvW7HYbm0p1V63YuCQtB/19dA2X1sHag3Yn6VZYLNJHe
 fhAm2+XiJ0KarZm+pa+LKLgPXW8TIs790jvIZw22SOXAHThC9FuPfXrMJ Q==;
X-CSE-ConnectionGUID: tg2ej3JHQbyeUxNI0lzX0w==
X-CSE-MsgGUID: BSQKZeevQP+ifIJr/0T8dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56045577"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56045577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 00:37:35 -0700
X-CSE-ConnectionGUID: DQlM3tdCRSyJ7dgz4PrtUQ==
X-CSE-MsgGUID: 04ZuvgIDTBGzQKbB9800KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127719923"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Apr 2025 00:37:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Apr 2025 00:37:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 00:37:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 00:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SokVxzCY0WM4xsvRYzuMuVesZY0IdguOnvsK4/EyoCbX6WJUKxlCsboYHLO0AY6dzBo5WivKJjpx7HaVLLn1Yze2NZcMRD7b3aKDzjsDlosMB//PCwSfp6949PyqRKkzd5kz0G6VoMZuBCkzZuLzXmdR3oUwygBH/bDxo69vjnluK2PIgFQog+RuZXDFaUf8+qOA1eW30/WhVuQTIYRWiwl4Bk+iJ3mcDXi9cXUuDB/p/xG76cYxHoxcjkUMzrtVXbPwSxX/O08Qrf1XkPAvvY8uFYDpoNOe7bF/PDrjgKY4pgGejuipXI/cO483Kjh2esAJPIHJYne9ONaNfsFf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LUOwBok/3VitL9+/RpqsE0nIHy/H2nElU2a56Fjp1k=;
 b=KLc23neUCbhJBeKyzYOAM8XVDIpFRYD2S9jiQrG3dvnGWtejB5xT9IshOvaKyykKxgaOQAOxt9+Hf3RIzqZH5lpobb6Wi3xkghuzMTBH1SgOtDe+8KZqZ0QvBVEA+bvavnLY2Pf92VwjAZRtIawodAt0dB6QPE8Vw2tuHtObn7zlt8iAMXI//ttawiDalPcdhmlHms5+jSrM1zCbIjE4ltEALD2RkcamjPWSPlEpDJuga5XUT9exgUpDo+vEShdxZz8q2+gvorj121fY73G/0sniUbsBWTXhkR1FSZY4EUHMKQkU3VGn5SnKE5eA1OMFMLhUrBM1SEQYxkSfGvFC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY5PR11MB6308.namprd11.prod.outlook.com (2603:10b6:930:20::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 07:37:03 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 07:37:03 +0000
Message-ID: <90d979f3-f49d-411c-87be-9bacf5a252be@intel.com>
Date: Mon, 7 Apr 2025 13:06:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_flip: Add flip-vs-dpms-on-nop subtest
From: "Sharma, Swati2" <swati2.sharma@intel.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250228194240.20023-1-ville.syrjala@linux.intel.com>
 <79f7f21b-cbc4-46c4-ab61-c214a6169f95@intel.com> <Z-wTSwYb5mg1R1Qp@intel.com>
 <8ba86f20-f486-478e-804c-2127e3b40081@intel.com>
Content-Language: en-US
In-Reply-To: <8ba86f20-f486-478e-804c-2127e3b40081@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY5PR11MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 4102dfc5-2d1b-4de1-d558-08dd75a6fd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkZxRTRLVlJWUkViUjB1UngwRkxPNkVZSjY1ZU1EK2w4TFZDaHZVV3l4d3Vq?=
 =?utf-8?B?em9hSVh4RmpPU2diZCsxZXhFRzJZSFBjYUNmSkxEMC94UmU2TmJSVEVZMDFQ?=
 =?utf-8?B?TjloNWc2ZVk2M3B6TzNCZEp5UXB2ZHkzeWhiQmhaRGdTYldDQldCYWhyZWFN?=
 =?utf-8?B?akJZZjc4SkFtUUZMQmNjRDM3WWhUbzU1L3k2QXN2dVZTRmlTZ0R0cngva2M4?=
 =?utf-8?B?TVlCdUdnVkthVVFlcmp2aXIvMUZqR1JlOTYwZ3hBbVVWb2JQTHdVcmtxV3JR?=
 =?utf-8?B?bVZXRkFDYmdTNHhqVmFhL2ZBWkFuYmZkQk9QMXZGaWloTW8vdk9uYjBMNGxK?=
 =?utf-8?B?YXR4MCtYMVVJcHcyT0YwZkdabjFUazRYWllYN3JvVkRSTVJRK2NJMXhTVkEx?=
 =?utf-8?B?elB3NU5xL1FESzdTN25pc2NyL3VFWkc2djZYWDVhQjZoek1OcnZCMnZlcmN5?=
 =?utf-8?B?eHZXakZMb0pZQkJjYzR2MUFma3B4Z1J3Y1FpdVB6UzA1U1NRcGhWZ3hvSjdU?=
 =?utf-8?B?ODNkWXRrUkJwa3RaT0lkL2twT2N4aWhDMkp0M0h3STA1Q1BRVXZtRlZUV29s?=
 =?utf-8?B?d1ltTGw0aDk2bkV2QWZQdm8yd1c4Wm5sZGdBZ0lvblZKZm9vTFZ5T084VjBZ?=
 =?utf-8?B?YkZMVTZoL1BMUFhKcFJsRURqVVI3QTkydE96K3AxcVlXcUZvUEVWdkpjR2hF?=
 =?utf-8?B?QXJ2WmVLV1V1R1pTR1RPVkdxeGlOVElGYUV0M2pRc3owdFp4WjFSbHYvUk9C?=
 =?utf-8?B?cGd1bkU4eHdYNEZDcEo5cFNpKzYrSGxpMjYvT2gveGtVSzNYMURXMUx3OG9k?=
 =?utf-8?B?SStKSDIyT05rVkJwU2lQWGFHVXhOcmlLVGFVbG5hK2x3Qk9FSXNyRG5Xelg2?=
 =?utf-8?B?L29uMHVNVnJpb29SakxOaGdwRUxoK2tkUzZidlpxWFFGOHg3NnE2eXpZbzAy?=
 =?utf-8?B?QWx0TDNiNFJYRHd3UnN1V1pGSlhmTTFWOUFEYjBHdmx3Nkx2L0xWdEFhTi9X?=
 =?utf-8?B?QXl3dnQ0NjhJUDdnNi9ab3ZocnB5ZU8rU2R0cG1FL3o1MC8wQlFQQ0NPNWdl?=
 =?utf-8?B?bFJNM25tS2pNSUlmaU0zd3V6ZVRyTEo1UlRPaVV3YXdZR3FaVVJ4bW9FaTZF?=
 =?utf-8?B?SHNlbzcrLzNZdnBFb1c1V2YvUFhkZTBZTE95TnI2aVRmMWVRVkFRS0xWSkcr?=
 =?utf-8?B?TitJWEFMWnM2VzlJQzlhbWlySCtCZG9rQ085R2Fwd1FRZ254dkVTWFUyQU1V?=
 =?utf-8?B?KzlBeG5tb2lWUThMaDdabjhJVjJxUS9jT1RGaTc0ckw2NzlIZnVrRWkrcTQ3?=
 =?utf-8?B?MGptUzNpQlc0RWlXdlFMRVNXOFVsek1GbktBK1NYN0dKZzArbFAzSjZIYTls?=
 =?utf-8?B?VnQ4MFc5eXVETmNUQm9BeEdOeHdNWk5BMS9Kam9PbnVzTWxTMmRIZm1tSnhL?=
 =?utf-8?B?bXRVL2RqYTRyWE1HUzE2VlRoOUZiUzZlWC9PUDIzcnRxKzlqUVIySjRhY2ln?=
 =?utf-8?B?eURzV0VyQWNZaUpKNXBHd3pKWkRSY1lFVUszRWYwNVN3V042Vk13TnFleDJG?=
 =?utf-8?B?c1VjcDc5cWd1c2orb2FPTFdnbXNobjVkK1dHSHJKR1JmQzlDZWQ1NDkyV2Nt?=
 =?utf-8?B?WXZFTmkyTU9HTThrOG1SSDA1M3E1bnd4TmZScUwyTkhIcnYwWThndXd0QkNK?=
 =?utf-8?B?dXFuQ25vOGpoSHJQaFhHY2FYdkFKUnVBNWVVMS80a0VmdTdVWGF4ZEU3R3Ji?=
 =?utf-8?B?aWNxajFLK1QwNU5tblhySEtyTkFCbTc2K21yMFVZMElhSkY3SXZhWmRXcHEr?=
 =?utf-8?B?UXRDbGxPUS82bmxtUFhOZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGhKRkR5Q0pDazBEa1VHR2FGY29oZVUxTUMxOEZJdk9wWUc2TVFrVUhURXBO?=
 =?utf-8?B?aXFXN3JtbDM3Wkd2eGR0QThZcUk0ckYwd0RSbXkwQSs5ZEZpejBoalJjUW9V?=
 =?utf-8?B?eFNwWWJHSjdCei9HWmhNUkFyMnRPQzIyQjlYdU5QQmk2SlRKNFJGL1pHTFl6?=
 =?utf-8?B?OXVqUXp4clMyRUROK1o2ZVVsaXN2d0xMVEt4UlhYaTYxT1c0UEVraGxuWnlK?=
 =?utf-8?B?Z2F2Mk1EWkl3THdVbTBqWCtMVHZjYzRoYms0UEpucm01VU9zeWdNd2lPbE41?=
 =?utf-8?B?anZqeCtoMm1nZmtzVDI4cllMU2d4Y3VtZitPdUt5dXdLNnp4NVhSZnpFT1ZQ?=
 =?utf-8?B?UGZ6Z29JbitLMXIwK0dRTjNPRm5nMnQ5MnJDQVhqenR4SDlaU2ZTM002Q28z?=
 =?utf-8?B?ODNrTVVib0lrbGZtVFBIOEJCcms0VUdLV0JwRVVNNTh3clJiNlR1TFFwOEtO?=
 =?utf-8?B?L2ptTG9ycDhFMVF0WjllR1JxenpKdjIwUGF1cVFnbnhsVGtpK29ucFIwMUJG?=
 =?utf-8?B?NEtpWWZ1L3dLVzZvV1dmRkJXMlZ2TzVYSGFMWVl1Z08yWmdSckN0SVQwN3Jp?=
 =?utf-8?B?VFdhZFlnRm9Da2JtaWVWUHdWVUE4M3Q2V3VCZ09TZy9kKzl6RytXREVzY2VD?=
 =?utf-8?B?Wk01MDBvTW5pcXBCUzFRM2h1c1NBcCtuaGttL05hRTdidXVaaFd6dCthOVpj?=
 =?utf-8?B?d2JQNFJYeEpYMnJxSjBhekJCNmxrcmRJWUNkVVNoa0U4TTlKOEErY1lrell5?=
 =?utf-8?B?a3BIUzc5VDdhVlVYQ242Q2Z1anZiMzZlam9JS3JVc3EvMVc0aE83MzE4WHVU?=
 =?utf-8?B?eWlma0JycXExRkl2U3Q3Zm9GS0EyRjZWdDA5M0N0TkpxY1F6WTN2S3JmQjdC?=
 =?utf-8?B?RmROa1JhTmI2elhLVlBKdnZ3eTFWZkN3NHpzaDUyaU9LRnV6dWNrMVFXK3Vn?=
 =?utf-8?B?NEV0T3FjcDljS3N0aXFSQmFJYzZsZG55QVJ2Vk1JNysrdmhqbWtXWU9DQWZO?=
 =?utf-8?B?RTNpSFkzRjk2OXNIMkhQZjdtd3BwUHVXMUN4NkJTRHFiTjRwSHg0ZnBSeEw1?=
 =?utf-8?B?UXNyQWMxNm9DMFhpTEpCL0t0Smx6ODVVRWJlN0QwK2hmVjIxUXRURDVLakc0?=
 =?utf-8?B?R3JYTnlITEM3dUFRY2Z1RmZJWXZOSFJWYkRpRkZhZUFVWXJoeUJmYWJFUmE0?=
 =?utf-8?B?emNTQXdEM0M5ZGxVT3NBVCtlc2pXTk1aRFN3eGtYVWg0OFlpd1JSdFJhWm91?=
 =?utf-8?B?U1JId25LOXpoTGNMV2w1Y0hOYmUyQVZpcitlRzFDZDNMMkQrQTB1K3J5Qnh0?=
 =?utf-8?B?UUxsU2lZV1ViMi9PZUJZdWVxR1JsZFcxMndTSG5YdDJpN29zMXZBTmtNRmVq?=
 =?utf-8?B?aFpIY25lZXBiTWI0bitkVERCK21lWXdLQXg4MWZqTmgxMmlyM0hvRHBtUGhl?=
 =?utf-8?B?Qy9YZkZDTkxLdWpiYlNNUXVvS2IxMGk4VlRsZGd5MGthNldoYWxnaXhCbkxh?=
 =?utf-8?B?RFdtN0dKbmdjN24rd2xHclc1ckpMYlh4NklJWEVDWEFZZE11N2lFbVFRVFBn?=
 =?utf-8?B?NDJDdjJ0L09sd1dlNW1zYnJCNGhBUGZENjM1b2F4eE80S0I5bHRMcGVWVm1N?=
 =?utf-8?B?VW1kTmdGbURvNVI0Y1ZiRzlEZXNnZVBNV0pFK2dkMzVUamU0V29Xdzk4UlM4?=
 =?utf-8?B?M0dhaFVLOWtUMkM2b1NFdUp5SkREQTA5aHI3TDh1VXFIL3BKalRuY1o3MzdB?=
 =?utf-8?B?ZTNCQTlBRDlkeFVXaGk0YzJmY1k1ZWVUZVVPRUIwQ3FiQklHeDdCTWNlY0dT?=
 =?utf-8?B?dnYwcXA5WlgweDl2OU1wME0rWGdZWERUOHZGbEsxMlVVT29hanpqVHA2NjY1?=
 =?utf-8?B?dHV0OHduMmhGeU9WbDUxSS84bHI3VDhqaUhZN1M1RkZ0emNYZ3pIaXpvL0JH?=
 =?utf-8?B?VkNtbVNHNkxXbjlxNFUwOTFPRHdYdFZ5eTZ2MEg0THhaSi8wckxoaThHWlhw?=
 =?utf-8?B?cEV3aVZORTlrZzk0UDV6bmVzbHVBSFppZmRLaUFSTTBFQ2xkVjZ5djh3MmNa?=
 =?utf-8?B?RVh0T1dUZzVjUWo2OFo3cVNtYjVTRjc4TVNqVnVhVmhIdTRKbFdaczc5TG5i?=
 =?utf-8?B?cy9DSXpIYUJRT1BpL25YWTgwNUh4RXY2dEltWGRnK3Z5emhMVmNUY2oyUzd5?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4102dfc5-2d1b-4de1-d558-08dd75a6fd43
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 07:37:03.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0aMWxUStEID9FfwCuFcSdp3oNsgpjoMCnOwmnzLbtrdHEOvV4FnS7uFNIX5DXI3y4N2tLzRzeie9fnNoF3xTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6308
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

Hi Ville,

Thanks for the re-run.
Test as expected seems to be passing
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12907/shards-all.html?testfilter=flip-vs-dpms-on-nop

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 02-04-2025 03:56 pm, Sharma, Swati2 wrote:
> Hi Ville,
>
> On 01-04-2025 09:54 pm, Ville Syrjälä wrote:
>> On Tue, Apr 01, 2025 at 01:44:16PM +0530, Sharma, Swati2 wrote:
>>> Hi Ville,
>>>
>>> Since this test is failing across all platforms.
>>> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12687/shards-all.html?testfilter=lip-vs-dpms-on-nop 
>>>
>>> If this is expected beh, do we need to modify IGT to handle this
>>> negative scenario.
>> It won't fail anymore since the kernel fix is in already.
> Do you want to add this test? Can you re-run to know whether its fixed?
>>
>>> On 01-03-2025 01:12 am, Ville Syrjala wrote:
>>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>
>>>> Verify that redundant DPMS ON requests don't result in
>>>> actual commits (and thus frame drops). This behaviour
>>>> is guaranteed by the kernel for atomic drivers.
>>>>
>>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>> ---
>>>>    tests/kms_flip.c | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>>>> index 3ad4d0afb1f6..59740aca25bd 100755
>>>> --- a/tests/kms_flip.c
>>>> +++ b/tests/kms_flip.c
>>>> @@ -176,6 +176,7 @@
>>>>     * @single-buffer-flip-vs-dpms-off-vs-modeset: pageflip of same 
>>>> buffer along with
>>>>     *                                             the modeset and 
>>>> dpms off
>>>>     * @dpms-vs-vblank-race:                       vblank along with 
>>>> the dpms & modeset
>>>> + * @flip-vs-dpms-on-nop:                       pageflip and issue 
>>>> nop DPMS ON
>>>>     */
>>>>       /**
>>>> @@ -240,6 +241,7 @@
>>>>     */
>>>>       #define TEST_DPMS        (1 << 0)
>>>> +#define TEST_DPMS_ON_NOP    (1 << 1)
>>>>       #define TEST_PAN        (1 << 3)
>>>>    #define TEST_MODESET        (1 << 4)
>>>> @@ -957,7 +959,7 @@ static bool run_test_step(struct test_output 
>>>> *o, unsigned int *events)
>>>>        if (o->flags & TEST_MODESET)
>>>>            igt_assert(set_mode(o, o->fb_ids[o->current_fb_id], 0, 
>>>> 0) == 0);
>>>>    -    if (o->flags & TEST_DPMS)
>>>> +    if (o->flags & (TEST_DPMS | TEST_DPMS_ON_NOP))
>>>>            set_dpms(o, DRM_MODE_DPMS_ON);
>>>>           if (o->flags & TEST_VBLANK_RACE) {
>>>> @@ -2020,6 +2022,7 @@ igt_main_args("e", NULL, help_str, 
>>>> opt_handler, NULL)
>>>>                "plain-flip-fb-recreate" },
>>>>            { 30, TEST_FLIP | TEST_RMFB | TEST_MODESET , 
>>>> "flip-vs-rmfb" },
>>>>            { 2, TEST_FLIP | TEST_DPMS | TEST_EINVAL | TEST_BASIC, 
>>>> "flip-vs-dpms" },
>>>> +        { 2, TEST_FLIP | TEST_DPMS_ON_NOP | TEST_CHECK_TS, 
>>>> "flip-vs-dpms-on-nop" },
>>>>            { 30,  TEST_FLIP | TEST_PAN, "flip-vs-panning" },
>>>>            { 2, TEST_FLIP | TEST_MODESET | TEST_EINVAL | 
>>>> TEST_BASIC, "flip-vs-modeset" },
>>>>            { 30,  TEST_FLIP | TEST_VBLANK_EXPIRED_SEQ,
>

