Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852CEC6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 13:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12BA112715;
	Fri, 29 Mar 2024 13:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmGjrsKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0940112716
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711719108; x=1743255108;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HPiVCQQUuZVN6r9HvW6xmPOmKDotC4Ju5FGY/mk7gaM=;
 b=dmGjrsKUY2f+Vun4MdXbMQHW0Z2sldHBkwz1y8nnl+9E12npfKIpS9M3
 P+I09Gp1Pb4CVfueWPqQQ93gTNXebdUaG1urcxSaj15Eb55/JCn79eJIk
 9n6tnT+or+/K+tvlwHL6clZJNVAOx5jo4Zxga5PbTCt/CTtAtOlsmxvcg
 yV8sIsqMLi+qvut9y0oyL/yuv87vvHRgmG07FoaxH28/XkX99AjEHz55z
 IlowVhdYK0oV20CA5whDrIWsmWaUNmBhsVxddEZ47garvPfurdZWuhR29
 9pNl3Y5YejW3wmVO9gDsurTmDkr056FYWl+py0OESML9ypaJpwX8DlT2F Q==;
X-CSE-ConnectionGUID: S5uhhIaORgGmLGb78QgUKQ==
X-CSE-MsgGUID: E2SPpERQR7eOzeU7pYKdJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17533407"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17533407"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 06:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="54429165"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 06:31:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 06:31:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 06:31:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 06:31:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcRJTbqFO8f1WdKEuqea+LbAKURdl0TkOfVIcV+TVJ9/EMBCFOXuqgZje1EJk2LwlvU0icrTqoYn+g8JDnT8mQsqOqzavp12turTw2WFDHjdR0jTkOGhaM1zPoN5Lh0ZxnzZPLWcqQt1wn6yrALxh5+GfG4a9BsN8oPPlvChcEerH6G10QK4XQV1Oj8iqEiXC3w1ltJewfmTBHprhE+qAWZ8eoKSTO23iKQZLQKAsp/LQZNrd60W6f1oO/EQMLRoEpbFWBkwcnPb6xdOGNiVdEzLsy4ZtUlHI0gQ0ZYfc0i6yqdgbM2q3D7VEKhst2IP3Anq9rWegDZnrNMiG4Yr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeEehdsdYo5QYFXmL8Ju1gqelQCs/kBmzLkfO23SR3s=;
 b=lUR/XzWkUmiHF6skVZz34fvEv3lP7bGQ4Q+VLtF9r4zDqBKil1/Svz218Oq8XZb8zYqOIks1GJrEVEe7+8Hjyz6TdnMPIBE09O858NS76GWFx46hqQxhPZEpD0S4G1g8H4mwhYPIo/oMkHuC/jDVfTLEiBx080X93mFbG8RhMfnA13nw4f9sRLOqU2kpglUrokauCTgkZdx/HdmXfPbcsv5cqokqvxzfl0qJg5r9nEhF6/NCwhP5HvcCasE7pEQs9tejaQZwkuhIUF3uIip2o0XqsOvBOFf0IBZ82Z8Z1vuSKwSL87SOezBw+o2GEIQteaZBtEWvmi+kqGXwDNWyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 29 Mar
 2024 13:31:41 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::cb4f:467b:3a52:9494]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::cb4f:467b:3a52:9494%6]) with mapi id 15.20.7409.028; Fri, 29 Mar 2024
 13:31:40 +0000
