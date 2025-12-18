Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DE6D68BF6
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 08:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF2110E271;
	Thu, 18 Dec 2025 08:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yk1VibgN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20A810E7B3
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766047924; x=1797583924;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9IkfTkFs0PNbeMigVG/zECx0bTCEdnMqUB5kGCBYI00=;
 b=Yk1VibgNw8mEb5YRkBr9sLGvVhV0ilD2LnJL+CQncl0q6FP9CPjV1nyg
 ZQ3lr5V4DVF9hfOGIyP5R6VzlWnSj2NUPQHr3ixxXTTukEo47XKnfwwba
 irgVrUop3OyfLHYeXy1XLz2X6YysvPJKvs951Lq15+ijm5cSgzKar8ar0
 F/EY9LFx81E3LwgFM/RNWdu6URBdtgOLWJnE9QoiSCr4sAF8Fonh+PG+u
 34NiQSy1mfzXbynsD60d8wSc/GQSqvwegyiKryV9HafoaVCkhHcWjlMw7
 qe+LbmRVAfAKJ/YRhE3InAyT6sr8eBS3B6OseBFx5BSYB5kS4fL7tX/EH g==;
X-CSE-ConnectionGUID: lUOhRAB2QYWNvGEFM21JqA==
X-CSE-MsgGUID: bG+rkCr5Rbyqee32XRShKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="90655567"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="90655567"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:52:03 -0800
X-CSE-ConnectionGUID: aHHQVWvgSYCm6fIgqlLCPA==
X-CSE-MsgGUID: VicJCTLSQdOA4Svtn5Bhsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="197682812"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:52:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 00:52:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 00:52:02 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 00:52:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi/HmgPCH0rb5PYsOCtjHJp5qn9qzc1YGz0c+968YNFqi0dglNSGUEF9yO30oPH5wbk8pWiG0pv7BQ8LYrAL/e61SK+y0MhxKfJvseBF0h9R5sQOXFJqsQ/6AOWK4gT1+K5oy3GQJ77QtnsQWwWdpxV3YT7FmrGo/hLh0T3TMF/yO7F31qIvMQIrS4mAm6vIZhiCtBftNVGncg/PJS4FtKcOZ6u3Z5ln+a2axF4U6yRhNpu/x1Duz17jNRtDEqkFzO6H2eNGLgtCU+eM20YYy4E7JNl/ure2hxPPlr7c2NvoSjebuWL0u8HNckshCaKlGNWVDqVMPSqlwYAmNG3MtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BJT5ZizeBLvNeKwAX02ITIqPvvj2FfenaGwvabYxmg=;
 b=btVGzdFkZz0j+P/82pHYWevNpftCyADoe2G3uXn+b5MsoRsjQj2r/qbkXniem+Iuna9TpcQXi1ZduxfBTtelZvOAd4L2IPfmIAiXC/GOsk8Sn81kmsz2u9rCfneXZ34RyFZYVxB4M/9r63bH6z/gS4wfuL7L+Ilr3RwhBVp64UN6yAPZ8acdgk7R5VIOPOJePad6ksXApdv057T/LSOdGmU/ZjBMHiWTqhp206EGcgYhL7GlgcCqugKX3aybWc5a5+YGjMDsgMdw1cCC7u+c5N97GLmGga0KeuYvyVdwOC0jXTC1ZzgRCa99Knr3CppqLv5rqZ5i7xKmSqZuaFkoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS4PPFE396822D5.namprd11.prod.outlook.com (2603:10b6:f:fc02::59)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 08:52:00 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::b358:b7a0:d076:38d4]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::b358:b7a0:d076:38d4%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 08:52:00 +0000
Message-ID: <3b493e7e-cacb-4ca2-860d-f730b1e8faf0@intel.com>
Date: Thu, 18 Dec 2025 14:21:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/i915_pm_rps: Improve error reporting for
 sysfs write failures
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>, 
 <raag.jadav@intel.com>
References: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
 <20251215132132.1195570-4-mallesh.koujalagi@intel.com>
 <df7a74a3-c375-4485-b2d6-9cd4fb2aa5e5@intel.com>
 <b94dd113-98a2-4f23-8ed3-d8c8ee58e68a@intel.com>
 <d1d36fe2-6788-40dc-a83f-3fbc22494cfe@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <d1d36fe2-6788-40dc-a83f-3fbc22494cfe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS4PPFE396822D5:EE_
