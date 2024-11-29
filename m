Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E62BD70E16
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 04:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECA310E2A8;
	Fri, 29 Nov 2024 04:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMjkNTw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EF010E2A8
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732855740; x=1764391740;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sMQ3gNJ2Q2w6NnBlXwCL2lwN8MS9k6YefD1NgdJbwKo=;
 b=eMjkNTw11JGXopVJwSk2IZA7LwVnMhVQp2Ki/LCyfNGM1E3iWXyNQku9
 H9xbWwtD4bdl9z0kC3Nk3ikh6lvA8DiSl8zJ856OGMIySUofHwEdUt6Xx
 bpmoujk239FtS9u8o405fLgSsyZRxs9h/Eh3Hf0QTrDUTTiqX4yCNk+2Z
 10dIFz7OTdSf94mVco/qlq/Qy8G3GN1tUd9r3F8t/Of1HxRxC8lsJbCPv
 P6hOphxSGLYkcaMKEb2t/b2Z4l2PiH81VfDomF55X0SDgZc78mGcSqyjy
 tDn1BoP3e0q17sqbgIndGhI+280yvUimoN/ufmu2H2yj9oGCyz3Nql421 Q==;
X-CSE-ConnectionGUID: InrbAVjTR6GQbU6p1AxyWQ==
X-CSE-MsgGUID: ohLNUDYSRuimik8R5jnBzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20683815"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="20683815"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:48:59 -0800
X-CSE-ConnectionGUID: /iM4Y2BVTj2KJWOT7pFb+Q==
X-CSE-MsgGUID: L6OtrZe5RAGj616RC4mR+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="123350639"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 20:48:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 20:48:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 20:48:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 20:48:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHfX422PQ1M4qKefCG503sfytW6MxHR6MxNdHkwJtimtcBIq1SjNS6zRZy5QROlhvYiTd69c/LLDoNrVEbGMGiEp109Ld4D/qeaFsvzb3DlFsdi63e5AtrEL8AiuL5Pqpcer70Rk3EPwzaGy8lEnXbV+fAG7W/XXcGaHabgafLrBA5s91pGizq2fh23bAJlp0WMRv9MzoclKF8Cr4fwkTTdS/BSMXWPakhkIxl71+1+nD4eBSacApjdlgZ/vFUOtpvGtXtaaTXQLGEzK+6MhVN1kfAyhiab7B0nwUhRJdHnQld+MDjcRPoKDDC4oa+Hyl+lJAp4Y7IyndMJrZW9tXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv7toKvnP/SxR1khy8Paigl/k3EefhGx3IDu79vVcG0=;
 b=yX12bqoq2aOxTthFXnkzu4eIUn671YSBVp99LZtwer+3v23hWW1IhwSLxCJnemwFmH9l9kP6N3M9Rkcc8ACnInzcAcLBnVj9VaWrOPd9Pkv6VtCJGdxGwnLN8QkoJuvGSz4yy8HPfamA3j5EcwhdvJN6l3PfnvDsKU7P6fqtsURnoV8CDfgRNUUjL5wsuUtuq6CdDj5YqcoDXxUFzV/UPhxkHEITPyydxKzMMPPp8ZoeiGbbHMT/krrP5mqZVNuMOfXraPnpwIsKHMwa07KVkFNbIZvcZ5kxBHDqs2racjRyl+NUfcMbc/gjgnxEFdGGSSp6quPVb8dRaPCCj/nErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 04:48:55 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 04:48:54 +0000
Message-ID: <a6945dd1-34ce-4689-97d0-f655c1abeef3@intel.com>
Date: Fri, 29 Nov 2024 10:18:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] tests/kms_async_flips: subtests to validate async
 flips on atomic path
