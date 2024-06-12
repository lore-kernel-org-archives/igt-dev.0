Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A273C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 10:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C2410E029;
	Wed, 12 Jun 2024 10:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giK8mqm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668C910E813
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718189826; x=1749725826;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=waMWpL+h3zbRyX1AM9hrpWlM7L9acIydcRB4VOLSm7A=;
 b=giK8mqm2weBXxONIxIfE/Z9rXz8J+5R1RhpehG5KyDly4QTKOt+u+RB6
 MuxHZMnQspx5r7z+p1FyJQaSf2l8IVNqgw1GFG0L48mGIqpClZQ9dFk5c
 usg4QBTM3JisEOvhR/t9YsapKSS5Kf4Xq21BvFDRNBXTstek6TFgPlylm
 ceCpwBwND1fWba4/BaB4xJJkKDnFaKsapGRCBKd05vIj5A5RIarftFkuw
 rWHmX1PwA7eETLkEVaVPO2JpS+Em7aHe6fYF+t+6AswuEYtoRRku8/805
 cPFMe6B6QRF8m6kdnrfUFJf8z2ql5v5qb8jqC457VLmJoOPn7JYifSCp0 Q==;
X-CSE-ConnectionGUID: UHt2OuJpScuXyWbVoMJb1g==
X-CSE-MsgGUID: TRHsCO71Tn6uVSqmGlumog==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="12036377"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="12036377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:57:05 -0700
X-CSE-ConnectionGUID: uQpzrJhHRhysxrkQNhmOJA==
X-CSE-MsgGUID: 2Gzu9ydHQq69hm8SVJpzJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39867036"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 03:57:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 03:57:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 03:57:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 03:57:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 03:57:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNKrFfIfZhAUFMWxo8by3qt+llMezI8mFuY7+MhypQM74HCd6bW1XPe9og+Kio0pA8ye0LwGgbyxSXGn+axSSS706aDx0/XSUTpwtACnfyEBHpNSavf+1Lx1dzvjmU05xfxpLoyGSYmN51DJZbXUAEBrA+Xhvd7ReiCqDu9qy5FaF35ctzZzJWwABzX+zIMzOh/C1rZVBzJjGhNPeU1L07nrpK+71sgHSYe1D0WUg0OVR8ralFi/fYLi6VHxxPLg1JTQtKNONH0HFNgtbD7KYdSlU2yYrWPEaKJKIt2p0bjI1tbR6Milz1LsBfqyLpO+mxvgd9F6DjpApGHr7t2QMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZk50Glz1kIslre4NQPJPLDQhIE4eKp/CYMrQ0lB7ic=;
 b=fpVahUipVxqkgxSaRWdA0CEuoB9rKGuzXE+p0YwZreMW42sueschvqXAwLiNnKkTHQcHyGuybgso09ORbl9hg4gGlqti87lqhc8sHO8ydQELqbEkcTuPm2ibhubRFCXrMJmllaOV5PTn/v9xuggB/X730K2m7GJEf7GIwacEAqTLqLK4+Z6HEbo8AhYPJasqX0U2/DvlSuK3uM6HerwXLfyyKoMeKuzFiqyYfjoCg8pNYU4tcEbO45khLpbnbYTT9L2igQ9ALmFUXOpaCHSg8Uru/vhfYQd20mu6z/4kuWgS4zFlRmXGnID8MBofxu6WrDjkmrAormVuyxBE6Fwk5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 10:57:00 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%6]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 10:57:00 +0000
Message-ID: <5bd489d6-4582-4580-88bb-65c4fe2580e0@intel.com>
Date: Wed, 12 Jun 2024 16:26:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V2 2/3] tests/msm: Move MSM tests to new dir
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>, "Helen
 Koike" <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>
