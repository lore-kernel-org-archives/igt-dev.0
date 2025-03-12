Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B1C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 08:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E2010E0ED;
	Wed, 12 Mar 2025 08:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjdZgi0p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F2010E0ED
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741769175; x=1773305175;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dArqTBIVyxsFK5wHr85KmKNIf5To4oRWRxAD2Z4/7tc=;
 b=VjdZgi0p8ciGWhYhxH401gvdrEf1tJXcdjo8/t7bcyT2e7yoFNBLKUOa
 WQp7nSFAJfhi8GQV9mIMDVvKuTjBTUZtKbukHheJjAYf7yYyC73T72kqx
 HfGdUhK7834WDTcMMfZLouPeUhW7Te4bI9/qG62buOnKbwmzr8FKCC5p7
 ALVBjVZKGVEBhj/47ZwkB5yPN2vwDULCSwH4DiM68i3rDMB3Jbc8yiDMK
 Z83eSRo/Q02H6ZptTyoMT25v3QZ3OEV6M4PNT8GZ8iab153Boe9eOwMSK
 bmvFNSXSAPjeKPIwOQ3mbVNVg76/thuybk+FruP3cQ4ZTkDtG2NVzVdU4 w==;
X-CSE-ConnectionGUID: 24A+X9WpQsCUUCCyj+xuQQ==
X-CSE-MsgGUID: 9T5kToz2Qo+jFf70RT/ZUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53041560"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="53041560"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:46:14 -0700
X-CSE-ConnectionGUID: wdvr+0suS9GMxtG1VxOk3A==
X-CSE-MsgGUID: p+arDPD5R1C54fE+cpXS2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="143771734"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:46:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 01:46:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 01:46:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 01:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLFzZWT0rNlHqnyb7wQRPBQm0Wp4Q24tAK/q4q3przjzbAsk9kD9hqTUHbrjHg5+BuUk3NgGjzAgJoCk3AZRdG868YmJlouSovJADG28okzrFqoHwYvQPgQvtFUT6it516rjgPspt8E2HKSqF5UmR3rEP6Fs8+IATwgKSbI0zNF+7jX29y3mx03Qs5SuPuRW/Ruj+Dm5dyhSRDP4YiHe2yYT8AFqVpkU07dqiTERXb6xvMbYYgWPbzSmxjnjSYi3ueWzufXYywlJlQtuC7wDGLaLMHMWGM4j8IMMRqn/y+10mlD5Rl87TF7VganfK9DJGF9L2FHov1PWmXppz6hctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R8/k9A/GpKTlfex8dSKbhtxNJ6RUUXRkQxLp4it1zc=;
 b=vVWp3o8Ch7017en78UKeuGFhNfyyKUrC438elUT19zhqdr4/U5T0pS9HMmNlH7bPYNUJjdJK2UnL6DV80rdOV6OMyRsyxKm1g7+ylAytI5fKCD0rMpj3II3zdXt0f7VTwUyOD4rNeGxZhbIbIELAwAqW5ZEufn3betfGcrsa4l+Td/RUum8HTRNJ01uSshIbxC9ua6ASvTZIU2GE1Yvl/CdJDoI3z5bDJl+ORM0jASnRdk2+lFeUjmogokmcSD5TZy0hh30gHq0d9EqZiQ+c7p2UatKVycJvhw9FNP1l5T7pTF4VMm+CluQ2zDKSwj5FWdXeAA2ysn7uOUMx/kmL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 08:46:09 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Wed, 12 Mar 2025
 08:46:09 +0000
