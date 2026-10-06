Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD7CA5FFC
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 11:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D636E10E063;
	Tue,  6 Oct 2026 11:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4Y05vYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FAE10E023
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791287950; x=1822823950;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xtPdQ5Tcd1I3la/+0RQyFBGvPisfpg3s5R2RUVZBFS0=;
 b=d4Y05vYFublzNc1iJLIynoRJFnOyr/W69KGwP1iq7t5yt8I4aJLphCtu
 dfP29x/HwKEaM8+F1NjmR69SSKQ9m2kAEvJwBIiEiaJiLsNx3WM6+7Yfg
 Ov5ZUGE4MH9mJfaIglNmZdymap3H92tAGjrqjfG0Jnbhnn6CzlAEURA3D
 yvbc2x9p1Dv1MlB4s/TAa4zb9Zashrq1LNd2vyzMlDPcFfBlo1yvWH6zL
 vc57K2XOsrEE42lwBSNG9ugpbko2fqgP6QyXvBuoEDXYLH7BLPD00z4VL
 na+XLJ5jXD4TbLFJrecqDucY/t2lMA2Vy+N1ctJxEoZBzPRHWd+PR+AaF g==;
X-CSE-ConnectionGUID: 7gKU/AK/RGC/ArmaRVA9XQ==
X-CSE-MsgGUID: NZfhEKrzQHGc2TRtMLj4+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="32552"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="32552"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 04:59:10 -0700
X-CSE-ConnectionGUID: sA/PDAbcS4KMFrsdw2NEVg==
X-CSE-MsgGUID: Lug2YddaRvGscbbgcJSOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="276662684"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 04:59:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 04:59:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 04:59:09 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 04:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9Ap2Bn7G79xotCm+Ka/CUMvJQxR+mDCp+CTjgFcwW9hVjVVdy294P2XjrU+wFFpgSusyqqIEySaXBqAO/xdwEYoe0ofJAH0nffVyqY2cKc7oP8Ryg07NTQe4bWdKXoWTq47BdlYi6EHg9Kg781EDu89K+tEVW2nn/qP1YU555AybMrodUa/vWvegxN3Yh4IClVljujYvgE5CMxAqlAwj0F3iRWN9G87dWCadzol1qNkiLRvUR6pEHYTrjdUqfnZkxjE37dex99zKwRa4F5/yqL90Iphi8p3XjZDzVPXmBwvb0AGDEy1MklTVYYpbZaDMXi40RBHLmFO3gfd51mhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiYtKG22SMpTTeWtRnDSjAACAWJXwHFAiKrt3I7K7gk=;
 b=i3NKf29ZZPWIVJ+MbxXoKH8tn6apck5roJhfDUf2ppXd/0pE4iDG/JrGlDMHm/M09CtAaA8KHL7qN8Utg1phAQSkmTMvsyzlAjuTn/XBuRqc15tW7+TXD7kWFNVyzsw92cO7uhb2rVg2cuXU58cOJ29IjJdpjKUllCm/aaDoDPy/k87q3C2uEkykwssCAv6yHTJNWFETZp5vCFpr9ANecgQJVr5Qr+RQkhmf0V+brN3709wh4uCa6a02YnB7EiSWe6+15GEKUHr/WjfghygPpVVu+ZniJh+z0pzpfeTYrAGtzfbErB1Mccdhdo3YWuXtjn6Uz3RhGcdT/RdTonZ1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:59:02 +0000
Received: from SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67]) by SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67%6]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 11:59:02 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/xe_pmu: Do not enable VFs in unrelated
 subtests
In-Reply-To: <20261006085502.csxdvhiysrig4ud4@kamilkon-DESK.igk.intel.com>
References: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
 <20261006085502.csxdvhiysrig4ud4@kamilkon-DESK.igk.intel.com>
