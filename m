Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAE1C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 06:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9574710E12E;
	Thu, 20 Mar 2025 06:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pcl96UF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547C710E12E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 06:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742450641; x=1773986641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iyNPJ+3M9ByWWJID/mOpr54a3mdW3sc9LLpQqsN8/ss=;
 b=Pcl96UF5q0fJFIMxOe8ZTfofRI0PCa/yjuOYdg/TiCDe12O4H4ICJS/B
 mAh++ja6Y37yeqg1cZYJypbH83aUQEU2BBdVNx/Lf6cb+LpOTD1gLNwYx
 YtQImDwxP/J8Ubv4PXIAAlOnvHXSWBqOb1dQm/Dn84KsBQSIBLyDYIV/T
 NME2sBKDEePmmShN9Iw9u98x2WxN3YaFZbGvXWJMMgDOcrN1xSUhQyhTX
 LdqqV031ZJQkMx3c4WHxSB0Hx8goWiq1WC0grwXVuEqCEu8yX1kgdmkJj
 QrbXWvG1o6ojNvlk8jekgLy83gz7pUY+xnLjxhhI1pGLCVmI9rrNwAUzR A==;
X-CSE-ConnectionGUID: w3klBsR+R6e745fH1dVIvw==
X-CSE-MsgGUID: v7YC2FFCRXOrgziMnlr10g==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54332013"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="54332013"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 23:04:01 -0700
X-CSE-ConnectionGUID: tsg5KCFTR1CKVN+EAD4Uug==
X-CSE-MsgGUID: SBQ3ZmxXSHCTDimN4stbGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="160173757"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 23:04:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 23:04:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 23:04:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 23:03:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpJjzORVhtTu2V63Vmc0r6Kg2K5MDQDdLkOAnRiYqM9XmPrSBnoAeEzwZKRPSTCgthD/TOyUhAQrKYzrC90nGPPFU1BGsigejP5Shojs05ViSJ/xt5I6NhcXWLsdCs2JDUnIY5Q1cs/ul6spdpfUtaKVjCzpqiBVCHsal1ucGV71oyg5K6f0N5+umw2NC1RcMMSWIzckrNIIJKwuDtoz7+ucPx3xQKrD/oedpLXzK4vBwZx1j9sN7pCVnZMnqtpiJQtoNKQ5J3/BCpoR4+R5TudzCH7JjB1j6WKjlADSxnXtnpXW9gSEp85UmRNTkCzkZTQgJYSUmce1ddzxVpi5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vbsmVu4W8NWkmqFET56BjWv2YNFxN0Z0Pg+lP7QTkg=;
 b=g0EcPhp1bzVLAwgGEGcqtpekJeZqjkviuSBopeMhjKcFgZDm8RgAMEZwKomx4Bpk/yQs13kZI9gk/oiq21wCKVAAdo0zvnAPrLT/gpmR6Ucg3No2QldPvDQY3iu7gtJhT2LVRMvuwNw38Hy1qVNekK/xsGq8HnTqIwoWrsumuHWQi5ue0QnwWFg7KfxKqHlQvxxIMlbjIupJcAEMmni/HaHcK1AO4S0MdRI8TOd2iufbsbxiRIWnKkz0fe5m1DqzNQp1A8eJ0QtOl/Vjq3iAX6rHbAmZNj1zP2TVvG211mG1XVDpqDt1KULPbp/IR5DNlddaHqIhwYXIxhHxITsPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5685.namprd11.prod.outlook.com (2603:10b6:8:20::21) by
 PH7PR11MB6833.namprd11.prod.outlook.com (2603:10b6:510:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 06:03:02 +0000
Received: from DM8PR11MB5685.namprd11.prod.outlook.com
 ([fe80::d2ec:6ee7:4fc2:ea3b]) by DM8PR11MB5685.namprd11.prod.outlook.com
 ([fe80::d2ec:6ee7:4fc2:ea3b%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 06:03:02 +0000
Message-ID: <aadaecb5-0a32-4f93-809e-eaba3bbd83ed@intel.com>
Date: Thu, 20 Mar 2025 11:32:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: Use get_max_pipe_hdisplay in
 joiner_possible fucntions
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
References: <20250319061244.769947-1-karthik.b.s@intel.com>
 <DM4PR11MB6312C5E5E228A137C711513290D92@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB6312C5E5E228A137C711513290D92@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To DM8PR11MB5685.namprd11.prod.outlook.com
 (2603:10b6:8:20::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5685:EE_|PH7PR11MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d3abae-7fc4-41a6-f196-08dd6774c636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REI2UnZvM1ZJempGNzBUSSt5ekxPMzZSNVlQdXcybllJUDBoRXJPa0VzQnBr?=
 =?utf-8?B?NXFxSEdJUitBSWVkYW93ZTZldEp1ZGV1eVhYWVg5bmovWS9Ma0lXQ2lpZ3Fs?=
 =?utf-8?B?VWFjZFVqTlI1MDFKdEo5ZGpBK1dQYVpRMmtHYzhOVnBIVFJnSXRPNzdhSjlk?=
 =?utf-8?B?RkpxVU5IRmN5ektWMGNoN3VQMzV0NnYzVVQvWWRzN0tjaGhBc1Yrbk1tQmt0?=
 =?utf-8?B?Yys3b0tSZ05UY0lRK1Z2OCtRMGpSYzBqdERLUG9mYWV5Ri9FL3BOU3AzTUth?=
 =?utf-8?B?VTJJWGt6UUplRGVycGNpNEExU0RYbFlSS2dGVVFoczJsWmN5SjZWVTg1aElY?=
 =?utf-8?B?YUd6NTJMS0xESWpseFVsZlc3TGFHTVErUnI4ZUxmUjQ1N0RQeXBoS3AxYjJ1?=
 =?utf-8?B?KzRxQlV6QlZLdkZTbENvcnZ1R1NPVE8xNC9CMmoxK2c1WTF5NXR5NFBsSG40?=
 =?utf-8?B?NjF1Nk4rbWQ4R1liNlY4bTAycXNrWHExWVhXcThvNjRqRVNPREhnWFVNUHBL?=
 =?utf-8?B?elZtQUZGamw3NkxHMFRMbmV1L2NpTVE2TmkyRVlNdG9vMmwwSVJZUm9yYWsy?=
 =?utf-8?B?cllNelcrVzltckhrWjBjMHY5WUY5Q2U3b1hoeHBsZXArd0NjcW40d1BLa2xB?=
 =?utf-8?B?K3ZyRHU3UmJYekg4V2JXSWM3SEtHMVhEMkVYY05wUHIzalZuYzc4WW5LZTRI?=
 =?utf-8?B?QTF2Mnhhak4zSFFjRzlMZGNHZTNBS2F3YkRWYTJBRzFHb1ZGMVJMblhvR29I?=
 =?utf-8?B?WjJlK3ZWaWcvZVJOWEpEc1drdjczSmZWQVNyQjRvcWJuTlR3dkVYNTNPdnJF?=
 =?utf-8?B?dm1jblRVQUNwY0M2S1hGd1hwY1dtNjJqSURhNnlsU2o2UlZocmhSbWR2YmVl?=
 =?utf-8?B?NHZTSC9XYUpneEs4OXppNE5XZU5uWXJjNmhjQysySG5HSkhGMzFzTGcyNkRR?=
 =?utf-8?B?V3pZYWtLQk5zbUxaQTlFbmN3Sk1QMlBIczc5L1lkMGtoelZPbS9QTnhlSXpG?=
 =?utf-8?B?WHdiUW55WXhEYU5DcTErc2Q4ZG9xd3pySmFyeGN6bW91SnNwNDVNaVExV0Z2?=
 =?utf-8?B?VGZhZENIWGcvWVAzS1A0aUx6b0dSSmU5NTQzc2szVmgwVUNra015WkNRSU83?=
 =?utf-8?B?TzlGWnRNd05XRVJLVTNHVkFDZjZkY1A2MmcrWmZkemptWjEySFBFUGY5aFNl?=
 =?utf-8?B?UWMxT1ZuaGFWZCtjYXNJeEZOelo3V2QwTlU4SndicXZSanptZUplM2NaaGVR?=
 =?utf-8?B?RzF6a1I1cDMwUysreTI2VWFPNVUxSHJnV1FNbGVLQWI4UjMwUlNJR3B0cmJ3?=
 =?utf-8?B?VmxkblVPMG9xQjRVYkQ3dTRhSGRIYmtmWGx2S1pYSzBUSlpkMkRtbm5aOGI5?=
 =?utf-8?B?M0ZybHFpQk5zdkZ5bmQyUHlORXFCV3JnVUh0OTREdnllbVRiU2xIK1BwWXRY?=
 =?utf-8?B?Q0hVNzNWQmpwNVNLa1dvYnRUM09MM0dnQncwVGNTMWk0ZjhtaVBvVU81RTNS?=
 =?utf-8?B?cWI1WVB1OUZxZHJpcmVWWTRoSm1jbHBpNFdkUm0xdU14Nk5ETmZLOTBuSHFi?=
 =?utf-8?B?QjN0a2R0VDBKZ25QZHJrNW1YbGMxUlV1UnhIekRTc1F0NVVTUElqWjdUd2VZ?=
 =?utf-8?B?R2ZpMytadEs5K3JuOFloVFJYaGtObUhQS3k5ZVFiZ0UzMXhPSGdDSkZ0Q3pp?=
 =?utf-8?B?UXoyMnZEK2hrc0NtYmgrWCt0NitXQy9iUHBCdnNwYUtmOGJNWElEenFBeit3?=
 =?utf-8?B?ZW41bnROWThTL1VHbEg3SWMzM0NaZ3dsSHN2aWdSZzVBVlpXNnM0cGdzLzZt?=
 =?utf-8?B?a2laaHR2YWVYUy9FUExlZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5685.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHFmRXhOZFkzdU1DV3BKdUhsWkwwekVPUWNaNVNnZHAxSk9lK2xiZVhQSTNC?=
 =?utf-8?B?bVZwMWlydUdZaFcvN0FOVDYxREVETzZ0Um5RVThhdk1ZcXVWWHRDRCt5TUJs?=
 =?utf-8?B?amVpVkNNS0hES3RERDJ5V0lMK1l0UlJNUEJKc1Q5alpTK0ZSZFFCMit2N05S?=
 =?utf-8?B?T1ZxWWF4ODg5ZjE3ZVNVa3llTjlXZXcxNVhWV294K3JlR0N4eXNhaDQ5dFE0?=
 =?utf-8?B?OFNNcE9TUmRlN2NiVWNtSklDRllpY3hUckRqZ2VlYnhLaXJXU2p2N01PVEND?=
 =?utf-8?B?azhXNWE0TGlHbWdqbUQ1MFlzK1UrTE03TTJXVTJ6V3NFeU9uaTZNblo1aity?=
 =?utf-8?B?bWpZd3J2UUNCcTJuY09GdmlZV2FML0JqMzVQY1pGOTF5Rkp5c0tEc21jZGJv?=
 =?utf-8?B?RkJCZWdNcWhNQ3R4eGlPUmJVMGhBQ05qN0JKMHpUczk1UkJiSHRJOGRzZndO?=
 =?utf-8?B?clBWY0VlRDFVZVFYSkU0My8wTktFcmVXcE9qM2h3WXlOS01Uc1N2R3JtbHFx?=
 =?utf-8?B?NDJPcHp3VTQyMWJVOHZxWWRTMTFqOFdsWDdTSmdaaGY1NG1pZzlISG4zZ1hy?=
 =?utf-8?B?WFd6UHNzZDI1ZGRSdUdGbTdNaTJDaEZ1SWpaRXhnc0FDNVBvU3V6M2xHc05m?=
 =?utf-8?B?QWQyQVdZcytqbkEzNkVZUnlOVFNmY0p6WjRVZmpIa0UvUTB2VTFXeWxQeWJo?=
 =?utf-8?B?eDNiN2pNTVp6OSsvdWgwYktpY0xaOVBmVU9ZQW00R2htcXBrTWdhQnNzdU5v?=
 =?utf-8?B?bnNVYmNuR0puaUNqL2NCdkxhcDNWM21Idm1aKytSOXZXc3BjQjN6Y3hqSTBE?=
 =?utf-8?B?YW9pVlV6T2NrT0FTT0VwTEJwV05LeVZoNDZkMlhoRHlLVTFUM0RWeUxPcUt0?=
 =?utf-8?B?UE5vTkFtSEFnbG5FV295aklwK1lKYXVtUG4zSXRmRWpqWkpjcGtkU1VsTkor?=
 =?utf-8?B?MFdYU3lEMmNJZnFYSitUUWo1bVBhalFsWWoyVTkvL1B4N3ZtWEM4Y3BqSU1H?=
 =?utf-8?B?QUkwSjl5RDZKVll6UnJ0UjJ0VnFMZDh0YmtsV1RaTzl6YTc2a0MwUlg4NUFE?=
 =?utf-8?B?UEJpV0RsbXRnNjRuR1cyZUFPY2VFR3Y3S3o1N1FFdDljM05wN1JsRmxvanVw?=
 =?utf-8?B?UHpVMkkyMys4MGZ4Z013ZUdsV2RFTmUva3lxWFJFTE0zM2Rib2JSVndNZzNw?=
 =?utf-8?B?MVI4L25iMmxJZlZueStibUNXZTFUdzFxaEVCNVVxNmdwQzl1ZmwrS3k5VjFH?=
 =?utf-8?B?czVUcHpTY3Exb1lRdkRUUk5yVXZPTEszZEkyakhXVDR3MkdiWVVqZEUxUTgz?=
 =?utf-8?B?c2FnL2puTUVSUWtYWUhZMkJuTnRld01KZTlCZUxTLzA5VXlSMjQ1dnptZXVu?=
 =?utf-8?B?clY5TnBKUko2LytpWHozOGpWMnRYNkw4QzQ2MkdJMlJTbDFxbTBMeFFsMndW?=
 =?utf-8?B?TFFuT1dtbEhpYjRubmc2RFN1bG1leGVNcmxXeDZ5WmdKLys1c2lVeDFUOSt0?=
 =?utf-8?B?VkFoWEdvQlFQdjM5OWQ3dUJmdWhOK2QyWHdJWkhXaTEwbjZkaS9mVVMxcUlp?=
 =?utf-8?B?cnIxM1MxaGdrZHFHcExZYlBzOCtoNDlGM3ZJYTJwOWx2eFB4UTdXTlhDd3lu?=
 =?utf-8?B?dlNuTmh5ZjhsbWgramhaL2tXdnF1Yi9RL21vUTVBYUFmQXphRWd0biswajRs?=
 =?utf-8?B?aXpPUkNHT29PR1FwUHdwVW50S01NM1BPdlcxaE1yMWYwWFYvTFZsand4MEVu?=
 =?utf-8?B?TkViOWVuMlhDU2F1WWVYQTdSTlNucTEva0szdDVDNndNL1V1YWFQdnQrbUN1?=
 =?utf-8?B?cDhkNzI4NFpRNkNxek1Reko4REpyQ2NkNEZ0SllaQ29KWm0xY2ptWHZUNFNX?=
 =?utf-8?B?dTNsV1BlanZZaG5iMld1WHVqZFpoT1lzcVJFNmx4WWFKN08zb3cwUjh1RThR?=
 =?utf-8?B?clFQZVZ6NDUvaTlHMkRRNEE0WVBjdlF4OHVIVXF0OW8yVVQyZXdxWFY3YUNN?=
 =?utf-8?B?alY1SFhHU011RVZTOWxWakNQTkh4VGNOYWZUSjRXSlpkYkpmTW5HUUppT1JP?=
 =?utf-8?B?MWxzSE1IYjRFUVVwdGZzZHcwMnhPS0JNQ041YlduQlhGeG5sRURjKzBta2Jq?=
 =?utf-8?Q?DEENotEVTTFlfJ7SC9lXVWAaw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d3abae-7fc4-41a6-f196-08dd6774c636
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5685.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 06:03:02.4761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1vHgdhKeXiudCDSxu92OuCbFmhJxSAjwNLfLgbKSACdV736MqfaBceLTC8yemFOoxP8aMKxjBu60aBdGrQfPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6833
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

Hi Jeevan,

On 3/19/2025 11:29 PM, B, Jeevan wrote:
>> -----Original Message-----
>> From: B S, Karthik <karthik.b.s@intel.com>
>> Sent: Wednesday, March 19, 2025 11:43 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; B, Jeevan
>> <jeevan.b@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t] lib/igt_kms: Use get_max_pipe_hdisplay in
>> joiner_possible fucntions
>>
>> Update 'joiner_possible' helper functions to use the existing
>> get_max_pipe_hdisplay helper.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c | 45 ++++++++++++++++++++-------------------------
>>   lib/igt_kms.h |  2 +-
>>   2 files changed, 21 insertions(+), 26 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index cc3bb3ae7..99c8707c7 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6428,6 +6428,20 @@ int igt_get_current_cdclk(int fd)
>>   	return read_and_parse_cdclk_debugfs(fd, "Current CD clock
>> frequency:");  }
>>
>> +/**
>> + * get_max_hdisplay:
>> + * @drm_fd: drm file descriptor
>> + *
>> + * Returns: The maximum hdisplay supported per pipe.
>> + */
>> +static int get_max_pipe_hdisplay(int drm_fd) {
>> +	int dev_id = intel_get_drm_devid(drm_fd);
>> +
>> +	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
>> +						   HDISPLAY_5K_PER_PIPE;
>> +}
>> +
>>   /**
>>    * igt_bigjoiner_possible:
>>    * @drm_fd: drm file descriptor
>> @@ -6441,13 +6455,8 @@ int igt_get_current_cdclk(int fd)
>>    */
>>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
>> max_dotclock)  {
>> -	int max_hdisplay, dev_id;
>> -
>> -	dev_id = intel_get_drm_devid(drm_fd);
>> -	max_hdisplay = (intel_display_ver(dev_id) >= 30) ?
>> HDISPLAY_6K_PER_PIPE :
>> -			HDISPLAY_5K_PER_PIPE;
>> -
>> -	return (mode->hdisplay > max_hdisplay || mode->clock >
>> max_dotclock);
>> +	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
>> +		mode->clock > max_dotclock);
>>   }
>>
>>   /**
>> @@ -6469,7 +6478,7 @@ bool bigjoiner_mode_found(int drm_fd,
>> drmModeConnector *connector,
>>
>>   	for (int i=0; i< connector->count_modes; i++) {
>>   		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i],
>> max_dotclock) &&
>> -		    !igt_ultrajoiner_possible(&connector->modes[i],
>> max_dotclock)) {
>> +		    !igt_ultrajoiner_possible(drm_fd, &connector->modes[i],
>> +max_dotclock)) {
>>   			*mode = connector->modes[i];
>>   			found = true;
>>   			break;
>> @@ -6478,20 +6487,6 @@ bool bigjoiner_mode_found(int drm_fd,
>> drmModeConnector *connector,
>>   	return found;
>>   }
>>
>> -/**
>> - * get_max_hdisplay:
>> - * @drm_fd: drm file descriptor
>> - *
>> - * Returns: The maximum hdisplay supported per pipe.
>> - */
>> -static int get_max_pipe_hdisplay(int drm_fd) -{
>> -	int dev_id = intel_get_drm_devid(drm_fd);
>> -
>> -	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
>> -						   HDISPLAY_5K_PER_PIPE;
>> -}
>> -
>>   /**
>>    * max_non_joiner_mode_found:
>>    * @drm_fd: drm file descriptor
>> @@ -6567,9 +6562,9 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd,
>> enum pipe pipe)
>>    *
>>    * Returns: True if mode requires Ultrajoiner, else False.
>>    */
>> -bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>> +bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int
>> +max_dotclock)
>>   {
>> -	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
>> +	return (mode->hdisplay > 2 * get_max_pipe_hdisplay(drm_fd) ||
>>   		mode->clock > 2 * max_dotclock);
>>   }
>>
> For ultrajoiner hdisplay logic feels off, we need to correct this.
> Need to check spec and update. Correct me if I am wrong
>
> Apart from these code LGTM.

Thank you for the review.

The logic for ultrajoiner is similar to what we've in bigjoiner and also 
we've the same logic in kernel as well.

https://gitlab.freedesktop.org/drm/tip/-/blob/drm-tip/drivers/gpu/drm/i915/display/intel_dp.c?ref_type=heads#L1333

Thanks,
Karthik.B.S
>> @@ -6591,7 +6586,7 @@ bool ultrajoiner_mode_found(int drm_fd,
>> drmModeConnector *connector,
>>   	bool found = false;
>>
>>   	for (int i = 0; i < connector->count_modes; i++) {
>> -		if (igt_ultrajoiner_possible(&connector->modes[i],
>> max_dotclock)) {
>> +		if (igt_ultrajoiner_possible(drm_fd, &connector->modes[i],
>> +max_dotclock)) {
>>   			*mode = connector->modes[i];
>>   			found = true;
>>   			break;
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 27b545f52..0381c82ad
>> 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1252,7 +1252,7 @@ bool bigjoiner_mode_found(int drm_fd,
>> drmModeConnector *connector,  bool max_non_joiner_mode_found(int
>> drm_fd, drmModeConnector *connector,
>>   			       int max_dotclock, drmModeModeInfo *mode);
>> bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe); -bool
>> igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>> +bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int
>> +max_dotclock);
>>   bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>   			  int max_dotclock, drmModeModeInfo *mode);  bool
>> igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
>> --
>> 2.43.0
