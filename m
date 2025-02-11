Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69C2C0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 05:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C0B10E178;
	Tue, 11 Feb 2025 05:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCaO8Z8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1C110E178
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 05:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739251882; x=1770787882;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hUfdyIOV0a+70RlhosseGKsAwVDSimG+NlNpFj2R+SM=;
 b=nCaO8Z8gFKwyHMaugb8w+HCxxWGgkeEFq4lEsdZb2FuO1kV2I5TZf2Qp
 5RY58rPdm5KyfZbkvV46AIPnJndmsAc5oq700t3ZUEqqNbTs5/Ey/qJXY
 iK2draA/LuhozRc/+J0D1M9K0y31Qx2tqvbIZcg2VB8dpzH1GqNSn1y39
 gPu95ivkQeBSAqQWrosZ60lA4F+yl09fiAn+87ZKSmLd8XilvFSMiyupE
 0zKlLN/zl0l0AFvjXx90R1l5v8JxZDlYoUk3YQ2MrPAe8CIozHQ2bYL8e
 VRiHZ4Uqw2wbUateaX4rJ17oO8v/QAfAgud0YAXApTIojuOKrXrv0vC6a w==;
X-CSE-ConnectionGUID: nRnRvNDbQg21HYp9JiHjxg==
X-CSE-MsgGUID: dtejhznWT0KUFGbVzjP5Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39720426"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="39720426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 21:31:22 -0800
X-CSE-ConnectionGUID: hU2lZ9JYToSgZDtdqyKGgw==
X-CSE-MsgGUID: v3h35nauRui8ykS3Z1nMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="112377203"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 21:31:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 21:31:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 21:31:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 21:31:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxXKdcJ1yLz7Wofesb3bTSRGefhClzBve4r101hUm6CHRb5503uyFmk7jZoSwPLG7tXrmuJPIwMHEA4hpCju5HGcXFdzGTVNzrB/gWL337oNQ6CD4uEKC6p+4reg+tpT21k3zaox6uTl3HqhqAU60voWXWP0d+dkR7RVq6ApobTM4je/zuJzN7yP/NR2aaokrqx8jlf5TqZstuvrQlYxt74XojBkJohOQTjRUbiQu8zypqENm6inJx4QqAoqSK3LD9EMHzSuMWWvhlLi+VNqe6J44TGCqp9SNc+MUFQr8fnSRTckZkCJK8OIla9s18641nEQRI8c4ERL7H9v5Db7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuZAu4atmlsM5xoQxvEMFtxx26lK3X1dYiBjGzY7vIE=;
 b=QiL1WEPNUtS2rXWfiwqjzo0CSdjasyGN+BM9S9OphhhL5WMWTprDHwYkmiFKVfJEdekLeJwXPFGfQHRDmIIhN4Tu/EFVyicR7nvNJEiN7UeWCd3dEgUrEYhYdv0HFuzo11M47rtm+r74yKJ2WY+LV59LnDwXVx/Pxn7dUT0O2n4klGT55SlABoscQqMmvh1BYQDkpZrFJRfTiiy+GlnPw6W/VzfAjtVOb95ESdDYvaIkryvi4PT+dPcVL78G6svZxAezzfs51USQwgffowmCAT8XTjz6JtGstGDSZKt952piw7srzG14oA1GQlaDqX5QWSguRKXaWc7JWPNZO7v+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 05:30:51 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 05:30:51 +0000
