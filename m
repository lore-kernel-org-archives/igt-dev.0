Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51E6D3613A
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 20:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7099E10E60E;
	Tue,  5 Nov 2024 20:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqNU81FW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BEB10E60E
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730838721; x=1762374721;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gib6RqNC3ArouWmePuNt972tQRqMRIfoqlL1FdUZFLA=;
 b=PqNU81FWPZ5qqh6Gc8/y7r2VYcoeNMLgsQQGpSulTDNt2xBp8pirq30+
 c7hGnhql2qjvuCQd5bktPzwa5Ah/vc8trjvuw5oicUkvs3+cDAnSSxQPf
 2gCtqL3QFCAxd3b2r/HCX6bi7SbxcNsIKdwOROXPyJBxixe36IMgQ8NhM
 VE1/I4A+wva7HWks8yNVHsONPD7TAnaeE/r+z2nGuEUGBYpINfIgMQTza
 T0m+COGffH6r0WtKssjx3h8yK/xyPgAqada3Qc2GtkazY8Wptw70hrv1i
 jtAN1myVpuAaIie17mrVMwSaFdYzq4HwDEcDfXYt93FKLdpmfkEwiXGeZ w==;
X-CSE-ConnectionGUID: 8xyukOgdTXupq5lVw+zO5A==
X-CSE-MsgGUID: VteYR10nSV2JwHB9lcw0dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34305061"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34305061"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:32:00 -0800
X-CSE-ConnectionGUID: 2I/zoA7GSTqdWhp9LtD3bw==
X-CSE-MsgGUID: J7KcmxG7Q/iwSIGfYa9D1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88112766"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 12:31:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 12:31:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 12:31:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 12:31:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmCFjBC1F5VKa5iULprvfE8fNrsMjSrzNvCQRP/vn7KwQf1hyLKaJFRNjxIMA+ixdOK9fkVAS6rd2AAJ/mo9nZQU0198NfWeASi33r5k2a3iUXA99j9ceICh3JRTLIaShQTS9+/8q3NQft5h8MIQZayk33wUzybBwD2m9msjvcG2gIjUIiUtsai9XoQJTj0TxoqmvVjiCQDAsJhZb3tCnJLbrKdE/Yeh5dfAhQtlkA8xjItrnwm78t9ANrZNvFdVYpMNxgsAinioSFFCLrdr5/lcniySUS5pcUloJiSQBI5gpLQtAiPOQMp2ShAasW3bsd5wM/9ddw1S6gHQK7Tx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQVGWsldmJVg7tPLZevYIVzC+kpObuuTfHZdR1sLv6k=;
 b=DTPCswd4ro2I8USEj0A4ZydSwu8ppDSFyJyXcLAaJSmZ1WJB1qTyHxuoQVK1LIjwDatmuF3zIWmai5dYGD1Hva3rOT1oJsQq8RSR4Z1wwouSYYQyOHl1/fRG/MshWJSnyjAaLi1M8XNPohIMhHqFtXCLoe2/MzUz4xEtB80FkNVvcJ4BCFze5jurMMxoL2oBhawSZ0Akdy1HKok0Sw2OD1y2/jvV9R+Yn401EW5a5f5yCm7+fdEUsJwRgR3+z5YHmkv39bcsCaoN+n8WqDz6AC3/DRtdikq0mUGRkB8t/r+61QYFxxf4lGdumsC+Z+XAm2kZCzblpp5fQLVPfqOKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SA1PR11MB8596.namprd11.prod.outlook.com (2603:10b6:806:3b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 20:31:56 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 20:31:56 +0000
Message-ID: <77e0cbd0-52ec-4c9a-838f-7cfc8ae74e37@intel.com>
Date: Tue, 5 Nov 2024 12:31:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for
 bind-array-enobufs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <jonathan.cavitt@intel.com>,
 <alex.zuo@intel.com>, <kamil.konieczny@intel.com>
References: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
 <20241028165311.q7qlo65v5fo2xoz3@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20241028165311.q7qlo65v5fo2xoz3@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SA1PR11MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f54e034-9055-4a95-8d70-08dcfdd8e3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1NuMHQ1S1U2SHZKOG5WSWVkNFhlcU8zMWVkbjQ1eGxHWStFWm8xQzdhSmFx?=
 =?utf-8?B?K3NEc2J4WkhuczFsb3EwMjBQR0RvanZVNlBpU1kyZVZVUmhQWFFzVzBFMHZU?=
 =?utf-8?B?QUoxU3dRVytnOWlvNFZKWEdjWGlaYndmR1h2OUgxMkkxSTNqVy9OVkY2bGpW?=
 =?utf-8?B?TUl6TTU0S2piVGptQ3Z4NkdHckQybFlnK1hYVHVJa3dtaWZOVm90ZHZpTzdi?=
 =?utf-8?B?VnBSQk9paFJlWnBPdzZ6QXlQMUg5eEc5S0xrMXVvSjBscGY1K0NBSlZ6cGJZ?=
 =?utf-8?B?STd2VllNUTVIMThmdWtvSGtZSE9Na2pDMzk2TlV5bC90VkgzQ05PbXB5dlFT?=
 =?utf-8?B?Z0dTSU52c3pCTlV2Q2d4c0lqbVRnWmRsL1p3YVplbUh1b0cwSkkyMEpjaVhx?=
 =?utf-8?B?NlNtVksvSVNQQktZK2k1TllEaEtPL2U4WWRoUnFORmV1NytNM2V1RVVIYjd5?=
 =?utf-8?B?S3N5K0JuWUw3M3UrOEVHTnBkVkV3cythT0dHV25BY2IzS01BM3RNSDc3Zjg5?=
 =?utf-8?B?bU5NekUxaFlYVW5heDVKdmh1WUx1NHlNV1VISGR5c0lHTkhJVy80VFF0dWw5?=
 =?utf-8?B?Sy9ubmhYUWhiOGJGNUxpdGxPR0tJS3h0d1k1T0IxMlFFSmowbFZvdTFNK3J6?=
 =?utf-8?B?bGs0M3hsUGhOR0psdXY4NmNQTDdwZm5wUmlmUEExMmI2c2JBeEYzUWEwTTYy?=
 =?utf-8?B?WWRlbGhjTHhkeitlSGV3Z0psVDAySFVDeitlamlpN0M0bjhiRVRZdUc2K1M4?=
 =?utf-8?B?NzR4dzdBVWp4YXVNcEVlU2cyaHZCRnZiWVp2UEorL0x6aVFKWmZ3SGcwSjQw?=
 =?utf-8?B?L0h6RFBiQ3hRN0NRN1NyNHVEdGpKWEZpazVuaUViUnd3UnlFaHVyWG5ISWFZ?=
 =?utf-8?B?L1RlbGl5YWFBS0NDSGRyaU44UXJONytOMGxPbG5yYXp3OWJSSmNEb3gxQlE4?=
 =?utf-8?B?ZnlacnVoRkZYSTFFOEc5amE4YmxNeWhpN0ljYXRnMGozU1lQU3RQQTkyREZv?=
 =?utf-8?B?ZDZZTWxUdGUzeTB3WjRKdGtJRGVHM2hCTndYam1TYWNBL3ZLY3lDQXZuQUVa?=
 =?utf-8?B?Y0t6SnhKakRSTVZLQkJzK3M2UzMvOGJ2R0hVRTF4OVFLUmIrN2NjRUdrY3lw?=
 =?utf-8?B?LzIxcE44TnNIWTVPTHc1Mk1ZY0xXMC9meDJESlpoZTFoNWR5Mi92Qy9xalhT?=
 =?utf-8?B?SVF3UGoyUWdXaVMybXEyd2lvNFNVbWVBN2taaTdndEVESS90dVdVc0YrZzUy?=
 =?utf-8?B?ZFh5ZXc4VzJjSklHc2MrNm8zZ0g4OCtRd2N2L1VOQk00cHVxWUZNOEJXdDRF?=
 =?utf-8?B?YkxMSzRKb0duVEhIRjJjaDZ0VWdCWTVLby95eVRldnJvc2NoNDlseWt4TDZ3?=
 =?utf-8?B?U1FHMmtUUHc4U051Z0lKemJvYUFXWGdraVRVbWcrb25uWWdBbHNTQmtCN2dB?=
 =?utf-8?B?SWg2SVRJTFloTjhYUWpUTFZHcXoyN3pOOWcrUzl4dnlBUGUrNEVxTUVxbkJC?=
 =?utf-8?B?M1VnWGl4d1l0ZkRZU2tDMit1cGtNVGwwcFJPK2NFM2RjejdhUnh3WXNLSmlx?=
 =?utf-8?B?MTlSK0hXRUpLU3BwNU4xanFlOUM4K3gwdEg3aVAvbTdkZFY5UGlnYVVYdWpW?=
 =?utf-8?B?SEFEaDdnc3ZURnJSRkE3V2RyVFVhTWhoQ0JXQWN5UzVpdXBQclhYdU1nS1dx?=
 =?utf-8?B?RU4zUFJNdXpleTczZ2FCMmE5a2RuMmN0T2JnQ1d2ZS9Xb0tKb05FT0k3RnJh?=
 =?utf-8?Q?015/W+PjQ00JejWpDMHcozwd7mPJPe0Q/1+Q9Er?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVpRNE81eEdLV1R4VkVaMG1kYXh2Q2ZlVXF1WXdNcjdGVjJaSnhVMjRMVEdK?=
 =?utf-8?B?SzZxRmNTaXF6Y1hJSmc2QnlYVCs2YTBkYUNhM0JsRVBvc0JRMWllNUtDMHlQ?=
 =?utf-8?B?S3Rod3p1b2kxdzEwall0L3ZvTmVBM2Z3aUQ3NFlMRzdmTmt1bzhSN3pETmlW?=
 =?utf-8?B?ekp2Vmx2UGRJTEtFeUo2cVlTaVRNdUdsaWU2U1A0ZlZ3aHV1ejAvUGZid2tm?=
 =?utf-8?B?MDBxbG1iYnBkRXkzSGlyUXNKbWlwMlkrMmtMeFpaWGUxcVJ3ZVZSL3lEV05P?=
 =?utf-8?B?R1FVRXpvS2ZUN1A4SE1rWk9GeDR3d0ZKS09GZXNCdTV4WkM0NmpPWWlKYWVK?=
 =?utf-8?B?elJtTW5IUEhiVVJ6YjZsb1dkVS9YNlp4cHFzYytMNlcySHZPbENJdHFBR1Z0?=
 =?utf-8?B?aUQyVFc5elp6OG8veWsyNjUvMjJLMGpoVjBWWmRGZHRCSk9FVjR6ZlpQSFlR?=
 =?utf-8?B?c0IyYzRpZFJ5K2hBL3RIU1JVbGgrQTZMZit1S2dXV3Boa2VVYnFUM1p0VkM3?=
 =?utf-8?B?TjZXOGxZdWUrOUVQT210Y3JBT01BeXFYS3owZjA4b2tvUE1DdWZpUC9BSTJX?=
 =?utf-8?B?dEhucFlOSC9wODJETm1CaGw1MC9nTVp6dm1mYkttY3FYV01td1ZpRk5ZYVhC?=
 =?utf-8?B?b3ViR01TZzdWc0NMR3Fld0VUM094WUxTeVFkL1QwbnZMakUzVTNoNzBaOUJQ?=
 =?utf-8?B?TWhpUUx4d1NIdmpJVVUxMk5IQURreUNFVEZRc1prTFFuU25VZklDSXY3cDda?=
 =?utf-8?B?L0VzRThOZnV0bisrZldtRVpIcGUxTmZkMWE5bGlxQlMzdUVXWTlQUTRyVXpo?=
 =?utf-8?B?UExtUWtlN3ZOZ3VGdENZblNMZnppaFdNbzFHYTZnQUlrbW9xeUxPZFk3TGJQ?=
 =?utf-8?B?S0VLNjJvTnN0V1k3SEZVcGI4d1NjSEd1eWlPMlpjQWJwRTFBSWNab1JqRWFm?=
 =?utf-8?B?azRpZlQ2cHdvNWxtc2NxRXJBRWJCY296Y3lTUTd6REFiNitLOEZ6dEQxK3JS?=
 =?utf-8?B?c3lkaEdKZHFOWW4xNzR5bkV4eTBpZHJnTUQrV0RlakVVdUhESklDRkNVM1F2?=
 =?utf-8?B?T3dnV1VzZVd2NTRONWpyR3cwT0VVSEhFRmdjNVQ5amgzdGFCQnl4akhIVlZ3?=
 =?utf-8?B?MmYrMyt1bVFRNElIVnRaWCtuU29aUnRmZHNVNC9rWG90d2pXK0VjR0F4Qy9m?=
 =?utf-8?B?RnA1alp6S2FJUFFJK0Npa1ZZY2VEUTEvcVZxc2dKZzFDUGJTRGpzM090Ujlw?=
 =?utf-8?B?TzZMQTllK0VtOGN4SEIwTDUyUVQxZU40T1hNZDJDanRXN2picmgwK0s4V012?=
 =?utf-8?B?VHJwSTV0Z0ZuV3lVSXRhaHQ3QVpnbWRVUnZoOHFiTUlkZEgvOFpZMGlMUEEv?=
 =?utf-8?B?bTFVQkhGeVZxYXlPVVhJUEQ2aVo2cEV4SW5laUJZZjMwUjlyY0M0Y2crWlp0?=
 =?utf-8?B?Q0IyUFpOY1hnS1p3RGZvSXk2MFlpQllieXdTNmc1Y2ZUcVZ6dnlZWkprVWVz?=
 =?utf-8?B?RXQ0dGVNN3NieDFYNVZTR2dTeWtyNG1FRFg3TGFKNXJvUE5ESnoyaEZZR1pn?=
 =?utf-8?B?OFYrTXZaQUhZZWljaGt3NWt6ZDV1bVN3Qnowc0RuQzlPdXNVMkpZNVpRU1hJ?=
 =?utf-8?B?QkluWG41Tkp4SWZzNXhERnhHSHd0NHU0anV5Y2llckpQbUFWcnpNN2FXMVli?=
 =?utf-8?B?VmIwL1RnRWlGZFpIcTh2KzJtb2NFM292VVFja2Y1UERCc2tSMEYzcURFY1BP?=
 =?utf-8?B?NCtkZDNDS3NkdWJsUU0zQkdBMHRxajdkNk43TnpRY0RBaURpeUVtdEZXeEpP?=
 =?utf-8?B?MUtIQUlOSnRSYzd0S3lRRFNNYk80ZnhDN1JrSlJ4bVVWS0JRS0s2aGswOVZl?=
 =?utf-8?B?Vkx3YzdDS1VnTlVXMG5LYnpBQVF2ZTl6MHN3RS9KQ3NUSzhiQm9hM0g4a3Ba?=
 =?utf-8?B?aTQ1WWprNlk5Wm44UWgzRmJqSXVGUXB0M3VCbXNScGc0SjNhRVVXd2ViUTl3?=
 =?utf-8?B?Q0lLdHJ5ckxvRlZrNUw2bGVDelUvNzZLanl3OVQvK3UraXlKZ3NFbkhtTjNY?=
 =?utf-8?B?VnFkRmNSbFphYytla1lMTUR0SktOZ0xzenkyQ2d3aEtIUk11SGVYcTNvYVpH?=
 =?utf-8?B?UVRJOGh0clAvWDZxZWxaeHBndnJhUTBxbXBSNTM4K1d1ZElYbFNDWVNpNGhp?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f54e034-9055-4a95-8d70-08dcfdd8e3f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:31:56.1480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyJUxO8ZC13JPDsz3rt5KxWBb045Md1/XI/wT1s05x3Jmpi7zV7gzpSNydijl99BuDJfjjyP4ENTBtzNXVVQOSfgoeY24mmAPTS+H5Rf9s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8596
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


On 10/28/2024 9:53 AM, Kamil Konieczny wrote:
> Hi Jagmeet,
> On 2024-10-22 at 20:11:30 +0000, Jagmeet Randhawa wrote:
>
> small nit for subject, please place space after ':'
> [i-g-t] tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs
>
> should be:
>
> [i-g-t] tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs
>
>> The bind-array-enobufs test in xe_vm.c is intended to trigger
>> an -ENOBUFS error by submitting an oversized bind array.
>> After encountering and handling the error, the test reduces
>> n_execs by half and retries the operation. On some environments
>> with stricter resource limits (e.g. simulator), halving
>> n_execs isn't sufficient to prevent the ENOBUFS error on the retry.
>> Reducing n_execs further to n_execs / 4 allows the test to pass
>> successfully. This patch modifies the test to reduce n_execs
> --------------- ^
> Imho you repeat your argument again here, I will take only
> what is up to 'This patch...' with Jonathan r-b.
>
> Also please replay to CI failure reports, I will do this now
> as to give you an example how to follow up with your next patches.
>
> Regards,
> Kamil
Hey Kamil, I have adjusted the patch according to your comments and sent 
v2 just now. Thank you for the comments.
>> to n_execs / 4 after an ENOBUFS error is handled. This ensures
>> compatibility with environments that have tighter resource
>> constraints while maintaining the test's integrity.
>>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>>   tests/intel/xe_vm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index 7a8740b69..e78ddd0e5 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -957,7 +957,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>>   		xe_cork_end(&cork);
>>   		xe_cork_wait_done(&cork);
>>   		xe_cork_fini(&cork);
>> -		n_execs = n_execs / 2;
>> +		n_execs = n_execs / 4;
>>   	}
>>   
>>   	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
>> -- 
>> 2.34.1
>>
