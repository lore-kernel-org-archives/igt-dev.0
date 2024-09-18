Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EFDCCD195
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 10:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C57510E1D0;
	Wed, 18 Sep 2024 10:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8nTQnUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A2110E1D0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726655994; x=1758191994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TxSj6iNQZ0Mex2AR7eTuyyOWiNLqYRQZfztd8kGYliU=;
 b=B8nTQnUkP3fsl8GQsF23If65qj5udwuA/Kl3W+WZL6hN+VYZ0pyV63B8
 G4HIkXO6jqA7kweCZT0b6spqSnQqUL6ERx44QRrFN3NFQvkJVG9LSGXVI
 z2nez2EPjRoFWwXH4COxTJzpVEycOAkGSbGObDaiQ52b3J72EchairdMk
 WmyIZK7c6fHwQneWR/SyyWLXfZ8ag4w5k4IDWFnQ5muWL45zUW03yR0ik
 +SvKsUd1NlU443cfMf6I0RCQrtJFivIWw/ROZhGqd+BfFuB5k1Zbyzvn+
 MPWe+0aU7YKtzsZGYGV/YZOqOvpLQk8jvOquAfaTpctF1C2jebAVAbDkb A==;
X-CSE-ConnectionGUID: KBqHb/rNRECLYvxQgnFYUA==
X-CSE-MsgGUID: s6ZGkMGjRLulQtEkyHxPjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29451369"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="29451369"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 03:39:52 -0700
X-CSE-ConnectionGUID: BXEK0LXpQMuotHjWEavcWw==
X-CSE-MsgGUID: HWyeI/CwTHGchiWnHHciGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69386946"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 03:39:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:39:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 03:39:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 03:39:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1ETZtuoQZ2TazOzIna/SD9gM9NzImDsmUvpui9S0xrfnw1EhtOtyiDJlIHW/ybTXbVcRF0xPa/moYoeHgIpgMrzqBH7PYBJC9LUtSRJVdtvwBmXopnMg/xX0YswYflpUBhFcfwDO07TjpzA3FEoKaT1AO3mcNMf2Dx+hvA3p7F1AOLMhVVoqS5OWwpGQwaPDGSMKvmcZQuayYJui8v2/hYBvg8N+/f4meBPilUftayMt2OYMGoJTTy74AUIp3UQ5ANVT/NSb/zWB5w+k4Hch+MGQf2w8MTP+dSkVCHAKiVTz/3ZHs3V2wsDmCSa+yd9YCjHXNfTJtPmjR7olW7LWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xip/+BtwBvlm4ntJ6SY+0sx1yNvjAJkH6YykqAwrkmg=;
 b=XUIQo1qVWGnK4qwWD7ZwCWU4En2vbMUKi5l41HEkTs2fRJE4mYX6y4U0u/biUcw357XjOv4qCMMopejZwz0aLQO1LXY2wyO5ra474KvX48RTpHvBTeL/mKHqc5t8jBS4GCLsTqGK42t4569tVsyqFalcHQKx/gYzK1XS9WU4+Np1GxLxZgr7Q3PWuphFf09LI+C/7fM27osFPEag02CcAi2tkq0IBqk4rKxJ8ZOMC4FdDeulK9Tb/FEhBw5i/k2mWB7qZvSFhefqt7tQb3b+07YlzEQmi5yYQ3vpFksS0m8tEdFGmyiehdRBA15a5iG0WjZsrdXRjD/YTujOasDQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Wed, 18 Sep
 2024 10:39:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.7962.025; Wed, 18 Sep 2024
 10:39:43 +0000
