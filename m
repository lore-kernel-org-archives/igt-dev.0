Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A974BE9380A
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 02:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C4C10E2F2;
	Mon, 13 Apr 2026 02:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ofd862RJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8549010E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 02:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776047421; x=1807583421;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qkNYUwQ/3tVk9MBLOrP+jWpMoO4z7y30apCwqNDQYrI=;
 b=Ofd862RJCnQ8zEfEcDxmKgvv4EXOH2jX5Bk1i2gZMXuWZFVBCpnZBeIH
 eWxTFFxHY1YJcfthtJY8VbEBvI90xukXFGy6ysGeG5F9ggCZh2FT6UJEf
 P1JjelimGAur2HhDE1Xr+1w4dzyZqIxeSjHObcMhA9HSOhM1s9OBk6k6k
 ai37EiGyJKeHOBg1KLVMBdnijMnibgooyP8EobtLGoOxrN1KifuWjaV5P
 i1BdXVtZrgiLxqBx3G0VOwEmHK/4NWiTp9AeT7aZffgBbjlfilocHpjOr
 cI+QRP8GRk2hJNEHLj7w7EpjyFoOfGAqCWp0AIRbYCU4H5RO631EpFMMY Q==;
X-CSE-ConnectionGUID: urFt2lbERaCtzIYxwiTXbA==
X-CSE-MsgGUID: DsRkc4b4Rlqc8g8Y92MRHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="102436537"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="102436537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 19:30:20 -0700
X-CSE-ConnectionGUID: HJyvPIBUSliSFiqLAuubJA==
X-CSE-MsgGUID: DvMo5cpCQjmNKXBuW2yMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="234580594"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 19:30:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 19:30:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 19:30:19 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 19:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaptOpP8gh4GYm5PlBoQ3hyh6+8SsJRtrruvjYNUKoBmxZMy5Nf8RM6LnHUf4X7ZXzPMGNRKFcPh10qIVSM7YQzNT3mq8OPyzqXTSO6lXPSnfPjuE8coDjsrHgRsF6EQtpzwTvlmMsCANoL2kJskg9TA2wPnwtW4583xkIOVZydaoFJFKKEAjTou6/RejrxyVJS51iuwo0hNDKaL6ZuA0IYpLSyGMOMoOI652M7gqEGiyOCNuJB5yTGEPHlG4Z0OH7ZBf96jgy4jS+XqmfN8YAcWDKmmyr1ic5pkyBya+HNHIyXt+bvFu7Xc7CRY5FHD6Y46Hv5D3pVs1YkIZ8ZXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bciB0x4TIGjN8K55n4WDmCcHbvUj6CaKML1ZFRDIo3g=;
 b=YYozGDwBRXDJ+pFd5dPRfz/FGveVuAQyy9BnBsqljxC08ljHTJLfZFnV/I36mZMxs00riEXvN+FQYJfiCQdh88qMGHaKhYZEJI8uoUYw12DVwpS8fgAOFPNEo5j2l7b+7PF8yxQGxaAcQGGV/JBckZ/CVavi+cIR1XZM8bgViwWCimbsJrwEbeRUCmmjbulBrmy+zI9G7tL3kVzy7lZkzb1IAR199zIwYZ9PXBQVJTL48urm91l193cNrEQys2G3BMk/xI3Q2jCW+BJdxbBXd4PSUXBco0Dt4V0zbSm+OJ/BM92GyMiSaPf1kXfXhdzeZy3F0ybCwK6fSNn/xbekQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.47; Mon, 13 Apr
 2026 02:30:17 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 02:30:17 +0000
Date: Sun, 12 Apr 2026 19:30:14 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_exec_reset: Add checks for
 hanging queue wait_ufence return
