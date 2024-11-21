Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CFEE64000
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 18:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D89410EA17;
	Thu, 21 Nov 2024 18:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8irSpTM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDDB10EA17
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732212442; x=1763748442;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gm+VeBCPJbPXVxi/9viJBAFy9WhYhJizO8lG+RWcFj0=;
 b=f8irSpTMtMeXWu6qFwIT/9dFWeEJboYw3HAMbfIF0WRFgsp4MBbMSPsI
 9BGgRWXoFAO3L1BKRKNI2BcJa7z2xwKVoeXXwpfwXDolL3fuh5LqEW8ZV
 NqwqCF2SKTvQQpoEDKoeqp6cbTHVcF0sUJoDoSzVJQpKNv7P6jn0yppKU
 gsIPCLIwxlemYfhKeMm5LpNC9LKORFDyKZqKCPOvNRFveDm2IjfYWz0Ix
 HiDMn40gCovkfSglXsG4lJ3gDdshB4JLjRSnhvJvbtM14sla1md89IpPE
 yTMdXLS2W2F7PtzM6R2+qRFl0Te2R9CRHH72Yh30I/Kr8XVmBGcTSitia Q==;
X-CSE-ConnectionGUID: WkXBAj2+RIOqQTSFdx0F+A==
X-CSE-MsgGUID: 1IeY4lSrTTKvYomeqBhwVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49867349"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="49867349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 10:07:21 -0800
X-CSE-ConnectionGUID: Ed1KyFkgRrKcg2VLIMiFjA==
X-CSE-MsgGUID: mvbPt/CIR1uxrYzsq9E9/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95281954"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 10:07:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 10:07:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 10:07:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:07:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFKjPHgFpMk7wX5mygBHVg1/Ff3la4h0zvwOAUdNdhqBOuPBrO29dH5UMD2h8FGrI29RksB96KIdU4rHHDahadtJDjF6n6kFSqzYjwNC9j+qroyZVWZVL1Lz7/VAdBdKYKxcujAeUARrOW+0A2yQt60kS9svezywKhpRx9KSdbIkLjbwtlDS1NH5j0tE8riUBKMqyrvFdctMDaMgh0VTHwUsJJ4xapqd/fcdhGGIrtB7QN2ubxOC5lNA19emXoifF+aFzWV5g3HHnMH8hl/KjX8NQZ/OwGn/ZPGiHiilcBXR20yPMu6l4SkuwCR0kCiZnIm+sO92HLiwTjOuuW1vNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2qZ6Lk7I/eTWlGGSA+cRzDOkSB5aVh8CmChcAS7Evk=;
 b=tnZ7yKhBfBuJ9oi6gJayAIwH7aQ1ArRDC3oY8QYhSGQleXT/HGnuVW2C56wmY2V3t98YfZewEh8rmqJKAf5iqJ4K3fwyHJa93fo41N9EDbfHQz43r9e47LFqPYCNwq8HloZKwl8UoV6hgBzwsbGIxq2Tm/nAr+CEHSetiCXhPhtXbTyC/SiSIOM8h9z/FT8yoXvW+K6E31AAz3g57gKdly7nVPr3zVWXA1tyZZxU5h1snyWlHtBxZmJeyi7VNSGARTOmxYh2uiDdy/UG9PMO1TCzId6HmvV7tHv1cw5U6uY/MQlkPUoi8hEQusqjbUViZBUioKvEmnq3Gaoya8U+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 18:07:16 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 18:07:16 +0000