Message-ID: <e6f1ecad-2aee-414e-922a-d4f67f4dcb0f@intel.com>
Date: Wed, 18 Sep 2024 16:09:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/3] lib/kms: Update force joiner helpers to
 accomodate ultrajoiner
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>, <kunal1.joshi@intel.com>
References: <20240918073413.28598-1-karthik.b.s@intel.com>
 <20240918073413.28598-3-karthik.b.s@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240918073413.28598-3-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f24e02a-8f6a-4fa4-7d42-08dcd7ce3515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkJaZlAvaFlIY012NUQ0amxsWWNKM2RaSTA0TlVJeC9iRTllVU1hSVBaenhk?=
 =?utf-8?B?cVEwS2FZcGpoNU9UaWJMYTFPU3ZBekllQ0dUb2FBYW1zNzBBRFRvNTY0RlpQ?=
 =?utf-8?B?NU03N3lRVGJpTHYwOEpqL3pnaXBNb3RmYkFQcWFPdjZKTTRxNFVYT0p0M1Zj?=
 =?utf-8?B?Sm16dUliQUszVEhnWTh5djJ5TFBmblBXTzZ4b3hSd3pWek5QbHZkbzNTbGo4?=
 =?utf-8?B?RGR2OU9sUmlweHNoU3B4ZFJuK3EzVWdoWk5GcjdHZldHdW5EdFMzL250SUlw?=
 =?utf-8?B?aEpaZ1QrMjRydW16VU82ckdBNzRFSHdKNUF0N0g0MFFLYzI3WGY1ZDE0VVhr?=
 =?utf-8?B?VjdvVzR4ZyswRzNxQ1ZxSFAwOFdwWVQyYlBkQlVMOFJSTU1NcnpMWWJxRW9E?=
 =?utf-8?B?VitVOUsvQm9ZOTI2MXVDRWFiZHg0L3NlQjNyN2VhaDIrcCtSbjd4VXRibE9P?=
 =?utf-8?B?SnB6TnZVdDR6UmFNU3Q5dG9pbWZwWWFyTTB1Q1pZb0t3K0ZIS0czSWJQdlYr?=
 =?utf-8?B?L3QvWmFSVjhJdEhRTTFzZ2tIQnJqdzVieEVVemRLQzdJNGVXOXJEZEJISkJP?=
 =?utf-8?B?WFgvTmxyODg2cnIxZXljSkJJcCtIZkNiWGxCWmszSVZQODJHckJCUlhCY3pM?=
 =?utf-8?B?dyszZVdmT3F2L1dUdG1lSXMrUmtYcWlFQzJpVnRVaDBDa2hINHl1NytUUU1W?=
 =?utf-8?B?Y3V2Q0dFeHZFazd2K0E1d2ZjT3RlRVZiQWQ2YWZBRHNVU1lndG04T25vMEVN?=
 =?utf-8?B?U04vaVBLTXI5N0RmWmF6RWthREhzeTJOQVIvcVVSbThhbjRPUXV0c3BDYmRx?=
 =?utf-8?B?YkJhSFdJYVErSVhVOXpvRkJUeGFCUlZXeTZwWXVKazM0dmEzVGYrempVaXRj?=
 =?utf-8?B?RmM2Vjdrd203SHR0eFIwVmVZNk9reTcySzFqLzBQTEFNS1RmSDF0UnBEeThN?=
 =?utf-8?B?NEJWY0tUaDF5Vm9WWW1UMTJqMCtndlkxSzVWeC9IV0JrYUtuN2xCQnF3cGFN?=
 =?utf-8?B?WnlCTys1cW5yMEl5NnU3c0loRnMwRmZDTFZPRGMzYmZGV0lwWlJjemsyWTg0?=
 =?utf-8?B?TFMwckYrQVhqY3F2THhGdVNFUE81c2ZUbFg5aXVGeVBXZE0wSGExTXE3cHl1?=
 =?utf-8?B?TUdPMWVGZndETCtJazJrejFQMktEYlZWeHJjSHFPa2NUdzFnSHlZS21YUUh6?=
 =?utf-8?B?ZWVsSlV3QlVOeTBZeSt1QzAydGNEempEdEs4bDFzMitEakE5d2lZY0xoeFlm?=
 =?utf-8?B?RThDcDczY3lVZ3dKU3labnBBb2h1ZWU0TjlyZXlLZDJTNkhwS250WGZVTDd0?=
 =?utf-8?B?UklYOGdua005QmtVaDhKTGNZQUs1bGpRcS9XSm9uWHg3SlFtaVpaM1VHU0VB?=
 =?utf-8?B?a2JuYXZ3elVNUW9peVNnWGFtZlM2dFN4UTFmNzI3WG45bWI1bjJkemJCZDl0?=
 =?utf-8?B?b2M5VmNmc0g5eTZsUi9WaG9mZkhHNlVHTEpWSEtDcW8vRG54YTR4NldwSlhV?=
 =?utf-8?B?NUxXMXRDSHJBdzRMTzMzUjBrRHQ0RnlOY1YraW9yd1l2ejA3MmtwM2RGbmd6?=
 =?utf-8?B?blVlK3JXdittUG4wRFd1MkF2STY5NXNuVUljWEx4TTU4YzgrU3RHZ1dDVGp0?=
 =?utf-8?B?R2F1ZGo0ejdSbXM5eWtJVHZLOEdRdE9KeCtSQ2JGLzR1L20zd0dXRTFBMzE5?=
 =?utf-8?B?dkVKUVJyeEcyVnc1Mk5sTDZ3L2MzZWtEcmpEcVJoMk5GOWZNTTJKcFBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WURUUnZTQ3VKVG9ydkVaL2h6T2FER3VBWkJCWmJQanZydk9SSDR0V1FkL3hj?=
 =?utf-8?B?dThzNXBFZnhaU0FiRXgxWmRvcHgxbjdqTFNhODhpemQzK05JOXhIMzhwTnNw?=
 =?utf-8?B?ZE80ZDBYc3MwYUFKN3JzN3ZFMDNVOHRUWVk4UlB0a09DUFhTbnFJVWcxUFVN?=
 =?utf-8?B?a2gxbmNEMnUrMm82ak9QcGdHejdaQUtRZlRxUUNOV0p3SzFEQ3VjdlJucjcv?=
 =?utf-8?B?M2haVlhHdThhYVRhYmRXM21jSm1iQkFnc1JxYTF1dDR4NFFQNWFla01rblpQ?=
 =?utf-8?B?ZEhQdFZtU1prd212OHdLOEZXbGppdVg2ME4vWm1JSGg1SURzK3phTGlZYUNt?=
 =?utf-8?B?RkYvOUdnK25wcm9kb0RSYXNRUndMSy9BYnVHVjN0TWl4WENadTV6cnhyN1hl?=
 =?utf-8?B?V29TamtDZ2ZaeHhmZGx4d1VjaGtoSDVLOWQ5S1dGV2M4UUdqNGYvV0taUnB6?=
 =?utf-8?B?bmtTSGFYZnZYamtqOUFxYWFXbHZzc3RaYndqTW51RVNlNWxBdVRTaWRraVMv?=
 =?utf-8?B?YlA2RUNIcnp2aFQ0bmw3dlJZdFgxVjJQcVRwWnhnT0trNlZEaHpzMkFaWlVs?=
 =?utf-8?B?ZndYT0haZXBrL3FVajliNUNsUFM5WnhwYWtSSXl2Mm1BaU0yVGNQOUdSemFw?=
 =?utf-8?B?YmhZbzVWWUJxSXJLY0Y2d2pneDR2SysvaFYxNXp4Z2JKd0FUTXpJSTVTNllS?=
 =?utf-8?B?eFlpdUtKdFVyK1JkZkxGTHpYK2FJNDFZTUtQT0JXVE1aV3BBbU1RZlRuVndo?=
 =?utf-8?B?Zmxqc2ljNSt0WFVvZTFjNmxMOE9DM2dIYUJ4OERCeWxnbU11S2NkVDRHbSth?=
 =?utf-8?B?eS9vdkpXbWVWc0xCOHFkUHF5eVkza2k5Q3IranVJRU9NejJiSnQ0dUtxdjha?=
 =?utf-8?B?NFBDd05GdWhGVnNRbEJjTGw1VzlGRFZXc0ZuWU96QzJBUGV3YkdHVHg5TU1V?=
 =?utf-8?B?QmNEVkpPMUEyMlJhcit2S1dmc0N3L3B5NjE1OS9VT2xUY3RlTjJCK1VleE9C?=
 =?utf-8?B?UVFITk4rS3U5MTQ3ait3UzQyOUphbzhsdzVCbEVzUjRPQW5oYUtqSDdORUk4?=
 =?utf-8?B?SXE4dWxoZTNIaWFCdWd5RkVKYy9oci9aTzY0ZlZvdWlYN0FNWWM5RTJVQ3dQ?=
 =?utf-8?B?aktjU1hVWEtXSkVGVEVsamxmS2dDN2FuRzRLb25DVEwyaGw5eTJPTTdqQTQ1?=
 =?utf-8?B?ZDdQSGtCUzNCeUNEb3JhMERWais3N0xpK0w5NlRxY3dYMjN6RDJ5cUliZ09L?=
 =?utf-8?B?RUt2VGJvUFQ5eHVKK1FrdXZYQS9lL2s5c2JXQW9FZVRJRHR0MkdlMGZ5U2U5?=
 =?utf-8?B?RUJHRHRkUE5oUENnWFhpUzIwS2thU1gzU21UVXQyNkFBRWRxNndIczVzcHJC?=
 =?utf-8?B?OTBJMlRRUkptT2FJRVo4ZW9lMEtiQUdRSkRzL3o5czRhQVhPZlRIOU1JY05I?=
 =?utf-8?B?cFl2T3BnMVRNMVVvVGF2NmhMS1RzNjh6NWpReE4vVDQ2MnhPd2dyQVY2NUh3?=
 =?utf-8?B?Zzk4RytDdVJKR3hSRHJDRlJQSTY5d3BBNGU1Q0xaVkd6cmdab215ditvbDR5?=
 =?utf-8?B?MmdxN0JHREVOVnlGOGp3M25kL1Z4dUhoZm1xSnRVVWd1NU4yVkJXSUkwRVlu?=
 =?utf-8?B?UGNhWEFjcUlmVTZKKzZHTUt2Njg1S28vYncveDRqTlJKdEdBVTVVMkJoSXkr?=
 =?utf-8?B?ZUw5WUVqTkJIWGZ2VU9Xc1lnRHpGckhWY09UeWpZaExxUU5YcTdOM3VEN0lv?=
 =?utf-8?B?WXZpempKRzlDNXpaY2YzSjlVY0dvbjN5K2lDUGNERGtDZllnck0vN2YxRHdR?=
 =?utf-8?B?TzU3b0twZHFJNmplb2pINEp2eWxkL1VTamRBUExRelZ5WDhnR0szQVUxc0VU?=
 =?utf-8?B?OVRrTnJFNlV1QXh2d3Q1Q0FKL3dmY096d3pzV3dJYUJqQUs4YmZBWFVVSjF0?=
 =?utf-8?B?a3l5Ykd6OE03My92b0YwQjJjNWtRSHFyVXNxTVh5ZnowZzZJVzhPWlZCbTNH?=
 =?utf-8?B?TTBWbzNDYzZqSE5OMFdSY21pOENFRTdBYS9ybWxvbW1HYjZYb1QvRVZDYStO?=
 =?utf-8?B?S2RLam5IQjM2V0ZKQkhQanJpWXc4d2JYYko4T0FDRlR4OWsxZVJhOVphV1pt?=
 =?utf-8?B?Rm51SjA4TGtLeFg0cVI1ZDVCSHdHbW9XSlpvZHJwWjBHKzlMYXkrUFoxd3Na?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f24e02a-8f6a-4fa4-7d42-08dcd7ce3515
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:39:43.7264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcQgLGdKPPJZUnR3kjhrF0J3DLhdby7u4urM9oVLaVJIfn7BElBvdxxzP21jFcvVBXVvsqvCAF3ajnxSrtMoa6FPIWxddRZNZ53I823Nj4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
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