References: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
 <20240612070335.3758500-3-bhanuprakash.modem@intel.com>
 <20240612085917.fuedflaohprijgr2@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240612085917.fuedflaohprijgr2@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::13) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a93368f-7e3a-4c50-5768-08dc8ace62dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|366008|376006|1800799016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU9wZUJKVkk5RTZaMnV4dWtKT25yRjZCclkyQjlmK3V2T2JLS2pROVlLK2Jy?=
 =?utf-8?B?U1RRaHJXdHo5NnMzZWJrNFJVN0wzVVNRNURKcWY2S3hRbmczNlNkTnhOVzVm?=
 =?utf-8?B?cS9WbHhKZ0xjVC9mV2VDak9QR1RUbEpOQnpISTducEVwc2h3SjlEQVNwYnlj?=
 =?utf-8?B?aDNZUjVBd2liN2kzMHVqbkF2Y1RRcDNSZksxaUNrbi9kU09DQmJDaXFoa3Vh?=
 =?utf-8?B?QXpBZWdqZ1BOZXpCMFBLOTZVditxWHozZXd4NW90WGp5VkNHVlNZWENLaVpk?=
 =?utf-8?B?L1RIdUVoTkxhRWFwTHVWN3ZucFhudE1nSzlub1ZQMCtHOElVV3ZOMmFxekdy?=
 =?utf-8?B?b0xJN1l3M3pua2lpT081ak16Z2dvMkZ5WTZxRU0wVEdVd1RZczVBM0sxSysr?=
 =?utf-8?B?bzBUQWhUNDZOcks0ZHZWaXB0clV4K2x3UmlBeWFsSTFhbVFXdUlzbjBaa1d4?=
 =?utf-8?B?U29IbnhGaFY0QjNIaG9oOXNKOVRwT1R1a0VVQWtMeEt0R29Udmsvc2xLbzgv?=
 =?utf-8?B?QURVc3VDdEt3Yjh4VEVUVjZQb2JFRFFlZDB2Tytidm13MjlLMmtlVGRUckZn?=
 =?utf-8?B?QUpkbVVYUkszT2RWVXpTenNBemtHa2k1YVZZSk1wUy9MYzBWY2xKSjdaUEFE?=
 =?utf-8?B?MDhrTVQrY2JRNGxEeDNBRVprQzEyVXhXUm0vREJYN1ZnSjUyT1VuY0NzQ0Z4?=
 =?utf-8?B?N1ByeEY2Y3ZFN2Vsd2hja2xkOUJvY1paa3VnVjRkcGRXdmtFZGh6bEcxeGVv?=
 =?utf-8?B?NkMzWC9CR2RpYzBSeFlYMG5xbWJXNTE4d3UySzE4UWpXYjd2T2FpRkRsVnU0?=
 =?utf-8?B?OWJub0U1eThIL2VHR21LSzFCaG9UZWJkWGVyUGFCSzY2TnBVUG4zZ2w5VVJC?=
 =?utf-8?B?Uno0dElBMnFHeXdWWWVISGdScVh2RkFNRmRYQjZKU3V4TnJUNktmOVZrUlJs?=
 =?utf-8?B?SU9oVE1JL0FTa0xLbmRtNk9oNFdGYlNCUmFGQWVlUHV6ekdtcXB1TVNuNmY4?=
 =?utf-8?B?VndHSlRONVA3eG53bE5YcDc0NkQ5WE1MV0FObSs0Q0xIWFJkcGNzbkduNDJx?=
 =?utf-8?B?ZUZIWUVkK3R0WTRGT2NXOXVlU0JVWkh3SDlqMkRnb0ZoVGVsMTQ4Mld3eFVH?=
 =?utf-8?B?RytFb2puVXFmZ1BSNzNBRFh6TThBb3J3clRBcW5IdGw4a1V0VCtNZUFyNTJG?=
 =?utf-8?B?dEI0NXI2bTFWR3ZwTGUxUDNEaktZblBNT3dxZVBwWmdDeEpuLytpOWhWajBE?=
 =?utf-8?B?Ry9jVDU1RGxmN0J1UDZqbUs0U0YrTHpFa2V3MmRxWWhHR1F0aVRWWHUrSWY0?=
 =?utf-8?B?KzhhVk1UTTZvRzAreDcyQTZxRnI3RENiMVhIS1kyYUVMTVlHLys3MEFXMWZ6?=
 =?utf-8?B?N3Y0WEJDMHFTQUNHUEVsckFraHlFbUdWM1dmMzdJU2o5aGdsUVBRVjc5UEdR?=
 =?utf-8?B?cG55cHV3VnkyQ0gxelRPREtNUlZVWElvd25zeURwNWNVTW9NcFMzVHN2TTFi?=
 =?utf-8?B?N0JDSi9EaVEvd2d4cUowK09SUUFvZzhQck55VTV3QWsyalJ3K0VrVXUyZ0FK?=
 =?utf-8?B?cjVXTzFEQTlsM0FXeHlMYlJWbk5Id2FXK3QxVkovQ093MzVMWkpWMEd6d21v?=
 =?utf-8?B?K1FDM1d1VU9UUVQ0QTFZaVZHbU80bUlrbG92YmhReVpTNG1XTWVvUnBjYWpv?=
 =?utf-8?B?cEhhbWJYRW0yV3VCYUk3TW1leUY5RjIvODc4UWVIQ1NlT2pyYjVwaDhvc2J2?=
 =?utf-8?Q?QTc15fLcHQyANSz3WBboNu0PeePYyQvE6N8IlJU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(366008)(376006)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZaeXRnY09Ja0hjQTBXeDRpSDNBUDdtWU1KZXFRdWtkTlN6cWU5NkZxZVBp?=
 =?utf-8?B?Ry9KOTFUU3hLdC9ZSjFFYmlMMzNmZHJwRkhuY2xQcE1GazJaZkNjanB3dTh5?=
 =?utf-8?B?Mm4zZVlBQm1HTURnRlhWajE4RXlFVFJteTJUSVhDOU5HaG5YRUk2c0dyQThn?=
 =?utf-8?B?NlF2bG9yeXBoUjhhRjZYRkVCR3FWVUREWmh1ZzBaMHFHak1KUXQ1YmpTeXBK?=
 =?utf-8?B?a3RCdkFrZUxPR0d5aTlRdjJDdGpKS1l4c1R6cm82eVUxdmgzTHVBRisvRXdR?=
 =?utf-8?B?Wmc4MWtrTHhSRTc0RXJDTWxkblVzVkNPSVBFZi9hWDhoUHpIa0lRTENuVEpv?=
 =?utf-8?B?NlJJL1hTWkJsN3d4Q0Q1M1RoSTVnbHFPK3BBYWw4STd0UG15WXhCV0hRTkRQ?=
 =?utf-8?B?SVJqREVUQzNZemI3bG9hSU45S1dqOTJqdklXckhUY3lidGs3N0orWlk4TkV5?=
 =?utf-8?B?L1V2UytoMW85Ym1haFU1M1psUHRtUnRvKzU0RnFOV2ZnbWw0Mlc2Yk9aZW5D?=
 =?utf-8?B?TE1DM25HdFpKOXFlQUk3N3NDb0RnTU5la09pWVYzQTlKQnYxVERjTndRVENk?=
 =?utf-8?B?ZTMvT2I3S1cvSUxPRE93R1NDekZaOTVKU2ZvOE9IVE1QdFdSVDV3eSt4SDdY?=
 =?utf-8?B?WFhTY2d6b1hCcFdhQkYvdmxDTDFwV2NldThyQ0JxWER1cWNmd0w2c2ZLV29h?=
 =?utf-8?B?aCtWRk5OZVdZcDBaTzVoMWtTTy9RZDBBeHVxY2xzNFJzTHUrV3IycWo4NDl0?=
 =?utf-8?B?RVp5UExOaGdTenRIMnV5VzhGZWxJemlzZEg1VnkzbXUwc1NHblJVdnUxckF0?=
 =?utf-8?B?Y1k1YmkrYkcwNzdwTXRVVytnZFN0Smc5V1QrRng5Um45OUJmTXBzWVROcTkz?=
 =?utf-8?B?MVNxcGowUE9mZDFJMGtudGhqaEdyek5Xc1YvMllucExRWFRXVWIzVFpJZU1j?=
 =?utf-8?B?RjVlZERaTkRjcUZEUG5EMm1walRCdWt6Nm9NKzNLek92ZjByR2lQT1ZUVjNz?=
 =?utf-8?B?ZEpIZXFIeUg2SDE4NFZSbjduaVBUci83WXgrdW9oVnY1RGFpU3RWemZueWlw?=
 =?utf-8?B?OFhEdGRZbTRRRFgzaEdERXJHTHU2Z0ZqN0crQTRDamFnQTYwSTJMYzVqbVVp?=
 =?utf-8?B?YTEyREM5a1Q2YVR4VEtjaUt6OWtaTUtSVmVyWk5lN2x0OC9aZU5pMlM4MEFE?=
 =?utf-8?B?enNsbTAzTXNnNUVLcURVZk92cGdGcGZxcFVaRU5TZnFmRmNUU0JjUE1oRlZM?=
 =?utf-8?B?QVMwaVBxSWk0R3VybHlJM3NDd1U2MVdmOGZVUzVKVnV1YjVER3ZDbUFnc3cy?=
 =?utf-8?B?OFN3SkloZ3NuZzdBTHlWdmtRNTdMR2l5T2NVTXVLa28xNzhMcmRvSzVaeXlt?=
 =?utf-8?B?bzR2dk9rWU1ycXFsdnZTNHRHMWNXYThPcDFwOUNmeDk3bWZMTm5oV1hrUkV0?=
 =?utf-8?B?Zk9pT0VPaW9JbU0xVlRpV2ZjU1lCME5JMFQ5VEdReDkrRkltcm5tN1ZpUWtv?=
 =?utf-8?B?Z3RhQ3pSUERYOVc4MVNET2grQ1JhZkN3RXY5RkwwVy8xQk14SlVCd0pZZ0Z1?=
 =?utf-8?B?elQ1RnMzVVhPZC9NNTRZN3NORThqaXlPNndDYUtzb0V2Kzd2TjMwKy9VeXBz?=
 =?utf-8?B?MWtUbjQzcUFkTzl4Y29haTFFU0pqMjZpeFNQM0dOWmhsWjVJdHdBUjh1d1hk?=
 =?utf-8?B?dkNNcERBcEdTaXViakp6YXFqSDlmaEZ0QmxGYllscEovT0wybTRDS0ltNVdG?=
 =?utf-8?B?VzdCVEVObEh0RDAvdFhqcHhjZ1l2VmY2UGdTYVA1eTZyck9wVGVPbnhnYW1J?=
 =?utf-8?B?dVRYai9yUHJicU93RHhHZmlpZFhNRVVmY0VGSmRnTWY4V1ZPMWNYTlZZcVJO?=
 =?utf-8?B?aEp2YlF4Ky9LOVR4VHBrL2E3c2lHMlFqQ3hyVEZESyt5VzNtZTJLcG5MTTdl?=
 =?utf-8?B?RzhqMFVlelJMY04rbjFCVGxoZnRObGRybGVOYVd4Y2dVcHpWZGFVNUhVcnFo?=
 =?utf-8?B?aDJjZVkzZ0kwOWJqL25xeTRlbXRuT1I3ajZJSm1FZmxmY3U1dkd6TEhwcWxy?=
 =?utf-8?B?OFU0K293MVlIZ3lpYk1USC9FUElJakZxeXlUbmlnd3cxcTgvRlF0WDNBN3B6?=
 =?utf-8?B?bklVK1pZa3N3L1hrWFUwZGVuT1BMNVZoYkt2Zm1QYVBxd3RpU1UrcVBEcVNB?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a93368f-7e3a-4c50-5768-08dc8ace62dd
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 10:57:00.7160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBVFb/FXsLK7EkOylNpQiK1ojUddWv2nyIbdF/LjBr/XTeGDQtAiVqzgvNiMc1S3u9gYtAQuT6QKv1oNPSIrb6WQsaiCq8VD/FvCYga91zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
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


