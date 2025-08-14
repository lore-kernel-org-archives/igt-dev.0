Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4786CA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 19:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C9310E123;
	Thu, 14 Aug 2025 19:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKhGzARF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D4410E123
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 19:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755198325; x=1786734325;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CVWQvs/1h95IC2SbCvwqGCDHcrC8bQ92VcwMRGqPH+8=;
 b=TKhGzARFjjAqo2baKo95EUVmuYGv97xFZKX4Lmf/nj+lcNSvv8g/oxdO
 FE1O6Vw1cOlWhLVj4O9xRadsqPI62jBqgephhjevAHNvasTTntQCWZeS6
 yVPGaQzwYc6TNGlOFshXvyHXtnWMfMjnQstltzq2/l2U2DLEZvKknF9tP
 q/tk5Y3URQKUQoG9fFch/s0Rk6GczWSFU4wPNtEQMelbazn+x1h3XqjfA
 mcvWfZRq8gcQgqWz7MnnxR6NuvfEk3y0OW4jCBGiht3iNmNArQoeCDmTy
 0KDJYrACIiWM7LycQgY08qYw7dWTy5q/NKcYD/KDc5U7ZNacZMg/7jrGn w==;
X-CSE-ConnectionGUID: YpXhHLiTRw+9yZizYcB9Bg==
X-CSE-MsgGUID: 7NZUFqEdRMOw9frSXAzhyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82960033"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="82960033"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:05:17 -0700
X-CSE-ConnectionGUID: jB5lPq9zQXq9DEu1LP4UHw==
X-CSE-MsgGUID: qBOWdCEPShmyXnrNhfM+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="171033457"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:05:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:05:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 12:05:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.46)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:05:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAvCIZKt43LVBJa2U8xm8cgHmVNHfn6aYt6ZBn4TPZKyuKWdngmvGMnhJjBh/90zQ5YOoIbQkAGk82zpRra43RubOFNKW+nuON1oh/nXFKplIAge/dZlMdbpycgFYKzQBQs//nZ5q42KcfM3ClWbwKKVzIs0FDEV6HOI7xeIuKU4mHhPlRl4vk3MKDcMqLygsgNP0lTS36c3n1li300f4fDixKk6gRUGwKF8rFSNsM2ZN1J09T/5/bwZLwt4OrTHnLxszEkrnA4RuW0uVtGYsIbJ79eUtut0lT5s2qDvEMPi8Y9BDRqR+Ej5scJ5GaxFfFa840Cc/VSnvMU2tXz9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J4FkY5jJSeYT91f3oppyXrSmz7A0ylQmru7f6uD3TE=;
 b=cKnnZ4WJMMDT0eQwGl+CgFriSTQ84igkb7yjHj+neLMzh/3p/V6UCHsLtdUHESwd9rhlcxxP+BOAwG/U658fsnxn5wK5LVvJYi18MB5Aq6FegChGS7AmOH+3w/Yug/a1XF0q9Z5YkFf2GZ0d5JMFvfjUdnL+qNWFtttZ+rbWMT/ermiQne/dLJVXoVh+OquauNOdavvXH8Ltuc0E8bWY4mErFY3sv0TMFSCMdWG+wjHctmUGSEZu6zX8Z6PfFY9r4EYQ2dh2v1gHwP1pD6ySqagbSt67pY8c1wVSV1PE3ZJUnPPjqso1ic/fcAQDbl3G+2ad7DLb9mrTvEwdPlFLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Thu, 14 Aug
 2025 19:05:14 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 19:05:14 +0000
