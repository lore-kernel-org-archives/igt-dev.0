Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FDAD74959
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 13:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8E810E011;
	Thu, 31 Oct 2024 13:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7Wu4riA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB90610E011
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730380726; x=1761916726;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cdU2GWE/LxRaJT9fySBB5xmJXYHCxqfGJ4rXrFJazG0=;
 b=B7Wu4riAX+iT5hxKk83gXSGjklm9ISA+s1EqjJ5O1SvL4LmaN6BXiePv
 uP7EZ9h1JE1JQMVzqF4Hn9TIi6nn/9eZVRTDfdbj4IAMTS/0LjecSOx7f
 nTo3isVkpYn1R4/i/2SreXAJvyMfhSjGSKCSO8ca3TqzOuiZfDGmLgVI7
 IuJfJxFsss06DqoLH/ZVCGhfmxk8lGrzt2kSWII4B9MvT3nwFXUzpJG+s
 broocUXXok5Z+Ue9Lb0qkG4CpFBHmmFJtGj7XUiqDXZ1XS0zQwAH/z7MK
 UVraLEQhB0hcIUxfLBYOnHPyt9g4WnXxbmsVmv+bMB+8bucdm9VGiQNh0 g==;
X-CSE-ConnectionGUID: 9YFA4r+mRkuy6aHRMOkRVA==
X-CSE-MsgGUID: pza/o5lKQn+434nbl91YBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="40691140"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="40691140"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 06:18:45 -0700
X-CSE-ConnectionGUID: IMZpMOodSBSsVZaHj6xSSQ==
X-CSE-MsgGUID: N25HFjjTT+qpo+RdSWsw1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82946371"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 06:18:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 06:18:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 06:18:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 06:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCmDgznNq5BgrzRV2vYGrJkGeqLaHIvbIRMXpsFF1KYRqTbXVXz6GLjvZUonEbZUpLxMljpO5zOv4K4FO2GdzztJYftGRHn5JqV7G8iyQHXfPAeRsFRdgy06VC4ql9zO83Gl+I3xZ9Jm96FWdfn7XuluKnulwZezfPeAph9uvb3CB/3/X5vjsVlMyprnMPlrlvRCNcwhWPnLWb0uPjJxbb4eaqZ1tEk57z8Eq+f5d4GF4NDamN7/5DU+sv5iWXvcEEdzMPLAzq41atNRUwzeexjytdwcblka5x1RAsnXYhL7hUTpZC8UCeJbOQOzi5IqauuiKMbGNEpwHTKPHjJLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXri8vvvfpbBB/b82rvScPEPmO+Ti9F7SrCtkETMbdc=;
 b=E8rdF0v0butHktPVnWnRUuDsLIPaV5bu8BioD704gXoKYg4OesgCE0dBnlrEElurT+cTZo4g9ChmIcS7Kml7f362o2t1gBxuTN5Te4qZB+vVeCZOlULGhrPXrruOyPnbcVrYrUTZFrcxYFz+E+Yjhs0Zn2Xty68ClOfSIMzja8X/ZqdlKGh+BP8BKls7fhQ5WqNHX8hPuU3ezZ0C7h879yF08Qmj1dsA8IaOjs5s2j80nm5Mpqsns8UzWGXQo90YVKSRZe/kjaensKGZBJYOVi9mxcW6mLm8BVzZT+GCrriPH5ZT7eeuxCiR2Wdxmm/Ku6zBBlHUeeG7sOEpv36qSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 13:18:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 13:18:32 +0000
