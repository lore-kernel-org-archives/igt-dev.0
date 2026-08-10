Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AEEC5AD55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 22:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C89110EA00;
	Mon, 10 Aug 2026 22:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8BTszBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9BC10EA00
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786400927; x=1817936927;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZBL3MOTGcbkAUXLzAcKQ3vk+VTHO0PjV3cQ01NYyu/E=;
 b=V8BTszBBM3zSsuTkaUIcb5GB8zIZ11CXnqnM2vb9cH6Pnj9u1aM5bt/8
 AtntuZVZUCDYV3d4EWbjZrudAoRiWAiSEdjLPsfrwW/HCURSxNKqlN9gq
 jUPWIEK+Y6qaXiHCWQsBCwZtOANavVCAybESOF1sMEUK4teC/zOXDPwfo
 UKSMhMWlGG7phJJ7KNq95cS3apjAF1FSQuzDlUK5/Elga4rbkkZjgweI9
 8CZqKpf2bzS6sAn04jZo9+39m5SvCiJGlVK8I4CjITfcwSTxGkHV2of7T
 8sDlzCCgwVOWNVf6+Sqs1qLtd14j6+pTPpFaol418kxAZ7Kn2DxUdeG6r A==;
X-CSE-ConnectionGUID: KX9BhW3JRniIQkZ3KiK3Uw==
X-CSE-MsgGUID: Fp4AblVzTpqnP03DZo4AIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90605715"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="90605715"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 15:28:47 -0700
X-CSE-ConnectionGUID: ch8wWFokQPiWEUT9HxAdYg==
X-CSE-MsgGUID: Z8RhTkVhQOyJDn91KWzJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="287860191"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 15:28:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 15:28:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 15:28:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 15:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmjCQnRoEvVRyIupaDOOlTnDJc0DQtv4RXwE+VUZwv/aV7mY2oeaCxhCVBbBo9zMfjNaHLqoVxKNfnAuOkHIQNsPVyFHuWM1HRR+TSbCp2TMFOiWte5FXLjvwPGguPgm4gaEm28upOj0xJmnLAZauKA1wtTh6kbEtt6JBEKX8cx7UOnyMwA6NvIBwK+pMK7IsLZAXf86s49cTihj7qop/qIXzCggASUOJkv+rL8b9olOVkJTbmDyb4ntwwB2jiyKIWqq9Ya8wuipthInDPOOII0TO8kX/etBVuJ9iuCujLlEUAk+5IubLLgfqE3Xyz/wglYC5R7V5cVyMRWFYiOMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPedxVOrLuXgGD4kC5jd+O7iCJf944cPZNIQOVH+xGo=;
 b=oFauesZeBfFia5H0CrmaLD+fMJhO+v4Sr6utDpOJ9QPVYJ3wuatkGCBz08TUDisqBuAIzGXiYqLYyLLU9nwjS4G/qnlHOWg+HWJFyCvmUPLO6vwAhs4D1Y8qCsm2bm2ik67O17Nn09HfGfZKC8Vvv6bawEFEDdkpSq8rbJ/AW8b0oaGosLIz1aL6fqef2ZdqH8a4VP8FYhxXsJ9pc1gF5vunXoK47lovV9Z7h3UvkWZhYNtFL2jdmvhGRaJQmkFJH3bnVB2YaxuW7eOwRvl49xx2Uss7R5RkCG6FPNwF6/kbKnnqXV60eiA99s7S8ffr+fd6KFeDGAKciisD9Z/f6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 22:28:43 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 22:28:43 +0000
Date: Mon, 10 Aug 2026 15:28:40 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH 5/8] tests/intel/xe_err_injection: Add GT UC Unicast GAM
 Walker Command Parity Error Injection
