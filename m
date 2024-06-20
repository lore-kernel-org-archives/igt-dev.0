Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922C6C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCB810E870;
	Thu, 20 Jun 2024 23:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAPIQKtP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457EA10E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718926782; x=1750462782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MeaIuojxUvl0QcLlguXe7Ovk1f3Qo5lKGG3esYANzSg=;
 b=dAPIQKtPp5N5CN1KfGUHjiU06vF/pjy0MWcDe0kY1DEWuBGcqnQRYB2q
 ucWOrw6eN9Y8Mg7UQlplrUXfumLlmGrG81PQ/QqqaLGAUyg699HlFhr7M
 hoFrLS4fOC7Ubhvh2kQEZihWcHXD4JOCPbSWKLlOrduZAJgqhy3PK+ciq
 H/s4YQ7H7Nz95T5DKn6mWt77DK4JvdbL4qRvEnt4RPVPZy3RHdMelny2V
 7xV9OpboPPP/3nA+giPyEzVVp6yeAP2UsKMckylmpzQTUUgVuFFBmceuY
 5hMjJ0xjW/XSPSx25z+qfd4DcRUfWZXLXjRe0z8H99dCS4ImZLTnrGd84 g==;
X-CSE-ConnectionGUID: 1iVltFpeTi+te1PJVK5MuA==
X-CSE-MsgGUID: nTAwFrqpTQ+KwFeekUBRPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16056154"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="16056154"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:39:42 -0700
X-CSE-ConnectionGUID: bDUTaF9EQaeWrXrPbZrnig==
X-CSE-MsgGUID: ffde41mERDiuVSQOoT3cCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="43083372"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:39:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:39:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:39:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:39:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDQ3vzkxiTVtSiWMB04ZSgrdpfr9Hp3U+zl6GfGN1edot/gxRKhP5HCZ+ZvIGEhNCQgoI08+8Yqp+Cdtx3+ATkGCjDWH4EP5JF7XlnPtMHTiNfvYdJd0Ruj0GM3t5AROm/7SpFXoG7FOK7yI8TLGwqDtfKJnQaGAUA1S34ssz/PCCSgbj07/40E4fJCCyGZcz6Kl/V942vGMrHDzhwUvCSJLMEPlZDY/qSbn2W7SQ3iZdRxJnX9TCqBcc9LccMLwk65HZr3r/RuOYDc4KX69+L8sjm2FjDjbi8PnEwkTwptpPqrJXUun9CfDQ4/GDU01WnmIc7pihEF0M2CQayTrJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZd6p1bSqHb56kpKojQpbw0Gj54WPqzjB+iKD8GN4HY=;
 b=mOX65gOPAKaLUHhfn8pHONV6iEHW9q72+mpvE0Fc0q1HoO6oa8F9SjU2T0tAEE2EQ7vO3wwc5sYjXVxFIaOWHMTC8aoqE+S4BMgMLAO1+VDbbvr3FIyB6g2+WfQhZcdvnzSDg/AHbLA+09vp1q5fskFGm2F7cj/SOMKSDjbRfz93LRiUjU1ZEwm0qB3RcF0n7Jpj+/kdNRh5FnFmSUiN1rd4gKpgYMYorA0PVJVCX1lnk+JMWDlDUGyy3+N7B7TjiQc2IIjDeO8AsTcWUwRYigl/sXHzG3+6IdLifV/6Fe4MgwIuzqAUlJn9voNrfCHlHzerWkhdRH0Y18c7LmXfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:39:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:39:35 +0000