To: "Sharma, Swati2" <swati2.sharma@intel.com>, Santhosh Reddy Guddati
 <santhosh.reddy.guddati@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
 <20241121115451.2917187-2-santhosh.reddy.guddati@intel.com>
 <7ecb4fbf-c61f-41e4-9e76-e195b84d25d9@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <7ecb4fbf-c61f-41e4-9e76-e195b84d25d9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: d51583b1-fb2b-4e79-f828-08dd103120ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zlk2SHZrcHYxMVhUdVNuekRwYlJCWTZvMVJjYm1yVHBaVjRlcld6cEd4K3pi?=
 =?utf-8?B?MXBQY0dxQ09UUTlkNzJ6TGtUMkRpR29rUVJjWUNDZW9ydVJBWmN6dzVmdWJo?=
 =?utf-8?B?RGtEMFVKZ0RZeGd0Ujd0NHpWanZmL3dPbVE0a3N2MEQrK3cvK0drRkY3ZGha?=
 =?utf-8?B?cDhJYmxSbEVHYnN4eTl2bHFDbmFWN3ZzVnVyc1YzRGhVL0RUNEgxYlRONEZL?=
 =?utf-8?B?OGxsbXNhUEt2Yjl4YkZ3RnF0VTRtMGk4T2hUQUhlSFlZTW53aUdWbk9PNUxS?=
 =?utf-8?B?Mm9tb3kxdVFCMnloVXJSU3dZbG54T0ZBMDJnV0dnQThndWlORDVwS0RCK2gz?=
 =?utf-8?B?U1RycTYwV3hKbHZoc3RQSXU4YWs5dmY4cFpwRFYvaHBvSVpjalRWcUJ1eXQ5?=
 =?utf-8?B?RXYvS3NiS1BNRzBoK3krWCs2S05ZeklIcnNpN1hQSzdPSm85UENEZnNZMFNm?=
 =?utf-8?B?U0RUcWNCV0ZGZTd5Qit4SEF2am90VkFvS0VDZjB2R1hJam5oNnNEM21pU2wv?=
 =?utf-8?B?cjlLTGFwelFwSnJvTDl1elExdW9qbWw2SlN2eE5jdnVFYVRRRnEvdmlqMjE1?=
 =?utf-8?B?MXVLZXlxV1EzVUVhaERQNnZ3cUZQdk9HZ3NLa3Y0N2tUQ1hRcFdQd1RqK2Q4?=
 =?utf-8?B?STZFRjR0b1BKa3VseGwyM3VJZi9OQmJ1Z1VxeFFtSmJEKzFWbXR6Ujl0b0FV?=
 =?utf-8?B?bDRNVnl2VVhwVVU4cHZsd25CQnRkQnBHMVBSMll5Y3ZxL0RCbktBajdnNDFw?=
 =?utf-8?B?TDNiZlZsa2hCV1l6dXphVW1Pc21RYWxTdndkMUZqVXFPeEo3Z3Z5Z0tLOXdE?=
 =?utf-8?B?ZHlPOURoU0dETmd6cnNHQ0dRaDhKT0ZiUkhXY0t2aGNCWXV2OHRMSkdXOE1s?=
 =?utf-8?B?akpsNVNHV3grai85aGJLRGFUV3l5TWFiNEY0di9JL3I5VEVpb0p3T0VkSWhN?=
 =?utf-8?B?UlJCd2ZiVzM1R1RKMldDdkhVTmRWb3BydmU2aGJEZXBVV2RFdTJkaTF6dTZt?=
 =?utf-8?B?L09XVG1yby9Xc3c5Y3ptMm8ycXpCOTA1OFJaUXVUNjdtZDcyUUFBbHR0OGp2?=
 =?utf-8?B?bTJ3NDY5eFBPalhMamllUUtlRFh1QjB2OW5jZ0hZaVB0MXJjR1R6WVA1U25C?=
 =?utf-8?B?MnZoV20xMTUwdk9DR2RkclRuanYzRDlGeFNmcUpTRW0yaC8rVC9RRmc1M1JH?=
 =?utf-8?B?VnlMQUJqamdOMnZJa2FNU1o4bStlMXYrWEpnMkxNMm9XZzMva2MxSGxxQ0Vk?=
 =?utf-8?B?UHJOdHFvVElrODlzUUlVL0grbVlZbklWZ3NYKzJ0NUZjRFU3M0dOaEpzK1NY?=
 =?utf-8?B?U1pZUHBwbUw1M3VGWUUwUENZZG56ejlwczYrMHIzbkI3NEN5SGVkSlVPV3lj?=
 =?utf-8?B?ZFA1STdLall6Zmx0NmVZeEhZZkJvZGl4RTI4eHVCTDVWNEJjQzFkYXJlMXgv?=
 =?utf-8?B?VFBoSStXL29ZWkRuNHBqa0VzUHViVVJLMXJIeUlBQXNqRzQzVkNlcURBS2xM?=
 =?utf-8?B?ZUJheFU0clBhVWJKT3FlYnlSQkZBOHRraW96YWtLaFhWelFqK1JWb0hlRDhi?=
 =?utf-8?B?M3p6LzNzM0loTFpIM3lUV2c1NWQrV3hncVFYZnJodUR5Y0FhK3VkTGc0cU1Z?=
 =?utf-8?B?M1o4WjdSbndOeTB5ZzcwUmlQTElSMVBKSmhzQ2ticyt0elNydXNCa1RXa3o2?=
 =?utf-8?B?d0JiZ0Zya2JkNlMwR0FUSGV5MXI5dUlUNzNidUpzZ1VyMk5ZcDdTL0dYaGtX?=
 =?utf-8?B?RkQ3cUhMNE1xbXNkcWp4ZTFwQ29CenFoblhpNE40ejdNQ2ViSFBYR0ZjQSt3?=
 =?utf-8?B?dHlqYk5oUGNERjlHK3hKZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bElaaDRnMmJDbmM3K1RuRTJORU9zYlJoT3ZsTXpnTFB5K1BjclptNlFhV0RX?=
 =?utf-8?B?MFVHcGVHTUtseFJ6VUFLMjVHeC9aaWU4SVByelZMMkR6L2RiVnVLYmN5bXUw?=
 =?utf-8?B?Ukt6Qnl5N2ZXU2NuN003YXBqM3FXVnIvS2drZWR3TktDM2R3MkJOWFBFNkY3?=
 =?utf-8?B?L2psV0lKK1F4bTgyMjIvVW9jYlRIZEVyVU1FM3dTZDEzQnpiUENKL3NhNmk1?=
 =?utf-8?B?bVRsVkw4RjhOV3lYT0ZuQ1VGRXdUb3Y1dWZDNmZNQzMwWmJEc3Y1eWRvTHJL?=
 =?utf-8?B?YS9TdGQrbzJpdHVqME45UHlVeUNpT2xGYnZYYndzNEVtejFaVGgydkl4ZUZu?=
 =?utf-8?B?OGdIMlR0enkwcmMvMjZnYUZWbkNhTkE0VTBrNkJXakdzYXNQSUdQNzFhdG03?=
 =?utf-8?B?dGdibTFqdVV0N0dwcGQwOTN4dWxFaFp1b3FENVVhVjVqamUzOVBkS3BzSzE5?=
 =?utf-8?B?UGRKaXdtUlFlbkFBVXQxSmdxYmFsZCtpYm9Pb1VDeit3bDNhQXZ2bDJYZFBN?=
 =?utf-8?B?QXpZb2wzcXhoTW5WZWNsOXZwdzF5dk5IcGQzeERxKzE2SlJYK1hnYmpQMmRD?=
 =?utf-8?B?STROc3d2NEljME1rYWZLVUcyVEdEd3dDM1ZtMloyd25mTkllZDRzanFTazBp?=
 =?utf-8?B?WDhha0Jmci92R2ZGUzRhZ3Y2dnJRRHE3UDBUeGlLMy9uYnE2L0NSWFMzS2Qv?=
 =?utf-8?B?UWJJMUFsTzI4dUp5cUlIYVV4Rkc1eHRoK0NaMUkyWVBiRDU1VGtOL05ubG5n?=
 =?utf-8?B?aHFOamlkNnV4TVhuV2kwQ28zMDc2SVN5aHVXd2h5dWhjNDZWTkJKUkMwalZX?=
 =?utf-8?B?c0J0Q0NBa3R6WFBKenNYNmFYUnBUeHlHeDZmRC9iV2Foa0E3VUFCcGJmelgv?=
 =?utf-8?B?bk5SdEJidm94YkN3WitQaDZyTzNmK09TbC8zS25lQVhwU0NvQVB2a0Jzc3Iw?=
 =?utf-8?B?d25HT3pPTEdJbG1TV0daT1huTy9oTGFzeWcycVJMay8zRkRmdHlSa29IUDhP?=
 =?utf-8?B?OExSUU4wZ3FSUTdXY1o5T3NYVzdhL0R5eHpwSXBxMkpHMHZ2enhSZTJEWFVP?=
 =?utf-8?B?UHI2V1V1dEVWZ2Jad3J6QlZuMFpLbnNCM2dYdzF1STQ4UDNhUGlDcHd6eEp6?=
 =?utf-8?B?UDlPSTlabWZnam1HNkRKc2lMc0NVNFh4ZnBlblpzQktPTnNxbHZUakNtK0wv?=
 =?utf-8?B?RjNJek8yeHM4Y25MZzRCQ3R0NnV3WHlOUWhpR0I4dzhuTU9DRDA5aTVPQUZh?=
 =?utf-8?B?N28xRDlhb0oxSVhUay9MYnlGOHYwMTdLWXNBSDl0R0ZGd2VIN1gwa0pLSW1k?=
 =?utf-8?B?S2lMd1BVZzdZSWFTaHB1YTNyN0NhUXBjUjBMb21ZSnYxMldqNzVyU1NWM0ZL?=
 =?utf-8?B?S0hVbDFiOGxqM1BHRzVuUWJOc05ONS9rUmg0RURvNHdFc1BpR0x1WHZPa0ZR?=
 =?utf-8?B?QWNJSG4rT2ZpOGRoRWJKQ0JrN29ZM1hvRFhzRWlpNTltRGxNN2dhYWJ2NEMr?=
 =?utf-8?B?d20vMmxteGl5OFVzMFVSM0dxUytJSzgzQTY3Q3lyL1p1OUVaZmt6S2RIZzh0?=
 =?utf-8?B?RTVQbHY0OXQ4UFZHdkRHWnhLcDN2dkRySE9jMDIxUEVEcFpYLzBzNnp4L1Vx?=
 =?utf-8?B?RTcxRjB2cnYvSU93NXVaMTVlWjFwSW0wV25QTGVOTlk5MVFTWWFISVZ5Q1ph?=
 =?utf-8?B?dDNwZ3c4STV6SzBrQ0Z0cWFEYjFpVDlxUlkrUHBXaDdod2pDTEJ6YU9HQ1RI?=
 =?utf-8?B?Q21lenlaNEdiU3o5aW1JTzNKc2IxdHlqVE5OVVZabUVLbXhuamtrVkhCOHhl?=
 =?utf-8?B?MFpuVEt1Q0Z4R1c3RjJIOFJQY1BGNVBpQ1VISVNFMWZyNGNndEFodmpyWUNB?=
 =?utf-8?B?WkNYbm56SG12UHhOK2Rvc2gweDdmZE5Ub1dWUVBFUWJkbEpoTjBRcWVMUTgv?=
 =?utf-8?B?bXpsbnVrSXI5SXVIZHUrdDk4UmJibzJ5dnJuUHo2c25LYjdDYVpZSUM1em1Y?=
 =?utf-8?B?SWtCeWJzTDUwaFVaazR4aWlsS21DS0VlcDJlZTJMc1h5T200SlA5TlhBOUNr?=
 =?utf-8?B?OU5TUEhEa3dnU3k0dHVFT2h1SDJ4cjFrSllWaG5OdVVXUmlLenB2d2xqM2FB?=
 =?utf-8?Q?Y35ZtewULYM2QhlfvoG2S46+j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d51583b1-fb2b-4e79-f828-08dd103120ac
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 04:48:54.8290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Eau2EC7IYDD+uGEecxH0Q6VpVkcnxubhmMTIMth5yRJlc4u18hS6mFzHcl0XMJoz8RqV3VifSXOqMYVsAfz9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

