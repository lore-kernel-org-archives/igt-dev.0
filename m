Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E95CA5FFC
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 11:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DCD10E023;
	Tue,  6 Oct 2026 11:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWQwKEwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8FD10E023
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791287524; x=1822823524;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=WHX5r0gM4CwUVaPni7q7JkI5AH1Y3IZRhZ8BL8ydmig=;
 b=MWQwKEwcIflSf8b0GJjKW1U8oDQjqDU6f6/q9CNBOrORgtkU5DneL7gS
 pJdvn7CHyvy9LzT6JAsNntwxs2H44k5Wz6Q5gfvu/oaEtz5pr5KZH/m7C
 mdW3wsGs6Q4QplXNj9L/kexev7w2f5y8U2VdWxXOTHKv6WiYPy6suAIHq
 enhoyLU3EhZbk1PLjQzI4JQlk6EqJ17eGYHxhQ56Fdaxi4d8zrjuODAYI
 VfZdBijgDCWHP84v5HInr9wV93DWysr3C+6J8xPmUkvILhRP6lVS3vUdH
 +4hDkzgDkVLHW5N/R1OJobEBwEkVVTyUjzwe/4k6o+PNqYh1yT2n6peRM w==;
X-CSE-ConnectionGUID: sl4gD2TdRpqKyI8N7NcuUA==
X-CSE-MsgGUID: wKT0IwxXSlGFmgihUKSRSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="29113"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="29113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 04:52:04 -0700
X-CSE-ConnectionGUID: ahFEtUUnQFCd535Vcu9gpw==
X-CSE-MsgGUID: VMtEQ7eVT82uQnNn9EqqgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="315151531"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 04:52:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 04:52:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 04:52:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 04:52:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILlW05h880CvxV4mQkBjDdVlrB5ui8JXkGMo4dqDhxtJx43WBjnVSxtoNBwUsKe6kRVnXWblS2zATXrgYqVGLmCpjgc3LpNsR4bwAxZhh+xC8QdVBRNWzDjpJA9FAW8CMFfNYggp+UaUrtjJZTZKplK8Z9phyAByXI6oFg79Oav7m3NlD55fcOuxeTHU6Kg62iIbxp/0Po1g2usoyq0tU6RqubQBC6THE18CgyXOM7YoyRuBzUHxjEdMzyycuyN4LdUuSBa9cF1kfEs1tJ2Cec5drHdmGTOcLf2n6ZIdcuVD9tFDhIyFMuS8TELR8xfQ1Mp4XhKE1WsgH8KwJC0Pyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GA5YPkxgUMEAJAEbX8tPVdW/C8bViHSdcvMy2RfK33g=;
 b=NWWp5Y2L0Bdu3cKRAWTMi9a8N8UWtI+ApAR8L5mQthpNIzLbZ39XYeBhtqo72quhDdaUH3f/b+llPKuaDAkBE5jEnFIdJTrovCHffjD4PIKR7zKJv5BsOi8YOYjM4UUhX87QPHNimPJEg7SzoVU9ytDGIE/SmSd16dj+bHMnjVzJ7vtWRjIHK7IrRzYUS5HnK0StkrkZPkFgDTvzLTDgtB7sJZICDzJdN4tvETE0Y7LW2RgA2Aejidgu9NlSU9+wVg7lhOxeMsnHvUeaw4sGXuyuClCzGLONKKEjo1fmyNUkQOHmZ+vNmrdWYh0XQF2H9wWhRZ/Yjye9CdsypGj0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 6 Oct
 2026 11:52:00 +0000
Received: from SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67]) by SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67%6]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 11:52:00 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/xe_pmu: Do not enable VFs in unrelated
 subtests
In-Reply-To: <3d8faa2c-0327-4bb4-846a-18066858ff8b@linux.intel.com>
References: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
 <3d8faa2c-0327-4bb4-846a-18066858ff8b@linux.intel.com>
