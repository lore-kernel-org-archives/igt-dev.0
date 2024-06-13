Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EECC27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 23:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98C910E19E;
	Thu, 13 Jun 2024 23:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZST2Nwxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3C710E19E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718321227; x=1749857227;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4xcI1IMIvIVrADTBekA2SVrkSAxxxLQ1fp/CJ0IKgZM=;
 b=ZST2Nwxa1ERlGxblVG9/oGXH6m/mJBvTA9lWNflS1QvNRG0dJWyKi679
 GaUof1wmtJdK6D3KTs/pNv/FBTLFyqQuFpcMtjGpGMdgn51h2h7YxsbiL
 86izK+aj3v0e1eQzgMvByGvAhwtoyWt1zB9iXO+p/luSPFEzcyzOK7X9y
 jETErk4iarl1ZHeqZZzfv9llC7vHt+qreY6a2m33+b1+4R2jVOCpfPytB
 7ab5Q5kqYCxhyEHrbQRsGCGvMS8YRj2I4sfMlrXB/ap7ni3T9p4DCFv6f
 ozyRysKRx8Y9MMWo6ecZzbHT5MnEDGdk8Cmt6msI8lRQurgGKRhoXegg7 g==;
X-CSE-ConnectionGUID: DNKFEFXUSLO51PRS3Rsv0w==
X-CSE-MsgGUID: m8Ei2/ArTniAF73zrdzglw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25863390"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="25863390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 16:27:06 -0700
X-CSE-ConnectionGUID: u4NxAD+uRemBDyxhygU+8Q==
X-CSE-MsgGUID: YF133QyxRmGvtVWwIWfuBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="45445982"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 16:27:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 16:27:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 16:27:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 16:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu0YWGCYUzD4uAcPfvGk/gg23peXvsHPjSmt9R954Sk/vpUBvR40u0ootrwlcJAX+9FVjoy+1II/VleqYMNcNPJLt84FeNfBQuFlltOWddBahLfCUofDby6899QVubfYZSG9Tkb4fw2bJEKMFvvF3VEFsV/62Jv1rY0+TtbZavsxW2XP5NYPv7yQ7jboIj4QTcotqF/tcff4wWYVrzLz6pDN6EuS0B4pSiDz5oVwyjmNPHaj41tIvVW9iiOtcRYiUdy4Ut/sxy9O5lNEB4U1RFAXDoTVFU5pMgnovobEpyPj2QZSjUL6Nsh9oQWiilfwsJOqRCi8CMDjOK+DtM9TDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ih3tijbCmS0+WY2UMeX0B/j5TpxT3rjF5Gwwf2MqSqM=;
 b=BuZsHmXSNRTI57VPDVQErjJF1KqJCqlLrkpYHmnSpKsujt1zht5laAUZRft8vw/73tP6nDnxM8L4IZ5TXXhnKzxDbb16PRLq4tPB8JpMklA1luKyumoEh6WI1l79fWDh93E3yPCJx6NUI1A53fTxHCncnAmFpsaynUnCstdmECI3yrJb224R/XuoolAF2s9aX1gzvUiqw+b+aAPGqS/CxqXURN/kIAYrLhBraF91tWJzqJ/6s51P0JOhy99QG1QRRS5jo4zM0ZDJWlZQHHBzx3RGfElfxPDT5DPjyLO8U5PbTRi2QbrSQblCp57FOV/r0lM/mbjUrsrCgfbEZc39UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 23:27:02 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.7677.024; Thu, 13 Jun 2024
 23:27:02 +0000
