Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5FCD3CC9F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 08:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E778A10E6F7;
	Thu, 15 Jan 2026 08:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtvEp4+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9079510E18D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768465568; x=1800001568;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GZQrK1Azx7SM4hZfzKjmdmPs8vZ2rg99+MX3o5/LAFs=;
 b=LtvEp4+mvvbk1USlQJTf6OVcKEsrhgc0DO9G0TDZRsOFpq9Amt2E3T1R
 A1j76JhbpUARM/AK52oL3gPGCbHi0H6IXup27PGFpC/JziK9tkNZ9eIQA
 TzdWmlWQ2lwiQYABJEAejGAdPfDeUluBP5lV3OR+ON/ahhKutphThedHW
 tmV3+eOMZMdnzLTph7rkA5B5e1XUWtJa+Lrnwzmvs9P0Rh8Z1nUm/xAVD
 0pAwYmLjog9Zto8Fsw4YKYLVsCswGXFjrkZby2AKC7RepeDcEXCUo6r1m
 AwLoWgNvHxDsB0fkR4bUMPY+Pj5gbcB01MSP7urOjL2pZm6xQUlmWG1B/ Q==;
X-CSE-ConnectionGUID: 1fVP4XCCTbGelWxwvYUPDw==
X-CSE-MsgGUID: ycBP1palRwmnDCnW2Uq+rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="95246956"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="95246956"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:26:07 -0800
X-CSE-ConnectionGUID: rk9vMoBZRYKvolvvG9JQ6w==
X-CSE-MsgGUID: aw8jB0H5SDK0nZnlMJ3odw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204954456"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:26:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:26:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 00:26:06 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:26:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFhV7cUgYWNdeoCqzRSEvheIxust7DJKZVrWIHIkE4BqBe0vSxi47H9X0W0d3GgULPjj3rQOpr3kp7hVJ8OggymOntSH37EJjg1jbyETLpBGgF8ZInJ7FZ6WbtUXzfwQ/m868V54tQJmgbuYMi0MDrZHRpto14ruw5OwxR8L97MXBmZVNGNin0c/cIAQdQzGaa3Kp52NEDRnVf4Xc8DY5OfjNm/Yi5kNF2/eoVrr4oB9qfXlLYwkmlzkM1pDhDKqevVHy2DEjb1HFejADMEzokvv69yw/+Dic7FH4AgXPeYjT+qdi1ZlUKnJI+mruLYAqvgmM9GLLH2ZSTqhKIwEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kC1hmseZxl5HCwiD+QM3B8jDc7lR1udxDlFMThNRke4=;
 b=sX9KbX5ag6cFjehhgKuu7Fh9EsBPLztXEdwrRpGtrflYqAv+FH7kfZcRhP1BaLvP32INJLXxb2NRS1JAfDxEEkfxfTBZ681Ge3G5B8Bf0i+C6lCZjgZsqbeica8LRUWGkXyycOjpJ3zsWU0cHkNgDMbPE/1gtWbBdle949a4HSDYjL8upEloQgSEDgUbiHowl/MWdYXN23VmgNeTPawnJj5VFMCmVqGTRKh8dKRf3CqwBqnzSFWHxivRziKeiRTXImkVbTxkq04jXDA9beuw0PmEVwpsfY7AYuNwiRTOte1zrneziI/23zI/a9JmtCnDdS9oyFkPZIkDkekmPQ35iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:25:59 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 08:25:58 +0000
