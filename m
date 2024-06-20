Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F6AC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C78010E870;
	Thu, 20 Jun 2024 23:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpSC05lN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D818810E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718926896; x=1750462896;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Mo6U1Fky/eOh31dHK2QxbcFXNArmdQ9PFIIq6XCG2CA=;
 b=QpSC05lNFlZjZLNAamEWu6YvkbxJwp0jXZE7jaJrKWfaW8gfw00Fh2lu
 V4q6QkAdopODLmMileGSsFDty8V6Sw6oOrhMjtwJ/GIdQsBvkahVpIbLu
 Uq3X+vSUMBoX/n7M570nGiIHrJF5u9//lJzUdwS5pNrCrOJLSN7Xi8I9m
 cygl1ai8RGtszQgJoHGtwKC9td+1Qy7jtORis0mdOpfLFxaFWC+CFzHlQ
 PZduU1LCClfiIRuSJ9SeSnpZJz4pOIZKjDEUmyVFDOzupUBx3syC2s7Cc
 OHYvlD7OSb7I/OVacRpQyk429kk30dJNJwX6+FxC02MuHmBuqNps4AJri A==;
X-CSE-ConnectionGUID: Wm6EirS6RfaDVX64bMEX4g==
X-CSE-MsgGUID: sLGFbjmWRpuJ32hMkECWGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16056337"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="16056337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:41:36 -0700
X-CSE-ConnectionGUID: 2n0icpZfStGbCFTt3atv+w==
X-CSE-MsgGUID: pwCeZ9mfQbCq4Tsj2a9WyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="43083935"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:41:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:41:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:41:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:41:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3P2K9tSeRezjiHWiOvfPNL6iW0C3j33jZABoykP2Ucj10tK8rn71x+8hhWEMDsFy9ZRTjoyjHWzMt5xOps2OG2BvnMw6JPLMjM3Z7Ydp4Y1yMJSjo6RdsWpvorlxSv4HHGpmnGwfwFfk9dXmObDMEqGLTKCsPeLmVJafutaXn1XewXf1IU5bhx2vB2UDHgiww7TR9q8wS+HNLgkY8hEE469W7Qqn2oFpLpBUWaYdhcvfDr/R6Hj67iGA95yr2D95VCbeyYqncY+6QH4nplkFqWygN6pJh1KGJuspdRwVMepeAGcJgSqRfLmeBbuKuEEYcH+3w6hV9vghB37tyNfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HiNe75VU8sActCJXEbCWeT6vgrhc/SX8dv6YntPiC0=;
 b=XDd2i07aGpiVanxUkrVBFMhBizslCorJ3n+mdFLLPSlGxZlJ1YDRWHvFuNQbHjENdM/ad4Vx/fAxtLSzhNLl57rrXyIcrgfSWUGhzNdOQqL9KG9ya5fJ5GaLykQy/+0u16aEO4gUaJR4y8JVWcnslqEAMr1mwhjYpmo5Km+pUVtJgVN40yedX/9NbNqOvebf4Hdr1HP+V8W+AK2uAt/GLgDPSu1Sej/BsWhTrhwGJ9l6L1hF0BxJKKMGK9P7/r2XiQhi64+U3ufyew9J2vPHVQiSjd/rjq9phVqhm4nGUgJSzBp94zWC7FoxprY14s5T3kvdSmbLSzzDP+v090tVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:41:27 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:41:27 +0000
Date: Thu, 20 Jun 2024 16:41:25 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 23/28] tools/xe-perf: xe_perf_reader,
 xe_perf_control and xe_perf_configs