Date: Tue, 6 Oct 2026 08:58:54 -0300
Message-ID: <87wlrvca69.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To SA2PR11MB5100.namprd11.prod.outlook.com
 (2603:10b6:806:119::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5100:EE_|PH0PR11MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: 6773c9a0-9e7f-416f-5def-08df23a13497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: oyIvksA10eTPALXV4fKfXo/fQZcasbGrIF3layZ6nlQIauBPSUukiEVzHJS/LePMbm3zpcC1QsWGl8q2RiQ7KYbXncfT/x3jNcfghWLMD/opuQOlL/zRuLHs47UIItkaGo6GIQTHwPYEXfpmaCATofM+eB4kcJ44e7f3yP/alnhpw8oVA0w4jM5QtS/2jEvzGqT7vdo8ZWjg1wghnbiTZGOE4k+l/l/fXA5Y0zs0gc69jeHcVl8+UnDJTamjJ/4ahfBoLzIOMmTa9OnrbOpICp6RNpq78nDnKF+5zxlIbLNFtnihVYhqJ6BxFcNV3ggVNMJmmnfl3s6w5ZVXbjtDFa1eQbmllfMrOoX7YA6qVkNw/HBMkOu7xoZnoxvZvaK7791SwYDkNmjB8xv6TQvnoQ1rtEXfZm/diVH+b0P0aV0ddg1EGxGbZigDzyfiXcYAeLSVbxF03poF7qT/2EpmEF+oOLHBY2xMuMwEt3G+eHpHLRDshVtG654C9C9ISY7Cox8smx0TWzVYvH6SA2wsjTDxh45lUmXz0DKKCeqQDsVh/uxZ1BtiwcIHl+q/3VrIxSMQzKuAu9zr+aANaNiFytnbv3ak8mj0v+375NJMxskiMvgZEoeKiqbNnegYggogZE9wnOSfUq/NXKxLnw0vljbAa4xYTwGt58bwmaSPXJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5100.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L5V4sVPyvY0fhnEjwJjfxjeoCvXamgv5QXbdcGEwPu5TO5IgUr8KVyOaI86s?=
 =?us-ascii?Q?QLLhngToLIKd2w+qPk4JDAz992mzcGupKcp7Y6ZkWqWUteZWqLyoJiOJjdgc?=
 =?us-ascii?Q?9W9oED329mkNMc1GEM7rd6C/0haqLSRxd3LocE2FCgnUz85UMZ+U1pWBgOdR?=
 =?us-ascii?Q?cgW3PKX1faARClLlKvisQawCVjq56RWYjJ5RybXJjMmGcLwIC5F7KYjRcBRc?=
 =?us-ascii?Q?SvOXyNJpqgzlCqO+VjvWwA8JABJiVnN+SDBvHgkZi0v97Ajsrjvf9hWt2YVY?=
 =?us-ascii?Q?tJIXzxUp6EEK3Cic29l2IIdt2km41IxDahn4GDsleOi09zAzeS13Dg+yupaf?=
 =?us-ascii?Q?mQO6Ke52Gz4wqu8Va9KQwPaBQZ5tsDYpsJGAAg3c5lp7nnrk1Vm6bx+S53Bi?=
 =?us-ascii?Q?180efcK0JtltoiwzzYzUxnWEFSGbJKi32Wh4JLzDI68NvOZCQm1xQ8jXRdn/?=
 =?us-ascii?Q?xUx8hDZ85VOutA97PXU4WTOljRDGmSzJgOSTiv+vRkLa0m2FFZNI7hEhLm6e?=
 =?us-ascii?Q?TLQyoV9cXKiyH2ukrvhR8/Ac8R/jVD6yGG2cHODlCnbc0B6mVQEX2oRLftu2?=
 =?us-ascii?Q?TpqgSSna994YexPYjqMZwmjPno7HMwCa90FOLZAA0O93XEsXbva2Het2UiLo?=
 =?us-ascii?Q?mKjJgA3wL50F9B5ORP6eaH8Sv+dX1pX84yDl+Pv585+hKb4MHJmaF7xg3W9C?=
 =?us-ascii?Q?5JkeEPjFk2vYBeI+3fX9bP6RJT8VJaLExFZxIfk+C83Q01BxHb+IGLlk8n4m?=
 =?us-ascii?Q?5qPgZS4Hs2KKJM9/6dpgY3OqrV3Vm5qrCv87c8r7FvPGI/qqzxfOUWov/CTo?=
 =?us-ascii?Q?MO3q6jnowrf254kWHJLsInNY1AEYsg/fYgNSeLu5/0m5fiUj5beyGeqP1yHH?=
 =?us-ascii?Q?hqLbjC+UcfcdhlWgnuicXwVOcWlH7Nusyyb5ZSM5xYi3/5Huo2sfoDUtU78S?=
 =?us-ascii?Q?jHdI4pwEpXHaCj/0cWvYSWagQ23IL6V952NSOH+1uyDXcSpdYc9Z2189QiAJ?=
 =?us-ascii?Q?GfQkj1/zWtZ5gdLwD590xmzdkWviPPpxWqZm0gsM1fIWdlwATukIOmmmohil?=
 =?us-ascii?Q?JwKmvB66ch7CWUcrPOt5QHbYaBe4uzmSOuYWGW/FuSQVIbVsgt/LVIjDYZyp?=
 =?us-ascii?Q?LkbtqWYPqAK2kDR7te29vqW+AGDe55db23CJ6k08YNL3zllcmydTD1BB5PUG?=
 =?us-ascii?Q?v4ynLSzEwDMYJg8uYtxDWa164xxdfF8Fjc8bpHuxWhFXo5k2g2i8oEixRaqp?=
 =?us-ascii?Q?VSEHmjF+V/mwFjvQ6kjPuZtx8driB3ikmsbx3euBPyg7XCcAsOs7QrOAlkCw?=
 =?us-ascii?Q?rdNjFReEKyCV4NID8ouMzJ3FwammKH+jQuG87Ql6LkGZTHMiM/CRVhzSXZLG?=
 =?us-ascii?Q?abc0D8TcYZVVS1mvEipU2s1vI0N17U2DcBWipRaxmNnEJdcZoReZAeEAdtVM?=
 =?us-ascii?Q?k87SDlpCiC0d3FnpDOfoRKDKps+J7smRxBQ4eKJSaDAc+c10JCmuEETFPY9G?=
 =?us-ascii?Q?wo3Zy+JhVimyWDXGSBrg8A9TfkxyM1BzcdKsG3rFnjBu2fVL/FPcWTANmj0x?=
 =?us-ascii?Q?8kSPxfBBOiJZ/yE7SorHmdEOhEuvAKqSLaavwJhM0zf7R881PUDtvIjaI7yR?=
 =?us-ascii?Q?t7TVcC51dMokdEoAKKEyshTxSuhgHU2i5OIldR8H8uVyxs0lPME6+R3BgjqR?=
 =?us-ascii?Q?a4C5f1kJ6DvORR35eziYp6RUd3tXJq7YZAQZsGpoceAY/apdnvGMn2Dvr8yG?=
 =?us-ascii?Q?mMpyAnke0Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: zp1kuyGq0pNJQgZfGVP7UO156y+WMoiJXaflF4vQU2euFIr56foIWmppZWUH/SIQaDHNIF39/tm8CSgZ/8Se/i7UPFvuLyUaETBkkdLobJETW2g5SOm0wcNBavsC9dQo4zddE854Dzc5aLBFOYPAbZDp1YscX7onPre+pemz65ucuZafOH8mekQ2qe0sdF2ZQmFopI/VsHU4o9MiMXMQxx+0PhavgcQtSzI7GgGkl/VM9eiuLJyuDYGTjK8l9esBmTaZxIb32gkqcDS0pYkKhqnOBj1clY2LVLk0vflQCi6648/rZiR4dlzzuTRBcvaDlegr6K48w9aI/N/k9m3Huw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6773c9a0-9e7f-416f-5def-08df23a13497
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5100.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:59:02.1624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odsSXj0lIsEmt5UCTVMpaciDTs4J2x3JZ7rbk4mq44lOZJG8/c7wYLJ4E97NDzntXTMtQKD6Qoj0MWTVv7c2bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
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

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> Hi Gustavo,
> On 2026-10-05 at 19:40:45 -0300, Gustavo Sousa wrote:
>
> I did give you r-b but after compilling this I have few nits,
> first about subject, please add 'intel/' in prefix in subject, so
> better
>
> [PATCH i-g-t] tests/intel/xe_pmu: Do not enable VFs in unrelated subtests

Sure.

>
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
>>  tests/intel/xe_pmu.c | 21 ++++++++++++---------
>>  1 file changed, 12 insertions(+), 9 deletions(-)
>> 
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index d41ebba1faef..79d466093d1d 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>>  			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>>  				      hwe->engine_instance)
>>  
>> +#define test_each_engine_with_vfs(test, fd, hwe, num_vfs) \
>
> num_vfs is unused, either use it or drop it.

