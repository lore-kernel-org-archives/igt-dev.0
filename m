Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D34C02194
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 14:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2010410E4E5;
	Mon,  3 Feb 2025 14:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6LJ/7mc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CDA10E4E5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738591569; x=1770127569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=awbWSIHv/DVUZuh8MHiS7OVqe+NeU6MKob2dJ7aN+SY=;
 b=P6LJ/7mc7yuF65ziLLj7gAPXY31tCBQAi+XoSHe45a6UMZ3luxTZnirc
 C866q8c9SMFIW3nfnruyQD9WUMLwitbXwk5WF57075PFqinoqKNcNeXSk
 OoLoPx/0VAwxOjnr8qmiWn+L75+hceZqs3SYk1SA6b9VMHd6j8mPYmJhV
 yHAcsVQzs62W53NCi5OBs3npP1tsPq61Wy/vUJMjtaj67LaXLs6V7VSpv
 y9XTTdkigjpXOt81q01SnawOtTziwlIqT5SyqnmsIybPWhtPxV3RsSXE6
 UAuF1q7p7X7YINMfn+kC5bOMdfmW7xku2SwotM9tL2ecuzklhmtha7tVe w==;
X-CSE-ConnectionGUID: L1uguZ50RWiAlrF15gO5Ug==
X-CSE-MsgGUID: aP0xxSsIRauv52D4lk8AWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42832935"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="42832935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 06:06:09 -0800
X-CSE-ConnectionGUID: QZanyRkaRqmtG9P6Ass+VA==
X-CSE-MsgGUID: 3+i6QQh0ROiI7CaNPFwGSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115270895"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 06:06:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 06:06:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 06:06:08 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 06:06:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJISJ/rG82RDkHeX1SUq0eRFwWftidjvZDokT7WOVTjap4QxvzVkXc4RaNtV75NZ9o25OFnLlU2FDCYuy+8c1x1yRo5yW9mEVsHAU6Z6bndrVqidUqvtZeuns9+6w39HVFrshYE6cGlLTwB6nnOfHHP/ph1nsrjPIn7kwQ+2ZXyFaxXmVuNg3h0IK9OMxIsJasLTdTOkXG5v1zyo7dmqSYADQEHQ9X2LpvJ3uxv7TB4JKDn52AId/tcbmUKGpzuQW7ofmrEyQPhANpNH9q/OgUlV7sNtRNK4e8pg0KQRU2v+kgSaAivNqGptqkiE1QfiJSLil/lhRVBQgHSgtQJAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kkundoRen8cKUhbudt9q1+Az+WTh+0+i6BWF+q26lg=;
 b=dCtSXBAEWnDb3CZ9Mqkj1F/7X9kEqu9BmtMrS4B3WsqhJxUMieT6rOgg9NWxu7CUc9YVFW7ITNj3/qfiKi/c1PbSCfbmQck8eBlr7i4J23v7PaLPkrF/+JLDybpBhvnpJ/RBDCrW8KdxDskYGpLXCrADLeRF6LABapXVJffiFcHLMDiCSIqIG1/80Q3uq0mIJx4ph+Qql6E6uEGguKSfst48CdbMSmsGOeJ2dyZH3mWVDnsDArR2ENE31F7lYjcCpm9H76ccIbvdA1PSYeUzQWvAjAobnY0x/afnhCmSYfJahcgKc8g9UyaTGKyBfExCCCVPb82+MyPGL5n6tYHlAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 14:06:05 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8398.017; Mon, 3 Feb 2025
 14:06:05 +0000
