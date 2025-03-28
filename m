Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAA2C3600C
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 00:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E1410E01F;
	Fri, 28 Mar 2025 00:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdQOPGu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE3B10E01F
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 00:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743122662; x=1774658662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RhSHB+4mCN38qxJcnhPycZ2ZQBnjTmraLTMq1sKnWTI=;
 b=KdQOPGu3kNsvfqH6Hq9jojLibdwFqNayuYg5P2xzYyXqvqUEjgc0XJ8r
 Ng9XWOkeu6X/dgGPYDlvF7H844qxuvLIbH2HTGdvi4IeMzAT7yMbP0dQ2
 GflD/hCTLsn8E1zj3AaXe8T94xyTZkgm9lB2ity3LWQMXyWMSZISHyzSP
 oyj6NKHFY2GOGW5M29f66YsB0yCsD06JczMzvW2aW17lyfJpsH3aGVuXJ
 4TEMqm7uTXMZqVHyVaoI+VP7S5DxjmlQq7hH2qip1sAgHJe8SYVytwB/d
 UjLd4mVyI7zNFy+YeQ9N907Vnxnt8Vqi5oiKVoZrIT7jciM8G16ATZeFQ A==;
X-CSE-ConnectionGUID: 0v2FqKdUSReYgmiOTMWJ+g==
X-CSE-MsgGUID: yGjGsxmrTha2Kdm422kfig==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48135563"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="48135563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 17:44:21 -0700
X-CSE-ConnectionGUID: ARNaNMCgSAiqLiWq2lsVbQ==
X-CSE-MsgGUID: yYHSCZ94REihJwHGQxTF6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="130017343"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 17:44:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 17:44:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 17:44:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 17:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPXrxLFJbfkfcCesU2OpeBYxufM5PrRH3e/w/yl/q0wDuilFiUT0HOpFGvCymULLLOnvWygSwdFg+CBNOdBxlz0onWcIQRpiBL0R/gzp0ehqyUyLeonVtEJSRm0ogAJw4y4uVy8yFYxXt5GBAN5TPlLfhRb6gZD7r/SPjTW0q0nzzVsJjfPBlHmPQFaaP7tv6FAPornAger48RGgohPuX1zUPeEggGyYA990h0tTS3bloN5qKhtLgyCTBux9iYfIsuHFs+K4R7ba1GcYy0ZwCL9Qeky5jyP2GYDbL2OPrcAdN5P/vsvX7+jnXm0T9wi1STzgTlLTKDRY7nYIZUtnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5O2kluJL1R1dd78kw1Jfa2QNriTDSmvjpUWezAh3WY=;
 b=FRKHLrLnpXmkjZzSsBs5eFmwlGEJd/e4BSaXo/DGloZNEsyMhb2MMFzqxhK9bzusL2zQ2csAhu1lIjqLCr8Yhn0SsDAYHLMIG77dMgTaqKO8OcsZxt/xXreS9pl2qsTF/QVNzOQlRAyVL6UxXWTmDGnq8dCkDq0Zx6PSjYUrwwikEpSv0BKc4b6RWhAkNW5r57ReLpnoNWE/WDwkq1j3fbiadww6bX/7n0HlGOWzqARheCfYvhJCRzGqf+pC4DyLt42+/ufAGWf3suGGNJF9034nptGepAkTTOciIyR7QgIoEXOOUrzkFnoFelJETZU/+o9Kea1atUDZlDPwyLKevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH0PR11MB5904.namprd11.prod.outlook.com (2603:10b6:510:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Fri, 28 Mar
 2025 00:44:17 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 00:44:17 +0000
Date: Thu, 27 Mar 2025 17:44:14 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] tests/intel/xe_eu_stall: Add invalid input tests for
 EU stall sampling
