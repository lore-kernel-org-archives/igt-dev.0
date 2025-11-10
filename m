Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00659CCFA1A
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 04:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8156110E114;
	Mon, 10 Nov 2025 04:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eY/FVmD/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163CF10E114
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 04:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762748747; x=1794284747;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZRLXspCtJd3dmR2z9vSa5TSOBkeYBvJTnNp6ky4Pq+k=;
 b=eY/FVmD/vkuQBEL2jyf99FoBGmfnlDyuKCuPqH0KMBndmxmAwZ1Phkw9
 hFX5X7agni86euYpyxP6JNnTsvUpdj43dRmJD6pgefLynQqyd9RFLjSI7
 EUbjMIGRFCmL9YTIeIMDiGwOHcEvYjBJYb4mmKxKamtgzxRsc5UZMLfY1
 bvd32mn8iu7YnoNr4C+36jgfOXnmHZFSWHPpiKYZW/KInnK1a7u34aSYy
 6BylyttB4wNFV0rUMXpXdLBY5qHpr1kCw85HvvVNSi8LL/l0svSM12VzZ
 dvgm14yI7rimMBTrGoJBK94DZzZQDXVbTBYi8JYAYU4ofF7MecAsYWPdX Q==;
X-CSE-ConnectionGUID: AGiaExUoTta6UYjkpnnJiQ==
X-CSE-MsgGUID: 27+LnkG5TgyKNOb9VGI+Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75484369"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="75484369"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 20:25:47 -0800
X-CSE-ConnectionGUID: 6HYDhseCT5ScsQxNzvSSrg==
X-CSE-MsgGUID: jJVNnjNkTtGvDHG7NvNhHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="187823360"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 20:25:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 20:25:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 9 Nov 2025 20:25:46 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 20:25:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaAgpcfGJwQI/wMEoZlvS9Ng36amVDDDWOwZZjdAbJ/HMOJ4Qeyrzb1hhWj6QLgTZxFdJiHMilOoLXRa9psDmXDGNlEWJK99otM0deWZrBseF98tzzZAiOzDShU+lxuUP0MxBwXypBKLNvdlUnTxouGlkbiBz9dCbjXzNHkqs7+/BkxyBA2MeDCfN53crpt7EPoh/kbYku8CqFmwpQByWvy+qo4jDp2yeruUv1g+I7XuPTAe1Fwq7NtnJ6fSeALkcUGzxAXvZ70gzAZSiRTweBkPTK2KDpzhjslGD4J0wD1YFRlkd/R4rqjUigBQURa1ukxVEzfhHoTI7BOgiMm27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCtu/dFdTkkAUqfqptVVBDWV37OGimG0lho4TZdfWS8=;
 b=A8tSrBF6Ze8lJAn81fdKA5g6eVDgezzOqrK6YDuyU2tVI3VaLhsDjqPFVX3KOO8Tp7oiNjwFyJRqP3zl1I1BnV1CYYy2R3jELOhQAE9GH+ge1FWdbLR/OL4NV2gWlnIOxE1Vd7bn6X2N+1qWfNtLhxX9rvxd8syLG2iETrTxdCWCA2J59QHA0S7kxnsMBg4ytkyFk1ykP1+zGuHZRw6zHvmQiGKIEcCFuW/vLLh6A0/CAvanalwTaDH5NnGCRkDiKAH1R1N0kFGN/BrWKrGxZM3/2IM21VS8TnYtXejY8HxhwQIVQzZRdZTLR5q9XQre0wNISCmo9Al1b0NGDPyezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 04:25:43 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 04:25:43 +0000
Message-ID: <f1fb916a-9212-43d8-9e56-7d40f20e3626@intel.com>
Date: Mon, 10 Nov 2025 09:55:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_device: Add API to get pci device
 upstream port
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>, 
 <raag.jadav@intel.com>, <sk.anirban@intel.com>
