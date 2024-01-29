Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CC8C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 11:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B3210F6C4;
	Mon, 29 Jan 2024 11:03:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466D510F6C4
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706526196; x=1738062196;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B2FAyWUg3NSe+88IA/XEegVdtT7AZ6E6HVK4vlEqnh0=;
 b=XO2ggyg/11NtzbONLB4e6vDTsn2NAOaNSWPFvusG/UMj87J/1S5tG0Vt
 QqQafpmBKLHMFYpyNldh6EuOdi+iw/yGaCchn1gHzB5WhuLbDNiepWo+M
 65JRCsuUbL1EIN6U7eKXqYr5BPYvPaLIjZ+o1lXn5TQY02plnakHIuJXV
 pJxt4OBeBKQiDuD5vaFXThFoBT9IsZhaSrqWBBGpzb9hIdJA9FY/ZE5Rp
 KyzPTN102UxEURUSds4AFrketutdm1gfxeVeAnY+dXKhVyOGYUceLyb8Y
 3m+bFgywMoWrzZ2qoxIcB9Aqeo1t3XEbuF2Y021jXBSUBYiYtTREndXCE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="406642153"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="406642153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:03:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3359422"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 03:03:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 03:03:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 03:03:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 03:03:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 03:03:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghXJuXB5dcDB2FXaTaMnX3INOHQgDR70RJFGHyXVfk2d0QToYvt7z0rMcx89JD/um8+rufLElSbcS2P4qdoEgcxbrRoZR6oQsB3VWqo1FU2j04VTs4TO56zFCqiEMS0cQFoForYb7gDQueIkThhAHixHdfBUxUv09Cg1Nv8lipnqsdS+MeAWcSiNrqso76aQ9fV9m/w6zTxTvwTtx6HWVJssKCiDQvXnR9DscSwW7lPPZa3Fk4tnhJIVPXmaqh+cj4iZcPZkYfNNEzAM6/2THW8LLXK7/7TEq1XmJxUeg0KpO1hQVWR8jorRvdY983+0cmJaTcmuS/Zu+GFabAer4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osoK+/s+eLBd/HX5ky0XvSwrKiXFrcJ4mkDZzpck0CE=;
 b=RoS5xyIPb2AHhH1tjzHF46y5qeHl+osLmZJLMKKa1zXfRuyOorTmGsjDDBq6MtutWQHTP619b16RyHvMthgLjegOeRkaay7hM7OWF+Yd+y1x/qA6La3ZU05u9CbtMjhyRa+77sGvu0t7m0gKFIFumkMcJmCdBYfV9vLpo08TuMTOjf9KlXoCYhKxicKoAhyfmnZIjPFEAjFngdfQr3gr+dxfTDQKvB2yIVQqNPnobo8wsr43+vvxP+ALGZlimvanZH1l+TcD2Zs9WabeBjLzUN21VqiKmKpWlEaZxaEGMYjCV8P22+pOIB8oa//mcLvaoUqlrp2LwMLRg+3aGAtY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Mon, 29 Jan 2024 11:03:13 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 11:03:13 +0000