Hi Santhosh,

On 11/21/2024 10:59 PM, Sharma, Swati2 wrote:
> Hi Santosh,
>
> Please fix the subject.Subject should be in imperative mood.
>
> Something like "Add subtests to validate async flips on atomic path"

Agree on this comment. With this fixed,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> On 21-11-2024 05:24 pm, Santhosh Reddy Guddati wrote:
>> subtest to validate async flips with atomic commit
>>
>> v2: refactor repeated code to function (Karthik).
>> explicitly set atomic_path to false in legacy tests (Karthik).
>>
>> v3: fix test_crc and test_invalid subtests.
>>
>> v4: Add note for invalid_test for not using perform_flip (Karthik).
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 173 ++++++++++++++++++++++++++++++++++------
>>   1 file changed, 147 insertions(+), 26 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index 5dec71291..6e00be3de 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -67,6 +67,26 @@
>>    * SUBTEST: invalid-async-flip
>>    * Description: Negative case to verify if changes in fb are 
>> rejected from kernel as expected
>>    *
>> + * SUBTEST: alternate-sync-async-flip-atomic
>> + * Description: Verify the async flip functionality and the fps 
>> during async flips using atomic path
>> + *
>> + * SUBTEST: async-flip-with-page-flip-events-atomic
>> + * Description: Wait for page flip events in between successive 
>> asynchronous flips using atomic path
>> + *
>> + * SUBTEST: test-time-stamp-atomic
>> + * Description: Verify that the async flip timestamp does not 
>> coincide with either previous
>> + *              or next vblank when async flip is done using atomic 
>> path
>> + *
>> + * SUBTEST: test-cursor-atomic
>> + * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after 
>> async flip with atomic commit
>> + *
>> + * SUBTEST: invalid-async-flip-atomic
>> + * Description: Negative case to verify if changes in fb are 
>> rejected from kernel
>> + *              as expected when async flip is done using atomic path
>> + *
>> + * SUBTEST: crc-atomic
>> + * Description: Use CRC to verify async flip scans out the correct 
>> framebuffer with atomic commit
>> + *
>>    * SUBTEST: async-flip-suspend-resume
>>    * Description: Verify the async flip functionality with suspend 
>> and resume cycle
>>    */
>> @@ -105,6 +125,7 @@ typedef struct {
>>       bool suspend_resume;
>>       bool allow_fail;
>>       struct buf_ops *bops;
>> +    bool atomic_path;
>>   } data_t;
>>     static void flip_handler(int fd_, unsigned int sequence, unsigned 
>> int tv_sec,
>> @@ -259,6 +280,21 @@ static bool async_flip_needs_extra_frame(data_t 
>> *data)
>>       return intel_display_ver(devid) >= 9 || IS_BROADWELL(devid);
>>   }
>>   +static int perform_flip(data_t *data, int frame, int flags)
>> +{
>> +    int ret;
>> +
>> +    if (!data->atomic_path) {
>> +        ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> +                      data->bufs[frame % NUM_FBS].fb_id, flags, data);
>> +    } else {
>> +        igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
>> +        ret = igt_display_try_commit_atomic(&data->display, flags, 
>> data);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   static void test_async_flip(data_t *data)
>>   {
>>       int ret, frame;
>> @@ -276,9 +312,7 @@ static void test_async_flip(data_t *data)
>>           if (data->alternate_sync_async) {
>>               flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
>>   -            ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -                          data->bufs[frame % NUM_FBS].fb_id,
>> -                          flags, data);
>> +            ret = perform_flip(data, frame, flags);
>>                 igt_assert_eq(ret, 0);
>>   @@ -287,19 +321,16 @@ static void test_async_flip(data_t *data)
>>               flags |= DRM_MODE_PAGE_FLIP_ASYNC;
>>                 if (async_flip_needs_extra_frame(data)) {
>> -                ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -                              data->bufs[frame % NUM_FBS].fb_id,
>> -                              flags, data);
>>   +                ret = perform_flip(data, frame, flags);
>>                   igt_assert_eq(ret, 0);
>>                     wait_flip_event(data);
>>               }
>>           }
>>   -        ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -                      data->bufs[frame % NUM_FBS].fb_id,
>> -                      flags, data);
>> +        ret = perform_flip(data, frame, flags);
>> +
>>           if (frame == 1 && data->allow_fail)
>>               igt_skip_on(ret == -EINVAL);
>>           else
>> @@ -428,9 +459,7 @@ static void test_cursor(data_t *data)
>>         do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);
>>   -    ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -                  data->bufs[0].fb_id,
>> -                  flags, data);
>> +    ret = perform_flip(data, 0, flags);
>>         igt_assert_eq(ret, 0);
>>   @@ -450,6 +479,7 @@ static void test_invalid(data_t *data)
>>       int ret, width, height;
>>       struct igt_fb fb[2];
>>       drmModeModeInfo *mode;
>> +    int flags;
>>         igt_display_commit2(&data->display, data->display.is_atomic ? 
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>   @@ -457,6 +487,8 @@ static void test_invalid(data_t *data)
>>       width = mode->hdisplay;
>>       height = mode->vdisplay;
>>   +    flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
>> +
>>       igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>>                 I915_FORMAT_MOD_X_TILED, &fb[0]);
>>       igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> @@ -465,16 +497,30 @@ static void test_invalid(data_t *data)
>>       igt_plane_set_fb(data->plane, &fb[0]);
>>       igt_display_commit2(&data->display, data->display.is_atomic ? 
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>   -    /* first async flip is expected to allow modifier changes */
>> -    ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
>> -                  DRM_MODE_PAGE_FLIP_ASYNC | 
>> DRM_MODE_PAGE_FLIP_EVENT, data);
>> -    igt_assert_eq(ret, 0);
>> -    wait_flip_event(data);
>> +    /* Note: Not using perform_flips here as this subtest passes
>> +     * the fb_id parameter differently.
>> +     */
>> +    if (!data->atomic_path) {
>> +        /* first async flip is expected to allow modifier changes */
>> +        ret = drmModePageFlip(data->drm_fd, data->crtc_id, 
>> fb[1].fb_id, flags, data);
>> +        igt_assert_eq(ret, 0);
>>   -    /* subsequent async flips should reject modifier changes */
>> -    ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
>> -                  DRM_MODE_PAGE_FLIP_ASYNC | 
>> DRM_MODE_PAGE_FLIP_EVENT, data);
>> -    igt_assert(ret == -EINVAL);
>> +        wait_flip_event(data);
>> +
>> +        /* subsequent async flips should reject modifier changes */
>> +        ret = drmModePageFlip(data->drm_fd, data->crtc_id, 
>> fb[0].fb_id, flags, data);
>> +        igt_assert(ret == -EINVAL);
>> +    } else {
>> +        igt_plane_set_fb(data->plane, &fb[1]);
>> +        ret = igt_display_try_commit_atomic(&data->display, flags, 
>> data);
>> +        igt_assert_eq(ret, 0);
>> +
>> +        wait_flip_event(data);
>> +
>> +        igt_plane_set_fb(data->plane, &fb[0]);
>> +        ret = igt_display_try_commit_atomic(&data->display, flags, 
>> data);
>> +        igt_assert(ret == -EINVAL);
>> +    }
>>         /* TODO: Add verification for changes in stride, pixel format */
>>   @@ -588,6 +634,8 @@ static void test_crc(data_t *data)
>>       int ret, width, height;
>>       drmModeModeInfoPtr mode;
>>   +    igt_display_commit2(&data->display, data->display.is_atomic ? 
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>> +
>>       /* make things faster by using a smallish mode */
>>       mode = &data->output->config.connector->modes[0];
>>       width = mode->hdisplay;
>> @@ -620,8 +668,9 @@ static void test_crc(data_t *data)
>>           paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
>>             data->flip_pending = true;
>> -        ret = drmModePageFlip(data->drm_fd, data->crtc_id, 
>> data->bufs[frame].fb_id,
>> -                      DRM_MODE_PAGE_FLIP_ASYNC | 
>> DRM_MODE_PAGE_FLIP_EVENT, data);
>> +
>> +        ret = perform_flip(data, frame, DRM_MODE_PAGE_FLIP_ASYNC |
>> +                   DRM_MODE_PAGE_FLIP_EVENT);
>>           igt_assert_eq(ret, 0);
>>             wait_events_crc(data);
>> @@ -708,6 +757,18 @@ igt_main
>>           igt_describe("Wait for page flip events in between 
>> successive asynchronous flips");
>> igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>>               data.alternate_sync_async = false;
>> +            data.atomic_path = false;
>> +            if (is_intel_device(data.drm_fd))
>> +                run_test_with_modifiers(&data, test_async_flip);
>> +            else
>> +                run_test(&data, test_async_flip);
>> +        }
>> +
>> +        igt_describe("Wait for page flip events in between successive "
>> +                 "asynchronous flips using atomic path");
>> + igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>> +            data.alternate_sync_async = false;
>> +            data.atomic_path = true;
>>               if (is_intel_device(data.drm_fd))
>>                   run_test_with_modifiers(&data, test_async_flip);
>>               else
>> @@ -717,12 +778,30 @@ igt_main
>>           igt_describe("Alternate between sync and async flips");
>>           igt_subtest_with_dynamic("alternate-sync-async-flip") {
>>               data.alternate_sync_async = true;
>> +            data.atomic_path = false;
>> +            run_test(&data, test_async_flip);
>> +        }
>> +
>> +        igt_describe("Alternate between sync and async flips using 
>> atomic path");
>> + igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
>> +            data.alternate_sync_async = true;
>> +            data.atomic_path = true;
>>               run_test(&data, test_async_flip);
>>           }
>>   -        igt_describe("Verify that the async flip timestamp does 
>> not coincide with either previous or next vblank");
>> -        igt_subtest_with_dynamic("test-time-stamp")
>> +        igt_describe("Verify that the async flip timestamp does not "
>> +                 "coincide with either previous or next vblank");
>> +        igt_subtest_with_dynamic("test-time-stamp") {
>> +            data.atomic_path = false;
>>               run_test(&data, test_timestamp);
>> +        }
>> +
>> +        igt_describe("Verify that the async flip timestamp does not 
>> coincide "
>> +                 "with either previous or next vblank with atomic 
>> path");
>> +        igt_subtest_with_dynamic("test-time-stamp-atomic") {
>> +            data.atomic_path = true;
>> +            run_test(&data, test_timestamp);
>> +        }
>>       }
>>         igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes 
>> after async flip");
>> @@ -733,9 +812,25 @@ igt_main
>>            * supported in cursor plane.
>>            */
>> igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
>> -                  "PSR2 sel fetch causes cursor to be added to 
>> primary plane " \
>> +                  "PSR2 sel fetch causes cursor to be added to 
>> primary plane "
>>                     "pages flips and async flip is not supported in 
>> cursor\n");
>>   +        data.atomic_path = false;
>> +        run_test(&data, test_cursor);
>> +    }
>> +
>> +    igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after "
>> +             "async flip with atomic commit");
>> +    igt_subtest_with_dynamic("test-cursor-atomic") {
>> +        /*
>> +         * Intel's PSR2 selective fetch adds other planes to state when
>> +         * necessary, causing the async flip to fail because async 
>> flip is not
>> +         * supported in cursor plane.
>> +         */
>> + igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
>> +                  "PSR2 sel fetch causes cursor to be added to 
>> primary plane "
>> +                  "pages flips and async flip is not supported in 
>> cursor\n");
>> +        data.atomic_path = true;
>>           run_test(&data, test_cursor);
>>       }
>>   @@ -748,6 +843,21 @@ igt_main
>> igt_require(igt_display_has_format_mod(&data.display, 
>> DRM_FORMAT_XRGB8888,
>>                                  I915_FORMAT_MOD_Y_TILED));
>>   +        data.atomic_path = false;
>> +        run_test(&data, test_invalid);
>> +    }
>> +
>> +    igt_describe("Negative case to verify if changes in fb are 
>> rejected "
>> +             "from kernel as expected when async flip is done using 
>> atomic path");
>> +    igt_subtest_with_dynamic("invalid-async-flip-atomic") {
>> +        data.atomic_path = true;
>> +        /* TODO: support more vendors */
>> +        igt_require(is_intel_device(data.drm_fd));
>> + igt_require(igt_display_has_format_mod(&data.display, 
>> DRM_FORMAT_XRGB8888,
>> +                               I915_FORMAT_MOD_X_TILED));
>> + igt_require(igt_display_has_format_mod(&data.display, 
>> DRM_FORMAT_XRGB8888,
>> +                               I915_FORMAT_MOD_Y_TILED));
>> +
>>           run_test(&data, test_invalid);
>>       }
>>   @@ -756,6 +866,17 @@ igt_main
>>           /* Devices without CRC can't run this test */
>>           igt_require_pipe_crc(data.drm_fd);
>>   +        data.atomic_path = false;
>> +        run_test(&data, test_crc);
>> +    }
>> +
>> +    igt_describe("Use CRC to verify async flip scans out the correct 
>> framebuffer "
>> +             "with atomic commit");
>> +    igt_subtest_with_dynamic("crc-atomic") {
>> +        /* Devices without CRC can't run this test */
>> +        igt_require_pipe_crc(data.drm_fd);
>> +
>> +        data.atomic_path = true;
>>           run_test(&data, test_crc);
>>       }