Date: Thu, 14 Aug 2025 12:05:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <zbigniew.kempczynski@intel.com>,
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Message-ID: <aJ4zZki709mmqtbV@lstrano-desk.jf.intel.com>
References: <20250814185009.52614-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814185009.52614-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f62bcf6-69f0-4436-6687-08dddb657fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVd2UmNPakVvOW56R1UzeG5OQlJac1NlYytuUFYybnp0bXdSbTNFdUx4U0lB?=
 =?utf-8?B?QXVkUDRmbGhKZm9oR1hnZGNoQWVRU2sxaDI2aXZUbGY4b1dwK0FVWXpLdEE3?=
 =?utf-8?B?L200azllN1hLcHhZaU41K3VLOFRLVllyUld4bnpJL3VzOEpoZEZHMFRiQTIz?=
 =?utf-8?B?cTRsR2ttWm51eEZyRUhHd2NZSllGN0RFWmU1TlpIR0xwSWhLZXFXeTYyNnRU?=
 =?utf-8?B?cXhPTFBPa1NKU1V3aHh0d1hRN1Ryd2Zac2pJQU1ZYTBURE93ZEtJeXZXUTdw?=
 =?utf-8?B?MjlxSjVOMlNCMHB6eTdrUkRiV3NpN0lmUU9LLzlUT3JLZGpDK05sUkZHRDIz?=
 =?utf-8?B?OC94d3hyNzBub3FsZkVFNEF4NXRIbDZTV3h2eCtNV0M1YU5ER2UyYm9BZXVa?=
 =?utf-8?B?WlozSjk3SFZmRzU4ZHo1Tk80K3ZDeXM3Ujg2bks3aVl1c1dhRHd2MU91cXdG?=
 =?utf-8?B?S0FMMFBMMngra1NQZnVlcjI3cm13N0FmVGJ1ZExpY1ZmREl2QVlJclYweFNV?=
 =?utf-8?B?dFF0bE8razZHd256SCtkbGFGODBYdUwwN3pwYVZsb1RZQ2NieFBRZ0RWcmo3?=
 =?utf-8?B?cWxPTDlXN1ZtNHU4Uk0xVk42bXpTS09Jb2pUZjF3OXB6dVRZM2JiSXRHQ0FL?=
 =?utf-8?B?VTJIWWxWK2xaL1MvRkJuV1hUblBmWjRIU2Job0VySEVqVkFFdGtqQnRzRFZG?=
 =?utf-8?B?dTFKeG83S090T2c4L2FpaUlFb2xtdjJVTGpPek9CWE4vSXVkaDRGZ0tlWmdC?=
 =?utf-8?B?MHl5WC92elJwYUw1M1paN3VHcis1MXpQTURxWEpUVmQxSDVxb2JqMlVtTG5h?=
 =?utf-8?B?YzJldlpkc1diZHJoU2ppZTJBMnNldEpmTWozeDhKMkkvTUtEMklSZTBEeDhy?=
 =?utf-8?B?Tkxod3NOd0V4Vi96ZEh1T0pkL1M0UUxQN1hXMTRDWVpQREhyR010NEtaMVhQ?=
 =?utf-8?B?M0xDbFYycVdyYnl5V0NaTlJ2ODJjaTFLckRaQ0tKWktHN2UwMEhmc2hjTGJM?=
 =?utf-8?B?SXZXVkRvcFpHSVJTY1JkaTVtczF0U1NBNVk1bkdOa1hBZ05iN2YwS1dYMWRt?=
 =?utf-8?B?RE11L1Btcm5Hb3JlQWVFSUNObEYvenNYZGxjSkhBLytoMnJmV2o3aHQvYkNI?=
 =?utf-8?B?NDhJdGpYSHJhOWR4N0xaa3prbk1Pd1FYN09ZTC9kSnVhN3ExaUtubmRjOFVp?=
 =?utf-8?B?cHpQVExYRng2eERKWmViU3JpZmxucjBleWRPWjZJS1RpbFZ3ZTJ5a1JKV3lz?=
 =?utf-8?B?b3Y3WkFGbWRtZHp0dCsvNmM3bGt4S2tJMG92YjByY25JZHlqWGw0RjExeDQ1?=
 =?utf-8?B?c3o5NlhBU1MxSkFpTkhINWtNc0lubG8rSWl5Wk8wUXVCbTV6SUIzTHY5TEp1?=
 =?utf-8?B?bHh0K054cFFJbFJlRG9sRlVIaENUN1dpV1VLS2dNRmlFNC8zalVndXpGVWNi?=
 =?utf-8?B?SjdsYjZYQTN2bzdtRHdObkxRYTRQOHBGRE56cXpLZ2R5Ync3VlFFcm1wOU11?=
 =?utf-8?B?T0ZsYzlIYnlwYmNDMnlYQ2V5SEFvUFFSWVNuSUlXZVdiS2JKeFJCR2xNaGNh?=
 =?utf-8?B?cUdmYldhamxNd1BjSjhnYmtwUkM3b3V5ckp1UHU3dCtyU0ZXTkd2MWRNd0VI?=
 =?utf-8?B?QWo1N2hEUmRrSWVyUW5uTStuOHFEV01wdDUxZWt3TXNmaEVuYnZJVGt0YTlL?=
 =?utf-8?B?ZGJaUmpzTW5MWjJ4OHpRSDh1UWdLUWxLNkZoV0pKY1FpRFZBeXBTQUdsdkJo?=
 =?utf-8?B?YzVYQWg2bXBqWkRVS3R4WUEvR0J6dFQ5c2dRQUgvMVJxeFZqNGFOaXlYb095?=
 =?utf-8?B?cUVBMDM3b3h3N1JTVjk3NjdFbmpBekdWSm5iRnNkTy9oK2NnOHVRenJJZFJT?=
 =?utf-8?Q?t6YzknARhZnYm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzYyY3JHNTU5YmF1MFVzdnpKVnhsV25zdmRaOG5LNzNxVWdJVEE2ekpBVnVr?=
 =?utf-8?B?b2p6N2d4U2RkRFVySmIvaXZXbkFMbHAxbjkzd09YS2s2WEFGcjVWKzJvNEg4?=
 =?utf-8?B?YlhnMDVxM2hSZVRvYkVBS3p4M0pnZnlNM1JQaUtWMC9yZDcyZjhqekE1ZVBv?=
 =?utf-8?B?T0F1eXJXYUhzMXkzRTJOL21IUXFUM1V1d2RZN3I4Ykk0K2NPTVA5RXhwUkpS?=
 =?utf-8?B?Y3hSdWdiYzlXdlFuZklqN3R3L2tyWHk1c1Yva0JYN2NJQWd0VmozcW1neWd2?=
 =?utf-8?B?OWxXajhHZTNCSlcybHY4T3JWaHdLS05rdmljNWRpMVA4UGVIY3dlYkhGYUZW?=
 =?utf-8?B?MmpLMDN5cmp6ckVJWjRHS0Y1YTBFOWJMRFRFVDI0cTNDQ2QxdXk2blFDa05F?=
 =?utf-8?B?bThlaWtXUFJFTXlwZmEwTU5NRGlFYW50V1hHbEVhQStFQXE2MG9WcXpucTl4?=
 =?utf-8?B?WmY3YndyMnpyRWFKczE2VlNiSzE4c2FkRUFhNE92UHNmS1I5UDNOZE5NaTN2?=
 =?utf-8?B?OW1UN0d1VlkxbHMwRGZiTGp0NThYb0hDMDJTNFlmL1pZK0JhazhrZHBmck1w?=
 =?utf-8?B?ZXBXazBHNVBGQjVtMndVZmlhaWliZk52bk03QkxqUFpxVy9yRERwTzBVdTFy?=
 =?utf-8?B?blA1VWh2K3N4b2xPOWsybXkvVmtuVGNiZGZpM1RHb1F1Q0lOb3NJL01kSXcr?=
 =?utf-8?B?ZzVuWm9nOXd5blhVeHZWUVFmMmdSWlV6WFRpalRlQ2tUOVovNjZlSFhSQ3Nz?=
 =?utf-8?B?NFJoSXlpZHB0ZU53Y1lReXk0UVJNczFzS1MyZlpHM0xoMmV1akNhc0lKcDIz?=
 =?utf-8?B?dm5DSXMxU1JPZ1pVbVBwYWJFWGUxZitJUk9xRk1La3kwc1RFbWdzdzJTcVhj?=
 =?utf-8?B?MnhTTmxHVTZMWG5mSlI5akxQZEt4R3pvS1J1M1ExdmU1MjRQVThKUEZsMWZy?=
 =?utf-8?B?VDBYODRMSGIwcHF4em1Lc21BaDh3MGpvTFB0QmFzZFZ4Y2lzRVJvS05UZkt5?=
 =?utf-8?B?MVhINXBxeHVuZElYOUo4T21hc3E4QTFSRWZCMFZwZ0JiT0dXdHUwRVJBR3NG?=
 =?utf-8?B?SVRKdnFCZUtqUkRzZjBmRWtKYXZmZ1I2T2VDV2V3S2MwbzdZa0FzRWdsMHBs?=
 =?utf-8?B?V2F6M2t4b2pFdDE2SWhsUEkydmVWd1k2WFJ3Z3J3LzY4cjdkUlRRdjMxU1Fx?=
 =?utf-8?B?UHZ2a29CdjlLSGszU21LNG9ETTRaNVliS21kREh3TkhjOXF3ZVR0c2FMemdT?=
 =?utf-8?B?RG5OUldpWHVHVEhQNU4rdHllTFhyTmlWU05tMDRPKzAvbzg3MlBQS1MwNFFR?=
 =?utf-8?B?VWx4ZEQwTFM0SjZadjROYUVwMTZiVjE4b0h3RkQ5Ykdpc2xjcUVLbEdTcDJN?=
 =?utf-8?B?eHQyNmJGVmozT1JMcjNlSlVDS0E2K0szVXhMTFI4M280THEyZ0RSUGVBOHFs?=
 =?utf-8?B?R0NjUHhSV1RCZ0JlV2RyTlhoV2txN1I2ZVRIdGp6eGZRYUNFQldEMHArMXB4?=
 =?utf-8?B?emlpcGUrRmpRUU43ai9qdTRINEM2b1BvTUoyQ0NZa3QrYkZxRHBoS1ZLWXpZ?=
 =?utf-8?B?STd0V2J5YlIrbzJsbGNzd1U3N0kxY2RIWUMvb1N2aVRaOGRIb3oveFVKb3E1?=
 =?utf-8?B?eVU1eWZmUzc3VE5qYSt5dzFkbS9VaXU5dEhxY2lmYmx2eG1sQTVrclVLdFdo?=
 =?utf-8?B?bTU3Qjhld0p0WjRUS0VpNUlCc1FOcWlYRjFRZ09IWTVFWndvR0Vyb1Q0VFNs?=
 =?utf-8?B?Z1A5QXBzRllQWGYrUHFGUjRGaW1QUkNVczJWQ0VicXRoK1JvZW9hU1BDOTB3?=
 =?utf-8?B?QWhBTFFXNjY5YU9aQmhpTnN3K2RpOXZhQVFEbmNVMjNVb3loQ0Z6QnI1V2Jn?=
 =?utf-8?B?dEppSjFGUm9lUFlyb2JOcjk4ODlBL2xqNVBhT2NKSzZxTkJMemZlNkV2R2Zr?=
 =?utf-8?B?NEVraWtOL1RxRHNWbFFEQUI0R0IvbjR0UFBsRFMvQlJIRWpzb3Q4Zjk3am5Z?=
 =?utf-8?B?a252SG95bkc1VllDNlhrc1ZodVpKSnpabktMM2VDNVdnWFhnVy9ZM2lvb0t4?=
 =?utf-8?B?Ni8xdDdVcGV5SzBsN2RvU2dlVlREUGZJNHJwZ294ZVd6THRnaUZZdkxoVkNJ?=
 =?utf-8?B?NjlzSjMwWVdYUEEyczBydHI5R1dhR2Q2d1lEaUFKQSs5WUpjVjNOT1VUTkVE?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f62bcf6-69f0-4436-6687-08dddb657fa0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 19:05:13.8301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkbWvqDfvKaekhX0Doy+DlklJ3ygQ5d10q8JWzxJCneAMTUfI1fJ7yxjNTG2q/oXZiHtP7P1wjGgZEo0WUMq7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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

