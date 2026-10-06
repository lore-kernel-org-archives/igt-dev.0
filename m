Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198ABCA5FF0
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 07:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F0510F234;
	Tue,  6 Oct 2026 07:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z79jAF35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2779910F21E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 07:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791272185; x=1822808185;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YQYaJO53LxiA1TapHWe0dSThWJKP9/gu/gwLyCwg6fU=;
 b=Z79jAF35KJgk7UouxBSuBLCfqkgBtRRAeQZstx8n+fs/YBGb/vZGlA04
 /yTqVq+4oD97YOzvy28asTGwtLjzV28qnvhhaKeCFWYI/fZpsZW8g6OLt
 nkwcXYBPVyP0TMa7uZB4clpUCoL7MVoCGKXaqjfLzxrQDlhSB2uAEAkAW
 qGQWxvnrT7mpMwtkuMXg40gmAvbrveWJAwgFL53bsie5EoCrTe2oaWYU1
 CO/nNDRAyXhYp+CF5JGzr6JWHYTY6M2WqT4OrJErCLqY+NNztfTyD4GDH
 5XuvdET+qBwdRbUjKfE2xTsNqqL30cv7RV1KDY9HQ4E9oYHADJJKns0SE g==;
X-CSE-ConnectionGUID: w5EAllubRq+gKXuudIS2XQ==
X-CSE-MsgGUID: gLMOmpiMR7yLSioORVWb6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="100935"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="100935"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 00:36:25 -0700
X-CSE-ConnectionGUID: uEzIxBPuS5O4fXiMtqLXbQ==
X-CSE-MsgGUID: P9UuvhYDRZi3GgyiPo6u+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="280801294"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 00:36:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 00:36:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 00:36:24 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 00:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjWv6f0LTaLJk1z5cZ8WoY9a0is/CQr31Q8u4um1/MlTnRgGF+xwwFoOtnOfIHebw6aH6ydaTXYYi6KmYzfIGfnfrdzoblySQfU3C9smKgFtMDlXX0DJi7Hts74s8Ac6JURu6fl03rEFJ3WRdxM6urZpRk5OnSlGW0Uce9WuYxQF9Hkz0GECFTzgnQ8Ss0gSrKOkcecB3Qs6FVzure/EBWTwlsKA/8b683E8tlOIzrv2LEFo83aVPdSv9gdivdGl6SmRSV2wroK/KFzYYf6yto/WTKyVVrtQ98Xgej8tMlrvJe0BJwFNdpB1PUNszWHDmhM96iMPvucqnEQ1ZiytiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7ZeD7ld6vRqvHg3oQDT5Om8adTvrrSLL7//eCsW7hA=;
 b=oT7Ub990LsSjHVj9qmtydr47EbXNbS/X3CSbWa1t1W/JUG12GVi6QeYiQLf9kyO62zDRskVQdjkco+XAHVM4N0e9IP0B/qsHSO9W80Zgrzas9aV3J2308pHjc7okVNNTfkC3cSVdISg7ufWcpN6etsslkmmmJnybj7eHm3psw3MrnIy4bvcGrFM1cKCJleeWmHz/T04c0hj6S9/tDFOUKvE6tCf4rkxsKXmg87EPx0WWBjWSaRf4ba5OIDRf8Ojb7/USVbRgKIpystwGwBWK+junvf2ztjtJaLVxileMTKMALAPw7CX9xxL+pXLYku+MQ0Hs1XfEBjbIc9yetDo0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 6 Oct
 2026 07:36:20 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 07:36:20 +0000
Date: Tue, 6 Oct 2026 07:36:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2 7/8] tools/gputop: integrate i915 and xe PMU
 engine monitoring