Hm. Actuallly num_vfs should have been called num_fns. Good catch.

I believe this worked by luck: the users of test_each_engine_with_vfs()
have the variable num_fns defined in their scope so the macro ended up
working even with the wrong signature.

I'll fix this in v2 to use num_fns as argument name.

Thanks!

--
Gustavo Sousa

>
> Regards,
> Kamil
>
>> +	igt_subtest_with_dynamic(test) \
>> +		xe_for_each_engine(fd, hwe) \
>> +			for (num_fns = enable_and_provision_vfs(fd) + 1; \
>> +			     num_fns; \
>> +			     unprovision_and_disable_vfs(fd), num_fns = 0) \
>> +				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>> +					      hwe->engine_instance)
>> +
>>  static bool has_event(const char *device, const char *event)
>>  {
>>  	char buf[512];
>> @@ -1192,26 +1201,20 @@ int igt_main()
>>  	igt_subtest_group() {
>>  		unsigned int num_fns;
>>  
>> -		igt_fixture()
>> -			num_fns = enable_and_provision_vfs(fd) + 1;
>> -
>>  		igt_describe("Validate engine activity on all functions");
>> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
>> +		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num_fns)
>>  			engine_activity_all_fn(fd, eci, num_fns);
>>  
>>  		igt_describe("Validate per-function engine activity");
>> -		test_each_engine("fn-engine-activity-load", fd, eci)
>> +		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns)
>>  			for (int fn = 0; fn < num_fns; fn++)
>>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
>>  
>>  		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>> -		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>> +		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci, num_fns) {
>>  			for (int fn = 0; fn < num_fns; fn++)
>>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>>  		}
>> -
>> -		igt_fixture()
>> -			unprovision_and_disable_vfs(fd);
>>  	}
>>  
>>  	igt_subtest_group() {
>> 
>> ---
>> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
>> change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
>> 
>> Best regards,
>> --  
>> Gustavo Sousa <gustavo.sousa@intel.com>
>> 