Message-ID: <e045c8f6-c15e-48ce-81d7-ac688ebe208d@intel.com>
Date: Mon, 29 Jan 2024 16:33:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_exec_atomic: Skip on unsupported
 config
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <janga.rahul.kumar@intel.com>
References: <20240129080155.31648-1-nirmoy.das@intel.com>
 <20240129084706.4abndzwylmz6z4pe@kamilkon-desk.igk.intel.com>
 <266dbc80-7c5c-48e7-ac4e-4aed3bd9f5a6@intel.com>
 <20240129105525.ytxcchtjvvr3lnig@kamilkon-desk.igk.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240129105525.ytxcchtjvvr3lnig@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|IA1PR11MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da59c4a-75ed-479b-00f6-08dc20b9e2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6RrM+HCrT3nJN2JeOfNITpChNW2cqst2q2/A+isvi2QY3nOHp4oRHqbossKwBsgELJLs3CwL47wY+ZE+x11y/k6HozBaUo39gPoyc/IcOrhVqf/Tadia5W3BXM4oVn3+72dZc0AmEAhwaOspP142xNkA558dHJrBrePUrmjiWiqvsqGoY1O37aZMLcwstSubureBUGLe3bSH6BHZuyqvp/HPfhEqGzhKe3gni2CdTPm4Z3YqJ0e+akiJjNKDV0pN6F1PwzvNoaMarsPhVIYtXyqfWJuduybjuntmf6FT7rjn6Y3uj/I8ITvrSRvPOuz6/U+LuxzmqtdQXXfu5nfrd1Uv+rTXybFhCQ2fQEZUx7uwRsSAYnUVYRwTJle4v2PQVNRS5vHCaaeyIBJ60XrzhN7eSi97NlKzYoLKdizzucA6X08X5/3RuZpGZA3JBhwxAcT4Jv7J29qB8bAYrZxW4dqygKPGaViJlqyDE271nch/+VnrLIMJORWEk80hK+nORUf+AavHH4XBupPb71vggZvC6cIB4HAOpRgHY9tShWqSSl/Hpy6G4S4Xnr4YrAxDbMkmSFftsjkMW2Kqhk1cAOydVD6XZIXG+2O+W+PsiBqBr19WcVf7gS0SLJwCfZ/VxzdCOSlhFlg/LucPJh9Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(136003)(346002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(8936002)(8676002)(5660300002)(31696002)(86362001)(44832011)(6486002)(6636002)(316002)(66946007)(66476007)(66556008)(2906002)(41300700001)(36756003)(38100700002)(6512007)(53546011)(478600001)(6506007)(6666004)(2616005)(82960400001)(83380400001)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpheHRMbmFYUG5iZW8vaWZYdWdGU0J6SXo4eWVCcFovRGpqckpHa0ZXeFFJ?=
 =?utf-8?B?R0JkbG1nbjlUOG9GNjRuT21ScVA4S3RBWlcxT21DYWJmSHFmUENRbVBjKzhR?=
 =?utf-8?B?Wml6UGZ4czA3MFY0RkJPOGNGVXFqK25lMERrQWx1bys4M1JsdG1XWmdnY2g5?=
 =?utf-8?B?bnM0dnI2MjBjeENtMmpJSkNHd2trRU1mMTA3VXUvUUtmRHI5U25QQXFYZHZu?=
 =?utf-8?B?WTZoS3d1RHI1aUhKeHBlRFkvUlc2RHdvVHhKTUhURzZvRDZFQTlRcklSRUgr?=
 =?utf-8?B?Wkt3NU1YWXRGdjlmUm8zVWVXZVQ4RHFrbWhpYVNkYUJzMUx0RGJzaXUrRTk0?=
 =?utf-8?B?RzQ0YnhRS0ZBUVFEOTA0R3pPSHQ3bHUxSXpZWXFjU3N4aXRBVGdGR3duUmd0?=
 =?utf-8?B?VWdlUDF3ZzZ3RVRENFFEemJhRXRoYTFPODFURHk4ZUwzTTgxaHBqRG1teWo2?=
 =?utf-8?B?MVJSbXdLaStDRXpBNWdRQU13V0tzaHpsYnR2dCs0WjMvblh0WUZBVEJibm5H?=
 =?utf-8?B?L1RJNnoyTERDOUgxOXovRmNWUFVKUnh0R2huWGFvZVI0L0NwU1dkY3Q3aElH?=
 =?utf-8?B?eHFRZThRR3NqYzdFTjRpMlRhRWFUT0EyVUNpYXR5V1p3L29yL3FicTBjMXlC?=
 =?utf-8?B?cjFkbSsvdC9OWnk1NGl2b1BMSFU0SW5mRXY1eXlRSmVubjZUV3pjdUVWaGIy?=
 =?utf-8?B?NGVPRkhCUWRwS1Fobm5IQ3UwZGpMbFlUVXlyVkJKNVlHMXE1WHFXVjljTkha?=
 =?utf-8?B?TmhXSmxucmE0dndRdmR5c3lYcDNad1JIdytqTjh6UEtoT0JJMVpnTnZLMkhU?=
 =?utf-8?B?cGc3aW5JWGRiYS9lUFhvbzIzd0UzWVc2bWcyYkVZem85VG1NM1lId2VjbElv?=
 =?utf-8?B?TTYyYytEdUwwQUpONnpNVFZxN0UvNUFJRTROaEQzS3QrNWFWRDZXQXRKYmhM?=
 =?utf-8?B?dE1KOUJ2Y20wQUdzSjJoR3VIcFovVGlweWIzZTVmTllFYWV4WGtHVVEyMzVw?=
 =?utf-8?B?NThsY3V5aWxVcDVkKzJlREVZbVAzQWczcm9iOHpqVzh4RzlLOGxnSFpTYWl2?=
 =?utf-8?B?UHNpeDBhSU9aTjRRa213LzdTSjZlT2gvK3JneDY0QkxkQ3dYYTFlVHovNExF?=
 =?utf-8?B?Rm5tbzhBcUE0MW54dnNaVHdyUm11aUlpWHFIK0ZPYU1WeWdyVnhsemNtRG53?=
 =?utf-8?B?YWdJTVZsUkVORjhFT0M3MW1DVGdEUzN3azQzREcwcGJLY2Rrejg1WG82L0ZD?=
 =?utf-8?B?SWZ3d1RlNG90VDlyb21nN01VR2ZyQ0UxRTB4UVJVZGdvTno2eHJvZTZ1dXJP?=
 =?utf-8?B?RHlNZzFMekJzaTZ1U0FNdU5CZXA0aHZzQlZoelN4bTk5VGhGVC9pZFJiZWUr?=
 =?utf-8?B?RkV6T1o5cFV3VzJEVWlVZi8zcEN4a3ZqZ1J0NHRqNEp2Rm1YTHFZQ2FqN0Uw?=
 =?utf-8?B?N1hobi9sdXhVb050OGdjSER3M3NzZ2wyL3FCNklrQmRIaFp5bTNpOTZiYnZW?=
 =?utf-8?B?c1NMeUprdXZFL3dkcERSODhMaDVDZTkvZE1PQXhkY1RhNzZTSytXNUVucGFj?=
 =?utf-8?B?dzdQOUsxUVMrQWhqNTRNK1FIc09oTElnYzN6RnIzYkF0VWh5QjhLVnc4L2lh?=
 =?utf-8?B?TjhGQUhHc29VTWlXcmpHOHkyU2J4MVBOUVYrcVkza2JpZEt1SlFtakFsYUZN?=
 =?utf-8?B?WllBRXBqNU45UUptWnErcjM1ckltOVFBOHYzUms3dkl5VE5OVldVYVhxckxx?=
 =?utf-8?B?a2M2d3BvLzVCcCtQY0x2STVpV1Fpc01hMnVpWDdNWGpvSEY3aG02dTFHamIx?=
 =?utf-8?B?VXd1cVh2d25TbDFOMmZHWmlPVVdLaXlyMEhmbG1rZlpRVVdNNGxtZlZ0dnIx?=
 =?utf-8?B?eDlPMTBtVGJxcW9pTzdGdEZIVjlvWk96RnpPbXZrc3pFeEF6RmxScW9nZHgz?=
 =?utf-8?B?R0FqUHpHT0pGYkZBcUk5MXU5azQ3dWREM05rN1F4N0dnWitDYkdNL0luejlH?=
 =?utf-8?B?THlVWXRNQTdBZGM2VWtvczYyWkt1enE4TzZrbzFFNmZuYXBFWm40TDl3QTJN?=
 =?utf-8?B?RGRWNHFqYi9wQjBhZHI5dFhXdUVXZ3Nac0RYbzFYd0J5eU40blZxaHkrMmJC?=
 =?utf-8?Q?mW3klqPyJGgJmSeK/PtDGshUe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da59c4a-75ed-479b-00f6-08dc20b9e2cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 11:03:12.9112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gb5Qsz7LkrST3onGx+q0RrUnd0Gs+/rlC78pldgUH6yDfQKOwPbFHXyEX405yBvpFChIhR1pW9DU0EoJ9r15Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
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

Hi Kamil,

On 1/29/2024 4:25 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2024-01-29 at 14:39:17 +0530, Nirmoy Das wrote:
>> On 1/29/2024 2:17 PM, Kamil Konieczny wrote:
>>> Hi Nirmoy,
>>> On 2024-01-29 at 09:01:55 +0100, Nirmoy Das wrote:
>>>> Atomics on system memory for dGPU is not functional
>>>> at this moment hence skip on such configuration.
>>>>
>>>> v2: remove the skip_on.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Thanks, Kamil. Please also help me  merge this one. Currently I don't have
>> access to my devel machine.
>>
>>
>> Nirmoy
>>
> I will wait for GitLab merge and xeBAT tests.
> While at this I will also change subject, you removed skip so:
>
> [PATCH i-g-t v2] tests/intel/xe_exec_atomic: don't test system memory

We do wan to test system memory but only on igfx so you can modify above 
accordingly.

Thanks,

Nirmoy

>
> Regards,
> Kamil
>
>>>> ---
>>>>    tests/intel/xe_exec_atomic.c | 9 ++++-----
>>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
>>>> index 7ee80816c..48c70ec72 100644
>>>> --- a/tests/intel/xe_exec_atomic.c
>>>> +++ b/tests/intel/xe_exec_atomic.c
>>>> @@ -112,9 +112,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>>>>    static bool has_atomics(int fd, uint32_t region)
>>>>    {
>>>> -	/* System memory atomics on PVC doesn't work */
>>>> -	if (region == system_memory(fd) &&
>>>> -	    IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
>>>> +	/* System memory atomics on dGPU is not functional as of now */
>>>> +	if (region == system_memory(fd) && xe_has_vram(fd))
>>>>    		return false;
>>>>    	return true;
>>>> @@ -135,8 +134,8 @@ igt_main
>>>>    			uint64_t memreg = all_memory_regions(fd), region;
>>>>    			xe_for_each_mem_region(fd, memreg, region) {
>>>> -
>>>> -				igt_skip_on(!has_atomics(fd, region));
>>>> +				if (!has_atomics(fd, region))
>>>> +					continue;
>>>>    				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
>>>>    					      xe_engine_class_string(hwe->engine_class),
>>>> -- 
>>>> 2.42.0
>>>>
