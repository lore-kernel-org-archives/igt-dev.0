Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8C0C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 14:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A1E10E12B;
	Thu, 15 Aug 2024 14:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E64XRL0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D43110E12B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 14:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723730846; x=1755266846;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=KMQhtMbBVcgpVv8VDEBi2uTynjrSQo0TZ1N7U/ePnjQ=;
 b=E64XRL0CMsBQwGMAqelh7ldA/x5njUJjFK3dulLbFr+H2ZrS/s+sSWDQ
 IqS3b/ymz/q1hZ7DLxq441O1MLnK/q/Bqk/eA8K5N+df2eTRkzzBq+vGw
 nPuYTUXhmQwkr0sLwuttIawgQIiOvswgCQMxaElpPEcZMMKdH5H/93nIR
 ASvJsQlbTjaon5PMOKAnBdUEIfP1EVan4CjLNJCB3UOnlMO+3kKKP5gum
 pVGlT7PoKAjnYcqDE0/+g7ay61jkqZfR8he15uI28eLz6IzLomViOMvC8
 hg/ex9BX5jY1MW6VZyE8VImltW0fISUspqDVD4nDfrcyPYybb1YCtOgfN w==;
X-CSE-ConnectionGUID: IPEN8FbTQhyRLJFwQHGR7Q==
X-CSE-MsgGUID: d8UPVcLeSOiaclTgNf9smw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="13031061"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="13031061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 07:05:53 -0700
X-CSE-ConnectionGUID: 24KxIG3VQ2CE4BCVARvsfQ==
X-CSE-MsgGUID: wejHD1TrR/+RFYqav6YG3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="64194391"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 07:05:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 07:05:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 07:05:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 07:05:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xmqp+GiAzv0uTXahiU90whztxpVqJ7+ZASyvb1LuKtFIKew0YB1rxIWwYsf6qbeGrSxTHNqqQ2ig56i7DaBrZTw4gvMJKjkxOO1XKVPncn+18PhcRoxvSp1GGEtKzwXK5PRrIusMFzxi4qm3Rmc39XML3PoPgOk3W0kPqkqIp1i4i1pE657YC8MB8DkH7dOF2lFFthPL6DyOYZ9S4reQVpDgmm2Lro2TOY0AjMPztAAmmoSD5hShKrSABp8wzdRCvJkW8zm76eZXrW80H9PJFiTDNRbtZz/uX7tPmDqQmtz10hSaWjEEptBfR7RV+UczKn7xf7xM6x9wHulGpipOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaYBivcbnvAqDt6DXDDcPXTcfbnX0fmKdgov55mQ5m8=;
 b=ddCCpB3lwnhhuaGy/ez8JF3ne8q4O7CBTyYteDGJmgoURV93X9BK0Iwj+yXUia82GZz650pxQ1x6A0drPn8VuHtikQSohm+5ThPDqAoDL3dlpzmHLABffdWxgCQ8M6vH3yQ7SgnrQcFzroeLz1cF9GlZWNUVnOHq4Zei4bMP0uujt4v6P7Pn+xMbojyrXMSfZH2presX1J7rnjZbZes0xTMZecPyQFHlFtbo8xZMeyJTHiKvaCD4HsusycFPZkwYst1vYmbo3jrC1Ck5paV99jBDpjAxdw6fssa1362nfb71lb3UJn5IbY+RyfkkRLjIMfYZH/dIG/yyvynw8T9ojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 14:05:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7828.031; Thu, 15 Aug 2024
 14:05:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240814214705.3718355-3-lucas.demarchi@intel.com>
References: <20240814214705.3718355-1-lucas.demarchi@intel.com>
 <20240814214705.3718355-3-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 3/3] lib/xe: Remove MS_TO_NS()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Thu, 15 Aug 2024 11:05:43 -0300
