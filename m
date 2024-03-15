Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E870C54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 17:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC62E1123A0;
	Fri, 15 Mar 2024 17:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8540JtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557FC1123A0
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710522275; x=1742058275;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m37BkDphbkc3IZERzbnU8TCFs82KAUNZbP0bPDBTuF0=;
 b=c8540JtKoH7szTstSDBWMHCezSlY9LgYMxUM/WI0ZEMQ1ilBxhr20c23
 0N55p2KNd8r3haJ9bZTfPXNNXx4YASAdL8rsq4drsxsQj06fo4A/os5zg
 hc+JqZjgK0yfB47HbtIk5EDaB9kzKfiRzaxgG46VuET6UOJpXuYXLuF5J
 hCJQCWWxgifwIq3+r/nbvqGTxNANJYzBQze+lrnd//+8yE5K27s934leD
 7oVkmsE8qzAFJml3HfOOrNmOPw2QS+7yUjMMqSSwfgdGAshoIBhdbc00e
 TfWCRF803Qq7Beq6QDckCzJWnnOGSd56mi19SMZ3pbz7dGmjt769lG42Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5589260"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5589260"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 10:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12657912"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 10:04:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 10:04:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 10:04:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 10:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV3WAJlX7CVdq8rDr9Fmv4cuDJt5ftu7y7WsKIIs9sCZf2shbxVWn6iDPZGFGLQPAsszfs3bfHPU86clr3GeaT0gwg8bKgc3Vg8RE0qgohKSzyuqgkl25CSEZbbXrkzUrpERp5Vqnn+j0k+9J9QOjtHlJX1Zie/7OAGn54JfB7EgwPHsAnn65TtQvS4yT9HO5bTZSfashwZFA3Sug1VD4WELN6WyD3uc2CPRCkF/CgaMpcZKSQRU5cadIfqfsANQjIZm7KkSc3WB0YPn41VkpNN9bFssNs/8FYhu8ft2NnQh8mWMIUQFNfqXl5ZNkH7jAgZsXZPaLnP+Z6Fjcjx75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dr4NPzoejbTMgUrEnxjcJivVPV0Kzn5jBLHUWgIppjM=;
 b=bQGtcoynP6mmogfLsjxHwrhHj+MnTTZmhVhmc2tq3qYVjczRKoEs8Bm+WkEOPX+DVD1RvuGnhmuf+z8JFKLpUlNuMLH1x52pcX7wPvkG5xqu4rbYq4LXt3sFryOHnFxhY7HteH5i/zEtLT6E/3TCDn2R1Ztie6e66n8VAUNFNQ5tfYOj5v+aFN8j/bzcuCTuF6d6/m/9oMc64RZRw7MlpSAPiDZYqZIYOM2f3DOnWe2SAaiegtODxXZl4xph38B46nQePSxzQ6Cz9KOT0nOW1fiv5VjkMXTBtB0SpQtvUtoBefo9m53C+Alww/MkQodAAp3b3D8B7x9VscVyN7/4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BN9PR11MB5322.namprd11.prod.outlook.com (2603:10b6:408:137::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 17:04:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7386.016; Fri, 15 Mar 2024
 17:04:28 +0000
Date: Fri, 15 Mar 2024 10:04:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Chris Wilson <chris.p.wilson@intel.com>
Subject: Re: [PATCH i-g-t v4 22/25] tests/intel: Add more tests to
 Performance subcategory
Message-ID: <ZfR/muqzBaEhFmBt@unerlige-ril>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-23-katarzyna.piecielska@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240314143455.1436688-23-katarzyna.piecielska@intel.com>
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BN9PR11MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: 231ce68e-576a-48d1-eba4-08dc4511f9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/EcGpF9jPBc9VoidGigVW34e/5aOGqAFJPpkWCqlyQifcsFdUhNYes5Ma9TzQoCjBPPRxS4EdkF53YCDKkafk1ruMATw1nNkCwDvOW7f2Kk9KJhf/88dIa778XrZZkOkccXLV+x4mmuQ5Z/+Bg2NuTk20GTaPlVgy+q53a6+ffDYKjVnaAkWSiNGkoaCFhpQminrpjmnk7+IS6PLlNISv+0spfRY4NaCAOnTxjmh6sgTHMtnjMhKnlW+um+AGJHKhD4svPsDOvn3atHSDbLnCq8jabk3DHrzKVi/uSkPNatUKgZXArMBOUbXgEADhXtQiESbo0BUcxUI/4pGA1y5IxIJ2nLad3u4AjEmmt1mROonVmBd6BkoDTMF7BlN7KbyY2/gAQoPqhjbNENu0MIFTDrZVkos1AzIHTu6a3SA76WjvvtuvVzRGJoOGG/mvvLhJIJz5mEoiQuyCBeyog1Uh1YmWWjObBwgvQo4wPx+Z4DeDtEUSDsZQCljC+dBDm9z5YPRSztIbDlyMoKws5FwRNqzAW8tKPI93QomliQkCTvDQjefe+Hvpt5A9n0GUCTipaSIbFe1NPG5lgrWkSeSadrTcHG6wX1xuAOujZBNUwQjWG4LmTF6gAEP3ebA/B3NDTy8hrSytej1IR5/7lpnxNOf8+zaeK8O0d2p40mje8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk5Ec01PYXpjSlpFRDRocVZIVUZuT24xN3owb3A2NVFCZWJwam5GRXUrWmdk?=
 =?utf-8?B?a0pFWDY5bGRvQlBvVVhBcnRnZjJRVWJDNzVPTmNvTVJwNW83QXIxVjJTRnhu?=
 =?utf-8?B?bk92bFlrWjNYZEZ1NVVlSnZBYitSaEVLM0gwR3dnc1h6RnJuTW5tOEIyUndx?=
 =?utf-8?B?QnpOYjZrWVdpODJUQnVPZHc1QUhSRVV4MzlVb2FzZ1JKQTdiOFdDZUVhekRn?=
 =?utf-8?B?QmRlUHhwSEdsOFphdzRpVmxlVzVxWjNwMXFmbXlLMDd2S0tqT2trNDZERmkw?=
 =?utf-8?B?cng5aTFDMkcyaVFZOG9GR2ZJSE5xMk11NzI2enNFSldrZEtLL2d3OEZKMmoy?=
 =?utf-8?B?WGU3SGJIUGhaNEg5b1hBOENOWVBQN1NrT0l6aU9uRlJrc0VoUzYxMHFjU2ZE?=
 =?utf-8?B?T0pSZUJIdUJoRVlBcFp4TDR0ZSs2R1oxRWVUSlhqTVRUM1FISlltMVFEYkNo?=
 =?utf-8?B?cDVXZFpxZC9pRklvNTZ6cDVucWg4N2JubjVCcXFrczBqODBQbHJQTERrdzBZ?=
 =?utf-8?B?VFpXQmRYZGZuUU5zNE1GbW1wMjE3SzNFYktFQjQ1MmNXOGNiMmxyaERwUGxZ?=
 =?utf-8?B?Ukp1cXV1TXpERnJkRFZxYzg0RU9sUElqaGR6dUJNOCtmdVk3dWdsTlBMSGhK?=
 =?utf-8?B?OUpDRlUyeE9FSXR5T1hEYllhNiswUHZuOXJ5NkxnaFFuZHdMM3psM3NrQmor?=
 =?utf-8?B?WVBpM0dlUnNpQzNNaURpMWNFeXl4MmQwUGt2UDJFRDRDVUJFSnMxSHlvYnU5?=
 =?utf-8?B?VnB3L3dudU94Z0N0USsvSkpYZGwzNnp6by9Wb2pwM2JsTGxFd1FMKy9haTd1?=
 =?utf-8?B?cWcrQzlGKzZ5bUFDZnoyTFJvVVlaYTRJbHVnNnNJUSszTVJXdUdVZVhSelZU?=
 =?utf-8?B?V0xhUTNHM0pkU3AwMTZNT3Zldld1ZDNPTXRCT1pZYlFBYk1CYlMyYjVDYmIy?=
 =?utf-8?B?cWFlTTUzdjJBU0NJYk8wanQxTEpSVERUVXJkc0NPdGV1V1dJV0t4V2dTdFpI?=
 =?utf-8?B?VGdFVlRuSkhuTDV6aW4yZWxlNk5GSkxTWDd3NzlrN0lxdzl5YzZ5cHFKcW1K?=
 =?utf-8?B?dlhpdjdLR1FwM1VLWWgva1VFa0hqbzh0UGdJQmtEZkhXNEg4NTZINCs0NzdZ?=
 =?utf-8?B?UXNYZFNlSlQ5Z2V1MSt2U0pURDVmMmlYcldNeGJXRjJDYVllSDBSWWNUOTFm?=
 =?utf-8?B?bCt5UUI3N1ZnTDR5WXpUcE9VanpWb2hKL2o3NUpsRjI0RGFQR25jajI3UGZE?=
 =?utf-8?B?NGdDVktabjRaTEpzZjg2ckxwZWQxV2dJYTVMYit6ZTN2V2FRUGlpbnZKT1Vh?=
 =?utf-8?B?TG1KSkUxbGZJckJ0VHBld1N1L0NXMzhTTThtcDY0d3p5cVB4NTd4RWxQRTZ4?=
 =?utf-8?B?dTVFakNleWVRQTR4NkNtYWtvT1NmclBVRkh2UGdjeFl5Y3hBWi9KQ1B4YUc0?=
 =?utf-8?B?NVZwUjQ0bVU3R2tkdFV1NHpWM2h2MkVSTEtwNjB5VDcwSmV3Syt5M3AvaFhj?=
 =?utf-8?B?QkpvL2xXU3dReVNwaVZFM0M0N1ZqRTdoSWoreWZSNUZJRUN3RDBzNXovYmFh?=
 =?utf-8?B?TXlOL1FsRXc5aEFyT1NZQ0RsTEhickVTam9RMThGUDFHUVJOY1owQ2ZRbjlt?=
 =?utf-8?B?cFI0K3YwdzNPenhsVFZiRzgrOVFpSVVVN0RlN3piYVkrNE9PUCtScWpIR0pk?=
 =?utf-8?B?TnVRQjcrMHAwbXl2S2w4Z253R3lyUkhLL1FVM0ExT1kyOC8vNkNPRGdhaTZo?=
 =?utf-8?B?MUJ5TUlGWDdnNVUwbGZNdGkxUnFyTStxMG5iaENiQVppQ3RsMmE0VkNpaVhV?=
 =?utf-8?B?V1Z6VzJOWXVUQVI3Skx3enVSNWJ2ckF4YWNkMXBUR29KUWtzVXJ3T2J3VUtv?=
 =?utf-8?B?NVZFRzh5a01ScTJuVE1wbW41cU5nMXNPYUEzZlUzazJsd2lZNnJMZTB1cXJm?=
 =?utf-8?B?NXlNeDVOVWhwVEtDUmFURjRHZldGOTlVWXorTUJRamo5YTUwUE5xZC9sV0dt?=
 =?utf-8?B?UFdGM3VEZmJ3eVUvN0ora3ZrdUJHQmwvWnlJVXlVb0ZxREJjQWtDZnNscmps?=
 =?utf-8?B?QVdqYzAwUmpvY2Jkb3ZyZ3JTZFgveTJGc2FpSHR0bDl0VDNmUzlkL1hrZmZ0?=
 =?utf-8?B?aE9rTUtmVW1INlJGdjdqL0Uyd1FNWXBQVjZwTUhYWThkVTVWUGhNUytEanhj?=
 =?utf-8?Q?DEynwO8MdCC3axKiU2E3EU4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 231ce68e-576a-48d1-eba4-08dc4511f9ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 17:04:28.6820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQC902WRn8ZXSnwGqVLaWjlhQhPoh0zC3r8lREjRa1lv3A4csVGeNz6Mj2KDjceQS4W3KL/vJ5aNnz+gSt/95OGh0WEYDxcig8OywCp+6qU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5322
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

LGTM,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

minor question: What does obsolete signify? Does it mean those tests 
won't be run in CI?

Thanks,
Umesh

On Thu, Mar 14, 2024 at 02:34:52PM +0000, Katarzyna Piecielska wrote:
>Tag tests/intel/perf.c & tests/intel/perf_pmu.c as performance.
>
>v2: Make Sub-category/Functionality/Feature unique values. (Kamil)
>
>Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Cc: Chris Wilson <chris.p.wilson@intel.com>
>---
> tests/intel/perf.c     | 33 +++++++++++++++++----------------
> tests/intel/perf_pmu.c |  1 +
> 2 files changed, 18 insertions(+), 16 deletions(-)
>
>diff --git a/tests/intel/perf.c b/tests/intel/perf.c
>index e5d3fbd0e..44a0acf8d 100644
>--- a/tests/intel/perf.c
>+++ b/tests/intel/perf.c
>@@ -52,6 +52,7 @@
>  * Test category: Perf
>  * Functionality: oa
>  * Sub-category: Performance
>+ * Category: Desktop client
>  * Run type: FULL
>  *
>  * SUBTEST: blocking
>@@ -70,44 +71,44 @@
>  * Description: Test the i915 perf metrics streaming interface
>  *
>  * SUBTEST: enable-disable
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: gen12-group-concurrent-oa-buffer-read
>  * Description: Verify concurrent reads from OA buffers in different groups
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: gen12-group-exclusive-stream-ctx-handle
>  * Description: Verify exclusivity of perf streams with ctx handle
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: gen12-group-exclusive-stream-sample-oa
>  * Description: Verify exclusivity of perf streams with sample oa option
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: gen12-invalid-class-instance
>  * Description: Verify invalid class instance
>  *
>  * SUBTEST: gen12-mi-rpc
>  * Description: Test MI REPORT PERF COUNT for Gen 12
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: gen12-oa-tlb-invalidate
>  * Description: Test OA TLB invalidate
>  *
>  * SUBTEST: gen12-unprivileged-single-ctx-counters
>  * Description: Measure performance for a specific context using OAR in Gen 12
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: gen8-unprivileged-single-ctx-counters
>- * Feature: oa, obsolete
>+ * Feature: oa perf, obsolete
>  *
>  * SUBTEST: global-sseu-config
>  * Description: Verify specifying SSEU opening parameters
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: global-sseu-config-invalid
>  * Description: Verify invalid SSEU opening parameters
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: i915-ref-count
>  * Description: Test the i915 perf metrics streaming interface
>@@ -134,7 +135,7 @@
>  * Description: Test the i915 perf metrics streaming interface
>  *
>  * SUBTEST: mi-rpc
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: missing-sample-flags
>  * Description: Test the i915 perf metrics streaming interface
>@@ -143,19 +144,19 @@
>  * Description: Test the i915 perf metrics streaming interface
>  *
>  * SUBTEST: non-system-wide-paranoid
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: non-zero-reason
>  * Description: Test that reason field in OA reports is never 0 on Gen8+
>  *
>  * SUBTEST: oa-exponents
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: oa-formats
>  * Description: Test the i915 perf metrics streaming interface
>  *
>  * SUBTEST: per-context-mode-unprivileged
>- * Feature: oa, obsolete
>+ * Feature: oa perf, obsolete
>  *
>  * SUBTEST: polling
>  * Description: Test polled read with default hrtimer frequency
>@@ -167,20 +168,20 @@
>  * Description: Test polled read with buffer size smaller than available data
>  *
>  * SUBTEST: rc6-disable
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: short-reads
>  * Description: Test the i915 perf metrics streaming interface
>  *
>  * SUBTEST: stress-open-close
>  * Description: Stress tests opening & closing the i915-perf stream in a busy loop
>- * Feature: oa
>+ * Feature: oa perf
>  *
>  * SUBTEST: sysctl-defaults
>  * Description: Test the i915 perf metrics streaming interface
>  *
>  * SUBTEST: unprivileged-single-ctx-counters
>- * Feature: oa, obsolete
>+ * Feature: oa perf, obsolete
>  *
>  * SUBTEST: whitelisted-registers-userspace-config
>  * Description: Test the i915 perf metrics streaming interface
>diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>index 718a3ed37..b80273a56 100644
>--- a/tests/intel/perf_pmu.c
>+++ b/tests/intel/perf_pmu.c
>@@ -55,6 +55,7 @@
>  * Feature: i915 pmu perf interface, pmu
>  * Test category: Perf
>  * Sub-category: Performance
>+ * Category: Desktop client
>  * Functionality: pmu
>  * Run type: FULL
>  *
>-- 
>2.34.1
>