Message-ID: <ff98acc9-bdc3-48a5-8ac8-c620f7e1a055@intel.com>
Date: Thu, 13 Jun 2024 16:27:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel: Add xe_coredump test, v3.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240611101323.19444-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240611101323.19444-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: f0631b93-7d48-4122-b07a-08dc8c00547d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME44ZGtEQ1RzS1NvdzgrdWhIWTdLWlZ6dGRqTTJFallveldwbytYODdNdFVo?=
 =?utf-8?B?SVNDdUxMamtwdkR3ZDE3UXVOT1BhakRibWhqNHQvQUtCS3R2dytCR3lwc0gy?=
 =?utf-8?B?R0NUUmczb3dITDBlRjRXcmtjRExPOVlIUWVaR0xlM3U0V2MrWHZVV0VJb1c3?=
 =?utf-8?B?TURDTzdrcUVoaXd5clpFQzI2cWw4ejBoQlVlazYzOXpGdkE0ZlFCZ1c4b3E2?=
 =?utf-8?B?cWxHNnNWVlg1WDRFWll0Qjl1WEROV3d1YUNTVUFwb0NyUGp1cWJhU2ZGSXFE?=
 =?utf-8?B?Y1M1bVdudWhDQkVEdytuOGRsZnZHRDlZMWRmMUsrQmp2RlVIeWRBRDE1RzAr?=
 =?utf-8?B?bGNNb20rcktLRlVMc0c4ODFMeWU5VFY0aGR6ZTNSZStuV0tJYmZQb2UyNklE?=
 =?utf-8?B?c0RvMENMMkZaWmJNSmRaZi9aNVY1SzFsTE9GRldLYzlmcEh6S0JFNWJVTHFS?=
 =?utf-8?B?RW9JQ0d0WXJIN0sxR0pyWVVvSlRsVU5sYTRiVHJuZzcwbC9sS2FVdE82a1Ry?=
 =?utf-8?B?eThjbnJvYk1QbEE3VTdKQmg2S0Urc01oRlRJaUp1U2hHNThpUHVaWnJLZFRR?=
 =?utf-8?B?d2JFV1RWZE9mSXBTS210UW9jRUtIUDAzN1VSV2dDbFc4VWNRMkJHUFlERmto?=
 =?utf-8?B?UElYbXhibFVJa3RmN2NDNE83aFhNTHpxUXhkVm02WjdON05IUWZSWjJ5K2xn?=
 =?utf-8?B?QmV5NHIvanlrR3IwVW8zZlhOZlk1VWgvR0p4YkUrT0k1MEhLdlB0SFBxOUxC?=
 =?utf-8?B?L0FSRUlBSlFHMVcwK1oydG5CRGQ2eFM4dUwyWDJ0VDNiTGdCZ1hzeEQyQ2dw?=
 =?utf-8?B?TTBVWlVuUFp2eEpmVlBKWWFhSjJjSDlYM0hwbjJUaGVqcExuOGlIbUFYNWRx?=
 =?utf-8?B?MnRnTVhHbk1CakNQWkp5cDAzYUtNZVRmSTNIYnE2K3RiODlrSFEwOEtnSkxp?=
 =?utf-8?B?YzZXNHBzd013MVNDTkVPSm1GeGNBL0RyV1BzR1RhWDJVOWM1K25TdWpFaC9B?=
 =?utf-8?B?REhZYTFTdnY0cE1ySHpYQTRoT29WbWFLNThVZjBxdlRDRHlOWEZ0RVZOQjlT?=
 =?utf-8?B?Z0w0VXN1Tm9IYUh6ZkhmVnNVN3VwWm96MC9VSitpYTlMSTh5RVVrRHBWc0NI?=
 =?utf-8?B?cWVseSs3bDV4dUtLRDVFRzR3VW1CZ3paR3FXWGtnblpQTWtaN1Q5amRPZHlG?=
 =?utf-8?B?aFRHU3F4YlZaWDNvVmRpYmxJd0c2M3lxa0lhS3o5THpNVDdrUnQ2YjVndXBK?=
 =?utf-8?B?QjhSTHhTOXk5dFF3ajZyS1c0N2FQSW5zeUk1SC9tYk0wN3BzK1prbTFta3dJ?=
 =?utf-8?B?MGt1Y0Y1eHJBdFhpSGlsZjZDdzNJRW1JMm11cFhqT2Zrd0lsb2k0d1RoQzh0?=
 =?utf-8?B?aExta3d5SFR1YlZxRTNVMlExbFJCVmlUZ2ZUOGE4UUd6YTh0eXQ4a092dGJK?=
 =?utf-8?B?Tk95OGZZYmRKaTJ4dW82MDZSOVRRYm14Kzl5cDk4QUpQa0M3RkVIZTdFazZq?=
 =?utf-8?B?ckcvL0plM2hZbHVzeHVoa3lsMXhHOTNPYjhHdmxMZzVCcTJxeTVITFV2RlhY?=
 =?utf-8?B?VUNwaHVob3FFanlhMVBqSnF2RjRubnNNUmgyNng2aFAxbytFeXpFcVZtbVRQ?=
 =?utf-8?B?ZjRPZEVVeXN0d1FmRjJEeVoxbitpM2NxTkIzUlREVmpiUitkRXJNZW5Xbko1?=
 =?utf-8?Q?zfx6PWb1RMd8+AETqh89?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtxSlpNTVlEeWx4SGdhaUx3Snh0L1dHL2U4MnY4VGF4QjlpdVBkd2pMakp5?=
 =?utf-8?B?T2poYVpJZ2hIOGc3aE9DbUJoYm1kai9JYmVxOURzZmh5NDNLbTVESXVMMkVh?=
 =?utf-8?B?QmNzMjJBSUYxNitpdTQ5ZzJ1TmJaSC9PTWQ3djJBdCtPdjdiWXBXMTVRUncw?=
 =?utf-8?B?bVI1UGE3ZWdLL2RmMy85Y1ZIL3Q5MHd1elM4SmlUWU50K3dJNllIM1h6UDh1?=
 =?utf-8?B?SXV3ZVI1ekhReXRnSUFzWWJVQk5yQ1dPSDdkeGp4QTVSb1QyMjI5QU9ERWdu?=
 =?utf-8?B?bS81aU84WE1KSnpON1NDRUNtMU02YlBsNWJ3TkRDaTBrNWJKMzcvS3pnKzhO?=
 =?utf-8?B?OG9RcTJ3d3lsQi9tUVpGQUYxeVNEOUlKc3J3cDlpY0VFdWp5Uld5S3JzQzNN?=
 =?utf-8?B?NmFPSUpndWxNTkh2cGN5QnBqS0VoeWFnNVBRZERDc2dwQklUYWlFd0JFRUo3?=
 =?utf-8?B?aHBjRURaK2hiRittczVlQ3RyVi9MTk1jcFljajcxcStyMVdNcGw5QXg3c3h4?=
 =?utf-8?B?Y3JHMEptYkdjekNxTkY2d2VGL2VyVE1LNWtDUmdiKy9uUnRMSEZ6alg5a3Bl?=
 =?utf-8?B?bys3bGV6YTR6ZzNPRjBSN3N6M1RNZHVJYy9wTzVmVDY3MEFOcDRVRm1EZ3Fa?=
 =?utf-8?B?clphWW5lN3BReHFvd0s1eTZJTEFsOWx0R0x3dS9QbnFyQTRNaHozL2hhZk03?=
 =?utf-8?B?eFhPR1VSZjlGZStHVTFkK1dCSFJlUVNDYzlLR1VQNTBBL0ZmeFJRRWhXNzFt?=
 =?utf-8?B?Y0xySmliZHAySlA5UVFtU3dwUGpzdXRNN09BWmV2WWV5NE9TWGdiTHUrTDhw?=
 =?utf-8?B?c0Z2bDVlclVnZ3VNQ1llMEpZUjhjOUdHbmJ3bmxYWkZ3dW93NE5lZS9YV0NJ?=
 =?utf-8?B?TytlUUNWTm5CR0YvRzlpZVlPNU5yTGlGS0pxcEp3aEhXaHRTVjRKakEzUWUy?=
 =?utf-8?B?ckFCa2xaNDVPTDc4SktsSVBaZmdYV2xUblRrMTNHL3padVVEWldDUVZ6UDZr?=
 =?utf-8?B?TkJ0ckh0c0poKzY4VkFFbC8rREdHNWxUeFl0RGhKbmdkS1ZkWjJZMTNRQlJU?=
 =?utf-8?B?YmdQUm84RitVbG9XZG9Xa2ZPMEEyVHhRVUY0cFIxbEsybjdod21oaXN0NVFZ?=
 =?utf-8?B?S1dwMVF3Snp3Y2lza3hCWnB5R2RFeisrQXdtMWZUUGZKVy9qV0VaWHRnSHQ1?=
 =?utf-8?B?NmZpb2YzWkUvRy8zUW5NanNhWGpJVnZZSm1zYVRsZ3NaeUp3ajVTQUxwblcy?=
 =?utf-8?B?VkZPdTQwRGwwdzlBb01MdkU5R1JxZUJiNW9Oa3lsOVlJYnh2NHVPTHFFZ3Z5?=
 =?utf-8?B?SnlFQ1hOVDhpTmozRVV5djNOSWpJek95V1MrOUVhZ3R1MlVWSkJ2NFBKS2ZE?=
 =?utf-8?B?K3VWdjJLQS8rS2JWZ2RTZjE0WGNTbGNacU11a25rTVpKa0U5T09yakdCNlhi?=
 =?utf-8?B?b2x0bmNyTTIxV1paSXNzem4zbGlnZUFpaE05c2VpK1ZJNGlOdWJsc0xnWW1u?=
 =?utf-8?B?czdTUVFBbGNFM2NNS3hZVFJvemJGRVNYa3RMMzA5ellzaTlmVjRVSmlmY3dD?=
 =?utf-8?B?eWJQWVhQcktkeitJSnRUZUlOM0hZcUUvdXlOV3lHbkFFZHFudlhhNm4xY2xn?=
 =?utf-8?B?aU1kN2R6SHU0N0dQNUlFVmR4NEIvcjJUZXRhVGQwM096L09Sb1FSRGk1Z3Av?=
 =?utf-8?B?aXI1aElSdVNWWnJVTnViRFV4TkEzL3ZUWWRHYi9KOGZueGExZkpPdXpra0Mx?=
 =?utf-8?B?eWhGT3gyaDRkL0hQZUo1VkNEWVZxSWRpWVlwQWt4V3l1VkpGemhjK2RVQWh1?=
 =?utf-8?B?NnY0TFR3S3lyYTVuczJuYmhMYkkxTHhaRDMvR2hLays2a24rRjFZWTlPNjNM?=
 =?utf-8?B?VzhpOU9MMXBHSXJhTjlMSjR2eWlEeGZDc3k2RmRnQlJyZW93R0NtQkNXZDJs?=
 =?utf-8?B?RGtiOTNnc2poeXVBUFlTSXJmM29ZaThyZWVQTG5mK2krWnRpdFNUWHRYbHo4?=
 =?utf-8?B?ZHZCQ3h2MUNJR3RhZWxpQXZJcE9meWRaVXhyMWFJRmNkNTJiTitlYXFob1RO?=
 =?utf-8?B?dEhnTitKSS9YRHdyenB2MjNpRVZMQm8yYUtza2svWTY1YWpGRXQ4ZkYyTk5Q?=
 =?utf-8?B?NDhVUWxIUFlZejJrcWlSWnZUbXRhSTV0c2pwajU1RzNpbUdSRWxxb1FpWERP?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0631b93-7d48-4122-b07a-08dc8c00547d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 23:27:02.5972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8f8MwE/BjM4GRNJk5ZTrVs3x9ImZfV3GZZtvypVu69h0YHnL8t/VpOq80QAU8acOfHaGZIEuOEYCSM2CKoO/7QcMM5NgUrPLm48hMSeqvc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
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