Message-ID: <172373074302.4082.12597431728346374627@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:303:8d::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b70dee-46ba-4457-20d8-08dcbd335c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3M5NG1oWElGN3d3ZHlqRzVRWEJIL3JpSXAxZWREZmozNHAySkhUYzhUTEh1?=
 =?utf-8?B?bHhaVE9HTnJyTWZiSEdJSEwrRFMxb3V3eXlBR2V3S3EwS2RCalhHRTlsQUk2?=
 =?utf-8?B?ZlB1dmJpS1hsR2xnSHh1dENvUXRJUTZIaGY3QmFSMjR2WlhjMVIvSnpRUFcr?=
 =?utf-8?B?dit3dHJNYk5PcDhveXFqcmdWTmhnSURSaUpNU1FleG5ZcVpML3ZFOWdKQko2?=
 =?utf-8?B?biszMzQrVUZJMnpQUE9uWlpZWkZCNmZuakRBYzl5RGwyQmlLMVZ0ckxCdWpH?=
 =?utf-8?B?NW42QTVGYTRXSm1lbUhBZHhlanNNUnU3WHd0ZWxDRFp4aUkvY3dIRElvbXlq?=
 =?utf-8?B?ZWE5bHhkUG9LWWlaalI5M1VRa1diZ1R5MjF6aE4xaytBb0FPYjJyRkdORGNH?=
 =?utf-8?B?TEpwemdPZ3EvRFYzTFhQVzIxeXM1V0JIdUFza04xQzJsTE1pSmpaeUhIU0Q1?=
 =?utf-8?B?U3ZGeGNQWW5hakpobkJacVI4YVJGN0Z0bkViN0xpL1VGUy9nT2NEdGp3YU1w?=
 =?utf-8?B?azRuWElOY3JGaDhEMXM4RnNFUFJMeU5rWk1JVGV6Y0VCVkcxMHo4ZUxINjZi?=
 =?utf-8?B?WDFxSDFjc2J6ejJuK1VOcjFxZVZQYlhsbE96VzRjb3Q0VTM1bDRmZmNydU5B?=
 =?utf-8?B?bGJQZlFTa3pPZkxPZ25RM2QxTklDWXo0QTNHaGN5MXlVZ3BTWU5uaFAzOSt0?=
 =?utf-8?B?OFN2VUFVcHE3U1FSQk00MDBhQW9wc3VSTkh2SzJNNEVxQWlaZk9seGs3eEtu?=
 =?utf-8?B?MVRGb3JKQ3hxaUpGeTRRa3BGbEVUcjJQbERVVXU3ZFFVMVdZc09SaEdPVWxD?=
 =?utf-8?B?N0ZYSm5OSzVNVW9KT2UrVElOYmNuRW0wQlUxNkJMaEN4RkNMYW82M3hXNStH?=
 =?utf-8?B?elNoeVdpT0ZZbFFNQXhMRmI0c1R6S29NRzRaWmNLenFhT0dKRmJield3UFRT?=
 =?utf-8?B?T3dIOEMyc1ZELzNjSjhjemxHSzk2NFVGWDNlUXdyRmQ5aVNWSDZWSjNJa1Zj?=
 =?utf-8?B?bzNzREJqMnNsVHBNZXRPbjQ5cDYvb0pwQVBkcm1GS1ZhdFFJN2dPbzgzcWZJ?=
 =?utf-8?B?V0dBMDJiNXduV28zeTBXTWVlWmUrMFVjQlJ1ZGQ1NG5HclhBVW1Zc0xsMklP?=
 =?utf-8?B?MGRaMU84RmwrQTVTd0xQMHVZL0xETGxZWHlFSEo0RmxlVnZSQ2hZZTdSTzFN?=
 =?utf-8?B?d2RON3RYT2t3NTFFQ1Q2akNhZU4yU1MySkNrdVFFQVQ3cWFuNXlYUVl3ZFNU?=
 =?utf-8?B?aStSekV5cmFMSldKTHRZR3VvM0kybUtsdTNEeWZxVmpmY3I4U3kxbWJqcitX?=
 =?utf-8?B?anR5dDZ0WFFwLy9CSVhhTjdHcHhWakxHQ3RYZERuano4Z0dLREVPNVJucXU3?=
 =?utf-8?B?NnVpZWRXWDdqMUFLckxNYnZBMVBRc0hMYlFVUG9Mci85ODdVUVQvck1rWEd2?=
 =?utf-8?B?ZzM4SERNR1p5THZhb0gzTDZ2QjhhMUNXbVpBR3FpaVd3S0JXS2dOQUJWTG4v?=
 =?utf-8?B?YUFKdjIvU2pWV1RIRDJLRGVjS2YzUFcycVNtb2R0dnR4VGMwSnM1WTIxTFVh?=
 =?utf-8?B?aUlUOW5IdlNZTEYzQUlDc3RRRXg1Y203ZWMzRzZDa0M3d2xlbDVEZlNjRjBH?=
 =?utf-8?B?ZVYyK0ZpYS9UVlBaQ0lVVFVRZklYZEJzWUNOSWZDcXkrdyt2ZWMyZkQ3K0FL?=
 =?utf-8?B?dFYxaWlCb2RkSzIvSlJYT2FsL3B0RmlHb3ducTMzbk5EaXd1ZFlBZ2FWci9E?=
 =?utf-8?B?S3lrKzB5cGQvZ1FEQlhFVWE1NWlPM2ZRekxMS25HbjRsVHdvdFI0ak82UU8x?=
 =?utf-8?B?UU5JcUFnYlRnV0YzUEVTUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFVWbzNzWk1TYXd2TVBTSW91eXFidFVGRjFZNFEwa1FtRzhkWFRWWjQvOFRq?=
 =?utf-8?B?ZWJCdy9kQ1lGaTRGYjZjT3NqdjB1YmlobHcxcllxazJCU3Fmd2s2WVc1SWcz?=
 =?utf-8?B?QlNuU3JITWNaa3E0MjRMaCtqZ2NCN0RiOGdLc041MmpLaUVZbEFTTmV6djJF?=
 =?utf-8?B?WTNCV3loWngrS3BISmV1UU1GMytEcGdJZnNHT0FwOGhSNlhLbno0S1NoWURF?=
 =?utf-8?B?WGZIc0tONzVvR0g3N2JETWF6K0pOV1hTSVRIWUlxK2Q1NzZ3cXM3RWRqRVRP?=
 =?utf-8?B?UXU4eEp3K0FBVU1MVDJvdnZ0bk1KWUxldEo4R2o1RVhmZ1lrWWE4WWt5VWth?=
 =?utf-8?B?bW0ycHVIcnc5ekxzMFZWUkduQWtDNUM2MVBqZ0FBZE05bERJb3pBNFZtVGxo?=
 =?utf-8?B?SDJJRUlFRVNSQlhWTlFSWmhDQlg1d29iMkd4NUlGRUhQL1RDUGFmTnZqYnQ0?=
 =?utf-8?B?emhSRndPcThnVmpyNFdJY3JEdW5CclZsY1ZuVmljcm1jSzIrQ05GbVZxSGNI?=
 =?utf-8?B?dzNabUFwOXFCTWp5RGl4aVYrbGpsMVBOQjNNenUyRmRIY1c5NGs2UExDN1Ay?=
 =?utf-8?B?WnFHK3pjVnVDQ2V1NWVzR09CMUNCeWYrQjdPZHFYczVySk42MnozUUpBKzBE?=
 =?utf-8?B?alh4b1lMUnFyeEZUTk94Vk1rRVBvRnRLZ2x2bk1hMWpnNGJlSXRPT0RUcVpC?=
 =?utf-8?B?MmVsK01GMS9NR2lFVjRnS21KOCtoVVFyaStwZHRIQTJ4b2s0UGtWYnJwUkEx?=
 =?utf-8?B?ZnFoWVlyTW9xWFRBeURNTStIbE9RTGg3L3J2RWtMYm5Ra2pET3NDM3UyNytm?=
 =?utf-8?B?UFNJUWE0ODdYd1JZT29hSTl5NjJiWlZ4WVR0eHpkTVhkVEl6VEszT1p4NUNj?=
 =?utf-8?B?WEQ1UUh6UlA5dFVnODFWU2JOWFNTN3l3ZnVLQUFlQWozWHpPOXFIengxdkF6?=
 =?utf-8?B?UlFjUW9lME9zbWw1OVJsWm9USzVWb2JGUnFJOTRiWEF4WGVBNlZPMmFyWC9n?=
 =?utf-8?B?MVFZVU11SmFzZEVzL21NdjBjNTBFdDl1M3U4cHVDSmtYSlhnT2ZVb1ZwdlVV?=
 =?utf-8?B?WkVSNnJQOWdBOFZxSG9VRjdodTRzNy92MmlaR3lxOU95dXZCTVByYjRMT1Vq?=
 =?utf-8?B?bUVTWXVjdURaNzJBZDBiS3BQcVVCSURicENMKzZFUEI1TDRLVXlxWERBbVNu?=
 =?utf-8?B?cFdHcmFoS1lMZmREZTQ5QUVIdFNvZ3lkclFuMk13UFJYbXVCK0J2K09CNjhO?=
 =?utf-8?B?cFA5dUdqMGREYlpZVkVDU1UwRU9ZTGhLcGRPRXc4SHp2ZWVEU2JnZHdUd2h2?=
 =?utf-8?B?ci9aQ0dZcUxqMy9QcUlXelJONVNzbTZFbVZvWC9nV2FrRURoTTh0akxVUW5w?=
 =?utf-8?B?OThXUXVjRCsyOHhUREVqSEJqWUd0Z1ZHNldvbE8zMVpYcnhlZ1lrVHk4RStI?=
 =?utf-8?B?K08yOEVxOFBjZC9LVXJtNzd2Q3JZTmJySGxtUkVUZi9MUmRDblc3NUp4RGE2?=
 =?utf-8?B?dnY1Q1J1aDBubmNtS0xiQ0U1QkxOeFFEcXNLRmxNOURrVE9tWEF2WTAwK0dL?=
 =?utf-8?B?NDlmUUtZQVhqLzJXbkJraUJybXF5UGxjVkgvYXVHU0VwU2RDN0c2ampsQ0FU?=
 =?utf-8?B?ZXFydTJZVFliZFZCaWVSTFJtTkZ0aDhWMkNXcml6emxiM3JzMjlwdjBHVzEv?=
 =?utf-8?B?RVlsNGdjZUxBdnhLUlVrTFpSc2RrRW5uRno4R0FiU0p4dmxwVFYwYis0dlVR?=
 =?utf-8?B?WXE0TXdrTEQwY0RZYXZsQjFLdE1ER0ZTd3N0N2x4MEowT3dNQi9XVjNYdnd4?=
 =?utf-8?B?cXphbjVVcXh3RmxsVnhEaWJXdWxtMEorelNhOHk0c0c1UENXWXBmbkpFd0RQ?=
 =?utf-8?B?VUx3RERlTW85N3BQNVQ1Ym5tM2pvNTNEdDU0YlFQbG9HOWh4OURxUkdNNmdF?=
 =?utf-8?B?NjA2SDU4dFdTMFkvU2h0V1N6Q2d2UldLVTl0eGxVWm1SbU1ienVHakZmTmpT?=
 =?utf-8?B?aDhER2czaXlmamI5TlB5dnhEWlRSYmZjMDl4dFVzM1RSSjA5N3dvS2lCQkR4?=
 =?utf-8?B?Y1Y5QXF2OFFxYXkrV3Y0YUl6bUxNeTRSdDgwTGtGK3VsRU5zUStHR1p6NXkw?=
 =?utf-8?B?NmRvYk9LbjJEM1gyM3FaM3BySTFPb29Zck9EZ1REKzBRd1ErTnlsTW9mcjRi?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b70dee-46ba-4457-20d8-08dcbd335c97
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 14:05:47.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2++1z73ZTWllKOydkLuXEmBH5lAceVcnfLnuCVNIKr2QqffGVfpp3Pcv+aOIY7iaJ88e/7yf42aKHWoBhMgSbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
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

