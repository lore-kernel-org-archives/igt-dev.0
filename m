Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABAFC35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 07:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B34710E500;
	Tue, 25 Mar 2025 07:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2qripWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89510E503
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742889408; x=1774425408;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KPJomCBDjrn09kFslK5nxP4Vg48Xh/GnXf9/dQ1o7/Y=;
 b=F2qripWPR8iBBmref0q0hqYsx3c67VKFaqH6g/cInRlWzBmwQgoC7NlV
 azxag0CQzzWGhjGMbbQk0N0b/XCVY3nAaSTMQU/FotPZX6goBoU6qFddj
 DvBcBo7afJ3KrPpIhbBqA278WN3IiFBlWXxKoS82pNj34tFWlpq9JAI3B
 /q7s+8xPe18qLiGhAuw8zbadggYWAPW71gO9APU1MAhmy3oedLpujROfu
 /YYx8b5ilaWEkg9+WN0tjNjrcWA5476aBzsYgJuh1ehEKY8TP30iLN+D9
 1ML0Lag5rhT4+ko9agMulx7kkrX8qbXtgQKbza1j9gF0MIIFLkqC2VQ1F Q==;
X-CSE-ConnectionGUID: EMUKdQYvT2CbGZum4x0TFA==
X-CSE-MsgGUID: i+MqtvhUQAKRBXgOnvFQaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43846633"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43846633"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 00:56:46 -0700
X-CSE-ConnectionGUID: vHoLPV5NQu6yZsBxX/0Ksw==
X-CSE-MsgGUID: /C8Tg5U5RPqG3rmujHG0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="125236078"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 00:56:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 00:56:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 00:56:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 00:56:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTld7ZKbtFmEPECN3ofEHbcnIapM/xkbC/ComIewwhpwa5QZtDQDM506Mz6hk2Ail1jR4IPEPS7XuRHZJjS0rnAwuc7hkSUDkVo2C/TUu1QmD6hEiM88dBfRgvtNbtd/wgskEWE/v4hV/1LfAQYTbZYLaLZLg44a7p2WmDz1uRw2m2poTirUglyU/MZd7zi3E44cWDd9AsoPNl8KfhqUFWDf1r59TeFW064l7IP0zsgPn/Qo7fSg9lokcOw+Fa4TrQ3rfHXF32Fxi2mPRIFe9eneGhihoowPrB1r0e8S9E+SPW1pMncYN9G21/rnMmlMsCCyQ8k5/kzh2MG8zOpQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eee5NLMvRwcDP48H+vNzwX1akDoWlwK5hk6G5H3dck=;
 b=d7sTP1Ojoy7PdyjEOlzWZmRrHSJ2mLgbcji939zJ4ynHqOmbhGkDK0L12uDC8Xyn6f+6Y2NI0jRxDmGmsqrurlmy/aveXJq/kQa7ia7UalZYfVybXQNsuFHibPZQ/P3e8tB/yFhBi5bkHsncbARLJvFYVEBko5Did32wrQ6vX3CNsLxJ0V29i60piuj4D0DaC+02h/WwRvMnBs3rZxnDdYFVRPE7IXtnQziltRKavckFyRQ+zwhI7MaH1SQ7chTB67DpLLyaa9bkXbWXye5b7WutallQKAKXxBgv+xMaFRNV2oQzvaY2LEhGvqQLUru/ZB6FaQee2tztX5pOai/hyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 07:56:16 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 07:56:16 +0000