References: <20251105084426.601123-1-karthik.poosa@intel.com>
 <20251105084426.601123-2-karthik.poosa@intel.com>
 <20251105102216.a65meobsq4utimbo@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20251105102216.a65meobsq4utimbo@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::20) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: db512f1e-0e6e-40ec-a723-08de20113643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dC9SQXhkWmtXV0oxcEtwMWhKNE93YzRIRGs3S1RuS0h4RERQTnZLejJHYi9L?=
 =?utf-8?B?Qkxha3J0bWNVVUttRGZSbVJoWXBoVjdEWGxJYm5WcGJCTjFxZ1ZZWFVseFo1?=
 =?utf-8?B?cFFnbGNKSDBJSERqNSt2azV1L1hxV0lxSWdPdTFBbTR3NzY4d1pCM1JSbk0x?=
 =?utf-8?B?WUMrUzluSHVaWU1UTVJ4ZFo3OHVmS094T1dTeEFYOWNWL0dMbmZDcTF0YWpZ?=
 =?utf-8?B?M2ZjckU2Q2JaNTdVbTF5Q2lPUnl3ckhzZjFZUDUxRHFCbU9Eb1hsNFEyQUVr?=
 =?utf-8?B?VGdqai9CeVZ6L0h0cHcyQ3JFQ3hRYmc3NFEyUSt5RWJYeGxhVEIzZUUyV1ow?=
 =?utf-8?B?TWtOeHV2K1cyV0ZFY2hxR3J0anl0V3VYVTlIYlJnbGFPNS9vYi94SGFYL1lo?=
 =?utf-8?B?a3plN3M4UU1mZHZOTmNidzJQRGd5VktOZXhxRmxpSVZCM1o2MHJDZTVYWlVu?=
 =?utf-8?B?YVhDNDlBZ2IycVV1cndaMWRoR294MUc5TmsrWGNxTFc3c1hLRzdyVjBCbXN4?=
 =?utf-8?B?TGE2cDhiOWs2NnVkYkZUSTBiUWsvWmY4akR6dXJ5dDdBajNrV3FJbU5tdXdy?=
 =?utf-8?B?L3p3Q0xieGRFRW1hMHgwYXRnWG0zY3VRcjM4dGR2MTFDdk9LWlUyd1F2czky?=
 =?utf-8?B?VWJKa01wa256NmViWTRjZ08wYk9EZHhEYlVmNjdqRGdmQklSTlVUbk9mcCsx?=
 =?utf-8?B?TGVMU2JibldHa0JPQS9xOVBQTDg5N2xuNmVSYTdVdFVaWndlTzYrcWFNdlpM?=
 =?utf-8?B?emZ0UXdzaGFHYi93ZzhyN0hMUW9mNmxJS09YZktCS3piQ0NsN2tUTVJMQzM5?=
 =?utf-8?B?YlVHUjFkOUp5WFllZjQyYzB4YjJQVUIza0pGUUJwUGM0YU5ZVnJzSHk4aVVU?=
 =?utf-8?B?WVJWT0lteG02QllwaXNVbHBWZ0V6ak0vRFBEMFZYcFdQeW80dE9pUFFPWjhT?=
 =?utf-8?B?VUE4SUxmSzR6eWpXSHNqVFIzbXg4anVPUVBpWmtOMDlWN2xNYjRIcXdxMWYw?=
 =?utf-8?B?STNWNkI1TU1HU21BeS9sc25taXFadEM2aFNnblNlakhmT3pJK0IzTEVEbzlH?=
 =?utf-8?B?a0Iwcm1XcERPUFBUYVRqZGtsTlphbHdnNjFscFBtT0MyL3RUS0k1MnZvcS8z?=
 =?utf-8?B?S0xEMlhoTDdSaHdJNEtwam1JZDFMNTNzNHlvMjhNYitvWjJXVWJJTnNVS25V?=
 =?utf-8?B?UStmTFFqOFp5SE94YkN2TDd5Y2pEd2JldlZqRldyU0F6SmwrUi9SRXJ4cGox?=
 =?utf-8?B?MXB0R0NuaGF2c2d4OE1wY3Q3WTdjS3J0NTYwRVBRbzFKY1FTTVJ1N091dDlr?=
 =?utf-8?B?cG03dGhRc2xBcUVDQW0vRS9wdjhyZGdQTHNLNG9STW9qMGFnZERtOC95bEpk?=
 =?utf-8?B?bXYzYTRyNGRabEZmK3orYVZVd0toSzZ0MUF2Q1BNTFJGcVVOUmVObnFCbEt2?=
 =?utf-8?B?SGlySlVrcjg0V1lOOWl4U2VXN2VtTDFybm8yTFpCajJmTjNiKzgzUXNQTk5O?=
 =?utf-8?B?RDdDaENWMlJsSVBOb1dSVjhvWHhRQjU3U2dSWUZselNQNEpPaGtBVXBiVGU0?=
 =?utf-8?B?VEdlNVRXZDQ3YVBjZGJ0ZFozSmhqRTdGUWpjQnkzTzVKcjNaMHRNZDY5TEFG?=
 =?utf-8?B?dzFzN3I1UFpyeUNsQkdMWnFXMXYxYTUrQUNoOEZsZE8vbjRZYm9qWHR1TEc2?=
 =?utf-8?B?N2IzUVFUQUNHYmxsSFE5emJSSHloV1gzRG5PU2ZMTGQrT2lLUFhwQmZ2aWVM?=
 =?utf-8?B?cHJuNXZTa200bkYyTUtqeHFhZksxMDV5WHhqeEUrdEwwd2U4YUtIREVDbDlM?=
 =?utf-8?B?Q2NxV0lyN3B6TDgxbnR6c0UxSWVZT1VvMVgwL29BUGZ4UWdOcjVDY3pDTjVw?=
 =?utf-8?B?NUtRN09sRFRqVEozcUhNcmhzZ1RqVW8wc2pFcy8wRkFCWFViSi8xQ05ZSmRK?=
 =?utf-8?Q?EQsRyR3/eN1jJR3UTK3xoqF4Cw8NMaxd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWwvT3pqNStGUnJOTjl3a1A3elJMZ1RUYU9mTGlXNjNXRjkra29SbUZyZkJE?=
 =?utf-8?B?NWhlSG5PM2RVMXFkdFZES3QrUWNGR1JkNVRPRFFTVDluamRGZk9lcGxUeCtO?=
 =?utf-8?B?UWZ2MHlIcUNTUkFpdFZTeDlKSHkvSUtqVWV1cjlDUklHUHlicktnTnBvOWJj?=
 =?utf-8?B?Vy9yR2NvRFdjTmcrb2oxMjFLVDYzcjZobm1RdVZGdG9YQmJXeUhIcVFxSS93?=
 =?utf-8?B?ckE4b2lMenF0NHVHTjJ1d1ppeThOb1NQemdZRmg2aGtiSFF1bFVITSszZlRP?=
 =?utf-8?B?ck5GMjdzcnYvRHRsZXNvVm4zTlBYSmF3M0MvNU5ZWXNpSStnZEU0d3VLZFdQ?=
 =?utf-8?B?Wi9EcG9TUzBLem5ZT25MZUlRZDNpcVAwbWFPZnpsa2VPZ2FiMDVJYjVlcUZG?=
 =?utf-8?B?TU5Gb1JYMVViUmhIa2g3WmdGQzhuclk3OEJibGJVN1lUak5taDM4MFFBcHFK?=
 =?utf-8?B?TVVSYjlFalAwL1V3ZTEvMW1PL2lCR3dlRk9vNDJ0cWZDVVBKcEN6V0svYWlF?=
 =?utf-8?B?VDRFWVVnNmlpenNyWnQ2K1N3THM1aEZ0QkRyVzBvWTRnb1Z5azkreFpNU2tK?=
 =?utf-8?B?REVzeTNZNmcxMG9xR1p3RWM1bUtSVmxibGRoQ1BtTC9McXpnYlFIVTk4L0NG?=
 =?utf-8?B?Y0RXZ1dhYi9pNXBONmpvV21ZNmJHZ2hlRnIvYVVUUUNMdFhQZ0sxZFRxQ3RO?=
 =?utf-8?B?WnVFS09pSXBDR0U5bVdSeWhYMGpsM0t5MmhCWk1wRFBtV1NidUQyRUxKeEpq?=
 =?utf-8?B?bWFzNTVlTUxyWnMzSGEvZHhzTjhaRXo2RFc5VkpYUERhcUR0MUV4OERvUldp?=
 =?utf-8?B?dXU5Z0lHNEpQZkZRUlZtUVJCR2F4aC9ZRWFjMzdQMXBuRWtEU0xCVGpQb1NX?=
 =?utf-8?B?UDVDdm1sNkVGQ3FBeC9NR2pacGNoditZdGdiMmlRUmkvNUhCSGZrWWxPRVhT?=
 =?utf-8?B?RG85UzV6OXYvdHEzd2s1bU1oMzNMMk5IM3NZQmg1TmY4S3VTZkZTcHFKbllB?=
 =?utf-8?B?Smt1RnpubEZUdzlyNnBlV1NhWGh6NllzWkticWQ3OThYb2Q1TkI5T1RZVjk2?=
 =?utf-8?B?Si9Jcnc3dVFLdFFrbWJ3dkhoWFJOUGZtcmJ6K1VEY0xYVzEzTlNOeHJsMEZX?=
 =?utf-8?B?bUpLaVlyb2wydWozcUkreUp0OUx5bkNsSEN1LzcwT0RQclZ1aE9rYXZLOUQx?=
 =?utf-8?B?N00zSWplbElha0tGcTZQVmpwd0k3Z2oxSlNyUlM1T2RiUE5Jc3haM1VwVktI?=
 =?utf-8?B?TUNKWnVwZGRVRFRBNy96WXpxRW8yU2VlWGh5VWtxRzNnLzZOb0ZWb3lRYmxJ?=
 =?utf-8?B?REpuaEVHZ21YcXV3dnRQZXZqUUlqKzRxY1c0ZERZb3NXeGJGOTRGcG10aDh5?=
 =?utf-8?B?Wm80TkRjOFliR3ZHendSRG93bkN0bFd1cmEvVTU4WVdOSTdRZGZOZzBVWnp0?=
 =?utf-8?B?VHU1TmJvNHFuYU43VGZGamptVzZtQ1g2Nmg5Nk0wa3RJRkRIdFNqR3BiN2dT?=
 =?utf-8?B?SnkybDhnYW0zNzV2MUdjR1VDMzBvd2lzeDZuWXhlOUlHL3htblJGYStUVjhF?=
 =?utf-8?B?bU9Ga1IxZHZRSVEyV2RhQ29LVjZtSGMxZlA5OFY1MUtsMk8zMGNoS1Zab1Ev?=
 =?utf-8?B?Ylh5NDdoR0Z1ZVUwOEVkZzNJWkZodEw3R1dIR0VFTVJ5dkhRc3hrSGY5dnJ5?=
 =?utf-8?B?elg5Tjkwb29xeTU3cWJLN0pNZ2pocDE4eDAvNlhKSXp4RnFPeVRmQlZkU2VQ?=
 =?utf-8?B?KzFrRzM5NWhPYXIxNDFLb3dUYy8xU0psaUhwb1hLdHY5aHFKSS9uWGFQdWlO?=
 =?utf-8?B?dmNnVDgwRFI2cE5kTFVUSUFvVFVVQWprc3dUc21PWmRoVFFRcjJHTDdybWYy?=
 =?utf-8?B?WDFmdTFWS3hkSDhORmNpZnQ1MmU1WDlYeUZjd2luN2tESHNzTHZQU3hDU2FM?=
 =?utf-8?B?L05IU0tiV0MxMmNocDNiNVJYQkRGYzA4UTFSeW5VZ0pNdnNkcWVGNW9WTEZt?=
 =?utf-8?B?ckRuZm1kQU5Xcit3b09MMXdDdEFzUW8wbkxrVkRhVzNGUThqa1B0ajcxN3Bi?=
 =?utf-8?B?WjJSNy8zWFpDclRVU2szVTk2c2pobzFoNFA1cXM0bzZCWExMRExyN21MQ1ho?=
 =?utf-8?B?NmI1ai9vWFpKOFZZR2M4d1poL2VIV1RjTXBzTUpUSEFwd3lmUGVVWXVpVGZH?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db512f1e-0e6e-40ec-a723-08de20113643
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 04:25:43.3978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCRjgvDNESVzTkZv2oDwHYsgrWAeXOH786ohvRuvVEb9U3pqSqnaNO8ih19zFCnL5wxNr8zcrx0RMmO++efgXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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


