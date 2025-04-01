Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB05C36008
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 06:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6210E27A;
	Tue,  1 Apr 2025 06:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR/oiQKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27EE10E4F5
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 06:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743488585; x=1775024585;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=W85kWpqod40lAHXH7Z/IXlxMD/fStoL6GGsPxYs2Lpc=;
 b=nR/oiQKYi7mM/zlHu0lEDFwZjaPcLth/EGjU2sC4rlaNcxiIZuzMkDsk
 iJttq1yLtd67B8serc/PNgGd7FVXpARgW90+6Kc2t63x0P1sO0gpPhCH9
 8U07tO0Q3OMpaB8F9xzKmyKVWOXL80hQPYccceXsLXUS+VR8izFvfaPNK
 CXb9FLXdp16z29VBDhmrhfwpU0T9Cag+jtc6JnZ2k9sqPfsPO1rWGPVtm
 BkNHR45FFotlO3vgoV+DnI7Ms8aDSlieKRc6HX4rJliFFn5SqT2VIPswz
 JOwlYoF9vjVD0ukiAoJGfBqaKiNJK8NjnMwxvsTs2J7fmFr6MHP5FRX3U A==;
X-CSE-ConnectionGUID: Z9LelUsKQva9dAn6S/yPYQ==
X-CSE-MsgGUID: PCzat1jzRe676MGmujcBLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="32393258"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="32393258"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 23:23:05 -0700
X-CSE-ConnectionGUID: tIEnPMMuT7+1hIOeDcWAYQ==
X-CSE-MsgGUID: 2Srkvs4gRdWzMG7FiHOAsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="131290662"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 23:23:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 23:23:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 23:23:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 23:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrcUBHD3BGBTf7a9pSnXahNMR6Uud7VSIMdg4OnRm1li2LoQtzZJnpkBvr4yHHsbxx/AZBjz3//lsBNKsfrOXtgvm7hNKv9Ah60QtYLCPM/F/KGEXlDiDvIQvn3LLkl0nKvGw7cQpbob3UiDSJqyILTdqhyoQNN04linWsgQrdBnQIvWwqiKAjHeGOfY5GDBA72cnfSSrlg8bQvS2BuW3elpCm0yxTgESaYrPK0I5PGVRfaqAuKhzTZbz+7p7iSgATd4Vt0SBzXW47I7NoNFTRhN6rljbIUkhFwu0+TlrlH9Yz573aG8azqu1Q9U8kTTt6N9cxm4Zw8GJXeAwP3etA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMER7u6zFUeGebuwpVi373EanYGzOHSSpLwC9+7JpsU=;
 b=KeQshfO6lTMkg1MhIvq4z2AxOzxrRAYtWko+izExviRG+CxNaF2fxHou1nKMgQS/aiHPMKJl/FTE2fuCEZ7IOZlf/OwEXHe1R/IFIB9Wh0UPFR9uRjf1vETkKXUm61buRRF/2tBROXNi/EnET4BJEm3uo0GISmHmG2K1zxeSjsmvAXzzLRl9L5TtXQZ6BhxeCAnToDn5CEjqV8+AbupenKOF7i0JNvP4WZJOA44EAICl0s59TMxPkd43CTLs1JoDUZ1t64TS2Fd8nDEb6EiIFFeJQGikT593CXzaClOlEccWLl7FZMjiYCY8zNDFCzmUBvHqrKls1jkhYOZHjKaqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 06:23:00 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:23:00 +0000
