Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F0E9B24E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 11:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CD010E29A;
	Tue, 24 Feb 2026 11:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvPA7boK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9134A10E29A
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 11:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771932176; x=1803468176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eOghzYdjkhQgmMdKBtc3nUrzl7t/iaSZUXgbsKMCCa4=;
 b=SvPA7boKh/Pi4JSn0+iY03FAKPXcVi4SwPQwfG+yu18WS35WhJ31NCVC
 yO9Q0KJ+ghvjEpLzqcxCxZ1+RxNipBhu3CyyHOB936sMNHFEgEJCtYZiv
 USNRrjhXvlHevlet5AwdwEVfBBp19XH3r8CVPITpl3r666qWTvve24C2W
 /sWzLuA7JPxuJDzvaE1/72sd0wkFe5RMBj1H/dn+SH+D4l5X7jDh8iLjH
 pKEYmiMICzYIh6zM+F5U4iWNS1znG6qX5xJ4dUTiBWRECSZQP91vebNuv
 F1pjfSG33RP+ZuXT4vSILRYxCTmk9UTeJcyzQOOHy5+pxdnOwHse6+U9e g==;
X-CSE-ConnectionGUID: LFKrDtuxQianfW1Lla3sUg==
X-CSE-MsgGUID: uf27YjLUSESwMpUl/xm3pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71974900"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="71974900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:22:55 -0800
X-CSE-ConnectionGUID: hXFC6bsBQSuykKegf9i6/Q==
X-CSE-MsgGUID: 9QZAnamVRBCJo9B+TJNeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215731938"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:22:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 03:22:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 03:22:54 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 03:22:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6LbwOR8YJ7EMQY7UuBqWMbUbTbK47mH0m/i95DsPtIBBJwBpIONajouuazZ0g+O4R9Aw0DhzyPaU2pG02bV8xL2j+ZQWCJVYi+lC0P4L6lxgam/vdLl+zA1C3NRSshplkE+QOQccQB6/UQn6HUS9U42w1Trja58UohQhhza7DB6+nErflQDGv+HxntooamkcMA6h97knpkoyb8OglxWEmdjr9psdUiwYYcd+J2ZFABtTtRZ0Y5NV7dH109uYY5980/soK69405gcqfuIjYyTyMjnWyJXHtMytnoLOfBw+uB6afpFZ/BF3N5AXkuubMrMgDhnvkmJo6kHyjpx/xLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUsyOzuVHeo7YOmLpI5gXAxKGPmbkxZxMkzMNk5ABro=;
 b=oLXOlcq9UraIE1DbGUyIj4jBcG41IOq/RpGrGCNRO/nmXWOZrpdvobTozTzCJR2XtWaUfXX3y3A/mdhq9gAYzOnSThnnSzva14CWIV9m8aD/zuWVehKwW/k0YxrA9/H0/h6YnJPEwgoi1a41lInM7+JDpqXjnd0qjc7FlCh+DBlFpew9CdUzLErhKTlYURt3eySGdYLBU4ETEJCW/9i0BRkLLKNT54TDThTh1gTfHbLk5LuopT9d2BCFSNyeNhW0mTdndcqmwpWg1I/MPjBQVgMj+uTSt1T3J9BrETRDdvV0voSJP9wrS+et7D0ZOef9gZroQJjfmpTk4DlKrpXy7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Tue, 24 Feb
 2026 11:22:44 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 11:22:43 +0000
Date: Tue, 24 Feb 2026 11:22:35 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 i-g-t 4/4] tools/lsgpu: drop cairo and switch to
 igt_core