Message-ID: <adxVNkrvqsNIrhvg@nvishwa1-desk>
References: <20260409203702.4350-1-stuart.summers@intel.com>
 <20260409203702.4350-3-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260409203702.4350-3-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::13) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c61138-55c1-477f-f861-08de9904999a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: onJatz+OxnEjPcA+N1tUd+ktMTU9IJPrl9LR9gYJbZ5bkcRVB4NHieNEAlCwpqJGUcQ+F5sBsk6VwDJxROLuC+kzEap9/ckCth3LVyrFx0sKRW27dgmNBQIWAhGVJ2yxcQLgAh9CQGsv8j2vrVZpbkEaV+fM/QZYj+Eu6rMAuWt+Gq4VP1NphN6SmB7DxFlRXkVlUKwTeyaZslVyEDNnA6rZ/JB0P9IuHBTvF/3kYzFmxIRCD43fB3Y2NkP9LLaRkY12SQxqxhfhFH/2cHZNijwSGXP0/cqzUq5JG0dkZlEJspm9kn2crEvu3k1fgEcC9El0PFfBsE/AecYaY6fLZK70Qr+21vfd2D3ev8PPM9iruTDVs7rqnCaUGBpfTNkKj8dFr9QEu4S+1henxOtnSnALujQ2UOjoX85wraXYbNzGXPOLG48oXTcYc+uHMzN9hBfkS91GJ7TzVuq4cBro81w0SCPX2LtmYItWTaZjt0ZDk98oN9RVC3j3XsCrqpZOdzYPo7v21ZiUBNArZ1Bc4CKYPxbpSfuKGamTE9Led4TZH0EiswiXPWulERxoGcObLq4dquD2zfbqvj0xU88+7NG9V9SxODRPBDPcPN9o2St9Dicj7z/DDYPhVjS8sJdz4LQmvgkgjZWVEZ4mfq5JYLDukHlGMe4crYq7aDJfut0bMLLcsNfdeddBGJB00PZvc7X1Pzd6byvgCtJuobKi1zBa+bhV1ulME4f7qBKZSY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7fE91/QvNkdj34fLnde3lTN0hwS2Eh2lLDW0quj29rWqBs3OnqlinFsZ4yyz?=
 =?us-ascii?Q?6Hl4srJviiZHEWX/fDyPHVaiEB51YzgtaAk4JTvAYDsR7ljZn4cOfY41UwCC?=
 =?us-ascii?Q?X9shVsGcammLKZnKwEdKJCLBi3445wqDvYXpjF/r9gUMPKF1Sbl6s/k88yTq?=
 =?us-ascii?Q?hJG/qfKnwgqNkLQ0PylPrkSaJbjWqLsQLqmxz31A0IhwGWZM6/Qdy1eeOOJd?=
 =?us-ascii?Q?G8gL+KmyWq9JMjxTKAYVKzWdYgI0TqShT1W2wPMrfy905WIfbQiAe1c+xTAg?=
 =?us-ascii?Q?sYknjvHMQLCvdJJhVn0dgJlFoJ+FTW/r6b52JHJ5vEuzeA4cuEZYCRAqXRtm?=
 =?us-ascii?Q?yrdiUJBfD6B7UIs1j1rLFaG3aJyv8T0arU5ATgcWGGejkWKNFCj5M0nxjizj?=
 =?us-ascii?Q?qe+SINn2jZQXnLgMQxWfCw9Ej5ApXKwi6qF72UuNDXz+5/I6ID2WIw1NK3Jv?=
 =?us-ascii?Q?JNy6QdD0Ac0IajF+Pmx+OzoHW+BbDLnF7Xrx0nyT2rHwvw401elLnGWGUqyY?=
 =?us-ascii?Q?1+Pv0LNF/wB+GnYT1jmK7WnbXS8lR195Ku0kcpjgpZZ4P/h5/0X+369MNaKL?=
 =?us-ascii?Q?kM2Y7Ukq05v1mzL+WB60QFD0rc8cnwwAxj+j16ogiy1oxNHlyCPj5JIIGZPb?=
 =?us-ascii?Q?Z2nwY22j3R2afhRgy0f3KBHDs7SNVaJ2nd2O9ZMLBdUN7ay+E6cv/rjwxmBC?=
 =?us-ascii?Q?REjQm0trqQHAf9Dv8JqXL4wDwROG9HfJ6sebd3spKVvrp9n9nY0cfqAdytOR?=
 =?us-ascii?Q?itZbz5u648TO2g1mYWSEnb6iITt7Z8Kt4u9gvpE0vvRqMvc/BBA1JeQxme9W?=
 =?us-ascii?Q?wR+nPl9dhCsuKfGwYKJoHJ/Yt+TsOnNmjk08wxRmBi5EgylgfKv2g3gUcdkI?=
 =?us-ascii?Q?BoiLyU7xDDNSSY9B/YuYRv47jEuvuHe/ZHGabngEZRYZo25CMGQC4SohUsO2?=
 =?us-ascii?Q?Bfaj34Vut8GKqnjYm89hkRfoTut9msH2fHnaVJRrtmSv/OwbYK/WGcGv5urU?=
 =?us-ascii?Q?RSLJgs6eT53jI/iA20Q+VL0Mz1/Fe9UwxY5voUG/nC97WR1L6oNkEiYaAnsv?=
 =?us-ascii?Q?3htd6RTyJsrwpud9dUcxKFKYC3IvvSKKbkFFGiC4P9LTQf5Zh/3DQ8meUwaH?=
 =?us-ascii?Q?he7r+urgRCJPnYq95QHU9QICN24EPIXfKIvDMWFdHMwCq2QS8xsIZbavUXDu?=
 =?us-ascii?Q?hQTCN9hYnQIm1IDV7jJ9LqTbYrsQkK1sUAuUsrWk8DUMxlqOY1v9ZELI+1Te?=
 =?us-ascii?Q?AIYnMcVOWQEbzBYkNs1+7H0wYYP+U1+4yzOZjtddexgqgx1fcKtwTdVh/J9k?=
 =?us-ascii?Q?MnGl2I7yHQ6zdCvxtT9IYoTST48nFmgP2c8ok3GTh5TcV6TFyATsU/UsDU6Q?=
 =?us-ascii?Q?cE+qP7lb75LFOnsl0hBsy0kYjw3MRII9MvPpOlcAjVT55IyJQYQjarmr5SIT?=
 =?us-ascii?Q?qFATd8MNAzTccI69r1vb/fTbVmQI6AYDOBaILOoMyX2oN2kgTnpC5DvH9qRj?=
 =?us-ascii?Q?bSamQn4aDeci97vQoLZpPAgK6irBMDQgVTl6lNawLmLvCcblnR/3/OztQaKn?=
 =?us-ascii?Q?XVaBraBfeHPQaNPXdtnzJ1DCajT0QU3dqo0K2lUlz5JlJ5vY1hkh49+nld/B?=
 =?us-ascii?Q?LT7y5Q891v49rdIQcx44EIX70q1jv8u629LGIED677LaVI0Qw72juBJ548PZ?=
 =?us-ascii?Q?y+pLNM27EDD+AgnDd48hu1jQYFFPnOw+RQ2krDGYdnyXuvCnxOCEjbSGtkU7?=
 =?us-ascii?Q?A0447xVHJdvwJ5FTZlDxd7LyBtv0q1q6ncDacfm9NkV6AD+hv2mB?=
