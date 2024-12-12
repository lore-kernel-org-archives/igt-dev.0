Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A71DE7717D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 00:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41E310E2DB;
	Thu, 12 Dec 2024 00:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yz2U6IAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23CB10E2DB
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 00:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733963085; x=1765499085;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Nli21nDXc8KWAqkS8RTgh3+612JDmfyird7aq2Ishp0=;
 b=Yz2U6IAKmmy9VK3RC+iCvZyQbGkC1KeG1Ng13204oZf6ZVpku7aDpX/a
 j191+1jb3zv+rXVYD1lM10szOAjWuM4HNqAolO3+NIe4uUpNQ8VrXs4Gx
 4hN7unu03gT0e7bTEURMyv112YzHjayeDcZP8QJ6bEY70rx3cvULJwjyu
 8JOPsWZz6bn5YnYdsXBVDMOvq0265ggqBWcTOIOztvCFCJ4bmei3BFhXE
 si5y7QWVeVkzhTSv1LB8WeQNfy9YS95lEw+YIvDm5gTgTLDzw2B2JQPCA
 Fx0wzYqWUDwe0nyApLluwWxCMW59DU6NKNwo9oazI4+lKk4MgKI3iB1Ax g==;
X-CSE-ConnectionGUID: U+POXZ+dRQulz6DX6vkyBA==
X-CSE-MsgGUID: qeh6IFiQTcKoHOXu8Ck1WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34608276"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34608276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:24:45 -0800
X-CSE-ConnectionGUID: 5p2wSh2vRai6SmTo9omZYw==
X-CSE-MsgGUID: yE2R77COSMqeAKxRvZQ7Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="100858453"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 16:24:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 16:24:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 16:24:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 16:24:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJQq2l2TuIFPVxjrF9ncU/zLEB9V4yPMQQj2jGVfLX4/OtoUAuRDnz40HrFl8RFhWCmIGX14Ptd+GN/gGPU7zMYCNdaj4bsSH6d1dbDFy+VX6Ln9DFwsKPyCuV/U1xaYYraLx6V5jEiEiyDxv+boCfsJzt9Roz0g6fU3EEsSYVqs1/g5tkpr+ONOqecJ1WMNwohCwt426Ax3YBrQjKw7k+djvCiAfS2i5IJSVfgbV1erkQ9XdRNbaDqFhzNvjHcIN1QtLWZ4QCtFTUg9LMbPJ+KmhKhCjuTVqxhNV2v7dqSgwWGTrsDioTBfyCHQ2VIK3EySto/dLlCaRGyqkAiPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9jRv4g/JLfb84rc6tvLbBSuL9O6+sV76dhBWHbQB5E=;
 b=LJUUvy5VHAwqh8XsrJHN+dx03nAwd75Qq5SpG0m4BdUM9zwjGqIeM8hRr8hFBBnA6cVYhwr4TPr+HCuw2NWEkbiAT4cigw68GBchD8sIsbIBtT+Y2xCcxfIulh46Hwg34HPVAUvS1i877A1RaltwTi1VWEwv3nnRqx6Bnb/0VkzEoEsFX4xaQ+ZN+4ld4CRjIJok42U154n7r4VzL5AGAFrnPL5FbxiZ/ub6azXyx/WWVVP09qRNMlBR8OkTesoyp1heVhgWpBqo4bTICQDoGd26HAvQ2XApF3aHk3z4Dw/At/HZqnHocTBhKDRfyUH6cVJ68ne9t85oPoeK4BY5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Thu, 12 Dec
 2024 00:24:32 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 00:24:32 +0000