Date: Tue, 6 Oct 2026 08:51:54 -0300
Message-ID: <87zewrcahx.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To SA2PR11MB5100.namprd11.prod.outlook.com
 (2603:10b6:806:119::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5100:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 6911ad2f-7e8e-4cdd-d05e-08df23a03ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: yLWu9QN3YqwnCPNqdnBC98Dx1uF46VXH6A7DYk88aIMmbd9E47gJtNJZGe+E0/MiUwpV+PoA4tuMgK/zAC6MfLwZPPVTiQO+IvyDftdfKmET9fFgEpbfHij5N/FCEl1xhrxmxLR+LLOnQXfaKH+fiLwnUJPM9xY5xMVr1HDPSxopSWBIfhCQwIllf/uQA2jWrqQg8407HzLOG5W3b5k/Y4bAJp6xn5oy2r5VWvHGsUsUl5I/HHmebvx436rGvHFFGiTBZV5o5c4Mdix2c/xxujqez3qyMgBl8k/k6vs+hkqD6BgIo3IwmkWT7YjlvjibPggJhl9TfBL/GsWWtMb/mI8vBP9GV/zlLQGZG4/qfVl1eb7rV7oNmR7GmpqvtTACVqOaegAKtCt6yFnj2b9t8XDLwHD4AiKJnJtsbqmY2LejMBUscv1Lc3Y87nosRMqbewJRoNiWLK7QgMYa9wRKxo/IftTAQjP/T8IuKrXCc6lzOuuNSVlgZ9UGzfNnmS8p07jF+roowjSHAKv96xWT3JrmIyWuuOtL4VkHZHjejGP4vjL5WsrOBKtEACBGykVmRp869QOQn42wAuSoLmcEQ11VazBikIKkXjtQ4AqoO48jEYo7dl7nLacGfH+Tg4RDF7rEeW/ME3dOPArq0a0xDacNOEBMxoANzrA2pTVbuYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5100.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rlQgcyYU1Agjgh17ZTJdNTtTH+04B5h6GwguxDoIJAW4HdutkPGGB/ONoV1K?=
 =?us-ascii?Q?ZcPQCf7IT7HBRFH7vXIWPfsRTyijPK9Aa0tzYBA4cqrQhyGArOY1vNfSQnVx?=
 =?us-ascii?Q?1/HVazqqGCqqa3XHbxefkzyNuqy0YGa1vwb4+siLS9Q3yLcpkXLl6SAKerbT?=
 =?us-ascii?Q?3OF2G0silm9u7aBVohZUel97j0B/MX7ArAianfO4cGHOQlb0vpXpchD6M2D8?=
 =?us-ascii?Q?R19z8S1f0RiWttr1dFOcoJQKZIKFi1Qg4oXgj8Otv9S9GbkElOCpyuPdumkS?=
 =?us-ascii?Q?+2vArxbI1cCMc5KRmohxMicH9Tj2xnlifd2PvWXhRXyBOom9pH4DjN8shd5E?=
 =?us-ascii?Q?XWkKY1v06Ju2yTSGoPyLNL+PZk/LdXcsEVntXhrgWHLkJeTghtJBkbiSALuy?=
 =?us-ascii?Q?KbtTM4rmpUpaVEpWnzohiEo846C6QQRQtgrT22y0/vRIfxtAQe2oKqECUBUl?=
 =?us-ascii?Q?q0BS0c6ZZ6WZtk1LVuIU+GbaJFsFy9F/dUDD6AfYu/t1jyeZF0FLIUEWrF7q?=
 =?us-ascii?Q?dE5OwmuX8tdIj+zXP7FQDrMvJVsWfgUcsS/W0eG1hgQWsktur+DvRjxpZ6On?=
 =?us-ascii?Q?I42p0o+PhFdHRALsj8gbsOg8HvR8K0DYYrNV43jgkZEjgCJqAHH69NnJ90sS?=
 =?us-ascii?Q?lflbq5W6sLHrdi7sQ61c3rJPjmr4U/FJwemCyyZtvac3dzz5YzIxq1yPkx5o?=
 =?us-ascii?Q?zar9FF0QXyMfth6m4Tf1ZbLoD84dMUBfNNYIQdUzb/oHQuVcorfbCDWOgxiN?=
 =?us-ascii?Q?gNLv1UWEeO4D1h1Wzo1Sq8Rn+hHIMgo/9lofyJ2GS004pskw6Zxx+OLes72C?=
 =?us-ascii?Q?jOG3SzIZqJAe2Hr0GAqqx8VXtoDubongw6wlA8T+MA8HDLNg/dZk1vMoAZvf?=
 =?us-ascii?Q?Cq48r5m7S5tbptMHyMyb1lprz2YjSSmToQrNc4mVTvIvUlL7lstAP4RSCp7U?=
 =?us-ascii?Q?85duBTXtOVZwd6JqDBjQ3IKxZ5MMgQ5lW6jd22091IV6c8iLgta46/X5ecz+?=
 =?us-ascii?Q?ZhFv9nzSXnIYQfxe1KfVtZKyeLRUZ3jC/LNlTGdtQNnnrdHJa+icnXH3E/35?=
 =?us-ascii?Q?QPosuXWpLw33Hrub9Tytx3DGhN8ptKVdw9szFXekhAt0LMgvSC9cyc5PxDrT?=
 =?us-ascii?Q?k1q9f86gA/scIXvmBIxKeevp5parN8drUzXV7HobNTPtPiYW9rlV/deesmAw?=
 =?us-ascii?Q?Ea8l4wHAmgr+DtEl5LsbUyLewrbol6CqoyupejIqWBWBEYwyS/LE8v1exeOC?=
 =?us-ascii?Q?sL1WExap6vsVn0jrePgpeFLKaP4crq9F5oc9eWP4IDIZB7yvEQGdjkms+hkY?=
 =?us-ascii?Q?L46uJ8FRFSgTI4HTUyGM5QVKhzFUe/vMxiPwjfLa0W28NDVNbUvzzHv8Ggsr?=
 =?us-ascii?Q?6nthc0WPGloxwQJ7iBUgglg+SvbHAoN8TO2+H4K479JNIHbn7wFdqy2H85hZ?=
 =?us-ascii?Q?+4P9AtdLTPIpOopLTVjlbUZvlYDvfk7H+ZdiJDUoxHVGDEVSrK9/HXJvF6wQ?=
 =?us-ascii?Q?lghu81EBF7/XNHHgwkSSUKGAEKAuqY26eRqcJF/aS0BU1eWNMYfV3hAhytjN?=
 =?us-ascii?Q?E/dzMK0JUzRCSZQONDzts5anENKffV5S3SDH4ZYlPJQ8zhzHRyHb0dbwgfnp?=
 =?us-ascii?Q?4fY52IgSDYaoqIWk85DA4r3s4PW+h0u09x/yWW9H03vz2YDQq1jMe+4JnPhb?=
 =?us-ascii?Q?vL28UPJd8j2ftmCL+HJW1LLImxzqu0tRXpzSE/fDoMiIq9Yovv+J6D7SrOBW?=
 =?us-ascii?Q?KOdhiBc6nQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Mj4Fy0dR0yfrIcmA7LUl9QvmYkqytZAAisKY/duIo4dpFbH4dN1abW1Q/IjNx4TI5PUXGiIv9UHClg+u8XsO0I6GLlFewld98tbZE+IWMVYi/3u/IfDVNMDtPNOHvLxD/izuO4HcmoUBKxZ2pOvRgdLQ6ghpOJISoVssZOeBs4+udrNCYwyy/J5Rn/6awzHce020XdW+qT5SPttiJAbLjPm1lkaq+J7jLHoYQsJjJk4uMkazy7waVRGC18p/r3NoJoSQrGS0s/Ze7Tzrghv/LbqTtM6vO9/Q0/BXvNGaZtNKfB+BlVg1ErJ0jvkJytw1hUDV1TLxCeFEEEPNSXDbWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6911ad2f-7e8e-4cdd-d05e-08df23a03ac8
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5100.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:52:00.3579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILEtDAuwFp+5swnmsKN/alQ4m1TJE6QTmd12v0ky8vi/HenI9snGlrpTBqhh9dIeX42YwNE3/Yhvmsy8aDeigw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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

"Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com> writes:

> On 10/6/2026 12:40 AM, Gustavo Sousa wrote:
>> The test xe_pmu has a subtest group that enables SRIOV VFs as part of
>> its fixture.  Even though the fixture is part of a subtest group, the
>> enabling/disabling will happen regardless of whether those subests are
>> selected or not (via --run-subtest).
>>
>> As most subtests in xe_pmu don't need that, avoid doing that as a
>> fixture and rather incorporate the enabling/disabling as part of a new
>> macro called test_each_engine_with_vfs().
>>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 21 ++++++++++++---------
>>   1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index d41ebba1faef..79d466093d1d 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>>   			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>>   				      hwe->engine_instance)
>>   
>> +#define test_each_engine_with_vfs(test, fd, hwe, num_vfs) \
>> +	igt_subtest_with_dynamic(test) \
>> +		xe_for_each_engine(fd, hwe) \
>> +			for (num_fns = enable_and_provision_vfs(fd) + 1; \
>> +			     num_fns; \
>> +			     unprovision_and_disable_vfs(fd), num_fns = 0) \
>> +				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>> +					      hwe->engine_instance)
>> +
>
> Could we move xe_for_each_engine() inside the VF setup loop? This avoids 
> enabling and disabling VFs for every engine.

