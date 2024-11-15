Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAA2D6DDEC
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 08:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF45A10E1BD;
	Fri, 15 Nov 2024 08:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cxs9zW1R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C299010E1BD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731660374; x=1763196374;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3c2dAU9kxxLuBqX9kILKtuXzJZId6Enxs16eENKZUWM=;
 b=Cxs9zW1RhlztQjThyft6eArS0eQWo9Cfc41UkoruTCs9J4yu1OHubEQ7
 FlBArtJK9kW2We/AZI+0y+k8XgEyG2BwRLiKqGaXMEOMdIxAfTofpdwzM
 zo8ipOFAWzKXME7DgRPRvuWukFIQVrhyYdj3/0vQyYznd3we2CIZpOaeB
 vpijpotQ/aSocjGNT+9FcUAEAgqGlcty6NXp7GZdX0yQ2s22vr7ePCYhv
 Xaw50wxVo/F9t5NtHgxasu8pAZSt7UsB3QCEUSlwD3tz6RhULu0IIozb2
 MytRT5GUc3aqIRYD0PPEh53NPKLPsfWh+SjXPkhGmcQzCTDRD82Ooe51v w==;
X-CSE-ConnectionGUID: kj2/Z9KrSe6ogvYkqRHEOg==
X-CSE-MsgGUID: 7sgj4vMgTs2ThW4waqGAVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="43062214"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="43062214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 00:46:14 -0800
X-CSE-ConnectionGUID: 9vLrQzFfQc6rih3ZQcE3MA==
X-CSE-MsgGUID: oPxYpaSBRlutUb1bZe3FIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="89256600"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 00:46:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 00:46:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 00:46:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 00:46:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ngu5AqAAp3Nn4KpJkfbEtwvlF+Ftqz4zBxce34+EVRDlzlOVjUUh9MTDIvpMnoVdYTt2zTpu4FqZftxLrQm9bly2q9baJuTL6HrLx1FX0G+TIOsov0Jg6nLzBqRKykWZ1UF1l2tYxwXGoz52zV/6fU2VpVhkrr4fV0yIpiFx9E1WFnwxsBte/IzQcoOwRFHq192Smt00sQPq6WOA/pp0ToZDTzlR/Ki0Jm/rLW4DTDxnS3DH0mJkbcQJcF1JzSmRMImjMsNz+/i3lNcm/93cfajwNkiXLZyO9Qu5QGOKeI5BVn+qPwvw7kqLA3BIe25jB87o+Nrln2ktYNMW/q1Yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F04NH6siimocPUhZbZgg808jxZ6YdasURkUcQNJW+Yo=;
 b=fAqhFt80aWC2kaM0BXpRV+BQrysdHW9UdafM9EoZHraaiPTc1Oryv0/UtRSTPPN1Pf6a42kiVDPaDbneG0bL7q/oyMwqq8Zk9xVrwu2efsOrylfSKKuIDpUVhIA7k9PFrBty3f6ulpqXO3s3qkh4wXcAHJqy4z4mdc6Jlw7ghcda2TVxA2/Ef4HvjBCXBv4NU7XHtawVCUfOGkAJTUMdFJpf3x5Q1Xp6dGzx7XnPWx0XpAEjTy8K0TH2+SDBHV+pD+3PZ0U2423u47hRM7CnZEHtIDoF4wIsge7/7VyYd4993Gj/cyT/IOo2PhkFQEoljI6+aotkj72crCpSNQkWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 08:46:08 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 08:46:08 +0000
Message-ID: <23b82425-281d-4ff5-b49f-165d1f10ecdb@intel.com>
Date: Fri, 15 Nov 2024 14:16:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/9] PTL: lib/intel_chipset: add pantherlake
 definition and support
