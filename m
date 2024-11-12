Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28479D32D96
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 11:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9BD10E1F8;
	Tue, 12 Nov 2024 11:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2MNvYPe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A952C10E1F8
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731411722; x=1762947722;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=508zem9hrFFeabZrysLpS6EyE+78nF+qd89I0QC/j8Q=;
 b=F2MNvYPehV9BPjlDjddUQPMTUx1Hds5nk6DcTjeNvBOkDMdD6/jReWKi
 VZ9ZGElJXFrofIs6EcV9KZoUIRKAqDIV5qTU1G0oiLQi6WVOFv1SqjKRd
 8B31EtDaP14SCcC5jBhesI6Ysujgydw2/KGNbl05RPUJ15IbI+MLXkHlS
 4/DlTty377SaYHavUycV3iXchx8sbpulzJmyAcbohsAahXvQCPq9J9hxp
 B3ILleTyy+WIBn/MgdDmUJWp+BlWkFDz3pRsfOAC5qx97Jw5H7JkoYafH
 J5jkZ4YbsCQJu0GI5JTNhF4ZGLHnW3aDFYDsn2HIDa2n8w6IPW/t1FrdS Q==;
X-CSE-ConnectionGUID: zaDh85VaRCSbxSOJeHFL2w==
X-CSE-MsgGUID: dU++l7u2Q4mhUn9HLb7mUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31336728"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="31336728"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:42:02 -0800
X-CSE-ConnectionGUID: H/mDOBQyRJCOdsyGNVIbUw==
X-CSE-MsgGUID: LO1h2gskSSaQ4w02daHRUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87843082"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 03:42:02 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 03:42:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 03:42:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 03:42:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsNic4XdndxFpjzoGRwO0mpM1IxOHEnZo1Uv/xC+H9ySBwyo64FgX4pneLKRfyoR047ITMDT9tbu7n7VHo8GdyI1R79uSggy1aRFnuyuNpGXP4Jm+yQwM9/9ZoZKATgVVzl5no73gbH/razrKi220XNG1LGAnBIiwPqOc59SUv9Vdp1B87wZVGH6BIxh5+8wQW3f4XQa/bHMnIyiwJLOrmNGu2qtY+yl1QvE9USPpI1hTsGDaKhqa/kxvdAA8/AGuLgtsst6HGBBhCPBGP2sZdv7+Y8Jt13ZXcIRYKYo3MqQALVTOdqLoJwvjT+hFkMMguC+n1G3r2DxwUs4uJAxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu0xo56o3oC8WvJd3T00aNO5UevcqOk99SuMt86jkhM=;
 b=aFL1Fen5vixH8Xrq1D2VhECRZ6Hr4nnOiXmEc18cznTqXBhLlrlMCmNsgTL2AEgNaQ7SanMexbFMZ91EybYYi894yr0hIJjjOh45s4EzWqOzwNOQjeZBQ9RvHlXbsG/eThlR6RPG76XzvDRV6vLQnLxMBI43CFiFaDasMa/5PaiWFNJNLQNZ0+2KrU28Sc4qw0lKItLKnHN6MeGiPahcn5GDzBr03XkIke4Psesz1xxO4Qr4OB01xkc9djjr5+WmPo+rlW58iT37kSB3HQ/J7yAPxB4NIB9rKj/HzbfbE7QGQtf5P3B/lyJ9IY6vOJagNLQlrMppnm3Z7RU4L7MT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 11:41:58 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 11:41:58 +0000