Message-ID: <d69625cb-9ddb-4764-8ae4-a8119bedd692@intel.com>
Date: Tue, 1 Apr 2025 11:52:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250328085711.1521085-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250328085711.1521085-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e91b3b-c879-44de-611c-08dd70e5a6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elE2M0JOaDlQeHpwU0EwbVh2T0RYbWhyN0JoWlRYUnRlRXR2M2Y2ZWhDeGxw?=
 =?utf-8?B?bWp0Nkl1RTRxUDkyWC8vZW9DL3cxTDIxQXNtamlQdisvaGlwalJzQkRpNm1T?=
 =?utf-8?B?Q0E1WUhzeVRLTXFjemlGOHZGMnRlK00rTTI5OVFqNVluL1BHVk04SGhTNmVX?=
 =?utf-8?B?MEN5Tks2OFlxOTE0OHJ0NkFpSjVRREMvaFp0bzVoTkNXM2VJa1graE5uNUVV?=
 =?utf-8?B?Y2IrN1VRSHpJYk4yY3U3OUhURmRmN3F0dCtMY0U3dUFYT3NMYzFodXdndCto?=
 =?utf-8?B?dFI2VFUyaGp1UmgxSEgxYXhZV0tHTHZXaW9IWkgweGNxN1pZaGRIdkNVVGZ4?=
 =?utf-8?B?b1E0aExqSWlxMzBvTUxGK2E1NndseC8zcGNSRXV4VjQvWXNrN01HRTRxVnFk?=
 =?utf-8?B?ck44bWRWUjk3OG1MWTB5MTFtblNhcW9sQXVoU2Nlemc3ZFJKNm5ZRDh4dDFQ?=
 =?utf-8?B?YnFKL1BobTdYd21lRGl0NmxiREVtTmFsK0swNGZXZk1PZGN0bngxbkRLNFRO?=
 =?utf-8?B?OTBFSXhaMHVFWXowd004QkVkV2lvRjBUM2pCTzdtVWpQcWtENWlsdFlIYjEv?=
 =?utf-8?B?UWFDSVVYQkNrUVYvNHNDZk5zMndSVE5wWG13Y1R5YzdzdUNIOGtuc3Q2aDNk?=
 =?utf-8?B?dGc2cWFJVGZ6OFY5N3RnWm9lTFZEcm8xL1pGY3R0V1dBeFEzU3ZSYktBbnJ4?=
 =?utf-8?B?S1MwT1FxRTNFd1ZabE9MUExzQ2RYcE9BWVUwK0w0aThIdDFMQkJYV2draFRS?=
 =?utf-8?B?Ukp5bHRVd3RqM0prR0hWSFk1Z3RlQUJkWVJ0dWNnK3hzaTZFbXhrU1BkNWpX?=
 =?utf-8?B?amJHdGEyUzdJV3pDY1dsalZEL3pHaWJHUG1KeDRDUUs2UHc3N3dJMzBhcmlO?=
 =?utf-8?B?bjZRbDhpajJGbnR2ZHBla2hwSjRKcjE4VSs2WG95MEVKWWtrK05WM1FDci9k?=
 =?utf-8?B?bytScWE3WFlOQlE1aDFoMzV2aUVGNXMzQzNmc09laGJ2bnBlZ1g2ZUdySmk1?=
 =?utf-8?B?eUJEYUtXUjU0L3NpN0tCRW1rWGhFVENIVncxTGhmcFM4Ly9ZUnZzOUdrclJ2?=
 =?utf-8?B?QUdaQUdabmpCMkdQU2U2NmQwbzUxQmhjZ0g5L1NCbG0xN1hBQ3hpZFlpenlD?=
 =?utf-8?B?ZFQrTnRENitNSDFhQWI3SnlQK1Y0UHVsOGY4MDUrNXA4NDhJckR0WUpSUEVX?=
 =?utf-8?B?TVhoL2IwbVVmNCthcHV4WDJ0U1Y5clM3TllXSU1JbXlLL0JFQTJQNnZXbFVE?=
 =?utf-8?B?YmViZTVtcldsRzlvNktlUFFwV3VGQnBUL0lON0pVV3NJcU1jTE9vMWpzbUQ3?=
 =?utf-8?B?NWJDcFZhZTVEc0RkaHFIckRnVnJpOTFoSGJWVnNhZk9NNzlIeTl3bk5valRM?=
 =?utf-8?B?WlNpM291Q2ZURTNKYzVOQ25zYTYrU0dmRERQVnUwWjZNSno1MjdJeTVXVFNP?=
 =?utf-8?B?dkF6RkVPWUowczZ3MTJ0MDFKc0wxa3NOOTl0Tmx3RnpNaFBLY3pxWjlqVDF2?=
 =?utf-8?B?bDVycSs2ZCtjakJZQURTQWc1aldQVk94UUVEcHBSYXMxNytDTFBGRWVsdWVU?=
 =?utf-8?B?THkvVnBzMzdDVXNHL3ovZmlEMHN6SE9GMXppSVpCQXdTcXRwc3JnVUZTRjZK?=
 =?utf-8?B?NmRXcTcxa0UveUQxTFM0eWRWSGdhQUpLeWZRMUYxSktWelNCa1d1MmNwSnov?=
 =?utf-8?B?amtmOGd1UWFFcWRFSmQ3N0l4SzdQRHdLbCtOR3dOTU8rRmI5dlpDZCs3TzA2?=
 =?utf-8?B?a0xsQU1DSWQ5dkhIckRyOE9iQUdleU4xY2gvWmZZR012RmZhODczaWZqUGto?=
 =?utf-8?B?NTdkVjNuMDlzdmd6dExPQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWRhditJUW5pMGxTV2kzL0RFcm5xVUdZUDROcCtQeWRBQWVlcFJUbG95c2Fr?=
 =?utf-8?B?cmp2emxoQ1N3SXRJNnlkc1hMTFJvZXAvWUFyRkI0NmV1MzArc04rQk5mTmJF?=
 =?utf-8?B?ZE8va1VXOXh3Q2dCaHRCTFl2akxhTXgwcUJmNGpUWUt0MU1Ib0RoOXpIWkwv?=
 =?utf-8?B?ckh3OFUwcE5xbUFuOVBVSHBKeklXbUxHbmduZHVUQ2MzcStRMDcxeEp3Q0Z2?=
 =?utf-8?B?QldrZ0NvOERYUmc3Tk84QTRmTDZyeFVCTG5wVEZMdDlaMG9JVXJwdWxLWFdK?=
 =?utf-8?B?T0FnM3NMK0J2dk92b0JGY3B6elR3ejJ3LzNXQ01aRlUydjJ4enpFanY0NmZh?=
 =?utf-8?B?NTF4KzRjRThSS0x3N2ljK1A3bFNDTWI3dkExL0dpNkxCNE1pNlBsSXFzWDYw?=
 =?utf-8?B?Y1RvNkw2U3FJRUxnMk9LR3hhcURMUG9ydWM2cnpmWm1rTzBlSXYvWnRnVXNt?=
 =?utf-8?B?OEJwYkVYTFI0Q3ZubDI1SEpONEF1K0Q2V1JTZGtkN0w0VVVKZTB0QVdrdU5r?=
 =?utf-8?B?UTZVTWhiQzVMY09jRzhoeTJJRkxLZFZnSTArL3dyYkFnVW9aYTg4TWtYeER6?=
 =?utf-8?B?QWRIUU9BcXRPbVNPY3NWMno4QWxsVlVGZ0dvUFBvTTVzamxmd1FmY1JKcSta?=
 =?utf-8?B?V1gyQnFCVklNdmYyQ2ZncWxuMjQ3ZW5rQXVJeXgxeWpEM2ZOdGt0N1lKQ1RK?=
 =?utf-8?B?OXVqa3lJcjBXbnd2WUUxTWF4REZzaCs1eG1oUThUeVVJYmNNR2UyV0Erekh4?=
 =?utf-8?B?SDJKUFN4bGpBa2g5S2oyV25CajYwTytRTFhGVU9HVmRMU3I3WGdHeU1iQ09F?=
 =?utf-8?B?WkxvVnVZTjVvdmlCalQvWE5rd09laXFJR1dIRzhWK2k0dng2MDFEL0dUWE1L?=
 =?utf-8?B?NS83WWFyNlRFdDhFdDdHTzE2QXFOenozUmM4MTdhRko1WVpvQ2srTm52bHR4?=
 =?utf-8?B?b3l0NGU3anE0bHRVeFovN1BEem5FTWpZRDlxMkQ3ajZtRGR5YWs1b25KazQv?=
 =?utf-8?B?MDk4RzdPVFZhOUJpbFMyYmtydE9melNZYTUvK3ZxN0czdFp1QkNQT1VIOTA0?=
 =?utf-8?B?dnJ6MTBENkI3VENDbEVOSm93VEN5QWVZVERLR0xSN0J2b0dZbE1XSnYwa3hn?=
 =?utf-8?B?bEV4ZkZRME5WU1l6dlIxMTJkUVpBdmlydktnVDJrOEd2ejJlbHVRUjAwR2hq?=
 =?utf-8?B?a1pBTW1DMGJza0N4aWZmdFNCNHhrWjhpcVdML2ZkRDFKd2IraHF0bUxPaHBO?=
 =?utf-8?B?U3c2dXo1dEtRRTBKLzF2ODkrWlpXWUVIbmtEcllHcEVjRUY3b3JlTjYrcHpu?=
 =?utf-8?B?cGplZ2YydG01NFczSElodXViaFRiY254NnZzc01XaGdJVHJrVTB6aDhzZytm?=
 =?utf-8?B?RmcwdGI4MmJmaTNXVnlyZ1FlS0M1OG1kV3FrSFFvNEZVUXUwL0ViYmJLdEhN?=
 =?utf-8?B?NldIRnZadWpTbENNbWlNVGZaTzFjWGtYVG1WZUdmMW9oNEUrVXNrdmp3NCtm?=
 =?utf-8?B?VnczaElsWmVvMXFBRCt1aEpjZmsra1Znc1h6MlNFbkNUZEw1dmxqUlBjNVJk?=
 =?utf-8?B?NzFvWFNUdzJiTVUyUjJzYTZONXEvSGltdTR4MVlUdyt3MC9UUjVMUTlyejFR?=
 =?utf-8?B?dldUWGRRZ1pHQ2swNzY3b0FmclZNdUZzcU1ZN1dJZHFQODlKOWw3UE1rSjVL?=
 =?utf-8?B?QU1xOHhRNTJ4SmFqeEN1SC8zVEMrZENzSHJUVW82SER1aXVGcE1zZldXNHd6?=
 =?utf-8?B?UHBlNEpDcnBFbEU4OTVZWC84TlRnb09HMGlQV3NheGZwWHF0NkJ4aU5ReEhD?=
 =?utf-8?B?VitTWnZPdS9ralVhL0hyS0NtRlRYWHlDdFk3Z1lKeXpJWHhHdUlMNUowbzVr?=
 =?utf-8?B?ZVkwM3FUcUN0Q0RteDh0MmVvYm1GaElDOUxaZ25PQWZ1ekFobkYyOGZ6TklO?=
 =?utf-8?B?c2laTHdVZlRYSlFPdVlKYzY5Q2lpU0NRS1NMdm5sa2NSUCtnM3ZjbDN2Vlp5?=
 =?utf-8?B?Y3dkZkVZYzFSdjM0M1BwbFFscDNiMENmdVRYOWF3UFJoTXFod2NvQy9YeVVV?=
 =?utf-8?B?ejA4UDQrWGZ4cDRLL1BWVlpuWDI5OS91MnBGUG5NSU8rMTRremEzWVlaUWhU?=
 =?utf-8?B?VGFFdms5SXhVeFM2Y3NQK2xYSGZRMit0ZmdPTUJPL0hCeTFzbFd6a1FaRklu?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e91b3b-c879-44de-611c-08dd70e5a6a1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:23:00.5454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQdZi0Vp9W0JVHNRR3a8CnXg9M+ADFjhXs3/MLEtk+7fPJ0ui5UFKYzBT5qOoAWiRPRwr2hQKlm+qH9JkizIow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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