Message-ID: <94371ee6-82a9-40a8-b29b-9ef459f3ac6a@intel.com>
Date: Fri, 29 Mar 2024 14:31:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_blt: Add functions which extract and
 check object ccs data
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <20240329091655.1347862-1-zbigniew.kempczynski@intel.com>
 <20240329091655.1347862-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240329091655.1347862-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR03CA0030.eurprd03.prod.outlook.com
 (2603:10a6:10:be::43) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|DM4PR11MB6168:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eIa3xjGTTCvyK8r437zMxg6sszVC+C9w1VTpA57EG+50Pk5Ot39OESpUrqrFHYy7Cj/r1coD03JGrz2qDOkP8fW0MkC3BYb+jRrLbH6Hcmc5X9Bufyhzc5rULrCLoH16W/ZitCURklqn7l8EAKk06Yrq1fo5FM7tXERy7bfhYfF0qXSoNTPHX0CMHhxb4O6jvqosxM8STCHI/gGCv2plIuBl5CsRctmffcgzmaKo/lDZCU/kwAauRBq+zYySkX4r9CxHJxuxK0/PsfHn3F5ekL0r2S3vh9SnvaScZzFpV+sJFQly47MAaBO/5wvfisgJupEwfch4TmdZLXCv4tjE4CESV8ULyNXz4CI+D71tqPqgp6RNOBGY4028V2OLEpPA+QcirO4zClHLXyxJSJjJITVspUGfm36Rf3+/fU0PE8pnu9MfGZJG1JL2vC+lORKRiAHhS95jIEN8/H8SatJUxk961mbcapQnWGVh/2f92xZ4iJbhjK2XnA30SWS/4p3kNHl7BN8qJsh6wSmBoJvJwLgmsvH44p2p1T3/dHc11TbsQrlflztlSLNtQHrB+Rh/IzHEmaU2KuTpoBzjl7V/cNV4gpqMvnvHDiWDTOE1pFvTPQHKvwgwrEwcHE8NwsewAQyt1i2qwFnryVur17b7kCf4DCc7epNxW3k1vjUfXNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1d2VW81c3ZYcG9pTlhwUTRob0xacU5xTlJ5NFA4MEtHZUo4NHpxTmFOM1p6?=
 =?utf-8?B?M2ZCMDZGbkNUTUVWR3UzS3AyaXRjTURzNEEzNzlybWZJclZGSVdtdGpacFpz?=
 =?utf-8?B?YjhQaythVWxwVUtZR2x3WTRDYjRSQm9JV3J3YWFVOVQvRkRlR29scUJxQkdR?=
 =?utf-8?B?d29JSkxLL3hLRzY4czRWY3JEMzBNYzUrcnVPT1FXaExPT3BMYW5jZ0xHY3R2?=
 =?utf-8?B?QXdwU2dSYW1BaGxQYWM0dTJnVDBVd1dJVWlNRDhadHpaUUpnKy9jTVpUdkpC?=
 =?utf-8?B?dEU2WDA0VTZib1Z4VVJnNFVtQlJwS0s5WHVZekFZTXRrK0Y3QjlxbXVyV1lv?=
 =?utf-8?B?aU1DNzlWSHNHWWYzTkx1U0c4WFRpWGJRR09sbjY4K1phQmZOUVZzMmkyUG84?=
 =?utf-8?B?UHB2ZXkvRE1jc1JYSEY2U3F5YkdOeERFMmhGdXNLN3VhajZRSXkrMGh5UDVQ?=
 =?utf-8?B?bkd1Q1hydTRuZytDeEQzZzQxV1Z2OEVNVFBmamxvR2diQlFQVUtGQzhiTVhm?=
 =?utf-8?B?ampna3NjNVBvdG00eHB4aXF3NUdTZjdPSGFwOXU5ZzFaL05aczgzUFNETmZV?=
 =?utf-8?B?SUw4cGM3dXNlVktROElkMzdsY0tCQVBhenV5SUp3SnBwZlYxUmEvdlhQOUZj?=
 =?utf-8?B?QWo2cEdTWCtrN3VIeDBRTXp3ZFltV01DT0prL2ZhRjdSVW5qN0pxUlNrRktM?=
 =?utf-8?B?dkdVTE9aRmZCWmJTbGlGVGxJNEwvdkczWGYwd3Z2QS9mZkNGdWdQT0p5c3pR?=
 =?utf-8?B?UkQ4amZCelI0NzU3emljdXdNb2pzTTJBYzdHNnJ2TExFNmZ6Mko1ZWtOMXJv?=
 =?utf-8?B?cnBBQjFXV1ZEbmRWSHZneDcxLzR3VEhsOG9PUkNRNExFUGRyRnIxMjFjWDNU?=
 =?utf-8?B?aCtWRzNGSjVOSEVSaUlWYi9MS2U0czU1VXFJZUlzRjUyUmJlN3VsbEszWEti?=
 =?utf-8?B?aHBPbkF5RUZUNTJ4N1M1RFpJOXl1aUFydEF0TDhzYktZZ0RtNWJsbkZiMTg3?=
 =?utf-8?B?VFJuSEhjVHl1YU9XZVNNUnhFZlpHdm5GdVdhRTZVM1BzTVluMzh2UDZ5RkVv?=
 =?utf-8?B?VlVPci95TUdDUGN0UVRhUzNsWWI3NjNMWU5ZYzZ1NnRNSzQ5eURjd1VNV1ZD?=
 =?utf-8?B?MmdCaS9lK21ZWjJwVEVEQno0MU1laTJOalVQRTFKV1o1d3F6TW5OdWV3MC8r?=
 =?utf-8?B?YmxqOTBZd1lPMEh4N3RqQXJyems2WWpMSTlkNzkvOEl6T04yTE4zM1pVVzRv?=
 =?utf-8?B?L0VWSm5vbXJENmpyUHJ6a1NGYVI2b1pGS0ErSzFUNWt0M05jaDI0Q1JOeEln?=
 =?utf-8?B?eEZoOHFzTG5vVG45OU1LMWlwenZHWmwyaWVRWkYwMVJWRjBtNlZVaTJJOHEz?=
 =?utf-8?B?aXdvcWNQUWpRQXJUaEpEbVExQ0lFZVBBNi9Oc1hIbTBNUUdkTTNWRVU4bGt5?=
 =?utf-8?B?a3lCMGFCRXBqTSsxT1NqTS9PR05URUQrUitRQng4SHFSZi9ueVhpbnVCbWx4?=
 =?utf-8?B?c0I1dEhHeDBscGlEb2tUSndiVThRZDc0Q1J2dFdGeEJvUExFWjh3RnJTaTZS?=
 =?utf-8?B?Y3dzZWw1NTJPcUt0KzNhQkk2NktNU0lWcmpXeUs1d0U4emhGZ21nVnFpbXM1?=
 =?utf-8?B?OUdLZW9BRExBdnV0YVJEUldQUTdqVjBuaEVwSUV6SGhzU1lpdlRNc2VyN0U0?=
 =?utf-8?B?QndxNkppUEdFaU5CdzQzNEdIdzRhaStkVnFFZ2tzU2tXejhkZ2ppYUxVb0cy?=
 =?utf-8?B?aEtuNGhvU2QvOGx3cjY4MVZoT3dWZmlhbTY3TUNCQWlUTFZYOW1uSk9GSzN1?=
 =?utf-8?B?RGpUbnhlSzMvMkhWOGd0ZEtGZ2pzQlJFV1hua0gvRy83OGZ5dWNPQ1BUM2NC?=
 =?utf-8?B?TnFqdGJVckJDa25JWE1GWGRXZXhlK3UvOG9pUDZHM3JaZitUZ2ErMU5QQmJM?=
 =?utf-8?B?c1FqcnQycVpHb09QUCt3dXErS0NVTEZMVFdTRTk3QTgvdFhnUFFobVlRMkp4?=
 =?utf-8?B?NUpjdXJrYlFUVlZSdHBtYzlzdGkwd2FIYnd2Nm5mZTgzS1lGSTQ5ZGhmWks5?=
 =?utf-8?B?UWtPbGNOUFFJL2pHUVIybnRBQlUyODlOeUUrYUFVTldEc3lkZWpJM24zUlJl?=
 =?utf-8?B?QVpXZzFkRnVKbXdMQXdERTZWRVNzaWxSeEZ3SzNqTURuajV2VzQ0RGowTHho?=
 =?utf-8?B?c2FWQVVkUTR5THdWcSs5dEVjNjZ4V2NnOXJQeHMvN281UC81cE11Qkp0NHpT?=
 =?utf-8?B?dmVrdmdUWXJFNUFYSlhQbG5aN3Z3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e79a2e-073c-4585-f0b2-08dc4ff490fc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 13:31:40.5330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev8EYvsb9EcptDa46jnh/iOXLpCm9Lkz/PUmjXMVf5/hhwK+uzWwhN9Ad1Pb4ZDnm1OJgzTmmOd/VPgHhKSB2Dz2FHrdtP+VzvCeNCkz4rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On 29.03.2024 10:16, Zbigniew Kempczyński wrote:
