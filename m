Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0EFD2629F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292BB10E678;
	Wed, 21 Jan 2026 02:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5+mcBT5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DCE10E678
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768961539; x=1800497539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DiRQO3kz6BWCWyDVRFKeentlVIHDIUVun8V5O+cACuQ=;
 b=C5+mcBT5xVYEILBYM7j4b3k1s1tukqMFeIklaPnG9NRmJeMCw8FRbM9f
 ZWfX2VRL1KHGX2NYCR1YO4FH5OtSEZuWO4rkd7YPccUXnp9UpFeZNPZsT
 Tv4C0+RTQ6eIZFaRtcbB35pC8qCV6fc/5FPObpUWoO5fhyY7Srk3KAQ/d
 68A4FQoQBvkRkG0j9A2k4RhftZ9t1Gk2maFL6zroPsogw1FBM0q/7hPLV
 PU5ebVym1rkbXk1466KiL3wfcONm/pOBG3BQ7hfZiqPilSGLpyQapOz/f
 hITI8FDlDvOlcAwcRYYac21HZTP7bKxPhYaS/QuREcJKeLbjJT88iQE5c w==;
X-CSE-ConnectionGUID: MJ51Q0QqSkeONMxOi4Z1iQ==
X-CSE-MsgGUID: n1R9XLzvStSDK8yNZkKatA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87597482"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="87597482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:12:19 -0800
X-CSE-ConnectionGUID: DtL8BPgdTpSKlOPUyKVoRg==
X-CSE-MsgGUID: iKv6JcumRompSq1ydccdIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206337765"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:12:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:12:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:12:18 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:12:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNNK2zH1LldKPvem5xu3KHzWadrJ8AP6ZymRb+JRG/Q/UMCfDvk4h+hdMEWOWAwIqcVzB2klmC5On+8EOm0cAl73Qx4U6UJNPfGHtgFJIzmrbUIV6QkyL3Cgj7S57JR4uVhmvIIBxNAN7bgbwNppTlN9+RfkLywwp7Y0ynP6awvTLSy6/aQqCEOv6bwenc70JkVqUjmJbpVsP6LxWvhL59lzKsRl2D0EH9fZUh8uSPspFNPJi1zAbzJGTqXwJVuGhuHL/MQJGJWn1xdKTVLOskAYDVob5e7RYtzLEoEGv8PMMR7v6llHbWBfg/RhW6xn19+v+6TAocpvmySIWnYQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gGAWGnhjqf7+EAIUvzBC69amUyR3uxoECGwJEiWKUw=;
 b=qbLjgZGhw6khWdbLbb3ddDrpTPCvZJvO1vPhBeC9W3hLirtCobFIwYUOhohDcWq+2ZfqFl3jI2ev8M7UaGS3UiD7sLrKRmrZW2rZPomUJvMsayO9JqpHBVNPObPmNxwNKQizQdfAvpw6c6XHYvbU5fV/yX9URl9kv2jSqW8IodkbrKB3xiNoI8/WPgMc+HaprPtZkyoxS/EoaKRBZOBEYIpMg0Lp4dxcsaCwnufvIxhFBo8PZX11lohBlBYFNyZbTAdISTROARghSXEz6vJJZMWXajUEeuUtzWsYews/E1F7VGWdEmU05zGnZWw8iHd3bY7zoiItKxTuWZYPc0F1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Wed, 21 Jan
 2026 02:12:15 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 02:12:15 +0000
