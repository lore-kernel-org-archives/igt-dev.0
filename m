Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C52D65C6D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 10:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A920210E26B;
	Thu, 14 Nov 2024 10:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIG5b1Li";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DBA10E26B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731580288; x=1763116288;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sC+D9YlfTo1jQ3ZCL0DJKLzS0eS5BR7vZ/aDv6SWkNo=;
 b=TIG5b1LiUajf5THYAQi6nWBRUROq5kzjLThWElckLmtL4cdlghSZis4g
 YqdtMQMnAWmY+TTRmVn0of7SJzMT77SsbL+JYwVP9x6G246FIi6Xc9tJr
 Ei2uUHtikq9YfmTSkJIymPjqc0JgIios6MZCEAKkPjiFlILKeez40o4RL
 wUSLZ5O+8bzuAjIW5Wy5DFM0pmXRPVj4+JjRy/Pb6FucqTBSLN52IVr5z
 UqA5B02/lOonk0KFdi5QVhPJiL3jE6GdwjPhqSh7R3+ub0mJyW83/qxSm
 krxSU9aPuhL0ukfJbRF709B1oW1DjoLmZOEP0bssP1kjvz2T6Kgvy+t7b Q==;
X-CSE-ConnectionGUID: /TwDQAd0R3GYUs5ivBOS5g==
X-CSE-MsgGUID: Q5r+vhTcQG6tUEAPjgpJbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31380093"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31380093"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:31:27 -0800
X-CSE-ConnectionGUID: Gs3BA5GMSQqzmrKyZ0sgxQ==
X-CSE-MsgGUID: F+ZJii/kTeKBGtZHNDveMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88334657"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 02:31:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 02:31:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 02:31:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 02:31:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2S/w7xLR12iChbnv+GQzqHZBh+gYT0VRfdsapxiARd7WBwACR9FcnokkWTbE0z/fhXlicDeCCko/IiewpES8TAJ9/9Lj8r5mXacmDWKU1bLVPQedZc7cwy8IIEwqg8FB3JBc/Y5/44ceoatge6rCO6JdYGRkWsottjSJQmRg8LOiDf6uS0awvc0jEvyqQVmmfjMVZ2EqNWrgeGec7EG97A7bhdABVnfik02ascRnX8sARIm32knqpjaqkZBqRQI4EdvHOTDsyyqrbtms+h1h2KfLCcCoCRdjCyW1Amx8GUObSVSKl6geT4N5ZtBml2eIyVAnErR2RdoYil9JTs65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7btg8BYvye6448KTXaqd0WRl0qSfPiYAucyLRtEfuk=;
 b=vHNPHLDa4Ko9IGOSrKglObNGI4yy3AQhdRf7IQCgcHdfC/GeztvOb6Cy05+uTvr41BxSsZuQU6fNkGEyGG2Fir5JKmZb2ETbVzkjFWwNJd2mCHJ0E50OycK9/tKo/2JkZk6SnER4I5Dn5a//QvaTjLmmgHMqUPuJW7N84SDtYrgX5BP0tkTJ6gDHNekV/tw/gxA23qBhcslTDyM3pPq1y0OwszDRS0zku+xNQZhrKc8BlrOAqruFH0l81Hi+1yKg+rkrLLTkLpFJah2+kfjLPD/1q3K5wTXEfOPRHlr5EoIjmuiEVRdokGuzZCT8bqggRozK2uGvLWj2TRYpW/8P1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 10:31:23 +0000
