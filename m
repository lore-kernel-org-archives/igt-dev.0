Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8EBC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 05:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7563010E056;
	Fri, 16 May 2025 05:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O23DlFPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22CC10E056
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 05:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747372800; x=1778908800;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=37mkKwEMBpoicsttKtwZ3vyQ+5b1MNDDdHcCza9NIDo=;
 b=O23DlFPB5gPYcG4z07lt85ecB5gnHJ+tdPWDAfICOaGHFlTHJ96Dzy6l
 8FnDiDln7jlq+M/29MBCv+un8jBBT0NMNBGWlg6w2unVZg4QCHZPOXuI/
 fMm1hWxGRxqVO/+1z7hNa8RBEhbCia3w0+QbpmN3ZP4R7+i6tO3pL75Bj
 oNpEIqMhxGNNjEKEjlapESmdx5MQX4cZul7EIqqxHvzznmZmi9eYgyn93
 7hDcgr8g02ro3rcWL2AHod1qPwyQWpeDqdwXL2B585N5lCzqob+ADbavP
 keyjs5c35cm/dqbSuzwaacFHz8Ls+vKu9bCXAT3A4rfEN0V+DLHY7LxtF A==;
X-CSE-ConnectionGUID: L2qKva2qSlCLC7gSAXH+PA==
X-CSE-MsgGUID: uZXw1BQOTFCSGUi4QaY3nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49493590"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49493590"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:20:00 -0700
X-CSE-ConnectionGUID: M8pN1sofQQ2BOJ5CdYa33A==
X-CSE-MsgGUID: RbT4RbszQjiCbAZwfV13Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="175716339"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:20:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 22:19:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 22:19:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 22:19:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMBf7br6DNAYTg33gjx/n+dMWwmpqcq12lO1beQah7gjhFpLk8/8cdWldkdFSiTktgjj8gS5B2RfSI1aA6l/XmtPE+BVqXnzvqcewqX444vD09nhfd3swN1Rg6aVoPWMy39AO4S+bDc/Mh7kD9enfveQayWqXTR/kEazw2yYAY4cB8z4Pe+ocNx5K4s5y4A/SikD1JnxWVQn+5SFrtVD81DPtEL6++Ot4Fo1M6UjbO90JUl++QDoNX8bBuQzRgjqIm4QRIrJmwaxa1Fy+avqUWZBsGK/zp5NWVmMzVHCuOvY4pSqW0ySi+oFgtrMjNLrnchQgMLkrGIUnbC/mA1ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHQ9vnQl1leoQn8YXNm684OYRunsGatZ82drAHkKs4c=;
 b=WrWldvaIunOhw5BLeCZa3pFTRG2aBxcYVecN3dAMT+SYcoW9vMrr74ejIMY7DOatIJ03T9yxlEZk8501af//kztcFGL3UAmXLxaewiuJMq9DHzSmVdvnnnGxeeKMGA0J6WxtfvUW9dF5zBD4bLfelv58P15G5+fqRcJNCyhxxq2p0hMiPXDeKlJ9pgMcxqg5qKoS6oeFNQw/xbPTxRsrucWf0H51TAhj+1YYBje9LYqP/U1CNS5Ibr8uklxfqmk5rjzptK0ryjss+eIX2a6F0NfpVvJmVQmffscpJktMhHf3BLqFrVKZBhRLwsqlyQAWS7DBWpFZNzwoIbPZW13peA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 05:19:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 05:19:43 +0000