Date: Tue, 20 Jan 2026 18:12:11 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH i-g-t 2/9] tests/intel/xe_evict: Add basic multi-queue test
Message-ID: <aXA1-ySkVsXB6eYd@nvishwa1-desk>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
 <20260114065925.197958-3-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260114065925.197958-3-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::29) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e4e448-6a0d-4b76-81b1-08de58927ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+6vsBagAWfV+CYBAsO9fBXyRQ/7y8x3QqfM2foN9fBp/nE2IlfKMcaiQTUYk?=
 =?us-ascii?Q?HmUN2Di9S99N9LJvCD9ej1grq64325NWNGqPgM06aoUnoCue8CaNVqHrAuVC?=
 =?us-ascii?Q?RV9KJhIHj1oF1qSFxr6051+BCh33T2BBnakIjDqC3aV50QmJ0BosGpDBH6HI?=
 =?us-ascii?Q?CVrsXGd0IvlGJEACw8M6k7U1OBtk3knFSRwJ1Acls/MZRm2jQd7a3ymeJLiX?=
 =?us-ascii?Q?TyDPxD0BxYNzao5BC5jBy4LcCh0s11EYNRRs9hDicjiqKPN2gtzULV1GxX/B?=
 =?us-ascii?Q?4x9zAtfK0xLbaydfJkxldv+5cv4+7TBwkWQDT2IIwPYh0CdlMsk+H16Kdust?=
 =?us-ascii?Q?JgUReAeDUvD+cDSKEsa3gHWUcJqFfHTr7nfBHiz1hGgaLaESBNhMb18H9xZL?=
 =?us-ascii?Q?nYJ/i1rzcP+n4EAydeBNpaD/KSOc675JLcgxFg2/aVZt1y6dmtfw2cu0Zjz1?=
 =?us-ascii?Q?XKXDF2uaVUcncb0fdmotQ/ZnXw5YM8CHoU36Fd/zCGRtHMtQoly/ncKfFAYd?=
 =?us-ascii?Q?fGpo0Q3LWRdJsVldhaJdyPEg2cb6TYANNNfo9ORW6H0JACxq1VmTyyU8Sg98?=
 =?us-ascii?Q?2ZCallcu0KhOAcPmg+BCZRxpCDLMDHvpKYzH+NIqit8ZqHEuMNvqdTSEheLG?=
 =?us-ascii?Q?6AbKeGCzXYFNPFIOr7YLp/B5ZhnBdw/9Xx75flBHTp5BpVDzQiv9YWctw1gY?=
 =?us-ascii?Q?4TF+piXYkTtX0ljl+pNUw0GzfQxKMl/Wo9/2YFmMLkanHJ5PVl7mi1NV8Pdi?=
 =?us-ascii?Q?rX/8xga85DZ4ax3ogbROf2hhb0emL08c7j2tCZnUcvaRPWo2KtKBcDkVUW9e?=
 =?us-ascii?Q?RO3LmMqneyzS0gh3MjZ+RWNJCqcFn62r7TrvgFd4VV+GNv8nOBRwrNh/sn6o?=
 =?us-ascii?Q?EjG+79xg0QSY/pT8Ey5vdbPQlTVXgxg1xLgOtxaBra3rsMOcIZbaitI5PS4u?=
 =?us-ascii?Q?q6lUv8J4SdeTuugkXds0qC5NHf+Ot3rXveOL+JeS/67/1yIkAWQQhMzD3yWS?=
 =?us-ascii?Q?lKV1DvPxfAM6TJ0Zi5sbZ3aASI4dxowYdGQnDEvnERtB78dA/1/UgMxegRhU?=
 =?us-ascii?Q?Nc7suwuelIC/rfB676ch32jkW3sUszOnO41AbvACqoCZGrBYHmR+MLROsO4B?=
 =?us-ascii?Q?0/fp2fveODY8x/nxzRuwgoJgA1xj48Uka50qHLUEsjhkDK/YQpQ6HFdvvYvy?=
 =?us-ascii?Q?MLgZ2E0pS/kqMxARx/Ylq4bYSXbb3Dfw7tCeIgCHQlxWFpy+LEqqHMVTjC0h?=
 =?us-ascii?Q?cIfqLwYecbW3Z8ftfWWfBmmy/ykS24y2n1XleXJY4mQogfKR5opsqsLcndCA?=
 =?us-ascii?Q?pCxQL4HF5nZnc0zMYuKOM573QGNXhI60qBCUDQpDYWxVdmi8IP9amzsM798i?=
 =?us-ascii?Q?kFnIM+kUhiWR3DklXG8uUdabu80Crmzsd/khvnUdYMTAQ9LvVkwPC68Zdc8b?=
 =?us-ascii?Q?wzvLs5UthkM8PqgTkN2CNAR681TG6GkyFr4SVQE/o9Yr9NzztCFCCBRwWpXs?=
 =?us-ascii?Q?MB3UxfS/lq28OlSHBxTTRKEnAN60r2RGqLpg6PUWJ7+l6mrAjcbD3AWahxzR?=
 =?us-ascii?Q?pQ/dRDNl6Yc6fcRmsh0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KumJjFs/1zG5Dkd6o1uVOEGN09xHAaXWgJwsgc+j7RfRaSEd1d8naky/NZQQ?=
 =?us-ascii?Q?EFS1ykBgmoI3IQVADt47RSbFLLzTrCDMtCE44m9G0X41UFKnFB1OxLppAKvv?=
 =?us-ascii?Q?b+VCjd4ttnyT4jc2gSH4qf7y09Tp7cJOX4ggCjBrSJFUEjR65iHq0RkkF7tl?=
 =?us-ascii?Q?t4HLKm1Nhxl0xfLUra2dLESFwT6FBliH76E/4Ju4oKXDQDl8h8dREfFv7+te?=
 =?us-ascii?Q?7OWiQQD3VbYZ+GgugJ9cV9mw1QfvBZLtBA8PxnMZJxOAPwe9Rpj8EKjzfFd/?=
 =?us-ascii?Q?TzqsX3s3cbTBfpvEtjRTJaptMShR5hYUQ70IX3LGo8t24jr5+Orc+n6caGxA?=
 =?us-ascii?Q?DQ8YrbjDK+4KfFghIY3xiEgXmNYg+nHCA2IbfeQ2HrT+0Bxk+pGeRuYl7bVj?=
 =?us-ascii?Q?y9LQ5WMw77Y5pmAxCm7PobAcUF0EpLs8LJsQGCSeZkLCvH23sX4JnV9VC71T?=
 =?us-ascii?Q?ig99rtrOxYJhkzUshmjvMeWEQeZ2+e07Q8qKDW2P5i5/O0iNNXbojHWuvV65?=
 =?us-ascii?Q?My3Z2ZpbYkwm5yO5Z30JcqgBMB/l4RwT/QoKrBEF8Xgvl/wsSh2iRiwiw84d?=
 =?us-ascii?Q?Orzre977dTFRCA8qJBRS1DApd9V73C3A4892xJoYGFwZ4Hz9hbjNlQncxjAL?=
 =?us-ascii?Q?bZjV3oHfzYaVKVb6HdcOBB48v+xrvuclTGKe5UpFWtGsGtwokQIYw8Ct3BXp?=
 =?us-ascii?Q?p5xLbULdcDTD9bbsh23hhIx4PQ8Xz6J9p4F/2QcXi+NkKpN1m7nWWgCVLQ99?=
 =?us-ascii?Q?FtWQpBUHujKD4eOlRfVBqpK5SLAsKSiKLGOxHvrhQ8r7xBNY6wMEtNlsTKpt?=
 =?us-ascii?Q?DsmtGidh3NkBYqEEoill5B7MVifQGsUFWON0RLKFK7ue0uaS25WAMznm4po1?=
 =?us-ascii?Q?vGX/wmJPqHk75EFaaHpfPkM34H2nw11DYAT2jg5K6bYhpfFdAyMU+UslGVwW?=
 =?us-ascii?Q?nk4Em0VgT1+n5+F9W+CkzMI43r1/4Wpw35vwu/MDxGNTdNqTCanXlPOkgTvd?=
 =?us-ascii?Q?Kp92ITkaUgOPVaicgKWQYDuEavqATuturI5PJUUe1HbOFtTs6g9RUa/Eo8g2?=
 =?us-ascii?Q?uRLClL91MqqKSCZbM2ikxQrsCHOzRbnwDvhdR3eJKkQJpCBkPJEcf79DVV+c?=
 =?us-ascii?Q?s8O4nGICwzBCoIdmMoBzbidTlbF3gV2TkbjxsvFHh6TMM6oz877DMLNfBOGI?=
 =?us-ascii?Q?CJjOzuCE4CPCMOWNQUbru+R6hkd4l4SdiughODkLIUSXzjwPHGwZty6c4aZp?=
 =?us-ascii?Q?26yBbGLGgGnyVfY00GpXg8VKi9esQ3cKpxX+59qTqw5xg2Fj3rOyLoPryXLZ?=
 =?us-ascii?Q?eVKx3YTfqCqDffIpO+RuEq+BMELy/X0HnZxvGiIVgcdVABE2Wfusi6TGAVMD?=
 =?us-ascii?Q?7liqkqCdadEEyPSGOwmr2HfwndSzURghcQf/ttTtpA2rKyUSq/Km9/FX2Z13?=
 =?us-ascii?Q?G3BSLS9Q/j3Aw8owfeEUchtzfRxDwWUpjeZ6VbUNLjZilXkk0URdVpgzeqFM?=
 =?us-ascii?Q?OstgaeK8k8s21qIlPVcraY7CP0wfYcf27ddGpFp5ahWaJ9cbDqP3+haVbqta?=
 =?us-ascii?Q?aAME0CQjEJ2HyRLFDg3xu38tJv245EbuQqc6j6jpuZZ5so99Y4V6wsJsI+iA?=
 =?us-ascii?Q?1ll017w3rwCv+ovrkkDBgAg8K1mZNY0zWpKH4PhElEEYmSQY5+krkUDwF/HI?=
 =?us-ascii?Q?Kr7+O72hiILgrGJ26unz+oQRQMzLSWS/8RVj8Yzam2GW8TfiE5MV3C19wG3A?=
 =?us-ascii?Q?IgkxumMcX9gTbqUlixCZQB7OELBLtAmeGlH6GgfpOEVgMRk49YjV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e4e448-6a0d-4b76-81b1-08de58927ed2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:12:15.0885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8XMNAE/LoZQG6IjmrHVoSUt8Pz03RkZ9ZWO9zGSAxBuwy/ANWfjNm2RQXCbMYKp0+eQTrLmSCBHI7e/eXh4RHiK7VmVpD/nhiIFMhoKbH9OAZKoZ0/gtmj+8zPiNZUS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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