> In tests which use compression we did very naive check in which we
> compare source and destination surface. For linear we could expect
> differences are related to compression, unfortunately for tiled data
> this attitude is not appropriate due to natural data layout difference.
> 
> Lets add helpers to extract surface ccs data and check if such
> surface is compressed. Function which extracts ccs data is defined
> as public to dump such data to png in the future.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   lib/intel_blt.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/intel_blt.h |  11 +++++
>   2 files changed, 127 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index fe0a45cb8e..fa8e61732c 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -2094,6 +2094,122 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>   		 obj->x1, obj->y1, obj->x2, obj->y2);
>   }
>   
> +/**
> + * blt_surface_get_flatccs_data:
> + * @fd: drm fd
> + * @ctx: intel_ctx_t context
> + * @e: blitter engine for @ctx
> + * @ahnd: allocator handle
> + * @obj: object from which flatccs data will be extracted
> + *
> + * Function executes ctrl-surf-copy to extract object ccs data from flatccs
> + * area. Memory for the result ccs data are allocated in the function and must
> + * be freed by the caller.
> + */
> +void blt_surface_get_flatccs_data(int fd,
> +				  intel_ctx_t *ctx,
> +				  const struct intel_execution_engine2 *e,
> +				  uint64_t ahnd,
> +				  const struct blt_copy_object *obj,
> +				  uint32_t **ccsptr, uint64_t *sizeptr)
> +{
> +	struct blt_ctrl_surf_copy_data surf = {};
> +	uint32_t bb, ccs, *ccsmap;
> +	uint64_t bb_size, ccssize = obj->size / CCS_RATIO(fd);
> +	uint32_t *ccscopy;
> +	uint32_t sysmem;
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> +	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
> +
> +	igt_assert(ccsptr != NULL);
> +	igt_assert(sizeptr != NULL);

I think we can drop these "!= NULL"

> +
> +	blt_ctrl_surf_copy_init(fd, &surf);
> +
> +	ccscopy = (uint32_t *)malloc(ccssize);
> +	igt_assert(ccscopy);
> +
> +	if (surf.driver == INTEL_DRIVER_XE) {
> +		uint16_t cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);

sysmem is undefined here, I'd move the definition from below to here 
(i.e., to the line before cpu_caching).

Apart from that, the patch looks good (+ one nit below). I haven't test 
it on my machine, but I trust you played with your changes to verify 
their correctness :)