Message-ID: <4msrf2peoyspr4cufsboijkg3q5mcqgd4x7dp5etnvngg3ngyy@ottoutssm3uf>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
 <15055a844dc91c0a37cd72f1de7609c47505d723.1771510028.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <15055a844dc91c0a37cd72f1de7609c47505d723.1771510028.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|MW3PR11MB4555:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c84ee3-9a72-4c06-063b-08de73970788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjlOakg0a09keGR4ejB3SVpVWTlpcjNPTkdFOFVlNGJ0LzZ1TU1KcDA2YTQ5?=
 =?utf-8?B?VUxYUzRKZ3pONzBtVlp1Rmhuck1zQUdpWlJyZ1V0RTl5cTYyaEhncUdQY2da?=
 =?utf-8?B?aG9Zb2U3QnRsd0I0UnNzK1pNSmdWWEJwT3pjbDhlNjYzcVBnREJwWlIwcElF?=
 =?utf-8?B?YlpLVStiTlNVZ3BlTnRVVVhja2F6R3ZKOHh3UXlqOTMxYUgzaXN4WVJ1SXlz?=
 =?utf-8?B?K2U4QzhibnhXUVJjM2Z2Z2x5VnpLQ0Urc216M0doR0p4TnY3TXIvOVVLS29R?=
 =?utf-8?B?QjJOdDYwb2tRemJINExLekJCeDMzWHl2NFYwU0crZDdQaTdEOFpGekZPNUpC?=
 =?utf-8?B?SDlvdTFGQzNUZ0E4YW8xaWJZWUUyUVVUUkxWSXM5Y1ZicXIvYWQ5OXRDZjMv?=
 =?utf-8?B?WXFZbEpkRGZIejA1R3MrNlBVRGVuNStjRzVXS081V2h5d2tJdG82cmE3MGRM?=
 =?utf-8?B?K1hpY05nVEdvT0RyK2t1RXM0Ly8xSWc0azl5c0kvSzlxcmpYclJHZzlvVU82?=
 =?utf-8?B?TmUxWmFIV3lSZlA0VWhLU2ZHRjYyT1p1d2dtNXlVSEZ6NDFRWTQySmNZaW9T?=
 =?utf-8?B?aERaOWhNaXZoeTN3SGsyRXNKMzFDYmdvekF3TDNna3NSci82Ni9EazlzZC90?=
 =?utf-8?B?dnd1K1FOVlE3OHNrTG9KY3VETVRIN2cwNERkMnlCTXlrdFd5Q3FYazUyYUkr?=
 =?utf-8?B?NjJtSDNCaUlrOU93WGVURHd6Wmc4SFpNeFlQY0RIM1A1cW9DdVlnOXpjQ1ow?=
 =?utf-8?B?UmxBOEoxeUtCdjB5UUcvdmRiQk9uRzZvdGh0QmxVRzV5Vy9tZmk3OXdCeHB3?=
 =?utf-8?B?RFFlUFBsN0JiT2hRMkJZemV5NkFyMFZMcTNHekhEREZjd3llSktxUWZ1UENN?=
 =?utf-8?B?b29zemFEd1dtaDB5ZXZ5akM2OVFrbTNVVHpyWWR2b2ZIZTNNODNXc1lRZlVM?=
 =?utf-8?B?eUgrUHRSdUluNjhXOHJSVWU5RXVRbHNLMXdZZzU0bHk0RTJQeHZiZzVWbTdI?=
 =?utf-8?B?dlZGc1VicVI1TWw5dG5yUWoyZk9ucWpYN1N6ckkxWDUzbytOcmJ4bDUwNTB2?=
 =?utf-8?B?WHNWRTc2cllTdTQrdHEyUitTSGlHQk0ybzBTSGN3UW5wQ3pDaEpSMDRlRjRR?=
 =?utf-8?B?K3pPUU12MzVWTCtGMml0c3l3QjNWVTlIcmxYbXhVYUNjRDNkL3RXZTBrRktw?=
 =?utf-8?B?ZDJORGhlN3ZsdzEreXczdEVzTHVvdVVjL2tGV2p5NVRQUFNTZ0x6bVlUTWg5?=
 =?utf-8?B?QUoraWVpUDRmSDZjVkRQU2NRZHZPd2RNVjByUGk0WVVTNFNYdlVrMFI0R0ZK?=
 =?utf-8?B?bGxGSVpnbUsvNDVMSEtiaWRqTzZkYmFRUGdUL21YRWEzSG1QWWtlNGJ5eWsx?=
 =?utf-8?B?SVAyTEVXWFFCeWEzVy9SaFUvU1NTM25yYU1RUTRuaktJeklYQ1Q5TjNnL0Fh?=
 =?utf-8?B?amFBak9taWFnUklsS0xRY0RpaEhxOGVQY241MU9mUFF4a3pLRHJJd1pKVWtB?=
 =?utf-8?B?V1RNem5uaG9lZTVnOXZPcXh1di9veVdnTnJVei9XQ0NQaTQxSEczSWJMNE5x?=
 =?utf-8?B?ZkFoMkFpbFhhc1NpQWpGNjY2TWE1c3o1YjlkOGVFRXh3RUp4UVgwS3FNeTB0?=
 =?utf-8?B?NnRScDZ4ckllOGpLUGFXMkJjSjlONnhsQVVrZzZIMkFzTG1pWXJ5WFl3NHN1?=
 =?utf-8?B?QmMzWGlleVdSbXgybmw5NGtxcTJvcXZJTFZlb1JPWlBya0xQODdZSHpwQmxH?=
 =?utf-8?B?ZGcrMVUxUnJmYUMyTjZhVThYblk0VHFKaDRidTJ4Q3JRbjk2eThkdWdsczJR?=
 =?utf-8?B?TDBBNWFVMkNHWW5mY1A3UTl2M1FFbzE3bjNwRDF4cHJ1bU5oMjJHeUVGdjl0?=
 =?utf-8?B?R1lsNUJHMVdBUjJDanlHRzhKNkttT0V2clZFM2xLR1d5MktqV2dsdXRucitn?=
 =?utf-8?B?N25mcitGR0dYSzFQQlF0MENyOGlxcmhLOFFpcGRIOUtLR1V5cThpZnlUUUpq?=
 =?utf-8?B?c0Zma3BEc0NEeDJyZWNvYzd1dENGb3RpNnM1eS82U0xEbjRqcy9LUC9YMlU2?=
 =?utf-8?B?Z2pQUGI3TGp1QWp6a2wrMHZmbDM5YXFDME5TNldsKzhEaC9IL2ZDOFkvbHdV?=
 =?utf-8?Q?BAck=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjZiMXRiU2pHRTlKY2xOdytocmJ4NlNISTBHQjdrQ21nU29vOEMzTHl4RnJ3?=
 =?utf-8?B?emRXbFB1d3Y0YWdMRnA3NXBrMVNHcGs2OUpOalZWSmJwcEdpdkJUcDhTWk1u?=
 =?utf-8?B?cDI0T3FPREVWQXNGdDZ6SGtoSmh3TmJZUndhRTJDaDhrTkNsKzdRRXdPNlhy?=
 =?utf-8?B?QW55cmordzBwaTlDckR5MEZZNWZrZnZnL0NNYXVnd2xLMFBEa3ZFa05IN0do?=
 =?utf-8?B?dmYzSjFEam1uOU4rMFlDSHhtOG9ZU0RKcWpMNXYxQ1l4K2xzbTBlVGRWcjk4?=
 =?utf-8?B?ajFiQXBUWnpUZEcyNmFWdFVkQytJNFd2ZnFNSUNjcWw0c3gxYlhkRXg3clZL?=
 =?utf-8?B?S2ZhK2JLNndNN2l1UEJzZVFJY0Mrd1BCOUNNTmhVby9xdWxPUndCYzZIZFEv?=
 =?utf-8?B?djluSmJhbWkxT0dTb2NKWHJDa1FGRnZTZk1wWm9qWUtDZmVZYjBiTEZHdy93?=
 =?utf-8?B?QzZoVmJhZ3k4VmZDa0cxekYydEFQbDM5Rm9ZRE5tM2VOUlI2SzBXQUJudlNy?=
 =?utf-8?B?RG50RkMxemVRRHJ6WlVTb2JyMG1Wb3N4Y0d3a0haNFNxRUZXRDVIY0pHZFJs?=
 =?utf-8?B?WFFrN3NZY1dFTjNDRkxWYVJJWHp6dU9TbVpyTjFQaEFDYi9kS3dzSDNaYm9N?=
 =?utf-8?B?TjNZcStTd3g3OTljd01yckM5T1BET3U4SS9veDdOcDdnSjZXY3RZWFlDRlIr?=
 =?utf-8?B?c3dnS2JnVmhiN0RGZ3YxWUJwaXJ4cEVsT3g2ZUszdHFFVldwU3hoV09EbkJE?=
 =?utf-8?B?a0xCQWNFb3h6Z0xkaGEzWmpCaVd4SFREdzhuZFZSN2NHbm1NWW05eVVDSDE3?=
 =?utf-8?B?MHMwRTVuQmgzQWI1Y2JySWFZWVJNdUl5NTFCejBHOW8vMFBiU0dIV05oUStw?=
 =?utf-8?B?QnBVaEF0bFBsQTBwWEZ2elRPdUNkK3IxUUJvUTNrczNESEx3ODZxYjRkSlNR?=
 =?utf-8?B?d3M3QmlSWHFXZjdWTjdIdmtHTWtMaVZCdTUvbHVzTnVkL3NwaHNMQjk2TkJO?=
 =?utf-8?B?Z0lTbTF6MVhnbzhUREpVajJCUFJtMkhrZjcwRHk0ODdHUUljMDc2V2FqUWdL?=
 =?utf-8?B?cTBGTWVZSGdUWkdSeGxTU0hyc0o4RXl1dXcvcUZ5aXdNcHNPem9UMFVvMWVS?=
 =?utf-8?B?VWRDbExVTlpRT2oweUI4UmVIQnlWaGd0UUJuQ1lhMEh3MFpORGpHNFFKZzlj?=
 =?utf-8?B?dTJZWnVsREo1aytyNURybkd4UUgzTG1kWnl4RGY4Q3Z5MlFWM3J4OSt1MWs0?=
 =?utf-8?B?VUZHRnkyUTF1ZitBZFlMTjlES1FZVkFPZWJYb3NDeW5jUWpiTUFqclNwOE5J?=
 =?utf-8?B?bTBHUzYzK1ZQaXFpaVdCcWpzWUNIYXV6NmIvNDluT0RWaEF3aUprbDR5akQ0?=
 =?utf-8?B?cytjeTM3UXRjaUFUZ0FKeUdFSVNOZ0hnaFV2QVgzaWtRU2pPSlFwR3NPeEN0?=
 =?utf-8?B?alluZDhvNXByc3EweDJsZllrM3VkN1RFdWdkSFhicjQwdGp1cnBhWnQ1ekFu?=
 =?utf-8?B?K1ZyNVh1UDMwczRKb3U4amNlT0hvakRFbklaR3BaaGdUTTFTWDdpdVpwL2c4?=
 =?utf-8?B?amxLK3pQYnRJNWdyMTVSSm9pZXAxMSs2RzNpakJub3RWcjVZVnhBMU13azRU?=
 =?utf-8?B?OVhvSHNnYzVTeFVPVEU5YmVjVGdFSC84LzRwazRsTWdKc3BWazRwNlhKQU0w?=
 =?utf-8?B?ZG9NNEtyVXR2Sy9ySFlSSHFQNGVvNmNhYVRlYjROWGtLRXYva1dTZitCa0E2?=
 =?utf-8?B?SWJFNnVXZHVvYkR6REIxTzRDd1ltcFU1YUlCOUdQeUtMNjFOeEZaeCtULzJ0?=
 =?utf-8?B?c2tid1A3OVp2VlVBbDVYYUV6QktrdDNZNlU2djA1eE9IdW5zVlpZSmZuMy90?=
 =?utf-8?B?SkFLeGRSc2VpWUpSQmIzaU5wcTFIY1htTEVzY0Q2Rm5GU0ZFWFZ3OXBLVFc5?=
 =?utf-8?B?clNmYXJnQ3gwbFYvaHZMTXBiM3NmeEN3clBBc2FQYU1WQjljNEVQMHN5V3RE?=
 =?utf-8?B?R1NjY3pLVFYzbTlEZThlVGpQQ0VydERjN2N4Tkthd3lOQllWeEhIdm5ySTlQ?=
 =?utf-8?B?anN5UUo4RlZRay9PQk9xZVJoZVgzYzRnV1V4WEZaZVU5N1N4L3RWaHVMUmE0?=
 =?utf-8?B?QVRtWlZTRjVmMEtXQiszZ0FNZGV3MGJ6cEpybHVKZFZEckhCcmFiRmVDMGFr?=
 =?utf-8?B?VXM3ZkhiRU0rUmNRSS8yVXdXT1p6SW9SbHoxMldmQ0kxblVXVWVCYVJmMWM0?=
 =?utf-8?B?a3RqSkRxcUhSNnIvVG4xVlN5MEdhd3NLYVJwY2c0b1B0QmxPTTlQUzNWeStG?=
 =?utf-8?B?cDlIYjZQV2lGVmRrSkszVHhKcmowVVp5V3ByeEVhSWplMmhVeExoZVFFdFFM?=
 =?utf-8?Q?UMoB8kbP8WYG1AUI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c84ee3-9a72-4c06-063b-08de73970788
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:22:43.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYtxKRbsS1o/t45Iud+8iN8dg2DPM6XSiJKA9SPpAy1KdoaSGES6ZjZrI4ttdd+XLUNyX3Sk6Af8F44LzS9DVL/LEUHOrj4NEMlQApLvKaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
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