Message-ID: <e277e569-e77b-4ace-828c-3e12796a9c87@intel.com>
Date: Thu, 15 Jan 2026 09:25:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 08/10] tests/intel/xe_sriov_scheduling: Prefer
 SR-IOV admin sysfs accessors
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-9-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-9-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::16) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 82723659-2cad-4f59-3b7e-08de540fb5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2E5dThLa1ZqbDhETHlEOWdvME5NZW9RMVNkeC9qSDZDTENDaHQ0bkVDdGZq?=
 =?utf-8?B?dWhZLzJVU3RzelYzR1NNV2dRNk9PMUdUNC9Cd0N6allUYldWcWxhb2RBdkFV?=
 =?utf-8?B?aHhiNnhrZ2pYc25ZMEFGdXRXSUFDaEdPaml1ZVMzTm5uL0ExVkNjMlpWNEJN?=
 =?utf-8?B?UmthUFl2MzhPV3JXUTI1ZjhmamhMeVRlSmorRm0vNFJnS3NIS1cyK25rbVp1?=
 =?utf-8?B?R0F0U01iWVFFT2FNaGFGcVo1bWIwdHFsb0tKNlBndkxNcFNBYjBUc05PcjAr?=
 =?utf-8?B?dWxyOUwrVFp4anA5NHQyN2FGN1FTaUczWHErYy9Uc2JLbEpnNW56MFk2U0c4?=
 =?utf-8?B?OHBLSG4wMWJYM0x0U0lHNXZ3c1MvZ3VuS0dGMUdZOFVJdHlydU5GVXRFSlFp?=
 =?utf-8?B?a3F0WEl5U05VNWpldG1SNHBiV0k1ZnYyS0NKeFFkRmI1Y1g5cGM1eHBXUlZ1?=
 =?utf-8?B?TTRKTWRJL3RvNVZTNEJEdVpYZVcwMmh4RXZoTWQ0Mk9DYnJoczgyOHBMUjdr?=
 =?utf-8?B?U1h2b0lxNnZ1c0VMRVVqelo5b0pGSjR2OE1VNG4yNWFnRVR3UVQrdDV5Q1Q5?=
 =?utf-8?B?TlFGemRJd2ZnSnNYdlhJeHFob2l6WlRMU3pVYzdXdXFVMUx4eU83c2NzcjZx?=
 =?utf-8?B?ZGZvTzRTa0FkLzZJVTg5YU1POWV3U1VmeDZBOWdjbVhjUUpvWkFyUnZCUmxX?=
 =?utf-8?B?UUNYaElueHBtZUZHczhFMXpxajJFVGtXOVczR29Yb1hUZm1HN3RZMXJDZXNp?=
 =?utf-8?B?ZEJGdmdYMVluOGE0Rk1UbFY5cGdIRzVrQlIxbVY0dFA4aWhZdlNJMlFSUGN2?=
 =?utf-8?B?MHhsdU5ja0hvdytJM2d1SlcrMWx1UUtWOC9HZnVPQlVhSnR6aTFRN25uQ0xE?=
 =?utf-8?B?UkEwOVpMWDZMNzNnUzhpelU2V0lqYmJXVG90eFpRQ09MTjQvaVo3d1Z3Unpu?=
 =?utf-8?B?SmdyQ3hhNVFpSEw4dFpRRTNTc2JEUHVFcVFmSGFNekkrbGhyZ2xxVHk4LzU4?=
 =?utf-8?B?SU5ScXlyVmRObDhoakhvR0ljSVBIbGloalBpcGFmUnBYL2VpYzNXMmxLSlE3?=
 =?utf-8?B?d1V6RHFyeDBzUDNiRmt4cko5OE9FK21CTjJqQllpb2xOWDcrblJoZ2F5U2VC?=
 =?utf-8?B?eWp2dmpaajgrQTVlQmtDMmNiSi9GdFh0Q3ZyOTVSSjFIQlNvVUdZb3ljbEYw?=
 =?utf-8?B?Wkx0bm5BaGVUek1TQTdvTWowTFRrK2pXaC9TVUhuaUFGR2JkSWd1eDZJSlRk?=
 =?utf-8?B?eDU5ODEzcWFtSTRUaWt5My93OHIvcDZVR3hsZEdzRFo4aExKWUdnNzFNZE9w?=
 =?utf-8?B?eGx0ZWxpVDluK3pWcHM4SGxXUW1qODFSZ3lRV3ZDWGc3cERRYi80UkoyZTJE?=
 =?utf-8?B?QXd0cVJwV0d3c3I1dVZBallDYWEydERpU2xaWXA2S0R1Vm8rR2U0aFN4Z2F0?=
 =?utf-8?B?SDRLYk9RNUhPS3JmTjNZWGgvU2hTTEYzNlhCdWdaQWpXc1lKSnpxK3Q5Rjk2?=
 =?utf-8?B?N3cxZU9TbGxoOHhvUDhVeGRUbHFjWndIZjVNRzJUQXE4aDlTdml5R2N4UVZv?=
 =?utf-8?B?UGd1dW95SUFWbUhNZTYvNHFhU0NHd1F6M2ZUMG5Eem1lVEE3QnhCSXVlbXhv?=
 =?utf-8?B?dTdqZVFhSmoyUUs4WVdKRUlHTG1FYkpUeU5CSW1OQ3BBQWlpcSs4ejhJNlo5?=
 =?utf-8?B?bDBPUUZ5WWk0SGliS04xcEJrMU44VHFpc0RBaEEzc3lONjdBY1RPYzdWYkkv?=
 =?utf-8?B?RXR1aUQzc3pSYXVpSi9oVDM3dFRXTUlCMk9wYWsrNjJzL0JYRXd5ZkMvREUv?=
 =?utf-8?B?MVRmcmRuL3FVMTJhT2c4bEdCVkc3elVyTW1mVWhjQWx2NnpmUHd4Yll1Nmgr?=
 =?utf-8?B?MUg1Ym15ZXArTWZIUWcvYTh0cXQ1NWxOMVltQk4zQTBnTzhzNmZQeGZGbVA0?=
 =?utf-8?B?R3JyN0JVWDY4aEQ2MDdoUXIyQkR1c1hPaUdKT0VKbHJ4eW9ZSTNPWEcrVjUw?=
 =?utf-8?B?TDBXbnRnZWg0UndQZWNMK1VxUUYyS2xUakRBMzh0NHdQVS9KdDRweEdkQURX?=
 =?utf-8?B?d0kxdmxBcnM2aWFKQWFTQzJPcjNJNk14ZUlpSWhPR1pvTlNwU1NMZmVVaVBP?=
 =?utf-8?Q?eljE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekxvcU1OWnBBcFo3Z2F1Ty94bldBeWJLUkpsbzhFbUZ0YzYxdXpjdHA2Vm5x?=
 =?utf-8?B?Nnh1eHgxTDVFRThvKzRmZVo1emdqT3JxVW5xRFNKcFVsN3BzR2VPekR5bHZO?=
 =?utf-8?B?RWxtTWxCbEhDdEkzVG5odWh1WTFkRjVabGxaVHlubHBBOVZNeFZ3VU85cmpE?=
 =?utf-8?B?TlErZzQ1VUJLam0vVzNnSzhzZHIyQldnSlp6T3AydG9pTXp0SWFWMG8weldv?=
 =?utf-8?B?dnBXS2VCUUZnd2U1QzBSNVI5blZrSmlBT1ZPanl6SUliNE15cnZBeXJHZVpl?=
 =?utf-8?B?QzVDSkIydDh2T255d1VpcVpqTURZN1BwSUo4RHhIZG93akdHRU84L2UrNjV0?=
 =?utf-8?B?MHNLcmRIZGxWRmttZXZLeDVQZS9vSGF6ckVhUmhSeXhXalYvelJnNFdPMXJl?=
 =?utf-8?B?ZWtHK0l3dlhrYUJSSHMrTzd4dWllcHFHdUdXelJYWjNVbmpIWVRlcjdEdDU0?=
 =?utf-8?B?TzVWTDhySjRHb2Ftb3ZiZEhIYWZNcU9JV3Z4YUo1N25WV0lDNW1ZVUJuZnZj?=
 =?utf-8?B?LzJYK2hZOVdBRDd3OEx5bjd1VmdqRTltaG5JaGlzWHc2MEhaM1hHN3gyakg2?=
 =?utf-8?B?ais1WXBwb3JaZCtXK1p3Nlc1VVZpTmpLd1FoelVKY2Y0WnpleDFxR29EeExl?=
 =?utf-8?B?SUV6aXovVk1EenpoM2V6a0pkaDZUNUM2UCtjNUZ6NkMrNk5GTVdaTXlsaXRO?=
 =?utf-8?B?SXEya0dIaFlwc21jZ3RldVBacTJ6bmZiVGhrL1JMbWphcXVHOFVqQTNnaDls?=
 =?utf-8?B?aFp4TTNwQVBLY1JoTmFBM3RyZ1ppdzZTUHpSVHk4blR3T0dnRnlGVFBUVUxR?=
 =?utf-8?B?YkFSRG9uZGdtWGNqclRDRFdrUmtzYTgreitIWmpibFd3ZEFzZDNJL3ZWbFg2?=
 =?utf-8?B?dnpXUzdoR2VRSnN2MHNTdE45QW9wR2xnTi8zaDdiZG5zT0M5TjVKWVAvdk5x?=
 =?utf-8?B?VE15bDFSRG0rRnFlUzFybGdnQkNBYWdjb1lEeTFwa0VqVU9uY3hQbndXUy9F?=
 =?utf-8?B?bWxDOTFTY0tWVWxFeFBmQVBqZEM2azh1STROTmZOb0l6UVBwWmt4Z0pjb2hj?=
 =?utf-8?B?SUFVUWdJMVErRFlyQ3AzaEpQSzBpbVgxT1VrZmI3NHhSUWhyWkpiRXFMdHRl?=
 =?utf-8?B?Q0ttem5naHRtZktJZi9sdHUxZklYdUlIQi8wR3NmZFRmQlIvdlh2VExpQStl?=
 =?utf-8?B?T0pFMEIrcnJmS0RCcktEQUtQWGxvckpMNlFBMS9zMDJwUi9ZREt3YTVWS2Rq?=
 =?utf-8?B?UWlsdFBVb2t4dytWcDV6SmpxMUFseWhWcXRML0xBWVBxVUhUQWNtL0Y2TlpU?=
 =?utf-8?B?Sm9MUXcwaitMOTFpcHFnU1B0UERqWmRPemJvUnZvWmVoakpMNXE1ZUpuaVBB?=
 =?utf-8?B?UkE2Q0VTVWdyQUdsTytuQ2FEanRlQW0yYS9UeE5saXNOeHZJcFZnZ3VBdnFQ?=
 =?utf-8?B?Tm84TmNzVk9PaXZQOGErKzVyU1hrVDdPNGJVdkx6enBoVk1TdmNMZVdpQUtu?=
 =?utf-8?B?YjhOaDczODhkYkYvQjRIenVTMmJMSEZCUmc3bnFvUzJZbTh4dGY0d2ZJaUNV?=
 =?utf-8?B?NnFJY05va2VSUU5wdVh6S1BpUGVrTW1iT09rTEhaQWFSY3E2Ri93eUgrVlRn?=
 =?utf-8?B?NERoV3Z3dHVXQWxrK3B6MnJMSGg4V2ZYQ0dwL1ptYWtDRXY3UGdmSU8vdUVh?=
 =?utf-8?B?SGYwSHFHREo3c3ZISHNXd3lLdUhuMjZMbjIyN0JMQ0lPYTY0Q0twQ3Mzbi95?=
 =?utf-8?B?SEVsR0Q3amhRZHhQVW5Ydms3U3U1bUdEMnhkWlFlNmpjWWFsUDg4cEMyVFZO?=
 =?utf-8?B?UlZ2enBuQjZYcFpScUtDMlR6ZmNOMC8xbVc3UDk3bEtHLzBpTjBKVmRDdEZq?=
 =?utf-8?B?cXRDeWlxMTlTb3MrVGM3a2dMQk5GSzBrYlZyYTRaTTFLN0xnSElKaEZhZzRU?=
 =?utf-8?B?ZU9Vczl3ekV4WHVoOGQ5RjN5N0sxeDc4eFhyZElkb2FjUkVPY1puOVprZXVC?=
 =?utf-8?B?cmVUaTBnb29SbFpJMk1DY3BYNElUWDRuSVRGVzJZVkhrSWJ4RXVLYU9mOWQv?=
 =?utf-8?B?RllFWTU1OTFiMmt0U09Wc0Vad3IyVXVUT0xseURWY2gzeDVBdDNhazN3bC9Y?=
 =?utf-8?B?dDJQUXRxVmQ2R2xKenpaYXdpR3h0K0F3eXljTHVtMGszVnBiMVYxRHcxRDRE?=
 =?utf-8?B?MHQ2ZW1vM29zNm5DV2FGSU1JaFI5dFJiQXpaL2Iya1ZpSFgwbW5BeXN3N2hi?=
 =?utf-8?B?QzNGV3E1QlpvWEtGWTFjQUtzSXZWcHA2RzIxU3lVaFM2cXg4SzMwa1dPSVVz?=
 =?utf-8?B?eFVEQjcwSU1iZHZKb0ttemY2R1VZVkdPZGJPdHI3akF0d2NqMUtOdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82723659-2cad-4f59-3b7e-08de540fb5ef
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:25:58.8841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvOvDtkzug9rrekxKyLQd9J+qKxZHXmD/tdO1w9V6+11Jk0+KVClybuRQ+a6gA7hSe0rSNX/qz7v2I5w1yZ0wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Use SR-IOV admin sysfs setters for scheduling parameters,
> skip if sriov_admin sysfs not available.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
> v2: Switch to SR-IOV sysfs setters (Michal)
> ---
> ---
>   tests/intel/xe_sriov_scheduling.c | 38 ++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 3a0c0d438..491d2eb0a 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -9,6 +9,7 @@
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_spin.h"
> +#include "xe/xe_sriov_admin.h"
>   #include "xe/xe_sriov_provisioning.h"
>   
>   /**
> @@ -374,27 +375,21 @@ struct vf_sched_params {
>   static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
>   				       const struct vf_sched_params *p)
>   {
> -	unsigned int gt;
> -	int vf, ret;
> -
> -	xe_for_each_gt(pf_fd, gt) {
> -		for (vf = 0; vf <= num_vfs; ++vf) {
> -			ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
> -							     p->exec_quantum_ms);
> -			if (igt_warn_on_f(ret,
> -					  "Failed to set exec_quantum_ms=%u (VF%d GT%u): %d\n",
> -					  p->exec_quantum_ms, vf, gt, ret))
> -				return ret;
> -
> -			ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
> -								p->preempt_timeout_us);
> -			if (igt_warn_on_f(ret,
> -					  "Failed to set preempt_timeout_us=%u (VF%d GT%u): %d\n",
> -					  p->preempt_timeout_us, vf, gt, ret))
> -				return ret;
> -		}
> -	}
> -	return 0;
> +	int ret = 0;
> +
> +	ret = __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, p->exec_quantum_ms);
> +	if (igt_warn_on_f(ret,
> +			  "Failed to bulk set exec quantum=%u: %d\n",
> +			  p->exec_quantum_ms, ret))
> +		return ret;
> +
> +	ret = __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, p->preempt_timeout_us);
> +	if (igt_warn_on_f(ret,
> +			  "Failed to bulk set preempt timeout=%u: %d\n",
> +			  p->preempt_timeout_us, ret))
> +		return ret;
> +
> +	return ret;
>   }
>   
>   static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
> @@ -912,6 +907,7 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   		pf_fd = drm_open_driver(DRIVER_XE);
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		igt_require(xe_sriov_admin_is_present(pf_fd));
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>   		xe_sriov_require_default_scheduling_attributes(pf_fd);
>   	}