Date: Thu, 20 Jun 2024 16:39:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 19/28] tests/intel/xe_oa: OA buffer mmap tests
Message-ID: <ZnS9tc7PNj9HqXEx@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-20-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-20-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR16CA0063.namprd16.prod.outlook.com
 (2603:10b6:907:1::40) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fac6677-abd3-4fed-c367-08dc91823dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWdtMm55Y0RqY2JrREhabHVPTzBVanNrTU9jZUs0M2V6TmJ4V2hQNk9pcWpz?=
 =?utf-8?B?YWU3NkNZL05GcGR1c21IMUNIYjlwZFNQNlFsUFRtS2RsVFBQOUx3VHZsb3o1?=
 =?utf-8?B?aEovM1czRC94WlpkK3BlcUwzVWgzRVUyUHM0SVg4eFgyWjF2M2puWWZ1Wjlh?=
 =?utf-8?B?TmtEb21NbmFqRmJkejIxZGRmTmF0UE9Xdmd5eFc4Yy9SdU5pOVJabU9yQWdF?=
 =?utf-8?B?dTZGU0FNdHI1dTVHRzBocDIrYUNsK3p6bmhIM2dqNTBrM0xUWVpGRWpLZ0xQ?=
 =?utf-8?B?OUpOa2o2M0FWazZFWUY2NFZMMyswUXBLaTlXN0ZyaFByZDUvME1tSERhK1hO?=
 =?utf-8?B?Uk5nbmFPbWJwUkNQcWE0eUtWZ0Y3S1kvelJFNE05WG5ueUlYOGtSYnh1ZFYr?=
 =?utf-8?B?OURQNVVRU1dQalpQKzNSVi91d1RHdVJ6VUNRQW9jbDhUQklnem1uYk84RkZG?=
 =?utf-8?B?VTN0dUFscitpWWNKUTFYQ2hsakFnT3AyR01TWWZwb2lPYWNKeGZkdWw5ZDQ3?=
 =?utf-8?B?ZXNWSDF2S3c5MnVGcFFCUGFYdmQzbG12c2pYdHRtZHJ5NFNFcXVURXJOVWxo?=
 =?utf-8?B?Yk9qN3lrSElvRDd1M3htSy81VVFMZjBsVXJMclRrU2dhMkFjU0g4Z3NNYVFZ?=
 =?utf-8?B?UHBXV24zMUc2UzQwWnhGZFNDSnBwd3BxZCthSnhpNi85eC9melVxSkVCUlV2?=
 =?utf-8?B?OHZnSHNoK1JGU09Jb2lTZVc5YlZ6MnNDdUdZSy9jd2FkZzM1M3FmaGtRd0hp?=
 =?utf-8?B?ZCtXQlI4U2RpK2J6L3hXTFhTWTVQbklZY3FTb0puWlJGdzN4Z3o1RWY3M3Bs?=
 =?utf-8?B?Y2VEYkdrcjFDMERTcVgwc2Y2KzlHcEJpck5GV2tRelNnQmIvZktUcTlmbW9Q?=
 =?utf-8?B?NWhSR1hjdSs1VnJKTlF0N20zZFNiVlozUHplZ2txeXRYUHYzdnZoTGcvakVo?=
 =?utf-8?B?SmxSbkk2YUJsUjJVUEJaTjJTQnMzMWx3c2c2ZTZ4emJWRDJMNE5DdzZ5RXJo?=
 =?utf-8?B?Ry8xb3JCdlBwWjBzTDFTNyttRjYvNGdtNGVkS3B1Y0VKdndtZVUxRDZIL2R4?=
 =?utf-8?B?dEMwT0Y2QkptZEFUbXFxQytpQTBUUzR6TU9JMDdTQ3ZVeFpoUFVPdkg3QlVZ?=
 =?utf-8?B?eVZibDlyRTRQQ0VyaHNMbUphWGdUUWU3QTEwOE5Na0FIRUhGNlk5Q0d0OEdh?=
 =?utf-8?B?MTlRS0U0ZEhSdmZsbUNzNjNiZlNwTXZJekNySytMNFVvazhCdTErVjJFRFhU?=
 =?utf-8?B?YURENWJOZGVlQkZlZys5d2JpSmJta1huc2g0NFV4b1ViQmtYT0RWYnR1M1Y1?=
 =?utf-8?B?YTF0MFFma25zL3dSbklmOHEzS0c0cThqK292QTJqWUdOVTdXeDlDTGx0WGl1?=
 =?utf-8?B?R05PSGI1UDA4cnoyZFNCRy9vajQrajQ2S0htN01yRUhLYlE4UURZU2RmV2xB?=
 =?utf-8?B?dVJDdlRESExtQlRNeGNjMU4zQ1dmTWJBRnZNSnNSN1VyWG9WTjBvZ3RqWXR6?=
 =?utf-8?B?Z1puM3RDbGRFd0F0MHQza2E5czU4WXBDYmdEWVR1TXM3SnZpSVlvRDgrZHQy?=
 =?utf-8?B?MnNYMEFYRjNkQVB3WHV1aHU1dVlGOHlxMEdwRmdNZEVVN0tpbjhjTmMwTUZ5?=
 =?utf-8?B?bE1GS3VZaEhoNndtZXdjV01FMDkrQWoyb01TVndzWnBLeHdCMDB5VmZHdGJ1?=
 =?utf-8?B?TmR0NEc1VzhHTk9uNDFVSEVDQ2duZHlRdllwaFFuZ3BTZ05uQVZIOGVKQnVZ?=
 =?utf-8?Q?CL+xx6ZxPYpYkWR60cejAOmAd6D25/XywuudYHM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTRlZmN1VEh2a1YreVZaNitEOUVTYnZaQUIrcER5RW9TS25FcThFemFHY0Nm?=
 =?utf-8?B?Q2o4b3Z0aXFCaXh3UktBTEtFZ0ZSMTFOa0pBWFJGck1VMHFFNnVMYTVrRGlH?=
 =?utf-8?B?d2RwSlhWUUxZSTdMbEhhYzlzNGZjWmhxamQ3WWkvTDJiUTdiMFFxL1NpYk9Q?=
 =?utf-8?B?MmNBLzRQMklQVmZkRGhISmRra3hsWWMvbFNrTG5ibTdBMnN2Wjh5b3R6T0cw?=
 =?utf-8?B?Y1dWQ2lUUmR3aXYzZU5VdlFwdnVvSldvRnJ5cXh5TEFlTkY0UjdObDNXVXMy?=
 =?utf-8?B?bzFzeVRPaUM4OWlMWkJ3VnBrbU9DYlYwUjFKMjRRZEdwdlNKVXlLSWtBdWJr?=
 =?utf-8?B?Q1VhblRWN1QwN2JQUExWOWM4SE9hMUZ3Q1ZPQUhoQTZRb1ZOa3A4ZU9iMkpP?=
 =?utf-8?B?bldQR1F3cm9HVUc3VDRlSlJFRTNTZlg0ZFNZbU02YUpqcHMzMXc3UGkzaDV2?=
 =?utf-8?B?dUE5QWdpR1ZBU0dvSTJ2Q1hNWXFka2pscGpYWExUcHZMZXptSU1pUFZvd1RD?=
 =?utf-8?B?dnI3Rk1RRmNjRWNFZ3M1WmhibkwwaEtmVDQzSDJJTXNLRXg0Y0RiTmJwTjdw?=
 =?utf-8?B?NE1PdE43bVdUckE0azNUS1RNbituSERJTDJhRHoxVXdBdXhMVk44VStpc3Rl?=
 =?utf-8?B?U05LTnhOUVd5TFdVamhiWEFyZk54bXhSekJRaGZpYXpBWi84aHFlR1hIOVJo?=
 =?utf-8?B?eUM3Z0hUdnFjOVlJWWdVZWlRRjZyamEyZTU3eDI4dzFiTGJxbHRWZ0RGWC9Q?=
 =?utf-8?B?Z3IvUmtTdnB0Sm1EU3R5cjlvSzVMZlcyWnZYOFNDRDk2cE16VVluOFRkZlhU?=
 =?utf-8?B?MU41YXlCOTVoMDA1U0hTUjFQVmpCWE1LZGtucUFYTC92b29BaGVCMjcrVmJY?=
 =?utf-8?B?SlZoZ005bkNibWJkV3Q5Tko3QmZYVUJEWWFKT2EyaXNDYjBQNXo0eVlRdXBa?=
 =?utf-8?B?aEtQZGdHOWY3NWxLNU9IMUtIMzcyNGowcHpJVVhTaXRqc09COXdJaktzQkw5?=
 =?utf-8?B?SUMxMU55U3NlQXRMY1cwV2YvckFWVTJnQitCeUttQ0JxMzdrUEwyS3VmOXNo?=
 =?utf-8?B?QzFNeUF3OGh2cTNEUHg2RUpHWmlFWk5jMlN3RzZMNmpNWHRpbUl0TnFXZ3FH?=
 =?utf-8?B?QUZFeERBK215YlVCdmtCVGlmUGd6UGN4SWN6bmNXNDB1U3BpK3FvR1NySVNS?=
 =?utf-8?B?WEVVNTMwY3FrdWxXeWp3bnIzcnhFZ0RCY053SjNkQ3k2UkVubGZrN2E3b05h?=
 =?utf-8?B?WDFVYWhFK1hXeGw5ZXVSSENSamZBMEp6bkpLeFRpUVFjRkFrYWtZNUk5Smwv?=
 =?utf-8?B?ZDE4Qk41QzFhNnpSQVhoMTh6ZkgxVzFZMDJJMW1HNmFkOXdOM1ZCNktOV3Iv?=
 =?utf-8?B?Q2JqN3M3TG1uVWNzNmF5SWxUL2FVa2ZlUVNJU2JjWUFzN1VPbGpVQ3VvQlJS?=
 =?utf-8?B?Z3VNSmx6WDB2ZWFXMkR0dmlKWU5tSFhqQ28zMytKeUlqVjR2WEhydnVjQVJV?=
 =?utf-8?B?R0x6MWp0TnpoS0JEeFpVcnkyQ0JZQkJ3b1VqUDhQYVNOM01jbVJLYU5VaXdm?=
 =?utf-8?B?MHJMR3hlQ1dpMmJYTFFkdjRLYmc5T0JnS0Q4WTdVT0ZZSForNXZjMlZ5dm92?=
 =?utf-8?B?SlBxQ1RCZlpic2dKZUNLclF4bDQrY3IvVSszcXNQeGVUbXpEVzJxc1N0clpz?=
 =?utf-8?B?WEFTdC9ZSFV4S1hwZTFKL2Yzc1l2MGViZ0dzbnliTWdMR255QkRlVTR2WWxx?=
 =?utf-8?B?cSt6LzJLQnpRNjZzNzNlSnpMTmhWV3dRQndRczExMjlqRG4yQ2MyTEIzS3Jh?=
 =?utf-8?B?MGdpUVB5UUkyMzJFdlc5TUUvTFllcjQvczk1WDhTVVAxVEttS1RYTzdaQ0px?=
 =?utf-8?B?bEN0Q3NKcnB0UEIyVTZiZHNGSGNWbTJVZEQvT0Rza1Z4blM3OUtCTFN4clRT?=
 =?utf-8?B?WUN1NzZkMzk0VWg4aWRydEYrZWc4ZEVxT3ZFWGpyZDFBZUNPcHluQ09kc2xj?=
 =?utf-8?B?ZVByYmp3WU8reDI3Rmx3OVBEOTY1V1UwQnY5K2Qvb0VSZ3RlMlhSVWRpUVV3?=
 =?utf-8?B?M3Jma2pSWEZJbmduOG1OSkNMdWZWUHNPc1pNWmZhUlVBTkZESFFSYjkvV0ZE?=
 =?utf-8?B?RTlEZ0FySjRROWNoY0lPeG52NHpsYkxFTElCSis4dDFKbHBzTDdBYkFPQm1N?=
 =?utf-8?Q?58Xrxj8NNBMYELpeI8DeIc4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fac6677-abd3-4fed-c367-08dc91823dfe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:39:35.3215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxWphW0Rm4kIjxUa9ayG2TLoy6WhIT/vQG0b9M28o9cS//vFSUvyknt350EyLBl655Akex1SkUNeGNleQ6JPw3qlnyFKIzpuniatzo90w8U=
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