Message-ID: <3v7aqjrhoiifgscds7rczf2ub3ltb5oohag6o6wh56k4bwuwrk@wc3j6jlfdtvu>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
 <08e2e0389dc29de1dbc24b7d1cb268b33391c891.1790853076.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08e2e0389dc29de1dbc24b7d1cb268b33391c891.1790853076.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0212.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::7) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: de56002c-09ed-41ab-d3a5-08df237c83c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|6133799003|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: puh8ZJelmBVwUG+yInWQ+xlzCl0eMqfd6BsERwQBhmhxlV/G0pS/t3g45siOFHBGUNmi2qWpy1dv8ykaYKmS7ADUiAhYp0+7FMPCfASqhYs2cKRxWUx0zkQszu2zSch+rlcdJxbQMbW7iA4FBMdPcHaw4giBTbB1gK+GEsqFCNRmROK252+m5t5AtXYTdiry1rucnk8H2SQSfL7U//NQNvKDA0EedEfiQstqs54IG8T64RYP541kQo2qV3gs+PDKbGzoFQZFsGGOOhPxP/K/Ngnj/GY16K6d/HBfBADblQz6Kq7IAyriJXQXdDCTlcyVpDd3kgJHuv71iI7xcA4CBerUOiO6+aGJYLcZ3lOXFppDu6JOeWZm+gypOQ29sGOh1K2luIx4/+0/MB0vbUnj6SZbojqPEoPUSWxhX6oMOiih6+fJfeBkwnIPk6TA+pm4MGZZTtkloJEFBAfjH3NBEuRi0l4Gfa2I5+5Q+QcYezYVIBlhPlXlsLOJulwV4QYkIkTOyGTaBfv5l6c8Pnegq/UXs2hwe3b9kRt3I9IFmEtzKKn7Vx+Y08cOX06CnJSDt7onzEMhRU6giPNpxfMq/JEM1C87dwGNqScnephsbdvdrYteRwQOc15IeIIycMi3/+qvNf3IsWaAifTlcSpomQeaUcNGjTaCID7K4vG6tWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(6133799003)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VocXF5djkwd0M5WWczYy8vSm9FZ0EzOXYzMy9lTGVEWlpiUXIrcFg2QjIv?=
 =?utf-8?B?bUFia1NwanRuWndFRWZKY1FuZ01ZS2xUQzhqODBsMUNuOWhhdlNhTEtPSWwr?=
 =?utf-8?B?SklxOGVVc0VkZmZreVpMTUNJTWd1TEtUb3FUaXh1UDhoaDJNbG9TNS9EZ1cr?=
 =?utf-8?B?SGJxbkFXbURWNHRST04xaExhZTFadW1abnYwSGtWcGpycThYUTdOSVNCUGVE?=
 =?utf-8?B?V1ZzelY0cHNpbVBCN1NXZFpyMFk0RTEwQlNEckJuZ3RzVEhSR29yRC90Z0Ny?=
 =?utf-8?B?eFlqbDBMdG5lOUJQTW9TZEhtRjNWQ3U0a3FMWkVaTW8xM050UnRqdmx2T05z?=
 =?utf-8?B?eDM1d2ZoS3o4YStqUTFDdWpteVo5YXFoMWZVZDNLQklnREZQbHVMZlhwN093?=
 =?utf-8?B?Yk5iVURVWVVKa1Npd05qb1V5djNzTzdrQmNIUEZJWXBRNnlCY3dnaGV2VS9u?=
 =?utf-8?B?QlZTVm5FSWxzV0lGNHZ2L1pibmxRMThQMG9YNkpVaS9rWXRna2VIa1l4dElP?=
 =?utf-8?B?MkI3TzRoUnpUSnNCOEp3MjFZdUNhWGVPaUU3bVVxWTNHazVRTGJzNitmeGtp?=
 =?utf-8?B?UG1YenZxdVJkdEdBZ2pKQmMxbCtSaUtVZE5TTlVUc0pGZDFMaXVYdmlST1NY?=
 =?utf-8?B?RGdIR0ZiMlRqQTE2SnpkMDkwaC93dVVNZHRZNFRjMVcySHl3KzRMY0g5UWlM?=
 =?utf-8?B?VWo4RCs4QVp1dGhaZU5LQkdVb1d1SmJwTTBDcUR6WjhYczZjNkFpUTFWVkgy?=
 =?utf-8?B?dXRoeHdBNWNGMUhFVXR4UmpzVzNkZDYyMzI4VXF6TmFvYjRRTVdpTE1IeEdG?=
 =?utf-8?B?bm9jK2FneVl0UDJJYUJweXBIdXd4NXdZbkNPS0p1TjZjYTBueVpFbmM3TmNt?=
 =?utf-8?B?dVJwaGZQb1M5WGJSY09tYmVYNStXY25NWFg5LytCelZ6WmRlVjZYQ1pRTlpQ?=
 =?utf-8?B?bWxGbkZVL1NDZkY0TWltZzBwbFk5ZnpoY0VBNWoyL3pTcWJ5TzBuTmQvdEZn?=
 =?utf-8?B?MmhETlNJR0dlUE56Q2ZVdmFQWXBkcVlyRUY4UjJZcnIvSDMwZEhudTV6eVpq?=
 =?utf-8?B?NGhLNVlxRldyajkzOUdVYmY2WkJhTHI4eU1hV1EyZDNpVi90Ry9zeHFTOHBm?=
 =?utf-8?B?MFJhalFhbGtOVURzdUs4UEhZWkZCbFlPbHpHZERLSGV3WnlVaEJPZDhxbklt?=
 =?utf-8?B?bnM4YnJIek5OMXNUbmc4Q0Fra29NdTJEZEJQYTFWK2xRdEFHM2Vhc210ODl4?=
 =?utf-8?B?eHZ6eUY2NzhESnBZZUtwdHR0U1B6NEdKWUdMNTJZMm1pM1QyUFhHUDRCbnVm?=
 =?utf-8?B?VDhKTmVjaFQ2UldSQ3M5emdyTWhMcDJweURkS0t4d2IxWHh5ems0dVdMT2Vz?=
 =?utf-8?B?a0tUZlI2TEx5MFQvb2tTSDl3c1N5d2JPaTNxS0czbEtDV3BxWUlwY0ttby8v?=
 =?utf-8?B?YVpYL0xhVFRaNXdmcWxzSEcvREwyTDgraTk4dGtFYzlpamZQbVdpUTBGWHV3?=
 =?utf-8?B?aWpiYXhUYkhVdWpHMEtZSEMwbDBvbjBPQW9QeEdXM0dtcnFjbGdWNnYwOXFP?=
 =?utf-8?B?bXFyVVEzTDdBRW1PTEp4VXUxVW9RWWhickVLL04za3M1enMybnJGbUNFRDl0?=
 =?utf-8?B?dHRXL3JhZ0QxUjNhN1ZFem5hWVkzK0Z5NUhqTE1GNGRZK1BpbHN1NTJSUkNj?=
 =?utf-8?B?WU9CcnpRL3RwUTVGVytHZFJqcG1pNmlQSGl2OUZrU0VraGsxUHprMHNiN1ha?=
 =?utf-8?B?YnQ3d1Qyd3NSVldtUUpDUGNURTdZK1hob0dXS3JSdUh4MzN2dG90dkZ1TEJa?=
 =?utf-8?B?NHlpZWYvQ090YXVrMHZvOFcrbG9ZaUFHQ1dLdXdGV1N5K3ZaNFhzWENXV3FP?=
 =?utf-8?B?U1NQOFRtaVNTMTBZMFBwcGNlVHdhRlBtQ21TeFFMQjFCdzFlTEd0Mk5CU0F2?=
 =?utf-8?B?MEUwdWM1QzkrbVBsWGtDR1BIK0VkV2NZVFhxdlRWeCtRWklSNlpmWk50cnNF?=
 =?utf-8?B?L2EvME1iMXZpWjYxM1lEQXN2ZVhkQnlmQTJrb0VpQzlJWCtvSXZzMFBYN0gx?=
 =?utf-8?B?VnRvekRTZVlmNlY1azhLaWJTc3VIdytXaFZDeUxoOUlMMytFSkRENHJUNHNh?=
 =?utf-8?B?TDlsL2Irbk93aldSYVRUckc0ckFMbStGLzE3QU43T1cyQTJSR3AvMDFhMGJ5?=
 =?utf-8?B?aUY5QStnck1sLzNxV1pYUlN5UEcrbWpPeUlXKzVhaHQ1UWpvYWQycEdDSzRi?=
 =?utf-8?B?THpaYjFYcWNiVzBDTC9NS2VyUW0wRWluZTlOcElZZitUMENEUGV1WlNMRWlR?=
 =?utf-8?B?UDFsYzlLRmJ4SEZROGNwbWhCWXpoREtZazZTYzk3T1VnajhFOWlOajhaUGxh?=
 =?utf-8?Q?I8ZIsh7VyI3QquxU=3D?=