Message-ID: <anpQmAnfj_dY8Ekp@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-6-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729121959.603890-6-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ee7b91-bb4d-4906-cf70-08def72ebc5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|4143699003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: Sr0m+3VuaZtTrjApGR7KveVeMZwzQpNLNaCjbSseXZiMls4j3dFBbwR9NykWQcy7Epk/Biy6P3L+lxVtHrkZMztJp1fLArcrxnFtF0gpe8O59nQNz4RDeZ0fy4fPcwm5Mr1sznN20glUeK2D7+d0+PMAGc0b1EnQr0DaAwPUY1gaFfq5LX2Faty1VcmuzE0rdgQEdlYdmGn6RDzu3W4rUehIVx3V7fK0blt3Bqv0KxJg3rECgrlHiPznQmdEP5ijTJM1TNsCr5ZeCAH1tCwPFtZrJjipTqkwhSzL1/hhcpfZgwf/v/HFhW1jtFnsU4XbMwLofaFxn2C0ZF98giSbEewIfVZ6BVemDcaNllo1LshVah7DnR93qOjQxhyv+fvtKjitm6Cmfh3/jvvInmwgQh68RejQzibUvZ9tIOZNYgAd4dR3hki+IDlb19/qwHpBoiFqLcB1742HRgcrOef1nA/tDCUEBhbn2ghUC9b5dwgalxP89RLLZuNlVYe76tsczqC9KTtRcICh1tErkMN2vlGxHJ7M1pSOtSI6bnP51ckRwILMk1PjzAl+8aTxz2pMme//3pleXK5D1yPeIxvN4tMTMameIjUxVHflxINLE5LyiU8DTwOcNOU02EDYZ8rxUFgKGd3tleK579iLMveVzF2TneBKC7r23QSd9StIjrg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(10067099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2NSMnR6T29lY2JZZ2hSeWw1MXFJZ0ZQaHhvMnQ4L05HQXFxbFU0K3lwUzBR?=
 =?utf-8?B?amlPS1VUNlNiQ0xWU3JvVUZaSkE5MHZmR25uS2EwOS9CN1dSd0Y4UUhKSzgz?=
 =?utf-8?B?dDRqZzJvMDZKU1dXOTFaMStabnprL3hteEVnclZ6eHBMOURFRERHamRZb2Nl?=
 =?utf-8?B?Y0RBVGsrbk1VdDlpVGJqVXk1VmRrb3NhSWJKclQ3SFh4UFZ4R1ZRL0FsMFpM?=
 =?utf-8?B?cExLV3pZZCtNNzEvMk1HaHF6K0F4bERWS0RJNmpneStYbXQwL1lOMis0YkRr?=
 =?utf-8?B?V0o4YStDaUxMdWRjcXpLMWIrQ2IvWjNQT1VLMnJzaVQ0ODR3RVNWeEgrb3Jv?=
 =?utf-8?B?T2d2K25kVmxiK3pQWWtKNjJYY2w3SFpieWJBOXRSTkkzVzF2ckZQTnhlRmx1?=
 =?utf-8?B?UklabDFpcmd6R0NobGlDSTZCQU96cWhLT3JnMmk3Z0VrWjZDVDAyRllaYkUy?=
 =?utf-8?B?M1o5OWR0bEQ3Rmw1elh5QlZXbU1NeXp0cTJyV3hSb01JTUFtVGoyME5IZk10?=
 =?utf-8?B?SEx1d0hzRzNLaDB4Qm1DZzhxR3BhVnNua1B1WXBCd3oyWElFS1BDSXhJZ1Rn?=
 =?utf-8?B?WE5KZTJQV2VZREY1RmVnekVpM0IzTFVIR2NzZng1VDlhamxJZWRHNWlQbU0w?=
 =?utf-8?B?aVNUZlNIeUZ0aysxMmY2RXBYOTJCYVQ1Tlp0TC9rTVFLNkt2a29kQ013MmVa?=
 =?utf-8?B?NkNtQmZVcklaTEFjVXF4WGNHU3F5TXdtbWtTMWNSazZjcktMTDlaQSs1Vmo3?=
 =?utf-8?B?N0RoSVh3WUh5b3R6VFZHdFkvMVE5MThHRzhGSVVVQmx2aXMyb2RWaGdVOFdj?=
 =?utf-8?B?eVAzL2p1Nm52QXAwOEk3WVhSVy9uZHZYa1VJbHJXTEhESU1OQnVwOG11dzdU?=
 =?utf-8?B?YVd5V0x2V25Nc2h4RmZnT3hHQWw4am5wa3RMUnhzUUJGYXlBSGtnZDdYMGFy?=
 =?utf-8?B?UzAxZmZaUkNkOHdJMmNGS2pYMlZSbE5vQWlRNUhhR2dqblBDcHhsK2VBTi9J?=
 =?utf-8?B?b0ZWWUl0cllKdTMwbXZwTnc4UENqYkx4YlFPL2l6cnVzelhvOHAyZXJOZStS?=
 =?utf-8?B?bWJsNzhzODVtNnZVcGJqaVkwMTZqMFY0RDY1b2M3Z2RubFRXUkxMdlo0RWpD?=
 =?utf-8?B?TFBhNVRQWlJjMm4vTWRvcC9NelQ4Y1pSbzJxdXQ4MmVueG5OU0hrWmZ5OTZZ?=
 =?utf-8?B?T0VjUHJHbEgrRFJKUnplK1JqeVllVjVpQ0JMQ2M3eDlFQm1mV2pGc1ZLSE1J?=
 =?utf-8?B?U3NmVCt2WU4xVG94TDJPbkhpTSttSkg1TlZqZUkwUXZBRWFwRWdpNUtiZEho?=
 =?utf-8?B?b0ttU1dZc0p3amhGNzg5R2pacFhwMk9wdDdiWW0wTTUrV0daOVl2U0phY0c4?=
 =?utf-8?B?cm5DNExCdUd5VllrZWU5WGFOekZlQ3JKa2VNL1pOQzNzQnlZRVJjbEltbVcz?=
 =?utf-8?B?eWV6UUV1Ujc0VnVRSWdhdVZsb1VERWFZNkw1dDNpTTVnVGhYRUlwSURCNk96?=
 =?utf-8?B?ODF3c2h0eGF5M1J3bm9PQTVydU1hSm95bUpBSjBUVFJzVzdmY1NVTVFXZ1lH?=
 =?utf-8?B?ODNubGlmczU4U2Y1ekhwek5aVnRGb2VZVGxhK0pEd3hqUU9HMVRZMEYzRmYx?=
 =?utf-8?B?bWZCbWxxekxxZUU3MGJwalJnOVlSRXRxY3MzUWhNbVMxbCs0eFRRZGtaakh4?=
 =?utf-8?B?Q2lSOUJHR3h4Z1g4MVVXMWVQeXRaUXM4bnBpL3h0KzhKTThuOGt4bm9xM2dr?=
 =?utf-8?B?M0cyNkJhblQ2ZnlFSDhkSncwNzJhUkNmVzR1Q0l1bkgyVlVWTzE1ckNBUmFv?=
 =?utf-8?B?d0d3ZlpHd3hKaFNRZ3lVK2xoVVJHWnp4MklLODZlakRoQU5Qdlc4NithQ0My?=
 =?utf-8?B?aWFRMkVtZ3UvYVJBN1VyYlVMaHp2Y3pCckxKcE5HaTZ0NncyM005RDFUcmRO?=
 =?utf-8?B?cEdJTzBNSEtCdjdDUVYwOGxWb24yM0s2YVJqUDVlNWRpWjFrcjhubHlUdWFZ?=
 =?utf-8?B?UjU0ZE9tVmYxdUd3UUhVRGVOUm9sMHRZR2hSU09TTmtIcEw2RGFvUUhMckQ5?=
 =?utf-8?B?aU16cnFPU3Y5WTlaVmpYdlo2QXdzVkZnNkF2RHNoN2dMa0lRb2FleVlZeGI1?=
 =?utf-8?B?bEUwQ2VPT1JscFUvMnRZZ3NuQ0RabytUMFZtaDlVZUdPUzBVWml0Z3Z1eWE4?=
 =?utf-8?B?S24rMzJvaVJEckVHRHhqdW5XV1B3UktGQktnVGhIZTZVdnJVYXhOazJTSjJQ?=
 =?utf-8?B?VUZYUndhZWZ4ei80Q25lL09hUWY3SU9WUm9qQzZjc2VsTmU1RzlDMTZyVDkz?=
 =?utf-8?B?RW1xeWhPd0FnZlYyZ2ZhM0RidEk4aWpjQ0lmcEpQVUQ3QWVxc2w2Ykg2UDBx?=
 =?utf-8?Q?fcn4s2Qgz26cPW/4=3D?=