On Thu, Jun 20, 2024 at 01:00:44PM -0700, Ashutosh Dixit wrote:
>Add the following tests:
>* "map-oa-buffer"
>* "invalid-map-oa-buffer"
>* "non-privileged-map-oa-buffer"
>* "non-privileged-access-vaddr"
>* "privileged-forked-access-vaddr"
>* "closed-fd-and-unmapped-access"
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 251 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 251 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 8e6de2db11..30d1ed329f 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4113,6 +4113,231 @@ test_oa_unit_concurrent_oa_buffer_read(void)
> 	igt_waitchildren();
> }
>
>+static void *map_oa_buffer(u32 *size)
>+{
>+	void *vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>+
>+	igt_assert(vaddr != NULL);
>+	*size = OA_BUFFER_SIZE;
>+	return vaddr;
>+}
>+
>+static void invalid_param_map_oa_buffer(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	void *oa_vaddr = NULL;
>+
>+	/* try a couple invalid mmaps */
>+	/* bad prots */
>+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_WRITE, MAP_PRIVATE, stream_fd, 0);
>+	igt_assert(oa_vaddr == MAP_FAILED);
>+
>+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_EXEC, MAP_PRIVATE, stream_fd, 0);
>+	igt_assert(oa_vaddr == MAP_FAILED);
>+
>+	/* bad MAPs */
>+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_SHARED, stream_fd, 0);
>+	igt_assert(oa_vaddr == MAP_FAILED);
>+
>+	/* bad size */
>+	oa_vaddr = mmap(0, OA_BUFFER_SIZE + 1, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>+	igt_assert(oa_vaddr == MAP_FAILED);
>+
>+	/* do the right thing */
>+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>+	igt_assert(oa_vaddr != MAP_FAILED && oa_vaddr != NULL);
>+
>+	munmap(oa_vaddr, OA_BUFFER_SIZE);
>+}
>+
>+static void unprivileged_try_to_map_oa_buffer(void)
>+{
>+	void *oa_vaddr;
>+
>+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>+	igt_assert(oa_vaddr == MAP_FAILED);
>+	igt_assert_eq(errno, EACCES);
>+}
>+
>+static void unprivileged_map_oa_buffer(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	igt_fork(child, 1) {
>+		igt_drop_root();
>+		unprivileged_try_to_map_oa_buffer();
>+	}
>+	igt_waitchildren();
>+}
>+
>+static jmp_buf jmp;
>+static void __attribute__((noreturn)) sigtrap(int sig)
>+{
>+	siglongjmp(jmp, sig);
>+}
>+
>+static void try_invalid_access(void *vaddr)
>+{
>+	sighandler_t old_sigsegv;
>+	uint32_t dummy;
>+
>+	old_sigsegv = signal(SIGSEGV, sigtrap);
>+	switch (sigsetjmp(jmp, SIGSEGV)) {
>+	case SIGSEGV:
>+		break;
>+	case 0:
>+		dummy = READ_ONCE(*((uint32_t *)vaddr + 1));
>+		(void) dummy;
>+	default:
>+		igt_assert(!"reached");
>+		break;
>+	}
>+	signal(SIGSEGV, old_sigsegv);
>+}
>+
>+static void map_oa_buffer_unprivilege_access(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	void *vaddr;
>+	uint32_t size;
>+
>+	vaddr = map_oa_buffer(&size);
>+
>+	igt_fork(child, 1) {
>+		igt_drop_root();
>+		try_invalid_access(vaddr);
>+	}
>+	igt_waitchildren();
>+
>+	munmap(vaddr, size);
>+}
>+
>+static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	void *vaddr;
>+	uint32_t size;
>+
>+	vaddr = map_oa_buffer(&size);
>+
>+	igt_fork(child, 1) {
>+		try_invalid_access(vaddr);
>+	}
>+	igt_waitchildren();
>+
>+	munmap(vaddr, size);
>+}
>+
>+static void check_reports(void *oa_vaddr, uint32_t oa_size,
>+			  const struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	uint64_t fmt = test_set->perf_oa_format;
>+	struct oa_format format = get_oa_format(fmt);
>+	size_t report_words = format.size >> 2;
>+	uint32_t *reports;
>+	uint32_t timer_reports = 0;
>+
>+	for (reports = (uint32_t *)oa_vaddr;
>+	     timer_reports < 20 && reports[0] && oa_timestamp(reports, fmt);
>+	     reports += report_words) {
>+		if (!oa_report_is_periodic(oa_exp_1_millisec, reports))
>+			continue;
>+
>+		timer_reports++;
>+		if (timer_reports >= 3)
>+			sanity_check_reports(reports - 2 * report_words,
>+					     reports - report_words, fmt);
>+	}
>+
>+	igt_assert(timer_reports >= 3);
>+}
>+
>+static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	void *vaddr;
>+	uint32_t size;
>+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
>+
>+	vaddr = map_oa_buffer(&size);
>+
>+	/* wait for approx 100 reports */
>+	usleep(100 * period_us);
>+	check_reports(vaddr, size, hwe);
>+
>+	munmap(vaddr, size);
>+}
>+
>+/**
>+ * SUBTEST: closed-fd-and-unmapped-access
>+ * Description: Unmap buffer, close fd and try to access
>+ */
>+static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	void *vaddr;
>+	uint32_t size;
>+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+	vaddr = map_oa_buffer(&size);
>+
>+	usleep(100 * period_us);
>+	check_reports(vaddr, size, hwe);
>+
>+	munmap(vaddr, size);
>+	__perf_close(stream_fd);
>+
>+	try_invalid_access(vaddr);
>+}
>+
>+/**
>+ * SUBTEST: map-oa-buffer
>+ * Description: Verify mapping of oa buffer
>+ *
>+ * SUBTEST: invalid-map-oa-buffer
>+ * Description: Verify invalid mappings of oa buffer
>+ *
>+ * SUBTEST: non-privileged-map-oa-buffer
>+ * Description: Verify if non-privileged user can map oa buffer
>+ *
>+ * SUBTEST: non-privileged-access-vaddr
>+ * Description: Verify if non-privileged user can map oa buffer
>+ *
>+ * SUBTEST: privileged-forked-access-vaddr
>+ * Description: Verify that forked access to mapped buffer fails
>+ */
>+typedef void (*map_oa_buffer_test_t)(const struct drm_xe_engine_class_instance *hwe);
>+static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
>+				  const struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+
>+	igt_assert(test_with_fd_open);
>+	test_with_fd_open(hwe);
>+
>+	__perf_close(stream_fd);
>+}
>+
> static const char *xe_engine_class_name(uint32_t engine_class)
> {
> 	switch (engine_class) {
>@@ -4312,6 +4537,32 @@ igt_main
> 	igt_subtest("whitelisted-registers-userspace-config")
> 		test_whitelisted_registers_userspace_config();
>
>+	igt_subtest_group {
>+		igt_subtest_with_dynamic("map-oa-buffer")
>+			__for_one_hwe_in_oag(hwe)
>+				test_mapped_oa_buffer(check_reports_from_mapped_buffer, hwe);
>+
>+		igt_subtest_with_dynamic("invalid-map-oa-buffer")
>+			__for_one_hwe_in_oag(hwe)
>+				test_mapped_oa_buffer(invalid_param_map_oa_buffer, hwe);
>+
>+		igt_subtest_with_dynamic("non-privileged-map-oa-buffer")
>+			__for_one_hwe_in_oag(hwe)
>+				test_mapped_oa_buffer(unprivileged_map_oa_buffer, hwe);
>+
>+		igt_subtest_with_dynamic("non-privileged-access-vaddr")
>+			__for_one_hwe_in_oag(hwe)
>+				test_mapped_oa_buffer(map_oa_buffer_unprivilege_access, hwe);
>+
>+		igt_subtest_with_dynamic("privileged-forked-access-vaddr")
>+			__for_one_hwe_in_oag(hwe)
>+				test_mapped_oa_buffer(map_oa_buffer_forked_access, hwe);
>+
>+		igt_subtest_with_dynamic("closed-fd-and-unmapped-access")
>+			__for_one_hwe_in_oag(hwe)
>+				closed_fd_and_unmapped_access(hwe);
>+	}
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>-- 
>2.41.0
>