Quoting Lucas De Marchi (2024-08-14 18:47:05-03:00)
>This was added in lib/xe/xe_query.h to quickly convert the kernel
>interface to use nsec rather than msec. However it's misplaced and
>doesn't follow the same style as for other time-conversion macros.
>
>Worth noting that the "#define ONE_SEC" and the like are error-prone
>if we are using other interfaces with different units. Example:
>`usleep(ONE_SEC)` could go unnoticed since there's no unit in the
>define.
>
>Use the common way of doing time-conversion via the NSEC_PER_SEC
>macros.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> lib/xe/xe_query.h                  |  2 --
> tests/intel/xe_evict.c             |  5 ++---
> tests/intel/xe_exec_balancer.c     | 13 ++++++-------
> tests/intel/xe_exec_compute_mode.c | 19 ++++++++-----------
> tests/intel/xe_exec_fault_mode.c   | 15 +++++++--------
> tests/intel/xe_exec_mix_modes.c    |  7 +++----
> tests/intel/xe_exec_reset.c        |  7 +++----
> tests/intel/xe_exec_threads.c      |  4 +---
> tests/intel/xe_waitfence.c         |  8 ++++----
> 9 files changed, 34 insertions(+), 46 deletions(-)
>
>diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>index c33f91ca1..054cd6343 100644
>--- a/lib/xe/xe_query.h
>+++ b/lib/xe/xe_query.h
>@@ -109,6 +109,4 @@ uint16_t xe_gt_get_tile_id(int fd, int gt);
> struct xe_device *xe_device_get(int fd);
> void xe_device_put(int fd);
>=20
>-#define MS_TO_NS(ms) (((int64_t)ms) * 1000000)
>-
> #endif        /* XE_QUERY_H */
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index f0c66c49e..892c8d2cc 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -311,9 +311,8 @@ test_evict_cm(int fd, struct drm_xe_engine_class_insta=
nce *eci,
>                                 xe_vm_bind_async(fd, vm, bind_exec_queues=
[0], __bo,
>                                                  0, addr, bo_size, sync, =
1);
>                         }
>-#define TWENTY_SEC        MS_TO_NS(20000)
>                         xe_wait_ufence(fd, &data[i].vm_sync, USER_FENCE_V=
ALUE,
>-                                       bind_exec_queues[0], TWENTY_SEC);
>+                                       bind_exec_queues[0], 20 * NSEC_PER=
_SEC);
>                 }
>                 sync[0].addr =3D addr + (char *)&data[i].exec_sync -
>                         (char *)data;
>@@ -348,7 +347,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_insta=
nce *eci,
>                 data =3D xe_bo_map(fd, __bo,
>                                  ALIGN(sizeof(*data) * n_execs, 0x1000));
>                 xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>-                               exec_queues[i % n_exec_queues], TWENTY_SEC=
);
>+                               exec_queues[i % n_exec_queues], 20 * NSEC_=
PER_SEC);
>                 igt_assert_eq(data[i].data, 0xc0ffee);
>         }
>         munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
>diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer=
.c
>index 73f69e7b0..5e1bc76ce 100644
>--- a/tests/intel/xe_exec_balancer.c
>+++ b/tests/intel/xe_exec_balancer.c
>@@ -459,8 +459,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, =
int n_execs,
>                 xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data)=
, addr,
>                                          bo_size, sync, 1);
>=20
>-#define ONE_SEC        MS_TO_NS(1000)
>-        xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC=
);
>+        xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PE=
R_SEC);
>         data[0].vm_sync =3D 0;
>=20
>         for (i =3D 0; i < n_execs; i++) {
>@@ -491,7 +490,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, =
int n_execs,
>=20
>                 if (flags & REBIND && i + 1 !=3D n_execs) {
>                         xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE=
_VALUE,
>-                                       exec_queues[e], ONE_SEC);
>+                                       exec_queues[e], NSEC_PER_SEC);
>                         xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, N=
ULL,
>                                            0);
>=20
>@@ -506,7 +505,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, =
int n_execs,
>                                                          addr, bo_size, s=
ync,
>                                                          1);
>                         xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_V=
ALUE,
>-                                       0, ONE_SEC);
>+                                       0, NSEC_PER_SEC);
>                         data[0].vm_sync =3D 0;
>                 }
>=20
>@@ -520,7 +519,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, =
int n_execs,
>                                  */
>                                 xe_wait_ufence(fd, &data[i].exec_sync,
>                                                USER_FENCE_VALUE, exec_que=
ues[e],
>-                                               ONE_SEC);
>+                                               NSEC_PER_SEC);
>                                 igt_assert_eq(data[i].data, 0xc0ffee);
>                         } else if (i * 2 !=3D n_execs) {
>                                 /*
>@@ -551,7 +550,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, =
int n_execs,
>         j =3D flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
>         for (i =3D j; i < n_execs; i++)
>                 xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>-                               exec_queues[i % n_exec_queues], ONE_SEC);
>+                               exec_queues[i % n_exec_queues], NSEC_PER_S=
EC);
>=20
>         /* Wait for all execs to complete */
>         if (flags & INVALIDATE)
>@@ -559,7 +558,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, =
int n_execs,
>=20
>         sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>         xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>-        xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC=
);
>+        xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PE=
R_SEC);
>=20
>         for (i =3D (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
>              i < n_execs; i++)
>diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_comp=
ute_mode.c
>index 82cf061e8..7d434f798 100644
>--- a/tests/intel/xe_exec_compute_mode.c
>+++ b/tests/intel/xe_exec_compute_mode.c
>@@ -190,10 +190,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance=
 *eci,
>                                          to_user_pointer(data), addr,
>                                          bo_size, sync, 1);
>         }
>-#define ONE_SEC        MS_TO_NS(1000)
>-#define HUNDRED_SEC        MS_TO_NS(100000)
>=20
>-        fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC=
;
>+        fence_timeout =3D (igt_run_in_simulation() ? 100 : 1) * NSEC_PER_=
SEC;
>=20
>         xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>                        bind_exec_queues[0], fence_timeout);
>@@ -326,7 +324,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance =
*eci,
>  * Description: Fill the ring and check we get expected errors.
>  * Test category: functionality test
>  */
>-#define ONE_SEC        MS_TO_NS(1000)
> #define VM_DATA                0
> #define SPIN_DATA        1
> #define EXEC_DATA        2
>@@ -378,7 +375,7 @@ static void non_block(int fd, int expect)
>         sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
>         xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
>                                addr, bo_size, sync, 1);
>-        xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, O=
NE_SEC);
>+        xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, N=
SEC_PER_SEC);
>         data[VM_DATA].vm_sync =3D 0;
>=20
>         spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char *=
)data;
>@@ -414,16 +411,16 @@ static void non_block(int fd, int expect)
>         igt_assert_eq(errno, expect);
>=20
>         xe_spin_end(&data[SPIN_DATA].spin);
>-        xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, =
0, ONE_SEC);
>+        xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, =
0, NSEC_PER_SEC);
>         usleep(50000);
>=20
>         exec.num_syncs =3D 1;
>         xe_exec(fd, &exec);
>-        xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, =
0, ONE_SEC);
>+        xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, =
0, NSEC_PER_SEC);
>=20
>         sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
>         xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>-        xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, O=
NE_SEC);
>+        xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, N=
SEC_PER_SEC);
>         munmap(data, bo_size);
>         gem_close(fd, bo);
>=20
>@@ -473,7 +470,7 @@ static void lr_mode_workload(int fd)
>=20
>         sync.addr =3D to_user_pointer(&vm_sync);
>         xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, spin_addr=
, bo_size, &sync, 1);
>-        xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
>+        xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>=20
>         xe_spin_init_opts(spin, .addr =3D spin_addr, .write_timestamp =3D=
 true);