X-Exchange-RoutingPolicyChecked: UflKfSmsO4R/QK+haCPTTU2R+UK61jrvXumCDEM9iJqqJcsizCFCC+BYq3BvizvcjxGdtNGJM6R2rn3LSEOKRpK69/lWFZTUhS9fGaTNgPiUhQtbqlbW0VWJFH4eY4D4w9mKrJWch2FnoIIVYjr5kFqvoxf0r/MD+oV6OKC1wsbTPjeNqViFGt2CmCfAG7WGNYEXv472r/9x0MbvrUAmwKmtos4bI17szvvddLvkRYdbB/RrO3B6Fz2IF0kBNkQ225BT//8pt/IZCqW1KMMibetOd1vcVuKgnlG4k6sFO8q41A+l8oR95H+aPyCQIGIi5tvxu8+vcyVGv5UasNSjew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ee7b91-bb4d-4906-cf70-08def72ebc5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 22:28:43.6026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqkjR9rN7M5CFhIzSP6bKp6m7tgXsgNxJw40BP8tTFmevX+hxiQxsaAHCUKbSEiGOVQkJJCOcv5NRKlZMs4troBVvw/HXslt26k3DIXHTGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
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

On Wed, Jul 29, 2026 at 05:49:56PM +0530, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>  tests/intel/xe_err_injection.c | 313 +++++++++++++++++++++++++++++++++
>  tests/intel/xe_err_injection.h |  18 ++
>  tests/meson.build              |   1 +
>  3 files changed, 332 insertions(+)
>  create mode 100644 tests/intel/xe_err_injection.c
>  create mode 100644 tests/intel/xe_err_injection.h
> 
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..afbaf0646
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: MMIO based Error Injection
> + * Category: RAS
> + * Mega feature: Telemetry
> + * Sub-category: Driver
> + * Test category: Error Injection
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_netlink.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +#include "xe_err_injection.h"
> +
> +enum {
> +	RECOVERY_SUCCESS = 1,
> +	RECOVERY_FAILED = 2,
> +	RECOVERY_TIMEOUT = 3,
> +};
nitpick: don't have to initialize RECOVERY_FAILED and RECOVERY_TIMEOUT
> +
> +static void run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	if (state == POST_ARMING_INJECTION_WL)
> +		igt_info("Running compute-square on all engines post injection\n");
> +	else if (state == POST_RECOVERY_WL)
> +		igt_info("Running compute-square on all engines post recovery\n");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
> +								    EXECENV_PREF_SYSTEM),
> +								    "GPU does not support "
> +								    "compute on engine\n");
> +	}
> +}
> +
> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
> +{
> +	xe_mmio_write32(mmio, reg, value);
> +}
write_reg is called from one location. You might as well call
xe_mmio_write32() from there and eliminate write_reg().

> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
Both acquire_forcewake() and release_forcewake() are being called from
only one function. You might as well eliminate the two functions and
directly call igt_debugfs_open() and close().
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct app_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = init_nl_socket(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
> +		return error_value;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	cleanup_nl_socket(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)
> +{
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	ssize_t line_len;
> +	FILE *fp;
> +	const char *success = "AER: device recovery successful";
> +	const char *failed = "AER: device recovery failed";
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		(void)line_len;
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		if (strstr(buff, success)) {
> +			igt_info("Found \"%s\" in dmesg after %d secs\n", success, elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_SUCCESS;
> +		}
> +		if (strstr(buff, failed)) {
> +			igt_info("Found \"%s\" in dmesg after %d secs\n", failed, elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_FAILED;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return RECOVERY_TIMEOUT;
If the code flow reaches here, it means neither success nor failed
message was not found in the dmesg log. So, there is no timeout here,
even though the above return seem to indicate that there is a timeout. I
also see that the calling function doesn't care about RECOVERY_TIMEOUT,
so it may be okay. But probably another enum say RECOVERY_NOT_FOUND may
be more appropriate here?
> +}
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 5 * 60;
> +	int time_interval = 30;
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg_for_recovery(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return RECOVERY_FAILED;
> +		}
> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return RECOVERY_TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == RECOVERY_SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static void log_status(bool val, const char *err_name)
> +{
> +	if (val)
> +		igt_info("Injection status SET: %s\n", err_name);
> +	else
> +		igt_info("Injection status NOT SET: %s\n", err_name);
> +}
> +
> +static bool gt_uc_wkr_parity_recovered;
> +
> +/**
> + * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err
> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
> + * Functionality: error injection
> + */
> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t error_counter_before_inj;
> +	uint32_t error_counter_after_inj;
> +	uint32_t node_id = 1;
> +	uint32_t error_id = 1;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	error_counter_before_inj = get_counter(node_id, error_id);
> +
> +	/* Arm the injection sequence. */
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
> +
> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +	error_counter_after_inj = get_counter(node_id, error_id);
> +
> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
> +		     error_counter_after_inj != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
> +		     "failed: before injection=%u after injection=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
> +	gt_uc_wkr_parity_recovered = true;
> +}
> +
> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
> +{
> +	igt_info("Starting Error Injection test: %s\n", injection);
> +	if (strcmp(injection, "GT-UC-unicast-wkr-cmd-parity-err") == 0)
> +		wkr_cmd_parity_err_injection(mmio, fd);
> +	else
> +		igt_info("Invalid Error Injection specified\n");
> +}
> +
> +/**
> + * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
> + * Description: Run a post-recovery Xe workload after parity error injection.
> + * Functionality: workload validation
> + */
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require(xe_mmio_is_initialized(&mmio));
> +	}
> +
> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
> +	igt_subtest("GT-UC-unicast-wkr-cmd-parity-err")
> +		inject_error("GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
> +
> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
> +	igt_subtest("GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
> +		igt_require_f(gt_uc_wkr_parity_recovered,
> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> new file mode 100644
> index 000000000..d7efc2fd2
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef XE_ERR_INJECTION_H
> +#define XE_ERR_INJECTION_H
> +
> +/* GT Uncorrectable unicast worker command parity error injection */
> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +#endif /* XE_ERR_INJECTION_H */
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..0f090dcee 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>  	'xe_debugfs',
>  	'xe_dma_buf_sync',
>  	'xe_drm_fdinfo',
> +	'xe_err_injection',
>  	'xe_eu_stall',
>  	'xe_evict',
>  	'xe_evict_ccs',
> -- 
> 2.34.1
> 
