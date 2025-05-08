Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4EFC3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 07:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6CD10E8D0;
	Thu,  8 May 2025 07:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8fAIb1g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C8110E8D0
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 07:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746689606; x=1778225606;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XYpw+pAUAsQyyrFEmEcrPDp4XGYK7yYKWFBsoh92VdI=;
 b=D8fAIb1gmCG7100z88Ma2US3iiVYI2eshrgRfBHf9AH2wErgXUXu2W6u
 +j0iGBMOZdVDNbJTg03Y0aAwLgIG0OyInF7ZrqgkMnOCdXUP72/RMZ1+o
 L0p0BoOoOuLEIQAlRIcb6QiZY+rJzzKpbUljUiFCX/EUF8hwBJQmczX1d
 xa5J7lOzac2IIs0iNjFyBVvVBa9wdDIoz4n2Rh/MOjqHN2wa84MbV1qXu
 HbNGFyzKZgnxRaGRtBlam6pr7RrnFjrmoYHEwoFXB+d5AMO06SB6D9Cjz
 6Q7hWyaZfLVIMxy8tndH6zDmXJaq1Q2k8UY2dh1XVo6l8zczhSTukZ5UW w==;
X-CSE-ConnectionGUID: x80FVogOT02V40zWn/ZI5w==
X-CSE-MsgGUID: sWlP79u4T6mAYjKodT5uLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48164331"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48164331"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 00:33:26 -0700
X-CSE-ConnectionGUID: zLCOMgCZRt6+eLeYzSxcAg==
X-CSE-MsgGUID: EGkxPrAfRYOnIHNLlPX8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="137202345"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 00:33:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 00:33:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 00:33:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 00:33:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shTJGA2xEuRsWQelaHEaIMGf4MtQTzNeiDW3jGN4g0qxpCR+Hu1AWtJAznDIz2o8P+P+DhoyJ8fbuiSkU6oti8V8L4hTB9qBVg/jxyPERZrWNe7pRs+uD0Htuk7qc/PDM51Kmb+g5HtLr6PKkF2eH6/+ZUCQBjWFNf6W9Hh/KZKPoqXChX1t7vIF3+JBK8C4E4quCn8Jh7MBIwfMU5udzg1yU8+93mbu/KK+a6iQB5uGf0swSrZ0maAEQHu61o/8C28cTT7XM/bHhv2E2ggVdiOwAAVcnVzpDLr5O00GyFUjQPkVsIu1xmX/sIo7huZwhBnyH0kif9+fDsxHZgmamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U53r2YqoJcQt73n8BDFlzfCM4QSuhMExTA8EcUixeE8=;
 b=M2A6qGQMCkGpksiuVqpHKPmjRUBa0V9PepjtT8V+bwX+S7Y/SJaB65B7aYF6dVUBmJrwwHY26c9z8vSDH0iDWDDI1G/7cwvasZunwG9m1xgR2DMdIgaL4xxVfwOVQeXQQKZ1uQMvl9Ff87PDeceE8VOVX4KyjcJ9+12ooYlmao+ZqILCS4XWmmygbvNybybItz+g4JsLfAPmE8TZT0EUf9Q9XuqMqeYVTaQnMfyEOlq+hsjN+7VG9ey7I/yxslyAIGtQ3mo06yb3/fSK+Qxj/wdBvHEklctdARibqGYO9O2C5iDAuRgd2rDLCcrnddqFlCJShjPhyyvCt89OC7w5QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB6896.namprd11.prod.outlook.com (2603:10b6:806:2bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 07:33:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 07:33:15 +0000
Message-ID: <399ce091-1072-436a-9617-d3adacb866e9@intel.com>
Date: Thu, 8 May 2025 13:03:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dsc: Store valid DSC outputs
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250508072620.1310699-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250508072620.1310699-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df834c2-cf4f-4bce-9a5d-08dd8e029814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elVSNVAwNExIWXArRlFraGw1M2x6bkR3TXNuZ0ZHU0xwTHRmdGcyR0pXdldM?=
 =?utf-8?B?eHZvZWR0NHd5SXdaTzZPQyt4YnJRMTlNU2tucS9XSDhlMFlrM0QxbmdRcWVZ?=
 =?utf-8?B?djhNc2k4QTUzYlJmSWR4cklUK1FLMDVFTnM4Qmt2UlpyNzZPRUF0RlVKYVJS?=
 =?utf-8?B?OVY0M1RxQ2lueHlxZUpkd25keTZEL3lwcG5sL2JCZlR6NXhrRHJRTFVLYkta?=
 =?utf-8?B?SmxQMS9pbmVuVWF0d0E0NHhJNjRwZ3VzMWxVVm9yWExwN2FoMFA4Nmd2K0Jm?=
 =?utf-8?B?dWM1Tkh5NGQrMWxjOHZ2bVZ3aDBvZnRMS3I5bVNmRkY1Y0w5Wkh6UytuMnQv?=
 =?utf-8?B?c1ZVRmorZG5LdjFJYndRaWRpWUlqcGVIbGN3c1NSeU40TFdXUGloYjlsbGtx?=
 =?utf-8?B?UllxN1dob3BCSTRNM2ZTdklFb3FybG11cjRZUjRaN0x0TlQ5MWZnTDB5ZlM5?=
 =?utf-8?B?RnpJdmhDTUEybncxbFI4L2FrSEdWK2s2Nkpvc2NYZXZOTW9nQllHVTNoTUZj?=
 =?utf-8?B?RlFJNzdSZVRLbnVBUk0wM200b2JYR20raVJUSStnQTRTaXBkN0RsdWVZR3NR?=
 =?utf-8?B?VmNNcUxwTlFlY1IxV0o1SDlQSmFLVFd6SDFvNGlGRG9tWFdOK2l1VzAzZnQ2?=
 =?utf-8?B?enJFalZCamNCanBFdlZrZlMyaGtDK21JUzMyb0NnSytaUEJydnl0aGZZSThD?=
 =?utf-8?B?YXl4TmxOMzVxMjJ5RmNOWXNhbFl4KzZac2pNS2orYnN3VEVKZlk3WVQ4NlN2?=
 =?utf-8?B?UXRhT203Qjhha05ybHF1TmFoN01SbHUvVDFVL2NLSlNKbThvdUN0Sys5dFFm?=
 =?utf-8?B?ck9tZ1BHOXFoblV6M1p4akU4ZmRoRVZ6M2ZOOWw2Q3FuMjhXMHp6dUxJM01s?=
 =?utf-8?B?dk5acjFIT0FGZm1TdkpOa1FnVytTK05tV3dxcXNEOW9XK0dwRlNIOGpkNkg2?=
 =?utf-8?B?azRQd2Yyb3BETEIzRzJkajhYcmlIVG5ScDNQclVMQXlrSldvSTZ3Nm9SSWxu?=
 =?utf-8?B?cVh3S1pmWHZhYVJUVWI3clM2QVo0ZFpidTMvemhMYXFsbC95eEZrZFlIQVdO?=
 =?utf-8?B?a3dFN0V6b2FWS3Y1OGtDd2VYazRyOG11Ni9LKzM0dTgyZlRjb3pWR09ITzBX?=
 =?utf-8?B?QkJycGg0T0FXVC9LZS8rWXRXU1Zra0x5Qkx2OXgzdk1VQldxSEZQU0c0OHhU?=
 =?utf-8?B?RHEydGpzUE95c3lLZ0w0aDUyaERRYmdIdXFkcUVoL3BFZStUNnBTdVptNkg2?=
 =?utf-8?B?TUJHQ0ErWFQvS2FENWc4QzVvNTg3bTRUQWhKUTFNUXhkVUhkWmhkTnFzM1Q3?=
 =?utf-8?B?c3ZvRFYxbnR4N3BRV1BGMm9zQk1CbnFlRTVUK2pacFRCNGV6alArenl1bCth?=
 =?utf-8?B?ZUR2d1RJQkp6dWdzMFFOVG1vQ2szRFl6d0NLdldTc0pmY08xMThrZXhyN0dN?=
 =?utf-8?B?eE05b05zMElwVm83THdNMXhCVW5LelBJYVd6bmhPZW0wU1dxVkpuVkdVa3k5?=
 =?utf-8?B?U1Y0b2dWMHVnbmZmODluSlJZa013UlhoRHhqMUdzdTJoNHNwWkQ3LzhLek44?=
 =?utf-8?B?YmRNNWxJbm9KWmtzd3hNaVpxaWJyWExZM2c5REpqQ21sZmVpWTRFcEgybGVv?=
 =?utf-8?B?T2ZBWjRFQktMUEZqSUxxUzZncTNVcEhzQkNpbXBrbjJvNGd2eU5XT0E2SmhE?=
 =?utf-8?B?ZGkxSmNFRmlqK3R4Y3ptVCtqNkZ3dEpHdnQ3RDlEbzVKQlVKYkNkejlpckMw?=
 =?utf-8?B?U09pMk54dGxXWFhmSW1DM1dOeTcyY0V1ZTB2a0R6K3NTeUxpSHkvYnkzU2Np?=
 =?utf-8?B?bU0wcnFVYW5yQkJrRms5ZDZCOW1rZ20xU05KdVZqUmNiR0g4T1d2L3dvdVI2?=
 =?utf-8?B?VWczNTdsblc0Q2VXcEhzNGpPRG5BRDR6dTc0ellVY212amVlNjRwRnFvTmZD?=
 =?utf-8?Q?Wa3HHUvY5wc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJMdVZ3ZGk5Rm8vZy9MWHhUeng1SmFuSi9PMkZBeHBHZzFoUTBrR2FSZDNa?=
 =?utf-8?B?MXVFOG44a2NiVDFkVGdQNGZYM3I4QTJxSnFLUVZibnJhamVOM2NVWDA1dnNQ?=
 =?utf-8?B?dXpKcFQ0U05RNXFzbEkya1UrTFhqZXFVa2Jid2VaaldsTGlLNVQ1bW0yb1ly?=
 =?utf-8?B?YkNDTGNtWHlyelRSNTZvMmd1cEs1ZWhPaEwyb2VrZEpsSVZmSUZqWmJsZld5?=
 =?utf-8?B?M3N3K1RVOElCREhmeG5JM0RMdStZalN2d2pLMWhSaHMwSEx5N0dnSHN2U1No?=
 =?utf-8?B?MUtYcW40bUp1RkhUaHRtdzJJbHcwWDRydXN3VGtiTUcxL1Nma09ONHBsV2Va?=
 =?utf-8?B?bjlPVW1yVWtsS1NIU1NTSXluc2Y2Ykx5NTBxN3NOdUkrOTQ0Y2RWWjhsNDA5?=
 =?utf-8?B?WjVkaVloL2RKaU00TXlIZHZWRXR4MUVtRGloUlZPcmVZRlR6MGF6YXFFbnVx?=
 =?utf-8?B?TTRRdTB2VytldmZhU1dBWkJzeUEydFk0S2ExMDVvL0U2MEhNVlp5bkc1V1JK?=
 =?utf-8?B?VGZPSzhKRkFuV0pxbTNqZDQxR3JYRU5idVVkOXkyaVI4ZkREemUyNFZrektv?=
 =?utf-8?B?b3N3Y1NYWENSaVBtN3dvaThnYm01cVVjWTBYak9lS2txTFFORGNmN0kxOTZi?=
 =?utf-8?B?Wk9pQzI0b1JUcytXZXkwQkZ5Q3NJTGZ3WlNYUElqYUVyV1B4d0F0WFk0NUI2?=
 =?utf-8?B?MEdTamhsUFRZYStuZnpSVTN0YlliTU96cUFEK2JrYTZnZFlLSy9HV2FkVk12?=
 =?utf-8?B?Q0h3Z2VQRkRqZEVRRS9hSjFiL0RqblloQ3JFYnA1eTZ1U1hsQStHUnZadDJv?=
 =?utf-8?B?dDV3OXVSYml0ZVgxakVlQ0Jib045WDR6b0M1aW9TTGNRYVlqaDdHdkpuQ0pP?=
 =?utf-8?B?ZGNvb2VVK1FFVUtBZWVKb2U3V2dWN2MwblVoTUNtL0VOTDFRbVgrcVdFQWN2?=
 =?utf-8?B?NWdRa2tYdXFPQXo0YVNyK1M1MGd0NXR2SEFPdVpvY0hwYjNZUEJWMUFEL0pX?=
 =?utf-8?B?dy9WUWIvakFOY0QrTlJlSUYyWmp0MmxEQjVLL1ZmOW9lMHp0eWtMcEFNRWtP?=
 =?utf-8?B?V1NiMDN0a1ZxeHc2cHVGc01jcU5zT1VLbHh6aUNmUjkyOE5LU3ViSnQyU3lx?=
 =?utf-8?B?U1lseHZyL2VGeVBxMk1QKzBHdXUzNTJ6STgyRWtTRGppdWFCdlJMSkZRWjc1?=
 =?utf-8?B?TTlSa0t1a3NqdUpQVXZhbnNwbnNGSnk0M2F2R2kxd1NycHUwZkM3UjdMa2lI?=
 =?utf-8?B?SElWK3A3NDJNcjZFWWdobVdReUlRa2ZETWM4a0E5blkremo3SXowTU9OQUtj?=
 =?utf-8?B?RkhpbnZKeWNiZEgvUkdBalNPOTIwQkpvclhUc2lqbDhmaXBiejFaRU9ZU1Q5?=
 =?utf-8?B?bTZha1AwRVRnYXRhajl1cEFsZTlQMU9lTDZNRnkwN0ZzVHhucTg3ay9UTzNr?=
 =?utf-8?B?UW1KeWdLb3BZQ3NaakNkREZpd1g1WG04dlE1MDE0Yy9VSGYxekdrWm1LVS9L?=
 =?utf-8?B?OC8yd2h1c3FpUkU2Vy94a3NITS9aZHE1SWFPQ0xTNlRoTExtb2lMYlZNZjY5?=
 =?utf-8?B?MnoxN1AwR3RsWUhxVXlWT2UxOStYYmFVbG9yODJUczhtKytoQk11YWNUVHd5?=
 =?utf-8?B?VWpsaFBTQzVzSEwzK1ZPS0dZRmtWWmpqU3RNdmU5SWswSnFxc1NBS3hZVGVr?=
 =?utf-8?B?NHFpV3lEc3ZYdEw4SnBhR1RKbHJ0b0t3U2pmNUovRDRRSmZFZFRTOWdZRFc1?=
 =?utf-8?B?RnZzSm1ZbWtCN0hKenR1UmxoMzBBMjRuSm11cHRrcDNGY2VGUmpwbTh5K2xu?=
 =?utf-8?B?Z0hhZFI4cnFISW5vNExsZmdBTloyOFJMT3U2ZVZtZ1RsOWszdCs3c3diNVdo?=
 =?utf-8?B?T0ZhYnNOOE90Wm9zZ0ZBcDF5SXJId3NCak9MLy9QUGY4TWpmT3R5SmJUN0d3?=
 =?utf-8?B?RmlCMnRKRWJOeDliUGVOcEtmcG5IdzRzWjQrZlRUTU9lcTlLN05IOUJmc1Fj?=
 =?utf-8?B?YzdJNG1lZm9LdkJiK2ZwekJHNGxHN3dicUVNaVFyOXRybFdBc3RGUHRYWlF3?=
 =?utf-8?B?czZqQW5oYUV4THl5YmZMTXdJaWhvUCszSmRxdHU2cThwVUlGNmhldlFXMWZo?=
 =?utf-8?B?cmxtWFFaajUzZGptUEZtbDd4VjdWTFpCUkNvaHRtVzRDUjg2UnBVQ2EvdS9O?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df834c2-cf4f-4bce-9a5d-08dd8e029814
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 07:33:15.3004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJkDRzdmMmzHqkUAIYDVQyoFh6FN78ots5VFb0EhqYGA0YlV+O3wz90pjAqzUIQeBT3x/z8m9WMM3vAsxLwb3Z/qLrzpy4QoYYt966DTllU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6896
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


On 5/8/2025 12:56 PM, Swati Sharma wrote:
> Instead of repeatedly checking debugfs to determine if a panel
> supports DSC, perform the check once and store valid outputs (those
> that support DSC and meet the required constraints) in an array.
>
> v2: - store pipe as well in array

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>



>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tests/intel/kms_dsc.c | 37 ++++++++++++++++++++++---------------
>   1 file changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 7f0745370..173307d28 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -71,12 +71,15 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   typedef struct {
>   	int drm_fd;
> +	int count;
>   	uint32_t devid;
>   	igt_display_t display;
>   	struct igt_fb fb_test_pattern;
>   	enum dsc_output_format output_format;
>   	unsigned int plane_format;
>   	igt_output_t *output;
> +	igt_output_t *valid_output[IGT_MAX_PIPES];
> +	enum pipe output_pipe[IGT_MAX_PIPES];
>   	int input_bpc;
>   	int disp_ver;
>   	enum pipe pipe;
> @@ -248,32 +251,21 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     unsigned int plane_format,
>   		     enum dsc_output_format output_format)
>   {
> -	igt_display_t *display = &data->display;
> -	igt_output_t *output;
> -	enum pipe pipe;
>   	char name[3][LEN] = {
>   				{0},
>   				{0},
>   				{0},
>   			    };
>   
> +	igt_require_f(data->count > 0, "No dsc output found that meets all constraints\n");
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for (int i = 0; i < data->count; i++) {
>   		data->output_format = output_format;
>   		data->plane_format = plane_format;
>   		data->input_bpc = bpc;
> -		data->output = output;
> -		data->pipe = pipe;
> -
> -		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> -		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> -			continue;
> -
> -		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC) {
> -			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
> -			continue;
> -		}
> +		data->output = data->valid_output[i];
> +		data->pipe = data->output_pipe[i];
>   
>   		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
>   		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> @@ -323,15 +315,30 @@ data_t data = {};
>   
>   igt_main_args("l", NULL, help_str, opt_handler, &data)
>   {
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		data.devid = intel_get_drm_devid(data.drm_fd);
>   		data.disp_ver = intel_display_ver(data.devid);
> +		data.count = 0;
>   		kmstest_set_vt_graphics_mode();
>   		igt_install_exit_handler(kms_dsc_exit_handler);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
> +
> +		for_each_pipe(&data.display, pipe) {
> +			for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +				if (is_dsc_supported_by_sink(data.drm_fd, output) &&
> +				    check_gen11_dp_constraint(data.drm_fd, output, pipe) &&
> +				    igt_get_output_max_bpc(data.drm_fd, output->name) > MIN_DSC_BPC) {
> +						data.output_pipe[data.count] = pipe;
> +						data.valid_output[data.count++] = output;
> +				}
> +			}
> +		}
>   	}
>   
>   	igt_describe("Tests basic display stream compression functionality if supported "