Message-ID: <10223632-cf88-4481-9387-e10920e22af1@intel.com>
Date: Tue, 25 Mar 2025 13:26:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20250324094419.1180224-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250324094419.1180224-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN2PR11MB4759:EE_
X-MS-Office365-Filtering-Correlation-Id: 822edb1b-d5d5-4e4d-04ac-08dd6b7284f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVcrQndWNndyNGhVWWwwSEtBUGwzQVlVc002VkVVcmVOVlBFSlZoS0xVUDZt?=
 =?utf-8?B?S3VPS00xb1VDSE1pK3VTMDJQekY2Z1FBNkVvakJ4eThnZTZJYndROWdGaHFD?=
 =?utf-8?B?dTAwamd2azBIVG1FMTJucm1qa0pSSm1HbDh1SGp4Yjd1OCtMdHpvUy81QlJs?=
 =?utf-8?B?eHBoN2k1YXhzdzExaDRhYlI2Q0kyR1BtbXFzbE1ucGRBZGlWbGZIbUJISTBO?=
 =?utf-8?B?QnpqU3dIWHF1QjUwbi9LVUhLVUVWK0krZUNUWFh1NXo1eFVKb3lIT3F1a0FG?=
 =?utf-8?B?T1NaL0xNNzRpQW1Bb3BwNm42V3haNTd2aUNteG9ZaGFoWlN1dVI3Z0FBSTJv?=
 =?utf-8?B?NHZYcWJTc2dWcVBwQWdUSVRjUVVVa3BYNzR4RWtydHRVckdMdFpJU2tMUjVI?=
 =?utf-8?B?NE1OZ0dBcG5jVHkrbXdxZFlwc0grV2lFUS80R2sxVTdNeUZneWhXbjhYKzJL?=
 =?utf-8?B?QVpJOE1hUW9zKzRmSC9PK1pYTDFJVjBWclRGbDZEYUJGUUpwZlRJTTBaYmdz?=
 =?utf-8?B?NFRkdkdiU25HUEZMNEh4SVpxdzA1aGpyQ0JUYUJkaWdHeWFtUGNJYVExMktr?=
 =?utf-8?B?azEwSjNrZ3Y5N0ZaNjFpUmVuVjI5aEJQcjlxYjBLRjRvWEtCS3kvVXJjRnlM?=
 =?utf-8?B?YllTakJjd1cydkRiQm5ER2FGemNtT3RMUEJ2S3UrTzRzMTVNTDAweWFZcjd1?=
 =?utf-8?B?RGl6M3dkYjJPcWlUbEk1WUV0NXZmZ09JK3RSNGZ5UHA0cHdNbFpRM2JmMTU4?=
 =?utf-8?B?MDkzNDluK0hTbHBiNUp6T204SUp5bjlna3pMSXo0cjExbzZkVkd2cDBsSk1I?=
 =?utf-8?B?MmlYdDA3RjJkblhyWE41enYzeFNUMEo1ak44dEovU0xsZ2JMYlRaRXV4M0Rr?=
 =?utf-8?B?WUN2cjFoOG1VNEZEcGN3NjF3NFc4S0NRZzRGL0xqTmIwQVQrUXRZUlpiSk5p?=
 =?utf-8?B?dWRtaFkwWWJJRXVza0JtQ2s0SmtZS2hWcGE4T3llekkrREdZSzVuVHcrNGhr?=
 =?utf-8?B?YU14T005YVdBcm43UlZFSTdQRzlpZGJWdkVXbFlYT0EzWTVkQ0JaNHRLWG1J?=
 =?utf-8?B?eFczVSs0RFhYMm5WT0kwV0RvMVZYOXdJcmIyNkl6alorRGV4eXNjOFV5VFFr?=
 =?utf-8?B?TVJ5QTU5QzloaSt1WHFKNm1hQXRnYUgzY0RhSUpoMFpvUG1SbWh5QVFBR2tO?=
 =?utf-8?B?UmNlaUFCT1FDeloyaXFjMGVTR21lQ2dtYUoyMmRWeEV0RTY1cGtLeHFNa1pX?=
 =?utf-8?B?S292N1JnMWgxRDdwQ2NwRzRDZ3ltQTlCQldCNU5Gem9EeFFVdnVYUzJFVzhM?=
 =?utf-8?B?eUo1endEdlllNkhrbitzRjNYK2czRXA0OGt2d3B5NzN5N3YzZ2NtS0ZWVlM1?=
 =?utf-8?B?RlgycE1KV3VGcmNIRzFVUWpiUG8xMk4zUTZUWmFXZmRzelVYbnRwck9qU0pl?=
 =?utf-8?B?MGZMSGtiRDlaQ05pdVV1eW5iMmtZMDlicCs1bE1YK09pUDN1Rit2WDFMRVBD?=
 =?utf-8?B?dzJoZ2ZHVjk0eWhidDF5ejlvbUNjOENPK1JVaDJ0T1hTT2VaR1o3Tll3VEVO?=
 =?utf-8?B?UWlNWFlpZzNiOWlrVkh1SDEzVHNKaHJ3ZjJaemR5NThOWkIwVnN4U1BUNldi?=
 =?utf-8?B?SzI1MjRnTS9reUs5cExrQzFwR1pzZFVhUkF4K2RFVlgyZHJJb083MUtVWmty?=
 =?utf-8?B?SnJlaDlVNTZVK1RSV0xIcnEvZkxKZllraEdFQnJMQm9FQzZVdHVTbGc4ejcv?=
 =?utf-8?B?RjBicnFOdkh5eDhQTjNTb2ZGTTNaUWhOb0JaTEU3bDh4dm9jTDIxcmZPdVVV?=
 =?utf-8?B?eFdXQnhDT1JpV2Q5Y0kwUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1l6aEp0blhkT3RjV2FRMVFmcVUyZ1FVMklrZWpUNXZ6OEl4T1J0WW4zbUo4?=
 =?utf-8?B?SDQvcFJXOXlVb1pWRldJVjZRUENIaW1KcE5Kd0Z1djI4ZWVEem5mWDRKQ0tw?=
 =?utf-8?B?cm8wU0RkMzY0ZlVXcjJQc0ZSTXRBd2F2d2VIbm9oTFhIdk9IMHkyb2paaGM4?=
 =?utf-8?B?akplWEZRRUpjUXYyalB0d1VQSXdrT0p0bVB5ZGZYR1dua3Nab2dKSjhWOXBG?=
 =?utf-8?B?b0tOdWV1R2ZSbTlQSWV6ejQwVGhXZkd5WU5LVEg0d1FaeHZqZVkyekZrSFAx?=
 =?utf-8?B?SDN4MWpUU3hCOWtOKzNHTzUvdS9qNDk5b2ZkcWc5TUdEcmNTTTcrQWIzZlRC?=
 =?utf-8?B?alZ0U0JqUG8zZVNQaDZSbG5ZR3RsN25xbHN0emYxSEVOa1U4UjZHcHNtMWVP?=
 =?utf-8?B?NHUvdHVzMSszMVlmUHp0bytqQnRDTUNVWlU4dVZLVXVqUU9hMGtyWGIwYVFN?=
 =?utf-8?B?eU9TN3FRK09wem9qRmcyU1FWQlYxUXRtelhLNU9TbXFVenB0REJHajR5emxT?=
 =?utf-8?B?ODFscThVTmZ0NWU3TEtFL3ZPWXZGanpVeG1JWG9xM0FsQzNBVFo0REVxK1cw?=
 =?utf-8?B?d0FiMlR4MThNa29kYWtMUGlVLzZld3FnY2phQWVzT3YwWDM1ZDFHTzdjcldJ?=
 =?utf-8?B?SEdRb2FxZ0ViandXczJXS3hoNXNuYkJIRUo1SkVmZmI0bmJWU0NiTHNCR3Y3?=
 =?utf-8?B?UGNhOVlxd2NBbGdLank1ekpuSXBMOStoSDlRR3AwZmxBVUtrQmEwUjYya01T?=
 =?utf-8?B?WkY0NVpKMTZzbmc0M1hVekNaMHZLa09LM21oS3c3aDlVc0d6cnpQWWxRb3NU?=
 =?utf-8?B?MlJ3a0NoU1BiV21LYmxYbXJ1eEQwWkdKTkFmTURXejRwQU5pODlsN2hBQmxj?=
 =?utf-8?B?SDJrM1lWSWhuQlNJOVhyeW85R2RUb0o3SE9XRlliQ3VGbml2amdXZ3JPeSsx?=
 =?utf-8?B?UDN1VzhYdG55SHBmWWp2R0xBNzBTVlVCdHdtQjdmeFg3RTNzN3h0TENPTjdO?=
 =?utf-8?B?NXNVM2pYMVZrb2oxaWFyWGwzbmlaNk03T1VWTVE3bEFVK000Z1IxcjdlcFZ1?=
 =?utf-8?B?TWxxeXQ4OHhiQ2NXTU5oa0p1R1MrbGJ6bnN6ZHUveUpwaGNOdDdadVNYVnRx?=
 =?utf-8?B?YTBydlg1ZXFuK0c2WW8zMUlXWG9Id1E4dytXWUh5ck4vOEZlSlBVejlqZUFn?=
 =?utf-8?B?U3VqY3VjSEhOajZub2dmMEJwVWFGc3d5eXNVc0NXc0lVQmZSSFNHSFg2c2xN?=
 =?utf-8?B?bVZNYmdpWFYxcUZZZmlWZjhpTnFpS041aDc4TmVCZzVrRDdvVHN6Y0VmaThR?=
 =?utf-8?B?M2lRUXVJeUJld2UxVFd0bzZhRy9FUFlFekQ0RGN1YlRxUjl5QitoS2JwcjRZ?=
 =?utf-8?B?ckJEM003QnRYTWplQ0pKcWFYNVY1WC8vdERNWm53bG1nMkRYS0ZrY3B4bDlT?=
 =?utf-8?B?Tzd4aGZIQkg0RzZGZngxQUJIZmw4M2I3Z3VKdG5aSk8rWDYwcTlNNUl0VUhB?=
 =?utf-8?B?bTNSbXlkMXc0aWFkT3cycEZ5VXg2K1k5T29iRENidk5CbmZHdjFtUHEvTnA0?=
 =?utf-8?B?UVpKblNJTHNieGd4WjBLbWdwMmp0azEzU0kxeHpnNkRRTjE2NXJFWUNkS0lZ?=
 =?utf-8?B?ZHF0cEh1Qm81YXFmMEdWUCtSYnp4MUNjRkRIVVIwUkNTbWNmTG1neWZ1ZTJE?=
 =?utf-8?B?SWQ0S0wrYWZWdjZXTVExcDlicjNHRFZacHJYbDJYbXF2eGxYUm1HS243bVVm?=
 =?utf-8?B?aXJRQ2VKbkZQTmZiZ3gvSVVCVGVWMzQ1Q2gyWTlmRCtSTER0SUZpUzBHOFRJ?=
 =?utf-8?B?NFcwNWtoU2NYYTdGR1FPVEpFV0dpV1BtcVd4WlZUUmVtTVpBTXdpcUZiSjVo?=
 =?utf-8?B?eE5UWmlQazgrVkVxam90QTA3czVjN3NRZ0xGVXZlNjFpYWo0RHdtWm0vWWgy?=
 =?utf-8?B?WXBsbGtPMHZzZ0pvajljdkJXRmFzYkNZc0dKNnhtcm1LQWZpeWVXazRkV01I?=
 =?utf-8?B?dHJIOFBWVVBIL3hXbHVDMS90djZIUWNUbm9tdmh5ZklTSXV5TjloS3FrOUhQ?=
 =?utf-8?B?STF2bEdEYXorbEdzcDE2NFd5c0VETmphR0J4S1BoY2lVVDZFcEZvcmcwaEdq?=
 =?utf-8?B?RWI3RVB1eE5mc3YxTjlHZ05VOGQzQ2RiMDFqOUVoc0phUFVFK0IyMG1rZkhq?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 822edb1b-d5d5-4e4d-04ac-08dd6b7284f3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 07:56:16.0498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eV0oFt4A0bjrJBSY99rbTkLRg67LheAc2X8hkXezqm7oTjE22MGk+8sQM736I+s/t+kIa+Uk/LjK6oKVm5PSFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
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