To: Clint Taylor <clinton.a.taylor@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-2-clinton.a.taylor@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241114190339.3885752-2-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PEPF000067F9.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::30) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SJ2PR11MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbe39c5-f656-4643-6add-08dd0551f2b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWlrS3ZFak1xeDRXdjhCbG9vRDVPZXg0ZWw3VEZLL2RsRllWQXpyZFluMWQy?=
 =?utf-8?B?bWJnY0UyTi9kL3VBZGJ4R1FIMzlISkIyZXVzSnMyQnA0em9UM25JaHl1VnVa?=
 =?utf-8?B?eUR2NWdjVHFWbHUxZ1E2QlllZHpPcUQwemhvL3Q5VEJja2tMaGdXSU5UWXhx?=
 =?utf-8?B?UElOd0JxT000R0JEYjdXN0pLdjdjK0ZnNmFVMmFlR0tEMGhGVlc0YWZEMFJP?=
 =?utf-8?B?bTdHREVqaVJPVmM2dlhsMVFVSVlRNDd4ZzZOQ0N6RDU2RHZGdlJQZnZxTTNr?=
 =?utf-8?B?bnpRMWEzalpYdThZQTkxSjdySkhmRGpjYTdUanA0WWd6ZklxcnRKQjNmUXRF?=
 =?utf-8?B?dDE0a2RwOFJjZEVCbWZRdVRoWlhDQjE2U1Eralh2aDhWdUczNUZCbmxZQk1l?=
 =?utf-8?B?NHM1L3BFZ0FFbVpxOHh5NUo5dnlEN0prbHRnRTA2K3lQOHkzNThaQW10N21x?=
 =?utf-8?B?Q09jZ1hBU2NKb0t2S0tOSlR5Ujk1emVxQys3dW9mMmZlNkVSUy9IK0dEM1RH?=
 =?utf-8?B?WC8xYkVEQXBQOFYyN25nRXZOTElsUTllUllpblFnTTZneEF1Sk1ZQ2RVbVVh?=
 =?utf-8?B?NFY4ODVnTnBlU1RTdkxrTXEraWUwckp6MTJ5UDlqUndXTzBrOEFuMFBLRTFu?=
 =?utf-8?B?MXUxb1Y2cW1JVHl6SVA2ZkZaN0NWcitKUDhoVDZSVDFZeDhPY2h0cXZ2Rk13?=
 =?utf-8?B?TDVuckxjdkZVc1k5QlZiS1dOZmtaSWlDVHRrNGtxV3dtWjVGNjBSNTdrbGJS?=
 =?utf-8?B?Tms0WjN6eTdyb21LYzloakt4cUM1dm5wcXdFZlR5ZGo2aUZ4eDdPb2hrV2Jw?=
 =?utf-8?B?VmVpZ3daQUR6cFVlWVVQZUgyNUNIVjVwUlRhZ2tWZUFZUGQvZzI3SlJqdk9Z?=
 =?utf-8?B?Q2xBZEdHckxNUkZnNGg4RVhRUDlRTVdDSEQvZTJuaDNqSkpxQ0hnTDg1K0NJ?=
 =?utf-8?B?NFowaFN4bnVWNU15MDduS3Faa2hYK2FtTm9CY2RXZ01qaUhFOXhGVjV6UlhB?=
 =?utf-8?B?bEFwR0dUM2o2VERLQ1NRWW5NeEE5TVNOcUZ2N3dPRGlsaDVkZ1Ruc1RvMWxw?=
 =?utf-8?B?bkt0QXNrUFlGRVlLTFpGYzdrNFoxMDd2RGREQUo4cDBJZ1MzTlJ4d1FCcXp5?=
 =?utf-8?B?WU1taFpFNjhUdEVEUlljRVVlbFM2dFZJcmQxb3pLN3h6NkFKRmV3RSthSjZD?=
 =?utf-8?B?d2MwYWxCSVp3ZjlMaUxoS3A1TFVGNVZNdXRWSmpyYWhaME9vZ2V1Y0lQSjcx?=
 =?utf-8?B?TlFxNEtYNWlTQmFZUTNkdXBzL0Q5UWlpSlVZM1dFNUtVY2p0bDFTMzhDTmx4?=
 =?utf-8?B?R1ZYNTFVQ0ppbGh3cjR6Q2dXcktITEdMdXZtYkxFNEhheUloTTVqclZkQ004?=
 =?utf-8?B?K2dMZmQvVktPL3FjcTZGK0ljVWU4UGNrQjIrY1ZmM1A2M0I4T1YzVWUzT2FT?=
 =?utf-8?B?KzRMN1FBNEtDeTRtMkxQNm9IbVEwb2ZiaVJDeDNTSTR0dDVqQmIvZWFPakRq?=
 =?utf-8?B?alc3c3lINHhBcUZLQUMwRmE3aUdPUTAxbWRucnE1Q2IzNlNJNmpYb0lCOWlY?=
 =?utf-8?B?OGR5MVdUQ3lpRlEzU0lPQk5qVldNUSt4Wnp3bHpicUE5U28yS3pJeHNEaGpO?=
 =?utf-8?B?Y3RiVGNSSEtrUzY0ekQ1TmRpeTNyU25kb1VPbUp1WkRBdDlUQU1NcGZoaUNi?=
 =?utf-8?B?dWVMZy9PWGhJdXlnUm1FcUtqUjFYZmVoS3pIL3VSenVYRngzdGEyTGE0NVE0?=
 =?utf-8?Q?auYZNXN1qtqEljD3bLMC3NlxgdJrXPqofAPizFi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1JPYlVuQlMvMitnNEFkUldKVjk5TDl1dGFwRDhqYjhjTkEyT200R09zVHRo?=
 =?utf-8?B?MnBXb3AzZnNsTkd5bkQxdDRXSUpadnVYdGNlRHhPdnA5MjVySG5YZGQ0TUhN?=
 =?utf-8?B?M2loVHpYZXlZeDdtSjFzNDk4TEYrVmJkWVUzSlIra1B4Q29OeHpqUGovUUZY?=
 =?utf-8?B?YVo2clJLSEFpSnl1Y0R5blo5ZFFpWjJERUJSbDRIdDgvTWFaemJTZS9OS2RP?=
 =?utf-8?B?c1BxOXFUSG5nSTNaNkxpN2xoYTJjOFJZSVZtby80ZDdXRjVHSUxabldLYmNY?=
 =?utf-8?B?MHhzKzdVTFd3TSs4ZC9vT0tDRnlDOTlxUE5vUjBFSi9KczFrT1VCR0FmWXZz?=
 =?utf-8?B?dEcrUllhdDYrTnM0aEZqYXEzSEtoVyswMG1heUN6MFNEU3RLUGU2Q09GL1M3?=
 =?utf-8?B?TDdadzMyTkRYTnYyOGREdkJvSmFoUkZGQi81M2IwOWhCV0JZOEp6OEhoa3c4?=
 =?utf-8?B?UUlkaHlXdjloVzl2eUE1cW1sWXI3L2FzWW43ZEs2MXh1SVJpWGhVMFRjRzMv?=
 =?utf-8?B?Qk1ZTEFSekgrRStQUDc5Vm1MdTRKT2V2MlRyYVB6am80U3hNd3VwbE1TbWc5?=
 =?utf-8?B?NXI0UDF4YVZBenhORkNQK0ZLT0ZpbUh5a1BNc1ZPK0JnVTAzNG9yWld1Rkl0?=
 =?utf-8?B?bXJFYjlPNkMyYW9pWEVHNElFd0U4RERTMjArRUlESkVWV0RmNFBGdVI2MU1P?=
 =?utf-8?B?RVp6eUxPUlFDcFYwMThzdDFpVzhBSkpjTkVNZ29rcG1sOVVMRlFSQjNFK1J2?=
 =?utf-8?B?c2UxSlhJSGxDeUU1cnVGU0VGWEVuS0RvT0pFaDYxRkxOd1lNWk1odUk3bzJW?=
 =?utf-8?B?ZVkvN3p4bW55N0tQTXQ5TEoyanFwQkdIOFBwR1ZkR1pkL0laMWxkQmxxOUtN?=
 =?utf-8?B?dEM2bTdIalpxdXlrOFFCaWI2dU51Z2d1NkxrSEdrOXBwVTF6WGdqSkpmanY0?=
 =?utf-8?B?Wno4MlBicU9OUGdMMFZxa1krWm5FOFYwTUoybkdqUTYyamdJOFl3WFVZdjdS?=
 =?utf-8?B?eERzb29MbVM5cVNyaU05TnZmWUZPdWhKUlNiZDlqQXE1MUxBd1A3RTNFWmEx?=
 =?utf-8?B?SjNoelhLNnlLWjVIQ3cxSUk5UFhpWEJ3U3YzUDBhdjZVZ2QyTWpud296Y0N4?=
 =?utf-8?B?NWxuNFQzaVBFR2w1R2IxZFJwSE91Sll0Wk1DN3FEL21JdTNjUVhwa3A2dVBO?=
 =?utf-8?B?UExOSjFEZXVTeWc0eXZOc1daTGFZTjhXZzh5V3lGMGxXTTlwWHg3V1M1VUVM?=
 =?utf-8?B?VFFGVGdNemNXTFpFaGp3K24rajY1Z01XcTZGc1FraG9ic1dqc3FVb2pnRnFy?=
 =?utf-8?B?ZS80QkhKNmd5TUJUVW12cmRWeStuL0hWNmc2YjlqUTkzcmRzaWxkNkVoR3RY?=
 =?utf-8?B?YWVpNUdRczhEeVV2ZjlNVHRscGxORGtnZnpzOTR2UDlYOGdwYW5KMHF0UjV3?=
 =?utf-8?B?VkdOQXA0Y0dPckxlakF2Q290STYwUGVOUEFyZkpmU1hGZnRkZTFPck81bkQ1?=
 =?utf-8?B?bXJBVFcyYkRXMm1aMER2NFAxalZxMFBtNFowTGhPU3J0bkZBdTF3b25EeVdY?=
 =?utf-8?B?VXYwYXo4Q3l2d1R6S3A5Z0JBcDVVN2pMK0taRWlDdllzRSsreXZtVGxwS21t?=
 =?utf-8?B?WmtnM3N1ZHo4VWt1Wk0yS3M2MkNKM3JSWDlwUlpTdTRQMGpiV2pWY2diTy9N?=
 =?utf-8?B?QzhPWUJMMFZha2hISkdOcmlrNXBNenhvVWgyOFprTk4wQ2xDdVAvNGlNK000?=
 =?utf-8?B?dG56WVc0dXpKciswWVNhNHUraUFwU1JHV1g3LzJFWFBzSnQ2NlI0V0VndTBl?=
 =?utf-8?B?L0FtWTkyR29OUlFidWs4SFV1ZUlIaDlkdWtBU01vV3Q4djVoZElud25BVldD?=
 =?utf-8?B?Uks2VkxBdCsrR0FiL3BFa2s2S0dNeXA3aGlMUTVVbThCVUU0dkZ4L1hJdjZa?=
 =?utf-8?B?RXJ5NjhwbzdUckpCUytMb0RiQnF2V09qSk9aODRYVldKbGp4dlJYbGdEZWFV?=
 =?utf-8?B?WHM3VW0vYjNvalQrVFhIL0tUaTM0emljWXlrQjhWN0MwY0s4cjRibFh0TTla?=
 =?utf-8?B?ZjY1T1g2RGtoSzBUWXF3Y0dkK3VRUVM3U0R5eHZ1Z0Nhb2RYcmZYRVpjcG9X?=
 =?utf-8?B?ZkR6bWV5bnFLNWNCbk1VekFJTTVnYVZQZ3AxS1hSUWJYZURzOUxSTTBpTHZI?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbe39c5-f656-4643-6add-08dd0551f2b5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 08:46:08.2270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIS5OiAXnrycCBgFrOiWRKxRKhYl5GzHwiqn3XLlRopc0rec8Y21Gg3MMsPr/J7MhukPP5QCtzPrEs8/OL9j7KwNXWz6syZwmjaNwLGa4XA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
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

