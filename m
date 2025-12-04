Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23976D2A532
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DD710E223;
	Thu,  4 Dec 2025 21:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUzOz3uX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F3C10E223
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764883213; x=1796419213;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2NktE19TnLtrBBoAsy+vYkQT1Bfe+mTk8asDnqizhgw=;
 b=SUzOz3uXPl3fn4n52iDKdJAgkD2adsGa6nKPtk7rrqXMAGZs93wk1rPP
 QkgtWyCK3OKaz56c2yZ7wUVpeoE//Rsy+IFwigzTrG3wo7UY5J7OPzs54
 B98eAH9BX4eCTeZMgiPVw91DDzdVwdSTdAh6x6d3Bgy2q2bQr1D+oDlrm
 Qx6xukLWW9xNWmuRdTE6nwvh77rsnkwmILv6HqU/bypanndirbM4vAhIM
 eU/QQYTpZlcltKkcoixl7myyPwFZ7erAZBjxTfGIZ9eWsHPzG8YMParHg
 nTpJ/+oyFb6cQQHZ/TZewy+MB6f4QijixXhfFdHEUNnvkdZbbiY6HGVnM A==;
X-CSE-ConnectionGUID: SOEHm8PBSEa9a4YlHAhYgw==
X-CSE-MsgGUID: LyvBZZODT3Cw+cqJ/OwVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66876907"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66876907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:20:13 -0800
X-CSE-ConnectionGUID: 4XBxljpgSOWvjuCUHP2wvQ==
X-CSE-MsgGUID: Su4CnnBLSEinMCVnf6LvBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="232433802"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:20:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:20:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:20:11 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:20:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNHj1BMdWzUwmsjIpK3pIDqyHl+KxhTsfinAKMgfcdO6hTasGv5noAgv43IjS7qJtFxq8FhBEM9E9zexl7nG4OKbC7opaFb2rT5FDqW1p/eCUci8YRI+17hkAoYk0oxgRiaGNf/5kEQQPN94x82t/02m2YzZrTBw7HZEUI99LtlUI0g5g1xoqylNjrUWT9B7/mOQ8R9tAXpoXO9fRveQXfSC0zisyJH86YzX/1qKlG0gP/wC+xqbJZjfytxY7gt1NCdbA3ku0YfEdQWuC3nBrdMsZny1o62qG66j6W6cPcGO+YKpZGdCJdYlHHHuRe8iryas9JteGEpDMmDbiwnUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l9m2QknUI7FKBfaQ4hY4tArB5cpcvDugbR2e6NM66U=;
 b=seipK+MLAscYgB6XQIlwjD5UN/STt1NTMmv/2oxx29/qIet/hQuJna/wtuwY4ynJA7F1HfI1AeEawt8ZqHd4yJzTX5tzXOM0PiIhNbt9eC1F9I2c1W+x9tL0m0dX3fSW7IkRS4YH04iUoJvdQ6CKoiyUc9MHG3adFB7CWPWP7zVYrJ9hDXF99E5JwoJagn6FZVtXbYdfwdRZtOFRYZySGAVKiE536ORy4bgET2A+Iq3+iA9+vuPzaOIVCYCMmkTdut1AwSKiqo4L+1BrHMq6rZGOmNhFLpwDU42p2Yesiu9ySla8fa9Yb7ok6Upp49uX7Md6zvmxwiBSwyRCu547Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA1PR11MB7678.namprd11.prod.outlook.com (2603:10b6:208:3f4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 21:20:06 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:20:06 +0000
Date: Thu, 4 Dec 2025 13:20:03 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 17/19] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Message-ID: <aTH7AzT1uEGeL9He@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-38-niranjana.vishwanathapura@intel.com>
 <dfa4a32b6459d404d4b06312ac502b9e72dcb020.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfa4a32b6459d404d4b06312ac502b9e72dcb020.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA1PR11MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 855ae26b-f09e-4331-6058-08de337ae5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GQqLFxHktol1oAG715rTcZlCJ570/VRyQfvLj0Rvhz67uO3ppwV+1OELAA?=
 =?iso-8859-1?Q?tV4y+X3Lwds6LmxFLuDxU6wFnuKaJ1Aw6/6z7XPPOX23hyOULTnbX/9GgV?=
 =?iso-8859-1?Q?Q2RcxW0FsecROQLACaRGKmxkGJEQhgeQgSJ/8TT9cLsDSekcfsbI6H84SW?=
 =?iso-8859-1?Q?kWyYAl9xnf9WPGDZ+kcFEztSduPAxgwZVjeipDGWKurb6Arzb08A4QCzfd?=
 =?iso-8859-1?Q?T8lt0+zLxKrLulGO0L5hsxL5gdBHy/jKPe1hxO16bwxJoH6GmKScd+vyWr?=
 =?iso-8859-1?Q?gAn8OVgdFxzzkesE34XQMCZLOGe0lO2hvAwMpVBeNFldwOxs0eBAcYCFHg?=
 =?iso-8859-1?Q?YDBdJnRFUyIl7C9EmXK5B+nzAGgSWYxDiZUly3izz3i7iyveSTJwa4rQUt?=
 =?iso-8859-1?Q?R3CO9sPaYLC3DQBOpqY04JvW4ExCCypnsHrSCxR9AfdXyLMavQMnmUPVVS?=
 =?iso-8859-1?Q?2n4m7fZQxqwbCz7ks+MyNwLYOk4NBlLvFZ0k939zpbzSeNZDDLFEbazeUg?=
 =?iso-8859-1?Q?xS+J+Z4BL5jskUyUO9zbvm+29dIU/OUddRihbUa8PB9mU6Oq2lqdKnz5iK?=
 =?iso-8859-1?Q?QIT/YYMLeKc0JU44dLycaMC7fjlEbCuLc1zlfVX/uEGuVpvz5mY8NGrPX9?=
 =?iso-8859-1?Q?8YPWnCZqibvmh1T5rGNl6yad/vbr+eGVnzUJHq1D+g8jO76rDmKuDS5k6E?=
 =?iso-8859-1?Q?mGnreM/96L2G72m+CNeiHKZ+QEEj/vlXU4doqCp303gouTjJ66kPxhGEqD?=
 =?iso-8859-1?Q?G9vj1fbYflQdoIftTzoubo5aKhBUZmeDAp559WwGdulA8pxQwNgS4YYCYO?=
 =?iso-8859-1?Q?DWPSb8XAWhwyQ47ye3zVWmyTk0SjjMbkO4uaxPYt4fT9Tn44bqUbKDS8mA?=
 =?iso-8859-1?Q?Xzb7jn+K+qigDV3N1FJjg/qqTBH1OWgOrg4q/eseb2WHRfPAMyG7Ckd3iT?=
 =?iso-8859-1?Q?fUTXnb33s79/IGAy0zYWunSdagmWCjgkmDbUFvBq+LSuA30ns5W9t4W/Nf?=
 =?iso-8859-1?Q?le5ZtnL25QNBQ6ngVh+bhB1fX81Jf/6EzpDjVBtidt3orcLTH4uME2MBwG?=
 =?iso-8859-1?Q?X6ZPh9FKc+psifrk+CvIHqPngxCVFNSrCm4K21zAC5Lti9iIwLNc9Y9+NH?=
 =?iso-8859-1?Q?jAkE8px39CYTV657O/AL1iOxs8MXdehUtgzWmIKwwPDtpYkORvGJesyQUp?=
 =?iso-8859-1?Q?gbCOzmyyb3Av+K256e802ctgZ41moUL1rEyZZenimRrc22yNSKR+ti7QxP?=
 =?iso-8859-1?Q?FyqLL4PA4vbeo+PNKFRczN+14tiR7LuhX97i1wyrmnQakT9epsBrCfYckk?=
 =?iso-8859-1?Q?SnJVNMepfSytgl6WqH9RI/WXrT+pUBUBZlXqdbZ/8Wltvaf8Hc4rwD6xhN?=
 =?iso-8859-1?Q?G7c0Ne3gzoyHy2rlfzybPfC8/fYXrQFO/YlRW9i1xnmcmMVuyp69jdDqLJ?=
 =?iso-8859-1?Q?J5k0SGQ7VP/XRTVqMKb6UHiIc4nwX9QXphm3pEZVkK9agqduXeugQWNumR?=
 =?iso-8859-1?Q?OKwVwIWe8ur6G53TqO2IM0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?La/16T6NBT2AJ4JZgE1lBEUDnR2sn8kQqlFpet35+qSJvcxYf4f6C41mwC?=
 =?iso-8859-1?Q?Y1sqRd6JtoOWYayQbxoj167kOZdJ8l0zlpK+eFMHQSKtaMNqvX7L851cQa?=
 =?iso-8859-1?Q?cXiHTf/hZ0dqminjLFgIgDpFsl+F47+dqPlySuKgr6HCn4iG2lTFg3kr1W?=
 =?iso-8859-1?Q?9MCviuZyxxN+fFrbm/0DggbtoSy+7RQ/mjaYRj4XYzv4qXe5QnQtOOdDJl?=
 =?iso-8859-1?Q?dCV9mwHFrTPUkoDiJ4BZDmDawL6kNtb42PvR96KokK6nPOl2q87NTQGNYj?=
 =?iso-8859-1?Q?1RV2oR+6bGWrZETOJXV8OKl0gkf0K0+iKm6em8hGUzLzPoymT1dMy23WWo?=
 =?iso-8859-1?Q?HDGnbYQyvaUwG5SKmCzz1BbYJkIB1+dgmevtgWRYAORC42PFSP+megwgtl?=
 =?iso-8859-1?Q?X//MKPHeRxrvxFR43DRm6LuFH6nhZacyDAidfMJTIqrdnzr22gI0BEchoT?=
 =?iso-8859-1?Q?py+ghYyoCNim4hOGmZr80MD4UBx5ToT+unuJPEg6mTmUzVku6T0z92Ts5F?=
 =?iso-8859-1?Q?kBXFXw+0rqR5jBVtQ+9GBVJxb4gJxWcsL4DZrVrZTWGeAk+KvASa60WVRx?=
 =?iso-8859-1?Q?K6Mc98dlYq+2aIGZZVOYV2GAOa2V9Hs4US49LaaNmtAQaeoboH97UyNxZ9?=
 =?iso-8859-1?Q?znGFLvrzrLbWrqJBgvI+vhB7VJj70ayeKN8FC2omvxCptz9bg3bpvRnrwi?=
 =?iso-8859-1?Q?lT/hK7hm/DtnIAyVCSX75+bPusfsqUFlTvrOno4dCAmeWQFIV9zwz2kY/i?=
 =?iso-8859-1?Q?/grV2KkwG2EEAl4cNt696nSmMt6MIEw6FstkkHu+UZt7V5pU5hYkH9gZQ+?=
 =?iso-8859-1?Q?3MzvFS+EBcZ2S/QMnUJqAtESSLUBoGy2LlbKRa7G2Jyj5M2cFUu4BdZkbV?=
 =?iso-8859-1?Q?Ujqc+YS1zbiVZeQdMEJoXtU9UA99BtnSCPWQxw8zwSIFjvF0ESsdPZtWtj?=
 =?iso-8859-1?Q?NwfNH+33Kx9ThTOXNmBkqf3Q/hyQxTUEwaw2lDHrmLed/uQbKJo0p7pj5H?=
 =?iso-8859-1?Q?sEVuCqH0RWmRjAL9OfUkvZ0oEPOQlNDhP63uKA3uiQQCXriajUUTKyCMG+?=
 =?iso-8859-1?Q?AYCPzFG9t8v5kjqysI/4Qfl/wHYvIq5n4ml5+FHW/RN6QVnY9EK08CEnyZ?=
 =?iso-8859-1?Q?0fpaO9lcFL1WPTQSkMIbjZu7heKH27Xlz2KWn/1woJmipMPqtfyJ7XBSCG?=
 =?iso-8859-1?Q?ymRPAGKpw0naOMr2zkRjD5kQy1QU5184Fu/klaQc/dXYJKuVKuFolPTV0e?=
 =?iso-8859-1?Q?0I1a3Xwf+PjWx/DUoHC2kH7oz8YhdPF+eqxEyIXcz05YHJ3G9NuQG9Qd8Q?=
 =?iso-8859-1?Q?ee1WupIJX7xdqd/ADQDz+M6SGRoq9t7+ba24+J1L4DJWMsHWeYtXHsmZyl?=
 =?iso-8859-1?Q?0ZJBllMReMHpIrzpGab+iCw0TNEm7t3b+cLiUeFhfNYg3poCbOTdHemm69?=
 =?iso-8859-1?Q?bnS9TbU3ERODWVl76kQ60SUw/S2sh693KBYi1k88Tj1R9tQvPxWK4WIMN+?=
 =?iso-8859-1?Q?RXGsHb9NN+wcglo5JBmp3BVbnqgR5SmlI9PBTvHch8T8gB0L2DvI7r8bWY?=
 =?iso-8859-1?Q?aikGqu6RTLDwfgmpX1u5/VXcRlaZqUcEODEiraWtTIq45dRrDPo3+5OQ0X?=
 =?iso-8859-1?Q?6gR4zLCiRmKyispWpQCFyQ2DYGJM6pnden/OYEZSOcnniiAmMRewusfbJr?=
 =?iso-8859-1?Q?+4n49/sguDu3QUjcnRU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 855ae26b-f09e-4331-6058-08de337ae5a8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:20:06.6537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/WFbnJ7JgwIQC1lJRoYkOnnZ7QxSjIxUyURI54rkHZYpQCQ7XTebiGbUGF32FkoUWzLhKvJ7aWS22vxT4c7mlJyBW1MJSoKHJrS2IHFMi1vNgb8ua95OjrcLvWDJrYl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7678
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