Message-ID: <14ccfccf-2d7d-4381-9688-9945ddbd1491@intel.com>
Date: Fri, 16 May 2025 10:49:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Add test to check for
 active contexts
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250425192102.1551877-1-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250425192102.1551877-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 916b0f25-42d3-4d97-b9f1-08dd94394437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXFvMC9uMVBDaU1SMHRpcStwaDl2eUtlM3dpMFRzVks0aFdoZ2pPQjZiZEpM?=
 =?utf-8?B?KzlEYkNmNk1NR2hjOWhWRjAxZGZSNXhZbUlXeDBHTWlFU1h4dyt3N3oyVU1y?=
 =?utf-8?B?WWlnZjVGTW0wQ0xRTzg2QW9KYjZ3WHlHQ0VqdVhGdTFnM0dSZ0RJUXVsdHFJ?=
 =?utf-8?B?cnJtUm01M0xJb1IzM011NWE1MUx0ZVR3NDBoUVZ6TERkRWZzRVJzV2hNL3Jh?=
 =?utf-8?B?RUZTcDB2WU1CQ054QU0rdWplYzJCYTZoRmI0TXhVaVZVK2M0SEVFb3VldU5E?=
 =?utf-8?B?ZUNXMERZK3NRVm01Z1l6b0RtYjU0NlpoclNBYm5HWGh0bU54elRTN0p2dXpy?=
 =?utf-8?B?RGlzbStKQ0w1aEdaQVVzKzlDUWZvekdhbC9XQ0cyRGthSWUxQUx4Z21LcVU2?=
 =?utf-8?B?ZWJuN3hGK0duMGFDeEZaUE9qNm5JRWpSY1NHWXhZUTM3WXdFRDhBM09mSnhh?=
 =?utf-8?B?RVZpNys0Q3RRTE0zaHZHcVNZOGlRSGVYMlpOb2dRcjZpOERRTDEyL2VCRGtO?=
 =?utf-8?B?blAyT0crRndNem1nRFpaL3ROWGZlQnZsSDJrVjlmclNYSkJ5MEhxWFltd3NX?=
 =?utf-8?B?Z0V0UlFscEozY2h3RjFmYU1La0ZBMnptaXFQZ3ArRUZ3a0E0emR0ZEFiM21a?=
 =?utf-8?B?WXB6Y1RmQjUrRDIyb1RvaXRyWGpJeVJqZkY2RTJ2dUxjUmtIN1lJVFBybjBW?=
 =?utf-8?B?enFJc0k0RVY1UjVZTEIyZEVWa01iSU9FRk1qVWVsQUhld2JlcEh0YUF0VVdX?=
 =?utf-8?B?RDc1TEtrd29rTWNvRzJ1WGZ5Q1U1S1FTQzkrNnVvKzEreG9ZYmpPQnh3NzlJ?=
 =?utf-8?B?UmRpRHhNYmx4V3Q4S25VTlRwZ3Y3eUxFVFRiNzQ5K0NES2QzZmZLcC93K0RL?=
 =?utf-8?B?RkIrUVBSUWF2RllobGVCZGtsMDNRTFFOOEdnVHlQaFArZm1Ld1ZONUVJMC82?=
 =?utf-8?B?RmhMNUxEelY2dldabUVmUHpzOHVZS1RINC8zWEl1aUQzUzdiVGxZcDI3TWdh?=
 =?utf-8?B?b1Q0YmwxS0F1V2JtTGVNN2hJZFJTSm5LTGtqQ2wxWFNuVlNwVzlHbTRFSnM5?=
 =?utf-8?B?M3d4dkIvU3FPeU0wcy9mWmk3SXBqTmVvVzZWQjF2clBkYldvV3NTZk50MmtC?=
 =?utf-8?B?MmhWcmhjLzlwWk5sQ2V4aHBnTk51b3hyS2hzdEtOMnZQWlJlckRHb0lCVDF2?=
 =?utf-8?B?Vjh2NEJuTmNzc0d1b2h2NFBnUUx0NzgvRlV4WUNtdysyVER3UVpNdlZ3QjNz?=
 =?utf-8?B?SXpNKzNpK3pzVGZiWVNNcDJab25NWTBTbCt3MCs4Y1FOSjB2emVOR0I1Nmx0?=
 =?utf-8?B?U1AySjZYUjF4OHlNWmorWTNFVHJjWGR4RmNFclNDMVM0UGNIN0FvRXcwUDJy?=
 =?utf-8?B?cXNVblRSZjZhMXJDbWd2dHlPdFdMV2s1SFQ1S3hUTXp0S2FyVTExMldDOS9S?=
 =?utf-8?B?amwzR0NBSVZsd0RkcWZ5aUFVR2t2eEFIL3hiM2twbndmVE05NStXMzRDbS9Z?=
 =?utf-8?B?YmlmMW1qUmpLRnZKTHVucnZRb2I3bHJzUjRjbmE5NDF3WDc0UWJOcTlGbkZy?=
 =?utf-8?B?dFhKOEpaT2dQZW1MYnlacFAvTDR5QkRpd3pMdHJXSmN4YzFJRGE4VGs0UkNQ?=
 =?utf-8?B?Yk5yTTVXazVDOGYrYVFsei9KRjIrTUFHcWdqSUZBbGtqVUZLZUNBN0U0eDNx?=
 =?utf-8?B?ZDRNdW04b1A2UmVkQ05jUHk3OGlYQ0Y5cWtnT0ptdVkrZVVkMXlkbyt1MHla?=
 =?utf-8?B?KzhPZW53MVpPNEVIYmVaQXg2L3F6NUpUVS9BcEJzQXZZMHN0MG1DQWljbW1Q?=
 =?utf-8?B?VThxTy9OSVZyQms0dEJjTDJPSVljcGVFRkR3aHdjMGtEVE8zTUlVdXNBVkNW?=
 =?utf-8?B?TjhPb29EdHVkWTk1WHQwSkovNnJZNEFUSnZUNnVieGpWM3VkNDU3aWJvQkli?=
 =?utf-8?Q?7gARxjuepEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGhHYi9iYnJFV0hVenRYNXVVaWFOK1pxbk1pbTUzKy80TEtCamZuQXNGUnA4?=
 =?utf-8?B?MFBkcUgvRnFMaDJoTGo0ZlljSit5dS9vMXJvWks2cFl3Y25iY3FWQWVNZW5Q?=
 =?utf-8?B?bnJxUklxc3hNRFZ3TU5JSDFPc1FJNjdmbTZZdStHOHIwWnlaVHNxM01tTFIr?=
 =?utf-8?B?TjhNb1VYYlNwSFkydUhtWFlmQncwMXF5bjByTU03MUg5RUlDa3VHT2hFb2pP?=
 =?utf-8?B?QXFsTWkvbnRFenE1eDhKb2JTVGFKcFQvQnhCNXlIa1dWWnEva3BmT1psZHdC?=
 =?utf-8?B?Zm9JRVFCRWF6OVJ2TDcwZDhJTmVybklaSGhCRmZ1RjlROVQzcXBxV05DYS9K?=
 =?utf-8?B?U3Z3VTVLT01HWXRHRFRYak0zK3VBc014dnNIZUVydlQ1Tklxd1NsSStyTXNT?=
 =?utf-8?B?UUx6YkJlaEU4b2NFWFhLM0VBUndodW1MeDZEZ0VpKzlBWXNKTW9vZHhrNVVn?=
 =?utf-8?B?a3U3WG5pZjBmbVUwNjlLSk9HNDR0RkZoNmpsdUVyM2Y4d2JFOGtIcWNwVlJu?=
 =?utf-8?B?NUhWZTlWWFR5RVFYaHRUeEtXSUtvclQrR05PRnpnSWxZZFh1Z2FpTnFOSWpW?=
 =?utf-8?B?QWk5d1dLQ3NPNURTbm1Hdkt2ZlhxYjBiWForc28wdlp4VGtyNVRNd1hHU0U2?=
 =?utf-8?B?WkU4WFRsUlhpUTRSdzNvN1phc1RxWWNQd1pPKzduMFU4aFpCaEJyVnpMV1Va?=
 =?utf-8?B?bXEzMDZOeHNRdHdTYlJ6cW0wdFF6R09ORTd0Uy8vMmE5UE55aktjaG1GaGRK?=
 =?utf-8?B?ZGxSSHhMbnROYnZuakdYNU9La2JJRlloQk0zN29JZVNpczVtL0t5ZnJwTGVD?=
 =?utf-8?B?WkNWQngxaE9qbGEwL2U4SXYrc0JTYUVGYTZXc1pIMnA5d2FNVHlmVjIrd3du?=
 =?utf-8?B?RFNOUXdjQ1RBcHFaWnVjK2I4d0hFQk1ETFJaamp2UXJiSC9JcnpHekc3N3Zk?=
 =?utf-8?B?aENibTgrUE04c3BXYThOL21Ib1FkeDFSMml6WXJUOWVsREJNL1lGSmpWeHFZ?=
 =?utf-8?B?TmZYVEhnRWlMRVd4YU1OWHNJNytDZ2FpQWhKZCtiSW9KVG5qOFU1dk1RNHBu?=
 =?utf-8?B?UWw4M3ZYa1BNMk4rUCtxMWpPeGNrSUxWOEVZM2JYR2wrRzhFMnh6MXN2YVZt?=
 =?utf-8?B?RFVtQlN1V3hWb3ZCMUZ0MitvTDhIVFJyVzY4TFk4UElKVWNyMytzSUtLbjVB?=
 =?utf-8?B?RjZFdkxyRncxYm1MNGQyN0hpNjhmTVdHTHFnOXpRMTM0dkcwQXJOS0VkeVV5?=
 =?utf-8?B?K3ZGWlhyaTlhRG8vK0VEcXpiYmlVSVkzV0N4OEFxUDBXT3QxSmtDd0dGVEFQ?=
 =?utf-8?B?S2d5aEFVZTdFOEwxUGtDRzRldm5ObHAzdUxhSlcrYUI5NS9QYUtQN1phSzlZ?=
 =?utf-8?B?WkFYS1RJdUpta2hzS0RuUFdEV0FyMHBxWmphSVlHL1N1ZmZKSEJwdHpqSExC?=
 =?utf-8?B?RzFQT3pGMkoxWjlKZDFhanBDZ3pkT1duLy9JcFB3NFU5TUJDQXZGMEFoY3pY?=
 =?utf-8?B?ZVo4blpxNFd0ZlF4U1FmanBhRHVRT0RMTzVCYjRoVEpNSFVjMitScnVEMGJu?=
 =?utf-8?B?a2k4MUdmVDZHR2Q3aDlYSDk0WmJPUFFJRHltYmNuQmdWdjhabjBjS0xKdGhs?=
 =?utf-8?B?M2t4YTBsMUVJRmxicGZQcFQwdXBkWDBQMnB5UEgzVFdBOFlFVDltU2lQSFo5?=
 =?utf-8?B?KzZUVG1Dek9WeXlzNmk4VDZoR0daaXZhNkJTNkgzSG1XS2hBc1NOMkZJa1JR?=
 =?utf-8?B?L3FzNU03ZDVNVlVabUNLQ3FWTEZNeVdTbGNUWHNBcGk1S1IrU2RwOVZLbERL?=
 =?utf-8?B?QXpJOHlzblBDR21CazNPQmN1THpoMERtRzFMQ3JkRzFhd2R6WjBGNXh5a295?=
 =?utf-8?B?VE5TaXQvaC9GK081dEVPQncxVFB1UExBU2tockhkNmpsNFhEdnNIYmFnV0Ir?=
 =?utf-8?B?NC8yZE1mUGZjSXY5K21mczlkTW1sb2ttMlJWSWo1L2RJOGxoWjhWNldRak9D?=
 =?utf-8?B?QU1uby8xSkVGd21oL3d1Qnl1MC9IRXdNVTVhY21abEt1enFUM09kSnZObmU2?=
 =?utf-8?B?VjEwSEQydEtTa1V5cFVVeHp2cDVHRjgyRkFTZ2tWRzAreFJsY3VpK0FJeVlW?=
 =?utf-8?Q?0Q9M9zsdkU6h/OF8GXrqC6prh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 916b0f25-42d3-4d97-b9f1-08dd94394437
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 05:19:43.8519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7bPMwma5MhzVMbMLHspwrg1WW20BmrAWjflErmCWpy5SCNS/Aj7KhBHZxcmNqPwYPr1sPnEYuLgmckIuRgAhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
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