Yep. Good call. I'll do this in v2.

Thanks!

--
Gustavo Sousa

>
>>   static bool has_event(const char *device, const char *event)
>>   {
>>   	char buf[512];
>> @@ -1192,26 +1201,20 @@ int igt_main()
>>   	igt_subtest_group() {
>>   		unsigned int num_fns;
>>   
>> -		igt_fixture()
>> -			num_fns = enable_and_provision_vfs(fd) + 1;
>> -
>>   		igt_describe("Validate engine activity on all functions");
>> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
>> +		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num_fns)
>>   			engine_activity_all_fn(fd, eci, num_fns);
>>   
>>   		igt_describe("Validate per-function engine activity");
>> -		test_each_engine("fn-engine-activity-load", fd, eci)
>> +		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns)
>>   			for (int fn = 0; fn < num_fns; fn++)
>>   				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
>>   
>>   		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>> -		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>> +		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci, num_fns) {
>>   			for (int fn = 0; fn < num_fns; fn++)
>>   				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>>   		}
>> -
>> -		igt_fixture()
>> -			unprovision_and_disable_vfs(fd);
>>   	}
>>   
>>   	igt_subtest_group() {
>>
>> ---
>> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
>> change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
>>
>> Best regards,
>> --
>> Gustavo Sousa <gustavo.sousa@intel.com>