Message-ID: <16394f40-9549-48f7-aefd-c3b3f316ab67@intel.com>
Date: Wed, 11 Dec 2024 16:24:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/7] tests/intel/xe_vm: Update invalid flag subtest
To: <igt-dev@lists.freedesktop.org>
References: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
 <20241212001829.2082490-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20241212001829.2082490-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d26a01-7481-40d4-92ee-08dd1a4359a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVQwQTNWVVJtMFo0TEpqVStNZ3RRSEhZWXkyRjJLWEVCVjVCTDVLUUxHZ1RM?=
 =?utf-8?B?eWNjWkRESXNXWUx3K1VtVjhqa1lZNTRZdmFoNVQ1VTZhcThPYytWZWZMV2dz?=
 =?utf-8?B?SGcwOThxeEdoallOdFFQMCtFTkVudFJMV1pEMTN1S0lrK3lNaU0wc3JzRUto?=
 =?utf-8?B?ZEhReUVQWCtUMWM2UTAvVXNvZlB3Z2MvdlNoL2F6aHBWTjZSbjZBdnJQMHVa?=
 =?utf-8?B?Zm9vWjNJbk5SbEE0Z1Fib3ZPZHpkOU9kSTZaNWJvdmhPVkcyZGlWTXhjSlph?=
 =?utf-8?B?bFFMd0x3TmxNbkZ1eUpUWVBTODB4L2EwcXErazQ0ZWVRQTRDaHVhNHk2ZXNF?=
 =?utf-8?B?QjFFVzFLdWQ5T3QvL3huTjl4dnJZcEVkWU5BWkhVcjQyTjIzSkpKZXZIRExY?=
 =?utf-8?B?TjJDQ1J4cjg5WnQxTWNjcFJKeDBSc090MHpZenFidU1Qd04ra1hkdk9qR0Ro?=
 =?utf-8?B?Qk9oU3doaTd3NmRhL0tjSnRsYjhrOVZoeisyRXVTYk51N2c3cExLK1VpU3Y2?=
 =?utf-8?B?T3ZseHE1Sjl0VmF1Ym1UR2RwcEpKcHA1VTlFYlFYZWgyWjQ3SFAyNXFtVnJI?=
 =?utf-8?B?eG8yamlDdHp4TjdNM1k3c0c4dnI1UTdDTStsWE1mRXhtV0lWZW1oOW1GRG40?=
 =?utf-8?B?UjNxdlcwNHMwaFhRTHRYdUZGd0g3NlVSK0lvdmRjb1ZNMUFxM2hwODlzOU41?=
 =?utf-8?B?dU82YW42TFI4SXZuTktDOUYxQ0R0dzNyakdCQ2pMUUtXNXFqNmNLT2dhOExF?=
 =?utf-8?B?clFWYkYrcEk5RFVJb0xkQVk3aWxMdmJTdTNhei9BMGhkZnNmUFlHVWN3MlRU?=
 =?utf-8?B?RmxKM3oyMzA5VUkwWmJtUkhHUjdKZk1ZNlkxbVNScEI3bXI5M3Y3S1kyL2Rh?=
 =?utf-8?B?RjAxL1lJVHlPWW1kNFNWY0tvOEgrSGNiZnNvUHdNY3FXVlNXam1IaHhlS2l6?=
 =?utf-8?B?WUliQmo5aGIzbml4VUVvR2pxWDVQYXczUi8xUFBKQThNREZ4Q0gxelJyWHli?=
 =?utf-8?B?eGk1YXpJTnd4MXEzaE5uWWFRZzNzRU5mNVJZVGtCM0V0UnZuYlErRG5GVHhC?=
 =?utf-8?B?MzJ2TTJhRmpyRkg3NHFJOG5VZWFJZFRpR2dzM21RbWFLaFg0Qm40LzJMVUE2?=
 =?utf-8?B?am4vdTBQVnhkS25mSmYvd2loR2RKMkVBcnBlVDZTeTZPRUR1OTU0dDQxRzFB?=
 =?utf-8?B?VW15aDhtNzNmcWZ2L09sMk1zSC9kQlY0ZGJZbDJ6ODRwckpXb0J0aHB2UXBJ?=
 =?utf-8?B?ZjZFQkpSZDlSOUo2MEdWakZsZFBqekszdXlGTzZ2TmJJRW5GZDJsRjVGUXhQ?=
 =?utf-8?B?aTY5SUlwTGF2b3VtQlhLNWRqNUpvd3ZYZnNud1FucUxRU3ZsdElFeCt3TW13?=
 =?utf-8?B?ZXhJeWZLdmV5M25SK0ZxUFNMVm1uRjlGeTdraTVYbzhDZFNLQUVyUlNNOXM5?=
 =?utf-8?B?OGVqSTFBdyt4Z2o0UUQ1bmQvQ1hQNDdYK1QvM3hYTWVxM1hjT0pRdnBMenpT?=
 =?utf-8?B?QTNreUxkK0FZRzVhamJPMGRnTXVRZG53K0lCdWE3WVZOa045WU96Zm0rVi9x?=
 =?utf-8?B?UE9HTlQwRktZemc5V0pyZU54cHlzZDdibEk1eHc1TmZLWWlqQkFsd3lDNzRZ?=
 =?utf-8?B?bTU3c1lXKzBYM1BhZ3hPbjN4empaQjVsZGdHa2NXaDBqMUozeWtrR1ZwNmJT?=
 =?utf-8?B?Zlk5L1JVVGkyVURIeDJLSDFGM0U1enJ6WU5rNHZ0NzFPWS9BV3R5VjBDRk1G?=
 =?utf-8?B?UkhXdSthSVg5MXVSNXZNdG9TWVR2aVE4NEtwbW9FOHQ0RjdJTG42c0NLRDFk?=
 =?utf-8?B?K0VJMjNOT0VDOTNHK1NJUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtYeUZQSEdEN09iTFE3YzN4VWljczV3L0FPRW1OR3lZeC9PR0RVQjIvK1hn?=
 =?utf-8?B?aHlnTlBtZXNqYXl6MGZsc3NqWW5PdWdhVnVpbUxPcUlyanE4RkJHbHVjRDZa?=
 =?utf-8?B?cExnNkFCS0M0WmJkWG0vTEFwa3ZnZ0xZWHVIMGN0OTJTOFZGSnlqaGRNa1Fx?=
 =?utf-8?B?Y3M1Z2dZemRZQkI0WWpwd1NDY3dic3p3SnFKZGFNa1N1djRTMjFjL2dYbEpD?=
 =?utf-8?B?bnhqNzVnbkNBSklPMmJBMXkzVHNqVno4ZlBiYk1BYldIVEJBSzV4UXBveHlr?=
 =?utf-8?B?VHZLLzJHcUZwa0dFd3dROGtDZ0RiWmdwZzZHZVRwMTcvYldyOGhJcC9ua1h2?=
 =?utf-8?B?SnlqZXcvNkYzYWFoWmpqT3hZRVQ1SUpZMmRFWUo2cEh0UUJydDc1YldoSEtR?=
 =?utf-8?B?cVRYbnFYYmpweDlEaTJRNDVtVjFMNW5UcWJ3M2NlU2FLOXJHUzNDNVc1V1dn?=
 =?utf-8?B?QS9qa0RaMWYrNVhmdGZpZTkrcTdBVjZrR1ZWOFJ1WHFqMDM1bzJsRXBPdk12?=
 =?utf-8?B?aFNBR0FjdjNvUStHS0NJU2NFamErR0FXenY3V3llTE04ZUZNRXh1M2pWdlJE?=
 =?utf-8?B?M2pHMWZYN1Y5WnkrMDV5RHA4MktmTEU5WFNGUDltbG5kZSttS0tCR0wzS0lz?=
 =?utf-8?B?bUNoa3MrV0U2RkpZTzBocjMyeFBIQ2ZBZms0SS9nYUM4czV2dTZtSXRrZ0pO?=
 =?utf-8?B?NmRud3lMQjVNYkxGbVNEbHVhak00am5RZFZFOHJMbm9meFJKUjc4b2dNd3NR?=
 =?utf-8?B?R3JYZkFFdjlGY3J4R0JYQmdMYko3bnlMN0d4Nm1GVThISmZoQlJoREdGVWp3?=
 =?utf-8?B?SU1ZaFlla0dTcE1ZdHNRalhVZWJPdGxBVXlRck8weDY5eHFwUnNsYllLZkxS?=
 =?utf-8?B?aXgyaUNMQXBTN05qRkZkN2NHUVFpYnNRK1FyRzBSN2xRM2VuMkQ2ZThZMFNj?=
 =?utf-8?B?enVESU5Ubmo1bHVNWkpyaWNhMXdjSCs2b0hsQzhsbjh3WVFNUTdxMFl3N2Fa?=
 =?utf-8?B?R2dySHc4NTZxVFNvM2E5VGY2eE1oU2h2ZFBQWjNPVmp0ek9JdDVRR0tmUHg3?=
 =?utf-8?B?VE41Q0plaG9FczFGWFE1U3phK1piRWVnSkRNdWN1a2NRSmpMd280a1kzNEVF?=
 =?utf-8?B?a3dOOEJxcDFuSi84ZjZmUWQ1Yi84WmJtOUo2dTI3MjVSa2dGblAzUnNEbmxP?=
 =?utf-8?B?c2swYVpkZDNuUG5EcUNlWHNvdkJNM01zWDZ0eEpwMlVrWkc0MzZ2YkN4dExu?=
 =?utf-8?B?SXMxMFpxM0p2N1hqRkpHdGZhNy9xQk42eWZRVmxDUFg3VTdlOGM2V0xoOFZl?=
 =?utf-8?B?UFRrdDc4NmlqV09DWUhXYkJuakRJVTJVL1ZGamJEQ1UvMWk5d013dGsvMnZX?=
 =?utf-8?B?bTlHWWIyemo5ak5abmhLTmhxZGc2SWlpY2xqUzdTQzBCWUVlaUtWbGQrNlB1?=
 =?utf-8?B?WXh2QkxtY05YalY1N0hrcWVhNUZpZGdOSE5sK2pjV0paV2N1OGM1cmJoKy8z?=
 =?utf-8?B?dVgxZzlxM3VFTE9SUW5zNHUwOEVSMFZjVHVhWWcveEpmM3hjWUd5OXAwdCty?=
 =?utf-8?B?OVVnTmY2aVBVdk1Zc2pVc0pBZ1NDZXF6UExmU2ZHeEVrY3prSFV2a3dWcHdt?=
 =?utf-8?B?c0xldGpzNFpJNC90cEF4SHB4WEF0UlJRMngvS1VWcmRQNCtvd0txNW5JMGQy?=
 =?utf-8?B?UUdmVHBGL0F4YTFSYWRmOU0vc3BqUDBRNkF6RE1zNG5oMkJLTnNRenR3c3VO?=
 =?utf-8?B?TkZoTFEzSVdaRmRRU25xakc2MUVKK0VqRFl4U0V6ZWRPYXRaTGNBcDMzRXc3?=
 =?utf-8?B?SWJxeHpvdmczMlFHVDhmQWdBZFVXMDJkY2M3RUVyZjhiUjl0MDYvMTRKaEQ2?=
 =?utf-8?B?UmZWUmV3dXlWNU9vdnQ2SkhwRnF4QW9GMFBlZUtNSDJmMUxxVWhuZ0ZJMGll?=
 =?utf-8?B?K1QwTno4V3JLQXRsOUlhVzZ0WXEzLzRINnFVUTRlR2pIRndaaW9laXZKcm5q?=
 =?utf-8?B?R0VKYkI4TW90b3dRRURXV1V6T3ZGeHhycU5qNEgvci9uWFdkbHpwR1NVTnR2?=
 =?utf-8?B?ai93K1Vqd0crbW5ZajB6YVJMQ3EwT1ZHR2dmT0xadndkYUx3WitvN2J0ZFNm?=
 =?utf-8?B?VjNnVWRCSjJOYkR5UWRMdHJWenFsbnk5T3pqRWlqNCs3ZlBoYnhaaThxd3V2?=
 =?utf-8?Q?1CbMLXkmyOYseRqt5nGUjgQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d26a01-7481-40d4-92ee-08dd1a4359a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 00:24:32.6592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucuK1I41Y3dCZczdnVhSvZ372b1KpBatNRIWLqZ/lMflDhALjLbFDv5LhPq1jTPNetmelrbcpcQj4/cEi960bXULkKTaF0btosKL65+F4R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
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



On 12/11/2024 4:18 PM, Daniele Ceraolo Spurio wrote:
> PXP introduced a new valid flag, so we need to add it to the test and
> shift the first invalid bit left by one.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   tests/intel/xe_vm.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index e78ddd0e5..741dc0c7a 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2216,6 +2216,11 @@ static void bind_flag_invalid(int fd)
>   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>   	syncobj_reset(fd, &sync[0].handle, 1);
>   
> +	bind.bind.flags = DRM_XE_VM_BIND_FLAG_CHECK_PXP;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &sync[0].handle, 1);

Right after sending the patches I realized I forgot to squash a fix to 
only perform this ioctl if the PXP interface is supported. Will wait a 
bit for comments on other patches before re-spinning this one.

Daniele

> +
>   	bind.bind.flags = DRM_XE_VM_BIND_FLAG_NULL;
>   	bind.bind.obj = 0;
>   	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> @@ -2229,7 +2234,7 @@ static void bind_flag_invalid(int fd)
>   	syncobj_reset(fd, &sync[0].handle, 1);
>   
>   	/* Using invalid flags should not work */
> -	bind.bind.flags = 1 << 4;
> +	bind.bind.flags = 1 << 5;
>   	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
>   	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
>   