On Thu, Dec 04, 2025 at 01:10:38PM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> Add DRM_XE_MULTI_GROUP_KEEP_ACTIVE to valid flags list.
>> Validate that KEEP_ACTIVE is not supported in preempt mode
>> unless fault mode is set.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 31
>> +++++++++++++++++++++++++++++--
>>  1 file changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index 9f7b3b4d7..288ef9ed8 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -37,10 +37,12 @@
>>  #define FAULT_MODE             (0x1 << 6)
>>  #define SMEM                   (0x1 << 7)
>>  #define WAIT_MODE              (0x1 << 8)
>> +#define KEEP_ACTIVE            (0x1 << 9)
>>  
>>  #define MAX_INSTANCE 9
>>  
>> -#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>> +#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE
>> |        \
>> +                                     DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
>>  
>>  #define BASE_ADDRESS   0x1a0000
>>  
>> @@ -81,7 +83,8 @@ __test_sanity(int fd, int gt, int class, bool
>> preempt_mode)
>>         if (!n)
>>                 return;
>>  
>> -       vm = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>> +       vm = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +                         DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
>>  
>>         /* Invalid flags */
>>         while (!invalid_flag)
>> @@ -105,6 +108,15 @@ __test_sanity(int fd, int gt, int class, bool
>> preempt_mode)
>>         multi_queue.base.next_extension =
>> to_user_pointer(&multi_queue);
>>         igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -EINVAL);
>>  
>> +       /* KEEP_ACTIVE not supported in preempt mode without
>> fault_mode */
>> +       if (preempt_mode) {
>> +               vm2 = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>
>Since we're checking preempt_mode explicitly in the if condition above,
>do we need to keep that here?
>

Yah, good catch, will remove the redundant check.

Niranjana

>Functionally all looks good though.
>
>Thanks,
>Stuart
>
>> +               multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
>> +               igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1,
>> eci, ext, &val), -EINVAL);
>> +               multi_queue.value &= ~DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
>> +               xe_vm_destroy(fd, vm2);
>> +       }
>> +
>>         /* Setting other queue properties are valid for Q0 */
>>         multi_queue.base.next_extension = to_user_pointer(&priority);
>>         exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> @@ -205,6 +217,21 @@ __test_sanity(int fd, int gt, int class, bool
>> preempt_mode)
>>         igt_waitchildren();
>>  
>>         xe_vm_destroy(fd, vm);
>> +
>> +       /* Validate closing FD while keeping group active */
>> +       fd = drm_open_driver(DRIVER_XE);
>> +       vm = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +                         DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
>> +
>> +       multi_queue.value = DRM_XE_MULTI_GROUP_CREATE |
>> DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
>> +       multi_queue.base.next_extension = 0;
>> +       exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> +
>> +       multi_queue.value = exec_queues[0];
>> +       for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
>> +               exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>> ext);
>> +
>> +       drm_close_driver(fd);
>>  }
>>  
>>  /**
>
