Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0122DCA5FFE
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 14:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCB510E373;
	Tue,  6 Oct 2026 14:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJv2xEou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B9410E373
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791296960; x=1822832960;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MdFniqKmzs0gehP/5y1iQRjQZyn6hJLBHPtEW6mHeiY=;
 b=VJv2xEou7X1frJwyRTKZS9toxHjmxsoU9ZABTjehsxOdQOSNifansWBb
 HLbxKcALup1Sh0tD8qhXvZoMQhBFLOlLRnVgeLGhc/qzTyrqAmSqC/BY1
 7tdFNUJ6OyLMpDGOIF540STzKvrt3mgZS78XqaAmHI7U7RVvAWVAKOe+k
 rM02ZXmArxG8vJvbNHKMmZEG8/1pOtcebG6I0Et5STQWl9pkVvRHd+1cf
 gtfHyKRV11FYqShKFYSr6ZEwkGmE5ztwrO2Nu5GMHRaorokJPs73Hixnb
 t0G097NFBLbLOBvw1MJ3TIAesxuJtYGUepcEpEyaYklUUHLrDl1Da8Wti A==;
X-CSE-ConnectionGUID: HpFjgqddTmii5VYxz+wrPw==
X-CSE-MsgGUID: EZ2+B1bER9WCiqRfKEqMRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="42243"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="42243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:29:20 -0700
X-CSE-ConnectionGUID: a8YJ1tFxQ7uYu3cWIW0LRg==
X-CSE-MsgGUID: uRDKKe3XQ0+4w1cMd2pxcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="303440639"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:29:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 07:29:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 07:29:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 07:29:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktoe9POqwNlbTE2mup9h+YvDQcv21zLhnXtY3SLwjXJmMyMytdS5kyE+riqmpQKw7/Vv0598VmLdGRzxpl//mt73JUDSynGhN/+jLZoJqYGuKMLQtrKyWEba0DxT4auD1HSuNB7b+PdXsT8FlwsHyWmheDUij8usvdh3+Dnxn9wS9gKo+JiiVcS5K1dBN/QpFKf6VofB5kdHPVYZH33qYZIu1ja+4e91pZrCQC1GVb89k2C8RulMSDYR3P+Ex6+nXYxuLnskNyd7KIuf+HIhtHfj57k7OlTuBkX08g1tvwoEKQA3YD+quwaV0Fii0GHWhyMdf21cGJvu3DqEVExLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgceG2C3NyWcCXZUPzmNdfhwbIR2E56yK45eBef7q1k=;
 b=aFHUjVmY8QUWkl2DGEPIEN3F3sJ7LcWgg5LB3zQkA4qw/jk2mpMcBdNynfKcG+popeQiEgZ1OL32u9OLiYKiQSoKmXgMcxe7OmgMuC9rIwVLrah4Uwo3qCkCnSm4RAGzqTv92OZw+0/2y4mN3ecsAL8uqW5xJiINhVVEuwqfhlGgq6Et2pKF+Ld4owhac0DqBwN3CLSMDc5R43tQdXOfvxtecTcYeJhJpdeI36h2vekhLVhjDGtj0MGA8o39k5z5N7Mx3Ce+74Z2EykG2J4tEDz+RQKKC1QnE9zcz9qy5bh9A3fu+0Jr/ZrBlVNYFJg3I/cnFHEuPyXIjzBjrlR+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11)
 by IA3PR11MB8965.namprd11.prod.outlook.com (2603:10b6:208:582::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 14:29:17 +0000
Received: from SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67]) by SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67%6]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 14:29:17 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pmu: Do not enable VFs in
 unrelated subtests
In-Reply-To: <20261006142331.ofwjxlkvt6an5tit@kamilkon-DESK.igk.intel.com>
References: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
 <20261006142331.ofwjxlkvt6an5tit@kamilkon-DESK.igk.intel.com>
