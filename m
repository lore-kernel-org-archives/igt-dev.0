Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F71CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 18:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1669410E1D8;
	Tue, 26 May 2026 18:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRlyCerW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFC610E1D8
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779818580; x=1811354580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L5ahGNAd5/OM9Jv7rIK9X6ss0HY+9DZRqdg0sih1AK4=;
 b=cRlyCerWM3VL7yc4dDNsk41g/KrDrOn3xytGwe61I7qftuPuany/Agzk
 p0epsvUPQRlilGJ+T8wymQQF5maCwdYitVtUl+U7I9CEvVk/3jALNGzVk
 TqvdCkm0YXNRUgz+b6TLJCTKGv3ugEDc0n2yb1dlLeY+K+T2MdFmQW9Tc
 7VzJm6RniYlwaZqgQcuH8eITff/kMkKZUKknZy8GiK1dXd9puCh0cUA7F
 TpSGUnerdQzWsvVZZUHiFR5I3a/Lw7dckivxLiaM2D3rjyvLJfBUo7Vjg
 f6YAD0FbJg4f5m1KiMo2gvrgVUHcwVtF1xw4gx0prLdXhfjFBqzn0kF06 w==;
X-CSE-ConnectionGUID: JLJ9JmvTQRGaOTZnWlgG9Q==
X-CSE-MsgGUID: xxs04SIGTTa4AIk2wDC5+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80755015"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80755015"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 11:02:52 -0700
X-CSE-ConnectionGUID: N0ddNSgBTOW1sF5AzGnMgA==
X-CSE-MsgGUID: Q4CQ12H4T+iFBewe28hKbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="246026521"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 11:02:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 11:02:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 11:02:49 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 11:02:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jpy9pbzsnLTF5Ov0J2Rv7LQ74Fb6ARLo71MZ3FKP1zYMk3BMoIpB6qBULxrI+Lmub1WkpeNsYUNp1Tq6XJtR+0/TWyetzEu+YXmdmO3/hrypjhLTWrWkIM5yxLVt6gXBgLqprjiN1o/xk/4ok+ORY4xCc8pwxqBBjRmNO0V5RU6UYMIvBd1h2JciZ6Nsf7IZ+LtAtJY84Dl0kZXqXJWI7Hiv+C/p3rz2yhXi6ELmcvKynwOpti/NrOH2Yli1sHHtL3qg2sobyP/SpnZWLrk9rJiqPlPmdyKI7dimGWwVIbcBrSbAJv5t6/mhtLCelU5M9lR3W5ItfFNAGkDpOALmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHgESqJR6SLXREJXEMpezNulr8HjQL7vztTd2UQbikI=;
 b=CvRslccjMFCPrQYpn4tQFHiRGyPjcSk0o8h8azoc8BJGA8tcND5x+lwHMleQZtxuTKUYVeAVWfeFgxJO8jcEeNkDZHKCOsdTB4vDLets3hUN8LEkNGlGisorELFwTANqrEDDF5G9vDiLc3Oy8BR+gP7Sg8NerSNTiEhCVzA9Mf0ZsNfvrKZ8nWShXeGK5At7/8ABQoIncMR2NC/AU1zjv0jezjx6wVHhrfhgc2bvspju0hRZuIJaZ/y5C6X1Q9MEnucZCvZwne3uJW4n8E89QL2t9SIXqEm+g8Qw9RbxZCWeWcjH41UQs25foJ6COsut5NxAnO9mC2VDGYj9ALOPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 18:02:44 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%6]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 18:02:43 +0000