X-MS-Office365-Filtering-Correlation-Id: c5dde7d0-c180-4628-4a2d-08de3e12b524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk1zYXVZUWRoTlhZS3ZiSDJIRTk3azJSMW5ma0xnSEJpT1hKeWxtSEFsTWVr?=
 =?utf-8?B?cjRUYUFBbnhhRGFLMjBZK3NUb05lMjBHZkhtb24ydzFZaHFrTnJlQlR2QUNG?=
 =?utf-8?B?VFBOaFZIZ2dxOUQ1S1UyVWJOa1JIbkp6cDhUS0JCaXZ6dkJDc0RoMnBIaURh?=
 =?utf-8?B?R1BrWm5ac3kzUzV0RS85WEFHKzY5ajhSY2N5VTFmK0MrZ3JCRnI4WmhpZEZS?=
 =?utf-8?B?ZnBkbVlEUTVOMnFablBsQmhhMExBTWJKRDlrMHA2ckxzZzBuVkpGUlFlMnhD?=
 =?utf-8?B?SXJGN3lkbklUR3djdmUvRTA3dnBOTWp5cVJaNTFlNk5scDNSNHNQTk9kV0FU?=
 =?utf-8?B?SkkzcE04dVlKM1lhTkVhYU8yM2s2WWF2bDhHaW5OTWo5Q0hRMUNSNllraVZs?=
 =?utf-8?B?dFlHbExMMjdwaEwxUUF0dUZnSHliS2NwQ3JyQ1QrVzVZRW5zQVQrTFMzbFBQ?=
 =?utf-8?B?b2tsSzRmZE10Y3REVTNxdVFHV25KT0p2YXIwSjZwRnNLeHBZM3lhQmxITW1R?=
 =?utf-8?B?enFjMjgrYzNqQnhDRVVFMTZudUlyVExFY3BZSmNqNXV6bG9NbndPaVk5V0lR?=
 =?utf-8?B?ayt5WHl2U2lUWDVHNTErQ3ZQdE9lc1p3bzhXNG4yaWVBQ1lLcmJqODZJT05q?=
 =?utf-8?B?MGVhYlNHNmxXZmJ5anNsMTVoTVhjSFZvSFFMeC9xdTZ3UHdaZU9VRVV3bWhS?=
 =?utf-8?B?akE0bWtKTU0zS2NoTldVYm9ZbWpOczRMRHdiTmRKOFRSaDhaL0IyVStaRm0x?=
 =?utf-8?B?a2swSU5kb2VFaXRpV0hRbnlFMGkxV1Q1WkFZbWxWYnZOYk5WdTdLQUYzUDFy?=
 =?utf-8?B?U3ZHQ2FneXY5eXR3M0VkTW5NdWVMTkxZV1UrNVRic3Fzb1lsQ2RUL1FEcUQw?=
 =?utf-8?B?UWJya2grdmQ0aTVoSm91a01iM2Z0akd1QnphdVlhVGl5VHBzQ0FXOFB2MmRP?=
 =?utf-8?B?MnEvQkRkL3RRckE1U2lPVUZzZ3VKUlM3cHBzQlV2cDNSZDRWOWFCanVCY29Y?=
 =?utf-8?B?dE1pb0s3Tk0xQ0RjWWxYMG1CaHR2SGVwZHpFVXZiampiTFE3UGZSNXZINDhr?=
 =?utf-8?B?RjQrVVNNbDhSVU02R3NvTGtiUGtIR010bGhwVFFZc01LWTczZzFZWEkxcktN?=
 =?utf-8?B?YnQ1S1g5aEVPNTl5d3I2UnJkRksxeldva3p2WG1QWmdxb1RqcFU1b1RPb1Vq?=
 =?utf-8?B?eUFZQWlaM3Y1WVpOYmVaSVQ1U1J5N2lLSTFJTkNBZGdmSDlhUFpGdENDMEdX?=
 =?utf-8?B?YjFUZWNBNk13SGJDdlhRVzVMTDhvaGpXeHEyRmJ6U1c1bTViRW1wQ2lTeVZF?=
 =?utf-8?B?Vlp1L2N2Vzh0OThhenFkZklES0tkbkZqb240RjVSaGJRaDFXRkZ2MDBvUnV2?=
 =?utf-8?B?ZDRSa1F3WGJQVkZTQm1vS1IyV1BWSS93Rm01VlpIcU9tMHBHK2hGQXNKc0kx?=
 =?utf-8?B?UDZEemNYcU5qSG5wQjVpVGdYREdnejYrelNkYlNTaGNpMWcra3lieFlyVjQr?=
 =?utf-8?B?YldHQnBEVHV5K3VWdVhxVCtEYk9qZkViaUJsOGV4czQrK3pMQjdNeHlCQkpY?=
 =?utf-8?B?Z0dmaHNtS1E5MDVoenlIMHNQdlBZZWxnN3NSNUpMK2NacW9GbTkxOW5YTFBs?=
 =?utf-8?B?cGk4ZVA5NHFUYldGK1dqcElnaFdPSURJejlTMlY4WXZ5ZDA3WFFwSTZnaHcr?=
 =?utf-8?B?QTV2ZVJ0VlMyVitlYk1yckRPUHlXU0NCNVJWTDFlSFRETGNzNlhkRjRLRVBY?=
 =?utf-8?B?OUlXVHBEYTJlcHdNeDRNVnlUVERmRGlYK1dWT0VlM1htMS94bmkxQkZsNzJP?=
 =?utf-8?B?OUgyMktTZU5zZTRidkVITG1qOE8rRWs3TmFYNnRGWlRUaDF5a01IYURMaWJy?=
 =?utf-8?B?Vk1ZdDBJR0dzWTRZRlpjQVJOWTZ2QmRNKzM2YWdVaVRaNTZ0RHM1MGY2d0Fr?=
 =?utf-8?Q?WFQwGl2X9MoJop9v1WE6lGUrD3okdEto?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cERzTEhnS3RiQjhiRVUydTVzTXZnYUpOS1lTMThmK0JRSEl5NEFTTldNWjRO?=
 =?utf-8?B?VTVPUnFzMW1zZTY5eTJ4NVlaUGlaRUN4dFRtcFZJRTl3WGtHajRZYTZNWG8v?=
 =?utf-8?B?dHVrcFh6bHdKdm5ncE0wM2IwWGY4MXhPd1NHMi9nZHRnYzJ1OGQyTXJDZmRY?=
 =?utf-8?B?c1hETWxZaUVQQzdzZzJCUUg5YzBzbkNOZVNTZ3R6dmVuWFY5djhIaHl4amNC?=
 =?utf-8?B?cnlhUkplY1B0UytIMU5pZlNEa3hTWXlyMEZQT1BCNlYyT0QvVGc1Q0JMU0du?=
 =?utf-8?B?TDRCRitiS0tqa253VytMRGRPOWV0T1A1Q1BJVDBCTWVrNC9veEZJSUJTcVBK?=
 =?utf-8?B?M0lta0pSVjVmaDVjZTF6R2lkbUJad2hwVGpnS3l0bTdsOFdwcTBSb3o0b2Jr?=
 =?utf-8?B?TnpHdkNkMm9EdEs5UVgvUTF4NXBjVjV5bmxDcDRidUFSRUFoK1AwMGg0THRp?=
 =?utf-8?B?VDFBNVpHL1ljL0M2dVV1WGRES0Y0aUZLdlI5bEtnNUVFcW5ZUXRrc2hTNXU0?=
 =?utf-8?B?M0NrVFVGeHZyNHdya0xKT1h2ZEFZVGQwRlBwLzBqbGtxaU1UQzlycDdNTEpv?=
 =?utf-8?B?WTN6WFFpYTJ1Vzg4ZUhyYS8wZDdOVll2L28vUGhGOTNCeUpHcklIMVNxMi9W?=
 =?utf-8?B?WWdEdDJZc0FYWWc5a1ZVbis3em1Pek9EZUpUSkJDclp4NjNQVWJqR0F2TnRK?=
 =?utf-8?B?TzVhS3IvSnNTUk5uQlY1KzNHMFdsTG1NZGpjRklaWTBBUmxzVjJ6aHRvdmtj?=
 =?utf-8?B?WG9vZ1hYZEhKNTMwVTIzY1BJcmNRV3hWeXhrY05HTVZSc2lrZlVkbFA5QUVQ?=
 =?utf-8?B?bHVGcW5paHRzZ0NqVUdNVUFucW1yK1NsMUc5VjRlbkxxRmFDTlZwOXVUK2tz?=
 =?utf-8?B?M1JOZElNZ2wwZjRmQzVaNDlkU2NGSWhIekc4WSs3clZRaHdnaU0yZ3AyUm1x?=
 =?utf-8?B?QnpYUXFsRkwyMG9FbDNTTHh3YkFBdUhGQlhtbE1qbmV4RnVxTVQzNE5HNFIv?=
 =?utf-8?B?eXFiU2EvUFZJV3hoRmwySktTdVVFbS9mSlpseWJFTUZGYVFOb1RBT0lPNTA4?=
 =?utf-8?B?RElBVkdtaDFnemFVNzkxMy9JOGVyamNKUTR4SjVZRk1IL1VRUTFjSS9RV2dm?=
 =?utf-8?B?V0wxa2FlNzJySjkwYTlIOUR3Q0RGdFFMYUdTamw1UXNpcmxYd1RENDRPaSsw?=
 =?utf-8?B?UndTR3g3NWtmQWFSdUR6b2src1JpMER4ekQ1QXBDYVk0TTlEdTRzOG9OSWQ2?=
 =?utf-8?B?VEFnYytGcmVuWHYzVW5KTG5PZ0ZXL0F4TjRyeUhTZkRwYU4wdmFPaTBFdlFk?=
 =?utf-8?B?WGlGdGJHYWFPdjZDUFJKTEJSQndhT3FKMWg4NG1RMFRqdW9FckFQOHZNUWR3?=
 =?utf-8?B?SEFkdDl0YURjWHJzMXd0dnM5U2hQYmF2bXVsOStOTG9EbklZMzExalRVVEJ4?=
 =?utf-8?B?bVZaMW10TFAwdkdmTUZHbzlIVVZLdVhJRXhLOFl5bFQ4YlFPZUFxOU12Wkxn?=
 =?utf-8?B?eHhGRXZXZnM3ZGZnVTdSd3ZYeXJrWG1ma1dSMkJ6UDRnLy96bTNySEdSRytj?=
 =?utf-8?B?V2FucGF0Y0djaERZbnZNSFNXbHNWOEwvalFUR0tZYVFIbHgvSmJIOFYrNWgv?=
 =?utf-8?B?aGxYOWlvSDBydmc2N096d29jK0FQY3pSZm1LOXBNV0VtenZMY0Z5M28wYUxU?=
 =?utf-8?B?OWtzelhRanV1OGJDM1JQcVZWSS83TytuQlR1bElJTEg3aTR5MkZ1RGcwbnVG?=
 =?utf-8?B?VzJBazc4a2dsaFoxd3JDUkFjYWpKOHN1cWt1TzQwMFlGL3JadHZsZGJoOThM?=
 =?utf-8?B?WG54Zjk2aUk0Sysrc20ySm9XaGpNSmduMjc5S2dWWkl6cVNxdTBuS1M1S0w2?=
 =?utf-8?B?bk1EVkFIWmFsTkV2Wm14QVBQTkRldzFPM0FkaHZLbk0wdnVjSzZBZm1WcUYv?=
 =?utf-8?B?ckFVNGJaZDNCOEJrUThHemVhUXdSVGlUcGdZMmIxMnd0Z2Y0cFJVVE5vZ0Mw?=
 =?utf-8?B?M1E3OHBsaHNodkFxaHJWZFhqQk5NMW44OFRKRmdmczlONWp6bHBsSWYvV2hL?=
 =?utf-8?B?M3Bnc0JTeW15YnZWS244dFFEemVPb1dMUVUvQVdKV3RsQnJHL2tpU095Umc2?=
 =?utf-8?B?ajBPcGhPNG9HUyswMEJNb2pRWkFrandRZXpJb0NMdWRTenRVdTlGQmZJRlF5?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dde7d0-c180-4628-4a2d-08de3e12b524
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 08:52:00.5922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d+MCYlSomoKlxsUwWZrpdHb4nkPEqjGmym8Q8q9aEgq8ux3O7NaA4JY4FCcGCUxuwl4mc8wPOhLLEtOfum459EigvyWmA9Cr1lIDQyKxXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE396822D5
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