> +		uint64_t ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
> +
> +		if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) && obj->compression) {
> +			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
> +			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> +		}
> +		sysmem = system_memory(fd);
> +		ccs = xe_bo_create_caching(fd, 0, ccs_bo_size, sysmem, 0, cpu_caching);
> +		bb_size = xe_bb_size(fd, SZ_4K);
> +		bb = xe_bo_create(fd, 0, bb_size, sysmem, 0);
> +	} else {
> +		sysmem = REGION_SMEM;
> +		ccs = gem_create(fd, ccssize);
> +		bb_size = 4096;
> +		igt_assert_eq(__gem_create(fd, &bb_size, &bb), 0);
> +	}
> +	blt_set_ctrl_surf_object(&surf.src, obj->handle, obj->region, obj->size,
> +				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
> +	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
> +				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> +	blt_set_batch(&surf.bb, bb, bb_size, sysmem);
> +	blt_ctrl_surf_copy(fd, ctx, e, ahnd, &surf);
> +
> +	if (surf.driver == INTEL_DRIVER_XE) {
> +		intel_ctx_xe_sync(ctx, true);
> +		ccsmap = xe_bo_map(fd, ccs, surf.dst.size);
> +	} else {
> +		gem_sync(fd, surf.dst.handle);
> +		ccsmap = gem_mmap__device_coherent(fd, ccs, 0, surf.dst.size,
> +						   PROT_READ | PROT_WRITE);
> +	}
> +	memcpy(ccscopy, ccsmap, ccssize);

The promised nit -- how about adding a blank line after else to improve 
readability? That would probably also mean adding one for "surf.driver 
== INTEL_DRIVER_XE" else to keep it consistent.

All the best,
Karolina

> +	munmap(ccsmap, surf.dst.size);
> +
> +	gem_close(fd, ccs);
> +	gem_close(fd, bb);
> +	put_offset(ahnd, ccs);
> +	put_offset(ahnd, bb);
> +	if (surf.driver == INTEL_DRIVER_XE)
> +		intel_allocator_bind(ahnd, 0, 0);
> +
> +	*ccsptr = ccscopy;
> +	*sizeptr = ccssize;
> +}
> +
> +/**
> + * blt_surface_is_compressed:
> + * @fd: drm fd
> + * @ctx: intel_ctx_t context
> + * @e: blitter engine for @ctx
> + * @ahnd: allocator handle
> + * @obj: object to check
> + *
> + * Function extracts object ccs data and check it contains any non-zero
> + * value what means surface is compressed. Returns true if it is, otherwise
> + * false.
> + */
> +bool blt_surface_is_compressed(int fd,
> +			       intel_ctx_t *ctx,
> +			       const struct intel_execution_engine2 *e,
> +			       uint64_t ahnd,
> +			       const struct blt_copy_object *obj)
> +{
> +	uint64_t size;
> +	uint32_t *ptr;
> +	bool is_compressed = false;
> +
> +	blt_surface_get_flatccs_data(fd, ctx, e, ahnd, obj, &ptr, &size);
> +	for (int i = 0; i < size / sizeof(*ptr); i++) {
> +		if (ptr[i] != 0) {
> +			is_compressed = true;
> +			break;
> +		}
> +	}
> +	free(ptr);
> +
> +	return is_compressed;
> +}
> +
>   /**
>    * blt_surface_to_png:
>    * @fd: drm fd
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 1f6c713596..d9c4d107f1 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -311,6 +311,17 @@ void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
>   			      uint8_t mocs_index, uint8_t pat_index,
>   			      enum blt_access_type access_type);
>   
> +void blt_surface_get_flatccs_data(int fd,
> +				  intel_ctx_t *ctx,
> +				  const struct intel_execution_engine2 *e,
> +				  uint64_t ahnd,
> +				  const struct blt_copy_object *obj,
> +				  uint32_t **ccsptr, uint64_t *sizeptr);
> +bool blt_surface_is_compressed(int fd,
> +			       intel_ctx_t *ctx,
> +			       const struct intel_execution_engine2 *e,
> +			       uint64_t ahnd,
> +			       const struct blt_copy_object *obj);
>   void blt_surface_info(const char *info,
>   		      const struct blt_copy_object *obj);
>   void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
