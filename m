Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B1EC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 05:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129D10E173;
	Mon, 10 Feb 2025 05:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSDnnf3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E22210E173
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 05:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739167133; x=1770703133;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tyYVPuFRtoVDF1gJF0pZSYhJgbUW+skwl1X27mZWP70=;
 b=GSDnnf3bBvuFnRtP2UIVR171Cb/8odFZHFfB//wimPHTgApwSy+TagCY
 w96yR/H8AUZZcwMhNruYoXJml4UqB789JR5UkeBxK+Tj8VuXe7mcKTi8V
 V+oS6eA/TtB6mpMvQUkkX3EzGTFlXqJJz3LjKnVH4tLMiD//v3NkjEcRP
 YGaiZ2dg5Jqr2DcvipBmd9NhYnie77ldTstaFQxKIPBDEl2jJ8y+uGfMv
 8o6Afw+2HE35Tcd3Np6ddVaqtVKZFV47fhCjQhMfDeVkuud5MMi3eInkd
 zhvThJaLECNxa5UzIPUlyPPZyowDHsjn39m4RxuLbZ64IfXiZohpum8ol Q==;
X-CSE-ConnectionGUID: ZgRjptElSC64C4qmixsKBw==
X-CSE-MsgGUID: Ya4Nh7n9SRGgJ4Zx1oUFVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50716783"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="50716783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:58:53 -0800
X-CSE-ConnectionGUID: WyMqXITDSfiI5qv9eQ3PgQ==
X-CSE-MsgGUID: e1VsVhvcSFeXqKDTAuNi+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="117145260"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 21:58:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 21:58:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 21:58:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 21:58:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgS4PEItMbK4SOP1dIbj38fFfkgSV4C3XaC845q3sxlfRemFCxzO5gu+TRpj2zQD7uZ+kO4b3Y9ZxbiZPAJ8KoS890JIFyjtdZTPEfAmqRca+YC39xBZ3cKEyokTgK4sFY5daWVRGGYRyKfX4J3j7oV6/7YHlG/iveiitYZVF8YBqYzH22PziHfDNpsvigfIJAq3U1wcLymGfJWSCT6fLv5IvHdPdSa7C/Cts7XX9QZNZZZP6QHuVmTGtyOLHPsd7xZfipTAmvZHEBDTfLzjOncojXQY3ZqCRvfQRhgHtlWUCczR+rqrWDzBftyYZoai72+xhIryWsJu4/RIlzMsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buMJ8BgALjjtVAMpvsEiGUu/Z9bxMnZEg1chIK/Sr/A=;
 b=swZuliSk0/B1+RJNfWJ4uWGgrWjzJp3ohcfgdU9V4u7PV0H02ZwKgA51aWk8W+RNUJj+eQ1QQ2y4dEP7HAGjZ3PnVwvonz1Xi3Vpedaat86CXYC+5ighsqOnnMgLg5ZK7qIhHNl9KhqKdnznkRyvuCuTuQcGzNfcwKysxJDCLfJ4avCpvNb5k5Gnq+uOLUTCtWPUxFdDm2hm98U6i41OuWI15KsKpwb/NR5/tj/LDFdjUvKHyvz77m1mmIWospUYfYL4WF4m+V9i6EdgeprN5gTdSkn4Jj9RDAYQ66jYWJthUAJzn7hnCCl/MrCeyG1y7ydQ6ZrvxPacmVzm+Qe8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 05:58:35 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 05:58:35 +0000