Message-ID: <d41d8a77-88ff-4314-8b31-d476d9e02b5e@intel.com>
Date: Tue, 26 May 2026 23:32:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 7/7] tests/intel/kms_pm_dc: Add
 dc3co-vpb-framegap subtest
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <ramanaidu.naladala@intel.com>
References: <20260526064105.1818876-1-jeevan.b@intel.com>
 <20260526064105.1818876-8-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260526064105.1818876-8-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0210.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::15) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e53c04-10d4-4513-d83f-08debb50fc1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 0aNrI2Wv7OdFYl22Y2b97SO0sQ6j+kNOftlZDdaCGu1MLwFTug/BUOo7uKbNu1pemRzEJh6DBpSfcB3nOD3nlhzR5818isrjz4oi1FHYQeUlFA65vGTXtJm0kyOySr8ZxsrAyrNWdqwM8y4QSgnqhiOLucVgtvUyBNK4RyvnRlz6Crsr6GhRKa4awgCAzJ3bG95Gk2SdVNBmB6VLlK5u8nKNc9ZvWkHkXnjjd7mfgnqWLfHd5F8Gth9J06RKJSTfYRS89Jybm6cCaR1d6xPLCKMrmePrtrsBRIZrRr0XjAn6txqT/r+ADI3ktcUS91Ys/hmA43k4ZBBObgL31VUdrfk66o3d6aq1BoECoJZfyrrU1T3kidS+DYCS5AUYyYeskaksXmvGD4F8HqON2EE/QePlebXMViP0hLWY1GhuGNaPtyXK7twe88/3hW5XsHw7vb9b6lGdiHIlEpUUT41mZEobpFImybXnbH64cyfX4nokxHV3sgmcb+6hKRMWht5ZcLtX6nW8OfDVxHQx5XvNTL6GyiJQW3MT31PfuEDYoazmQfF5UGniChh6kZ2crYLN2Z3THnLKKiWARolDsVal4KsEffL5gMW4dAYM9K3g1zJYHT3G2D3LETZLTjSn4JRwMTsrLOe5k/sgOkT+XsKZNlJFXr+vqE80qTykp+H7rLOkaEU1zDXQpTU+SzxfEvnY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDY2d0gvUW0yU01mNVRGcndLUzNCYWRVN2dHMjg3N0pNTzdJSUVwOGdQVFlj?=
 =?utf-8?B?Sit6QTNCTm1Cbmw5WG9xbG5iZUZTeFhTdzJXcXdYSExGOXB6WVc4cytOKzB1?=
 =?utf-8?B?ci9kbVZvSVViVjFxejBiU0RHYnp1YUEzSEgwT1FFY0FOZHAwa2JCQ2tiR3cv?=
 =?utf-8?B?RWFJeXVwbVlibTBDVDZkbVdRekpqdml2Vk1hSHpsSUFUVnJ1cEZONkJzcURn?=
 =?utf-8?B?YlNvUEV3OXhSaWE0T3JGTWVDN0xEczNFQ2NBTHUrNCt6dlExUWZHRjZPUE5j?=
 =?utf-8?B?VldONGRQVWp5amNZUW54bEJuUHlITUw5MWIwU3BBenlLbUUwVC9Bb1dXVnFh?=
 =?utf-8?B?RXJzODlPa0l6c2tKdy9xbHQ5ckNRUDhHZ0FBaEV2Z3JmVXdjMHNzdjBGeXVR?=
 =?utf-8?B?Tit1VE5EYXpTSThCMmxQQnJmdGNNbVpYNFlBZjhiUms2TnVqTHFIeFFtOGI1?=
 =?utf-8?B?RG5SNHVIQktCb2dZYkJtQXVSb2FjZTZlU2ZPa3N4cWVuU2V1Kzhzc0V0Vm92?=
 =?utf-8?B?c1doLzlvenpOWU9QNXNBbXFNU2o0VHdzeVhIUTFua1cvcmcwWmtkYWFHVzJZ?=
 =?utf-8?B?MzZ1NVROa29hcFVDR2tPNTIySFIwV200SEJmdGJ3VVkrRFcxYXVyaDQ5YkY3?=
 =?utf-8?B?Yk9ISjJlLyt2cVY4eXY2ak0rYU0rVmtWZ1FWeDV3OXRETUluelI1b3doeUk2?=
 =?utf-8?B?QVR0dXhMNTZJTktiMmcwUTNzNXA0YmwyaHc1U1VZRmlrNTExeXIzRzlvY056?=
 =?utf-8?B?VWJzMGhjVGNhdTJZeStXenRRVEE2NWdlY3ZhMTJoT2hUM3FBZHp3WXgvQkYw?=
 =?utf-8?B?endjemJLVDFOTzlYNUcybEFoTWVWazNyWDYxMU1lalFSL2NEOVhPUXBkbUEz?=
 =?utf-8?B?Nnd5YUttRmlObU5qeENtSDEzYjRYbEZNaDdjQWV0Vm1IUUYwb2dVdHh5c0Iw?=
 =?utf-8?B?ZUVXNGVQemcwQUU3ZUJrdVpWTkZlbFk5UlZTTTRodE4rcUpVSFhsUjBlY0JJ?=
 =?utf-8?B?QXk3RjE0a2ZlZHExcFdpUHZGZ2FHS1ozbDJ4dnZldGh6cThBTkk2bGoxek8v?=
 =?utf-8?B?K1VVcXMzYTdXT0pRSVlZakt2ZzdSUFlQSWxhb1RQeUhTY1NITWlQWUVlcnA4?=
 =?utf-8?B?V1psTTBwYmhnL2FYZGdoWS8vaHgybGNpOWRiVEswcXIxM1EvQVgvS3F5VEFG?=
 =?utf-8?B?VExhSVRjOWlEYTRiSjdxTHJxdTZwb0VyMEVUN0xPKzYyRUNjUGppM08zUU1D?=
 =?utf-8?B?Q2xJVk45L3ZKZEtBNXJUZmRJbHhrV1l0VHJrZjdZK0JXb1Z0KzI4OGQ3WHdH?=
 =?utf-8?B?L28rTUdXQi95SjhIdlNaaGRJWjJDVEd4WE83ZWNXVU1OMUdMV2JLRDJnMGNU?=
 =?utf-8?B?OXlReHlLRDlESi9zOUptaDFGSXNYbjBiMnViOWp3Q3ZxWWNtNFhKa2JCT0hp?=
 =?utf-8?B?eXc0ZmhIQy9YSWhLMldxeVBFYXZkMDB2L3dyT3gxdUluUWVUd29aRjYvakQr?=
 =?utf-8?B?U1VaeEZUSTNnMitTOFZYNlN0Q0FMRTZSZUUycUE5RmZuWDJMcllneE5PK05R?=
 =?utf-8?B?c245YUNkSW9qQS9wZFpVM0VNcElBUlNoclk0aTFqbHlNWUFMZzNUZU9POWtw?=
 =?utf-8?B?c0JPTTYvSWxlRkNEb2hoamFWZmtObmxadUZkR1VXdFAxcFhIazB1YkJtV2dT?=
 =?utf-8?B?cXQ1YWZvT2tIT2ZOSTQ3SC9OanJicGtybGxOV2Y0anBBTlpPSEc2SlZ3Rnlu?=
 =?utf-8?B?ZG1CKzNsVDRIeU52MEIxVk9VTUZsNko4L2FEWktKWjVxTmVHUzAvRy9mbjNV?=
 =?utf-8?B?SWM0cHJ4K2w0cHhpZWZhcFV0ajYvVEh5dVEzYlBaNDdnUFFHdWJYWkIrU2Jj?=
 =?utf-8?B?THRiVHdWcUhKVlBXSVRFclY0bUVsRXFxZ1VpSmdLZFZUaFFhRFQrcllUSHJl?=
 =?utf-8?B?dWhSb2lYYzc0VHkzUXBzZHpqNTBSYzVzanF2Z1V1T2dpaVh3S0FjUS90REZI?=
 =?utf-8?B?SEZEVTF1RTQ2N3hNcS9OTFc1ellDcm56RVVWMDdYZ3lZeVluL3FOZEI3Qlpr?=
 =?utf-8?B?N1RqMk9lUk9oYTFibCtFV1RLdE15dmNEV0pWQmFFQW0vVnBjM2hMOXdZN2FP?=
 =?utf-8?B?Q1dsbWUyKzJkTVNCOXJPc1FVb0JxaVAxUXdhT0tHVmpISDE4ZjNPZlYzczE5?=
 =?utf-8?B?KzFUUXRqTkpsdG9XZW5yU29SVnlOeWp1NGNjbTBZak9mVWxXZTA2em95Nm9G?=
 =?utf-8?B?UHRMNEZMOHBLVThZU1M1MXhKTm5NRkFsdzlGQ2ZCY0dRWVV5MkgxNnB3TlUv?=
 =?utf-8?B?ekIrc2RXUGdVWU1CNUlwZkQ0VUtyMzB3RlhaUWVNZ1RkM1N6TjlpMVFpOTUw?=
 =?utf-8?Q?sfCZAO78OfNVnY2Q=3D?=