>         sync.addr =3D spin_addr + (char *)&spin->exec_sync - (char *)spin=
;
>@@ -490,7 +487,7 @@ static void lr_mode_workload(int fd)
>         igt_assert_neq_u32(ts_1, ts_2);
>=20
>         xe_spin_end(spin);
>-        xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, ONE_SEC=
);
>+        xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, NSEC_PE=
R_SEC);
>=20
>         /* Check timestamps to make sure spinner is stopped */
>         ts_1 =3D spin->timestamp;
>@@ -500,7 +497,7 @@ static void lr_mode_workload(int fd)
>=20
>         sync.addr =3D to_user_pointer(&vm_sync);
>         xe_vm_unbind_async(fd, vm, 0, 0, spin_addr, bo_size, &sync, 1);
>-        xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
>+        xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>         munmap(spin, bo_size);
>         gem_close(fd, bo);
>=20
>diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_=
mode.c
>index 56bad2b75..87375ed17 100644
>--- a/tests/intel/xe_exec_fault_mode.c
>+++ b/tests/intel/xe_exec_fault_mode.c
>@@ -207,9 +207,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance =
*eci,
>                                                  bo_size, sync, 1);
>         }
>=20
>-#define ONE_SEC        MS_TO_NS(1000)
>         xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>-                       bind_exec_queues[0], ONE_SEC);
>+                       bind_exec_queues[0], NSEC_PER_SEC);
>         data[0].vm_sync =3D 0;
>=20
>         if (flags & PREFETCH) {
>@@ -217,7 +216,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance =
*eci,
>                 xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr=
,
>                                      bo_size, sync, 1, 0);
>                 xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>-                               bind_exec_queues[0], ONE_SEC);
>+                               bind_exec_queues[0], NSEC_PER_SEC);
>                 data[0].vm_sync =3D 0;
>         }
>=20
>@@ -247,7 +246,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance =
*eci,
>=20
>                 if (flags & REBIND && i + 1 !=3D n_execs) {
>                         xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE=
_VALUE,
>-                                       exec_queues[e], ONE_SEC);
>+                                       exec_queues[e], NSEC_PER_SEC);
>                         xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0=
,
>                                            addr, bo_size, NULL, 0);
>=20
>@@ -263,7 +262,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance =
*eci,
>                                                          addr, bo_size, s=
ync,
>                                                          1);
>                         xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_V=
ALUE,
>-                                       bind_exec_queues[e], ONE_SEC);
>+                                       bind_exec_queues[e], NSEC_PER_SEC)=
;
>                         data[0].vm_sync =3D 0;
>                 }
>=20
>@@ -277,7 +276,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance =
*eci,
>                                  */
>                                 xe_wait_ufence(fd, &data[i].exec_sync,
>                                                USER_FENCE_VALUE, exec_que=
ues[e],
>-                                               ONE_SEC);
>+                                               NSEC_PER_SEC);
>                                 igt_assert_eq(data[i].data, 0xc0ffee);
>                         } else if (i * 2 !=3D n_execs) {
>                                 /*
>@@ -308,7 +307,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance =
*eci,
>                 j =3D flags & INVALIDATE ? n_execs - 1 : 0;
>=20
>                 for (i =3D j; i < n_execs; i++) {
>-                        int64_t timeout =3D ONE_SEC;
>+                        int64_t timeout =3D NSEC_PER_SEC;
>=20
>                         if (flags & INVALID_VA && !(flags & ENABLE_SCRATC=
H))
>                                 igt_assert_eq(__xe_wait_ufence(fd, &data[=
i].exec_sync, USER_FENCE_VALUE,
>@@ -322,7 +321,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance =
*eci,
>         xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
>                            sync, 1);
>         xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>-                       bind_exec_queues[0], ONE_SEC);
>+                       bind_exec_queues[0], NSEC_PER_SEC);
>=20
>         if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>                 for (i =3D j; i < n_execs; i++)
>diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_mod=
es.c
>index f7bb96255..eeae9d122 100644
>--- a/tests/intel/xe_exec_mix_modes.c
>+++ b/tests/intel/xe_exec_mix_modes.c
>@@ -29,7 +29,6 @@
>=20
> #define NUM_INTERRUPTING_JOBS        5
> #define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
>-#define ONE_SEC                        MS_TO_NS(1000)
> #define VM_DATA                        0
> #define SPIN_DATA                1
> #define EXEC_DATA                2
>@@ -121,7 +120,7 @@ run_job(int fd, struct drm_xe_engine_class_instance *h=
we,
>=20
>         store_dword_batch(data, addr, value);
>         if (engine_execution_mode =3D=3D EXEC_MODE_LR) {
>-                xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VAL=
UE, 0, ONE_SEC);
>+                xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VAL=
UE, 0, NSEC_PER_SEC);
>                 sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_syn=
c - (char *)data;
>         } else if (engine_execution_mode =3D=3D EXEC_MODE_DMA_FENCE) {
>                 igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX=
, 0, NULL));
>@@ -178,9 +177,9 @@ run_job(int fd, struct drm_xe_engine_class_instance *h=
we,
>=20
>         if (engine_execution_mode =3D=3D EXEC_MODE_LR) {
>                 if (job_type =3D=3D SPINNER_INTERRUPTED)
>-                        xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, US=
ER_FENCE_VALUE, 0, ONE_SEC);
>+                        xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, US=
ER_FENCE_VALUE, 0, NSEC_PER_SEC);
>                 else if (job_type =3D=3D SIMPLE_BATCH_STORE)
>-                        xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, US=
ER_FENCE_VALUE, 0, ONE_SEC);
>+                        xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, US=
ER_FENCE_VALUE, 0, NSEC_PER_SEC);
>         } else if (engine_execution_mode =3D=3D EXEC_MODE_DMA_FENCE) {
>                 igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX=
, 0, NULL));
>                 syncobj_destroy(fd, sync[0].handle);
>diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>index 61c35ce69..801a53efc 100644
>--- a/tests/intel/xe_exec_reset.c
>+++ b/tests/intel/xe_exec_reset.c
>@@ -509,8 +509,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_i=
nstance *eci,
>         sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>         xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>=20
>-#define THREE_SEC        MS_TO_NS(3000)
>-        xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_S=
EC);
>+        xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSE=
C_PER_SEC);
>         data[0].vm_sync =3D 0;
>=20
>         for (i =3D 0; i < n_execs; i++) {
>@@ -563,7 +562,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_i=
nstance *eci,
>         }
>=20
>         for (i =3D 1; i < n_execs; i++) {
>-                int64_t timeout =3D THREE_SEC;
>+                int64_t timeout =3D 3 * NSEC_PER_SEC;
>                 int err;
>=20
>                 err =3D __xe_wait_ufence(fd, &data[i].exec_sync, USER_FEN=
CE_VALUE,
>@@ -577,7 +576,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_i=
nstance *eci,
>=20
>         sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>         xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>-        xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_S=
EC);
>+        xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSE=
C_PER_SEC);
>=20
>         if (!(flags & GT_RESET)) {
>                 for (i =3D 1; i < n_execs; i++)
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 6e53d3cf8..3874e9865 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -318,10 +318,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr,=
 uint64_t userptr,
>         else
>                 xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data)=
, addr,
>                                          bo_size, sync, 1);
>-#define THREE_SEC        MS_TO_NS(3000)
>-#define THIRTY_SEC        MS_TO_NS(30000)
>=20
>-        fence_timeout =3D igt_run_in_simulation() ? THIRTY_SEC : THREE_SE=
C;
>+        fence_timeout =3D (igt_run_in_simulation() ? 30 : 3) * NSEC_PER_S=
EC;
>=20
>         xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_t=
imeout);
>         data[0].vm_sync =3D 0;
>diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
>index cf4e73368..c1cab64f4 100644
>--- a/tests/intel/xe_waitfence.c
>+++ b/tests/intel/xe_waitfence.c
>@@ -110,14 +110,14 @@ waitfence(int fd, enum waittype wt)
>         do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
>=20
>         if (wt =3D=3D RELTIME) {
>-                timeout =3D xe_wait_ufence(fd, &wait_fence, 7, 0, MS_TO_N=
S(10));
>+                timeout =3D xe_wait_ufence(fd, &wait_fence, 7, 0, 10 * NS=
EC_PER_MSEC);
>                 igt_debug("wait type: RELTIME - timeout: %ld, timeout lef=
t: %ld\n",
>-                          MS_TO_NS(10), timeout);
>+                          (int64_t)10 * NSEC_PER_MSEC, timeout);
>         } else if (wt =3D=3D ENGINE) {
>                 exec_queue =3D xe_exec_queue_create_class(fd, vm, DRM_XE_=
ENGINE_CLASS_COPY);
>                 clock_gettime(CLOCK_MONOTONIC, &ts);
>                 current =3D ts.tv_sec * 1e9 + ts.tv_nsec;
>-                timeout =3D current + MS_TO_NS(10);
>+                timeout =3D current + 10 * NSEC_PER_MSEC;
>                 signalled =3D wait_ufence_abstime(fd, &wait_fence, 7,
>                                                   exec_queue, timeout,
>                                                   DRM_XE_UFENCE_WAIT_FLAG=
_ABSTIME);
>@@ -128,7 +128,7 @@ waitfence(int fd, enum waittype wt)
>         } else {
>                 clock_gettime(CLOCK_MONOTONIC, &ts);
>                 current =3D ts.tv_sec * 1e9 + ts.tv_nsec;
>-                timeout =3D current + MS_TO_NS(10);
>+                timeout =3D current + 10 * NSEC_PER_MSEC;
>                 signalled =3D wait_ufence_abstime(fd, &wait_fence, 7, 0,
>                                                    timeout, 0);
>                 igt_debug("wait type: ABSTIME - timeout: %" PRId64
>--=20
>2.43.0
>