Message-ID: <958a25f4-ac05-48a7-8e2d-54e925c71914@intel.com>
Date: Tue, 11 Feb 2025 11:00:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] tests/intel/kms_dp_linktrain_fallback: disable
 ignore long hpd
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
 <20250210185606.1327892-6-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250210185606.1327892-6-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: af73fce8-535f-4dc1-f880-08dd4a5d3f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjE2b1NlVEo0ZTR2cnd6YU1FT1pCSXFJQTJLekZ0bmtOOUlwTHQ3L2JnNnU0?=
 =?utf-8?B?aG8wZmE4YWs2cjljbUt2WlhhN3lRb0E4TjV2NnJhbnFHNlIzV2Eva1RJbmtq?=
 =?utf-8?B?Q1c2VXFWZFpIYzdic1IwdklGUW9OTmN4MWc0OVlZK3J1SC9kMmZFbWdhSTVs?=
 =?utf-8?B?blk5TEx4Mmw2amwrUEludysyTFFCcnpjMWt5SWNHNTIxdUpsR1kxNVFHY2gr?=
 =?utf-8?B?UGxabStDMThJcFBJVE01UTFiUm5vYzNvSHliYVM5TzZKOGlyZTJQVW0xcTZt?=
 =?utf-8?B?M1FUYVZzMFFXUUsrSEFkYmdlSHQxZnVIK2Z3WEdmdEV1c0JxN0RPRWxUaXdi?=
 =?utf-8?B?akh6ZUhoUEJqQmlKUmZMV0VLbXBzbXlBbGNTcjhrR1RaS0NrYWl2enFUcVpN?=
 =?utf-8?B?aHQ4T0tDamliUGdMZklqRlROSjlQRXpVbEJqd2NFOUVlZ1MvVXlicGdObFJ1?=
 =?utf-8?B?THZZZllKVUxIclJkUmwvdXZacGlwU1A1akk3N2p6ajk0VnVXN2d5QlArTFp0?=
 =?utf-8?B?TTJvMld5aFJScFZDeklndks1THRDd3U5TlQvUnJkRExSeXBRMVpsMDhCOHd1?=
 =?utf-8?B?aGpBc05DaGxPL2Y2TTZFSW9qMlp0aisxR0diRzlRUUNhdGJ5QVR6bHpoWFA0?=
 =?utf-8?B?Z0Naa1ZtZ2FmTGR1d2pFM2ZOM1I5eG1Dcmh4NmJpVkJKSnZjczl2MWN3cmdk?=
 =?utf-8?B?QmFkSkVYQ05JOW96RW5pSkdNVEJHR1kreEplb0JNSDdHMWtIY0lTWEhIRUFj?=
 =?utf-8?B?elBEdVQ4ZGl4QXpCRCtXcWJWL2FJQWtWN0RBbjFERktUaStqbWtUQkg3cEdE?=
 =?utf-8?B?c3FKRSt4Rm1sbFdDTzlWcVBySzdiemtMdG1kT01SZmZSSUdwK21DNCswdEdk?=
 =?utf-8?B?UkpqbjRSejlqM2dZUmtxUGxkU0ZpU3Y2ZDkweWF0Y2RoSWw3cm9OS3dySFJQ?=
 =?utf-8?B?N0lzdkg4NThldGZpU0pKcXk0RXI3QUxCQW9KVjVXbTB3c3Q0S2xDV09BWW1o?=
 =?utf-8?B?dFB5SlBrSlZCN1lDWmpTZWdmMjNoY1gyQUpvVUZwa0RQQittUGo1QUZzOE9D?=
 =?utf-8?B?Ync2S2xMdFpRd3BJTm1FWGtxN002anVqaFpPVjZXYVhRUy9kUkVMUXhOdk1w?=
 =?utf-8?B?bkllQzRLWVVsaHorMFZLcDRjc3g1eHVoM2YxeUtaSW9FNFlQenVSeXFwU3U3?=
 =?utf-8?B?KzlxcDIwd1RyUE1QZG91SWxFeE9wK2RSOGZUeTJSZWJ1YUNkcVFUUm1weSto?=
 =?utf-8?B?MDlHcnNMbVIybUFsYmFBbG9DUlVlS2d4eTBXTjdhOXBvWFZIeVRQWXN0QnJk?=
 =?utf-8?B?VFFMRHAvZXNUaTI2a3NnZTNuQTQ3ODdqTWYveTNKSHBIS2pDN0poa0tnaWJN?=
 =?utf-8?B?UWlRNWZwUGpvdGxMZ3lteTNIK3ZWZ0NkZHBCMCtwTVo4UEx5UklXUlBOVzIy?=
 =?utf-8?B?VWVkSDREd3ZLUy9hQ0k5M2hYN3RLN3dYc2JGRG1OdnJETFRiVFhCblVXSm9u?=
 =?utf-8?B?QlBQNkdLOTFpUUswMU9SczI2RkloSmQ1OUFMb08xRG1qeVVLQ2t6VXNTR0Yx?=
 =?utf-8?B?Z1huRmJBYSsrMm9USFJMbHp0Qm42WnJSMGMrTnVKMUpsUjVMSEptYnFyRXhX?=
 =?utf-8?B?T0lwUmNDb254ZFpoL2FrcG1IYlhzaU9YUmVIbkZsNDZxL1I5WGk3QnVMWWtN?=
 =?utf-8?B?TWZSN1Nzak1obitDZDFZUzRIS0IyRkIrRGY5anlFZmFzNUhkc1J1UjB6eUVE?=
 =?utf-8?B?bmdnSDRjdXdmdE0xU2p6OXhjUXo4MysrZk9naXFSRWhzbXNHeENMM0VJNkN5?=
 =?utf-8?B?dUNBa1hqQ0UvWFFzdWFNaEFjNTkyN3ZvekRiVzFXRXpVUXBYMHk5c2k4ZVpl?=
 =?utf-8?Q?pH9G67akvzUNS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzJ3QWJlOGlqUi9qRWhNNUozTzBvSEg2S2NFVzB1bEdIbzZiM1g4VVd3QUpa?=
 =?utf-8?B?Wm83UUxoSXdKRFZoNmluZDZUdERtaTlnTUdMQWNSSlphZUR6UFRQVjhKOEVU?=
 =?utf-8?B?RWN0QlVraElhbzZveUtXaFhFVEU0YlNJVkd2b3BvU2V1UmVVdW5xN3VkU3Jv?=
 =?utf-8?B?T3UrNVBmZ0VmaEEzeVUwU1JLL09NK09GUUl1bmhrdDY4WVFuR0lIcTBCMnJB?=
 =?utf-8?B?YUNPWkpDbzVpZVRCNC9ra0k3STJTdW1jYnUzcCtBU3E5T3dKeGVIV09DbWZD?=
 =?utf-8?B?SlQwdys1bjJGRFNIS1g3ZktvVDY3Rng2Y3A3Q05zdTJJbkFKaGxkWWxrM09n?=
 =?utf-8?B?c0lHWmNDTFMvb2U0SllUaFdPVkFZK05OMVQxc2EzT2htRStGS3M1ZGtTem1m?=
 =?utf-8?B?ZzFiZW1TZ0tTZm93VmhXemloRUJCMHp6NysvendaNmUyWG5CTkFuSkpXNjNr?=
 =?utf-8?B?Ly9wUm9CRXRSZU1WNmxlbDV3WTJCR1hNR0s1Sm9qUzA5NkZBaW9YckN5OG9J?=
 =?utf-8?B?eGVDSUYrazZtOGhVU0dhb3J4dzlhL21EL2dnZ3M1UDdweWNoQVFPcUNWZ1p6?=
 =?utf-8?B?WExJNnJ0Zy9NL2tEVFNYNEJMNXNubkIybnIvOUVQOU9Hbnp3WDhDNXpqcEVl?=
 =?utf-8?B?ZjJFQTl1UU14QkxTc0VyRXpHL1FQUFpoRS80SlBKb0JVamM4YjdYYkhtT3lp?=
 =?utf-8?B?SnlpdGlPbWlrRHdGdVkyaUwvQTdjcUVMSGMwSjJadTVxQzNHZlpINW1IRGhw?=
 =?utf-8?B?Ym1qZ2RmeVZvb1cwdW5RVUhZRWRBa0Y5WFVqcG1NVW02UE9FRWdmWkcrS1dR?=
 =?utf-8?B?bW5KV3lxNHZ2QWxFNkVQY25iaVZqSTVFWUprMkdjcW9wVDVvK3E0KzBSWjFL?=
 =?utf-8?B?M2lFTTdmSElWWWRXZ1ljZTluWjBOUTdqSnV4VnZ4Y2pZYU1JaXhVSnVyMkxl?=
 =?utf-8?B?TmtmYkNKTXdlY0lvVnBpT0pvUFQvV201d1NiSlpuVXlHNTFSa3NyWVV3SXY5?=
 =?utf-8?B?cjRhWjM4eU10U0gxN1c2RE10cWdsNGFmcGFHc0JTSzlYV2NNZjZDMGkvb3Yw?=
 =?utf-8?B?Z1ZuRnkrUjhoa1RCaVUzZ3dMeVFOcjhZcXFDWnUvWXpZNitIQVkvRUtlb0FH?=
 =?utf-8?B?clhwbmFESTdYUkVzeVBieHh0L2wzaFRydDM0SUNyQkZ2VFFidTRGTFVpMHBz?=
 =?utf-8?B?VE5yNVZyUzBzTkx2SHhNTEZVSyt2eEo2TUFRK0dDTzB6b1dYM0NyRjIxYlpi?=
 =?utf-8?B?MmwrWUR6SHZZdkpMRHpQRSt2eURrT2NoblVlVUlKZlZvNnlYZlhBbERSR21Q?=
 =?utf-8?B?Z3VXcEQxU2lZcnJiMStqTUxlZFhKWEw3OHhraU9BN2lLQXFGRFNveU02eEtQ?=
 =?utf-8?B?bjlYVXZUeW9vcjZnQ1lvYXIzbVFNS2paY2ZMZjU1bGYwQjJMV2Mwd1FPMk04?=
 =?utf-8?B?YmN3NXVRNXMxOSsydUNENjJzL0VuWGhKU2JLanozREN0ZnBOT3IraTZYcDlx?=
 =?utf-8?B?T0tBMWt6ZzViM1FrbWM5Vlo1WmVCZ29NaDFFN0tlYnRieUxnK3pjSXdPV2hZ?=
 =?utf-8?B?YTVOemJyU2N1VE5hRXlBRmNqcXJiNmIxWlI2RFYySlI3MVd3Z0lESnZvKzRS?=
 =?utf-8?B?bGVXMDhGbkhaK2hVRHNUcVE5UzMzazZQYkQvdk45ZnJMZzlyMUthOGJGOUpG?=
 =?utf-8?B?bTJ5anA4TFdBMzdZeWRsWnNsdnFPN25pQkpVMEVEbXpGWmRnRVhyMG9TcUFk?=
 =?utf-8?B?VHBCSHRKclpVV0tNbHl3Z1Iwai9DdnBQZHVScURncGtBMHBVZG1IOXE2QnhD?=
 =?utf-8?B?WEt4QURNZ0RGSGhHckU4bk96SEEzc0xEMHdJRlZVUy84b3pEK21rRnRBU0FW?=
 =?utf-8?B?c1VSU1liM2tGbU1vcUhsQlNWQ2pkODdzL21tTGxDUUlQbmdrcG1LTmt4Mlpv?=
 =?utf-8?B?V3VkVVZ4YVVXRjFzZU9aNlJLSEhkelU2WWVEYnpHdlEySmZ1elEyTHlKU0N0?=
 =?utf-8?B?cVcwREJpalduQ2xKOGtnNC81QXRaVGVKMkRlZmZoT1RIY2owVW5zM0hmV1Vm?=
 =?utf-8?B?TnlrTlRXc3lEMlUrMUZvRFZsZk13dEl2cEFnbERWbzFaKzR3NUhQaG9ZMW0v?=
 =?utf-8?B?b0xLQTMzdUlyb0dIYVNjTzhtWmkwb3BjOVJROUt2OEFzTDRPOHFNR2RnaUJO?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af73fce8-535f-4dc1-f880-08dd4a5d3f5c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 05:30:51.5629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSpwjXqjEeyuxhm5jlKjDzz2i53HQZv9dXJrpiYq+YzFYQeZTx3q5ZDGRtf6LbhiyAjfAlK0k9Yz+XiHk1mSAtBnWja8f0mrX3kwRWuQHnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
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


On 2/11/2025 12:26 AM, Kunal Joshi wrote:
> Some systems may have environment variable IGT_KMS_IGNORE_HPD
> set which will ignore hpd, disable it before starting the test.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 69d48ca21..c8d284e17 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -637,6 +637,12 @@ igt_main
>   			if (current_log_level > 10)
>   				igt_drm_debug_level_update(10);
>   		}
> +		/*
> +		 * Some environments may have environment
> +		 * variable set to ignore long hpd, disable it for this test
> +		 */
> +		igt_assert_f(igt_ignore_long_hpd(data.drm_fd, false),
> +			     "Unable to disable ignore long hpd\n");
>   	}
>   
>   	igt_subtest("dp-fallback") {