On 28-03-2025 02:27 pm, Jeevan B wrote:
> Instead of checking only the current modes, find a combination of
> modes in the MST topology that can be accommodated within the
> available link bandwidth.
>
> v2: move fit_modes_in_bw to lib/igt_kms (Swati)
>
> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
Use "closes" tag.
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c                           | 23 +++++++++++++++++++++++
>   lib/igt_kms.h                           |  1 +
>   tests/intel/kms_dp_link_training.c      | 24 +-----------------------
>   tests/intel/kms_dp_linktrain_fallback.c | 18 +-----------------
>   tests/kms_display_modes.c               |  4 ++++
>   5 files changed, 30 insertions(+), 40 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99c8707c7..ce2a557b3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5046,6 +5046,29 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
>   	return __override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, 0);
>   }
>   
> +/*
> + * fit_modes_in_bw :
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Tries atomic TEST_ONLY commit; if it fails, overrides
> + * output modes to fit bandwidth.
> + */
> +bool fit_modes_in_bw(igt_display_t *display)
> +{
> +	bool found;
> +	int ret;
> +
> +	ret = igt_display_try_commit_atomic(display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret != 0) {
> +		found = igt_override_all_active_output_modes_to_fit_bw(display);
> +		igt_require_f(found,
> +			      "No valid mode combo found for modeset\n");
> +	}
Add a \n.
> +	return true;
> +}
> +
>   /**
>    * igt_pipe_refresh:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0381c82ad..fe01eaf3f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1226,6 +1226,7 @@ void igt_require_pipe(igt_display_t *display,
>   void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
>   bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
> +bool fit_modes_in_bw(igt_display_t *display);
>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
> diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
> index 9e9b1e6db..9b6248c6f 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -140,28 +140,6 @@ static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
>   	}
>   }
>   
> -/*
> - * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
> - * output modes to fit bandwidth.
> - */
> -static bool fit_modes_in_bw(data_t *data)
> -{
> -	int ret;
> -
> -	ret = igt_display_try_commit_atomic(&data->display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> -					    NULL);
> -	if (ret != 0) {
> -		bool found;
> -
> -		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> -		igt_require_f(found, "No valid mode combo found for modeset\n");
> -	}
> -
> -	return true;
> -}
> -
>   static void do_modeset(data_t *data, bool mst)
>   {
>   	uint32_t master_pipes_mask = 0;
> @@ -204,7 +182,7 @@ static void do_modeset(data_t *data, bool mst)
>   						  "Unable to assign pipes for outputs\n");
>   
>   	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
> -	fit_modes_in_bw(data);
> +	fit_modes_in_bw(&data->display);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
>   
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 6a872efd2..64f21ec6f 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -151,22 +151,6 @@ static void set_connector_link_status_good(data_t *data, igt_output_t *outputs[]
>   							  DRM_MODE_LINK_STATUS_GOOD);
>   }
>   
> -static bool fit_modes_in_bw(data_t *data)
> -{
> -	bool found;
> -	int ret;
> -
> -	ret = igt_display_try_commit_atomic(&data->display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -	if (ret != 0) {
> -		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> -		igt_require_f(found,
> -			      "No valid mode combo found for modeset\n");
> -	}
> -	return true;
> -}
> -
>   static bool validate_modeset_for_outputs(data_t *data,
>   					igt_output_t *outputs[],
>   					int *output_count,
> @@ -176,7 +160,7 @@ static bool validate_modeset_for_outputs(data_t *data,
>   {
>   	igt_require_f(*output_count > 0, "Require at least 1 output\n");
>   	setup_pipe_on_outputs(data, outputs, output_count);
> -	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
> +	igt_assert_f(fit_modes_in_bw(&data->display), "Unable to fit modes in bw\n");
>   	setup_modeset_on_outputs(data, outputs,
>   				 output_count,
>   				 mode, fb, primary);
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 588820170..f2bbfafe2 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -93,6 +93,8 @@ static void run_extendedmode_basic(data_t *data,
>   	mode[0] = igt_output_get_mode(output1);
>   	mode[1] = igt_output_get_mode(output2);
>   
> +	igt_assert(fit_modes_in_bw(display));
Do we need this assert here? Shouldn't this come only before commit?
> +
>   	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
>   	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
>   
> @@ -138,6 +140,7 @@ static void run_extendedmode_basic(data_t *data,
>   	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   
> +	igt_assert(fit_modes_in_bw(display));
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
> @@ -158,6 +161,7 @@ static void run_extendedmode_basic(data_t *data,
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
>   	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_assert(fit_modes_in_bw(display));
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	/*Compare CRC*/