Message-ID: <389958a3-b669-4ddd-9f30-d94db65e9ce5@intel.com>
Date: Mon, 3 Feb 2025 19:35:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] tests/intel/kms_cdclk: Add conditions to filter
 valid outputs
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
 <20241230190315.48821-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241230190315.48821-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f09a76-8729-496d-cb56-08dd445be630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1FhWUM2eTM4c2QyaS9tdldxWGk1UGdUVHA0eVhVYjVXaXNzb1ZaUVVncWg0?=
 =?utf-8?B?aWNDN3JSdG9JbmJjQncwSGp6MmwwWjVQUUZSYit3SWVzQzMyZUJhNXlhVVM1?=
 =?utf-8?B?bHBvSmlyem4zaXZWYzFDUDFKVjJqOTZ6cjJvWnNZWlpJSVIvSUNSaFhnNzIz?=
 =?utf-8?B?TXdWa3N0VW53ME40R0xBQUJmdlFmMGN3dFJTYW5MSWNhMlBDb1pmdUw4ZlhO?=
 =?utf-8?B?d0VvV0lkbU05Z3poTXUwTHp0ZkROMTI4dnZMNlZSZVhoWFpMR0RQSXN1UUs1?=
 =?utf-8?B?SXp6YVh6RThpd2Y2aTFIZmN3Z1FxT29WMXRuaEV5alp3WUdoZk05Q05aNFJw?=
 =?utf-8?B?bThnOGN1YlhURmhpdnBHR0x0dWlPNmt4MnlZVFQyeWJWZ1ltalBQdHNnNzZP?=
 =?utf-8?B?ZFh5QWNpajFqdTFyT1pUUUQ1MFNMTlg5SXo2V0E3VXZvOXRMckwxRmpmUmZE?=
 =?utf-8?B?MWgzeUFkK08zVUFsbHdHUXk1RkpVd1lNdWRHV3NFd0F5Vm9TZjltOVM4dzRG?=
 =?utf-8?B?SXlJUytVS056RFUyYlo5eEh3NWFyVEZoRktpdkpab2pDcUswZnRBQkxjT21Y?=
 =?utf-8?B?VWk0b2k1QkFqaHBWQm9DL2dGcjVNS0JjSktlOUNHR3AzUUhyUU5FZEwvaTFr?=
 =?utf-8?B?ZlY1UDdXR24vaVFVRWZsVDB0b3VwMVQ0cFlueTJVOTdHeDBMUFNjMWIwaytO?=
 =?utf-8?B?RGtYd2J1cGNDd0RXOUx0NEx1aW1uZm5JVm84WUdFMFJBWE1BWllUaTFVeVNQ?=
 =?utf-8?B?cVJ5bktuMHN1UkZhRkNxdElLSCtsdVNydnJZNnN1QzdZMHJQZHBad1NaN3BG?=
 =?utf-8?B?K24vVGJCdFRlSHVzL2hpK3BzS2JEb1RidVlVcWR2Q05sTWRPZndYNkJuTC9L?=
 =?utf-8?B?d0FYamJxWHZRaU4wMlJ1ZHJ2S1R2VVVoTjRSQ29kQ2RnalFvRHVUY0hvTmhn?=
 =?utf-8?B?VkJ1clcxOUw2Q2FiOUE3T0hoZlVkbkZTUDVKbGM5Rm1uSUdYRFhGTVZlbllH?=
 =?utf-8?B?N0s3WmtlajRnV3FwMVdBcVRvNURrdWo0NVNLaVplL21LWG1UUmN6K3JZMzl3?=
 =?utf-8?B?REVYN0VSWE5CcVJad1JwTmgzcTYyU2IvVGIwdEg1YndQWEM2M3dhZlRBeTV5?=
 =?utf-8?B?ZHlOWGU5QksyMFJIdXJrejBKYlkxT0xzcGdsU2QxYU1jbkN4Y0grUTlrMDIv?=
 =?utf-8?B?cFErNDBiOWZiYmk2ZWxrTVhsODB6T1JvaWZrSzVkMWVacTNhV3JGYWVmTzY5?=
 =?utf-8?B?MmV3RmhhdlBpbzZBUnlBTUN5WDdmbGtUQjhNTjNTZ0NPMit5UjVCUS8zaVlO?=
 =?utf-8?B?S01CUEduUDRPYmE3U3FQUXBkeXQrT0s3b0VSdklFTGdIVUtleUZRS3N5WTMr?=
 =?utf-8?B?L1FQYmdxVWRtYWwwN1lNb3lqQURVbUJFR2RUN2VuRWdtNDZSN3JXY1ZId3Rw?=
 =?utf-8?B?OW14NmExTVcvbFRqN05wRjdSMmpkWmpmTEVtV0JsUXFHbzRWTHVpVlV4ejB1?=
 =?utf-8?B?L28wWE5zQU1nUHNWN3VMcG5jaHd6ZUYrcllzWjZYd283cmhyUDZNM3B5d3Bz?=
 =?utf-8?B?dFNwamttdjdDQ1pGRHA3RlhWVllVUU5OS0Q4NjNmQ24vcU5ISS9aalFsZ1F3?=
 =?utf-8?B?OFlFRlFYYnlIM2RxSGR1MG9rMTc1bHI2MjMvMHBiUDFNbmFJVzhlSVRQdTg3?=
 =?utf-8?B?RFIra0NHQnJKQngxRzZhTDhGYVhWbnVRZW5ZUDhGNnZyakF0c3FqRGlQZVZn?=
 =?utf-8?B?VFdwZVlaeFFma3dPNktjNmpnMnBia1NvUEpMV2h2am0xK0JSeFlaVSt5eitj?=
 =?utf-8?B?ZWpmaHgvbGpkNjkrbFlNM1daVkFsR3A4TlZENms3M2ZyZWxSYjhKNEZyWHNN?=
 =?utf-8?Q?Hq57k0/fkACLt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0dzU1FtcVBrVkIwNkdRaDRBTkltQmxUcGpBbk12VjNXaUVjbGpYcUM3Ni9D?=
 =?utf-8?B?d0FxSENVYTNxMlBsMDRGNGJRRmlBcXp3ZTlwRlc3YWkzZmcwek9aOENzT01y?=
 =?utf-8?B?UzBpbHN2VDN3bW1TRU10eUoxeEIwb3haRVdkL3AxV3p5UXNpeTZ6YVRlRFBB?=
 =?utf-8?B?YUZ4R0RTRzVVQi9RaGxXemRPNFBmdGY1VGVyZVVkblRXcjNGSUVwUkIvbDBR?=
 =?utf-8?B?TkExS0JQc2I3TjZ6Q2ZhSm1oUVhTd1FXMGticzdrSzgzK0h5ZHJmaUM5SVFG?=
 =?utf-8?B?ZTg5cmhRRWlRaEhCVzN4cEJHYnBnU010LzJCSVh3Um9EOHhJZXFmMnY0SFc5?=
 =?utf-8?B?QkFkQi9wRkVhN3F3UFozVTNFNVliRUp0ckRheklIQWFxZXJuaGJQSmtmS3Bk?=
 =?utf-8?B?Nld1NGpzVXFxTStNVTEwUnZyc2g1VXNDeEJObXEzckc3RW0zYlI3Uk5McW9K?=
 =?utf-8?B?c1Z3ZzcvVXFoT3lHTmRsR28wZGMwVkg0NjkrZXJtTnhheXlDS3Z3NnMvRVgx?=
 =?utf-8?B?VWk3ZjlTK2h2M2NRdENNczBiSDZNSVhncXF5djVWN1pRTUVSNUZBWXVWcW9u?=
 =?utf-8?B?VjhFRlFscFkxYjFZZlFUUnNmYm1wU3dtME5ab3QwNk1qbmNQKzRnUURWenFH?=
 =?utf-8?B?emJQMU9lVTRHaURubWlUWDV5RElhVzRXYTh5eVIvSDNtR1U2MjAwNnZkMlFh?=
 =?utf-8?B?RkU3R1Y5Q0xQakZLVklVZTVySFpvYmFEWnFPRmJHc3g0SXdENXZsbEtuWGVU?=
 =?utf-8?B?SjlzQVlTZXNqMk1uQzU2a2RIdzVhb3NxN25QM0p3TW9DZDYrK3BMR1ZpcFRB?=
 =?utf-8?B?UkZmMnJhM3dFVWdiWmFJOHVMMlM3aDhNSFNvcGxjcURKU1hiVzJpZm01TmFu?=
 =?utf-8?B?WHlhUGM3WWdGbHNDVGtvOUtuTEp5WlZ1R2tROHpxSjZhbjhyVnA2R0IzYjY1?=
 =?utf-8?B?Y3QweFROWVBNVFdaMjExcW9PRmgzOGN5b1h4N205bjEvdHpGM0xMN0tyUjBr?=
 =?utf-8?B?T0M4RDl5ZXhURzNBM3E0VHJYRWpsRzU4b3U0RTUrVDQ5OHdnaWZ6Q0w3VWY5?=
 =?utf-8?B?NFpLSXpKMGZMMWJsdzg3ZGV6eXpoTC94NE9hbXZaUVNySTFwejZFQ2ZqcmpO?=
 =?utf-8?B?TjJNSnlJSXVsclVUWGUzbEVaK3JvRHZ5emVhT1Fxa0prS2l0RDBHdzZpYzlu?=
 =?utf-8?B?THFlV09zeWpOOFM1R0lUem56RzhtdnZZSlNZTzVQNk5XRCtycFNjSnA4MDJy?=
 =?utf-8?B?aG1rcHZHb3pGblR2VFZGTVpCdzFnM3VyMkZkN0FOb0tTTVQ2RU5wYTkxUkhS?=
 =?utf-8?B?bXJRdUVmSHQyRGFpeVJVeWprQmRubXdvV0NNTGk0VkF5NFVEVk51bHJaR21j?=
 =?utf-8?B?SVVlT3Z6bnhhZWhrVUVIOEpEdzdaeFMvc1JRR2ZPMTc4MlFGcjVhYmwwbWdY?=
 =?utf-8?B?WGtwb1UycjlvL1VFdHdZU1ZXbnNqM3JYVmkrZEtZOEJncGZRcG9vd0Z5TjNT?=
 =?utf-8?B?ejdQQVVpVlVZSkhQdjlaZGdmdGtQRFVXTVU2N1ZTYjRDeTdPRGJvT04yV1hN?=
 =?utf-8?B?eTBHYnhsS0t4TDE3OFFiSUhhUTNzRjBtTGxxbmM4MmMxWEJ5WUVCSlFCSys0?=
 =?utf-8?B?cHRkNGV1aUZ3MlRncS9JeVFpVWpqdzk1TVMrMTNVVi8zSU9iUGhxNktYSVN3?=
 =?utf-8?B?MGhRc1ZQVzgveHkzQ0NMQTk2a21uZ25qK29IT1pKTjN0OEJlajZZZ3pLaGVL?=
 =?utf-8?B?OXV6SXYvM3JXSVRqTS9hMjZEcTlFNkFsT3JkL1A0bjc4VWVXY2lybUVyeUd4?=
 =?utf-8?B?YUtqcFVSSHJGNVF3SXh5UFdqSmpIV2tCL21DclBUaVlWRmlxMmJIVmdoSndk?=
 =?utf-8?B?WldiNHlCTHczMWphcUE3VVcvRi81bkdjNW9jNk1WTFpweHNPWmZlUWRFMXV1?=
 =?utf-8?B?T0E3M2Z0Wk5qbEZ4N2w0dUp0YWpXK0taMEZncFpLTUM1bzRQTVpGYTM1U0Zp?=
 =?utf-8?B?K3VoMnBWR2xIeUpBb0RFTm5QNEFMOFdCWVNMY0wzcG5NbzlJQ2hyUGFpRU4r?=
 =?utf-8?B?KzZTNTc5c3Q1S29pMlFnOUg1WUt0bXhBdThDTUFxa2lIMFB0MDZhNW1rZWR3?=
 =?utf-8?B?b3NsVGM2OFdEWC81WXVRYVpZeDJUUitMMDdWc1Q2Z0NoTzNjdUZNenQ0djcw?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f09a76-8729-496d-cb56-08dd445be630
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 14:06:05.4800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ACG//+/PT2oZNCV+c2MosSRChbeyPwkGg1yxr0/JKR39gO2o/UjV6MSqe6h2Y5caKdyobwX8kNo5WR0bPyYLHfAA/5v+kDj3TMU6Cc7fuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
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


