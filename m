Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5B0D1CA01
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 22:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D2E10E0D7;
	Mon,  4 Nov 2024 22:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbU2saMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CA710E0D7
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 22:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730757823; x=1762293823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AVFYQh0fvguI9yMhTCZqpXb5GamIzVWs9oEcibNVm1k=;
 b=JbU2saMFMgmMrEhEQFT5mzyjpLe027Hs0cFOtVADHSvl7a9gWbJoZWUg
 mgBnZa6OvxAjYThU0KHcRmPxZ8FJQaHnhFtZBhkegOExQvhrQO/swqJ/B
 AIkd/LuLz2Kv3oOQU8lgCzRm3/ioYDqMf71+re76jtwy5wQVYLZqNL9Z8
 2Bj2TKnxTcHTJjp5B6uMpN0JrfI1us0LiAym7crguV0cRBZXoAjWk7DNR
 pBMKSzrZOgr+3GhBJe7Nr9GSNhz3kAkyYIh7AZLAGMA9roGQwDf2uWeGu
 gAEznkIPSH50/GPP0QhwOEb0sH0tNlqgJwRB+RfFZGwyQHSoku6Znchmo A==;
X-CSE-ConnectionGUID: Rd0MzmqyQ3+XuxJfNtUlUQ==
X-CSE-MsgGUID: eBur88chR9O/ghzcEIYBZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41025364"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41025364"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 14:03:40 -0800
X-CSE-ConnectionGUID: 6voBFT4ZSuuFBFC0FnK8vw==
X-CSE-MsgGUID: fCzx2asCSZuVJvZQ/IWmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83665037"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 14:03:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 14:03:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 14:03:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 14:03:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR16Yx6usTgwr2WwOJWX+Zmy6UTcYPx99sW4Bh6kc2lolGKl2SESDwW5c40FgX22OO8Pmx8w5/1VqxHivJuLQR3QE6id0phyZMBG5wD2C93dPJuWJdRKVwFQ9AXvU60pLYL4rDVroQB58wM9vx8BNh3NdDgZgHi9I6QiDv9NsScQ83w5Vt8GLbyxa4Q8nzzOnT3Plbxne/2VOfwtrV+pCaTyc4S1nmaBEV+YUGiYvtrd+09KLF5jEZsb9BIVph7EhAPMUSB3e8mUMyMPJuVlJdlARFJGleMkhWBwpORVjOBz7imYvxWwAVhv4hbyecSmRSqXY6I1NLAbeYfSuSEuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvhpV5aadWN/oFSH4YzwgLJXVJOaNi9J88VOgaJOyGU=;
 b=RgU4WPl8b9v9VQuey3Yl7e0z9Vl0PdfdzOswP4jw15sRDHhuT+lVXEAGOnBoqsQFoDSD09SU03QReZ19qIVGdKnVK8UT0LrSScCEcd0FGj3lLt4CE0dBUMDbQRDVRd3bTuawjkn0Na52rmIkirFCnD14aHwnJpmd/2Z/Cvk3BIq5Ol7j617zd4kZWB+vff6fxyqyjJC/qFOPuaahxrTq18jqTuJ/vXvGdx82Y25vK8+pg71MlROJLt9AXw/tNIyYL8W0tA6nck/Lu8riSYiGbzByUTHRnSLW3Ei6pkk3GNqdg2oujE0g6svb0dbP4kZc8XGzNca3obI2D8AJGgPQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Mon, 4 Nov
 2024 22:03:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 22:03:33 +0000
Date: Mon, 4 Nov 2024 14:03:31 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/perf_pmu: Migrate to unbind + unload
Message-ID: <ZylErmpss2vyODIq@orsosgc001>
References: <20241023050502.3049664-1-lucas.demarchi@intel.com>
 <20241023050502.3049664-3-lucas.demarchi@intel.com>
 <ZykfkqmVRApXn/w2@orsosgc001>
 <vwuotvz3q2juoio576fdfbenrysl7awrmmyywg2tbev4xh7vfl@enz5kz5xd67j>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <vwuotvz3q2juoio576fdfbenrysl7awrmmyywg2tbev4xh7vfl@enz5kz5xd67j>