Message-ID: <61a719fa-e017-4d5e-bb0d-2a50f297054a@intel.com>
Date: Tue, 12 Nov 2024 17:11:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: Add 6k resolution support for a single
 CRTC
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241111154635.1304517-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241111154635.1304517-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::35) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a60dca-434f-4480-48cb-08dd030f0415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkViSEJ2L3pBazJQc1RnSmluS0ZWaVdTUXZSaEt2M1Nua1RFR0IrOGFlWW9v?=
 =?utf-8?B?d3RNdzBWWWFuQ3ZyaDJ3YXdyQ3B5NHNRblNnOHFhT3czNE1vaEJuQ3VVNVVw?=
 =?utf-8?B?dzV5ME9Ob3dVWE1VNno0Y3A3Mi9TaXN2YlNablZ2ckJZajhrNmc3TDR6VW5i?=
 =?utf-8?B?ZThybjJZT1lIUGdZZHAzQXlSSzZVVXJhRUFPcmJ5dmwyWVJjSmdkeUlOb3lL?=
 =?utf-8?B?MEpCbFRBUVN5NWl4UTl2N3h0ZnJ2a2twVmhONnZ5bGxaa1FadHNib3NVK0po?=
 =?utf-8?B?WjJUNTkvMXVGT29PSlhad3J4NEdZQktwSnpwMzh1dnRsekpnRmxQSG9yQU8v?=
 =?utf-8?B?Q0RXZWVKMnhkOU5YYlRZYXQzZnlmbTVTMklCV1U4WjhSRHdvcFlSbWJ0Y3hK?=
 =?utf-8?B?bUQzYXpLZXBpKzlHTjQrdmZDTlB3MEcrby8vRG9OQ2tCZEJ5bFkvNmMxL21s?=
 =?utf-8?B?UzE3a3hGbUk3dmpSNCs1WjRtL3FCVEZ6VW4xSnA4TWJCTW50TVpFd3JTUDhp?=
 =?utf-8?B?VUVaL2lFMkQ3RzJDME9rQkM0Qk53NUhxSWRvV2ZoMEp1ODNPcnNlYnNNWnJP?=
 =?utf-8?B?Tmp0Wm51L2svN3hvNjE5Q2hOVW9oSWtsNGRMbTZLL1E2SGk2TjZYUnU2Nkph?=
 =?utf-8?B?R3A0ak9PdjlrUSt5VWZwMUFLQ0l4V0VNejVFbFZkY2ppWFdxeGdGRGRjbSt3?=
 =?utf-8?B?NDhsdGlFUXFTUk9qV1Q5NmRVWWFuZE1pcCthWTI4ZUxmN1NwdXNvU2NPcGVF?=
 =?utf-8?B?Z0hHM0o4cThvOEpQRHJKRGtFd1ZDTWthVFU1MEw4YlloQk4yWU5UdWJVTWM4?=
 =?utf-8?B?azBpZmxtWVFZYW54NHRnNnVoYU5KRjIrNWo2ek1PYlRnQ0dmYjd5VUQ3MVZQ?=
 =?utf-8?B?UTE1NHR1T0lLMTRaM2h1dk9uOWlKWEhFd0IydXFqam1ya1dOMk50VVU5d0JW?=
 =?utf-8?B?b3V3MkxZMTdNSkhJTHJIL0tRbzBwbnRiY0dEOE93YURxU2xNOGhxZGtFQnpl?=
 =?utf-8?B?Q1Eva3EyZmljOFpsUVpUcElJK2NCNWxTbmxRYlFxRjEzNm9YY1V1ZmY1TGRy?=
 =?utf-8?B?N2JKd2FZZmxnSmhveUMrdkc0S2NLcFd1K2ozcmFybjROYy92cTRUQlpCVzNH?=
 =?utf-8?B?a3pJNEM4VDQ4VnhqbTJnVVlLVmhoOEdsR2ZtRjVYWDNXQWM4MUE0UGVmYi9Q?=
 =?utf-8?B?UGtEV0h0bXFIa1Z2U0dwUnFIZXg4YWRhcnNDUWE5eUI2UFExbU9rMU1FRUU1?=
 =?utf-8?B?VW1vcC9OUFNmdmhlRVJuY1JvcjFwaEplUk8zYXJHQ2M3MzUrblRKeE95RkhK?=
 =?utf-8?B?RHo4SWt2bHcwNWJ4NTFjOUI2RlVaSnR6bERRTytoTEZ2dWpDbjc1TkRmMWVR?=
 =?utf-8?B?YndjN2J5VVFYOU9jcG9Kekh0VDdaeUpIbUhUcWZHSnl0M3RKZHNwYkRMTVRB?=
 =?utf-8?B?U0pGU1lGV29MM3BBT2E4WHBzK0NUMDNLUHBzeTF0QnhUMkRLb2paaitQbTVo?=
 =?utf-8?B?dmhNMjFzT1ZPMUlNMm0wdDJ2bjl2MGgyc2dvUDQzc0dVYklxWERTczFsYXhG?=
 =?utf-8?B?UWpPdFJvM1FnaWRyU2hlY1pXL1VFdElzbDZQdzE3MmRxd3BzWWJZRUtmSkxO?=
 =?utf-8?B?cGNncnF2K0pRTTFwYjR2K3lqTVNHOW9DcXVpSnpnV3lUQnA1SWY5Q04wa3o2?=
 =?utf-8?B?N21mUzR6bW5lRVVoekhZRkxMWHFNREJQNE4zbGZuYTJKRlBvbU1wMTlkZjQ2?=
 =?utf-8?Q?FKAFnboNK9kmj/66JXk5bjt0cta/h025KtKHtzx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1JLcEhRdnhhdDMxWkxid1FFamJGSkVPZXVsRFhpQjlINW5zNmUzT3BGMjd5?=
 =?utf-8?B?Y1pxNjFqSUx6NkdkdHd5TE01aWljUytnbDhjc05hb1FQTXplN2x6TWlROU1Z?=
 =?utf-8?B?TnBVMlQ0dTA0VDE0cHpYNEdYSUdHaVdmNEdVbDVYTFBWUExHYmJRYjVUVjZu?=
 =?utf-8?B?RVlobms4MFgwcnRJemZtaHNuNm15MVNuK0Q0WXR4N09MeGhLY0ltS1lYVXVD?=
 =?utf-8?B?b1R1YzdobDhwUy9pNHlseGZDNFA2REFjWmtDY1hXdTZUWkhadG4xdStBWE5K?=
 =?utf-8?B?dDN3bTB2MjdQQ0FXQTRWVXpXSXJibU13SzlSZnFSMWs1dkVtdnpaZGkxZTFJ?=
 =?utf-8?B?dkFwQjFJLy9IVnJaeXh2TmZPTUY2QVMxd0J1ZTJ4bEl2RjFDU3FOeFkwa1ZC?=
 =?utf-8?B?bERoWnZJZ2gyTDJSTmtqZ0p0bCs1SnU0bGcyY1I2em13THhuRDJocUJ0N0k0?=
 =?utf-8?B?VTB6RE9jOWVraWVRMzF6K3ROUUhrcXBBQ3BRaHRUSDZoSnlXTHp6QmtXeFBJ?=
 =?utf-8?B?M3o2YysyYTdVNTYyVWlLZFRvdTZuR3Nmdml6Q25aRU5SS0J3ZDBmY0hlQmxy?=
 =?utf-8?B?c1htZENtdXRhUE1jQmVQOFlUc0JpY1BnZ3dhcWRpTXpsME9IYnExZC9pZTZm?=
 =?utf-8?B?QVphUHExSzVSbEhNeVBaOU5RbkVTamRFaVFqcDhkTGp4WFpJNzVlcUZ0c2xx?=
 =?utf-8?B?VDdVdjBqN0JCS0gwdG5vRWpFa2ZWL3lxek9Vai8wUTY4cTlkcjIyZzNwNWcr?=
 =?utf-8?B?SllWMldyNW81OU1hYnJkMEVwUkxWT2JHTDUwRVl1a0dNOG1DL1UySTdJNjhx?=
 =?utf-8?B?dEJ1eUpXKzJybzVUU01JU09saTRBUEhlamF4S0gxZi8rYXdPcDhOR2hVUlA0?=
 =?utf-8?B?Um5oeHhoV1B5K2JHTXBscGNXV2JNUnUrQWc5N3pycU1MNjRsLzdVdEdvb0xw?=
 =?utf-8?B?M2J4MU42Z0hNM09FQlN3aUYwT21GNUtXTHB5VDZPOUlRaG9TMW81V2ZyaGsz?=
 =?utf-8?B?YmF5VU1CbDZjeTdLbWpBbzZJTTMzSFZPMmYzK1BiWDRyQzJCTlhBK0EzdHRF?=
 =?utf-8?B?ZFN3dVd2Ym04d2ZQRjhSaGtxSkdsL2Q5WFJHTFhGZ3RWbkVCS3QzbXlsTEg1?=
 =?utf-8?B?aFF5Nk1DOHNIUEFwNWIyOUFzNE9ZRHdyWjgxY2xCMHNMdjBDZXg1NFpsc2ha?=
 =?utf-8?B?RSt3UGFaVkZ1Z0Mxb3BHb0xCdVhjZE9pWUp3cE9wQVFPSkNDdjVlT3JibFdw?=
 =?utf-8?B?U0sxZ2ZQYTdkWjNDNGV2dGU2OEovV3R0NGVXUmNlSWJpNmg0cDhqOUhDZzBx?=
 =?utf-8?B?U0VXMytXeGJKSld1T0UyeUN2ZWw4U3ZMbWxwQkFhaDdTWFp2Z1hyTUZiQkJH?=
 =?utf-8?B?c2VZY1RqWmRxZ2lZUmg1eXlUTmVFVWsyTDF0VThXWEFGNlVjeXhJeHMrZFU2?=
 =?utf-8?B?MnpaazlHZklqejFKUWFMYUM3OWx1cld4cFNZUU1EZEx6SHdWQ0NFTlFBM1pa?=
 =?utf-8?B?bnF6a1ZWb0xZMDN2UFVtMmRydUU3aGdaSUxOeGZRMkVCTHhHWDROU0NTZkxO?=
 =?utf-8?B?SzMxTU13V01ON29RTFdHOGZITU5pZVBQc3ZRRXNndUFjTXRudldvaUlVdnAz?=
 =?utf-8?B?QnNLcTZsSTVjTUZoVFYzQTlJVDBRem5zM3gvVW1SQXN6TlpBYTV4aU53ZjZO?=
 =?utf-8?B?aEtnVjZMQjIvcmV4S2VHa1BZc1c3MUJlRzd5MXJzNjZIS0sxTVhQRU5STTZZ?=
 =?utf-8?B?VzQ5d1NMVi95YmRHUFZUWUpVbHZhWjR3QjlRbTFublpKWnY5UnpsLzF6N2Q4?=
 =?utf-8?B?RlloKzNycXdHN3VEbk1GbkI2Z1ZtbUw2RVdPaDlSdmZiRGY5c3Q2RzFTdHVL?=
 =?utf-8?B?QWtwdElRV1Y4d21YSDBwMHV0ZHp0L1RkZEIxNzF0V01ncG9sdHZXd3VVVWVK?=
 =?utf-8?B?MlV2WmVOV0pxYis4a0NQbzVWTDZwSndQTHhSaWpmb3hJcnRiMU5KTzJJVkZt?=
 =?utf-8?B?dnBid2RRTlFudUxBb095N01WcjdjUFJTVjd4Z0tjVU9TQ2FZY1I4WU5CSTRK?=
 =?utf-8?B?Wjh6RGFGeTMrVmp4b0oxY2dLUWwrZUQwbS9PS0Eyam9CcmgxT1d4am9Qa0VC?=
 =?utf-8?B?ZUY1NmZVZXo3ZGxTTEFMQ1lDQ2RrUGs5TjZkSHkwMkNjL1o5VjV0dmtvR1lm?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a60dca-434f-4480-48cb-08dd030f0415
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 11:41:58.7236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1N0Ab0xNPOKgfsZarLyYPLyUq5Rujbrt+KpUbpMG6qJH+0O7Gc4NHhE0qTy7Es5flKAIasfM7EmFY4BfUn+EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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