Date: Tue, 6 Oct 2026 11:29:12 -0300
Message-ID: <87tsmydhs7.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To SA2PR11MB5100.namprd11.prod.outlook.com
 (2603:10b6:806:119::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5100:EE_|IA3PR11MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: a304fc2f-24e8-4f61-0875-08df23b63397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: VErEeuHTNeqfpSgy5oc9QPALAbVWaLAof5RTXb8UQsZznMy9k2ccru9GOHTAdRnDeDdCWZTiEePzB0Nb02Rv4pxW9MEtALBfw2+sVdlx2Bp64tMzU2/tK/2vrM0JZYtO0UXc33e1o80Is4+tQ4LGkGh1Jh9agdzkYz8QlRacyKeb75axAAcoExz3UKiWuVULIgMljNAXoxjyMm1uE/G27J7Zz8ztY4mtP3Hu1/t3tQEPiaGDhd6dEsizV4fPVsHb71vMI7K60Kynhl8aP1hmCF5vUFOubi+4bm7KxWupcdUqMpc9Gpcc7/gSx/ugndJIAnxL0H6XzSXbXDU5ESnEeKsE2hzomxgoOO6rUNsy6M2Tn/ABRfRp5m6zSHErSqWNR2lE3vU3PXNkjo0ceFHCd6hyqptLRp54lA7Mj9UZY3TdVR67DqGkk/Xx73BvPDuurIETIYkIyKbeQdZkpHvRW3gAWmGa1x1+l8NPLhIzSQAPyRiuTigqKRS4icY1HOGt0thlixpyqCsmS1hkPJtzN1FwhJTRRKzt55bx8qMllEXkjrfasYU6h104aD3j5KPb6agJgYb4TwnlbJUwb5ElneHtJwZgxpA0JqwmYbkPhVASjh4K2/EaHgXlCrACOBj9qdvSf6d5WD7VOgbvncsYoS0YhrneYpJztfR9eHp+YUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5100.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AzmWIHBSS3xRJZBfyw+hzl33M3ImbQV2vT3i5Z1/72qKUUd9SMY2igSHuaFg?=
 =?us-ascii?Q?Z4TkEGgioL6Q73mVAmzz051GDbYLIp2acUiUkYkT8+6ftjqdhGdpwJ3uzFt7?=
 =?us-ascii?Q?peiJntPWkpRuUxnY5S4T9nArHAsVM/lunhyGb8KCNqQArvC4B9GgS8Fc6YcN?=
 =?us-ascii?Q?km74Ime+BnFQPhWu+0iozquxb2X9D2yjWDGvYMdNOxN6cFcmaVMrM5xRctI/?=
 =?us-ascii?Q?7uLJxlecFi4vzdQDPCgRRdA/o0HDtSTtjpzEZVMPlWLq+2hMxCj4tSRwZ8ns?=
 =?us-ascii?Q?2Hu/7FK2QPS7YSn9iwqJQh9IIhfQli3JzdXSqv5hUjIvyaZx4+uQ54XL7oLr?=
 =?us-ascii?Q?MG0/Fv3GyCm8KO/L9L94KtLPmB4MiCLwaQg3GNKkpFJwPGTg519PAXY/JFcu?=
 =?us-ascii?Q?c01iJsFcVTcNMvcmF+w6g08xWdxv/OBcu3nTUHLfNID6CIzFN2JGA34Obiis?=
 =?us-ascii?Q?G32wuqup3hjDhIseyH2aeHTOnVrJTEOUNhZ7Y1BDPoVMQuRpWBiRvD37wxh+?=
 =?us-ascii?Q?Njyh2bbDALkEarl79g0o/M0y8XyMZ2a/N4It+eLCzISQXz25qlUqlHR2fQB4?=
 =?us-ascii?Q?5bGg50c/G4bzhek5oHnzZ3VHn3GwYHm3kcfEoMsZhSKQbN1c2SY1BMnCPoOM?=
 =?us-ascii?Q?weB6JOTsrfY3Y7EX1IbeBAwX21E2LtTB/dWTsA08d1KF8uOoor6VAUtJb5oU?=
 =?us-ascii?Q?EQXRA6XK20m0A2ZC3NLFJd+s6mZtoajU1E3bZc7S7kfJa5+hBbDQksrcW+ca?=
 =?us-ascii?Q?pYGNL7Cxq6osNkZb++RPKOPeuem1BPJYB44MbFGCHB4B+wv6Pw+r+Bb+tkx1?=
 =?us-ascii?Q?d00CPQYl8zl0M3bKHlIQ0qAQNlM2jCIyShT+FFkwucE3RgwcyVvog/NMSGLm?=
 =?us-ascii?Q?qk1007KFlu9O7aa0ZrewqdgZ5BHc/YB4VSt9uVovFm921WTTvtfpy2WDSHzQ?=
 =?us-ascii?Q?eg5UK+MAj/laAupTNuLCylQSe0PXMZTOrS4Z/n6fpJtqOZF8dt2rWu9qx331?=
 =?us-ascii?Q?82WB0obzS9xHp1QEuYy+IyjseXgZxpWmlhTSBxJOZqCtkWGWZMavkjKMjrxk?=
 =?us-ascii?Q?HA+HHH+OI+7A3uoFYdWPoIv9bw9ufA98UWl0l4cgEK6f/Taeqlx7XcOIDAII?=
 =?us-ascii?Q?cPo8SNBjm/F73SgF0F7ja63a1/Fuuoc9S2mJt/mWUvsvpTUHAcDgcFu1fw3l?=
 =?us-ascii?Q?UNUpG9vXQTLEzEKyzJ76ZRFZMOEmklO8yn8tcJ1xGJ2EovIFlrLeCGLf+X+2?=
 =?us-ascii?Q?rm9uEzSOypNkGHxL0fT9R8YBVEHAE4ez9iKgCJo9b+Xc2K4SPbDsFtWvhwjN?=
 =?us-ascii?Q?amViwY99ZPPXS9NKyYbG9FzlhT+k9LloWa3Bk9LKlzS9kOC+Jn644tQ1mSdH?=
 =?us-ascii?Q?Fz200PSo26P9UpiPusM67Rpn/SIffBkmlvdXwANrOVKqu0ZAwEY6iGVm56tY?=
 =?us-ascii?Q?OvsbTqhjK0qvJM/4mAPXcA8c7+6FvECbOivhZSBVMutcKl47cW4WSj3FplTn?=
 =?us-ascii?Q?+CtfF9jPk7Kvf1gaHrh2GIofpwmqgzeb4rWFUz3vhiJq22qla7XutOS6O+WJ?=
 =?us-ascii?Q?uk4vD8vDlD5SJb8wVoEaecVPXh6wzoQlwpySK0kQPSMQM21rgXnjsj899SgY?=
 =?us-ascii?Q?oI2o7nz267XE314jZgIGFywuq/3FMEQOzbPXkytU7V00fnZUkKjacRbg+Ula?=
 =?us-ascii?Q?xtx0FUkUE85wuACdOFPYobQNyKcrhljs71Xyq9GecnfoSu41nMARg3hIPXQz?=
 =?us-ascii?Q?uSLH43ebyw=3D=3D?=
X-Exchange-RoutingPolicyChecked: pp/kBVNwt0EoaUU4ggt6NJkheMkCYh/DhLcUdTp5bokvARS5kUrJ7wis5c9nXI2+RBIiI2XMgRit+zOB8L0F8pSoirDEP8DcQ5oSKj7lRmDMEWN4S7VwY1x74OinsapYTh7MT2zHLm8ji7x1nsItE8WFl2+js2DZ3VtKl4fkDv0zy8w6ymrUjIyYKNTllGkvjvfD8GJDX/aQSS1DuBjQ2QM7jUV4BBujZhecnEyOmWwIddRdl2fp2crmckN3AzaKsBNwaJfUzc5B2df6m5XeYCh6vZJeit7mfEtVZIgv1cwnk2NCzQFJZcYp8NShr+T09XfQNgxoAIwIJvGdHxgNZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a304fc2f-24e8-4f61-0875-08df23b63397
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5100.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 14:29:16.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYUSEnKcsO9bfLv+XJ3XyNnrXT9NE5V/0oToAWtZaylPFDJ1jzlWaNqCiDW2P+D/xfQtfvav8qed25wCbld57g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8965
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
> On 2026-10-06 at 11:11:19 -0300, Gustavo Sousa wrote:
>> The test xe_pmu has a subtest group that enables SRIOV VFs as part of
>> its fixture.  Even though the fixture is part of a subtest group, the
>> enabling/disabling will happen regardless of whether those subests are
>> selected or not (via --run-subtest).
>> 
>> As most subtests in xe_pmu don't need that, avoid doing that as a
>> fixture and rather incorporate the enabling/disabling as part of a new
>> macro called test_each_engine_with_vfs().
>> 
>> v2:
>>   - Add "intel" to commit subject prefix. (Kamil)
>>   - Fix argument name of test_each_engine_with_vfs():
>>     s/num_vfs/num_fns/. (Kamil)
>>   - Enable/disable VFs only once per macro call by moving the call to
>>     xe_for_each_engine() inside the for-loop. (Marcin)
>> 
>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  tests/intel/xe_pmu.c | 21 ++++++++++++---------
>>  1 file changed, 12 insertions(+), 9 deletions(-)
>> 
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index d41ebba1faef..eda56c078653 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>>  			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>>  				      hwe->engine_instance)
>>  
>> +#define test_each_engine_with_vfs(test, fd, hwe, num_fns) \
>> +	igt_subtest_with_dynamic(test) \
>> +		for (num_fns = enable_and_provision_vfs(fd) + 1; \
>> +		     num_fns; \
>> +		     unprovision_and_disable_vfs(fd), num_fns = 0) \
>> +			xe_for_each_engine(fd, hwe) \
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
>
> Hmm, maybe that last one should stay, test should do a cleanup,
> after it ends with igt_assert() or skip, for example:
>
> 		igt_fixture() {
> 			if (num_nfs)
> 				unprovision_and_disable_vfs(fd);
> 		}

The cleanup is already done in the for-loop generated by the macro. Do
you see a case where we really need this extra cleanup call?

--
Gustavo Sousa

> 	
>
> Regards,
> Kamil
>
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
