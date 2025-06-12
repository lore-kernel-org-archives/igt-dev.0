Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFE1C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 04:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E45E10E71C;
	Thu, 12 Jun 2025 04:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAUkIgY1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEDF10E426
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 04:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749703647; x=1781239647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V6f0sqxb74A4et/AGIQC6rZ8FqGEHe26vUqPI1M89ME=;
 b=mAUkIgY169RldR0W4qlQDUnnlETuHhzstS/YzJaGlksfRcV/nB17o0xr
 loRljjrpHyEqOY25zKJ7CY23o+SaEPBXvkHaFiM/M7mbHm1XpSf0mjRNm
 VIgokN/DfRusq16VlR6GmJFU7k+z+qTuPtPLFSVM37kTWV7RQk5TDtQ5k
 ziwpNMSTA1L4s/xWmnXYlFyVmu530O1ZOfyetyCAsyyFoq6Aw8OehVZuV
 c+tm+W7hWKItLl4WR6pdbbPEWBUFY+8nysq1Br7r0mYVwg8o4H6fu3BBA
 tL0Q2psMncZAuw8bhgpKnk3DN2ATQMOdbrBGN2C4fNYDsThLDPYiQou4e A==;
X-CSE-ConnectionGUID: jfymb2LOTGaEUyCAxyy2kQ==
X-CSE-MsgGUID: u0BiTVrOQGiFR3RLT9/JQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69435810"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="69435810"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 21:47:21 -0700
X-CSE-ConnectionGUID: I2OKC5pNR6ipV4I8vHuJig==
X-CSE-MsgGUID: FyWFmNA5TAawMZYkMhn9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147950213"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 21:47:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 21:47:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 21:47:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 21:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mh4WEAxPGW5u7IQH6NtC1dPF5ZJibaWcVSpryNpi4RY/7qOb8kcO0ndEPYeeNR3dsM2j4jySX88Ihi3rBpEOiqgTZLvHel1jPG1UseEZKPqbwWYwIJRHDtri5ia692ohf9LhFyqQbBBiVlpyQBN62A1xbmz5hhE++FyNHjmff5fMDW9g3wtnbeLTxXjQGirMB23GvDo4UeM/Txzmn5aqNX6rlT+y6TNBkoK1UF7Lj2BeCqQN2dEwH0xFxlbpSSC2n51xWrxDAOubY07FBCRq+nI+sQvUdZBNJ2CGadGHUsWbes013DczGpor+t+WhSaUh3u+eblNk4oHZUwhYMBx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSvalOvzYBRUuE5ANdfQd3qmlHVcFKQvHBxMisIhE48=;
 b=iqPPzBzkDWBLvIr5o1alBU2izW5PVaB97K+CLrCnXXbVlVt/BTYjZ5hSdmwmYm9v4IalSDaFL5yMJsSP4l4qV4JEbRk2Lw/xzBIuLlEI0mwEnFkWUHwRo00GQqvKpg56coAOe1QlhDJmxCkGsqFHrppqV4u4F3BKhCDm78njBllEJMCmDqo+rPk7/SB0+q13m8icbfRrduE5hjmYm+vY0kWAyNdPAzTJg8mPyBBdiDHuQgbS7rPa4/Ciucxx+HUhoXmLrqbQPvrhVN4a7dumImYUsKZZD8vpojNV38mIYXB8GwAFbJGOhl1sMs7mbvHpZj/XmlAJ73XmIQjLfOxpdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB8238.namprd11.prod.outlook.com (2603:10b6:610:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Thu, 12 Jun
 2025 04:47:03 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 04:47:03 +0000
Message-ID: <771c412b-8b04-4688-a122-14b19c0befc0@intel.com>
Date: Thu, 12 Jun 2025 10:16:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/kms_tiled_display: Skip if connectors are
 not of same type
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20250603051722.1690985-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250603051722.1690985-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2e2763-5d22-4344-1cf1-08dda96c2cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1hkZ0FMS3EvRjhVV3NwVWdPRUVYeDRlUWZiZ1R3V0huRlhyQitnUUpLZUhB?=
 =?utf-8?B?Ukx3QTBzZU1XMi9HbnduVTRzclJ6WkhOSGEyOS80MmNBQWhvMCtmZTlaZEtI?=
 =?utf-8?B?aWJveXk5WnhDWm1RVU9FMmlzejNuVTFUS05lU0QyRFlyUkRSRWFxa1lUSjhw?=
 =?utf-8?B?cys2L1RlV1hBUEMwdDZ1MzhvUEpMRGlDaGZ6UFdlaVB3emJVaCtKWUJtZFBD?=
 =?utf-8?B?WGdtS2J2d0JUVXVKTXNDYzBETitVMVVxSitIN1Z2RSt3c1hpS0FzS2krZUFz?=
 =?utf-8?B?T0RNQ1BqWldQcWtuU2tkMDcvcFNOYkNBMS9aM3JOcjB3dlVRTThja00rcHJs?=
 =?utf-8?B?S2I5bTVjRDdzaC9jZUJjek9qcmVBQTZmRHQ4K2xLanAzcDA4VnZhVVAvTlBx?=
 =?utf-8?B?YlEydHcyUjFDYW56bXRJY3dvUUd6QVhub2w5bEJKOEp2NjV0UmN4N0lEcTZQ?=
 =?utf-8?B?bXppdiszTjF4Wk90b0tzUnBLSUtrUE5ET3V6aWJJUnF5K2FvS0tBTzFXNklH?=
 =?utf-8?B?ZjNJYXBBQWNmd1d1TzhoSXpjQXVqVk1PRmIrazJGOGVIekE2SlZ3UW92YUlT?=
 =?utf-8?B?SjM2WWZ2T0VDOUErL1NSYitCYmhFR2NjUzlyeUFYTnBzVmpvNFo2S1gwaG9s?=
 =?utf-8?B?LzFpN1poaUQybW5iVFRzanJiSk0rQXRDeXhWeWNvQmM1RWtxdmFWM3UrNDJu?=
 =?utf-8?B?eTh1SHJXSE1seGcxWnQwemdlRmhXYTk4emFtMytGb0d5dEg2OTVPdi9KbUdS?=
 =?utf-8?B?N1dqUitkRjdHWTc1ejlRK2s3TXJsSmtHS3JGaExTNk1Lbm1ERzNQQXE2M0Vo?=
 =?utf-8?B?cnhZT1NLRkdKV0dyTFRzamt1R1pmellPMzQwb3N4MVhPQ054b1V0S0dlSyt0?=
 =?utf-8?B?aGJUOXJqbFJxdVNYYWhRZFhyVy9ndUxYZURnK0dZZlo5VTMwYVRsRExqREI0?=
 =?utf-8?B?SmRmUGh5RG9ZMU1kUEtjRmwyemhOenlibE1vL0l5SnlRWFIzR01nV3RNTWZm?=
 =?utf-8?B?c2JRc0V4MEw4TzRtNWpqdTdjcjBPU2IvYjd3REwvVld5YlhrdTNVRHZkNlQy?=
 =?utf-8?B?YlFvZ3U5bkxKYlNJY1EzOVd1ZjJEWTlqVllCNjFmUG5RZGxtZkw5YjY3TnBl?=
 =?utf-8?B?N1NWOG1EcWpWWTNXclVqQWZFclJLYzJCNW91YmNDcHdmUlJEVUMrNVZzaFhu?=
 =?utf-8?B?dVp4Q3YyQ0JXdmtLK2x4YTAyYXl0T1RCQkxaMEtDaml4MWQwTnFEcE5HbXN6?=
 =?utf-8?B?ZjRrTnRNZmpzdk42L09EbFdoMld4MzAvZERrTTFQdUJ2djRVMXlGeEQzM0JB?=
 =?utf-8?B?K1JzYzF5OXpYL216NnFWK1oyUHE1cFlLSGtMRHZVdjBnL0xDR0NwMXVZVkV0?=
 =?utf-8?B?YjBiaHRqanpXS0RSWnp2NjA2L2lQQ2pmVUxqc2ZNWHVpVmd2eDNPT1RlaG0z?=
 =?utf-8?B?MmV3ZzBLei9DRGt0YURJZ1hKbTVtRDZRTjRmeklkZGo1TGtxNXI2RHNRN2Jq?=
 =?utf-8?B?QnZwZ3Q5RWd4UHJ0UEZRQW9lQkZlZEdPSWhqSXkrR3ZWS3cwZnV4ZGppaWdj?=
 =?utf-8?B?TldKVmFvbHIxaTNzVVk3Y1hxYUpSamJibkNQc0pEVmRMSjJCWkR1NXFiREZF?=
 =?utf-8?B?UFE1M3RsVEdiMTJ3ODFQUVEyamxEcFpEU2hxbW1XT1RzbUR0MEs4R2xMMVFn?=
 =?utf-8?B?K1Q0d0pwOU5lWUt3YnQ5djFkRjkwQVF3WEtIb3A5VFRwdHAvVTlNTGN4ZXgv?=
 =?utf-8?B?Z1g4eUsrTk5zRTlSQ0VpUS9IVTZKSlZGMjh6ZGlPb1lJQk9FeU02N2kvR055?=
 =?utf-8?Q?UQiMKH2mL2Ye83ldw4krEzJXGzVv6bMj3PLZc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0FXUXc5WWdjNFJYSFFyUmtESGszVU5xVHRKdFRRODlHSXRDYmJIeDJkV1Y3?=
 =?utf-8?B?Zndmb284OHdudE9rM2VmMWVLRTh1aFVtVUpiNk1Ta0NxajQ2UFlMKzN3MUlv?=
 =?utf-8?B?ejJWbUJMdmNLNlU1MEpRZEtzYzBQRW9SSGtrMXdnL2x5d0RLZ1Iydm85RUpY?=
 =?utf-8?B?cE56VXJ6L084N0lWNjJZV01ZdmhjYWRSME9oY1hrTk5wd1JZMGFrdUdPb3Uw?=
 =?utf-8?B?bzVobUF1OVBuTGtDOHU1bkdrenl6L1p4cHV6dVM2Vk5YNkppenZqWXhsUXpF?=
 =?utf-8?B?QlEwQThrZU9mQ3FFaDZFcTNQQnRTTG5mVmVTMnl0dDJ6SUJGY3JpWDFieTh6?=
 =?utf-8?B?RTB4TzZyMHdzdGVQRnIzV212SllkQWdrbTNJS0NLYkxldGN1ZmxIZHJwQnVt?=
 =?utf-8?B?TjBtdndRTERUS3RWUmFGYzAzNS9kWHNRMU5veEtFOVZ4Y3BuQW55OEE1eTVq?=
 =?utf-8?B?NG93bFZnQ2xrRElvTlBMNHlPVlJPaFJzZ1JTdHozd3RIMW1IbXJOWmt3VVcw?=
 =?utf-8?B?VWFIL3lCTllUcmtIemUvSGtoM1RPVVFUc3g2L3ladVJmNHM4S25PTmo5TWJa?=
 =?utf-8?B?NlkvN09qZGdldVVxemttUi9VcU1hZGdJMnRlNlgyUXU5YU95NUxsRFBTUmI4?=
 =?utf-8?B?Z1AwQ3BDM0YwZXNTeDVDalZOYnVweGJiZU04OUNMT3AzU1F1R3pDSlhhS0Z5?=
 =?utf-8?B?K0FMZDY0NmVFRkpVZjlWUVlOK2xvQlovNVA1M2tNaEJZVTNEd0hNY0ZnaStO?=
 =?utf-8?B?NHQybFgvS21XYkNuanpZYlppR3E2T25Cc0hYdjhJSWQ0dUlGckZEcER5NE9r?=
 =?utf-8?B?QnBZUmhrUUczUnhScStXZW1ta1ArNWdRT29JdmhXUFFNSDBuSnh5VVlLWk92?=
 =?utf-8?B?OEVERE5XSDIvc1JKVkF1djZBYmZCK0ozV21TVExHSFpHdkxGQWUybnp5RU93?=
 =?utf-8?B?SkFTSG1HeXdaRXB2M2NPZmtuRldvbHh1emJmajBVemR3cnJxZENSWmJESlht?=
 =?utf-8?B?M1k4RkpzUy9hM3FHZmtxS1VteEw3VDJwcU92V09KQ1RuRkxTSElDVVZ3WDBO?=
 =?utf-8?B?MHJqZENlbEFjNysxZGxWOU5oOVVZdWlhNVVILzI4M0ora0k1T1NoOVFaMldn?=
 =?utf-8?B?NjBRb1dYbHZqdEhmdEZLanhNREc3ekNQcHpPbHFzT0wzUCsrZlBEVk9iUEg5?=
 =?utf-8?B?VFlVQzhFOHl1dVpMMTZHOTc4eWRTRE1qWU5QQjI3UEhjcStYcWtIWTdDUS9Y?=
 =?utf-8?B?NmdzZlU0VXovSGlIVEpZSFdrbEpGYVRlbXVRb1hQS1JrRHZzbjFmSE1BYm5Q?=
 =?utf-8?B?VzR6cTZhRnh1M25GOHh5WkI0V0JudmVzaFhKdnNRL1JQaVZ2MmYrekZtZFdE?=
 =?utf-8?B?Z2YzQXcwaTVNUUhaeFJWc3ozRDFoK2s5VUlVaFpvOVhJUWlFcnM0VkV2dmNS?=
 =?utf-8?B?aDY3RnhpRGhmWHBBbmE5YVlRMHhlUGd6WDJOQzJRUnZFWVVabnhleExaY1Ay?=
 =?utf-8?B?amRmZFZwS2sxVTdLR2ZOdDR0MVUxdHRMRHRBWmNia2tRR2tkdnl2VkZzZUQv?=
 =?utf-8?B?dWZvUk1TTXZ0TXliOENka0k1OXBHWG5PY1QxRUM2REVJQVZpRTJtVTg4bXhr?=
 =?utf-8?B?S0JWRHFOWU9MUHZQZTJVTFJ0QlFLQ2czY3l4aTNGTW9jWERway90RWIrK1VD?=
 =?utf-8?B?OGN6YnFycjR1SnFXa2JxZlVtUG5KZlU5T0lndlFRT01ub3BLeXBDZU13RWNt?=
 =?utf-8?B?Tzg2TnBxWWFFQ0UrNXA5YTd6TlE5bmh3Znhob2ZSK2I4YnRwYyt0UW9jWnRo?=
 =?utf-8?B?QU1iK1cvcDZtbG9ObTRMRm9CS3pSeG4rRW0ySlVvblN3cU1tU0Y5RGVXY3Vy?=
 =?utf-8?B?QVhvK3FxV2JsejBnUVR3VW01WTFVQ0EwUGlud0FYNDdybG9sa3NPeEpaYUJD?=
 =?utf-8?B?bnlqYkNscDh4NVhvTncrWDZETnNveGI1Nm5tWUNQc1cxVGhYbFA2c3lvWWsv?=
 =?utf-8?B?TnNVMlB2UUk0ekVibGdFMit4T1FmdmhVR0drUkNZVmpvWmNWTzRzNW1SdnpE?=
 =?utf-8?B?UGJ1RFU1L0xZQ1hWZVFrd2V5Zk1ac2N6NGh1YWYvSjRQQnEyMmlmb1NsUXRG?=
 =?utf-8?B?WHNPNFdRNXFLMmcveUsxQUFhRDRXYVlISUZIRnBOMExMaDk3VkxESW12bEU1?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2e2763-5d22-4344-1cf1-08dda96c2cba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 04:47:03.2359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UUjAyliWH81BWr3VNVcOcP2QRC1NNfgXCLrUPnI4IvHSBGSh9EQF0gssv0lHogcZWpqcvIGp1X4zf/rShoA4Bmxe95rfPIku63pFGXBWrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8238
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


On 6/3/2025 10:47 AM, Pranay Samala wrote:
> Tiled display setups require all involved DP connectors to be of the
> same type. This patch adds a check to skip the test when
> connector types differ, preventing invalid configurations and reducing
> confusing test failures.

If I understand correctly, the real problem is that when working with 
tiled monitors in IGT tests, each tile of a monitor appears as a 
separate DRM connector.

To perform a coordinated modeset on a tiled display, it's necessary to 
group connectors that belong to the same physical monitor.

However, a challenge arises when:

Multiple identical monitors (same make and model) are connected.

Each monitor reports the same tile_group_id, num_h_tile, and num_v_tile. 
The tile positions (e.g., (0,0) and (1,0)) are identical across monitors.

This leads to ambiguity: it's impossible to determine which (0,0) tile 
belongs with which (1,0) tile.

In one of the test platform there are two dummy HDMI and DP dummy plugs 
are connected which advertise as a tiled displays :

https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

The test seems to be getting one tile from DP and other from HDMI. In 
this particular case, atleast the connector type check can help.

So I agree to the change to alteast get tiles from connectors of same 
type, but the real problems still persists, and I am not very sure how 
to deal with this.

Another possible solution would be to restrict the test to DisplayPort 
connectors, since tiled display is supported only over DisplayPort.

With that said, it would be good to mention the problem clearly that the 
patch is trying to fix.


Regards,

Ankit

>
> v2: Replace igt_assert with igt_skip_on_f to skip the test.
> v3: Edit port sync supported in commit message (Ankit)
>      Check if connector type is DRM_MODE_CONNECTOR_Unknown (Ankit)
> v4: Remove connector_type check
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_tiled_display.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index 1f5331408..a1b7f90d1 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -165,10 +165,17 @@ static void get_connectors(data_t *data)
>   		}
>   
>   		/* Check if the connectors belong to the same tile group */
> -		if (count > 0)
> +		if (count > 0) {
>   			igt_assert(conns[count].tile.tile_group_id ==
>   				   conns[count-1].tile.tile_group_id);
>   
> +			igt_skip_on_f(conns[count - 1].connector->connector_type !=
> +				      conns[count].connector->connector_type,
> +				      "Connector type mismatch: Expected %d, but got %d\n",
> +				      conns[count - 1].connector->connector_type,
> +				      conns[count].connector->connector_type);
> +		}
> +
>   		count++;
>   	}
>   	igt_require_f(count == data->num_h_tiles,
