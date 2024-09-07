Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB038E71080
	for <igt-dev@archiver.kernel.org>; Sat,  7 Sep 2024 11:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680D910E21C;
	Sat,  7 Sep 2024 11:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKJufDRV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E2810E21C
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Sep 2024 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725709924; x=1757245924;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b7MuJNvRkR5POgOGW9SJlmym09cs/BQ0Wl38rvfqsKE=;
 b=bKJufDRVMtVNJ/QEMz9UtP+B6ujS0JE0Fu+uIkUkV46FVxnq7c79Oxwo
 Q0xgRQyOmr/Mg+zmaZdfN7EkRYUqXYr1toGdUlSVvVbHIt8R7z7xHdgkf
 Xqlo9qfYqR054oK8TM1qQug0ZLsslP0l9w7DjydWbYk5dN4f5kBkzbc/V
 z5LgKox+LdeFWurrS6DaFqVlQGScrUJAqJsALHwSm2RrmIx3Gd1mBpJ5S
 tqxGTMT0HqgQ/w8Lrs6mTFuPxLpbue2ayJDMwWhQbKMKIwdHEuO5Vbmte
 pMR0XCKvayn2ciXd049CJNFVQtOXVIJ2Dghpsx5eAvWTcqtBAdlDwfg6p g==;
X-CSE-ConnectionGUID: pLRKAJTKQ8Or1v+r4vy7Zw==
X-CSE-MsgGUID: R4HIvEBPQiOO3L6hVeZztA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28246293"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="28246293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2024 04:52:04 -0700
X-CSE-ConnectionGUID: bI4AyuGOTDeczsF+KRvI/g==
X-CSE-MsgGUID: 59Gov+IdQ1+bhLqby3dnqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="96907074"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2024 04:52:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 04:52:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 7 Sep 2024 04:52:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 04:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRbl3sDUz/zcWNJwUGhV9P7zVaVLaUt7h7i/6QRHOZDF2aE9pTFEv5tQ8OjC5yrISvWh6g6dR347MlNQW3aRa2hb/C7ZGGcxgUqTcn5fMGuZponjNQI3+wBYqgPdet+L5uA/pNjGN8koiQDrTGeNuKF/Sa7vYy5pkOfc2Z8svqqzsOtbEWSXR89HdekToB9/LgKSoWABjXtxDr2IxMfBezCYSIod2zufYQVv+HJJTC3gc0wYhl9lIwlNAQ8HHmh9wEIhN0M5qJb9FNITs1530mTqb0LeqMPTcXLWvFPVaPa/lKOcHPsEja/1bVaFnM+tiSB2TAvpKjTedNi2HGBfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvE1ZOYEv1wPslZIfGNW76uEBkJKiF6A12bbEqWE8fo=;
 b=hjyvEPXRgJgtLN3dz0rThThyd3CUbQYW+3Y85LbD7HY5IaMYxhlbGOjP/mn+bz9Bfs5d+LXdpnTuAKeLHIz5rA75egF4bK9yZ6uYd4G79m/BZprM+noPLz5FW6LzZPdxNkS+7ErsMaR5GSBL5PYqxzXDUcl0fZQIrOK79Qsd+Rsp+KFYSu6Pre0bSm1uKLvVPg5kM8X3m/vnXW+vI8e9D7fmxLfvj0t1x2ny5SQ1Pte2xLhdAaULT8pesOkU/HORJamO8GgOQnURjjgt4Ag6+nNL1wLHv/okXHa7MK8ou3Ou/UJJPLHUofCXMlZaWNxX+LW/n2h1ng31VJr6EP7KLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Sat, 7 Sep
 2024 11:52:00 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7939.017; Sat, 7 Sep 2024
 11:52:00 +0000
Message-ID: <ca61ff48-0ac3-41fa-9474-b84fb8678bf4@intel.com>
Date: Sat, 7 Sep 2024 17:21:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/kms_dirtyfb: Check features after
 rendering