Message-ID: <Z-Xw3oAQLRvW6Dph@intel.com>
References: <b11a8dcb7191270ac55a6ac4ddab89ed03a31f90.1743067979.git.harish.chegondi@intel.com>
 <87a596idfr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87a596idfr.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH0PR11MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a045c8-9bab-4758-f033-08dd6d91abb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm9leUM4dEF2TVlYVnpQZXRYbGsvVW1Ia3VkcURtMTdXMDNrS3E1RlpsT2Q1?=
 =?utf-8?B?UEJnSis2M2JqTWhRc0JQV0NVUlg5eldrZm4xbVkvbDlUajJWWnpWVENwcVha?=
 =?utf-8?B?TGZWMEVEWEV0SnVLSUZobnVnQnNlS2xsQ05NRFZLTk5DSktJVVFGTERaazNa?=
 =?utf-8?B?MFgwTGVIUWYxcC94WkQ1Z0NRa1duL3JVWE81KytsTHZINmpJMnFJYWo0cGI0?=
 =?utf-8?B?YTFRUjU5cU1nYmh3Ymx4eTBPUnh3OFNZa3F5VFEvN0c3czdtQWZoTm9OUHBm?=
 =?utf-8?B?TUMvRERONmJ0Ukd6TmREVjB1a2VtTitYdnE2emtMM0JyMXJDMnRqRkw2aFpR?=
 =?utf-8?B?d01uZWpqbjBTd2IrWWJLc0dFcnBqN0JLSURLdkxhTWtYSFpiWkxLcUJFNEha?=
 =?utf-8?B?TkZaN3BuWEtoUkRiOWVJeDRUMzZhNWRPaVd5c1lpOC9XdmgvcmJ0aEtlWktQ?=
 =?utf-8?B?ZTNRbXh2aExITkZ3bzZ0VmpOL0RSUERHS2NmeVV0QlNiWlgzNnhhcWErNTFR?=
 =?utf-8?B?L2p3NUtwbklmejRhOXVHd0sxV2MyQTNHQnp6NnJYeDV0U0JGdTR1U1dFT0w1?=
 =?utf-8?B?bHRHbEVpSDJ2MC9mTUNibFBRbXVsK3RxVGJNZ29WWjhMZTdwQkhTenRsUlVZ?=
 =?utf-8?B?TEowSVVoR3N4UmRaZ1J2UnRuUjRPZi9paVRhSkFLcXBGS1pZTHFXbytmVlhy?=
 =?utf-8?B?emFWRUpiMzNIdStpVmlCc0RZcmpMMm4zTXBEVCtldXRaWVFwMW9Ha2pLZDFC?=
 =?utf-8?B?amxMSzc1WGpNck50d2ozWHh4THFKU3IzSlAzTFdzT1JRUXdMcnY0Tnc4OGFh?=
 =?utf-8?B?Y09NZHAxWVFHWUk3WUpHUzg4bGFFT1VyTVVkRzJpeXA4a041TUw0WWoxQ0dU?=
 =?utf-8?B?RjBGT2tkWko2c0d1QnNzN0ZJaHBtc203QmlvbW9xSjlqS0M1dzV6NHJVL01B?=
 =?utf-8?B?TG14Wm8wYmdybnNORWhOQVZvajVTSVFORW5PYk5MUG1RMExmZS9jYzJOQUww?=
 =?utf-8?B?SS96MXZIdWNtZUFNSGtpSmJVdW5PZ2JhRnZpZGJ0d2FoU0VqTGVGc2hrNmxy?=
 =?utf-8?B?V3d3bUppckp3dnJuUU9KME1OWEhOZjhFd1B3NE5uc2krWHpaV3ZPVEZXRStZ?=
 =?utf-8?B?bjJOOXo1c05QZkk1UjE0bVhMdno2eWI1aC9UVnNlMVlyeVFaSWIyQ0tGZ0s4?=
 =?utf-8?B?K0xBRXQ0ekRNYlY0ck9NTjR4YXQzV2tVUW5IWHE2YjRXbWtmRllSZHZPQXBN?=
 =?utf-8?B?MmpsOFo0QUFDYjNqc3JYRU1uL0JQdmh2QUpmNlowWWNha3ZINkVkZzltOVpK?=
 =?utf-8?B?UjIxSm9VZXRWL0VNejZINm1INUtTWWZsRVdPdVMvcWYySndNMGtsQS9VeU1G?=
 =?utf-8?B?ZzRGNnpjaXFLZ1lvTVU1Z0hUd2FZNWprMUIwQVdidHFLa1dSV2JTWFNBd3Ba?=
 =?utf-8?B?TkFiME1aNDcvTzYzVzZHMkpBM2F1WS96Z3lBZFE1YnYzeTFNZlZGdkRlTGdx?=
 =?utf-8?B?clFVWUlPeDlTQmVFM3V4d21DK3ZrQVQ0T0FNK1d2VDU3dmh3c0Nnd3cvYTI3?=
 =?utf-8?B?cVFwQk01M0VxNVlBY1lzRTEzMDR3QW02aXpXQ3RZR09Td04rUWZwOXI0YWx3?=
 =?utf-8?B?V1Y1bUxUbzJ4SEsvSC9xb2lvWEtlVDhIdUtJTk04WmhXbTFHY3R0MXUxbWt6?=
 =?utf-8?B?VWtkcW9SdlkzNXJwdTZrYVEyM1JpcVNOem4yN0JMdE1pV1k5bmFZWGxWNHQ5?=
 =?utf-8?B?SVBTS3RSMUpnOFpaNklkMmR6Qm8rTEQyU0dmNUQzaE9vcGhUUGVXVDFYN3Yr?=
 =?utf-8?B?SnhlSWlUSyt4NGdiMVFWN3hadkRqamNEY2FHK2NPTHNhMC81Kys1emlqV3Vh?=
 =?utf-8?Q?2OW6O3er9ZA1g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFZVcFVUUTBlYkFPelZwNkJxM2ZyTTN6ZnZIQUpzYzJibzFNRW1QVjdJVjRN?=
 =?utf-8?B?ZEs0MllQZCs0SUJtZ3U3Q2ZhbmViMUlGeVg0ZlFiVmpxZ1pIOXJNditUM3VE?=
 =?utf-8?B?TDNtNmRoeHVzQ1RPblRTVStGV3lJdEt0N2tzeXhVSXJmQ0x1d0g5Wm0vWWNQ?=
 =?utf-8?B?OERMMEF5STBUWWxGM2lkV052VXNId2YySW4rV1pUMnZqdW8xaVVSaUI4V0lB?=
 =?utf-8?B?U1k0MDQ1TDAzUFpBdEVlOCtGdW9CRVVWUEVMUFlyZ3ZwNDdvdzlDSno2SUhR?=
 =?utf-8?B?YlFqZmg4MHhSNXFPblkzNjlPa1FUSkdaRWFaTEVDclhiZ2tOamtieXhmNDI1?=
 =?utf-8?B?WkJwaVdHMGR0M2JKYWpOS25vL08wN0ZEeHpwRldxTjBnS0xGSnRsWmM2VmY2?=
 =?utf-8?B?eXNaYnNMOXZYcEcxR3NjWTlNKzk3UXNOSngwbGR1VUFHcllhMk5jMmY1dC8x?=
 =?utf-8?B?Tk51djUyeGVYSTA4dEVmcThFL3ZReFdGUmhnWVRkS1cxMkxJUFAxQjJyblB2?=
 =?utf-8?B?cDJlcWptN2N0SDVDOU03VXM1ZmlmTit5c2x6LzBtWG5aUUg0NWVGdzIxY1dp?=
 =?utf-8?B?UTAxd1Frbys4K3ptMEtvU3VxaUNTbUJvWWhSUzA5ZndybWJUUy9kWmtCbmlY?=
 =?utf-8?B?a2pyMU1vUGhLYU9BTStBbUFJYVFYc2lGUXoyK3AvaEpLQkhsemJFTkFIc2Ez?=
 =?utf-8?B?SkNLMWJGcDdQV3IzdDRCQ29TZnZpTS9vRFlBTm5tWTUrMHNub1ZNZ2U3N3Nr?=
 =?utf-8?B?SzZTMlBxRXZtb054SXNNYkJ2UGhqNE1RYlNhZ3VUMGpSbERpT2xtOEQvS0w0?=
 =?utf-8?B?cHg0cUNxK3BxaGVYR2dyOVplc1hOb2xEZStraVlNOGFSNzlIRU0vUkZHZU4w?=
 =?utf-8?B?c0E0Q1RTK1RyamNHN0NhQ2lHcnZzQWhmNmpLdTZhNmg0V3BkbXdvSU1hU3Rk?=
 =?utf-8?B?UG85UXBVSnFkeXJnSWhKaGk1YWwvYU96cWdJdXdUN3Z6NmM1QWVqK3JEbmgy?=
 =?utf-8?B?WmxGczRZUFZRQ1B5djZ3cjd5TlpYd3FJOUZnNGFjck80V01nSjVLQ0J3TE1C?=
 =?utf-8?B?bDA0V210QnhVcEtYU0YwVUcwaTNaa292NlV3cDZHTGtyNTZ3TjRMVlIzWmRH?=
 =?utf-8?B?VUFDS285b1V5aXRpUk1yTTFVYmxkTHpOZE9QbWlFdGFGM2RQSDgvakpUcW0r?=
 =?utf-8?B?N3VvNW50NHc1eE1ORlRWM3EzUERrTkVDbHYvMi85OFd0aU8zM0tFZ3VZay9y?=
 =?utf-8?B?K0ZRdVRTUytDUGt3T3Erdk1PekplYzVHeFdBVC9DdW15aFJlN3BJZnFTb1ov?=
 =?utf-8?B?N0RoYlFJL1lOQzZGKzk5K3FIRm5jQ3RYdnBBdXI4VzZEaEluQ3BNWkVsMjMz?=
 =?utf-8?B?WWRYZnRlMmtKUStvbzBPdVY0dEVJMzkzaktEaGh3ZWQwQ0ZNYWFIeUVDcUtK?=
 =?utf-8?B?RDFnQVNBK1hIV2lmekhaU2RJL2RpcXNSYVRSL3A3SlhXWHl4amVJamVOUk5l?=
 =?utf-8?B?aWVsSHJJRURnaWlaWktZdVFFWEhwK2Q3Z2ZBN2VDaXI5ejlHcTg2RDBSUjdD?=
 =?utf-8?B?ZklNQXQ4RWcycittcWF5QTg2bDR6Z3Q4M0VMZzBialpHbUlKelZrSmhxY3M2?=
 =?utf-8?B?Wks1bzM2T0V0QkwxUGZLbDNUTGt6RVVNMnlta09PdU1zemNaVlhGT2E5VG4z?=
 =?utf-8?B?TG9rQ0VtdTZhQW9RWTRXY3VTVkVtQjNDSlhrQldpQWU5Z2U4d0ZMTnVRQWZD?=
 =?utf-8?B?THJ3TjVjd2tLRXdVbTNvMUV0RW85cngzUHhWWVo1cHJhUE5kS1Vjd21pb0dH?=
 =?utf-8?B?Z0d0bnExeVMrbWs2T1BwSGgwWm1vWWFnK3F0bGZsckdINWlqc3ZHTEhxSFlL?=
 =?utf-8?B?elhybVV5SDRVWHV1R1RibzM4M0xxYXNTd2hlNlJrLyt2VkNCdHNZUjI0N3lz?=
 =?utf-8?B?SjAwckllTGlvZktJYTU3dmtkK2NCZWxBTFJpV0g1RDFKb1lVMDRXZEZoVWRI?=
 =?utf-8?B?WWtFcUpTZW5ReUpjY1lTZGIzblI1SThuUGcyS3ZnWjRqVkVYdjdPK2JrU1Zy?=
 =?utf-8?B?RmU3WlgxaDJnYm5DVkEvNEZ2QVdXUC94TkdJQ1p6eWJjMWw0NmpPQkR5K0lz?=
 =?utf-8?B?ek5PQTRyZ0xRWVVVMUZyWEplRFIyaWdJb0luTGJvSWtIMm5haE9wYUJDL1k0?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a045c8-9bab-4758-f033-08dd6d91abb9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 00:44:17.7060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xG9vQP9TTap/neQc32hNWpufNiezVvpSX/wzp80/iXmqLn08RarrwcZx5LRxAj3UMqUVCshNNy9DrLbFxsLBn8YkBPABXgz4cPf86JIa94c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5904
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