On 11-11-2024 09:16 pm, Jeevan B wrote:

> increase big_joiner limitation to 6k from 5k for display version
> greater than 30.
Also, specify Bspec no.
>
> Apart from lib following tests are modified:
> tests/intel/kms_pm_lpsp.c
> tests/kms_flip.c
> tests/kms_setmode.c
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c             | 21 ++++++++++++++-------
>   lib/igt_kms.h             |  5 +++--
>   tests/intel/kms_pm_lpsp.c |  4 ++--
>   tests/kms_display_modes.c |  6 ++++++
>   tests/kms_flip.c          |  4 ++--
>   tests/kms_setmode.c       |  4 ++--
>   6 files changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5d8096a17..f5bb488df 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6330,6 +6330,7 @@ int igt_get_max_dotclock(int fd)
>   
>   /**
>    * igt_bigjoiner_possible:
> + * @fd: drm file descriptor
>    * @mode: libdrm mode
>    * @max_dotclock: Max pixel clock frequency
>    *
> @@ -6338,9 +6339,13 @@ int igt_get_max_dotclock(int fd)
>    *
>    * Returns: True if mode requires Bigjoiner, else False.
>    */
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
> +	int max_hdisplay, dev_id;
> +	dev_id = intel_get_drm_devid(fd);
> +	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
> +							   HDISPLAY_5K_PER_PIPE;
> +	return (mode->hdisplay > max_hdisplay ||
>   		mode->clock > max_dotclock);
>   }
>   
> @@ -6362,10 +6367,10 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	bool found = false;
>   
>   	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	if (!found) {
>   		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	}
>   	if (found)
>   		*mode = connector->modes[0];
> @@ -6384,7 +6389,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>    */
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
> +	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
>   		mode->clock > 2 * max_dotclock);
>   }
>   
> @@ -6549,7 +6554,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	 *  - current & previous crtcs are consecutive
>   	 */
>   	for (i = 0; i < pipes_in_use; i++) {
> -		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
> +		if (pipes[i].force_joiner || igt_bigjoiner_possible(display->drm_fd, pipes[i].mode,
> +		    max_dotclock)) {
>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i].idx),
>   				 igt_output_name(pipes[i].output),
> @@ -6576,7 +6582,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   			}
>   		}
>   
> -		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
> +		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(display->drm_fd,
> +		    pipes[i - 1].mode, max_dotclock))) {
>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i - 1].idx),
>   				 igt_output_name(pipes[i - 1].output),
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index bd154d1c1..a1d2b8632 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -146,7 +146,8 @@ const char *kmstest_scaling_filter_str(int filter);
>   const char *kmstest_dsc_output_format_str(int output_format);
>   
>   void kmstest_dump_mode(drmModeModeInfo *mode);
> -#define MAX_HDISPLAY_PER_PIPE 5120
> +#define HDISPLAY_6K_PER_PIPE 6144
> +#define HDISPLAY_5K_PER_PIPE 5120
>   
>   int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
>   void kmstest_set_vt_graphics_mode(void);
> @@ -1238,7 +1239,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 889da42de..74e9d799a 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -166,11 +166,11 @@ static bool test_constraint(data_t *data)
>   	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
>   		return false;
>   
> -	if (igt_bigjoiner_possible(mode, max_dotclock)) {
> +	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
>   		for_each_connector_mode(data->output) {
>   			mode = &data->output->config.connector->modes[j__];
>   
> -			if (igt_bigjoiner_possible(mode, max_dotclock))
> +			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
>   				continue;
>   
>   			igt_output_override_mode(data->output, mode);
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index f1d8ab03d..0950cc483 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -318,6 +318,12 @@ igt_main
>   		igt_display_require_output(&data.display);
>   
>   		for_each_connected_output(&data.display, output) {
> +			drmModeConnector *connector = output->config.connector;
> +			drmModeModeInfo mode;
> +			int max_dotclock = igt_get_max_dotclock(data.drm_fd);
> +
> +			igt_require_f(!bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
> +				      "Big Joiner Connector Found Unsupported Config\n");
>   			data.mst_output[count++] = output;
>   			if (output_is_dp_mst(&data, output, dp_mst_outputs))
>   				dp_mst_outputs++;
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index cbabbe74f..17da10e2e 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1756,11 +1756,11 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   				 o->kconnector[i - 1]->connector_type_id);
>   
>   		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
> +		      igt_bigjoiner_possible(drm_fd, &o->kmode[i], max_dotclock)) &&
>   		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
>   		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
>   		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
> +				 igt_bigjoiner_possible(drm_fd, &o->kmode[i - 1], max_dotclock)) &&
>   		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
>   
>   			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bc7b8fabb..d61cfeb9a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -736,11 +736,11 @@ static void test_one_combination(const struct test_config *tconf,
>   			 *   - current & previous crtcs are consecutive
>   			 */
>   			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
> +			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
>   			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
>   			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
>   			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
> +					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
>   				goto out;