To: <igt-dev@lists.freedesktop.org>
References: <20240701051301.3344927-1-jouni.hogander@intel.com>
 <20240701051301.3344927-4-jouni.hogander@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240701051301.3344927-4-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::21) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3a7f7a-7f1f-4f40-e9e6-08dccf337b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG84Wk1VUUZGdm5IZlVYU1h3WXhPdVdoSmc5dmVWbGtGMUdNb2k1VHdkN1Zk?=
 =?utf-8?B?ZXk3SXV0T3ZTeE93cmpMY3ZHMUh2RnVVT3hPUHY2OWJKdlFJSFR4M2RpTlh1?=
 =?utf-8?B?UDdyY2xDL3A2ajI1aStoUG41bmNUTnRuTUVNNHQvNlpiSnAxSWhhUzJxQmtG?=
 =?utf-8?B?d1MrRjFYZkovdTUyRWIxdjIrcm5UUFpsOGoySHBkMy80T3g3T3U3d1VaR0sx?=
 =?utf-8?B?UUtJUnF2TmFxR1BaNk8vU3g3ZEZYVGtWZHhsTGNtaG0xdURJS3VlTG84b3Iy?=
 =?utf-8?B?ZVYvZGVvUTVMMlRyVnFGYXEycUNRamZvSmlFYmRhRFRiSGg2TEtQUzQyRDJY?=
 =?utf-8?B?MFkvZWRST1FOelg3eTdhRExNZG44QUpaQ3BqaGlMZGYxaG0xYmRUbUI4cUVp?=
 =?utf-8?B?a2ZuMVlzQit2Tm96WGthRHRRMmkwalF6d0o5RkRnSW0zejlDTDdtNUV0K3J0?=
 =?utf-8?B?VVdaU0xGN2JsVXZpdS9sOXU4Y3ZYZ3VPQnY3SnJnVUh5VktmNHBiaWRUSHdM?=
 =?utf-8?B?eUVvUUlSeWtGcFBkNWhROXZaMWtxU05GU0pMQkJmVi9VY1dTd0dNUUhEL084?=
 =?utf-8?B?TG9MNXpzeGl0djlFUWVpZUtJdlRQMUNDa0F3SkUwbCtVQWNXUTZVVXdWUGhE?=
 =?utf-8?B?N0FaZmM5VVAzaGEvUmo5M2xkRVpnWlVLb1A5VlRWNkpUUFppbmJ4RXdvay9H?=
 =?utf-8?B?RGlkdmZHMENUd1Q1eEVEWC9mZGhFUUVWaGN6Qml6VzUvbHF2MWFjajlYL2Nu?=
 =?utf-8?B?L0tCTElzaWE1YUcwV1BTVVBzc2RwTWQ0ZFU5bnNRSVc5YUluTHZ4Y3VXK2tG?=
 =?utf-8?B?Q0lPYjdPTURMalZITDVBZmdLdjJTcVNpKzlTeDFEa0xsUTY2WnplemZpQXVT?=
 =?utf-8?B?T2cySm84ZWIwTGFOSGV3UW9SSzFGL1ZaK3hMVU9WSVpscUx6cDQyME54a2Ev?=
 =?utf-8?B?M0ZoUGFvTEVaVWtCYURJL1hGc0JiZktDRzFITjl0OVIvZVNoVmtGa09ObXJQ?=
 =?utf-8?B?bWRWakxjbW5jeXVrSnR5UWNSOHYxOUtoU0J0alNBY2VqaG5qT1pwL2E0d0tQ?=
 =?utf-8?B?TGdUdEhXTFVtWm9mYWgzWFVpWGR2TXJqQnd4WmpNQXErYU5GQmZPMHkycmM4?=
 =?utf-8?B?Mkc2b045RW5IMEQ2RnlKTFg5Ris5UUhhcmR2aWMyR2Jub01raUxPcW1wYTBI?=
 =?utf-8?B?RmhrMVhERGliTkFhWGU5VzlhcHdoSHVlL3lacGZZMmFNUmxzTjN3VGZoYlBJ?=
 =?utf-8?B?L09OTXp0SGYxUitXd1UrVGdPUkRpR2NSRVE3cXBrb1NhenB4allmODZQeWo4?=
 =?utf-8?B?TGlPYmVBRnNkV05vWVVOcUhGNHBlaWVJVDdJUVhGTG8wWmhKQzdTSmVLeHdH?=
 =?utf-8?B?YXc2NVd0Z0hTb3ZhZmFsSFVUUFNOUHVMTG8vK3ozL0YvejE1RW9yOWhVRDZ0?=
 =?utf-8?B?ZW5QWEVLSW9GbjVRc3RYSG0wd1RXaUQ4bTRHSWZaT1JoK2gxVVBMdTJTbU1s?=
 =?utf-8?B?blQ0T1hzdTBoMG9IN2o4TWsranduMUNlSU1yTzVCM1RLOCtJUlJDV0lrZFlv?=
 =?utf-8?B?Y3hscmR2MDhUU2JJWTJRSU9mRzI5S041dlhhRzB4cGRPeVM0a2tmemZmNUxp?=
 =?utf-8?B?azhtTTJpQjNtTEszaHFtN2FrMHlDNmFEbmRWdDVnZmhSZzI3NEErbys4RWRX?=
 =?utf-8?B?RmQ5dG5MN2ticlVyWWhzMEM3WVpHU1NuRkZ4RGZXVEQ0MTF3OVVBb0JWazQ4?=
 =?utf-8?B?TklJU2pWMTlkSFBQTDRCdG5GM0xDdE9Db3JFc1g1Ty96cFFBa08yUXFwNkJi?=
 =?utf-8?B?dW5TZEVDRUFpTGRzQkV4QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0xkZHJLY3JPQVJnWThyYnJqcWdXZUcyRlpXUWR6Z09IYXN0QUFSS0NLZFVY?=
 =?utf-8?B?UTRXS1JhMWtBcUNLcmtxYm9ZMTF2SjhGOUxFRFVkZTZpQkc3ekt1NnVYZHlm?=
 =?utf-8?B?emp5ODNnaUF1aktUZGMzbVo2eG9Uam1qRHAweHJqRTNtTEFtR0l6YmVKNEhQ?=
 =?utf-8?B?NkdhM25jZHFyTmh3ZVZ0U0kvMndOL2RsQ3pSeklrMUcrQVVzTlIwOEVzaWlh?=
 =?utf-8?B?TXRvbStTeDhTb09KWDE1L1RZTExJZVh6ZXp1U1B0MTAvVEJSY2xmYmVxZ1Y4?=
 =?utf-8?B?a1QwKzFpd25DbW9lc1l3a044cG5yK0RDNVozbEpnOTJmY3Y5ZzhXU0s4OFVR?=
 =?utf-8?B?QUZOdjI4a0E1MDhuR2xWVzhUbStMd21hd3Nvd2N0UkhHVSt6M3doNk84eFhP?=
 =?utf-8?B?L1N5cFNHVTg1dUZpM2Z2UFVscG1TRW5WQzFzQnJ4ZHRaZ1JQU0xEbDdKRFhr?=
 =?utf-8?B?aENHdURuZWVFdmFTOVN2RUpiSktHTmtsMjJGWlZTdUxIZzg4ZmlpSDRMNFB2?=
 =?utf-8?B?bmVGMDlQR1R6MkV3eXl6bXhYdVMxOVpzMHdXN2F2OFFZSmtxUnR6bGpDajFx?=
 =?utf-8?B?ZFQvQ0l5dGhzZ3BsT2xxMmlzUkVRb0pZUlVmYkcwbXFHOE5iVEl5L0RoVTNB?=
 =?utf-8?B?aTBOUWRiQVNZNHFjTnA1WVFyQVQ0K003NHYrL3Qvdzc2ZmtKckI1dHJoMFpk?=
 =?utf-8?B?dUQ4RnlFMnNSSU1uUW5Ma1Z1blZNZEQ5c0JwSHhwWkNlOXlycGRmYjZGeVpu?=
 =?utf-8?B?MGpOTExWVFpRNElUSkZQM3NTS202NVc4OFhlUTRUV1lmOHM0L0dSS3RQbC9o?=
 =?utf-8?B?QXRld0lKekZIbWdCV2Zobk93SEIrcDNoSUlySzZvY0grUnlvMk1YVEpKbFRX?=
 =?utf-8?B?cTdNOHV4d2lUbzNJTm1ueHYydWxQQWdObk1YSjdLVS9WdWVvd29xdFhrZXNp?=
 =?utf-8?B?V3JYY0Y3K0tDTU9BQXo3SWVZZGtsU0Vnc2VpRWRIaE9OMkJGRnpQVVFsWk1w?=
 =?utf-8?B?L2pHTEVNbHpnRzJZbU5nUTRoNlZUWldqNUZKMmJxN1Y4R1ZEOTh2YVQ4QjVs?=
 =?utf-8?B?V1dJbDN5UnJ1WXJGODJVcGZOMllobU9ub2tKTlp0dXBYWXA3QTlVOXZPNGY2?=
 =?utf-8?B?bmRtd0pmbjNVTjNsa3BFaGE2eTBiRE9wZDVHMjkzRldQNEdKZDNVZk5qdWR6?=
 =?utf-8?B?N0xjK0dwWVlGbDRqdC9wZjlQRUhLdXhBT3dneVdOZ1QvbDJxOHJCOGVZUjJN?=
 =?utf-8?B?MnNFSFhCZ0VMV3ZxSEowbk5kY2I2WlgvNE9WZ2twSGp0OUozTjBpZ3MxNmFh?=
 =?utf-8?B?T3RGTW5vbWFOcEF3RktiZE9vNmlqUzVZcExyYXVHUEt6Qlp3TXlpdkZsYjFP?=
 =?utf-8?B?OFVneEJwVExtS1hqN2RyMW93TlluUno4YWwrb1g5UjBVOGVxQlR1cjQwN1V3?=
 =?utf-8?B?d2pwbTQyT21mNCt2L3puSFdSdmR1dXhjWXRDdFFUb3dEMngvL0ltNkl1WkNv?=
 =?utf-8?B?WWJXYnpPbElacnozbmhiOThXTnVlV2o0NndOWnZPWnM1M2dEZjhaNmp3RVFk?=
 =?utf-8?B?TWZWU1ROMjIyV2lrRGdJVVVobno4SHcvaWJqc0Z5cW5RQlBOc1hRS3RkRmFs?=
 =?utf-8?B?UXlwK2NVOUtMODdsRkh6VEN3U3NhNzBteVhZUkFVSFVmVlJSSzBMOE5JVmcx?=
 =?utf-8?B?cWtWOGtLeEJ5ZzRjeGxVWC9uZHpvRzNHeElhcG9TWVJKMEFLc1MwMVNLZWE2?=
 =?utf-8?B?aUxiVEVTMTd2ZE82UitvWGpUbGNvRDBtN04zVjVyczFVQ2gyWWRLQlF3ZDNI?=
 =?utf-8?B?L1RiK1ZPeENjbVkrQXY1U1ZoaDhaQ2owS00wcFRjQ3FMZ1VQWFYrMmd2OHA5?=
 =?utf-8?B?dEhMR2lmVXBFN2JncXU1MTIrcTJKRXBLajY5RlN5WXY2cWg3WmViR1ZZUmVM?=
 =?utf-8?B?M3h2SjBDSEV4dVI4djVPcWdFOGc1WDZza1ljalV1Ti9IVVZFRTljaWlOMlJt?=
 =?utf-8?B?cm9KM2I4MDNseEpMQzN1RTNBanMzRnFBUXZaUzI3SDBQRDJuaFRmUjBoR3VL?=
 =?utf-8?B?RUVqOXVwV0JPUjRTdmtWbk50MmFoRlB0V05BeWdJbDFSM2duWWFINHNkMURX?=
 =?utf-8?B?bXhnbE5ERHA0YU9tdU9oUnRabHFlajJ2emZDakg2TFRMN25JemFtSkxDU3pF?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3a7f7a-7f1f-4f40-e9e6-08dccf337b36
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 11:52:00.0328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWgL45mKyban5C74KOmmCL08VaqljLPhL3Sx1T1RTCQh6ifybV81JYzFTx6EfU9sY8rUqBZnaRkzLcqTJgehIb1mK/qIjxqox+c+8LPM3Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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