X-Exchange-RoutingPolicyChecked: Qzyaugt/KNJUYCgiXMkdII54Gg/BxsIuwHr1n+avcBeJWy31cUbpeh8rn1A7cN89mJV5iMsAJ1kqaNAhmGWC6b/VHfpY/7zPUaBcNonv/lP1ZcFqujmvAtHi8hqiE0Iv2NPpczYgbyCpiU0zEdPZHMScArYxQQaC0T+eACGwejo8it1W+nx+/Tlaww9icfcSHY6kKN1O2hIk4E/5jf1U5zX+B6FwS7pq8dtqE0QHfs20Uuj5iC3vhLFiOJopxNNE3G0U4Cinrc1GIugDwuObu/Ul9YbuP5JH3asmQ6eXz/MpBuHydHDC2RBsmhdnyc5zVPYAVJrwIgGU8O5Jso8aAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c61138-55c1-477f-f861-08de9904999a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 02:30:17.0207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bgJ/XljzREPfoNeBrD6CTkgmqGvShjTtaOysMxFFfyRh/7ib12rS40kVWy5Hpct9jVUztg7Tec2t2MWGymVToaVkUays7StzLXSt5LMe1jgkWDn8u2fUmDxbFW4gg/x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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

On Thu, Apr 09, 2026 at 08:37:00PM +0000, Stuart Summers wrote:
>There is a 3 second wait user fence timeout for the compute mode
>variants of this test. Instead of just skipping the wait altogether,
>let's make sure this does in fact return -ETIME as expected there.
>
>Also add the i == 0 cases for legacy and compute path for the actual
>data checks to stay consistent and to be a little more explicit
>about what we're checking there.
>
>This also let's us add a little more detail to the cases in some
>planned changes around hanging multi queue secondary queues.
>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>---
> lib/xe/xe_legacy.c          |  8 ++++++--
> tests/intel/xe_exec_reset.c | 15 +++++++++++----
> 2 files changed, 17 insertions(+), 6 deletions(-)
>
>diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>index 6aeddc578..3371a91ac 100644
>--- a/lib/xe/xe_legacy.c
>+++ b/lib/xe/xe_legacy.c
>@@ -230,9 +230,13 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>
> 	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
>-		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
>-		     i < n_execs + extra_execs; i++)
>+		for (i = flags & LONG_SPIN ? n_exec_queues : 0;
>+		     i < n_execs + extra_execs; i++) {
>+			if (!i)
>+				continue;
>+
> 			igt_assert_eq(data[i].data, 0xc0ffee);
>+		}
> 	}
>
> 	syncobj_destroy(fd, sync[0].handle);
>diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>index 95191139d..6b71d9144 100644
>--- a/tests/intel/xe_exec_reset.c
>+++ b/tests/intel/xe_exec_reset.c
>@@ -461,17 +461,20 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		return;
> 	}
>
>-	for (i = 1; i < n_execs; i++) {
>+	for (i = 0; i < n_execs; i++) {
> 		int64_t timeout = 3 * NSEC_PER_SEC;
> 		int err;
>
> 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> 				       exec_queues[i % n_exec_queues], &timeout);
>-		if (flags & GT_RESET || flags & CAT_ERROR)
>+		if (!i) {
>+			igt_assert(err == -ETIME || err == -EIO);
>+		} else if (flags & GT_RESET || flags & CAT_ERROR) {
> 			/* exec races with reset: may return -EIO or complete */
> 			igt_assert(err == -EIO || !err);
>-		else
>+		} else {
> 			igt_assert_eq(err, 0);
>+		}
> 	}
>
> 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>@@ -479,8 +482,12 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
>
> 	if (!(flags & (GT_RESET | CANCEL))) {
>-		for (i = 1; i < n_execs; i++)
>+		for (i = 0; i < n_execs; i++) {
>+			if (!i)
>+				continue;
>+
> 			igt_assert_eq(data[i].data, 0xc0ffee);
>+		}
> 	}
>
> 	for (i = 0; i < n_exec_queues; i++)

LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>-- 
>2.43.0
>