X-Exchange-RoutingPolicyChecked: eMzbEW5BS1pu+I/lOUSwMCh1ukYA302yNuLFw2Yd762Ct3uFwtDv+Grq4m9BSl2Zx5xWvAyEF62TgoRUrcylfHauhPahkBtlfCNm6q5loi6RMMA0ILDjaANlPFBN2JvjCAYrmqZZ6lhUZ50NwmW8zmYTBcFyem3cjtXHRnTq18GH+0Jcm+JhPzh9H+8CV+1YhXVvManWzcZl4zcs3awdfaJmbyFUVwuTObIdWZUU1Tc0qsbUHhK0jvboG4NQ7ZQqCmL8ag/moAsz9F0yWdY1yKcDLs+GtjZykleNSB7aHbEWYJlITYUPLK+totM6cXb9oFe0gdvTaeobBvMVDtF72g==
X-MS-Exchange-CrossTenant-Network-Message-Id: de56002c-09ed-41ab-d3a5-08df237c83c7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 07:36:20.6305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPphVjDO8tEwmUizu7L3YGVBfsAUVlWtkzBNIKmOC5Kgc2h/JSaS2QZNWtfjfX7rd7xZftZ4uDo/3qFdI36y5BzR1zEsuimTnbcsXvt6ctU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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