On 9/18/2024 1:04 PM, Karthik B S wrote:
> v2: Split the lib updates to separate patch (Ankit)
>
> v3: Use enum for joined pipes (Santhosh)
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Acked-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   lib/igt_kms.c            | 33 +++++++++++++++++++++++++--------
>   lib/igt_kms.h            | 16 +++++++++++++++-
>   tests/intel/kms_joiner.c |  2 +-
>   3 files changed, 41 insertions(+), 10 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index cf453dcfc..a39d1176f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1720,34 +1720,51 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
>   	return true;
>   }
>   
> -static bool force_connector_bigjoiner(int drm_fd,
> +static bool force_connector_joiner(int drm_fd,
>   				      drmModeConnector *connector,
>   				      const char *value)
>   {
>   	return connector_attr_set_debugfs(drm_fd, connector,
> -					  "i915_bigjoiner_force_enable",
> +					  "i915_joiner_force_enable",
>   					  value, "0");
>   }
>   
>   /**
> - * kmstest_force_connector_bigjoiner:
> + * kmstest_force_connector_joiner:
>    * @fd: drm file descriptor
>    * @connector: connector
>    *
> - * Enable force bigjoiner state on the specified connector
> + * Enable force joiner state on the specified connector
>    * and install exit handler for resetting
>    *
>    * Returns: True on success
>    */
> -bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector)
> +bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes)
>   {
> -	const char *value = "1";
> +	const char *value;
>   	drmModeConnector *temp;
>   
> +	switch (joined_pipes) {
> +	case JOINED_PIPES_DEFAULT:
> +		value = "0";
> +		break;
> +	case JOINED_PIPES_NONE:
> +		value = "1";
> +		break;
> +	case JOINED_PIPES_BIG_JOINER:
> +		value = "2";
> +		break;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		value = "4";
> +		break;
> +	default:
> +		igt_assert(0);
> +	}
> +
>   	if (!is_intel_device(drm_fd))
>   		return false;
>   
> -	if (!force_connector_bigjoiner(drm_fd, connector, value))
> +	if (!force_connector_joiner(drm_fd, connector, value))
>   		return false;
>   
>   	dump_connector_attrs();
> @@ -6420,7 +6437,7 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
>   	if (debugfs_fd < 0)
>   		return false;
>   
> -	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
>   	close(debugfs_fd);
>   
>   	return ret >= 0;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 4455632f4..2461fa47c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -260,9 +260,23 @@ enum intel_broadcast_rgb_mode {
>   
>   struct edid;
>   
> +/**
> + * joined_pipes:
> + * @JOINED_PIPES_DEFAULT: Default setting with no force joiner
> + * @JOINED_PIPES_NONE: Force to exactly one pipe
> + * @JOINED_PIPES_BIG_JOINER: Join two pipes big joiner
> + * @JOINED_PIPES_ULTRA_JOINER: Join four pipes for ultra joiner
> + */
> +enum joined_pipes {
> +	JOINED_PIPES_DEFAULT,
> +	JOINED_PIPES_NONE,
> +	JOINED_PIPES_BIG_JOINER,
> +	JOINED_PIPES_ULTRA_JOINER = 4
> +};
> +
>   bool kmstest_force_connector(int fd, drmModeConnector *connector,
>   			     enum kmstest_force_connector_state state);
> -bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
> +bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);
>   void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>   			const struct edid *edid);
>   
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 633bf51c7..e193f9071 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -106,7 +106,7 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>   
>   	for (i = 0; i < data->non_big_joiner_output_count; i++) {
>   		output = data->non_big_joiner_output[i];
> -		status = kmstest_force_connector_bigjoiner(data->drm_fd, output->config.connector);
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, JOINED_PIPES_BIG_JOINER);
>   		igt_assert_f(status, "Failed to toggle force joiner\n");
>   	}
>   }