X-Exchange-RoutingPolicyChecked: mnKCMREgIoRURod5T+nmWoiyawmDRpCrOCqhjoPmLvDCm6YlA2m/R6j3mfoJdyxgsLCGryi85jPgm/b/TVXHHXCgyYV/Bgk5KVWKzawYh8tZDZT4j6c3KkB/qjhVuW9tesLVJHkrbIUSA8Hi8Qf4rUDdHRrCdMdCyGAvTKUtrytv8KIhZFHcQc8rD9AXVtDrqL7g1zXLlM1u9nxlk9rGHjWnQl0+G2QMPgdPw+TnOwE/9JpSRQecCCHvf31y+uQQyWLJhjEOyx++AhrYJjFKR2IEAHfMWI6FHr0dBnLYPBeGVg9sNn12vdTvh5YaupRx7K3xi1+LSFXiojNBvGGGrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e53c04-10d4-4513-d83f-08debb50fc1b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 18:02:43.9010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JADsviqgAktjdU17Yi9mlYfgu6LdeqI4Kxk3oT1h/gX9Sml3F+kKtbDafd7vU0lPP+XlqR6ztX0N83oyVk4geH/oK10/nWwb53mWRfJ9pJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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


On 26-05-2026 12:11 pm, Jeevan B wrote:
> Add a new subtest to validate DC3CO counter increments across
> frame gaps exceeding the threshold during a video-like workload
> with PSR2 enabled.
-->We are validating both PSR2 and PR right, please update discritpion 
accordingly.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 91 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 91 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 59cb9983d..8cc5f575c 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -60,6 +60,10 @@
>    *              exit cycle, ensuring DC3CO is not broken by deeper power state
>    *              transitions.
>    *
> + * SUBTEST: dc3co-vpb-framegap
> + * Description: Validate DC3CO counter increments before and after a delay greater
> + *              than 6 frame gaps during video-like load with PSR2 active.
-->Same here as commented above
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -427,6 +431,63 @@ static void test_dc3co_framedrop(data_t *data)
>   	cleanup_dc3co_fbs(data);
>   }
>   
> +static void check_dc3co_with_framegap_load(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_cnt_before, dc3co_cnt_after_gap;
> +	int delay, long_gap_us;
> +	time_t secs = 3;
> +	time_t start_time;
> +
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +
> +	delay = 1.5 * ((1000 * 1000) / data->mode->vrefresh);
> +
> +	dc3co_cnt_before = igt_read_dc_counter(data->debugfs_fd,
> +			   IGT_INTEL_CHECK_DC3CO);
> +	start_time = time(NULL);
> +	while (time(NULL) - start_time < secs) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +	}
> +
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_before);
> +
> +	long_gap_us = 7 * ((1000 * 1000) / data->mode->vrefresh);
> +	usleep(long_gap_us);
> +
> +	dc3co_cnt_after_gap = igt_read_dc_counter(data->debugfs_fd,
> +						  IGT_INTEL_CHECK_DC3CO);
> +	start_time = time(NULL);
> +	while (time(NULL) - start_time < secs) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +	}
> +
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_after_gap);
> +}
> +
> +static void test_dc3co_vpb_framegap(data_t *data)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	setup_output(data);
> +	setup_dc3co(data);
> +	setup_videoplayback(data);
> +	check_dc3co_with_framegap_load(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   {
>   	uint32_t dc_counter_before_psr;
> @@ -854,6 +915,36 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Validate DC3CO counter increments before and after a delay "
> +		     "greater than 6 frame gaps during video-like load with PSR2 active");
-->Same here as commented above
> +	igt_subtest_with_dynamic("dc3co-vpb-framegap") {
> +		static const struct dc3co_test_mode dc3co_modes[] = {
> +			{ PSR_MODE_2, "psr2" },
> +			{ PR_MODE,    "pr"   },
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> +			const char *name = dc3co_modes[i].name;
> +			data.op_psr_mode = dc3co_modes[i].mode;
> +
> +			igt_dynamic_f("%s", name) {
> +				igt_require(psr_sink_support(data.drm_fd,
> +						     data.debugfs_fd,
> +						     data.op_psr_mode, NULL));
> +
> +				if (data.op_psr_mode == PSR_MODE_2)
> +					igt_require_f(IS_TIGERLAKE(data.devid) ||
> +						      intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with PSR2\n");
> +				else
> +					igt_require_f(intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with Panel Replay\n");
> +
> +				test_dc3co_vpb_framegap(&data);
> +			}
> +		}
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