Message-ID: <4da26f32-8234-427c-9ed0-d685163367b1@intel.com>
Date: Wed, 12 Mar 2025 14:16:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/kms_dsc_helper: Add helper func()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250107185709.116756-1-swati2.sharma@intel.com>
 <20250107185709.116756-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250107185709.116756-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 7421d910-c081-4e5e-6054-08dd614255b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUowNGttNlk5SFpJNzhEekZIQjlIUXdvTWdMVCtKK0g5WHpCTFVkTmM3SFc3?=
 =?utf-8?B?RkdwYTJQdy9qRFZkeEVEZHVCOHlGWWl4WVlEbTBodVVxSk1HaCt1RitzeHVP?=
 =?utf-8?B?QkFyMGMyR2tKRWUvTG9YcVdrcUVSRHplWmdHbzRnWVh1R285S1ZXdTJKVHc4?=
 =?utf-8?B?Ylo0eTdrSkFyajRua1ZxVEo5bkVuMCsrZ05YMjlSME1RR2hFbTRWMlM1SGNP?=
 =?utf-8?B?YjY1ZzRKOEhxWFBBZmZsT3dYYkxrcmx4Z3BHSURqOURycmdvb1RBRWo1TmtS?=
 =?utf-8?B?TDBIZjE1QUtzYUlkcHhXMG5RKzZsL1A0OFIvTWxlM2x0OW9hM25oL01aZ2tF?=
 =?utf-8?B?U3NNN29IUDFmeEQ0MXh2NGdEcW9iMnQvZVZyT2xQOFpOT2k2NkRxZWhuZTMw?=
 =?utf-8?B?dXVudE15L21VN3pxK2Q5ZFI0ZGVWYjB4T3Riby9tbU9YejZEV08zdjRLVWhR?=
 =?utf-8?B?R211cWRhd3FGWURsd3JLaEQzOGpReG5LL0NCOXQrcGhYeUlNa1REdVYxZ1Ny?=
 =?utf-8?B?eG9vUWZQQytBcHVVZHBXT1ZScHM1V0VaT0RRdkt3d1d5ck1aRW0yQXBnVWVv?=
 =?utf-8?B?NDVyN3NmdTh3WDVjZWZteXZpa2cwMi8wOWM2a0dsRkxyT20wZkJrZ0MvdDZi?=
 =?utf-8?B?NUpKY0t6N2ppUFhYelRtQm96T25VeSswZ2ZtVDRFRHVRU3FhQ1hjNEJXSVd1?=
 =?utf-8?B?M2sxQnJZWWVGVFphcTUvSlVGc0gzRGlmRFMzK3ZabXdxMVVaSGVIeWdRQ1RW?=
 =?utf-8?B?LzdJSCtkSFRJemFMRnlGeEU1aU5MSm8yMnl2SEY1aUhZbmI0eXJrZjFFeHVB?=
 =?utf-8?B?bzViSklZUm42Ym1icG9MT01lc2lvWWZCc2duYVhvT2RqeWdPWlVLYXEySUVh?=
 =?utf-8?B?U3MzV0JrOG5JZTZSaGlMWG0vZDcvN0t1RVFrWHZUSFF5N1ZDbUFpeVU2TUxH?=
 =?utf-8?B?Wngxd0ZPd29FZWE1NXBTYVJabjRzMVZzWDliTERQeUMyTEc1VjkzQkZ1K1Ns?=
 =?utf-8?B?eFpiZ2VVUEQ2LzJxV1hwTWFMSWZlNy9BNVFFbzZ6YjI5em1QZnREQzlUWXdB?=
 =?utf-8?B?OWV1RW4zQldGVE1Ma3BwTTZvWnJaUi93VEdCNDNJNGxrQXZ1NUs5VTZwQ1Vt?=
 =?utf-8?B?S3JyaVc2bjlLOVlJWVBBMDVWYTF6TWxRK1RibVpkMTNPd2FVVkF5M2FRai8w?=
 =?utf-8?B?Nk1QaFp3czFrQkw3QTBORUtiRitPVUYzbkJRdXFOcDJHY1lqWEQxcS85N3Bh?=
 =?utf-8?B?UzF5T2dtMjNqNTdHTjg0S1UxajdPVVlxNnkwT1FyMVVJcU9FZjFHNkJLQTJy?=
 =?utf-8?B?c1lHV0lDZ3lVcVY1aDhPNGZNSUhRaGxmSWhEODRQWU1GOFE5WFhNaGMvZUZY?=
 =?utf-8?B?VnZNUnd6WCtyZ0ZzVGpVZGRUellGTXZqSTlRWE93bG1oSm5PWWwvMEpVN2hP?=
 =?utf-8?B?U0RrVGU3elRPM0xOYlFKa1pzdEk0dUNZeUJlK09MKzBrMWViU2w4OEhuOGhH?=
 =?utf-8?B?S0tVT1FWcGJlUjdGZlc0SFQvbk9ianZuOVllRHV1NThuYnV1YmZkMGU3VmhK?=
 =?utf-8?B?ZDEvSlNEMWwvZU9iZzV0c0xOeFlrbDdpVXB2Yi9IeXVIbnBXK1AwbGtJcHRN?=
 =?utf-8?B?V1pMckloc3p6Yk9VUzg1TEd5MG1xNkpYZDd6UFFVL2k0YmZDTlEremZ5eDdz?=
 =?utf-8?B?NlhLQ2RhYTlFblJ1Wis1alpMVWI3S04wc3BUMGovTkdWNGlwemJlL1EyUHo1?=
 =?utf-8?B?THUzbFQ4dUIzVndVaFFlTE9nTndVZ0IwSGxNMFpYT1dnVytzVTFQeHBaRGkr?=
 =?utf-8?B?QzlhSkc3TTNCZGZXOEZmTTdKUmNvSWpQS3dDWTlTNi9wNXJPZVd6eWdKTm1q?=
 =?utf-8?Q?Wg4nYaMCSXx9A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0lGS1o1ZnlzOXRhSmo4VVA3OHdGTWJVcmRSV1M4bU5kNk1kZ1J2Rm9ra242?=
 =?utf-8?B?MGpwMGR1a3FCbkY1N21mR2pKS0ltVlA1RlNlOERqdSs3Rlo4VEFLR2twOGdH?=
 =?utf-8?B?RVV0K2dEd0FROEE5cTlQOGZWZ282WVJKaG9vWlQ5ZytYNTU1NDN4N1pFblNF?=
 =?utf-8?B?VkJTRlBpU2ZHRzkvdUV4aTYxVTBwbzhUU0hyS2RKblUwTW94UU9JNXRPVm5Y?=
 =?utf-8?B?MmZCcVBlUGVudXFZT0lKQi92d2djS1pEb3RoQThmNmtVd2V3OFkrTE00WUZD?=
 =?utf-8?B?QXRNQkVkQlo1b3ZTYWVNS1ByTXFYWXNBRUFFYU42VXc1NzRnREhkbmRWUHQ1?=
 =?utf-8?B?TmdCaThIakR4RHlZN1NWVDZ4V0F4MWJUcFQ5NTFIRlZ2SEFSRGNZL2dGazBN?=
 =?utf-8?B?andrVUt3TGZFTDFxWC9ENHFmaElWdXVRZ2ppRVorMUVWQmhyb0xsSGpuUURF?=
 =?utf-8?B?eFhoWGhsNHNKR081QWdHN2hKZUtrMzI3dUlJQktJSXNEOEI0eWZmT0w3ODkz?=
 =?utf-8?B?SE12eVZDeG55bUhEZGZBbnNGUDFjZTBFQTZ0WXZNeVkyUThTazNIeklqbEhr?=
 =?utf-8?B?SzBJYkcxdGQzNXdmZ0JVUFFkUDJMVllzL2FvWFIwT1JIYk5TWG1IemdVWFBU?=
 =?utf-8?B?eGpxQSt4V0grVVlXaG1zWjQwVjU3KzI1N1c3SzVLeGpWdktpMUdQaXNyWHB3?=
 =?utf-8?B?VTBCWU50TmFZVGkrQnNDRzJyb2k4SVNZeS9GVTU0YithckpGR0VxanJsallT?=
 =?utf-8?B?ZTY2VE0yL05Gc0dKWGJJZFpvZVVUV0JtRmxTdmhZU0xLLzdReWxISUd5L1FX?=
 =?utf-8?B?WlBLVS93UVQ3UW11K1kwajFIQjk0SmtFRnZJZGhwRmhSeXJ2R0w1MUlHeGdF?=
 =?utf-8?B?Q3lPWnJUQU5kdkRQL3ViMlZIWTlLbHlrS2p3cVFjRUx3cmU2bWJPTTNsNXVU?=
 =?utf-8?B?bm01c3MvT29TbFpTenNQNDBwNjFBYjhhMlNUNENHVkVVY25VMHMyQWVGWFVS?=
 =?utf-8?B?OFBlSnpaY1o4RjhYaGJ6UDFaYXdId0RWd1lLYW10Z1hKQkdJaFBKU0hzNlZr?=
 =?utf-8?B?aTc2OVIzak9wYWl1cGo0WjBWbE1PRXJYOTA4Qm9VU2t2SkswaWFJc2lYa3Jh?=
 =?utf-8?B?cCtISWpnbUtxaHRKekpjalVUSXRnWDBYWXRvZ0dOZGJlb09tWndRelJCNllK?=
 =?utf-8?B?T1NLY3pFcHlqMTFyc29FTjhYaHQyc09ERlNKZ0dWWVVhcytJYU80c295ell4?=
 =?utf-8?B?VUxvMFR0YTJjRkdyNlJzQUlkbFV1blI5dStTMDc5ZTM2T21VWGpkWjI4ZVBn?=
 =?utf-8?B?cVdrSUl5N1N2NnRLNDFpTFUzQWdRT0JrenBCVkpyZU1kSk9MZ2toVFRkd0lY?=
 =?utf-8?B?eXpBTzN1V2huM0MxQXF4R2pjOUNiQVpaSklZaytHQjJ5UXB5ejFCak9DTC84?=
 =?utf-8?B?MFVHYjB4MlQvQkpYTSs1ZWVsSXU4RHUzSHB6N0g0ZXdLdXJBdmJhMUJTci8y?=
 =?utf-8?B?UTZvSXVpWHNKSjJCS0pLU2hTR3pOOWdnZ1RMZ0diTUlDZ0tIeThCcDh2TTJK?=
 =?utf-8?B?WUN1STgvam9pdkFCUldxWjAvbkhnalA4SnQ5c1FyWTZiRzlUMXdEeFlZd2RY?=
 =?utf-8?B?UFdpZUdQVkJLOC9JZFR4ZEJESDdUa244NFQxV1Y1NGlGajY4WUN5Y3FmUTJQ?=
 =?utf-8?B?QWlCeHU3WXZVd1NBbzEzSXhGdzhRMzU4bkY0UGVIVUFsUTliUXhZdm1FM2Q2?=
 =?utf-8?B?enNPZ1NVbGhINTJTUWMrVHR6TlcyOFFOZUFqc0VSM0pBbTFqclJUcVZnT1V6?=
 =?utf-8?B?WDhqL3hkbHVoSVhiaFpIRDlFQTNaejBWdmxZN3oySzA4ZkQ5cHVNbXdtOEh1?=
 =?utf-8?B?NTZab0Jma1pGdW9xMmV6ck1GbEZydjA2R0ZnSGxtSXNUUlFUdHlYVjc3MmV1?=
 =?utf-8?B?TSt1d0lBSUVHc0VLL3dkRlZ2d2QrRHpmcnNKTlcxcVZSanZITEFwcHV5Qm5I?=
 =?utf-8?B?aFN5MnppMStjZ0gxWHlsUFoyT0ZyTm1PanMvQmRDR256RjdIMndNcTJYV08w?=
 =?utf-8?B?NTF4TmtVYnJWTE4reTFhWnIvVG1yejNUZlplQmpyeGViS0VQNnpVS1V4ZHJ3?=
 =?utf-8?B?Q3ZkU0VEQjNpVnl6SjFJbXdwR2tNVXYzZ0JCbmFtMWNyYzVWZ2RVVGpYaXlp?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7421d910-c081-4e5e-6054-08dd614255b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:46:09.4134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cB2RObVKXp3mP0kHssbhWy90Tc5xBzZF7b/zkKah8G706/AzAh4OIIv8j5ks/07uDAVAeSdM51Q1uCek7UBvwg999RuBCTkA9kW43ojjonU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
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