Hi Sebastian,

On 2026-10-01 at 13:14:00 +0200, Sebastian Brzezinka wrote:
> Wire the i915 and xe PMU backends into the main gputop display loop.
> Rename intel_driver_type/is_intel_device to gputop_driver_type/
> gputop_is_intel_device to avoid symbol conflicts with drmtest.h, and
> drop the local print_percentage_bar(), n_spaces(), bars[], ARRAY_SIZE
> and ANSI_HEADER/ANSI_RESET now that utils.c/utils.h provide them.
> 
> Add per-driver device_operations dispatch tables (i915_ops,
> xe_ops) and pmu_devices_init(), which discovers devices via
> igt_device_card_match_all() and initializes each one. A failed
> per-card allocation is now reported via stderr instead of being
> silently skipped, matching the diagnostics already used for engine
> and PMU init failures. main() seeds an initial PMU sample before the
> display loop, samples and prints engine busyness each iteration, and
> cleans up PMU resources on exit.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop.c | 222 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 164 insertions(+), 58 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 0ed5af456..e49e31641 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -30,59 +30,21 @@
>  #include "igt_drm_clients.h"
>  #include "igt_drm_fdinfo.h"
>  #include "igt_profiling.h"
> +#include "igt_device_scan.h"
> +#include "gputop/i915_gputop.h"
> +#include "gputop/xe_gputop.h"
>  
>  enum utilization_type {
>  	UTILIZATION_TYPE_ENGINE_TIME,
>  	UTILIZATION_TYPE_TOTAL_CYCLES,
>  };
>  
> -enum intel_driver_type {
> -	INTEL_DRIVER_I915,
> -	INTEL_DRIVER_XE,
> -	INTEL_DRIVER_UNKNOWN,
> +enum gputop_driver_type {
> +	GPUTOP_DRIVER_I915,
> +	GPUTOP_DRIVER_XE,
> +	GPUTOP_DRIVER_UNKNOWN,
>  };
>  
> -#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> -
> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> -
> -#define ANSI_HEADER "\033[7m"
> -#define ANSI_RESET "\033[0m"
> -
> -static void n_spaces(const unsigned int n)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < n; i++)
> -		putchar(' ');
> -}
> -
> -static void print_percentage_bar(double percent, int max_len)
> -{
> -	int bar_len, i, len = max_len - 1;
> -	const int w = 8;
> -
> -	len -= printf("|%5.1f%% ", percent);
> -
> -	/* no space left for bars, do what we can */
> -	if (len < 0)
> -		len = 0;
> -
> -	bar_len = ceil(w * percent * len / 100.0);
> -	if (bar_len > w * len)
> -		bar_len = w * len;
> -
> -	for (i = bar_len; i >= w; i -= w)
> -		printf("%s", bars[w]);
> -	if (i)
> -		printf("%s", bars[i]);
> -
> -	len -= (bar_len + (w - 1)) / w;
> -	n_spaces(len);
> -
> -	putchar('|');
> -}
> -
>  /* Get the correct sysfs prefix based on DRM minor number */
>  static const char *get_sysfs_drm_path(unsigned int drm_minor)
>  {
> @@ -116,25 +78,25 @@ static bool is_bound(unsigned int drm_minor, const char *driver_name)
>  	return strcmp(driver, driver_name) == 0;
>  }
>  
> -/* Detect if this is an Intel device (i915 or Xe) */
> -static bool is_intel_device(unsigned int drm_minor)
> +/* Detect if this is an Intel device (i915 or Xe) by sysfs driver link */
> +static bool gputop_is_intel_device(unsigned int drm_minor)
>  {
>  	return is_bound(drm_minor, "i915") || is_bound(drm_minor, "xe");
>  }
>  
>  /* Detect Intel driver variant */
> -static enum intel_driver_type detect_intel_driver(unsigned int drm_minor)
> +static enum gputop_driver_type detect_intel_driver(unsigned int drm_minor)
>  {
>  	if (is_bound(drm_minor, "xe"))
> -		return INTEL_DRIVER_XE;
> +		return GPUTOP_DRIVER_XE;
>  	else if (is_bound(drm_minor, "i915"))
> -		return INTEL_DRIVER_I915;
> +		return GPUTOP_DRIVER_I915;
>  
> -	return INTEL_DRIVER_UNKNOWN;
> +	return GPUTOP_DRIVER_UNKNOWN;
>  }
>  
>  /* Count the number of GTs by checking which gt* directories exist */
> -static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_type)
> +static int get_num_gts(unsigned int drm_minor, enum gputop_driver_type driver_type)
>  {
>  	char path[256];
>  	struct stat st;
> @@ -142,7 +104,7 @@ static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_typ
>  
>  	/* Check for gt0, gt1, gt2, etc. up to a reasonable maximum */
>  	for (int i = 0; i < 8; i++) {
> -		if (driver_type == INTEL_DRIVER_XE)
> +		if (driver_type == GPUTOP_DRIVER_XE)
>  			/* For Xe, all GTs are under tile0 */
>  			snprintf(path, sizeof(path), "%s%u/device/tile0/gt%d",
>  				 get_sysfs_drm_path(drm_minor), drm_minor, i);
> @@ -185,12 +147,12 @@ static char *get_intel_frequencies(unsigned int drm_minor)
>  	char gt_info[64];
>  	int num_gts;
>  	int gt;
> -	enum intel_driver_type driver_type;
> +	enum gputop_driver_type driver_type;
>  	bool first = true;
>  
>  	/* Detect Intel driver variant */
>  	driver_type = detect_intel_driver(drm_minor);
> -	if (driver_type == INTEL_DRIVER_UNKNOWN)
> +	if (driver_type == GPUTOP_DRIVER_UNKNOWN)
>  		return NULL;
>  
>  	/* Get GT count from sysfs */
> @@ -205,7 +167,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
>  		bool has_cur = false, has_act = false;
>  
>  		/* Read requested frequency */
> -		if (driver_type == INTEL_DRIVER_XE)
> +		if (driver_type == GPUTOP_DRIVER_XE)
>  			snprintf(freq_path, sizeof(freq_path),
>  				 "%s%u/device/tile0/gt%d/freq0/cur_freq",
>  				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
> @@ -217,7 +179,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
>  		has_cur = read_freq_value(freq_path, &cur_freq);
>  
>  		/* Read actual frequency */
> -		if (driver_type == INTEL_DRIVER_XE)
> +		if (driver_type == GPUTOP_DRIVER_XE)
>  			snprintf(freq_path, sizeof(freq_path),
>  				 "%s%u/device/tile0/gt%d/freq0/act_freq",
>  				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
> @@ -252,7 +214,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
>  static char *get_frequencies(unsigned int drm_minor)
>  {
>  	/* Check for Intel devices (i915/Xe) */
> -	if (is_intel_device(drm_minor))
> +	if (gputop_is_intel_device(drm_minor))
>  		return get_intel_frequencies(drm_minor);
>  
>  	return NULL;
> @@ -523,6 +485,28 @@ static void clrscr(void)
>  	printf("\033[H\033[J");
>  }
>  
> +/* Check whether any DRM display/render device node exists at all. */
> +static bool any_drm_device_present(void)
> +{
> +	struct dirent *dent;
> +	bool found = false;
> +	DIR *d;
> +
> +	d = opendir("/dev/dri");
> +	if (!d)
> +		return false;
> +
> +	while ((dent = readdir(d)) != NULL) {
> +		if (!strncmp(dent->d_name, "card", 4)) {
> +			found = true;
> +			break;
> +		}
> +	}
> +	closedir(d);
> +
> +	return found;
> +}
> +
>  struct gputop_args {
>  	long n_iter;
>  	unsigned long delay_usec;
> @@ -603,12 +587,76 @@ static void sigint_handler(int sig)
>  	stop_top = true;
>  }
>  
> +static const struct device_operations i915_ops = {
> +	.gputop_init   = i915_gputop_init,
> +	.init_engines  = i915_populate_engines,
> +	.pmu_init      = i915_pmu_init,
> +	.pmu_sample    = i915_pmu_sample,
> +	.print_engines = i915_print_engines,
> +	.clean_up      = i915_clean_up,
> +};
> +
> +static const struct device_operations xe_ops = {
> +	.gputop_init   = xe_gputop_init,
> +	.init_engines  = xe_populate_engines,
> +	.pmu_init      = xe_pmu_init,
> +	.pmu_sample    = xe_pmu_sample,
> +	.print_engines = xe_print_engines,
> +	.clean_up      = xe_clean_up,
> +};
> +
> +static void pmu_devices_init(struct gputop_driver *drv,
> +			     const struct device_operations *ops,
> +			     const char *filter, size_t instance_size)
> +{
> +	struct igt_device_card *cards;
> +	int n;
> +
> +	n = igt_device_card_match_all(filter, &cards);
> +	if (n <= 0)
> +		return;
> +
> +	drv->instances = calloc(n, instance_size);
> +	if (!drv->instances) {
> +		free(cards);
> +		return;
> +	}
> +
> +	drv->len = n;
> +
> +	for (int i = 0; i < n; i++) {
> +		struct igt_device_card *card = malloc(sizeof(*card));
> +
> +		if (!card) {
> +			fprintf(stderr,
> +				"gputop: failed to allocate card info for device %d\n",
> +				i);
> +			continue;
> +		}
> +
> +		*card = cards[i];
> +		ops->gputop_init(drv->instances, i, card);
> +
> +		if (!ops->init_engines(drv->instances, i)) {
> +			fprintf(stderr, "gputop: failed to populate engines for device %d\n", i);
> +			continue;
> +		}
> +
> +		if (ops->pmu_init(drv->instances, i) < 0)
> +			fprintf(stderr, "gputop: failed to init PMU for device %d\n", i);
> +	}
> +
> +	drv->device_present = true;
> +	free(cards);
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	struct gputop_args args;
>  	unsigned int period_us;
>  	struct igt_profiled_device *profiled_devices = NULL;
>  	struct igt_drm_clients *clients = NULL;
> +	struct gputop_driver i915_drv = {}, xe_drv = {};
>  	int con_w = 80, con_h = 50;
>  	int ret;
>  	long n;
> @@ -619,6 +667,11 @@ int main(int argc, char **argv)
>  	if (!ret)
>  		return EXIT_SUCCESS;
>  
> +	if (!any_drm_device_present()) {
> +		fprintf(stderr, "gputop: no DRM device found\n");
> +		return IGT_EXIT_SKIP;
> +	}
> +
>  	n = args.n_iter;
>  	period_us = args.delay_usec;
>  
> @@ -640,6 +693,28 @@ int main(int argc, char **argv)
>  
>  	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>  
> +	/* Discover and initialise PMU-based per-engine monitoring. */
> +	pmu_devices_init(&i915_drv, &i915_ops,
> +			 "device:driver=i915,card=all",
> +			 sizeof(struct i915_gputop));
> +	pmu_devices_init(&xe_drv, &xe_ops,
> +			 "device:driver=xe,card=all",
> +			 sizeof(struct xe_gputop));
> +
> +	/* Seed initial PMU samples so the first display has valid deltas. */
> +	for (int di = 0; di < i915_drv.len; di++) {
> +		struct i915_gputop *s = (struct i915_gputop *)i915_drv.instances + di;
> +
> +		if (s->pmu_device_obj)
> +			i915_ops.pmu_sample(i915_drv.instances, di);
> +	}
> +	for (int di = 0; di < xe_drv.len; di++) {
> +		struct xe_gputop *s = (struct xe_gputop *)xe_drv.instances + di;
> +
> +		if (s->pmu_device_obj)
> +			xe_ops.pmu_sample(xe_drv.instances, di);
> +	}
> +
>  	while ((n != 0) && !stop_top) {
>  		struct igt_drm_client *c, *prevc = NULL;
>  		int i, engine_w = 0, lines = 0;
> @@ -650,6 +725,28 @@ int main(int argc, char **argv)
>  		update_console_size(&con_w, &con_h);
>  		clrscr();
>  
> +		/* Sample and display PMU engine busyness per device. */
> +		for (int di = 0; di < i915_drv.len && lines < con_h; di++) {
> +			struct i915_gputop *s =
> +				(struct i915_gputop *)i915_drv.instances + di;
> +
> +			if (!s->pmu_device_obj)
> +				continue;
> +			i915_ops.pmu_sample(i915_drv.instances, di);
> +			lines = i915_ops.print_engines(i915_drv.instances, di,
> +						       lines, con_w, con_h);
> +		}
> +		for (int di = 0; di < xe_drv.len && lines < con_h; di++) {
> +			struct xe_gputop *s =
> +				(struct xe_gputop *)xe_drv.instances + di;
> +
> +			if (!s->pmu_device_obj)
> +				continue;
> +			xe_ops.pmu_sample(xe_drv.instances, di);
> +			lines = xe_ops.print_engines(xe_drv.instances, di,
> +						     lines, con_w, con_h);
> +		}
> +
>  		if (!clients->num_clients) {
>  			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>  
> @@ -682,6 +779,15 @@ int main(int argc, char **argv)
>  
>  	igt_drm_clients_free(clients);
>  
> +	if (i915_drv.device_present) {
> +		i915_ops.clean_up(i915_drv.instances, i915_drv.len);
> +		free(i915_drv.instances);
> +	}
> +	if (xe_drv.device_present) {
> +		xe_ops.clean_up(xe_drv.instances, xe_drv.len);
> +		free(xe_drv.instances);
> +	}
> +
>  	if (profiled_devices != NULL) {
>  		igt_devices_configure_profiling(profiled_devices, false);
>  		igt_devices_free_profiling(profiled_devices);
> -- 
> 2.55.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