X-ClientProxiedBy: MW4PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:303:b4::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: 4012066c-1530-455d-25d5-08dcfd1c862f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTNJM2RES2ZrUHhkM2xteXJUdWh4NG5yVzVVSGlUTzZvWjlpamlORGRQTkNS?=
 =?utf-8?B?bXJYRGtXRXlmYWhtdW02TVdBdGNJUkliY09QRkR3ZmM3U2x6dFlhMUtoMTlY?=
 =?utf-8?B?bXNScHFIeWtvcVlNUU1KOWZIZGdlZFBhbzNjUXdIb1NpQjNuK082UVNzSmY4?=
 =?utf-8?B?dWpVcEEyWTcrenpjV3JXLy94cDFmNXlLY295UHZ5NnNaQnNYRFFGZmtqOWM0?=
 =?utf-8?B?d21vMy9QSTVHZENQdW1vU3RoZzZxeWVyRmFBUk1UR2hVdWgvc1V0VkV6ejh3?=
 =?utf-8?B?cTRiN3dMUGZORGx6U3JReFJaZ0ZrVS8xZFE0TzhwOEhKTWhNa3JFQTArMmZX?=
 =?utf-8?B?b2dzM1JKcHMvUlRKWk4zUFVDNzNWNmVGQW5HK1F6QlMwbjQzVmk2ZmVUT0NY?=
 =?utf-8?B?VkV2cG1pQ29ZcDRpbElNUENudmZxc2tiQWVIKzduK0U3V0RWcjYvVFl5cnk0?=
 =?utf-8?B?blVPc3NsaDl3RGFWNEhLZUJSeVc4czFyc1BtQVhlL0dvaVlCcmlTbmF1NnJU?=
 =?utf-8?B?UnpXanBKWGlEd1p1NlNadnFJWWcraHZxaGdVeXlOa0h3RXV2QTUwRHMxTDRU?=
 =?utf-8?B?cFgxN1ZldTVoMGRlOHJvSEoyTVV2bEJ0enpKUzdjbW1pb2dVU0w5QUlxWlE3?=
 =?utf-8?B?eDhwalBhRTBCYXRjUVVrb0FGMGZObnN2elZQcHRRVmZGV2M0a1BhVmlodlZ1?=
 =?utf-8?B?ZHR2aWRWN1hXOC9rL0l3R1dEZEErR283T3FzNC9DTHRrNjhJWUJVaERaT1lN?=
 =?utf-8?B?aWlNdThBdXJWcWsrajEveFlTeDBiL3NDOFdVbmJiblY2QXZHNk5VRUxxWjNy?=
 =?utf-8?B?WkI1NCtNUFg2RnFSVW16Zk9UdHRxZmhXekt4NUlhblRxNUl0Y2xZZzlhQUVO?=
 =?utf-8?B?UzAxTm9vdFZsNDVkaVV3Vm53SWtUVDNReE1TeDIwZWRZOTZGVUVNTEEwQlY3?=
 =?utf-8?B?VXdVVytSRkxaK0IxYzdDbjlSaUhvL3hoZFpoTFgxYU5MRGhiU2xwMlJmWG11?=
 =?utf-8?B?MW1Qa04zYkU3NWhwVVpmbVlHOU9nelNrUDU0V1ozOWR3amM0akFydlNqNW5X?=
 =?utf-8?B?TGMzOHRxSGd1aFltdEdXazdqTE5QZjREd3BkL2Fhc2liMHU1SllYeWtoUVA3?=
 =?utf-8?B?ZE9iZ3YrYWREeGdFbElqbWpWRWh6OUN1eXdqZXJWdGYxaVl0eWpHQ2V0bFdV?=
 =?utf-8?B?NGJOVzJrVDQyR0FWQytkYzlZY25odUU4OHkveTUwMEdYRUtSUU9VMzMwUUFI?=
 =?utf-8?B?cEc5Mm1nYUZnbnVEdHRidVdlUmZxMlBWQjB2Y0hiMVVCYS9XdDI4ZVRDSnFE?=
 =?utf-8?B?bjJvSGUvNjF5S3V6alE2MXV2Ykl1dkhrOFlTWitQU21zTk90Qmx4dGcxcjRR?=
 =?utf-8?B?MmN0UnhwVUlyeGtENkkvajZwdWNubkIrcmcxZzU0a3F1SVByS040aUdtTEhm?=
 =?utf-8?B?L3B0d1YwSm1HQ2xPd3R3bEdQd3JiS0lUakVSbjFBUVUwb2RveXZIcjl3UE9S?=
 =?utf-8?B?RTJHWWhiaVZNQ08wWWhKUlFTdXBMODdJanIzQWk3dGNnUVlUQXc0ZGxlc3I4?=
 =?utf-8?B?THBzSnArQVNQSlM3WmZ2NldFNWRjRFdidmFpNXVUS2c0Z1ZlTzlqU3oyNUcw?=
 =?utf-8?B?bUd1N1VVcmxQM3dMdnRDYWRwMnc5YkF6UnNCUDQ2N29KZFI2UjlBT1V6K2cx?=
 =?utf-8?B?VjB5Rk5PRmtZQ2I2dGR3V0ZvN3E4UmVTV1JNZWttaFVDQk42cXZ6OFoyWDNu?=
 =?utf-8?Q?MPA/ZeoCjr2kI1AE34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmlYQy80Ly9HMWN4N1QvdkkxRUZmZkxrZTR1YnZyMFQ4M0RnM1loUm1tNExV?=
 =?utf-8?B?b1lPbFlYdHZXT05jbTlTRWVRN0dNLzc1VC8zaU1hRG1rQlhlOHhzQ2d3NVF2?=
 =?utf-8?B?Y2ZsOFVlbzFjeERhM245Y0MzWkllR0RJRlk0N1BGdDFYY1RZMTNHRDlPYVFY?=
 =?utf-8?B?QzZ6emtNTzg2Q0w3S2ZJRTFpdkJWc2duL2pnRVhtancyWmlLRFBHQmVuMHdG?=
 =?utf-8?B?T1NPODArbkxDZWtHa2taeDVmRmF0YlFmcVo1SE1IRWRSQjk5ZXZTRmZ6OUZp?=
 =?utf-8?B?c2tZc2VTanV1T3hadjhnMWxXSWJxR3RzS2tVejcvZW14N3M1R1FGNVI4N3FS?=
 =?utf-8?B?UVloTXdoOWI0SHdwMnp5UWNpY1FMQjg5OGNKKzlLSmowaThpMVNMK0xBSU5i?=
 =?utf-8?B?dDVuRVJPcW15MFIwZEU1aCtMZkQ4bldrN3dWTlZNYWtyYkpxNjdDRnlBVVkz?=
 =?utf-8?B?ejhLQ0kvbFBIRDZoUW5YNUk2M1dtUUk5Snl4TS8veDNYMHhIZnZVZVRHMytG?=
 =?utf-8?B?MGZobGEzYlYyVHphZEtuVTBpRDNQb3RSQnVTb2szNEFqd28vL1d0SzJsazRp?=
 =?utf-8?B?K2lOMGJZaEdFSWpONEFoaFJWQlVZV1laOVFJNHlEaExpcEhwMWxFb21Dd3d0?=
 =?utf-8?B?QUZLaUpQZTBML1lqNDlqZGVmanJpbC90WjY5ZGxabXRmMk1Ma3Rud3dqcnd5?=
 =?utf-8?B?S250dXY5SDFCdGlKK25SRzgwSjc3MGp2NzV0OVVqRGU2N0J6blg2ZFhUOWlq?=
 =?utf-8?B?M0N1ejFyU1FVcy8rZ1pPb0hteVMwWGdkQjAvajk1Sk04TW5HTHdpWCtGK2tB?=
 =?utf-8?B?bWFDbWVpQkJXc0VGYVZ5b0hwMXFJZUkvZFNiZTd2MmkrZytlSEhjdThmZVJx?=
 =?utf-8?B?M3V6RExpeWxPNGprQ1Rna2lGUEZDc2hkR3huZzVwZ1RyTzA0eVJnS0RyVjFT?=
 =?utf-8?B?UmVrNTZFSnUrelZsV29hOStjc2RmSUM3TXgvSHlveDNzNkRNVUF3NGNIelRK?=
 =?utf-8?B?VzdiRGg3Ry8yWnR2NXdyTEpmRzhPUElGYVQ4eDlTdDhFMCtod21SeG9xcEdH?=
 =?utf-8?B?UnRSL2wyNit1Q3R3NDlIZVUzT2xkdkkyUU1RSEpzQ2hFR2pMYitLMVpESDNT?=
 =?utf-8?B?cFg5RTRlV2tRaFQ1UnZoV09jTjBsbVNjMDI0UkVtQlFvWEtHazhZMmhjQlRF?=
 =?utf-8?B?dlRVNmdCNzYxSmE4VXJBMDN6VGlGcXI4WEd5VGI2L3J3eUlSbWlRNG5wS3Rq?=
 =?utf-8?B?bzd1R1VHa1ozMlpyK1dzd1dTM0dYSS9VYm5OeUVGK2l2SVp1TjI5UEpNeC9l?=
 =?utf-8?B?NDVMNk9id2VuUG5OOG1BdDlvUURFeGU2RHpFNTNJdUFiVDFUaFMxejZHWWRY?=
 =?utf-8?B?TncwNlV4czQxaUpVcFZQM2l6ck1UMGJIQ2ttaVlFb2RreFBQRG5uN1pwTExT?=
 =?utf-8?B?Z1ZlM3gyMlVicUxlV0tOd2N6Ti9zcEhKaEVYN2w3WmRMMTk4aGg4ZFU2clZv?=
 =?utf-8?B?UklMSktOWGxkUENGblo4OVVTa1VOUnNDRkVka0NvSlVLaHBzTW1SUHVMVDE1?=
 =?utf-8?B?K1B0OFk1M3A1ckJrczRIekVuR0ZzeVlXdXBIQ1hCVE1tZW1sVytsRjFDb2tV?=
 =?utf-8?B?bU9iL0lMcFFGWHpZdkRaL1VxYmpUektkOXNoTy82dlpXcU1QcnNOeDdDcjk2?=
 =?utf-8?B?SUtrMVBtSTBpYzVZVEFMRk12aFE3OVpIOUtmNUNPRlN1UVZmb1dBNnE0ZXl1?=
 =?utf-8?B?VjczRWJ6bml3VlRyTWdHZm1GeldyMTdWZWVZaCsvam01bkRsRExsMmx1TFEv?=
 =?utf-8?B?ZjNDOGp6dS95S1VpU1p6UkVMd1dYUE5LR1lISEtIbUVjeTM1MmlROTVUVUNP?=
 =?utf-8?B?YWIyMzVnazNzTVpnUHpMTlpFb3lzYVVmcm11VThkT1VaNllhaWttQTQvMHNi?=
 =?utf-8?B?TmNzMG1QRG9uVHRFbUN0ZnkwZ3lzYngxeTE4VXpuUTJ1endhNkxNTTNZN0Qw?=
 =?utf-8?B?RHNVWS83dzBpVnZUYkhudjhrd3kwbEZzWms0SnVPQXZVTXRJdnEvSDl1Qi9R?=
 =?utf-8?B?cmtidDZHUC9Yc0dmWHkxeEdiQTc5TEg2aFJqVU05VS93WVM5UVpDbERxc2tM?=
 =?utf-8?B?MGFwZUN1cU1hMytkVUxyeWlFeEN6Tm1EaG9zWlp4SmlGSUZsenRobWxoQ05Z?=
 =?utf-8?Q?097aFnZMWSflDUGHIajJ7Os=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4012066c-1530-455d-25d5-08dcfd1c862f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 22:03:33.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cFukwQwj6DWiUmy+VTTJSjSbSsrWPBKfslHhzOw3nfnOw+uw6P0eh+BHj98m98H46H8l6G2YTrAAZHzjaXLkdvGMUKBF22BKRtMyFqMh/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
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