Message-ID: <9b18fa61-d689-46a5-9855-7f24d95094fc@intel.com>
Date: Mon, 10 Feb 2025 11:28:29 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_i-g-t=5D_tests/kms=5Fdisplay=5Fmodes=3A_Ad?=
 =?UTF-8?Q?d_check_for_=E2=89=A52_outputs_in_extended_mode_test?=
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20250210061036.1228921-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250210061036.1228921-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb670bf-777d-4802-8183-08dd4997f49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWZ6R0RqU2RaL3ZBblozWWVIRnAyK2pRSjFCRHdQV0drcTVzRVdxUGlZckIr?=
 =?utf-8?B?OFFBNFg4bEQ0MzJQYlBET0dzQVJkRjV1Smp0YlZIVjBJd3RlUndWLzUreklk?=
 =?utf-8?B?V3BwS1JYUlpmV0VsK3pLS2lnNndFNUdDcFdUcDBVdnBXdHRHQWZLMWpPNElh?=
 =?utf-8?B?SnBFVVhuTTN6T095S0dvS3JjNWxPU3N3YW53eCtQSllZSENBTGtOMm9KZVdm?=
 =?utf-8?B?c084aGgweVVZNFdWNmt3WjBHZUczWjRDVG95M1Zrd2I0dFZYSDNMTks2UFl6?=
 =?utf-8?B?TlFvQWlLYXdZaUhoakxIKyt4TkFRaTA5alJpS2FPbE55SVdScWVtVjJsM0tE?=
 =?utf-8?B?b0VkQTdSTk1hRUxZb3FmOG02aGprUmtGczg2Q0lkZ0E0MklWbmtHK1RtRTYw?=
 =?utf-8?B?MElPQVpPaFlldkRxSGM5dWExNm12WEQyVmNWcHpPaUhidytPdjJrNTFvR0dB?=
 =?utf-8?B?MWhUL3NjOWg0RS9UaTg2TDQ4YUNSNFVDUVl1VXgzM2tVcmRSTWVUTzRkemQ1?=
 =?utf-8?B?Nm5lTS9KRDdiVVhUY3VDSWV2aTBDbGlrZy9NTGxHaUJZc0UwbEZVR0RkRStV?=
 =?utf-8?B?d3JWdS9ZemRPdDRqeGJLZk5oSnBpZjlsZTJuSmRkeTEraEs4a2FmZFdtUlJ4?=
 =?utf-8?B?TTBueGwwb2cvOVVwL2FITkVQNzJxSldVR1k3bTdCdnoxUXVwRDVXd2huRHE3?=
 =?utf-8?B?MjF4ekFYMmZkVXRRMG9jbXFhZzNsRllMQ3NtTlFaMmxXUjdJU3pyUzVSdWU5?=
 =?utf-8?B?MVVWZ2d6UitaU2wvS1Zpc0kvWFh2Z0tLblBIdmM4VE9lN1FtTXNFOHUrYkhW?=
 =?utf-8?B?OTZQUEwrZ0RXcklxa2htdGExek5aY2w2dFEydzU3cTFFdDBRYzZsRlBEdlZC?=
 =?utf-8?B?TXpNWHQ0UUp0MG11S0dsbVA0T04zMklNcjJJZzdIOUtScFdwUlNUK2FhOXFh?=
 =?utf-8?B?U0tjMHROT3YvUHVZbXc0WjZDcm5oSGx3OElWeDYvWVhaK3I4WnMyODBxa1Y0?=
 =?utf-8?B?NFpZQXNhODRvOTJFbVJMYjZ4RFBrZ0ZYejU1Y0pJcy9OZTB6a2xKMXZoN2Ni?=
 =?utf-8?B?THBLOHJwVGI1NEwxdzh6SmdtK3E0dWppTEppQWZXdkUzcnY2ZmFDOW05UHpi?=
 =?utf-8?B?QzNtR2lnY3JjVmpPaitVdXY4aytDbWpNdHFLcVI5NEtCVlAwSnQ1SElZc0No?=
 =?utf-8?B?RmxVWVBBUUYwYzBDWkc4SE9qODNFcDN3bFQ2RU94Z2ZFZis5c3l2TXVMMU1D?=
 =?utf-8?B?MXNIaXlIeVJNUnFuVFZoeklHV2lQVENSeXpUL1lJOWJxTG9RVDdNQy9ob1hu?=
 =?utf-8?B?Z3RnZWxIL05SZ2ZvaXpJczRjV3MxRVgyNkZVb1Z4U1EzUjlYVUZUUnhSS2U5?=
 =?utf-8?B?Q2thdHFveUVYUWNvZnNYbWh5RzdCd3oyUHZSNFl4TmFHeDI0UmJJYnJGWm1k?=
 =?utf-8?B?Y1BMNXBpcGlGUktJWDF3Z1N4MmlDZWREaDI0b2I4OWRXc2FKejFxYlhNNkM3?=
 =?utf-8?B?WkJCMDJaMitrYlR1RFNyeWRISytsd2RQUytOcDN3d2dKRU1EWG1UbmZFZ3FP?=
 =?utf-8?B?Qkh4TFdLNHE1ano4NThobDZqaVhnZEZrVWVEclRvZ0kzWkRyZkdjSXN4S2lR?=
 =?utf-8?B?SndYTGFJQ05NM0l6eXZmNVBCMHA1bzJNcDhRUnZCcDVYRGNVc1ByTnlrdWdj?=
 =?utf-8?B?NE9jNnpmMmtsdmFVeDhyMmNra3dGU1hYUFB6eGlLdFIybDVQVWtYendlaGd2?=
 =?utf-8?B?M0pwTk9TS2dZMDRTK3ZKZS9pcHdHRmpHcHVPaTR4V1VhR2w0M3JXOXpRa1Uz?=
 =?utf-8?B?TE9ZUzIybDRwUVlSMFdrOXRJM2xkV3Fkekx6cE1QOFZ4Q3lHUkZvc0lVS1Jt?=
 =?utf-8?Q?r+H6YLmBc/lWR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2NPeUhKbjMzRzZCbXp2WnlRdUpCOXZpYy9pL2h5Tmt0WkxGS3lyV1lOZjBD?=
 =?utf-8?B?ME1xZHZvT2kySEVENEdMbUJRUmVueFV6dVhxVTM4eElpV2ExdGxnVTJJeDQx?=
 =?utf-8?B?cnJWRkxCUmxGdTYrdG5hKzhkeDlwdDhOOFdqNkZuNkZnd3A3MVBjUTlaS3d1?=
 =?utf-8?B?RjNZUnFLb0I0ZFdsWng4UU1IZUlzdFk5ZGN4cFduVm9nNjcrWkVTV3NuNnJk?=
 =?utf-8?B?aWoybjhpcmxCTmVabUNtSU5TSm15UExuL2FFaFZpQ3M2cmgvN2MwSHRQUDJa?=
 =?utf-8?B?YWUreVdibjg1eUtRZHlGWjR4R3Q2UHZGOHVYa3pKV3ZPQjh0cXFsOU5DdnNh?=
 =?utf-8?B?MjRHdnNyemFNYXphTDJhemErSEtPck1ONzl5TUo5MURkOGRrQzB0cFBzenB6?=
 =?utf-8?B?WS9uZ3NNVjhvWVYxSnVnUm40ZkYrc1lHdEtnT2U5MitwejJtQ3pNS2VMb2wv?=
 =?utf-8?B?SmtVeUpWUllrYXYyajFwT3QrS3lLMFNqcEtMME11R0VqUG53TW1LSlB1SVFp?=
 =?utf-8?B?WHUzZ2JSTEVEVUZ5QS9VL0FZcmlSK21SR1d5V3oyTzFLSVA3U05DUXNyQm1P?=
 =?utf-8?B?WDZXNVNXQklxbmkzeFpMWUF2dmFiam12WkIxV0hRVGJzSFBjQk5jaUEzSlNZ?=
 =?utf-8?B?cHE3ajhmTEdFQ3V6RFJ4bHo4R2hTNTZnenMzc3laVGE2cjJHVzlPWmMyRmgr?=
 =?utf-8?B?TFJFNTA5K2Y2a0F4bWpxRnFQclZGZTRINHRMYjNRekVWMSt4aXpGNE9aRFFS?=
 =?utf-8?B?UmRHUVRvYU1TcE5va0xTTmpoWkI1YUtLNG5jWVRpWGxtRk5kMkNOdDg4RlJM?=
 =?utf-8?B?S1gyRjNVcnVZNnFWZG40NjlBQ2ZSbFpvd0xCNWlPMFBkcHNYcE5QQzczdGJX?=
 =?utf-8?B?L1AzM3dnb0h5VisrTDdSbDhpTHVKL0VIdEFzbzIvMmlGZkxleGNBY09wQWZp?=
 =?utf-8?B?bDljVHhhQ0RnRnVmZXhHVm16a2VBem1jYnpBdGlwRStTMnFFTVZ2LzRDUDFm?=
 =?utf-8?B?dkhML20xNFFTd21mODZBT1RVVTlsUkg5UVh6bjAvYmxYM01yTWJiZWZESlRE?=
 =?utf-8?B?SURqc3hscUkyRUNFUkpNSjM2RlMxNlhVYmFuY2taby9BNjN0blpNR3Rzd2pM?=
 =?utf-8?B?S3ZRV2RHV09wUXppbE11Y3B6U3NQbStRWXk3ZEIxUlpqYnNkTDlRdXdtYm5s?=
 =?utf-8?B?NEZ2S3VqQUdJMXFjSHNMSEplV1YyR1dBV0ExU0IxSkE4Y1IycnpacWU4R2Ju?=
 =?utf-8?B?VjFaa2dNOXprWXZhY3c2TzdEU2FMTFJVaTRNSi9saGQrUGhGTHVaZ3JTQVNW?=
 =?utf-8?B?OTFqcmlmRWtXeFIyVlE2QkpPMFBTWG9LdjNVK3lFb1N1a3hHejFuT3JyanN6?=
 =?utf-8?B?czBTWDFwVlppM3VqUmdLQVdTdysrQUY3SEx4SnRDMlh1TTlndTg2TDBFRity?=
 =?utf-8?B?YmoyaDlnZ0FZZ0RxZlQvcVBZYWtMR2FtZ2t3Z1pBQ1F2VDR5dFMvQVc1TE9z?=
 =?utf-8?B?eTlQeWdvRzBaSHJtNFp1K0hwNFFYZXA2bE9jMzVnZCs1OCtwL1g3N0svci9O?=
 =?utf-8?B?M0s4NUJTeEEzbDhCM0R3cCt5UnkzMkRYckNEZjJEeDQ0RVg1MEdtVVdyR20y?=
 =?utf-8?B?a091SE5maUdHeGRPa1NrZXpEbkFEeXZJWWQvbXJMRjVscW84blRERWszWnhF?=
 =?utf-8?B?N2plc3lpVWx6Y0ZZYWFNK2FkS3dONUFWTTlXTENuUXVyTnRSV2xKSXNIMHlO?=
 =?utf-8?B?MnRvcDZQZGZXOUlTUjdvTjZZWVZRNHlhMWdRRDN6eGJKOWdjT1ZqWWEwY0F3?=
 =?utf-8?B?Kzk4ajN0OGxJZ0FPRlc4emdoa0wyOXlSSUdtVXdRU3NmQ1Y0aXFtUC8yZ2h5?=
 =?utf-8?B?YUVjblVFaWxEVXkzWXVSb041T0svS2hmNHZtMnB6UHFFMjhoemhzR2xMVDFT?=
 =?utf-8?B?dEI5eTFpZk5PRHIzellkVHQrZkVEVExxOWx4NHZzVGdhT1l5cG5kUFh2Q2wz?=
 =?utf-8?B?TFdPcmJ5ck1qOFBNMEdVc3BVclMxTFFWRFpXYW9xSGJCMEJXbklVQWFlRTNX?=
 =?utf-8?B?N2xNMXBUVStMbE5SSXhmczl0dHIvamNxUEZQaGdyUFlwYmxrVzNzTGhpN2hk?=
 =?utf-8?B?ME9kY25BUUdMZ0d6b2Q0MjRCT2s3YklPcVJpN0swYlpFbkIyaWpjSXliYVVt?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb670bf-777d-4802-8183-08dd4997f49e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 05:58:35.2723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxPUg+NCW1x6MLTRgCC5xKx6TvEOGupZBU+6svP1Y5zGXcUgYdrRChhh/qYhYILaV2BK3qDqocy0b19CWr0Liw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>


On 10-02-2025 11:40 am, Jeevan B wrote:
> extended mode test needs minimum 2 display to run, so add igt_require
> to check if the required criteria is met or not.
>
> v2: Fix commit message.
> v3: Update subject.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index e41c60cc0..117f82325 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -335,8 +335,10 @@ igt_main
>   	}
>   
>   	igt_describe("Test for validating display extended mode with a pair of connected displays");
> -	igt_subtest_with_dynamic("extended-mode-basic")
> +	igt_subtest_with_dynamic("extended-mode-basic") {
> +		igt_require_f(count > 1, "Minimum 2 outputs are required\n");
>   		run_extendedmode_test(&data);
> +	}
>   
>   	igt_describe("Negative test for validating display extended mode with a pair of connected "
>   		     "2k-4k or 4k-4k displays");