On 12/31/2024 12:33 AM, Swati Sharma wrote:
> Conditions are added to filter valid outputs. Also, highres and
> lowres of valid outputs are stored in an array to be re-used
> later.

Imperative mood.

Also mention why the condition are added.

Perhaps to check if both low res and high res are same there would be no 
cdclk transition.

>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 52 +++++++++++++++++++++++++++++------------
>   1 file changed, 37 insertions(+), 15 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index e78d22e1d..dfc64ae2e 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -261,8 +261,10 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	igt_display_t *display = &data->display;
>   	int debugfs_fd = data->debugfs_fd;
>   	drmModeModeInfo *mode, mode_hi, mode_lo;
> +	drmModeModeInfo mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
> +	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
>   	igt_output_t *output;
> -	int valid_outputs = 0;
> +	int count = 0;
>   	int cdclk_ref, cdclk_new;
>   	uint16_t width = 0, height = 0;
>   	struct igt_fb fb;
> @@ -273,31 +275,51 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	do_cleanup_display(display);
>   	igt_display_reset(display);
>   
> -	for_each_connected_output(&data->display, output)
> -		valid_outputs++;
> -
> -	i = 0;
>   	for_each_connected_output(display, output) {
> -		mode = igt_output_get_mode(output);
> +		drmModeModeInfo highres_mode;
> +		drmModeModeInfo lowres_mode;
> +
> +		highres_mode = *igt_output_get_highres_mode(output);
> +		igt_require_f(highres_mode.hdisplay >= HDISPLAY_4K && highres_mode.vdisplay >= VDISPLAY_4K &&
> +			      highres_mode.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
> +			      igt_output_name(output));
> +
> +		lowres_mode = *get_lowres_mode(output);
> +
> +		if (highres_mode.hdisplay == lowres_mode.hdisplay &&
> +		    highres_mode.vdisplay == lowres_mode.vdisplay) {
> +			igt_info("Highest and lowest mode resolutions are same on output %s; no transition will occur, skipping\n",
> +				  igt_output_name(output));
> +			continue;
> +		}
> +
> +		valid_outputs[count++] = output;
> +	}
> +
> +	igt_skip_on_f(count < 2,
> +		      "Number of valid outputs (%d) must be greater than or equal to 2\n", count);
> +
> +	for (int k = 0; k < count; k++) {

Do we need two loops?

At least highres mode and lowres mode can be stored in the previous loop 
itself.

> +		mode_highres[k] = *igt_output_get_highres_mode(valid_outputs[k]);
> +		mode_lowres[k] = *get_lowres_mode(valid_outputs[k]);
> +
> +		mode = igt_output_get_mode(valid_outputs[k]);
>   		igt_assert(mode);
>   
> +		// Update the maximum width and height for the framebuffer

I dont think we need these comments.


>   		width = max(width, mode->hdisplay);
>   		height = max(height, mode->vdisplay);
>   
> -		mode_hi = *igt_output_get_highres_mode(output);
> -		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
> -			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
> -			      igt_output_name(output));
> -
> -		igt_output_set_pipe(output, i);
> -		igt_output_override_mode(output, &mode_hi);
> -		i++;
> +		igt_output_set_pipe(valid_outputs[k], k);
> +		igt_output_override_mode(valid_outputs[k], &mode_highres[k]);
>   	}
> +
>   	igt_require(intel_pipe_output_combo_valid(display));
> -	igt_display_reset(display);
>   
> +	// Create a framebuffer with the maximum dimensions calculated earlier

Ditto.

Regards,

Ankit

>   	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   			      DRM_FORMAT_MOD_LINEAR, &fb);
> +
>   	i = 0;
>   	for_each_connected_output(display, output) {
>   		pipe = &display->pipes[i];