On 7/1/2024 10:43 AM, Jouni Högander wrote:
> Check each feature after rendering and flush. Also add new check for
> possible PSR errors.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/intel/kms_dirtyfb.c | 33 +++++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 75047ec63..35df9be3b 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -145,7 +145,7 @@ static void enable_feature(data_t *data)
>   	}
>   }
>   
> -static void check_feature(data_t *data)
> +static void check_feature_enabled(data_t *data)
>   {
>   	switch (data->feature) {
>   	case FEATURE_NONE:
> @@ -171,6 +171,33 @@ static void check_feature(data_t *data)
>   	}
>   }
>   
> +static void check_feature(data_t *data)
> +{
> +	switch (data->feature) {
> +	case FEATURE_NONE:
> +		break;
> +	case FEATURE_FBC:
> +		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
> +							  data->pipe),
> +			     "FBC disabled\n");
> +		/* TODO: Add compression check here */
> +		break;
> +	case FEATURE_PSR:
> +		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data->output),
> +			     "No PSR entry\n");
> +		psr_sink_error_check(data->debugfs_fd, PSR_MODE_1, data->output);
> +		break;
> +	case FEATURE_DRRS:
> +		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->pipe),
> +			     "DRRS INACTIVE\n");
> +		break;
> +	case FEATURE_DEFAULT:
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
>   static void disable_features(data_t *data)
>   {
>   	intel_fbc_disable(data->drm_fd);
> @@ -232,7 +259,7 @@ static void prepare(data_t *data)
>   
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	check_feature(data);
> +	check_feature_enabled(data);
>   }
LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>   
>   static void cleanup(data_t *data)
> @@ -298,6 +325,8 @@ static void run_test(data_t *data)
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>   	igt_assert_crc_equal(&crc, &data->ref_crc);
>   
> +	check_feature(data);
> +
>   	igt_spin_free(data->drm_fd, spin);
>   	intel_bb_destroy(ibb);
>   	intel_buf_destroy(src);

