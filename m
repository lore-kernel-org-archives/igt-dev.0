Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654B6C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 03:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2106A10E092;
	Wed, 31 Jul 2024 03:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsZbCRsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BB810E092
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 03:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722397266; x=1753933266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xSmg/0HFdJozKzognVJJHZk1qmZyKQhfr6+3+Inyq7o=;
 b=PsZbCRsBQf/FjzTIN75wBbiiE6svX5x9mi0ZPC91gLzkm4FTI/HNYFHT
 3r3K2w35uywbtw0xkQFwK2cxw3Muc5amD8jHP6tn1ZW+7R1QlpUVswcaw
 KaBNPJk16wZ8kT9lT8rw9UIUzIzAiznwWhuE7YMO9ZFTCS7Z2y0VCi2xK
 vCpNrqbUNi/krlUVc3lYNwQ0F/xy45ax7uE2KGYoRJaRep8iSqmWeloF2
 5bmkxVTwUAMGoJw0wH4BurqY814xP/0UGQUwGLOCPmhdEw+MBWm2Thgob
 Bd+kQrGWfG+cTOd5Wmsi4UKd/ABRLkiqWzUm2Wn5O1qTOXrM+tIxaKvnw g==;
X-CSE-ConnectionGUID: fK2mxBI3SzKbnTvmanLvEw==
X-CSE-MsgGUID: dfgQNq5rTY6lVKeHM+JW9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37765474"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="37765474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:41:06 -0700
X-CSE-ConnectionGUID: 0srYfttxS1Gso6f4aoFCSQ==
X-CSE-MsgGUID: pKPFRlQbR7ejBQAdwipCjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="54541538"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 20:41:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 20:41:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 20:41:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 20:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyKw9M5M7KW3XAFcE3nhh5BYwPpXSfiOTcKntoyZnS1+Qe+FNb8kWus1WCoCIZNITtPNhhV84ZPwtwFbg8C2IRdrCaaZsHIHLRQrCu5dG7fYDjHWrRUDaTNSM+xU6iTYCarnmGE6X8YLptIhmneu6zyjzCtQZpzE7vaY8Lwon9acYpVc/GttqvQ6UHaNBxStLpESjmMJyW6YM57FUpSKQNjl+j5GWPEsDMjc0LmUScowyUb9B7qQXhPK0auGRP9UD8lgUxCGJEaZiOcLBHqfaq3w0UWqSsveiiUZBH7TZ01MHzBVoQdNhDoPvMiMlJnV3k72CjZCjPPOPRO8FvW/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSmg/0HFdJozKzognVJJHZk1qmZyKQhfr6+3+Inyq7o=;
 b=WJwwBz2Ok543PWHdmQIGO0zxYNpB5YvzVCzWnBdA2DRLzeeCHIVbwAEGCSsqhPPsTrCttqwsKAzvEKmzAX5Fc2AIZl1KbIyn9tO4X7E2hvfkrDCM71qS9fI5s7qIwlcMkPWz7XK9fE/ooVUioOX95VOgwQj7vT81Vm42pKqE29DTase85mG6C2ur+m9qczFnZQXx5G0NmxeO5uDr2nnc1yep6Wg4koI95aiDcvmWXDZlWraCoFszlNDMebHMNVi/taK8P0o+cFB6G+PuVeSVdaVkSAK8EQGsb3bTn2l9y9EFuULdUZmIhfGxHI+ly25Yi7PAKiBxJPE4WB4e41pY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 03:41:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 03:41:03 +0000
Date: Tue, 30 Jul 2024 22:40:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 02/10] tests/intel/xe_drm_fdinfo: Add
 basic-engine-utilization test
Message-ID: <kxgquuiaofnfolyua75lzvfdyvh2czesb6pjrrhkubddhzsxb4@rgf6pztn4trx>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-3-umesh.nerlige.ramappa@intel.com>
 <skfjguwghaw23jlx3p36sqlc4hpkkz5qfbum4gaeylhw4rvoi4@j45lylpuhjam>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <skfjguwghaw23jlx3p36sqlc4hpkkz5qfbum4gaeylhw4rvoi4@j45lylpuhjam>