On 1/8/2025 12:27 AM, Swati Sharma wrote:
> Add (big|ultra) joiner helper functions.

Need to mention what the helper functions will do.


>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc_helper.c | 46 ++++++++++++++++++++++++++++++++++++
>   tests/intel/kms_dsc_helper.h |  2 ++
>   2 files changed, 48 insertions(+)
>
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index cea4304e4..8543498a7 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -201,3 +201,49 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>   
>   	return true;
>   }
> +
> +bool check_bigjoiner_constraints(int disp_ver, int n_pipes, int drmfd, igt_output_t *output)

disp_ver is unused.


> +{
> +	if (!igt_is_bigjoiner_supported_by_source(drmfd))
> +		return false;
> +
> +	if (n_pipes < 2) {
Can use JOINED_PIPES_BIG_JOINER here instead of hard coding.
> +		igt_info("Bigjoiner requires minimum 2 pipes\n");
> +		return false;
> +	}
> +
> +	if (igt_get_dsc_sink_max_slice_count(drmfd, output->name) < 4) {
This can be again based on the above 2* JOINED_PIPES_BIG_JOINER with an 
explanation that for joiner, 2 slices per pipe is used.
> +		igt_info("Output %s doesn't support minimum 4 slice count\n", igt_output_name(output));
> +		return false;
> +	}
> +
> +	if (!igt_has_force_joiner_debugfs(drmfd, output->name)) {
> +		igt_info("Output %s doesn't support force_joiner debugfs\n", igt_output_name(output));
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +bool check_ultrajoiner_constraints(int disp_ver, int n_pipes, int drmfd, igt_output_t *output)
> +{
> +	if (!igt_is_ultrajoiner_supported_by_source(drmfd))
> +		return false;
> +
> +	if (n_pipes < 4) {
Can use JOINED_PIPES_ULTRA_JOINER here.
> +		igt_info("Ultrajoiner requires minimum 4 pipes\n");
> +		return false;
> +	}
> +
> +	if (igt_get_dsc_sink_max_slice_count(drmfd, output->name) < 8) {

Same as above.

I think there can be a common function something like:

static bool check_dsc_joiner_constraints(int num_pipes,  const char 
*joiner_type)

the min_pipes and min_dsc_slices can be derived based on joiner_type 
"Bigjoiner" or "Ultrajoiner"

and so on.

the helpers can call:

check_dsc_joiner_constraints(num_pipes,  "Bigjoiner");

or

check_dsc_joiner_constraints(num_pipes,  "Ultrajoiner");


> +		igt_info("Output %s doesn't support minimum 8 slice count\n", igt_output_name(output));
> +		return false;
> +	}
> +
> +	if (!igt_has_force_joiner_debugfs(drmfd, output->name)) {
> +		igt_info("Output %s doesn't support force_joiner debugfs\n", igt_output_name(output));
> +		return false;
> +	}
> +
> +	return true;
> +}
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
> index 4dbd88fe7..a24696640 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -38,5 +38,7 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
>   void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
>   void restore_force_dsc_fractional_bpp_en(void);
>   bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
> +bool check_bigjoiner_constraints(int disp_ver, int n_pipes, int drmfd, igt_output_t *output);
> +bool check_ultrajoiner_constraints(int disp_ver, int n_pipes, int drmfd, igt_output_t *output);

The names should have 'dsc' to signify that these are the constraints 
when dsc is required/forced.


Regards,

Ankit

>   
>   #endif