On 6/11/2024 03:13, Maarten Lankhorst wrote:
> Add a simple test that forces a GPU hang and then reads the resulting
> devcoredump file. Map a single userptr and BO, and dump the contents of
> those.
It would be useful to add a more memory intensive test as well. I 
believe the i915 version has a sub-test which allocates the entire LMEM 
of a discrete card or something like half the SMEM of an integrated and 
verifies that it all comes out in the error capture.

While that extreme memory usage may not be especially common, it is a 
quite common debug tool to enable capture of all an OpenGL app's buffers 
to allow replay of the batch later. And that can be significant memory 
usage - 100MBs+. So it would be good to have a test which verifies such 
large buffers and large quantities of buffers can be captured and returned.

John.

>
> Changes since v1:
> - Almost completely rewrite test for readability, based on feedback.
> Changes since v2:
> - Remove retrying opening fd, 1s wait was missing and test passed without.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   tests/intel/xe_coredump.c | 251 ++++++++++++++++++++++++++++++++++++++
>   tests/meson.build         |   1 +
>   2 files changed, 252 insertions(+)
>   create mode 100644 tests/intel/xe_coredump.c
>
> diff --git a/tests/intel/xe_coredump.c b/tests/intel/xe_coredump.c
> new file mode 100644
> index 000000000..938b718db
> --- /dev/null
> +++ b/tests/intel/xe_coredump.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: Check devcoredump functionality
> + * Category: Software building block
> + * Sub-category: devcoredump
> + * Run type: BAT
> + * Functionality: Error dumping and readout.
> + */
> +
> +#include <unistd.h>
> +#include <fcntl.h>
> +#include <glob.h>
> +#include <string.h>
> +#include <wchar.h>
> +#include <sys/stat.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_io.h"
> +#include "igt_syncobj.h"
> +#include "igt_sysfs.h"
> +
> +#include "intel_pat.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#ifndef DRM_XE_VM_BIND_FLAG_DUMPABLE
> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE (1<<3)
> +#endif
> +
> +static struct xe_device *xe;
> +static uint32_t batch_bo;
> +static uint32_t *batch;
> +static void *userptr;
> +static uint32_t vm;
> +static int sysfd;
> +
> +#define MAX_N_ENGINES 32
> +
> +static void tryclear_hang(void)
> +{
> +	int fd = openat(sysfd, "devcoredump/data", O_RDWR);
> +	char buf[256];
> +
> +	if (fd < 0)
> +		return;
> +
> +	while (read(fd, buf, sizeof(buf)) > 0)
> +		{ }
> +	write(fd, "1", 1);
> +	close(fd);
> +}
> +
> +/*
> + * Helper to read and clear devcore.  We want to read it completely to ensure
> + * we catch any kernel side regressions like:
> + * https://gitlab.freedesktop.org/drm/msm/-/issues/20
> + */
> +static void
> +read_and_clear_hang(void)
> +{
> +	char buf[0x1000];
> +	int fd = openat(sysfd, "devcoredump/data", O_RDWR);
> +	igt_assert(fd >= 0);
> +
> +	/*
> +	 * We want to read the entire file but we can throw away the
> +	 * contents.. we just want to make sure that we exercise the
> +	 * kernel side codepaths hit when reading the devcore from
> +	 * sysfs
> +	 */
> +	igt_debug("---- begin coredump ----\n");
> +	while (1) {
> +		ssize_t ret;
> +
> +		ret = igt_readn(fd, buf, sizeof(buf) - 1);
> +		igt_assert(ret >= 0);
> +		if (ret == 0)
> +			break;
> +		buf[ret] = '\0';
> +		igt_debug("%s", buf);
> +	}
> +
> +	igt_debug("---- end coredump ----\n");
> +
> +	/* Clear the devcore: */
> +	igt_writen(fd, "1", 1);
> +
> +	close(fd);
> +}
> +
> +static void free_execqueue(void)
> +{
> +	int fd = xe->fd;
> +	xe_vm_destroy(fd, vm);
> +	vm = 0;
> +	gem_close(fd, batch_bo);
> +	munmap(batch, xe->default_alignment);
> +	munmap(userptr, xe->default_alignment);
> +	batch = userptr = NULL;
> +}
> +
> +static void recreate_execqueue(bool dumpable)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_vm_bind_op bind_ops[2] = { };
> +	int fd = xe->fd;
> +	uint32_t *ptr;
> +	uint64_t offset = xe->default_alignment - 4;
> +
> +	tryclear_hang();
> +
> +	if (vm)
> +		free_execqueue();
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	batch_bo = xe_bo_create(fd, vm, xe->default_alignment, system_memory(fd), 0);
> +	ptr = batch = xe_bo_map(xe->fd, batch_bo, xe->default_alignment);
> +
> +	memset(batch, 0, xe->default_alignment);
> +	*(ptr++) = MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_GTE_SDD;
> +	*(ptr++) = 1;
> +	*(ptr++) = offset >> 32;
> +	*(ptr++) = offset;
> +	*(ptr++) = MI_BATCH_BUFFER_END;
> +
> +	userptr = mmap(0, xe->default_alignment, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	wmemset(userptr, 0xf1234567, xe->default_alignment / sizeof(wchar_t));
> +
> +	bind_ops[0].op = DRM_XE_VM_BIND_OP_MAP;
> +	bind_ops[0].obj = batch_bo;
> +	bind_ops[0].addr = 0;
> +
> +	bind_ops[1].op = DRM_XE_VM_BIND_OP_MAP_USERPTR;
> +	bind_ops[1].userptr = (size_t)userptr;
> +	bind_ops[1].addr = 1ULL << 40ULL;
> +
> +	if (dumpable)
> +		bind_ops[0].flags = bind_ops[1].flags = DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +	bind_ops[0].range = bind_ops[1].range = xe->default_alignment;
> +	bind_ops[0].pat_index = bind_ops[1].pat_index = intel_get_pat_idx_wb(fd);
> +
> +	sync.handle = syncobj_create(fd, 0);
> +	xe_vm_bind_array(fd, vm, 0, bind_ops, ARRAY_SIZE(bind_ops), &sync, 1);
> +	syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
> +static uint32_t hang_engine(struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t engine;
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_create(xe->fd, 0),
> +	};
> +
> +	engine = xe_exec_queue_create(xe->fd, vm, hwe, 0);
> +	xe_exec_sync(xe->fd, engine, 0, &sync, 1);
> +
> +	return sync.handle;
> +}
> +
> +static void test_hang_one(void)
> +{
> +	uint32_t syncobj = hang_engine(&xe_engine(xe->fd, 0)->instance);
> +
> +	syncobj_wait(xe->fd, &syncobj, 1, INT64_MAX, 0, NULL);
> +	syncobj_destroy(xe->fd, syncobj);
> +
> +	read_and_clear_hang();
> +}
> +
> +/**
> + * SUBTEST: basic
> + * Description: Read out a full dumped VM.
> + * Test category: functionality test
> + */
> +static void basic(void)
> +{
> +	recreate_execqueue(true);
> +	test_hang_one();
> +}
> +
> +/**
> + * SUBTEST: empty-vm
> + * Description: Create an error dump without anything in VM to dump.
> + * Test category: functionality test
> + */
> +static void empty_vm(void)
> +{
> +	recreate_execqueue(false);
> +	test_hang_one();
> +}
> +
> +/**
> + * SUBTEST: all-simultaneously
> + * Description: Hang all engines at the same time, read out the dump.
> + * Test category: robustness test
> + */
> +static void all_simultaneously(void)
> +{
> +	uint32_t syncobj[MAX_N_ENGINES], i = 0;
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	recreate_execqueue(true);
> +	xe_for_each_engine(xe->fd, hwe)
> +		syncobj[i++] = hang_engine(hwe);
> +
> +	syncobj_wait(xe->fd, syncobj, i, INT64_MAX, 0, NULL);
> +	while (i--)
> +		syncobj_destroy(xe->fd, syncobj[i]);
> +
> +	read_and_clear_hang();
> +}
> +
> +igt_main
> +{
> +	igt_fixture {
> +		struct stat stat;
> +		int fd = drm_open_driver_render(DRIVER_XE);
> +		char str[256];
> +		xe = xe_device_get(fd);
> +
> +		igt_assert_eq(fstat(fd, &stat), 0);
> +		sprintf(str, "/sys/dev/char/%ld:%ld/device", stat.st_rdev >> 8, stat.st_rdev & 0xff);
> +		sysfd = open(str, O_DIRECTORY);
> +		igt_assert(sysfd >= 0);
> +	}
> +
> +	igt_describe("Test that hw fault coredump readout works");
> +	igt_subtest("basic")
> +		basic();
> +
> +	igt_describe("Hang all engines simultaneously");
> +	igt_subtest("all-simultaneously")
> +		all_simultaneously();
> +
> +	igt_describe("Ensure that snapshot works without anything to capture");
> +	igt_subtest("empty-vm")
> +		empty_vm();
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..f611e2e2c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -280,6 +280,7 @@ intel_xe_progs = [
>   	'xe_compute',
>   	'xe_compute_preempt',
>   	'xe_copy_basic',
> +	'xe_coredump',
>   	'xe_dma_buf_sync',
>   	'xe_debugfs',
>   	'xe_drm_fdinfo',