Hi Umesh

On 4/26/2025 12:51 AM, Umesh Nerlige Ramappa wrote:
> Add a test to check if fdinfo returns the correct ticks when querying
> utilization for a context that is currently active on the engine.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 9a8811b4cd2f..73346ee9b1da 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -48,6 +48,9 @@
>    * SUBTEST: utilization-single-full-load
>    * Description: Check that each engine shows full load
>    *
> + * SUBTEST: utilization-single-active-full-load
> + * Description: Check that each engine shows full load when active
> + *
>    * SUBTEST: utilization-single-full-load-isolation
>    * Description: Check that each engine load does not spill over to other drm clients
>    *
> @@ -456,6 +459,9 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>   	if (flags & TEST_ISOLATION)
>   		read_engine_cycles(new_fd, pceu2[1]);
>   
> +	if (cork && !cork->ended)
> +		xe_cork_sync_end(fd, cork);
> +
>   	expected_load = flags & TEST_BUSY ?
>   	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
>   
> @@ -769,6 +775,12 @@ igt_main
>   			utilization_single(xe, hwe, 0);
>   	}
>   
> +	igt_subtest("utilization-single-active-full-load") {
> +		require_engine_utilization_data(xe);
> +		xe_for_each_engine(xe, hwe)
> +			utilization_single(xe, hwe, TEST_BUSY);
> +	}
> +
the trailing test can be renamed to load-idle and this to full load

Test looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

>   	igt_subtest("utilization-single-full-load") {
>   		require_engine_utilization_data(xe);
>   		xe_for_each_engine(xe, hwe)