Received: from IA1PR11MB6539.namprd11.prod.outlook.com
 ([fe80::8a14:e93:9fc:1082]) by IA1PR11MB6539.namprd11.prod.outlook.com
 ([fe80::8a14:e93:9fc:1082%4]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 10:31:23 +0000
Message-ID: <ae905771-92ac-4ef9-993d-fca3508461ab@intel.com>
Date: Thu, 14 Nov 2024 11:31:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Remove xe_bo_shrink_kunit
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20241114093243.2671688-1-nirmoy.das@intel.com>
 <486092b4-ed88-4868-bc91-43e952086c57@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <486092b4-ed88-4868-bc91-43e952086c57@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0017.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::7)
 To IA1PR11MB6539.namprd11.prod.outlook.com
 (2603:10b6:208:3a1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6539:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ddfcc9c-8500-4a04-093a-08dd04977c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R08wVncxcWtkVTB5Y3h6VEZwNVc5MDZ1YkhXVVBiZGlQVlI4b3JQMVJMUldj?=
 =?utf-8?B?WDZQYnduUmorWmhubkpzWENVWmpLQWlDQVIrV1Blak9vR09xUGRFcG9hVlEr?=
 =?utf-8?B?WlpNVlpvaytIU3VXTE52L2ZKeTZOdjhTbEVIM1E1TG0vTVJVYWNEaGoraXdy?=
 =?utf-8?B?MWZqZTRhcG9PRjh1RHRpN1RvODFGMFdYUndYUGJMNjFJaEt4dUczdU9QbjFY?=
 =?utf-8?B?USt6SlRyTkpPeUVybCt6YVVYOUlyVjdjWlBpVmp5Z3F0UmFXV2V1KzVVSHEz?=
 =?utf-8?B?R0poNHQ2ald2c3NXNUlwQlVybUVNZmdCdzJpSVdrSkZYRnk4bzZoN25PZ2t6?=
 =?utf-8?B?REg3NWpSUXNySTIrb2ZlSlJJZ3BWU0lXcU1Cd2VHalhVSmJvU2cyTTlJV2hN?=
 =?utf-8?B?RVFldkxEelRCYlMxYTMxTGNzd003eFZnRENDY0E2Wi84bHRBRVZYRzBtaWth?=
 =?utf-8?B?ajkxVTg0amV6RlYxaDhDbzBmaDE0ZXpkNjExRE80VGJFMW8zdkNCb3gxTGU0?=
 =?utf-8?B?Snhld0VWSmdBNnFMSlJVSmdFellJaE1GV251YTY3WHd5ZmpKc0FWRXRhd0E2?=
 =?utf-8?B?dXlZYTY2RTNxcDNnRFE2QTdvQWQ0eXgrQjdKR2Y1WlJ0K1dFcHNFSkhQTFVQ?=
 =?utf-8?B?dGRmZHFHeFZDSzVsTTc0NVlPUmErd1hVdGw2TyttdE5PSW5KU282dEY1bU11?=
 =?utf-8?B?bGluNjhHMXJVdTlOcllFTUEyc2xGR3JIZ2U0bFAwa3Jld2FyZHdBOVFpSVdq?=
 =?utf-8?B?S0hvVHYvSjlyUFVZUEpCU3R4UzV0Mk1RNHpFN2s1WENHUkd1SnN1VFRWVEVQ?=
 =?utf-8?B?bzZnWWpRTjFFdjJkSU9FSHRmaXBmT3VsUjZOeUgyWU5jbUhob1NESVY0U1RZ?=
 =?utf-8?B?MHJLWnZiZmpxUDRYSFRXV2wvL1U5WlovSjdlTlhDV2pNeDFRYmR2T2MzN1Y1?=
 =?utf-8?B?UUpSdXhNM3FxUFlYaTQzR3kxMWVRMldOQWE3Y2Nja0hUUzB4RWpMajJaVzBD?=
 =?utf-8?B?MkRRK1pXbEhWMlJxc1FzVFlpYWswcnVmczkrQmhLU1dQMzZ6NVlia044Qklu?=
 =?utf-8?B?cldVOEU5RmlkdDJ5SnE3bGtHYnJiWDNENE1yRFhBNG02aTZpbTJ4c3RmWHJH?=
 =?utf-8?B?K3pDcHNJOEptRm4rcWl0SVovUXdKcWZiaEpDRCs5Z0Nyb081Z2VjeGQ4bkRN?=
 =?utf-8?B?NmxqemlwckttQk1FamRsQjZLaGE5dCs2SmZJR1lLbHFPZ3lYMzl5M2JkZXQ5?=
 =?utf-8?B?aEJoSDE5MFJBYVArcHorcVRUWVpibDliZ25RT3pqYUlIckN1SmJ3Y1RMd0Zs?=
 =?utf-8?B?M3NWcHlWUU1XOXBpMU5JUXBDQzY4MGpwbmhXczF6TTh6aGR1T2lMZzNsZXVp?=
 =?utf-8?B?eldlV1U5VDRhSVU0TURQV1ZPdmZ3ZTAwVDdaSmVtS3lwS2hNNXFlcG1VYkwy?=
 =?utf-8?B?Z21kWTNXQ0pJaGw3bFZ5Tkl5dko2Uk5qUDBNaFB3WkEzVjFFTzFwbXhnbDlo?=
 =?utf-8?B?UFY0Yjl6bk91YnRhS2c3TEkxVGI5N0ZOaTRZMGhnRHlmdGJsZFBmc3lJdVp0?=
 =?utf-8?B?TXora0NMZiswREhnd2YrNmI2R2dONEFoVHB3d0JqU0JoVDAyUDhmZ05zaUZv?=
 =?utf-8?B?Rnp5cHc1c0RPS0VxL3pjbWFRaEI4ZFpMNnViZFhUUWVuOGk3ZTZLMjBERE1Q?=
 =?utf-8?Q?Ma04EFRTQGpHYhShP0yk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nkp6eHZVa1IrNDNGd1VvSUV5OVYzamJmYkpPWCt5SGYzVFB6a3lzQjFYUGNt?=
 =?utf-8?B?ditLSWVFbW5rUTNqa2p4TEtpeUhSOU9uM2c5T1RZMDNWOFU0UHNxd094NzBZ?=
 =?utf-8?B?eTVDSm0yazIydEhGb0F3Z2hHMEl5T3RCaTlBd1JRVmNMWGxlNWJJOXZGMFpp?=
 =?utf-8?B?ZXZidXFOR2tsVmgvNlUxK2ViTW1xUmExYi9XOTh5TEZxTVdTTkk5Zm5oY2lj?=
 =?utf-8?B?bC9MZmFkTmxEa0wxcDFkS3NjOTh2TktUNThoaDh6dFZqMXJnS09YMjFEQVdW?=
 =?utf-8?B?MS8relBFems3MUhKbWhkaVJ2VjlPZzExTUpZcng3UkNaVkxUaTB3UUxCVlZZ?=
 =?utf-8?B?RlJyUEJzUGJXUENFeVQ3UVQzWjduN1NPUHptMjQwZm1OTTl2Lzd4T1JpRjFQ?=
 =?utf-8?B?QXA4R2dyMlI0REw5cXFyUE9FSG4yOEF0UmRsT25Qa2NCb3FIVnBYYTVxOCs0?=
 =?utf-8?B?SkZTWkQrWkhUaEI1ZWVpWWl3VkV0U1g3M2JHUmdKOHRJNzFUc1l2aU5veGNa?=
 =?utf-8?B?QjFNTkdlVlBKVUZucXJSNUM3Z2JBZHdwRU1UVWR0ck5oY1lOSGt1cWMvQTNR?=
 =?utf-8?B?eEN1N21vQUxWdHpWNktvNGFXUWNpMG1ncGxPUjRUNklCM2dVMHAybkdjdnZx?=
 =?utf-8?B?OVlxc3lEWGx4VFFPSnY3NTdzYUt4eUZucnZrK2xlVy9zVnJYMEdWWHpnbDd1?=
 =?utf-8?B?M1N5dUJoZG4veG9Jb3RNS09KeWliRkxqekNmVE9BZzgwRzZ0R3ZZZkRxZGVs?=
 =?utf-8?B?Vk5NL1J3VytZVDdGcGhleldMdWFmVlRrU0U0bFpycmxlM0FsRnI0N0lLVFJO?=
 =?utf-8?B?ajFlckpEaXhVbHg3aFIwWHRXYkl4bE1RYy9TV2pxSE1uZFA2cXBKR0dEYkN2?=
 =?utf-8?B?M3BWNGxoQythaDZEamdzNmtSU0hrNUdPbUo2TVp3WVZZeGVLVytIaGtabElS?=
 =?utf-8?B?OTUxczlyU1VkL3pWZlZoRFVNeUpVOVI2WUhOWHh1NEVjbEFsYVlyaGt3dGdj?=
 =?utf-8?B?UEZSNlhpNmExNzVndDdGMWV5ZE0zbm9YWWZMOWxaUVdqSjhScWprVVVodk5q?=
 =?utf-8?B?RWhvSHJEaEhicDFScUY0cEF0VFhCaE1aSkU4UnJVMCt2U1hOdEowVHFGSDVV?=
 =?utf-8?B?Vlc3bzN1R0s5TFJnNGFjS0MxNkFhZWpVYmpKdEN5NFNWTUdKZUVYMFcrdUE1?=
 =?utf-8?B?K3FROTVSOENXZml1elBwcnVWSzl1cVNnYnlLbmc4cUVVOEUyUkl6eVh5eFFY?=
 =?utf-8?B?NlU2RW5QamJFeCt0d0lsbUFPZ01DZ2ZMa2JINkZjVnBLeENFTnlxNnN2Wlds?=
 =?utf-8?B?T0ZQRE1Kc0w5VmtIMDJXOWVHZHZGWmd5UnVNSVVsaERzSVo5MU5VU0p6RnJW?=
 =?utf-8?B?d0ZnRFZXVDVObnh6b0xDR0RKNG5kQ3JpRUsvTVRSSThJangyTXlWeldkWGE1?=
 =?utf-8?B?WEVrTnYyOFcyUlMzcU5xZVkyaUJQa0toMHAzakIxUFpaWUZaMUppRktJSVdq?=
 =?utf-8?B?bXJDRGtWTm1LaHA2aHBGd1RyMlVKMktQd2liMWNDOXVaS2hUZUpVMmhvbmx3?=
 =?utf-8?B?RktyamhKdTI2OWEwcmNoOGxRdFR1a3ROR1ZmUVBoUUZUTEFXWFNsN2tzS0dt?=
 =?utf-8?B?MzlDYzlPWXJHYWF2dGdCMlVRQWprZ0NXOUFtdEMyUWg4cHVFUkQ5Sjc3MFBB?=
 =?utf-8?B?NkJ2Z3lXa1dzK1ZRNkJwRlprdWFMS2pTWmw1SnNEWGQ2dkRjOTdzT2dFUTRS?=
 =?utf-8?B?Q0pXY2FDcGVtb3hqVnBEd0Y4WWlCYVVJTVdSL1JmRWRGdGFVSHVkSEtORG5v?=
 =?utf-8?B?d0I4YzV1Q2N2OGduaUlrRnZQQlRVSk5CZWVGNlhxWHlUUlRGajVUS1U0cGJN?=
 =?utf-8?B?ZFBhTFhnWU5IdU1STDNCZDB5aVVTcjdldHRGbW1GbVdFeDB6V216eXhVRVY2?=
 =?utf-8?B?NmJwRzYrNHNrSjRJMWhLYThZRG5oSUR0dzlaV2pVbGk0em8xV3RERWViMXQ2?=
 =?utf-8?B?OFZtOVFQai9YODhNOStlQmRYS1RxMFM0ZUlCejE1OWU4VVdkcTVMbld5T24v?=
 =?utf-8?B?SXFYSTdkL1hzTnpWYnNIbXhJSENrUXNuVU5CYjc3UjU5ZDNYSWtBL1dzS0JG?=
 =?utf-8?Q?IoF3E8kzQCadfRO/LpYozdOqK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddfcc9c-8500-4a04-093a-08dd04977c54
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:31:23.1282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyV/PHPcsV0OMfQMVQ1poYRUApBNZd0z9QdHAzH1yJdGvMzqb/tnd2nVFK+3Vl58ye9DGvXlUOPJHUCD0XKobA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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


On 11/14/2024 11:21 AM, Matthew Auld wrote:
> On 14/11/2024 09:32, Nirmoy Das wrote:
>> Remove xe_bo_shrink_kunit which takes a while to run on various
>> machines. There is no good way to make it faster.
>
> Do we also add this to the blacklist? Otherwise I assume non-BAT will still run it.

I will add it to the blacklist to be safe.


Thanks,

Nirmoy

>
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
>> index d9fb98aab..c263473e0 100644
>> --- a/tests/intel-ci/xe-fast-feedback.testlist
>> +++ b/tests/intel-ci/xe-fast-feedback.testlist
>> @@ -217,7 +217,8 @@ igt@xe_waitfence@reltime
>>   igt@core_hotunplug@unbind-rebind
>>     # Run KUnit tests at the end
>> -igt@xe_live_ktest@xe_bo
>> +igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit
>> +igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit
>>   igt@xe_live_ktest@xe_dma_buf
>>   igt@xe_live_ktest@xe_migrate
>>   
>