On Wed, Jan 14, 2026 at 12:29:18PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Added basic multi-queue test for small buffer objects.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_evict.c | 62 +++++++++++++++++++++++++++++++++++-------
> 1 file changed, 52 insertions(+), 10 deletions(-)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index 2350487c8..bcf13b8cf 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -29,6 +29,7 @@
> #define COMPUTE_THREAD		(0x1 << 4)
> #define EXTERNAL_OBJ		(0x1 << 5)
> #define BIND_EXEC_QUEUE		(0x1 << 6)
>+#define MULTI_QUEUE		(0x1 << 7)
>
> static void
> test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>@@ -80,7 +81,18 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> 		if (flags & MULTI_VM)
> 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm ,
> 						      eci, 0);
>-		else
>+		else if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>+							     ext, &exec_queues[i]), 0);
>+		} else
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 		syncobjs[i] = syncobj_create(fd, 0);
> 	};
>@@ -259,7 +271,18 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
> 		if (flags & MULTI_VM)
> 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 :
> 							      vm, eci, 0);
>-		else
>+		else if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>+							     ext, &exec_queues[i]), 0);
>+		} else
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 	}
>
>@@ -516,6 +539,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @small:			small
>+ * @small-multi-queue:		small multi queue
>  * @small-external:		small external
>  * @small-multi-vm:		small multi VM
>  * @beng-small:			small bind exec_queue
>@@ -546,6 +570,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @small-cm:			small compute machine
>+ * @small-multi-queue-cm:	small multi queue compute machine
>  * @small-external-cm:		small external compute machine
>  * @small-multi-vm-cm:		small multi VM compute machine
>  * @beng-small-cm:		small bind exec_queue compute machine
>@@ -678,7 +703,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  */
> int igt_main()
> {
>-	struct drm_xe_engine_class_instance *hwe;
>+	struct drm_xe_engine_class_instance *hwe, *multi_queue_hwe = NULL;
> 	const struct section {
> 		const char *name;
> 		int n_exec_queues;
>@@ -688,6 +713,7 @@ int igt_main()
> 		unsigned int flags;
> 	} sections[] = {
> 		{ "small", 16, 448, 1, 128, 0 },
>+		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
> 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large", 4, 16, 1, 4, 0 },
>@@ -713,6 +739,7 @@ int igt_main()
> 		unsigned int flags;
> 	} sections_cm[] = {
> 		{ "small-cm", 16, 448, 1, 128, 0 },
>+		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
> 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large-cm", 4, 16, 1, 4, 0 },
>@@ -820,6 +847,9 @@ int igt_main()
> 		xe_for_each_engine(fd, hwe)
> 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
> 				break;
>+
>+		xe_for_each_multi_queue_engine(fd, multi_queue_hwe)
>+			break;
> 	}
>
> 	for (const struct section *s = sections; s->name; s++) {
>@@ -829,9 +859,13 @@ int igt_main()
> 					     1, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}

I think you missed my previous comment.

"May be also assert that s->flags do not have MULTI_VM flag set.
Same applies to below sections as well."

With that,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			test_evict(fd, hwe, s->n_exec_queues,
>-				   min(ws, s->n_execs), bo_size,
>+			test_evict(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe,
>+				   s->n_exec_queues, min(ws, s->n_execs), bo_size,
> 				   s->flags, NULL);
> 		}
> 	}
>@@ -843,10 +877,13 @@ int igt_main()
> 					     1, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}
> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			test_evict_cm(fd, hwe, s->n_exec_queues,
>-				      min(ws, s->n_execs), bo_size,
>-				      s->flags, NULL);
>+			test_evict_cm(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe, s->n_exec_queues,
>+				      min(ws, s->n_execs), bo_size, s->flags, NULL);
> 		}
> 	}
>
>@@ -857,9 +894,14 @@ int igt_main()
> 					     s->n_threads, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}
> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			threads(fd, hwe, s->n_threads, s->n_exec_queues,
>-				min(ws, s->n_execs), bo_size, s->flags);
>+			threads(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe,
>+				s->n_threads, s->n_exec_queues, min(ws, s->n_execs),
>+				bo_size, s->flags);
> 		}
> 	}
>
>-- 
>2.43.0
>