Message-ID: <5208b8be-6865-4b70-b280-aa50e882cee1@intel.com>
Date: Thu, 21 Nov 2024 23:37:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_async_flips: Skip Async flips on
 joiner output
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
References: <20241120174345.1970095-1-jeevan.b@intel.com>
 <20241120174345.1970095-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241120174345.1970095-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::25) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d27374-c3db-421d-97db-08dd0a57550c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0EwL2NLRktaVVgvSk5DMFl0L0wyRFltaU1vMmtISlZNT0ZNTW9kOUF1VHFy?=
 =?utf-8?B?S001ZGo2Zlo3MFd4VWgxbWtsOXNZemlUQTJ1Z05GNEY4Qys1MkNyeFhwUmVM?=
 =?utf-8?B?WkEvaGlQaFRVSHpsakcySERMZXg1RXJQcjJLYTR0b1dFc3JIRVNKMGRXTFB1?=
 =?utf-8?B?c0MrdTBwYjU3bS9pWjM2QzBldHFUM0MwK2dpbWpLN3F2TytubVdUM2xja0Jl?=
 =?utf-8?B?YXFhaFFPeEtaMWFjMVU5bzBaZjNYVnhjUDRZOEFnM2hKaXNKR2tVVGZKUjVV?=
 =?utf-8?B?OUMvTWgwbVFZOFhiZjEweW1rbms5U3ZlMGdjUXBRYmNKSEJkM08rL3R1RXAr?=
 =?utf-8?B?Z283ZnB1NlgvUjdYZ2pMZ1pEV3NadkRZaTJLMGNqNmdFTnRVTmFVS202RkRW?=
 =?utf-8?B?bHBSU0lZN3IzZ1JZaFgzWVI5MkdOZTBaMEl6bHJCNFZDNnJNSHpuR2Ziek9a?=
 =?utf-8?B?MWFQcVA1bHJKYkV0ZlBGZEZCS0VINjk3Wm9mNlRLMm5iVkpQdUU5cG1TY05O?=
 =?utf-8?B?cTQ2K3BzUXM0cllUSUJHOUxRSVNYY1oyemdIS2xXSW01ajJXRWN4UUlJUUEw?=
 =?utf-8?B?amVyL29nRExYSks4akFqS0FkaHl6dXJrQ3pvcXhMS2JJcURDYTVFNCtMSzZP?=
 =?utf-8?B?clZaOUJXVGFrZU9uNWx2ckpETUNrcG1UK2pXWUZ6WHVsbDdsSVZ1Q3lJSUs3?=
 =?utf-8?B?Ulhyam9yNWlzbXVGcTBtT3JGZ2dITUk0VVVBaVFSbG1ScUhqOUxsZlE3N3pp?=
 =?utf-8?B?a1BlbndkOTBuNlE5SkN6czVBdjFORWsweFNpTDFjWC9IemV6bStEeE5CbW54?=
 =?utf-8?B?ODFURVY2RHZMVnFYM0w0UnZtdnNsMnpSSWgycVhWSFNoYWR1Z1hNcjE4bndT?=
 =?utf-8?B?RXljeUdVS3diODNtbEZwdFFyVEE0aWNubnM1WkhMam15djRXbGxDSXo2UHdj?=
 =?utf-8?B?UTVoM2kwQWZxWEJMODQ4TXNVSTA3cmhzR0ZwZ0NmZ1lwamNkTG5XNXhidElw?=
 =?utf-8?B?eWZXRE9wMGFTdXQ4RFZHbDBPaDMwWm1zOWx1SGNpQzlsNUdhOGpNMTlUSWJV?=
 =?utf-8?B?V2cra21OcXMyZkpmeWE1RXlVc1pEVGI2UTkxNXBMVEtwRzk4UjZ1d3lROVVJ?=
 =?utf-8?B?MnBCVmdIZVRiUmZObHRwalNnYWVMdUJMcjIxZERyNDlOQ3h1L1lCOHlUNEhD?=
 =?utf-8?B?NkN2VDc0L00rQjljaEdkazg1alhIQytQOHVoTXN4ZVkxdzladGVRNitmVGU0?=
 =?utf-8?B?U25XS29ibnJPRGNGU2NFVDFGYWpXTHRYeWF5cmJSZG5BTE5UeGdpLy9KdVJF?=
 =?utf-8?B?bHZWWXZHVzdYazhRcE4rQTVHeW1PSVM1Y21ibXBJOUprM0NqRkFPN0ZQdmNB?=
 =?utf-8?B?dGR0Yk51N0R4Y3hQNkJDaS9ZbDBuUXFsemJoWERaYkdyUkNiQ2JkRmVLSUZY?=
 =?utf-8?B?UzF5RXZ4U1QwcjRKU3ppV3hEUWlDTWRRb3IyNm1QbTRMSXNnRHgrVk1JQ3NH?=
 =?utf-8?B?WFNmWDNmdCt6eFgyWE51bkdpWnV2V0ZXMzlJdDJwS0FMMk5RVU5pL3dwU0ZJ?=
 =?utf-8?B?c3dTOElaOStqT21ta21wT2U3YmVzWHRRYXc2cFdmM1ZEY05FckhQRk5GQUl4?=
 =?utf-8?B?UFBRNmdNdElOZEJncys2eDg4aDl2bTRjTG5kY2xIcDM3MVI0L2NmYlhiSUZt?=
 =?utf-8?Q?8WtTVmFBcow66YoNYY1H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xhd21uZ3BMbUJya0hteTFMZlZyL2NNWG8xNHE1TGllUlJ3OE1SNlRXMDhs?=
 =?utf-8?B?allJcXlHYUplQldyK2hjVlBJWndaV3pxUnl5TGVpYUtvbWpkVStuMjZyVW9z?=
 =?utf-8?B?TXl4YjZheUFXN1JVWFAydHRBajVCKzZKanJxU2EzUDBLeHhmc05GRUMzaGow?=
 =?utf-8?B?R29YdmM1eFh6U1Joem1hdk4zNFV5MHJMeFlIenhvZkxURzhEakxXdjZVZzNP?=
 =?utf-8?B?Ykx4YjIrSUJMZmdFTmJCUG5tMjZBam9yVEhmclB6QThxUnNSYnFTQVM5Snpo?=
 =?utf-8?B?QkpxTmc5SVV5Q2VDWGQ5MzdTaVltWW5MZmp3QVp2aWJDQlo3UEQ3WG1pS0dW?=
 =?utf-8?B?SEIwbWtacExkZDU1U1Y0ekZnUmlSWXQ3MzBhUWpZcnMwTzFIVVFib2lTamJz?=
 =?utf-8?B?R0xFUStia0RoSnp5dnZiQ3FUNnNNR09yL2J6RVA3MG1yaFN2UlVPcW5ZMStJ?=
 =?utf-8?B?c29MZ1MzUUdINEtxQ0E4eU1tMnBjYUNpOW53YWRJeGRySk9mL3MzWmFGV01P?=
 =?utf-8?B?L0s4OEwvb1d4czJRaXV5VlZNSGFhUGhEcGtBWXNraEx6OVY0c2VnV0FNTEh1?=
 =?utf-8?B?eU1mcnorOHF1Rm93OGJGL0l0a01HN0ExYk5PQXJrc09aWTN0L1RuVm9aeUFu?=
 =?utf-8?B?VXc4WWM3UGxWaG41bmk1clZzalF2YVliaVMxT2pUTmY0S0tGN1VEb05IWE5H?=
 =?utf-8?B?SWg4TCt1ZGF3QmtNY1ZMdnRwQm1TbCtQRUJWQmlFa1kxbFRBdWhCN29FeUN6?=
 =?utf-8?B?clNXOTVpdHJ2LzgrNEh0Qjhxdy9tMy9zcGFsS0ZUMXhIcEhlMDJwWXZYek1F?=
 =?utf-8?B?elZOUkZCR2MrWk9MZUlsOWFmQjdoS25ZNVM5SDRONmlOOGtObzlJWDRhb0pV?=
 =?utf-8?B?cU9EOGRTbjdqbUI3ZldvclJyblV4aHRZeW1jL2JReEY5Tm1Id3pGK2lxak5X?=
 =?utf-8?B?NW9RTm1BT3RjQ2J1aTJSa3o0aGM3L3d2cllBYlRyOVNMc3E2UVZsaHV6QnpG?=
 =?utf-8?B?ajRpRFBEMVptWGlnQ3dSbllzbTN1aTFFbGtGK2tQYXhVaDIzRW9nelg3Y1Bs?=
 =?utf-8?B?eWZmWHNTMHNpSXJuM2hBb0pPdzZUcGJGV0ZobTJtdGVRVEYyU2JVWldkdkIy?=
 =?utf-8?B?aForZWdncHJhQkV6Vmpzem1xK210ZkJuWm5qS1M2UEt3SDA1dW5zbEtkcHRO?=
 =?utf-8?B?V3VibksyS2N0dWJZQWthdy8xYUpBSmNpYm9GVG1wcit2WGl4RUY5bG5wTmVO?=
 =?utf-8?B?M3dwdlRwU25EVG9nanRoTVFNN0ZHcnIyODBDS2Y3N3VSZU9iaTBXRzV3WC96?=
 =?utf-8?B?ZnppR2IvYkRSRDJCQmZ6b09oOEVCNThpTlBPY2N3bDdQMG1aUDU5a1l1Z1ZL?=
 =?utf-8?B?dFpPNWhhVUxiTzI2N29aeWJEZEpRRnJFWHkyUmd5OVRqYVVROVRRQVhpbEhs?=
 =?utf-8?B?UUl4Yi96bkU3Skg4U0JNV1ZhTFllNUtYYTlZRFlUVUNJdHp0OVR3MVpZc2Zy?=
 =?utf-8?B?OXV4LytibXJGdzFhRWdXdk0xNWJWdU1MTTZMSlhTZVdZTkZDNThCN2U5d2x3?=
 =?utf-8?B?dkNhR1VOeUtUZnNWc0lQVXFnWDBQWVV5bjJqMGtqaFl6UkN5SG5sOVhBQ1FI?=
 =?utf-8?B?RXAzNmFVOXZmRDh1ZXAyNWVmdEloV2Nhamt6M09RZmhuZEJjLzh1QlR2THpv?=
 =?utf-8?B?MldjTWZnSDBqbnhPRkszaGxzVGdhSkU4alY1eDZHcHJITjV2Snd5Y0kwRGJD?=
 =?utf-8?B?bEJSenN3ZVZpTlB1TURxdC9ZTXBLaHl5a0dVSDVYUVJWQmVWckhLTjRzdWgx?=
 =?utf-8?B?NmNoUXMyT3p5ZEdDdTFndTNvQ2k4Z0luSHBxOHdheVJmM0ZVcFBNdG5wcGJn?=
 =?utf-8?B?UmgxL3d1TFpoMi9VWU1Ta0ZqYnlWM0owNFZXTGJKMG1LY2hOdlhyVGM0a2Mr?=
 =?utf-8?B?ei91dElweG5MK1ZxMXAxV1JVa0FBdVdmV3ZUVnAyWCtDYkZiZytpRGtpUEQ0?=
 =?utf-8?B?MTZUSk5DRzBsbVk5OG5sZ21tNzdUSDkvUng1dS96eHg0Tnd1OXN2d0tWdHg1?=
 =?utf-8?B?ZE9aYjY4aTdkRGJqR0RObEc5SjRCcGxHY01OcklnRGJ1c3g1MCs2TnNqaDg2?=
 =?utf-8?B?Ni9SR2FDUHZYTW9OZG56Y1M1V2NEL085SDZuc1EwcEZlY1JXUUs0UE5ySzNs?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d27374-c3db-421d-97db-08dd0a57550c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:07:16.5257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTyCUHDXGRVl7BgzPuVeH6GuIsGRcUc5HZ64umVrvCcRbmLOgF6xK0EP7nPhf+HssQdJblFyFwlYNjL86RcTIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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

Please use latest rev of Santhosh's patch 
https://patchwork.freedesktop.org/patch/625224/?series=140349&rev=4

On 20-11-2024 11:13 pm, Jeevan B wrote:
> Async flips are disallowed with joiner, but the test commit still
> goes through and causes failures. Update the tests to skip on
> joiner outputs.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5dec71291..486c03b32 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -653,6 +653,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   		data->allow_fail = false;
>   		data->modifier = default_modifier(data);
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
> +			/* TODO: Remove this workaround when Async+joiner is supported */
> +			igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
> +				      "Joiner mode found, skipping the test\n");
>   			test_init_fbs(data);
>   			test(data);
>   		}
> @@ -674,6 +677,9 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>   				      data->output->name,
>   				      igt_fb_modifier_name(data->modifier)) {
> +				/* TODO: Remove workaround when Async+joiner is supported */
> +				igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
> +					      "Joiner mode found, skipping the test\n");
>   				test_init_fbs(data);
>   				test(data);
>   			}