Hi Sebastian,

On 2026-02-19 at 15:14:53 +0100, Sebastian Brzezinka wrote:
> Replace the full igt.h include with igt_core.h and link lsgpu against
> lib_core_igt.
> 
> This removes the cairo dependency and limits lsgpu to the minimal core
> IGT functionality required for device enumeration.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> 
> ---
> v2 -> v3:
> 	- add libpci to lsgpu
> ---
>  tools/lsgpu.c     | 3 +--
>  tools/meson.build | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index 935371dea..057a594ea 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -33,8 +33,7 @@
>  #include <string.h>
>  #include <signal.h>
>  #include <sys/ioctl.h>
> -
> -#include "igt.h"
> +#include "igt_core.h"
>  #include "igt_device_scan.h"
>  
>  /**
> diff --git a/tools/meson.build b/tools/meson.build
> index 0fc2427f9..903c0de0f 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -57,7 +57,7 @@ tools_progs = {
>  	'intel_tiling_detect': [tool_deps, cairo],
>  	'intel_vbt_decode': [tool_deps],
>  	'intel_watermark': [tool_deps],
> -	'lsgpu': [tool_deps, libudev, glib, cairo],
> +	'lsgpu': [lib_core_igt, libudev, glib, libpci],
>  }
>  
>  foreach prog, deps : tools_progs
> -- 
> 2.52.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