On Thu, Aug 14, 2025 at 06:50:10PM +0000, Jonathan Cavitt wrote:
> Add an additional MI_ARB_CHECK to the spin initialization function,
> just before the conditional batch buffer end, when preemption is
> enabled.  The MI_ARB_CHECK forces a preemption in this case, which can
> allow additionally scheduled exec queues to make independent progress
> earlier than if we relied on the automatic timeout of the exec queue.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5783
> Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  lib/xe/xe_spin.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 25f7555e27..b3a937fe80 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -30,7 +30,6 @@
>  
>  enum { START_TS, NOW_TS };
>  
> -
>  uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
>  {
>  	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
> @@ -167,6 +166,9 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  				   opts->mem_copy->dst->mocs_index;
>  	}
>  
> +	if (opts->preempt)
> +		spin->batch[b++] = MI_ARB_CHECK;

But we already have one these at the top of the loop:

 72         loop_addr = opts->addr + b * sizeof(uint32_t);
 73
 74         spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
 75         spin->batch[b++] = start_addr;
 76         spin->batch[b++] = start_addr >> 32;
 77         spin->batch[b++] = 0xc0ffee;
 78
 79         if (opts->preempt)
 80                 spin->batch[b++] = MI_ARB_CHECK;

Line 74 is here the ring loop restarts.

Matt

> +
>  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
>  	spin->batch[b++] = 0;
>  	spin->batch[b++] = end_addr;
> -- 
> 2.43.0
> 