On 24-03-2025 03:14 pm, Jeevan B wrote:
> Instead of checking only the current modes, find a combination of
> modes in the MST topology that can be accommodated within the
> available link bandwidth.
>
> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 588820170..d1083f470 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -49,6 +49,22 @@ typedef struct {
>   	int n_pipes;
>   } data_t;
>   
> +static bool fit_modes_in_bw(data_t *data)
> +{
> +	bool found;
> +	int ret;
> +
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret != 0) {
> +		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> +		igt_require_f(found,
> +			      "No valid mode combo found for modeset\n");
> +	}
> +	return true;
> +}
Lets have this function as part of lib.
> +
>   static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
>   {
>   	int connector_id;
> @@ -93,6 +109,8 @@ static void run_extendedmode_basic(data_t *data,
>   	mode[0] = igt_output_get_mode(output1);
>   	mode[1] = igt_output_get_mode(output2);
>   
> +	igt_assert(fit_modes_in_bw(data));
> +
>   	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
>   	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
>   
> @@ -138,6 +156,7 @@ static void run_extendedmode_basic(data_t *data,
>   	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   
> +	igt_assert(fit_modes_in_bw(data));
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
> @@ -158,6 +177,7 @@ static void run_extendedmode_basic(data_t *data,
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
>   	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_assert(fit_modes_in_bw(data));
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	/*Compare CRC*/