On Thu, Mar 27, 2025 at 10:35:52AM -0700, Dixit, Ashutosh wrote:
> On Thu, 27 Mar 2025 02:35:10 -0700, Harish Chegondi wrote:
> >
> > Add tests to verify that invalid inputs fail the tests
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  tests/intel/xe_eu_stall.c | 64 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > index 964bb7c91..8f892a9ae 100644
> > --- a/tests/intel/xe_eu_stall.c
> > +++ b/tests/intel/xe_eu_stall.c
> > @@ -19,6 +19,15 @@
> >   *
> >   * SUBTEST: unprivileged-access
> >   * Description: Verify unprivileged open of a EU stall data stream fd
> > + *
> > + * SUBTEST: invalid-gt-id
> > + * Description: Verify that invalid input GT ID fails the test
> > + *
> > + * SUBTEST: invalid-sampling-rate
> > + * Description: Verify that invalid input sampling rate fails the test
> > + *
> > + * SUBTEST: invalid-event-report-count
> > + * Description: Verify that invalid input event report count fails the test
> >   */
> >
> >  #include <fcntl.h>
> > @@ -33,6 +42,9 @@
> >
> >  #define OBSERVATION_PARANOID	"/proc/sys/dev/xe/observation_paranoid"
> >
> > +#define NUM_DATA_ROWS(SIZE)	((SIZE) >> 6)
> 
> What is SIZE?
SIZE is buffer size.
> 
> > +
> > +#define MAX_SUBSLICES		64
> 
> What is a SUBSLICE? Is it a XeCore?
Yes, I will change it to XECORE in the next version of the patch.
> 
> >  #define NUM_ITERS_GPGPU_FILL	100
> >  #define DEFAULT_NUM_REPORTS	1
> >  #define DEFAULT_SAMPLE_RATE	(251 * 4)
> > @@ -283,6 +295,46 @@ static void set_fd_flags(int fd, int flags)
> >	igt_assert_eq(0, fcntl(fd, F_SETFL, old | flags));
> >  }
> >
> > +/*
> > + * Verify that tests with invalid arguments fail.
> > + */
> > +static void test_invalid_arguments(int drm_fd, uint8_t gt_id, uint32_t rate, uint32_t num_reports)
> > +{
> > +	uint64_t properties[] = {
> > +		DRM_XE_EU_STALL_PROP_GT_ID, gt_id,
> > +		DRM_XE_EU_STALL_PROP_SAMPLE_RATE, rate,
> > +		DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, num_reports,
> > +	};
> > +
> > +	struct xe_eu_stall_open_prop props = {
> > +		.num_properties = ARRAY_SIZE(properties) / 2,
> > +		.properties_ptr = to_user_pointer(properties),
> > +	};
> > +
> > +	xe_eu_stall_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props, EINVAL);
> > +}
> > +
> > +static void test_invalid_gt_id(int fd)
> > +{
> > +	test_invalid_arguments(fd, 255,
> > +				   DEFAULT_SAMPLE_RATE,
> > +				   DEFAULT_NUM_REPORTS);
> > +}
> > +
> > +static void test_invalid_sampling_rate(int fd)
> > +{
> > +	test_invalid_arguments(fd, p_gt_id,
> 
> Instead of using p_gt_id, maybe just use 0 here. Sometime p_* are used,
> sometimes DEFAUL_* are used, it's annoying.
Sure, I will change it to 0 in the next version.
> 
> For example, at the top of the file where the global's are defined, why is
> p_rate not assigned to DEFAULT_SAMPLE_RATE?
I didn't assign DEFAULT_SAMPLE_RATE to p_rate in the definition as I
wanted to know if the user passed any input sampling rate which will be
set to p_rate. If p_rate is zero, it means the user didn't pass any
input sampling rate.
> 
> > +				   (251 * 10),
> > +				   DEFAULT_NUM_REPORTS);
> > +}
> > +
> > +static void test_invalid_event_report_count(int fd)
> > +{
> > +	test_invalid_arguments(fd, p_gt_id,
> > +				   DEFAULT_SAMPLE_RATE,
> > +				   (NUM_DATA_ROWS(512 * 1024) * MAX_SUBSLICES) + 1);
> 
> Also the indentation is off. Things should be aligned to the opening '('.
Will change it in the next version. I tried to align all the input
properties.
> 
> > +}
> > +
> >  static inline void enable_paranoid(void)
> >  {
> >	write_u64_file(OBSERVATION_PARANOID, 1);
> > @@ -615,6 +667,18 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> >	igt_subtest("unprivileged-access")
> >		test_non_privileged_access(drm_fd);
> >
> > +	igt_describe("Verify that invalid input GT ID fails the test");
> > +	igt_subtest("invalid-gt-id")
> > +		test_invalid_gt_id(drm_fd);
> > +
> > +	igt_describe("Verify that invalid input sampling rate fails the test");
> > +	igt_subtest("invalid-sampling-rate")
> > +		test_invalid_sampling_rate(drm_fd);
> > +
> > +	igt_describe("Verify that invalid input event report count fails the test");
> > +	igt_subtest("invalid-event-report-count")
> > +		test_invalid_event_report_count(drm_fd);
> > +
> >	igt_fixture {
> >		if (output)
> >			fclose(output);
> > --
> > 2.48.1
> >

Thank You
Harish.