Message-ID: <ZnS+JZ3SnQACfRfe@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-24-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620200054.3550653-24-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0239.namprd04.prod.outlook.com
 (2603:10b6:303:87::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e6816a-756d-4264-db92-08dc918280c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0lwRkIrcTkzR3cwZW9RZlJYSzFLMTMrU3RIdm5EZ2FiL3gvaWlJKzA1Q1ZZ?=
 =?utf-8?B?eTRIdi9qK0NvRGI3SjlNMitGNjRJZFlXNy8vSmlvTnc4aFFZb1NxdSthR0Za?=
 =?utf-8?B?SXM3Qm1UTEZvWXlXbVhDejJLVVN1d3YzOS8xTW9GNHdBaHkwd1ZaaXNlM2JB?=
 =?utf-8?B?QVVOZVJpeTJyVldFM3hxNXhCNnFuVGJUNVJkRE5vYmZWY0gxaWtEU2ptYnhy?=
 =?utf-8?B?LzUwTnRZZHFvUW05R0Qzd001OE1hajhSbTBZTG9qYzVVb1VMSmk3RllEdUxk?=
 =?utf-8?B?TjBnS29yak1qYmR0QTB2eDl5dlc2aWFjajF1RjFIdGJLeTNrTFlNblVRakha?=
 =?utf-8?B?S2tudFBoRWtWdURNRXNNUzJLRVc0bHZFNGhYdmVRUVZhSk5EYUhNSzArU2I4?=
 =?utf-8?B?WmtJT1I2c3VqMkhRSGtzeFJmZEtZVi9WTVBvbzBkajA5SjRsSnFZbjFvblZu?=
 =?utf-8?B?bW4vRThDNEFXSE9VdnV1VVZVZ0xkOER1VzNZcVVqMjFaRTdVTW5JL3NFbVQ1?=
 =?utf-8?B?VUZzVG4wNWdqMkgwQU5qYytEbjNrYUFpejBpZjhnbUd0VDQ4b1ZndlFSWjdh?=
 =?utf-8?B?RE91N04yZlZYcDZjRDRBK1FiKytvc3RPRnp6QkhNeWprQytyQTBiOVJlVEhw?=
 =?utf-8?B?WFE4QTNISFh5QmN2MlZyaTJyTmlQY3BacXM0c2VEZ3FsWHZaMThoU2pWZjVN?=
 =?utf-8?B?QVlxczdPOEdnS2dEdFV6Uk1xUmV6bzlVbmpwbnAvbHpPWXZsNzdJYVhLekpp?=
 =?utf-8?B?cDZFbUlWdE80T2tHdW1TNzk1NHFJNVFUblh5NFBUaE51QktQMjkvdndKOFU1?=
 =?utf-8?B?UVk0N29NYitJNGJvREFlYlNnbytJOUd0L280blBSSHhSWWZsR2dIUGZZL1ow?=
 =?utf-8?B?RDYvTDFZdTZ6d1lkWmJzSWxaNEMwb0QxYTNpK0JOTUxZelRhNVgzWGFKWUhl?=
 =?utf-8?B?QUlzaG54YSs3eGJwZk1MU2ZrZ2xuamNDL2lZNkwvbzVvZnRITGh4cWlJZ0RI?=
 =?utf-8?B?TUFBSk5PSDBxVWt0K0tRQmdWMzFjbC9adFhZOEs2aU9iai9YYVdiWFZhQVg5?=
 =?utf-8?B?N05DZ1VUek1aa2NGd3BBN2NCUkFIUHIxV3Q0bmM0T2RPeG02WDROUFhBVVl5?=
 =?utf-8?B?YjJ5aDJJdytZRE9EWCtlL21lNXZvdDlPb3UwUlJxaEZ2eTM1Qmd0blA3dkt0?=
 =?utf-8?B?dHlMTTdQcnZKU2ZXNFEzbFdYaFpKRXpIVFkxamRXZFNiczZTbVJTSzFuUlVw?=
 =?utf-8?B?QnIzZ2t5L1FWZEZ1Rmp0UXdGeUFUQ2dXYmFEVkUzYmlLcFI5Q2FzeTA5NWVC?=
 =?utf-8?B?eTZKN3liUDg3cHhVUkpCM05yMk9oclB6d0ZJdmpXL3lqaVU2RGRMdjJSVy9p?=
 =?utf-8?B?MzlWamtZNFJIM3pqQ3NjSEczMEloRzNmb3oyY3Z3Wmxpb2JPQzJEMXYwZ0JM?=
 =?utf-8?B?dm1wcHhXa3hFRng3U2k3SVNLWlR3Z1c0Q1IzVjJ0VVRhOHB6SXREV3VxZnhI?=
 =?utf-8?B?NG80c2VVTitlMVVkUlIwVVM4Z09vWVhBeE5kOFpCL0NiRnJ3YjlvKzJQSlFI?=
 =?utf-8?B?ZE1kczdsUUh2bkUwcFlXNHRtR1I5YXdxbVh2N3dJTUwzQ0htUnV5WjVHNTRL?=
 =?utf-8?B?VmY3MVRTZ3FhM2JrdTR1OGhhaEJSaVhXOGNlcDJBdk1OTU9ORTlVNDhINy81?=
 =?utf-8?B?dCtlanhERjMzZlB5NzBDaG5KWVhpa1FodWZURXB3VC9oRWRsQjJaVmJjdCtD?=
 =?utf-8?Q?UfrcQmeGvq75/5cjeQ7TC5wWZeUjCf0ZzBGypD1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXU0bzBwM01Db3VublhBdzNCNCtmSm9YZVN5dFpSWTVMV3ZvUzJhR2l3cktY?=
 =?utf-8?B?U3pvRm5YSDYxK2RldFArM0Y1QXYvUkNlOGpDNHFYOE9PNDdJK3p4Ylo5czlI?=
 =?utf-8?B?TVUyYTNEK1U4NXpYb0RQajA4TEdRRU5GSzZnTlRhN0JlSVMwOGZ1ejRvV2pL?=
 =?utf-8?B?N2M4Rk54K0x1VFZtMVhuRCtiOVlEQnNjTEtWa1VZbWtqWlNWU0RyaWRzd1Vm?=
 =?utf-8?B?akE3YUUvaVNwS3RucHk1NjZpRUtCbmoyWFJOcUZxTFpTUXh0TVZjQU95Z3BG?=
 =?utf-8?B?RWVHS1R3YkFqVlFTdkc3TjhYa0ZJQjIxaEhyNjVZY2I5bXhOSHlZeVRlMEsy?=
 =?utf-8?B?UmRzdkFzd0MwT1NONFRmV1Z6V0lLaGFZaFdsSnpBdmc3V3hXMmpMOTAwVjE3?=
 =?utf-8?B?RXA5R1pmTDN3WVlYS0lSdUZ6aENlOFB1eHIvcmZweERtWmpENUhZUVBHUXRq?=
 =?utf-8?B?U0xPK3NNT2xsMGZSa0pVVXlsTGU0RWtNMS9KbldLSFZ1SjA3M0E2OTF5YzBY?=
 =?utf-8?B?RVYxaWFWWHdyZTRUSjV4amRMWUViZk0yMkJSUUl1ZnBzYStzOXd5U3Z1K2R0?=
 =?utf-8?B?K1M2Q2NmbTZZVUlmT2tCeFJwOVVTclEzZGpsTmFTaHBDbEhmTWZYSXdWT1NU?=
 =?utf-8?B?SkNyZXFpUU1ZcU5PTjF3cjVWSXNoaWIwWERyWUNDUDhLbUVLRWlMT1FXVFR1?=
 =?utf-8?B?RHlOTkJMOGh2VkV2SVpDZFVvWkVybC9BczFPNExDVjR5cmV6TzhKMVllUTZN?=
 =?utf-8?B?ZE9VeUR1L0M1U2pKcmVvMUh0YW9najZON2hwK2pEQlpOMVRXVW1YUjhVK2Ra?=
 =?utf-8?B?ZlRPTUl6V25SeHpadzNiS1ZDOEh6d0lTRHpCdG1WL2VRM1RMTDRZVGx0REZ3?=
 =?utf-8?B?dE1oa2Y0eDhZUG14K21GcDlZZHhIbU05TDZ4ZXlmZlBURTlLU0lXVllVeGl4?=
 =?utf-8?B?VVhuekRGWDFoSmN6NFFPMko3dHp3QTNBVjBFZzhSNnZaUkl6Uy9zTi9tZkx6?=
 =?utf-8?B?eWNGNk5nbFErK3FrSDlaR2lWZ09RRStJL3N4MmZaV3RhZnRSdDhBVEdnZVAr?=
 =?utf-8?B?dHNYYk00dmJiWjFOSjJyUXhnNEgvdkF2Z0NlTEpIeFZBVVpzcW5VbVJxV3gx?=
 =?utf-8?B?OWN1ZDNucnB2OUw0Vlp6S29MVUdYMmhLMTJhUFNjUGFpNGVVWVFPek5nR3Ja?=
 =?utf-8?B?RDRiajFxQmZxRFordjk4cXdFR3ZsMVlVOVdiMGxSV3pudUQ1S1NGbEFOdkhr?=
 =?utf-8?B?Wms3bU9oOS90Mm4vZXNqUm5RakV4eHZzWldDeXpPdEgwWW9YSENIR2hXWW80?=
 =?utf-8?B?REVNOGMwK0lPSTlyMTlyL3RXSGI0NzZGbEdSREk4NU01WTFWVGJKY01CUVJF?=
 =?utf-8?B?S3VjS2VGR1JMdFhIdGtEelVSTUZ1em9LRUVZMEJUbTdweEhGN0tpWHlVaitz?=
 =?utf-8?B?dVl6TExOYS9tOW5mMG5DK3ZPZjVjdy9ibTBGTmFPcjhERVo5UGVwNWFIdGhE?=
 =?utf-8?B?NzQxNjNXaEtiSUxuQnNuTzVQWHVaTGcwUFFJNHdGcmczMUx5MHpMbEtqamFF?=
 =?utf-8?B?cGlaMVlHOXJWcXR6WFRrRUNKdFVWbTM2T2V5RlpMN1FmRlJqMTNySHkyWWJN?=
 =?utf-8?B?VXN0cjAyeDJLVFM2cS9iY25HQWVQK2FtL25XTGp2NURXT2dNMUFweERaYjFr?=
 =?utf-8?B?WlZYem1rdGc3Y2F1ditucStxSEFFcWJpdmlpWExPZlYzNS9KcFJtYnorUmFR?=
 =?utf-8?B?NFh2S0xYWCttZnQ3aGRLY2YreGVZMnJwTXU0cHptaWdZaVJudEh3Y2NzR0Z0?=
 =?utf-8?B?QVhQSklSRjBRd1dLTWNHVzd6RWFOeER0c0MzZUpuSURTRXExL2pjYnZQbkdL?=
 =?utf-8?B?a3hRQ0JnZUJzbXhzNXZjM2wwWXRZMHBsN0xlcm9nVmtQaGVvOUkrSldCN0VD?=
 =?utf-8?B?YXFzZThoUVlPOXBYK3BEVDUrRmxkVWp1bUtMTnRWaTlJeUptM0dUN051REU0?=
 =?utf-8?B?T3R2VEZvRERzeTlwaENLdEJYY2MwbndhYUxiKzNJSFcxQjlRdDFsaEZvVzIy?=
 =?utf-8?B?bk16aGtuWC9kM3l0OU03dVNlWlNtME5HVDNaM2tCRGIyUEJQTnR6ZGdFY3NE?=
 =?utf-8?B?NFk0M0ZKSGF0a2tSNEFISDB1T2RDUDN3R2ZnSlgwYlFIcXI2Njlya1doVlB3?=
 =?utf-8?Q?ekAPoLK64yrGNOtXnGXtofk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e6816a-756d-4264-db92-08dc918280c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:41:27.2996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4bjOeg+LqbfjeKLqi3+maisswSB5/a7dv15T5MwiwEymUaleySp8PYEaPwpNft+ZgCxbbQ6mlXmIK1klh1u5yKzgypLwEo/UU7T/EePszc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

On Thu, Jun 20, 2024 at 01:00:48PM -0700, Ashutosh Dixit wrote:
>Add xe_perf_reader, xe_perf_control and xe_perf_configs tools, similar to
>their i915 counterparts.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tools/xe-perf/meson.build       |  17 ++
> tools/xe-perf/xe_perf_configs.c | 247 ++++++++++++++++++++++++
> tools/xe-perf/xe_perf_control.c | 117 ++++++++++++
> tools/xe-perf/xe_perf_reader.c  | 325 ++++++++++++++++++++++++++++++++
> 4 files changed, 706 insertions(+)
> create mode 100644 tools/xe-perf/xe_perf_configs.c
> create mode 100644 tools/xe-perf/xe_perf_control.c
> create mode 100644 tools/xe-perf/xe_perf_reader.c
>
>diff --git a/tools/xe-perf/meson.build b/tools/xe-perf/meson.build
>index a5f59a67fe..8506aa320f 100644
>--- a/tools/xe-perf/meson.build
>+++ b/tools/xe-perf/meson.build
>@@ -1,5 +1,22 @@
>+executable('xe-perf-configs',
>+           [ 'xe_perf_configs.c' ],
>+           include_directories: inc,
>+           dependencies: [lib_igt_chipset, lib_igt_xe_oa],
>+           install: true)
>+
> executable('xe-perf-recorder',
>            [ 'xe_perf_recorder.c' ],
>            include_directories: inc,
>            dependencies: [lib_igt, lib_igt_xe_oa],
>            install: true)
>+
>+executable('xe-perf-control',
>+           [ 'xe_perf_control.c' ],
>+           include_directories: inc,
>+           install: true)
>+
>+executable('xe-perf-reader',
>+           [ 'xe_perf_reader.c' ],
>+           include_directories: inc,
>+           dependencies: [lib_igt, lib_igt_xe_oa],
>+           install: true)
>diff --git a/tools/xe-perf/xe_perf_configs.c b/tools/xe-perf/xe_perf_configs.c
>new file mode 100644
>index 0000000000..af33c0078c
>--- /dev/null
>+++ b/tools/xe-perf/xe_perf_configs.c
>@@ -0,0 +1,247 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+
>+#include <assert.h>
>+#include <dirent.h>
>+#include <errno.h>
>+#include <fcntl.h>
>+#include <getopt.h>
>+#include <inttypes.h>
>+#include <stdbool.h>
>+#include <stdint.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+#include <sys/ioctl.h>
>+#include <sys/sysmacros.h>
>+#include <sys/types.h>
>+#include <sys/stat.h>
>+#include <unistd.h>
>+
>+#include "intel_chipset.h"
>+#include "xe/xe_oa.h"
>+
>+static bool
>+read_file_uint64(const char *file, uint64_t *value)
>+{
>+	char buf[32];
>+	int fd, n;
>+
>+	fd = open(file, 0);
>+	if (fd < 0)
>+		return false;
>+	n = read(fd, buf, sizeof (buf) - 1);
>+	close(fd);
>+	if (n < 0)
>+		return false;
>+
>+	buf[n] = '\0';
>+	*value = strtoull(buf, 0, 0);
>+
>+	return true;
>+}
>+
>+static uint32_t
>+read_device_param(const char *stem, int id, const char *param)
>+{
>+	char *name;
>+	int ret = asprintf(&name, "/sys/class/drm/%s%u/device/%s", stem, id, param);
>+	uint64_t value;
>+	bool success;
>+
>+	assert(ret != -1);
>+
>+	success = read_file_uint64(name, &value);
>+	free(name);
>+
>+	return success ? value : 0;
>+}
>+
>+static int
>+find_intel_render_node(void)
>+{
>+	for (int i = 128; i < (128 + 16); i++) {
>+		if (read_device_param("renderD", i, "vendor") == 0x8086)
>+			return i;
>+	}
>+
>+	return -1;
>+}
>+
>+static int
>+open_render_node(uint32_t *devid)
>+{
>+	char *name;
>+	int ret;
>+	int fd;
>+
>+	int render = find_intel_render_node();
>+	if (render < 0)
>+		return -1;
>+
>+	ret = asprintf(&name, "/dev/dri/renderD%u", render);
>+	assert(ret != -1);
>+
>+	*devid = read_device_param("renderD", render, "device");
>+
>+	fd = open(name, O_RDWR);
>+	free(name);
>+
>+	return fd;
>+}
>+
>+static int
>+get_card_for_fd(int fd)
>+{
>+	struct stat sb;
>+	int mjr, mnr;
>+	char buffer[128];
>+	DIR *drm_dir;
>+	struct dirent *entry;
>+	int retval = -1;
>+
>+	if (fstat(fd, &sb)) {
>+		fprintf(stderr, "Failed to stat DRM fd\n");
>+		return -1;
>+	}
>+
>+	mjr = major(sb.st_rdev);
>+	mnr = minor(sb.st_rdev);
>+
>+	snprintf(buffer, sizeof(buffer), "/sys/dev/char/%d:%d/device/drm", mjr, mnr);
>+
>+	drm_dir = opendir(buffer);
>+	assert(drm_dir != NULL);
>+
>+	while ((entry = readdir(drm_dir))) {
>+		if (entry->d_type == DT_DIR && strncmp(entry->d_name, "card", 4) == 0) {
>+			retval = strtoull(entry->d_name + 4, NULL, 10);
>+			break;
>+		}
>+	}
>+
>+	closedir(drm_dir);
>+
>+	return retval;
>+}
>+
>+static const char *
>+metric_name(struct intel_xe_perf *perf, const char *hw_config_guid)
>+{
>+	struct intel_xe_perf_metric_set *metric_set;
>+
>+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
>+		if (!strcmp(metric_set->hw_config_guid, hw_config_guid))
>+			return metric_set->symbol_name;
>+	}
>+
>+	return "Unknown";
>+}
>+
>+static void
>+usage(void)
>+{
>+	printf("Usage: xe-perf-configs [options]\n"
>+	       "Manages xe-perf configurations stored in xe.\n"
>+	       "     --purge, -p         Purge configurations from the kernel\n"
>+	       "     --list,  -l         List configurations from the kernel\n");
>+}
>+
>+int
>+main(int argc, char *argv[])
>+{
>+	char metrics_path[128];
>+	DIR *metrics_dir;
>+	struct dirent *entry;
>+	int drm_fd, drm_card;
>+	int opt;
>+	bool purge = false;
>+	const struct option long_options[] = {
>+		{"help",   no_argument, 0, 'h'},
>+		{"list",   no_argument, 0, 'l'},
>+		{"purge",  no_argument, 0, 'p'},
>+		{0, 0, 0, 0}
>+	};
>+	const struct intel_device_info *devinfo;
>+	struct intel_xe_perf *perf;
>+	uint32_t devid = 0;
>+
>+	while ((opt = getopt_long(argc, argv, "hlp", long_options, NULL)) != -1) {
>+		switch (opt) {
>+		case 'h':
>+			usage();
>+			return EXIT_SUCCESS;
>+		case 'l':
>+			break;
>+		case 'p':
>+			purge = true;
>+			break;
>+		default:
>+			fprintf(stderr, "Internal error: "
>+				"unexpected getopt value: %d\n", opt);
>+			usage();
>+			return EXIT_FAILURE;
>+		}
>+	}
>+
>+	drm_fd = open_render_node(&devid);
>+	drm_card = get_card_for_fd(drm_fd);
>+
>+	fprintf(stdout, "Found device id=0x%x\n", devid);
>+
>+	devinfo = intel_get_device_info(drm_fd);
>+	if (!devinfo) {
>+		fprintf(stderr, "No device info found.\n");
>+		return EXIT_FAILURE;
>+	}
>+
>+	fprintf(stdout, "Device graphics_ver=%i gt=%i\n", devinfo->graphics_ver, devinfo->gt);
>+
>+	perf = intel_xe_perf_for_fd(drm_fd, 0);
>+	if (!perf) {
>+		fprintf(stderr, "No perf data found.\n");
>+		return EXIT_FAILURE;
>+	}
>+
>+	snprintf(metrics_path, sizeof(metrics_path),
>+		 "/sys/class/drm/card%d/metrics", drm_card);
>+	metrics_dir = opendir(metrics_path);
>+	if (!metrics_dir)
>+		return EXIT_FAILURE;
>+
>+	fprintf(stdout, "Looking at metrics in %s\n", metrics_path);
>+
>+	while ((entry = readdir(metrics_dir))) {
>+		char metric_id_path[400];
>+		uint64_t metric_id;
>+
>+		if (entry->d_type != DT_DIR)
>+			continue;
>+
>+		snprintf(metric_id_path, sizeof(metric_id_path),
>+			 "%s/%s/id", metrics_path, entry->d_name);
>+
>+		if (!read_file_uint64(metric_id_path, &metric_id))
>+			continue;
>+
>+		if (purge) {
>+			if (intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &metric_id) == 0)
>+				fprintf(stdout, "\tRemoved config %s id=%03" PRIu64 " name=%s\n",
>+					entry->d_name, metric_id, metric_name(perf, entry->d_name));
>+			else
>+				fprintf(stdout, "\tFailed to remove config %s id=%03" PRIu64 " name=%s\n",
>+					entry->d_name, metric_id, metric_name(perf, entry->d_name));
>+		} else {
>+			fprintf(stdout, "\tConfig %s id=%03" PRIu64 " name=%s\n",
>+				entry->d_name, metric_id, metric_name(perf, entry->d_name));
>+		}
>+	}
>+
>+	closedir(metrics_dir);
>+	close(drm_fd);
>+
>+	return EXIT_SUCCESS;
>+}
>diff --git a/tools/xe-perf/xe_perf_control.c b/tools/xe-perf/xe_perf_control.c
>new file mode 100644
>index 0000000000..da96232bc8
>--- /dev/null
>+++ b/tools/xe-perf/xe_perf_control.c
>@@ -0,0 +1,117 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+
>+#include <getopt.h>
>+#include <stdbool.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+#include <unistd.h>
>+
>+#include "xe_perf_recorder_commands.h"
>+
>+static void
>+usage(const char *name)
>+{
>+	fprintf(stdout,
>+		"Usage: %s [options]\n"
>+		"\n"
>+		"     --help,               -h         Print this screen\n"
>+		"     --command-fifo,       -f <path>  Path to a command fifo\n"
>+		"     --dump,               -d <path>  Write a content of circular buffer to path\n",
>+		name);
>+}
>+
>+int
>+main(int argc, char *argv[])
>+{
>+	const struct option long_options[] = {
>+		{"help",                       no_argument, 0, 'h'},
>+		{"dump",                 required_argument, 0, 'd'},
>+		{"command-fifo",         required_argument, 0, 'f'},
>+		{"quit",                       no_argument, 0, 'q'},
>+		{0, 0, 0, 0}
>+	};
>+	const char *command_fifo = XE_PERF_RECORD_FIFO_PATH, *dump_file = NULL;
>+	FILE *command_fifo_file;
>+	int opt;
>+	bool quit = false;
>+
>+	while ((opt = getopt_long(argc, argv, "hd:f:q", long_options, NULL)) != -1) {
>+		switch (opt) {
>+		case 'h':
>+			usage(argv[0]);
>+			return EXIT_SUCCESS;
>+		case 'd':
>+			dump_file = optarg;
>+			break;
>+		case 'f':
>+			command_fifo = optarg;
>+			break;
>+		case 'q':
>+			quit = true;
>+			break;
>+		default:
>+			fprintf(stderr, "Internal error: "
>+				"unexpected getopt value: %d\n", opt);
>+			usage(argv[0]);
>+			return EXIT_FAILURE;
>+		}
>+	}
>+
>+	if (!command_fifo)
>+		return EXIT_FAILURE;
>+
>+	command_fifo_file = fopen(command_fifo, "r+");
>+	if (!command_fifo_file) {
>+		fprintf(stderr, "Unable to open command file\n");
>+		return EXIT_FAILURE;
>+	}
>+
>+	if (dump_file) {
>+		if (dump_file[0] == '/') {
>+			uint32_t total_len =
>+				sizeof(struct recorder_command_base) + strlen(dump_file) + 1;
>+			struct {
>+				struct recorder_command_base base;
>+				uint8_t dump[];
>+			} *data = malloc(total_len);
>+
>+			data->base.command = RECORDER_COMMAND_DUMP;
>+			data->base.size = total_len;
>+			snprintf((char *) data->dump, strlen(dump_file) + 1, "%s", dump_file);
>+
>+			fwrite(data, total_len, 1, command_fifo_file);
>+		} else {
>+			char *cwd = getcwd(NULL, 0);
>+			uint32_t path_len = strlen(cwd) + 1 + strlen(dump_file) + 1;
>+			uint32_t total_len = sizeof(struct recorder_command_base) + path_len;
>+			struct {
>+				struct recorder_command_base base;
>+				uint8_t dump[];
>+			} *data = malloc(total_len);
>+
>+			data->base.command = RECORDER_COMMAND_DUMP;
>+			data->base.size = total_len;
>+			snprintf((char *) data->dump, path_len, "%s/%s", cwd, dump_file);
>+
>+			fwrite(data, total_len, 1, command_fifo_file);
>+		}
>+	}
>+
>+	if (quit) {
>+		struct recorder_command_base base = {
>+			.command = RECORDER_COMMAND_QUIT,
>+			.size = sizeof(base),
>+		};
>+
>+		fwrite(&base, sizeof(base), 1, command_fifo_file);
>+	}
>+
>+	fclose(command_fifo_file);
>+
>+	return EXIT_SUCCESS;
>+}
>diff --git a/tools/xe-perf/xe_perf_reader.c b/tools/xe-perf/xe_perf_reader.c
>new file mode 100644
>index 0000000000..62a4237ee4
>--- /dev/null
>+++ b/tools/xe-perf/xe_perf_reader.c
>@@ -0,0 +1,325 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <assert.h>
>+#include <errno.h>
>+#include <fcntl.h>
>+#include <getopt.h>
>+#include <inttypes.h>
>+#include <stdbool.h>
>+#include <stdint.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+#include <sys/types.h>
>+#include <sys/stat.h>
>+#include <unistd.h>
>+
>+#include "igt_core.h"
>+#include "intel_chipset.h"
>+#include "xe/xe_oa.h"
>+#include "xe/xe_oa_data_reader.h"
>+
>+#define MAX(a,b) ((a) > (b) ? (a) : (b))
>+#define MIN(a,b) ((a) > (b) ? (b) : (a))
>+
>+static void
>+usage(void)
>+{
>+	printf("Usage: xe-perf-reader [options] file\n"
>+	       "Reads the content of an xe-perf recording.\n"
>+	       "\n"
>+	       "     --help,    -h             Print this screen\n"
>+	       "     --counters, -c c1,c2,...  List of counters to display values for.\n"
>+	       "                               Use 'all' to display all counters.\n"
>+	       "                               Use 'list' to list available counters.\n"
>+	       "     --reports, -r             Print out data per report.\n");
>+}
>+
>+static struct intel_xe_perf_logical_counter *
>+find_counter(struct intel_xe_perf_metric_set *metric_set,
>+	     const char *name)
>+{
>+	for (uint32_t i = 0; i < metric_set->n_counters; i++) {
>+		if (!strcmp(name, metric_set->counters[i].symbol_name)) {
>+			return &metric_set->counters[i];
>+		}
>+	}
>+
>+	return NULL;
>+}
>+
>+static void
>+append_counter(struct intel_xe_perf_logical_counter ***counters,
>+	       int32_t *n_counters,
>+	       uint32_t *n_allocated_counters,
>+	       struct intel_xe_perf_logical_counter *counter)
>+{
>+	if (*n_counters < *n_allocated_counters) {
>+		(*counters)[(*n_counters)++] = counter;
>+		return;
>+	}
>+
>+	*n_allocated_counters = MAX(2, *n_allocated_counters * 2);
>+	*counters = realloc(*counters,
>+			    sizeof(struct intel_xe_perf_logical_counter *) *
>+			    (*n_allocated_counters));
>+	(*counters)[(*n_counters)++] = counter;
>+}
>+
>+static struct intel_xe_perf_logical_counter **
>+get_logical_counters(struct intel_xe_perf_metric_set *metric_set,
>+		     const char *counter_list,
>+		     int32_t *out_n_counters)
>+{
>+	struct intel_xe_perf_logical_counter **counters = NULL, *counter;
>+	uint32_t n_allocated_counters = 0;
>+	const char *current, *next;
>+	char counter_name[100];
>+
>+	if (!counter_list) {
>+		*out_n_counters = 0;
>+		return NULL;
>+	}
>+
>+	if (!strcmp(counter_list, "list")) {
>+		uint32_t longest_name = 0;
>+
>+		*out_n_counters = -1;
>+		for (uint32_t i = 0; i < metric_set->n_counters; i++) {
>+			longest_name = MAX(longest_name,
>+					   strlen(metric_set->counters[i].symbol_name));
>+		}
>+
>+		fprintf(stdout, "Available counters:\n");
>+		for (uint32_t i = 0; i < metric_set->n_counters; i++) {
>+			fprintf(stdout, "%s:%*s%s\n",
>+				metric_set->counters[i].symbol_name,
>+				(int)(longest_name -
>+				      strlen(metric_set->counters[i].symbol_name) + 1), " ",
>+				metric_set->counters[i].name);
>+		}
>+		return NULL;
>+	}
>+
>+	if (!strcmp(counter_list, "all")) {
>+		counters = malloc(sizeof(*counters) * metric_set->n_counters);
>+		*out_n_counters = metric_set->n_counters;
>+		for (uint32_t i = 0; i < metric_set->n_counters; i++)
>+			counters[i] = &metric_set->counters[i];
>+		return counters;
>+	}
>+
>+	*out_n_counters = 0;
>+	current = counter_list;
>+	while ((next = strstr(current, ","))) {
>+		snprintf(counter_name,
>+			 MIN((uint32_t)(next - current) + 1, sizeof(counter_name)),
>+			 "%s", current);
>+
>+		counter = find_counter(metric_set, counter_name);
>+		if (!counter) {
>+			fprintf(stderr, "Unknown counter '%s'.\n", counter_name);
>+			free(counters);
>+			*out_n_counters = -1;
>+			return NULL;
>+		}
>+
>+		append_counter(&counters, out_n_counters, &n_allocated_counters, counter);
>+
>+		current = next + 1;
>+	}
>+
>+	if (strlen(current) > 0) {
>+		counter = find_counter(metric_set, current);
>+		if (!counter) {
>+			fprintf(stderr, "Unknown counter '%s'.\n", current);
>+			free(counters);
>+			*out_n_counters = -1;
>+			return NULL;
>+		}
>+
>+		append_counter(&counters, out_n_counters, &n_allocated_counters, counter);
>+	}
>+
>+	return counters;
>+}
>+
>+static void
>+print_report_deltas(const struct intel_xe_perf_data_reader *reader,
>+		    const struct intel_xe_perf_record_header *xe_report0,
>+		    const struct intel_xe_perf_record_header *xe_report1,
>+		    struct intel_xe_perf_logical_counter **counters,
>+		    uint32_t n_counters)
>+{
>+	struct intel_xe_perf_accumulator accu;
>+
>+	intel_xe_perf_accumulate_reports(&accu,
>+				      reader->perf, reader->metric_set,
>+				      xe_report0, xe_report1);
>+
>+	for (uint32_t c = 0; c < n_counters; c++) {
>+		struct intel_xe_perf_logical_counter *counter = counters[c];
>+
>+		switch (counter->storage) {
>+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_UINT64:
>+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_UINT32:
>+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_BOOL32:
>+			fprintf(stdout, "   %s: %" PRIu64 "\n",
>+				counter->symbol_name, counter->read_uint64(reader->perf,
>+									   reader->metric_set,
>+									   accu.deltas));
>+			break;
>+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_DOUBLE:
>+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_FLOAT:
>+			fprintf(stdout, "   %s: %f\n",
>+				counter->symbol_name, counter->read_float(reader->perf,
>+									  reader->metric_set,
>+									  accu.deltas));
>+			break;
>+		}
>+	}
>+}
>+
>+int
>+main(int argc, char *argv[])
>+{
>+	const struct option long_options[] = {
>+		{"help",             no_argument, 0, 'h'},
>+		{"counters",   required_argument, 0, 'c'},
>+		{"reports",          no_argument, 0, 'r'},
>+		{0, 0, 0, 0}
>+	};
>+	struct intel_xe_perf_data_reader reader;
>+	struct intel_xe_perf_logical_counter **counters;
>+	const struct intel_device_info *devinfo;
>+	const char *counter_names = NULL;
>+	int32_t n_counters;
>+	int fd, opt;
>+	bool print_reports = false;
>+
>+	while ((opt = getopt_long(argc, argv, "hc:r", long_options, NULL)) != -1) {
>+		switch (opt) {
>+		case 'h':
>+			usage();
>+			return EXIT_SUCCESS;
>+		case 'c':
>+			counter_names = optarg;
>+			break;
>+		case 'r':
>+			print_reports = true;
>+			break;
>+		default:
>+			fprintf(stderr, "Internal error: "
>+				"unexpected getopt value: %d\n", opt);
>+			usage();
>+			return EXIT_FAILURE;
>+		}
>+	}
>+
>+	if (optind >= argc) {
>+		fprintf(stderr, "No recording file specified.\n");
>+		return EXIT_FAILURE;
>+	}
>+
>+	fd = open(argv[optind], 0, O_RDONLY);
>+	if (fd < 0) {
>+		fprintf(stderr, "Cannot open '%s': %s.\n",
>+			argv[optind], strerror(errno));
>+		return EXIT_FAILURE;
>+	}
>+
>+	if (!intel_xe_perf_data_reader_init(&reader, fd)) {
>+		fprintf(stderr, "Unable to parse '%s': %s.\n",
>+			argv[optind], reader.error_msg);
>+		return EXIT_FAILURE;
>+	}
>+
>+	counters = get_logical_counters(reader.metric_set, counter_names, &n_counters);
>+	if (n_counters < 0)
>+		goto exit;
>+
>+	devinfo = intel_get_device_info(reader.devinfo.devid);
>+
>+	fprintf(stdout, "Recorded on device=0x%x(%s) graphics_ver=%i\n",
>+		reader.devinfo.devid, devinfo->codename,
>+		reader.devinfo.graphics_ver);
>+	fprintf(stdout, "Metric used : %s (%s) uuid=%s\n",
>+		reader.metric_set->symbol_name, reader.metric_set->name,
>+		reader.metric_set->hw_config_guid);
>+	fprintf(stdout, "Reports: %u\n", reader.n_records);
>+	fprintf(stdout, "Context switches: %u\n", reader.n_timelines);
>+	fprintf(stdout, "Timestamp correlation points: %u\n", reader.n_correlations);
>+
>+	if (reader.n_correlations < 2) {
>+		fprintf(stderr, "Less than 2 CPU/GPU timestamp correlation points.\n");
>+		return EXIT_FAILURE;
>+	}
>+
>+	fprintf(stdout, "Timestamp correlation CPU range:       0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		reader.correlations[0]->cpu_timestamp,
>+		reader.correlations[reader.n_correlations - 1]->cpu_timestamp);
>+	fprintf(stdout, "Timestamp correlation GPU range (64b): 0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		reader.correlations[0]->gpu_timestamp,
>+		reader.correlations[reader.n_correlations - 1]->gpu_timestamp);
>+	fprintf(stdout, "Timestamp correlation GPU range (32b): 0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		reader.correlations[0]->gpu_timestamp & 0xffffffff,
>+		reader.correlations[reader.n_correlations - 1]->gpu_timestamp & 0xffffffff);
>+
>+	fprintf(stdout, "OA data timestamp range:               0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		intel_xe_perf_read_record_timestamp(reader.perf,
>+						 reader.metric_set,
>+						 reader.records[0]),
>+		intel_xe_perf_read_record_timestamp(reader.perf,
>+						 reader.metric_set,
>+						 reader.records[reader.n_records - 1]));
>+	fprintf(stdout, "OA raw data timestamp range:           0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		intel_xe_perf_read_record_timestamp_raw(reader.perf,
>+						     reader.metric_set,
>+						     reader.records[0]),
>+		intel_xe_perf_read_record_timestamp_raw(reader.perf,
>+						     reader.metric_set,
>+						     reader.records[reader.n_records - 1]));
>+
>+	if (strcmp(reader.metric_set_uuid, reader.metric_set->hw_config_guid)) {
>+		fprintf(stdout,
>+			"WARNING: Recording used a different HW configuration.\n"
>+			"WARNING: This could lead to inconsistent counter values.\n");
>+	}
>+
>+	for (uint32_t i = 0; i < reader.n_timelines; i++) {
>+		const struct intel_xe_perf_timeline_item *item = &reader.timelines[i];
>+
>+		fprintf(stdout, "Time: CPU=0x%016" PRIx64 "-0x%016" PRIx64
>+			" GPU=0x%016" PRIx64 "-0x%016" PRIx64"\n",
>+			item->cpu_ts_start, item->cpu_ts_end,
>+			item->ts_start, item->ts_end);
>+		fprintf(stdout, "hw_id=0x%x %s\n",
>+			item->hw_id, item->hw_id == 0xffffffff ? "(idle)" : "");
>+
>+		print_report_deltas(&reader,
>+				    reader.records[item->record_start],
>+				    reader.records[item->record_end],
>+				    counters, n_counters);
>+
>+		if (print_reports) {
>+			for (uint32_t r = item->record_start; r < item->record_end; r++) {
>+				fprintf(stdout, " report%i = %s\n",
>+					r - item->record_start,
>+					intel_xe_perf_read_report_reason(reader.perf, reader.records[r]));
>+				print_report_deltas(&reader,
>+						    reader.records[r],
>+						    reader.records[r + 1],
>+						    counters, n_counters);
>+			}
>+		}
>+	}
>+
>+ exit:
>+	intel_xe_perf_data_reader_fini(&reader);
>+	close(fd);
>+
>+	return EXIT_SUCCESS;
>+}
>-- 
>2.41.0
>