Date: Thu, 31 Oct 2024 08:18:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Drop legacy kunit fallback
Message-ID: <t5p33w3s2bzaddakwcagzaab7ys2epo2bile3ubtanzuuqh4fb@5ypkaql3wtn7>
References: <20241031003142.863437-1-lucas.demarchi@intel.com>
 <20241031003142.863437-2-lucas.demarchi@intel.com>
 <3310304.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3310304.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0244.namprd04.prod.outlook.com
 (2603:10b6:303:88::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 3075bccc-0c9f-42e2-68f7-08dcf9ae84a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2U0rcgVcuj/IN8Q3AOH/W/I1VQVCWbLHhvm9UNg5P0s4DcAboKL18vZaSUjX?=
 =?us-ascii?Q?CrNpHcsxcltA2f21p9/XFiDp3rrCVIPqxTajw6XlmWzViiC8OkIi92UaRevM?=
 =?us-ascii?Q?aP5FlD6p8N8dwT2DMMRpJ/O1cjyY/EX4K66HF/DZuGkg7anxlePtVS7QbK/3?=
 =?us-ascii?Q?cSe8DSWsfdhtZN5GGJHxfda2fiwfDlkjRzDKd6ihGvLHrealsLD+iEnNCP0G?=
 =?us-ascii?Q?lQCJ9oiXuj5PyM8A+pkJxRGGhuvehUlvJaBIuI36+xmJJtUtRDYHcVvLxahL?=
 =?us-ascii?Q?lsPw5w6KK85ty4p/ksYxJvVZj2AZEinaaZ4w3PNKMtfiBSsgKhxUMlvQiByO?=
 =?us-ascii?Q?JOx21fTtRbIKQmD4bfttcMRB4xikyR6t6yDGjA1Esgn2spc1EDjetJPGt/vh?=
 =?us-ascii?Q?oPqbf471b4ZVRKZWDlRAgFjrBf+H+z+JOpKayFNn49sRCB4VSdQx/7XxOHd5?=
 =?us-ascii?Q?PfCrOpP9Yp+NWWf21+DlvM2evcgHnEysngiwEgx7+jq86s0PETXyHk0uZ9BM?=
 =?us-ascii?Q?NdRwmTsL0H2gictyimdtJdOTj90Rk5AzceismEZSm8HX1YnaxTzzS5L4G9LL?=
 =?us-ascii?Q?jd8Vq+EimUKbf6AMR3s+NkM8tymMbqfP5r8Vue6AaAWEkHgunUkLidEBLXxw?=
 =?us-ascii?Q?qIbSoJlGEXnagMFYymDW1yq7sqTHz2oeZWUmBKxuSJxzD/6NeNgBB6eb3i/s?=
 =?us-ascii?Q?69Dd0rthzbA6pNYBW3YewyFJ7GKihAb3N9hdF5g5OwWW0/T8PfSiWXQEk1KF?=
 =?us-ascii?Q?m8nq6F8agzx3eMFDTzaD/vjgp0Jfw3QGkzCsKSoEGOIThGZU6bOMn+UHCsun?=
 =?us-ascii?Q?h0lhCe19zlXSpr7sPvlU7iKNNWnv5lVhwS/ptWoGlv1EYAud+KrMxINQWUkZ?=
 =?us-ascii?Q?ShL3atnwHHOTM4pF/M90YvWTx6B2i73i0hHr9WznoialEoOHYFjo5L4/lu0s?=
 =?us-ascii?Q?pAkTA72RRmHqQB9CYlZgZAwohXiKjBVh8F7F13XsBVms6yUEGRJsGRNXyCSh?=
 =?us-ascii?Q?cse8h0MSSv40I4aUOTSzBbaL/8XuwqUMgY3TD629JjSMWdh6OwrgJV6zJC+Z?=
 =?us-ascii?Q?+eHvVvACKz0W4cNOJxw/y3h0zfMiK41Vb91PXLC6qvOcJPePW8k3ZBhigf9m?=
 =?us-ascii?Q?n/Yw6NNRygPZ2DZtTyd3kcLCuAhd+YFa5MA8s1oDqIQJdqTAEdrqgW5pyT9d?=
 =?us-ascii?Q?QaIxFfmdG7sNkP4eh+pD2wxzJIs8CoiCfRSC7waEsBJ58lbzDSwIOYZJSg10?=
 =?us-ascii?Q?U1hV+0TQOIND8x3WGsW3br+2UqydaUL369CQjcyGBLRSB6S4gMYFFiMUzkK8?=
 =?us-ascii?Q?uQspqhrkZf/MCsr1B/vPq15y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zy/FNteuUWo4YIICdRP96lfMD3tSYKWYqOlBJexFIConjdF+vcPlF42cN8jd?=
 =?us-ascii?Q?6K+vw7a0avpHW8oQBL+O2LswHnew4WdnD+eZWqysLBM6UJZ4vZsNBF47pq7P?=
 =?us-ascii?Q?LOAuKw88keLx5gJ9BFsGnKQrM6GFBxcFwYcEkPbBL3wNKJ7oow7Xk24ZEGg3?=
 =?us-ascii?Q?oN6l25dzPS/hyHrrUCxnL9nZNjHSp0+Np3TDEw66WZmMFcVcJDyQn7SBaq+b?=
 =?us-ascii?Q?wF7qNs3tZ2RXm8mAs2xVLRQzSWvoKcCFKiY0x/ch3gqybceEp0Vvcunjnji2?=
 =?us-ascii?Q?NLWvDuXGehhsKuWXQlfxHM5FCP9m1uwXCFHrxd3OxFcfLUjmOOLrkcogiFmd?=
 =?us-ascii?Q?0ni1AD1Lhno2U4T7+9WIsfpIaQxrHKraDIUDWCB7Vmtby7RVF/qwMI8V2lgv?=
 =?us-ascii?Q?XrgUSBl5N8757PuT0c31Pplk4J6p7cF7KQiHSJSoL9uJmgtb0g2ysNSGifWh?=
 =?us-ascii?Q?tBEjIqQBY6/0/92BeMPtsICfEtiAWM31L7A/q2lgJch5fsmlTGWQw49pyZdh?=
 =?us-ascii?Q?63K64R2RLI0PR8ghzoo4R9Pn2257V5+u+/fnEZjSOtLcR4i1cHtQ1Ava6Agr?=
 =?us-ascii?Q?NBbOWh3BttW8F6WLCh7lQw+flnQVzZzN6B7Ii8Jc7/MWfE/Y1kdaq5qokIYY?=
 =?us-ascii?Q?fpiZr/au/pObUFJpoOSLpg95+BbkgjddUPY43WV7Mpygo5Zd8vboSrvU9p1x?=
 =?us-ascii?Q?wjwhsH8ZHtRv01mtLrRHngqFK8xeRS2V9jusqJPBE8I2YzO+MEjTfGarwLk1?=
 =?us-ascii?Q?APgs0VwjTy9ibAgo6kU+f5cGBudhm+4baGuRC9UpjGNACptQNs+Y/f56OPlp?=
 =?us-ascii?Q?Q+4es7zSa3QNqWUO6pQf9zA1IKmFV5JMVkia5UXzz9AFoPR8pIgQulydQZEJ?=
 =?us-ascii?Q?bh2HdAYGr49mwjLSdASY+pVyD+hRaVFQ+jLJGzEWAvPWN3Zv6lV1q9S0PE9q?=
 =?us-ascii?Q?MsFIYG0e2tcFcHWvrfnWv9KqDw9K7VzcH/dgxEFG7ktdxKuUtF5NT4F3JhoP?=
 =?us-ascii?Q?qfbNc7dB+KZtWX7f5wnxwUYR+I6qg5Lp33ipF1ZVSbnvHPuU26ooh/2/agVQ?=
 =?us-ascii?Q?+cyF0qjgqfec5N1wqbnm33WDeO6CW6Z0hyeeejidpaN1R/eqcST2hbb6LjrP?=
 =?us-ascii?Q?OpXXozUfjQmlnO3+o1xdprPoJJlNJhUuYrZxWGUujEzWozo6Rijr7vKDdDpl?=
 =?us-ascii?Q?mjSUBGnhZTfiILVxK7rGT8eFwUtLeuvXCW+4We/kH6bqh3zfZaU08J/906fK?=
 =?us-ascii?Q?W1vMpZYkb0wEfjAlv/V8la5tupNzN+9vkUKW+dzGTP6aLiEHh3Rp9VId0jFQ?=
 =?us-ascii?Q?/3dPKrVnraP/ONKvR8lNBg7BY5ei4rWXEju/sSLONwGge1I27Df/AXrgxzs6?=
 =?us-ascii?Q?oH2sSfbHsgczUDzHBMqwPKqTJe+Tw+TXsuwdiDmbPly+2xqqzxJYoHYhmuvl?=
 =?us-ascii?Q?ThxfX56EegIr3rqM0Ym5JjOXBCJVgmEZtw/My7Lokbii/NUw1Ugd9X04fYmU?=
 =?us-ascii?Q?KKg9StMeWl1eNf+Hq2/6cKbUM5dBRlIDZl41xOZZxpdgkxtmVzvc/lYKOSm7?=
 =?us-ascii?Q?Snh1HgMe4kLI7DRMwdsZCef7WMl6894SooxJNloUH68Xe3kIyrNM/H56vMLD?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3075bccc-0c9f-42e2-68f7-08dcf9ae84a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 13:18:32.6204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rpNpZO2VLC/paqY0ADeZGFbnVWoRVGyKBxO6bwlIOMAH0uR6mVzTX6vZXMPVdKKEo87Nd7BZnYhc+8bR8z/UCboDjXp5MVa6vw5cIVJAv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

On Thu, Oct 31, 2024 at 11:42:58AM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Thursday, 31 October 2024 01:31:41 CET Lucas De Marchi wrote:
>> Kunit has support for listing tests with debugfs for quite some time,
>> there's no need for the fallback to be happening: let's just start
>> failing the tests if we can't get the list of tests from debugfs.
>
>We must not fail, we may skip, see below.
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_kmod.c | 278 ++-----------------------------------------------
>>  1 file changed, 10 insertions(+), 268 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 75a0d057c..4cb9e886d 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>...
>> @@ -1523,25 +1268,22 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>
>>  	/*
>>  	 * We need to use igt_subtest here, as otherwise it may crash with:
>> -	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
>> +	 * "skipping is allowed only in fixtures, subtests or igt_simple_main"
>>  	 * if used on igt_main. This is also needed in order to provide
>>  	 * proper namespace for dynamic subtests, with is required for CI
>>  	 * and for documentation.
>>  	 */
>>  	igt_subtest_with_dynamic(subtest) {
>> -		/*
>> -		 * TODO: As soon as no longer needed by major Linux
>> -		 *	 distributions, replace the fallback to
>> -		 *	 __igt_kunit_legacy() processing path, required by
>> -		 *	 LTS kernels not capable of using KUnit filters for
>> -		 *	 listing test cases in KTAP format, with igt_require.
>> -		 */
>> +		bool has_tests;
>> +
>>  		kunit_debugfs_path(debugfs_path);
>> -		if (igt_debug_on(!*debugfs_path) ||
>> -		    !kunit_get_tests(&tests, &tst, suite, opts, debugfs_path, &debugfs_dir, &ktap))
>> -			__igt_kunit_legacy(&tst, subtest, opts);
>> -		else
>> -			__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>> +		igt_assert(*debugfs_path);
>
>According to a comment followed by respective assert() inside
>lib/igt_core.c:igt_fail():
>
>	/* Dynamic subtest containers must not fail explicitly */
>
>that's why I suggested replacing the fallback with igt_require(), not with
>igt_assert().

where did you suggest that?

>
>But maybe we could go a step forward and replace all
>
>	if (igt_debug_on(...))
>		return;
>
>inside kunit_debugfs_path() with
>
>	igt_skip_on(...);


I'd rather not skip and have a big red FAIL since it's not a valid
setup.

>
>then we needed neither igt_require() nor igt_assert() here.
>
>> +
>> +		has_tests = kunit_get_tests(&tests, &tst, suite, opts,
>> +					    debugfs_path, &debugfs_dir, &ktap);
>> +		igt_assert(has_tests);
>
>Ditto, optionally with all
>
>	if (igt_debug_on(...))
>		return false;
>
>inside kunit_get_tests() replaced with
>
>	igt_skip_on(...);

if those writes fail for whatever reason, I don't want the test to skip,
I want them to fail so we can fix them.

a skip is a valid thing when there's difference in behavior from
platform to platform or when it's a valid difference in env setup. Here
it's not.

Lucas De Marchi

>
>and kunit_get_tests() returning void.
>
>Thanks,
>Janusz
>
>> +
>> +		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>>  	}
>>
>>  	igt_fixture {
>>
>
>
>
>