On Mon, Nov 04, 2024 at 02:49:42PM -0600, Lucas De Marchi wrote:
>On Mon, Nov 04, 2024 at 11:25:06AM -0800, Umesh Nerlige Ramappa wrote:
>>On Tue, Oct 22, 2024 at 10:05:02PM -0700, Lucas De Marchi wrote:
>>>There isn't much point in testing we can't remove the module directly
>>>after removing *some* known dependencies. The point in this test is to
>>>make sure that if the HW vanishes, driver still behaves. That is
>>>currently not true, as it will cause perf to explode.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>LGTM,
>>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>I'm actually thinking about splitting this patch. See below.
>
>>
>>Thanks,
>>Umesh
>>>---
>>>tests/intel/perf_pmu.c | 22 ++++++++++++----------
>>>1 file changed, 12 insertions(+), 10 deletions(-)
>>>
>>>diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>>>index bfa2d501a..6eb4f09d1 100644
>>>--- a/tests/intel/perf_pmu.c
>>>+++ b/tests/intel/perf_pmu.c
>>>@@ -2282,7 +2282,6 @@ static void test_unload(unsigned int num_engines)
>>>		int fd[4 + num_engines * 3], i;
>>>		uint64_t *buf;
>>>		int count = 0, ret;
>>>-		char *who = NULL;
>>>		int i915;
>>>
>>>		i915 = __drm_open_driver(DRIVER_INTEL);
>>>@@ -2337,23 +2336,26 @@ static void test_unload(unsigned int num_engines)
>>>
>>>		igt_debug("Read %d events from perf and trial unload\n", count);
>>>		pmu_read_multi(fd[0], count, buf);
>>>-		ret = __igt_i915_driver_unload(&who);
>
>I think I will drop this part first, so I can remove the
>__igt_i915_driver_unload() and finish migrating i915 to unbind + unload.
>
>Then when the kernel is fixed (which will probably happen on 6.13 or
>6.14) we can think about adding back the additions below for unbind
>while perf is open. Thoughts?

Agree. I just assumed that you will merge this series only after the 
kernel changes land, but I am okay with the above.

Thanks,
Umesh
>
>Lucas De Marchi