On 12-06-2024 02:29 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> On 2024-06-12 at 12:33:34 +0530, Bhanuprakash Modem wrote:
>> Move all MSM specific tests (tests/msm_*) to new dir
>> (tests/msm/msm_*).
>>
>> Cc: Rob Clark <robdclark@chromium.org>
>> Cc: Helen Koike <helen.koike@collabora.com>
>> Cc: Emma Anholt <emma@anholt.net>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Acked-by:  Rob Clark <robdclark@chromium.org>
>> ---
>>   meson.build           |  8 ++++++++
>>   tests/meson.build     | 19 ++-----------------
>>   tests/msm/meson.build | 16 ++++++++++++++++
>>   3 files changed, 26 insertions(+), 17 deletions(-)
> 
> I do not see any msm files moved, is this an ommision?

Yeah, we are not moving any source files, but we are storing bins in new 
directory.

Can I change the commit message?

- Bhanu

> 
> Regards,
> Kamil
> 
>>   create mode 100644 tests/msm/meson.build
>>
>> diff --git a/meson.build b/meson.build
>> index 701a5cc35..6ae3c2684 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -276,6 +276,7 @@ includedir = get_option('includedir')
>>   libdir = get_option('libdir')
>>   libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>>   amdgpudir = join_paths(libexecdir, 'amdgpu')
>> +msmdir = join_paths(libexecdir, 'msm')
>>   panfrostdir = join_paths(libexecdir, 'panfrost')
>>   v3ddir = join_paths(libexecdir, 'v3d')
>>   vc4dir = join_paths(libexecdir, 'vc4')
>> @@ -316,6 +317,12 @@ if get_option('use_rpath')
>>   	endforeach
>>   	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
>>   
>> +	msm_rpathdir = '$ORIGIN'
>> +	foreach p : msmdir.split('/')
>> +		msm_rpathdir = join_paths(msm_rpathdir, '..')
>> +	endforeach
>> +	msm_rpathdir = join_paths(msm_rpathdir, libdir)
>> +
>>   	panfrost_rpathdir = '$ORIGIN'
>>   	foreach p : panfrostdir.split('/')
>>   		panfrost_rpathdir = join_paths(panfrost_rpathdir, '..')
>> @@ -343,6 +350,7 @@ else
>>   	bindir_rpathdir = ''
>>   	libexecdir_rpathdir = ''
>>   	amdgpudir_rpathdir = ''
>> +	msm_rpathdir = ''
>>   	panfrost_rpathdir = ''
>>   	v3d_rpathdir = ''
>>   	vc4_rpathdir = ''
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 16896de99..122fbd07c 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -314,14 +314,6 @@ intel_xe_progs = [
>>   	'xe_sysfs_scheduler',
>>   ]
>>   
>> -msm_progs = [
>> -	'msm_mapping',
>> -	'msm_recovery',
>> -	'msm_shrink',
>> -	'msm_submit',
>> -	'msm_submitoverhead',
>> -]
>> -
>>   chamelium_progs = [
>>   	'kms_chamelium_audio',
>>   	'kms_chamelium_color',
>> @@ -424,15 +416,6 @@ foreach prog : intel_progs
>>   	endif
>>   endforeach
>>   
>> -foreach prog : msm_progs
>> -	test_executables += executable(prog, join_paths('msm', prog + '.c'),
>> -				       dependencies : test_deps,
>> -				       install_dir : libexecdir,
>> -				       install_rpath : libexecdir_rpathdir,
>> -				       install : true)
>> -	test_list += prog
>> -endforeach
>> -
>>   if chamelium.found()
>>   	foreach prog : chamelium_progs
>>   		testexe = executable(prog,
>> @@ -457,6 +440,8 @@ endif
>>   
>>   subdir('amdgpu')
>>   
>> +subdir('msm')
>> +
>>   subdir('panfrost')
>>   
>>   subdir('v3d')
>> diff --git a/tests/msm/meson.build b/tests/msm/meson.build
>> new file mode 100644
>> index 000000000..74169b5b2
>> --- /dev/null
>> +++ b/tests/msm/meson.build
>> @@ -0,0 +1,16 @@
>> +msm_progs = [
>> +	'msm_mapping',
>> +	'msm_recovery',
>> +	'msm_shrink',
>> +	'msm_submit',
>> +	'msm_submitoverhead',
>> +]
>> +
>> +foreach prog : msm_progs
>> +	test_executables += executable(prog, prog + '.c',
>> +				       dependencies : test_deps,
>> +				       install_dir : msmdir,
>> +				       install_rpath : msm_rpathdir,
>> +				       install : true)
>> +	test_list += join_paths('msm', prog)
>> +endforeach
>> -- 
>> 2.43.2
>>