On 15-11-2024 00:33, Clint Taylor wrote:
> From: Matt Atwood <matthew.s.atwood@intel.com>
> 
> Add support for the pantherlake platform for xe.
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>

I think we can squash this one and the next flatccs patch so that the 
complete/correct support stays in a single commit.


Thanks,
Sai Teja

> ---
>   lib/intel_chipset.h     |  2 ++
>   lib/intel_device_info.c | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 0c04476bf..c93ad9f75 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -92,6 +92,8 @@ struct intel_device_info {
>   	bool is_pontevecchio : 1;
>   	bool is_lunarlake : 1;
>   	bool is_battlemage : 1;
> +	bool is_pantherlake : 1;
> +
>   	const struct intel_cmds_info *cmds_info;
>   	const char *codename;
>   };
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 546b9c65a..69132e91c 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -526,6 +526,16 @@ static const struct intel_device_info intel_battlemage_info = {
>   	.cmds_info = &xe2_cmds_info,
>   };
>   
> +static const struct intel_device_info intel_pantherlake_info = {
> +	.graphics_ver = 30,
> +	.graphics_rel = 0,
> +	.display_ver = 30,
> +	.has_4tile = true,
> +	.is_pantherlake = true,
> +	.codename = "pantherlake",
> +	.cmds_info = &gen12_pvc_cmds_info,
> +};
> +
>   #define INTEL_PCI_ID_INIT(_id, _info) { \
>   	.vendor_id = 0x8086, .device_id = (_id), \
>   	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
> @@ -642,6 +652,8 @@ static const struct pci_id_match intel_device_match[] = {
>   
>   	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>   
> +	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
> +
>   	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>   };
>   