X-ClientProxiedBy: MW4PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:303:dc::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ceb08ff-bd8f-4d25-54ba-08dcb11299f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mFhDjLKzJfwfSYISyz6J3b4HdLA1eCnnPYqS03RNVbGNPWCrID4Z6TzO7pG9?=
 =?us-ascii?Q?zDuVk2M65bKzvMi4cp19+BMSlgNIHs35kVrGB+TB3yy1hjPhdJFdK5i23RmN?=
 =?us-ascii?Q?TdADORV/nUr2Pme3ibpaanFc322PxaUd+Vas9FW96Oc5EIM3ITOCf7qqfEZW?=
 =?us-ascii?Q?hf6ON97ALgyjti10WaIw7cRVrKrAaH2E2wKcUpbP4rq6MmHZhZxTOJ7AR8MG?=
 =?us-ascii?Q?3GeTn0bW92tH/LYoYMm1XkYMKXdbHrpA8ulQVpnvgnPYIQ6TFxGuf8hNFiwO?=
 =?us-ascii?Q?NkUjMaA5d2STtje9ksK1rmhibH0Svr0d2CDgPbLxoBWX4L43JLnajmhj0V6L?=
 =?us-ascii?Q?0l5XZtaIe3AHS535gZ5N0UM2T1g8pVcOamYp9sV6cL2a7PNx3OLCD1+Tj4QN?=
 =?us-ascii?Q?O9/uPmBaYfQhFyLlUrkdquhuV1XROkaDzN44Q8Fs70kLTREWPYuHktDy1YUd?=
 =?us-ascii?Q?OUROkZoLyA4j8ipTgUUoGKpEoZLhy4dTndNGGA63jMv+0JjTpD/CCaJliH4b?=
 =?us-ascii?Q?WNhyjfE8Vid9up3kAK60trfoMgTz6q8TNOZYepFxM8BvVQCAuDRDxh6w5Zbz?=
 =?us-ascii?Q?/qF6gSqHKSmH3yHZJbdEtE5X69YqQIQiz0Sh5DCt9tz/ieLPgLSq7QVzG+Xx?=
 =?us-ascii?Q?2+6BWg4vwM4MdKfGEd0LJHQ7dSSXVYNUuXKvO6K0X8ndVwz0cSlSWeSBQRQL?=
 =?us-ascii?Q?PlkHldL+6SvgnwxvwQ7q9yrLrdnLM3qXumG5bEDyJVRVou/vCz3U0rut7Mae?=
 =?us-ascii?Q?jYkkD87+HwA/YrxP/+2Itpv3vhr6Gm5TyDLrKSOCppOwRXBXgGmSayG/BeAr?=
 =?us-ascii?Q?0EAkpNDA5i8snkpOYuHpiFy4AQu5e3sOgUSK8XKOHbf7QKjs76wj92he3Hgn?=
 =?us-ascii?Q?wMKG6cIOf8na1ngiz6jBVOQg091s0pTgBB6pZiuDdrsnGPjVLchDiqdJXNDO?=
 =?us-ascii?Q?+HcIYnGbv1l4p5tyetn00oKOwurQKDsMQ4TXp3MwtZnxDWDj1EwrrrqAtmQn?=
 =?us-ascii?Q?TDA+06Z+JR6MBZfVKb/rCA2DDAe0GiHVip2Rt5baFA+bHMdHL+C41fqQjn5d?=
 =?us-ascii?Q?cO0m2p1ek7SA8s7ipI29h0MPbHx0cE4mWEKMmCajT3l03Xl48T+v5AiwbkxD?=
 =?us-ascii?Q?q4R2IaJJKEfiL+ILvoPqaw0LdU2L/iR2CD2lhzJuNNs5SB4AdlXz/eeAEV5t?=
 =?us-ascii?Q?FEk4o6AxxjsZHqPPC91y0yFoQOQDahtMsH1+LbKxDi4eQRhNpK3mxjTe3R2P?=
 =?us-ascii?Q?L4162q0z3Sv4K50GWX3sVYKthYYBJHG0i9O6J+C2HUb1zwdKdJsdtsGCAA2b?=
 =?us-ascii?Q?Ztw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ckFvPedMr9sXCnfnvYQVKDDODAdaZEhs2YNntMq4EAtggW5JAIfYuSWncCkd?=
 =?us-ascii?Q?M1fMu0iPTyi6JlMgnIB8kMC2hdrbtc4IPnev47/yk8rcQAqzVCTOi3jLIlfU?=
 =?us-ascii?Q?OW2R9GN/grrb/UVXZl8X1o3XakA9Nk5gIRm0c4/E8p7aettZ+ioYM5HTX6sj?=
 =?us-ascii?Q?zTvHX+yQ//jEh6DuvYwye3gNWyBDy63kEoaxsRYOV/f94oWy38XQcB999Nfw?=
 =?us-ascii?Q?M3+DqBAcpxCLojv+W5ASmJgJfLcHAfZQ4M/jtkwOSgP8AXTMNz4l5aH0/umH?=
 =?us-ascii?Q?7WOcVOD1eWA9Z64Q6u3oUYLCbLJnq8pNm/Ccy/t4/jMrW49UDDK958APnjaC?=
 =?us-ascii?Q?9h6OoQAqYqB/rvD3VJonjJx6Mz7MXjGe3seam95RLqJSiB1+M0PgFO2cKBKp?=
 =?us-ascii?Q?wBLVr8hpljYnvVtKeTazSsAEeXyNCaXgU8rrxuIxYeYBlmsqIMm0P5S7e1hg?=
 =?us-ascii?Q?ho1+VK3QONcC+spG5tkGsoMeYXGK/uVj2/ef400gxYHL9CBzcQXb1PjxbHGn?=
 =?us-ascii?Q?5/3+U8VyscpRY9NYrYxSecyeIW2iSUiTq5WkXH8LvXwRnQsgKEEvqkBsJY4y?=
 =?us-ascii?Q?xkeJyHp9SNvuQLRciT3P/xIDk01zn/IM8a2MR79BoI8gwH1V6rBqNJiVRrtV?=
 =?us-ascii?Q?WijSjeGuwZXFxianD2Fh1iRPmFjF6YQm6ul5cJLKwyFoThjH8Qi8UoTEx9U9?=
 =?us-ascii?Q?wp0Apl+iyIDw7OLP/L6a4iez38tPtc7SNhfOkZYbS6dCspPSWHdYdhqFuwUl?=
 =?us-ascii?Q?aUwCwC0MJmGRe2ndDzLG0f7OpRK0GH4NgfvMwUz/roVJMsQLCB98kXPmSH+H?=
 =?us-ascii?Q?JtKux7caQVetSF6HNuQ6nxjfX9brhA9uLTySbny8kLoQcdtrjwa05zedIamD?=
 =?us-ascii?Q?3rQAiVccFfbXj3fkf9BId/RVhOPeUuu/jmREoENw7AOQmx4lc9mZIN8vnBwl?=
 =?us-ascii?Q?7Hnb9uWOyRGhcjcUfazd3rSBZIYZXJMzj3OYnX1hDSkL7istQaKD81COdNv9?=
 =?us-ascii?Q?kubqRlhSFGsMZ0Xmbq5ysWLnbiQxazvLb3/oye8tNEUDadTVR9XbQdXMsAtM?=
 =?us-ascii?Q?njASI7HnEds3X+j6CBq9QcZ7Wq5YLWOTIfrYJYpI6LXA83uGMNTXuXmvnMkW?=
 =?us-ascii?Q?QaDGwYJw6dhgVrFRF8G2qT4ilKeIOSUsKMsxAbAUy9UsEFEAxNb10RWdSUBs?=
 =?us-ascii?Q?VnzThoLcgsrEbMgk1L428wN0j+eed2s5VrUmxTmxVgvJdhx8LKGaxxNVBmBL?=
 =?us-ascii?Q?tf9+rklK/Ic1L4+flqykE7D4bfbfnFwPDvciSP3fK5YWE0UKui0FY8v4Aerz?=
 =?us-ascii?Q?OdaPdrTIblRK2lMxUVRTRSoNM8DXPxr7x1iijLaJz5Yx0nIaXPIGXSiYvxoZ?=
 =?us-ascii?Q?xboPeJr+bzn6fm63ipsmJigYw2TDYeQmobryhWKp9ZA8Mu9Lfu1S85GNGV5t?=
 =?us-ascii?Q?dcoWCKRqx8QhG5C2pLhAr5X3G5e4IPF8U/G/OxzBBgkcQ/J9UJXh6by11LC/?=
 =?us-ascii?Q?mMVP2sBcS1/Xg72Hmp0GLSYnOPsC+typ5EshvktZJlH4hcmKxKI0hxSDb1gj?=
 =?us-ascii?Q?dBlNZhYfNsPhAo2+aA3+2qWtboJ1mQo72miFofl3l1/QODGHjnUQTfMwVKJC?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceb08ff-bd8f-4d25-54ba-08dcb11299f8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 03:41:03.2036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPmSaL8d/T2nTqoxDRsuJrxLaUycYMplsFgu1K7xr27QcipbkV+1EBUpkCjUKds2ZZqc3JjTcU671xT8vMIglVJblzEqSuCeigx2nmpk6S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
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

On Thu, Jul 11, 2024 at 07:03:38AM GMT, Lucas De Marchi wrote:
>On Tue, Jul 02, 2024 at 05:25:24PM GMT, Umesh Nerlige Ramappa wrote:
>>Add the basic test for engine utilization.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

applied these first 2 patches while I think (after vacations) about the
rest. Also sent some minor fixes while studying this code:
https://patchwork.freedesktop.org/series/136713/

Lucas De Marchi

>
>Lucas De Marchi