Hi Riana,

On 18-12-2025 12:14 pm, Riana Tauro wrote:
>
>
> On 12/18/2025 12:10 PM, Mallesh, Koujalagi wrote:
>> Hi Riana,
>>
>> On 17-12-2025 12:25 pm, Riana Tauro wrote:
>>> Hi Mallesh
>>>
>>> You can send a single patch directly, you do not need a cover letter.
>>>
>>   Sure!
>>> On 12/15/2025 6:51 PM, Mallesh Koujalagi wrote:
>>>> Add detailed error logging when writing to RPS sysfs files fails.
>>>> This helps diagnose issues where frequency writes are rejected by
>>>> the kernel, particularly after events like GPU resets or during
>>>> frequency transistions.
>>>
>>> This looks like a debug patch. Should this be for trybot? 
>>
>> This patch providing essential error context that allows developers 
>> to actually investigate and resolve sysfs write failures when it occurs.
>>
>>>>
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>   tests/intel/i915_pm_rps.c | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
>>>> index f97a716be..02c807399 100644
>>>> --- a/tests/intel/i915_pm_rps.c
>>>> +++ b/tests/intel/i915_pm_rps.c
>>>> @@ -201,6 +201,15 @@ static void wait_freq_settle(int gt_id)
>>>>       }
>>>>   }
>>>>   +static const char *get_sysfs_filename(FILE *filp, int gt_id)
>>>> +{
>>>> +    for (int i = 0; i < NUMFREQ; i++) {
>>>> +        if (sysfs_files[gt_id][i].filp == filp)
>>>> +            return sysfs_files[gt_id][i].name;
>>>> +    }
>>>> +    return "unknown";
>>>> +}
>>>
>>> This seems unnecessary. It's better to add a single debug log a line 
>>> above the writeval similar to the function "min_max_config" in the 
>>> same file.
>>>
>>> igt_debug("\nSet min=RPn and max=RP0...\n")
>>>
>>> If you want to add it in do_writeval, add a parameter name instead 
>>> of searching the name again.
>>>
>>> Thanks
>>> Riana
>>>
>> Sincedo_writeval is called multiple times throughout the code, a 
>> single generic debug message won't help identify which specific sysfs 
>> fileis causing an issue when a write operation fails.
>
> Then it would be better to send the name as a parameter since you use
> sysfs_files while calling do_writeval. There is no need to search 
> again through the entire list.
>
> Thanks
> Riana
>
Since filename lookup is only needed when there's an error (it's an 
error-path). In the success case (which is 99% of the time), no lookup 
overhead occurs.

If we pass as parameter:

1. We need to modify multiple line of code.

2. Always passes the parameter even though it's used only error case.

3. Wastes stack space/register in the common success path.

Best regards

-/Mallesh

>>
>> Best regards,
>>
>> -/Mallesh
>>
>>>> +
>>>>   static int do_writeval(FILE *filp, int val, int lerrno, bool 
>>>> readback_check, int gt_id)
>>>>   {
>>>>       int ret, orig;
>>>> @@ -217,7 +226,10 @@ static int do_writeval(FILE *filp, int val, 
>>>> int lerrno, bool readback_check, int
>>>>       } else {
>>>>           if (ret < 0) {
>>>>               int freqs[NUMFREQ];
>>>> +            const char *filename = get_sysfs_filename(filp, gt_id);
>>>>   +            igt_warn("GT%d: Failed to write rps_%s_freq_mhz with 
>>>> value %d, errno=%d (%s)\n",
>>>> +                 gt_id, filename, val, errno, strerror(errno));
>>>>               read_freqs(freqs, gt_id);
>>>>               dump(freqs, gt_id);
>>>>           }
>>>
>