On 05-11-2025 15:52, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-11-05 at 14:14:25 +0530, Karthik Poosa wrote:
>> Add API igt_device_get_pci_usp() to get pci device's upstream port.
>> This API returns struct pci_device* of the upstream port that is closest
>> to the root port within the device's hierarchy.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   lib/igt_device.c | 27 +++++++++++++++++++++++++++
>>   lib/igt_device.h |  1 +
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/lib/igt_device.c b/lib/igt_device.c
>> index c24f6a58d..17b6c578a 100644
>> --- a/lib/igt_device.c
>> +++ b/lib/igt_device.c
>> @@ -308,3 +308,30 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
>>   	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
>>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>>   }
>> +
>> +/**
>> + * igt_device_get_pci_usp:
>> + * @fd: fd of the GPU endpoint.
>> + *
>> + * Looks up for the pci device's upstream port using libpciaccess.
>> + *
>> + * Returns:
>> + * The pci_device of upstream port of the device referenced by fd, NULL on any failures.
>> + */
>> +struct pci_device *
>> +igt_device_get_pci_usp(int fd)
>> +{
>> +	struct pci_device *pci_dev, *prev = NULL, *parent;
>> +
>> +	pci_dev = igt_device_get_pci_device(fd);
> Please use __igt_device_get_pci_device(fd) here and check
> for NULL like:
> 	if (!pci_dev)
> 		return NULL;

Hi Kamil,

Already igt_device_get_pci_device() internally calls __igt_device_get_pci_device() and checks for NULL.
Can you clarify why __igt_device_get_pci_device is needed here ?

>
> Overall looks good.
>
> Regards,
> Kamil
>
>> +	parent = pci_device_get_parent_bridge(pci_dev);
>> +	while (parent) {
>> +		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +		igt_debug("PCI device parent %04x:%02x:%02x.%01x\n", parent->domain, parent->bus, parent->dev, parent->func);
>> +		prev = pci_dev;
>> +		pci_dev = parent;
>> +		parent = pci_device_get_parent_bridge(pci_dev);
>> +	}
>> +
>> +	return prev;
>> +}
>> diff --git a/lib/igt_device.h b/lib/igt_device.h
>> index dad7bb047..7de464c0e 100644
>> --- a/lib/igt_device.h
>> +++ b/lib/igt_device.h
>> @@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
>>   struct pci_device *igt_device_get_pci_device(int fd);
>>   struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
>>   struct pci_device *igt_device_get_pci_root_port(int fd);
>> +struct pci_device *igt_device_get_pci_usp(int fd);
>>   
>>   void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>>   #endif /* __IGT_DEVICE_H__ */
>> -- 
>> 2.25.1
>>
