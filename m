Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9286C61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 23:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400A810F1EF;
	Thu, 27 Aug 2026 23:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKdIqTpD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C030B10F1EF
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787873793; x=1819409793;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jMX9tjPE9HesI9ropyuzs48zXgGCA0B2j9/BEL6Z+wE=;
 b=ZKdIqTpDHXBY4luKvWXqhPK0yB094HrlQlcNq/yCX3TUy8/uH4s2HZZb
 7cY8qisiE17hIET7I0UtNocxLtaBEzyIbNGJ7P/CCBnPiYuY7nbZsrwYT
 9GJ74fcqVhZS5TPv6Yrc5ikm/3wlGmp0vDoJBE6jGcSR8sJjfdE13jxRj
 i8C54gXYhhHS5Zv2Os+NAqz/R8YTXtNT4reqpOAVX7BgA8GMHdFbAVExl
 Ti+Abrxb9BmkQKwSbU7Z664o9YH0Tu+UgliujsMVFhIAHszDTh8Rpmba0
 LCyrz87b4nbTwjCot2+QOIkFVUZANSgJgW7NXUnbMTkKt0KNFg6gNupNq g==;
X-CSE-ConnectionGUID: VWjQv+ipTEaqQvJPTe+yxw==
X-CSE-MsgGUID: RqlplSw+QrCmXRrdpQ1e9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88240674"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="88240674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 16:36:32 -0700
X-CSE-ConnectionGUID: h43BBqndRz2EJrXDYvayhg==
X-CSE-MsgGUID: q9Hd0mNNT/eXsxbEPMSYTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="265405221"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 16:36:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 16:36:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 16:36:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 16:36:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkz9B/n0ZGsvswo3n+7hDC69DoxCf/Ed1Z3HnRXzkct2HcV+hbJmwGnzJ08ttYsXFIRObbL2WbXaSzM535Rlpd1GnaPcyNXgdi0TJ5DgLuhhmUD0XNcp9JkN1BvFJ/h5mgyW78PBB+8pNFGgzwa/e3V4hVXwefVp4lddueRwa1fCiJpSzv/bvpNi5obRHmtiaFn6uiETtj425utD0ytq6I7PsQL7IK8gaTbHLaTj4cF0g1Iz16lanS4EhV57e434Tws8vzi2gIshw0hRnOIS+08u0Ovnrw8M2BiyWiCvFYrBwgWlkdMyqKTJzQqr4HTFAxnbc7jTA2I1cQDajG2pYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADGE0tzlhZm22eh7gTc6v9Un0ZrAPXQdcSoXFK46mwk=;
 b=QNFyZ/ojoyFfHM8BZ31729WVykXIw1wRTnA235ZLaqAw8AjOsz4zfDsso6WlXmqKFnmIJQwkU7w7RIYtF7S+4v+TRzJi8jT+cZ0gd/26iv44xYXEDE1vlWMxfG9wMFTY7T1U+aBymfN+roscU/SSWPNlLxT3q2IME52lUb3JnLhoButqPcphUiyReuLWwaOT5gZLFGD6jo66DoRkRr4DmMOZhaQq/+QOj+kSgiiHAQiSAuK09D/Rw7Lc5MuGIBuHEYWyGy/4JjbGDmmojQdy5NLMVRCaWb+brFdlV2U7wzDz/wj72eKyja6mRE+cG9ya/Ax8ENbm1qWMkvAig7L89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA7PR11MB9541.namprd11.prod.outlook.com (2603:10b6:806:4cf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 23:36:30 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 23:36:30 +0000
Date: Thu, 27 Aug 2026 16:36:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_oa: Add test to ensure entire report has
 landed
Message-ID: <apDJ+15eU7xo/Yjl@soc-5CG1426VCC.clients.intel.com>
References: <20260826044209.1498337-2-umesh.nerlige.ramappa@intel.com>
 <87v78vcgd9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87v78vcgd9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0309.namprd03.prod.outlook.com
 (2603:10b6:303:dd::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA7PR11MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: 9721795a-635c-4936-d768-08df04940544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: h2oDI0R9BwVDc+E7zmyRPj3dCmZtNl1tg8aYpWi0MCagoCQWrUSuwsZJO5r9ZS60ls7JUgRhx+QlBIxsIjmmpRuAyo97RDA6CqHfdwvPt/oPB4xyVqG3qUV9x8iO8iO+3Qv75Iu3r7BSm5dQjGMAAFw5LP0IVws1kyNcFOtz3ax7spjQYFd5gFMrh24DSbfoklyoSkPtHkwl6TMy+R8pt24dNHhB57rVq3EKLWGy4moJoPp9gEsEgbVTtD1JJ6AaQM+UQzsVPi2l7p+oFupf7Do1nD+E79+6BYjLJ7jy36YMgzCqiQJSLWWfUe0brgmtdt1yzePft1IPm3WsXvwNqb38qQYieFJNSJFXRbYJUSEHz+6mCQi4cdYW2TLJPG/NmoLMkIPd1xDhnVQLNLUaI6aWNsHC3SwxxTJi8ZSiHlQgfW2dLDxcrCLLPeNVtyBA4r2g2WrkPuLXRIQaegin4BDnp4mRSxmIBFWoEziMDrYGMhpB3238x0iPqKAZ1tdXw9lngF+tts+oCAaECHBMakLAVMxnJ6d6wDB4c0qFSARowQSmgEWTu8bU+ymXpIIu8dN3f4dsi1O8diQY4zn0MOCK+9zYX5SC+muAPmm/ePVGkDTBIIAPHaS04SHvBkPYpO8hClf1XsKjJvbJInKKPCcpsBS0HaXOD1ppQMwOvG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTFyRGZBdkpEN2F3UWZ0MFhzTTR2RjZoTEQ1bG1pN3RLNHdYRzB0aW5xcVpk?=
 =?utf-8?B?YWsrak40K2NPeFZ5V3lZYmtrUFYwNEZ1czk2T2FoZjFlZFpOTy82dFp3bnpi?=
 =?utf-8?B?V3N4MC9UNlpUK1FMU28rRGhjeFc4eWZnaWd5MWhzVVZIbjh1T2NnVnJ6a0RJ?=
 =?utf-8?B?RjVDZ3VsK1kvM1lkTERjQU5Iejc2bnU0c3JhMHZhU3diWEQyTUxndG1zM0Iw?=
 =?utf-8?B?K1V2bzV3Q3dkcmNQZEJhazNjMWVUeGprT2VUMlN2cXo0SWV1dVhVb3dFN1Ey?=
 =?utf-8?B?Znk1MmRZR3JZYlNZZ0kwd0xVS3lxNGN3WnVkWGd3UWJ5TjhyMjQ2US9NNmlH?=
 =?utf-8?B?YVVkZmUySlQ5Q05BUjUzQ2gwa3p4RlVVYXRnZnhhTW1VS3laUjVvemk4QjlL?=
 =?utf-8?B?OGJEQ1FxYkZRNkdhczRqbHBwby96UjNQdTRGU2VOMHNCTmJRWlVBZ0FEQUNl?=
 =?utf-8?B?Unk1MlVhWVk0NGtvZHhXMUZsTjlqN0VENFp1c0NycEM1bDJCRG5PRERBMUhJ?=
 =?utf-8?B?Z1Z6cmdyVDNpMWQzME1PNkJuL3pZRENCUEJtbXFHYzJEcVYyNVFCclFPbVNG?=
 =?utf-8?B?WG5wbzhmWHBmWHowNEU5bVA5VmRkdFYxRDhYc1JSR3dudmo5MzQ5WTM1YitL?=
 =?utf-8?B?cS9ZWVdrckwwaEVhNjNWcWh6YmRjZU9aeWozdTNYOVBzc2hrRkNIKzlQSnpI?=
 =?utf-8?B?V3QxeUxrU0JGazlTdGhsUVFGZ3RKd09CZThPb0d0dlA0SkFxM21aTHA3MEhx?=
 =?utf-8?B?MnRieDJyc1Z1ZkNPTWpIZzkwaEI1bU1LdDUvTTU4MTdFVTdiMFhjNjcxcmZI?=
 =?utf-8?B?aU5ndVoxRzVLYklPa2U2eFRaMWNyU3ZZREx4UlV6OFc0dEp3ckRhQy9MNHFt?=
 =?utf-8?B?YmhNYnZhZHNYLzlhdWxUWjYvU3M4Q09ZUGZjWjZ5b01HZWJwVkZPMXdnaFMz?=
 =?utf-8?B?UWppN0xYQ0VZSk9QWDFkUldqSDRWZExPcldPNEZmeWRwYlRBOVFFWTR0S2hx?=
 =?utf-8?B?MTFyTkJCa2loSWZqeXNFd2pvUmszL285VWlnS3dIb1BOYkVrUW5mOVdTMXZ0?=
 =?utf-8?B?NmdSdERvSUE3b1lTZjNDdWpqeUxTNVhDVnM5TVJTU0E4Tm91Rm9YVWRSYlY4?=
 =?utf-8?B?ell3YldpaDVNeXBiVldtMjdGb0d0R2ZBWlJVSTJIQ2VKelpzdXBhbnV0THpF?=
 =?utf-8?B?b0pCRXBqYTc2Vk5FWHV0L2ZJUkN1dXNVdFdILytXbmhPV00xSExObHBQSWJy?=
 =?utf-8?B?SzArRFNEZnMyKzZHbHFMSTA0NE14UFlvK2w2N0VDQnkzWmZUUXNvNnowRDI3?=
 =?utf-8?B?VlJ6ZkxMY2RGMWFCNGtEd3ZUMlFFVWJoSjJCaXMyV2tpOEdydU9qVHM0ZzlT?=
 =?utf-8?B?NFArSGlWU3hIZVk4SnZoRmNlazIxZm9adXNzd0JyQWFpcEM0TTNYZFlibHJt?=
 =?utf-8?B?YjgyTnpzYjNjRk54bEc5bHlKSDhFR0h6OGcyYUFmVmZBSUxoanlNS1IySGRL?=
 =?utf-8?B?R2srVmZlUzh1cjhrS0FrTWNQRlBPTzhKTUlheUN2eFVwa1JZVGNRUzhKWElO?=
 =?utf-8?B?SFhqRm5yeHRRcnBKZWhrdzE3UVB2aDl5b3hVdkc1bVpJa0U1WHRLMVNaQTZB?=
 =?utf-8?B?QWhFd0JHL0duaFN6aGRwNjRVYndmN2t5YzVzb1hjZWZOSlhwZlFYQzRDYW5m?=
 =?utf-8?B?R0d0K25JTUpDYVA4OWJTZmgwYTVoZkxRU2JZUTJxS2VQampoMHdPNkFyRFVL?=
 =?utf-8?B?cDkrZTh5UTJxNmhoclI3b3NLcnVsOGZJL1hsR0IyMmI1SXh1b1VzZ3M4MnRv?=
 =?utf-8?B?V05qbVJRS2xscGRVS1VhT1RZSnJhWXpuTS8rdFQ4QVBPaXJzOGdrdUFneVUx?=
 =?utf-8?B?N05FZlk3ZTQ3OE8yVFUwMzFLc2VhVHZFVDhRTU5OSUZoUFhSMTdJV0dDUU8w?=
 =?utf-8?B?eVpJb1NRR25JNk9pVWltSFNTUlo4OEFFSi9MM3R6NXF1RlBYSk9XZVg0Mk9w?=
 =?utf-8?B?NGxVV3UvOWNXcTdMY2RyREtJamhVZ0hybUVOdzhYdU50NFl0dVVJUEdDK3F3?=
 =?utf-8?B?MkxwSFRxVHNybWdPRkcwWkpzY3lyNHhaMWR0NFN3VXhKSVBDK2VDUDBpRU40?=
 =?utf-8?B?RldoNHNzR09lRlYxQlRMYjlqeHJ1V2t5YlNJQkk4THVQUE8wSUtiQngyd1k1?=
 =?utf-8?B?QnRURUpUeG9qdGFwbHNiQTNrcXRWNFNhZWlyVzd1cjJCamdrNk84OGdNdXR4?=
 =?utf-8?B?VzE1Zy9oV2F1eFlyNW1lNUJrMWh4NlBONUNOMkV5WWY1STlObUVrcHc5eGsy?=
 =?utf-8?B?LzB2YXFSVTJHbWlzeUVubWVHRHNBNEhSTkJRYXd6ckRKcUE0eTBqRHcwaDhD?=
 =?utf-8?Q?KiviGdcpoYyLNfEjMHK0fj5oDFO9jWiwKUKjB?=
X-Exchange-RoutingPolicyChecked: eKNYgN8PjpuFwN50u33anwWYacxp50op8bP58IqiP813BjPk0qzsLBiO/0zsBsw4jjLv3ty412nhC8XSjsRccQkomlkjF4PAD14FJoViaJ/rNSz9TJVNmBRa6Bab0xf73RlFL2f3A01g9zD0p4Ez3edtYINDeKerXy3tidYB3SO3JLntxFANOcA0X6Pj+AzJRiUnTnUELDtsw1xITe/2KXK4tkWBjWQ2OhYoHeiQosYTYai4tO/JY7rSh6aM8D5mtMosMt27u7SPWWXnPZSMwoAUAnu/4tMv9ONonKTtTL5AU4XAZj9mRzl/baiEnKJy7FCyUW78g0HHYLx8/MEoww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9721795a-635c-4936-d768-08df04940544
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 23:36:30.1310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHyOFzhASEDEMwlr+DWF0VTcNKiE1uTLMwY5N8UYxRX5W6/XYPNharRy/zF2iyvRF189b5lIceYX+BM5ONQ6W/tBbiem5xOUY73x/Wc4eNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9541
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

On Thu, Aug 27, 2026 at 04:07:14PM -0700, Dixit, Ashutosh wrote:
>On Tue, 25 Aug 2026 21:42:10 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> When running the load helper with a fast oa_exponent, sometimes the OA
>> reports land out of order. Ensure that the kernel fix for such issues is
>> working by configuring all OA counters and checking validity of the full
>> report.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>> v2:
>> - add a comment on event definitions
>> - rename report checker for clarity
>> - remove unnecessary spaces
>> - u32s in one line
>> - s/576/report_size
>> ---
>>  tests/intel/xe_oa.c | 217 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 217 insertions(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 9ebb18690ec7..58e50bb182a6 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -336,6 +336,88 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>>		.bc_report = 0 },
>>  };
>>
>> +/*
>> + * test_oa_full defines only 2 events:
>> + *
>> + * 3e00 is "Number of GPU (gt) clock cycles at every clock period"
>> + * 7e00 is "Number of GPU (gt) clock cycles at every other clock period"
>> + *
>
>Can you please also add here in the comment that we expect all counters in
>a report to be non-zero with this metric set (or reg/val pairs).

sure, will post another rev.

>
>Anyway, this test is failing in pre-merge CI, so let's see what we end up
>with once we fix that issue. I'll hold the R-b till we have a working test.

The test is working as intended. It should fail when cachelines are 
zero, which is what the CI logs are showing. I am trying a local repro 
on LNL to make sure the KMD fix addresses it correctly, but the test 
will not pass in CI until we land the KMD fix!

I would land the IGT test and then report the KMD patches to ensure it 
runs against this test. Let me know if that works.

Thanks,
Umesh

>
>Thanks.
>--
>Ashutosh
