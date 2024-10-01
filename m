Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D4BCEB2D1
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 06:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5ED10E013;
	Tue,  1 Oct 2024 06:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3m0pKs7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0805210E013
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 06:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727764200; x=1759300200;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=2qU1ubQwHvs0VcIGfrgXRY70gJLi2BszQKxMFGlddRU=;
 b=m3m0pKs7bZgdoXTMzaORAOJIiHXN3JQnHpKl+gPXjq2z2BwlFbTEosiH
 Isn20IDP29LvSsbsHGynn92EhswKtcHOz8b+9ZtOi/AKLGdktd+X7x6lW
 KgNslqXpoV+z+Y0A5YJ7i4IoaEiqGtyy+hcsbRtVoREqbs3fiF/XifwdI
 gRqg7JvIzodWt/KsYkdKZO27vTDdId3YsOl7lYKMMB4j0Te8NQAL2jboG
 D+ikMjU9h2ESFnWV67N1K7fw+y/7+AswUcKjVQ9vOFqTq0CrrZN7oqQe9
 O+qJ/xDxGEU00lgbz+mTGvolJDTRDqtyE0IYG8wBFqPS1yWt1V6eplIc7 Q==;
X-CSE-ConnectionGUID: 03RDaeXdRP6je6FBVw++2A==
X-CSE-MsgGUID: 2TRtaluMRcSSXthEtRQdTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26335731"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26335731"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 23:29:52 -0700
X-CSE-ConnectionGUID: CCdDJOmtR7WSjht3vM1Asw==
X-CSE-MsgGUID: ThpGOivPQxy03o3OpV4NUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73812619"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 23:29:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 23:29:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 23:29:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 23:29:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKlmscvYrcLL8tPJoSYHEuN/CabgVRHs6XxF/H4x+tFjX7rKrpMjM9iLKwlrAGxvIZ49E7dSrZ8BqEZFW3+r1hE/jOau3pNpqibn2Ub7kfisrLNGAXqQlRSKWD48H713I29tfw8ukPLuJpj63PGaPw3rHu01mgInY0bFHuroo/FnJf15m4rbAsSXAkpkRWAoCRLuk62nJzyoNXGC4Hxb1kDAPLi2eC8xsoE1MmV+WFRGpE2oxeztINXl+9XuSEXudNpr/KAFqgnlAsYaCCUYjf6w8dFUmfOZ7Sipeqgrqz8TaivcXuYvJTYT+mKu8xpx1XyAKHdHCxc2eGyWde+FFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SddRZ1mURi50piW+Xj0vC/xsPb9o/ELjmQkpqvq/ko=;
 b=K2FvuSAzFvUYDVNmHU3cDX4o8GCu5O87qqny+TVNVD+/5WVQ6brkBWLrZYF1oXaFGx9ICGafhI9dHJiruZP1XqtGszjyhJJA1RmZPCJhEmLE2t+6acITl2yJp2JQlkVCWkSfyxta4TP637toR+Ik1cVf/yIuGEuWyVgLluJQKZ7Woop9iFznnW3RBoUDshaeMQFrWU8uF1vRvPJ4NqhWxKm8/kLLaamG6Q5eE2ap/bSVRaef0osIMtsjGOmqWrU+98ZK16kz0mTPhZ0CnQAmrbSG9lyHhrsIOuB8A4LF4Tqj/tjG4ClW8yQ77jjJNg30UWHdVx7ke0EmBqhBWZ3OOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 06:29:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 06:29:03 +0000
Date: Tue, 1 Oct 2024 01:29:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_series_startin?=
 =?utf-8?Q?g?= with [CI,i-g-t,1/5] lib/igt_gt: Fix forcewake open (rev2)
Message-ID: <4kc2awyj7tan2onjzj7qgobpqtfehada2a3ltcq4frevg6bkez@wix6fzcjzgsf>
References: <20240926041651.412396-1-lucas.demarchi@intel.com>
 <172775021593.1140063.18181812657372711042@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172775021593.1140063.18181812657372711042@2413ebb6fbb6>
X-ClientProxiedBy: MW2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:907::16)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b1c3b4-b5a1-4378-6b72-08dce1e257da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xUpCFjrjq2fkJUx9LlISXmL8bQ5UR8omJlzBCEFChr1wtQYlZQ+45w448zBp?=
 =?us-ascii?Q?QQxLJI8C4kX13G4XU0yxxpVIOtFOHqPxfYi5rONzWV8yPsMKbt0Wh582XItx?=
 =?us-ascii?Q?En+DXtA8AS/Z/BXmbnUveCUjhRNMQxC0qTZ62tGvdk2jTIlV4QxadWB4Jy4h?=
 =?us-ascii?Q?7kCRj+NisHEi7EYuOHlMST86sVNdXQo2n3vW40/R5VRL3iR6FKoDRINuDYfl?=
 =?us-ascii?Q?MXhJTGsmU1HMUZfDP9Yu8JW/FYQiKIB1AM/LW/01lOp6JzBENWE6cyyijO7l?=
 =?us-ascii?Q?6hOSD/MIlzOHfinG4NMgQfxcd4QIMj7wM7TJqMp4mcb2zpNMnkzeKwRs9LnJ?=
 =?us-ascii?Q?UUEunudztPhIN03JE4UinwBPVyH7MGdRmybrccus4z2GRAn+nB6ufiW8kC5h?=
 =?us-ascii?Q?4k9hpRWQRYb9IS2ZFaEUbHCXjvllBqCp/ITlLKuoPmuzyZYnvpvvqnAApIq+?=
 =?us-ascii?Q?u1l04RkeYhTMtN3ktR57iPy8cu9wdBbvgxwzT37MbfHQB5PDo1aMaAsojMM5?=
 =?us-ascii?Q?9+WfSOoHhCZ4m6aSehsSBF+gTAbhSBA6nmN9rdbol3JkMnO7AVw3PgFDwpAZ?=
 =?us-ascii?Q?AzqqaUel6TkImDV7ifGWek7wmg03rlTOAfLGUlLTdFGtAk/+GjDoHFzfZV9e?=
 =?us-ascii?Q?n4N9FpYbbxjiTm665oNJ9s/ps5n/9DJP0cUI0+XawNWf0GjaACO1K1S3xSnw?=
 =?us-ascii?Q?rNwBR3C+hK10ubvu/Bl6p09wHUNzQEcA7woeqvh2mS5VS81AE6OgFej9hHU4?=
 =?us-ascii?Q?32COMUDGrBupXVQw6AiqXidAZaaW+Y1BOtqisowXbFJ/844joVKcGAOsVUdo?=
 =?us-ascii?Q?4I44AvwQ/L25x0DmgemR6Kmq/zidEPXqWgsqFItI5zwGvgPWk1RG/cbWN7jn?=
 =?us-ascii?Q?6kyJiA9ato/NtmG6GTJD8LmBSschO6TAMdQg9X7GA4YcF5WarJAoK/jiArfx?=
 =?us-ascii?Q?UD+bDGRJ6M5u3pU59/N78EQNTCRBdyWAEx66ufGAxb9UoH+1fB2E+c4Hxa6o?=
 =?us-ascii?Q?eY40V9TXN73BF9VNbq8Y9VT0+wG+cMDNzVK1IbKRrfbpN+9VP7BWPWVbmsXs?=
 =?us-ascii?Q?8URcuOnG68lrJP11sF5zYTyUPMWTNAfbhT85LN2Y2mPVXHxfO131pgp5wD0w?=
 =?us-ascii?Q?Xe9JynD3Vp6l7pLt01vE5sCPvVOiu/UhlxM+B9qi33ONRAJBOMQAit5pTDtt?=
 =?us-ascii?Q?UJFRG53tjnGHVAIVXMpct8lddGXrC+7AYpY08CdmHrA0GbpyXHatbReM9pDC?=
 =?us-ascii?Q?DDVO23v4u5CoNSlUWmQPwtuAu0b4RLAsDo03qoImejmx/E8aHkTLS/4zc/rH?=
 =?us-ascii?Q?bIw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?irU6CUans5rOp4mAMnqkpB1WmEnajkPtI2qReZNI9YYR33tTTG3SAc4d+DXU?=
 =?us-ascii?Q?UJGtF4P/hqDLl9dymmssZpJCJwCmmR35iCZVMM90m+pJNB7u+ZaBSAtn2sc9?=
 =?us-ascii?Q?0N3+qL6xs8Dyf7PlUaXn3hvvRmwby3scOofkbW/9MV5hvqlc1NPsMa/BVdp9?=
 =?us-ascii?Q?6xKtEL+l3sTmTiZg0RHuNRluxc8SoUnfxPgVP5AJC+5ohOkl/MXfLrhO4Ph+?=
 =?us-ascii?Q?SiSf+EwvH2phcz/X1zgZb0NX4nDvV2v9Zrvjwn8o3+YFsUSWtuGid4qgiQWs?=
 =?us-ascii?Q?QLZbwODe9X+QS4ma/n7DtCnXQT+FcbybjoSh1PgYXbZlzJD+gMC8BjyBOFKA?=
 =?us-ascii?Q?zfIq3c7ejDIg7m9cClKmovELogKza2QpXciSrEW9a28Pv54HsdqAWl89B11L?=
 =?us-ascii?Q?1shbhPJ1awj6OrEV/lndwYWjdmwRDfho0LJ9jSkf9ygo8Rj3WONgVHzQCTBl?=
 =?us-ascii?Q?f5ozuDgw22iOZiAY1RYLunr1q9fyMbGgc72RvEEHdZeg6guEJjPnbP0iebBa?=
 =?us-ascii?Q?k2qw1nkZVx8N+2JwzNbAnUu0B/mfWn0tEGkT581Rnz2wRM14IxG/eUf64ZQ6?=
 =?us-ascii?Q?CRKwROTs42NyINSN7OLaQl2OEf8yu88T1cc/l/eOj0KwjhxV9kBzbbY4xUTs?=
 =?us-ascii?Q?QBWrchZWad99eMuE/WuEDlxL1PbABz++ojzS84NzHm154xfR9CjAVLM1THEs?=
 =?us-ascii?Q?iQfEb/u252DTw0H3EqsieGfE5fF0BV4P0nq6PpEdtzEJENt9ahJwOtz5H1bx?=
 =?us-ascii?Q?gStp+hJYM9onVZnqmS7kf8KFeTO127Tzait6PRSrNTh/ICVH/UZ7XpA/34NF?=
 =?us-ascii?Q?KwBuOfPewD+ZrIptyEOYuQAalfzp2HrdezxZTxKZTwCcHnQQsIGg+2jhgltJ?=
 =?us-ascii?Q?TEH1i9fZwCmNGelYCb9oKkqCPkyTaf6Y9qFRnccCWGbyYDl4yoWl1sWxLmCZ?=
 =?us-ascii?Q?xP93ygHqS2vG+5B8pdJN3bR/Q3alEiQY+AGwaNYodlTUVvqlffav1s6aGist?=
 =?us-ascii?Q?b50P5iPQX/jbmS3E3nAJ08qxkTLdh21Hw9SHxrcwJA9CJx5iUoKw2SWsU3W/?=
 =?us-ascii?Q?RMjGsNiS8HCbT6pw6Dg5MfjTHrShCr+Z12EwcVbqeJB1AW7yi4RlfL1/C/Ty?=
 =?us-ascii?Q?27m6GZBlcJmyIgYlDjc9ZvSbJo72qYYByHGec5Gw6icc0kA08Iz/F+lTKChr?=
 =?us-ascii?Q?2PR4LN60/XVdgS4kwoRtdxr8nXtcikI34kkEMXRygCHVcpAvB9M2tXloBpSS?=
 =?us-ascii?Q?sDHcC5tKadJSBQfctRjcEu5EEc2ZeO0LJ8wJQwsvBYZGY6QKdEqbxrJHarjv?=
 =?us-ascii?Q?iQ197Wc3gZGfVJdrVwKbKgYHnjvz7PoawhIzEQzK5GVeSWcsoHHFMgVcBfsy?=
 =?us-ascii?Q?0n2HhgpZlPb/gdCrah9HAc9fsUSWaivBSvCtA1wH4m8VrXyAx/OEOsXDQoaf?=
 =?us-ascii?Q?KJOtjcH15haqe3OjQTzj32jBxmzbZaWUOft35auwRe3cthaaTBpRdto5XIjB?=
 =?us-ascii?Q?ssM+UPw4zUfKDUksRxVpSimfIXAwJREWm+pJseiMipdn8ggqVQUSvF7MgDDR?=
 =?us-ascii?Q?z14RlE3RRjz9mZRVwCEU9DxRfpMvpGeqLiN6qFpZb2sXP55EuVvlnJFv/grh?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b1c3b4-b5a1-4378-6b72-08dce1e257da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 06:29:03.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdGFd2FvzvrPRb+0+1q3EOdHTO3tjnQZxDNJ3FRrUj4b+tt/cYFUw2YiDAsiJWFCXL2yIm12aYtDjywhWyXzgV71qzzGzfbOd5nrvwekkyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

On Tue, Oct 01, 2024 at 02:36:55AM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: series starting with [CI,i-g-t,1/5] lib/igt_gt: Fix forcewake open (rev2)
>URL   : https://patchwork.freedesktop.org/series/139124/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from XEIGT_8043_full -> XEIGTPW_11839_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with XEIGTPW_11839_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in XEIGTPW_11839_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in XEIGTPW_11839_full:
>
>### IGT changes ###
>
>#### Possible regressions ####

none of these are related to the forcewake... nor the i915 ones.

Pushed

Lucas De Marchi

>
>  * igt@kms_feature_discovery@display-4x:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][1] +10 other tests skip
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>    - shard-lnl:          [PASS][2] -> [DMESG-WARN][3] +3 other tests dmesg-warn
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>
>  * igt@kms_joiner@invalid-modeset-ultra-joiner:
>    - shard-lnl:          NOTRUN -> [SKIP][4]
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>
>  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][5] +1 other test fail
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>
>  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
>    - shard-dg2-set2:     NOTRUN -> [ABORT][6] +1 other test abort
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-436/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
>
>  * igt@xe_evict@evict-mixed-threads-small:
>    - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8]
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-466/igt@xe_evict@evict-mixed-threads-small.html
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@xe_evict@evict-mixed-threads-small.html
>
>  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>    - shard-lnl:          [PASS][9] -> [FAIL][10]
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>
>  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>    - shard-lnl:          [PASS][11] -> [INCOMPLETE][12]
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
>
>
>#### Warnings ####
>
>  * igt@kms_flip@plain-flip-ts-check-interruptible:
>    - shard-lnl:          [FAIL][13] ([Intel XE#886]) -> [FAIL][14] +1 other test fail
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
>
>  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
>    - shard-lnl:          [DMESG-WARN][15] -> [FAIL][16]
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-4/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
>
>
>#### Suppressed ####
>
>  The following results come from untrusted machines, tests, or statuses.
>  They do not affect the overall result.
>
>  * igt@kms_cursor_crc@cursor-suspend:
>    - {shard-bmg}:        [PASS][17] -> [INCOMPLETE][18] +3 other tests incomplete
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
>
>  * igt@kms_joiner@invalid-modeset-force-big-joiner:
>    - {shard-bmg}:        [SKIP][19] -> [FAIL][20] +1 other test fail
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>
>  * igt@kms_joiner@invalid-modeset-force-big-joiner@big_joiner_on_last_pipe:
>    - {shard-bmg}:        NOTRUN -> [FAIL][21] +3 other tests fail
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner@big_joiner_on_last_pipe.html
>
>  * igt@kms_setmode@basic:
>    - {shard-bmg}:        [PASS][22] -> [FAIL][23] +6 other tests fail
>   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-bmg-1/igt@kms_setmode@basic.html
>   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-bmg-7/igt@kms_setmode@basic.html
>
>  * igt@kms_vrr@lobf:
>    - {shard-bmg}:        NOTRUN -> [SKIP][24] +2 other tests skip
>   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-bmg-1/igt@kms_vrr@lobf.html
>
>  * igt@xe_ccs@suspend-resume:
>    - {shard-bmg}:        NOTRUN -> [ABORT][25] +1 other test abort
>   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-bmg-5/igt@xe_ccs@suspend-resume.html
>
>
>Known issues
>------------
>
>  Here are the changes found in XEIGTPW_11839_full that come from known issues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     [PASS][26] -> [FAIL][27] ([Intel XE#1426]) +1 other test fail
>   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
>   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
>
>  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1407]) +2 other tests skip
>   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
>
>  * igt@kms_big_fb@linear-32bpp-rotate-0:
>    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#1659]) +1 other test fail
>   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-0.html
>   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-0.html
>
>  * igt@kms_big_fb@linear-8bpp-rotate-270:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#316]) +2 other tests skip
>   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html
>
>  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#610])
>   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>
>  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +3 other tests skip
>   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>
>  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1428])
>   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124]) +13 other tests skip
>   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>
>  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2191])
>   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>
>  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#367]) +5 other tests skip
>   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>
>  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#367]) +1 other test skip
>   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>
>  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +97 other tests skip
>   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
>
>  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
>   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>
>  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +4 other tests skip
>   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>    - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1195]) +2 other tests incomplete
>   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][44] ([Intel XE#1195]) +1 other test incomplete
>   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
>
>  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#314]) +3 other tests skip
>   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>
>  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1152]) +3 other tests skip
>   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>
>  * igt@kms_chamelium_color@ctm-max:
>    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#306]) +2 other tests skip
>   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
>
>  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +13 other tests skip
>   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
>
>  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#373]) +4 other tests skip
>   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
>
>  * igt@kms_content_protection@dp-mst-type-0:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#307])
>   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html
>
>  * igt@kms_cursor_crc@cursor-offscreen-512x512:
>    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1413])
>   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>
>  * igt@kms_cursor_crc@cursor-sliding-32x10:
>    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1424]) +3 other tests skip
>   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
>
>  * igt@kms_cursor_crc@cursor-sliding-512x170:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#308])
>   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#309]) +3 other tests skip
>   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#323])
>   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>
>  * igt@kms_dsc@dsc-with-formats:
>    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#599])
>   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@kms_dsc@dsc-with-formats.html
>
>  * igt@kms_feature_discovery@chamelium:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#701])
>   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
>
>  * igt@kms_feature_discovery@display-2x:
>    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#702])
>   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_feature_discovery@display-2x.html
>
>  * igt@kms_flip@2x-flip-vs-suspend:
>    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +4 other tests skip
>   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html
>
>  * igt@kms_flip@flip-vs-blocking-wf-vblank:
>    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#886]) +4 other tests fail
>   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1401] / [Intel XE#1745])
>   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
>    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1401])
>   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html
>
>  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1397]) +1 other test skip
>   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#651]) +32 other tests skip
>   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>
>  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#651]) +9 other tests skip
>   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#658])
>   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#653]) +37 other tests skip
>   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>
>  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#656]) +22 other tests skip
>   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>
>  * igt@kms_plane@plane-position-hole-dpms:
>    - shard-lnl:          NOTRUN -> [DMESG-WARN][71] ([Intel XE#324]) +1 other test dmesg-warn
>   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms.html
>
>  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
>    - shard-lnl:          [PASS][72] -> [DMESG-FAIL][73] ([Intel XE#324]) +1 other test dmesg-fail
>   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
>   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
>
>  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
>    - shard-lnl:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#324])
>   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
>   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
>
>  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2763] / [Intel XE#455]) +7 other tests skip
>   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
>
>  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2763]) +11 other tests skip
>   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
>
>  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2763]) +11 other tests skip
>   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>
>  * igt@kms_pm_dc@dc5-dpms:
>    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#718])
>   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
>   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
>
>  * igt@kms_pm_rpm@legacy-planes:
>    - shard-lnl:          [PASS][81] -> [INCOMPLETE][82] ([Intel XE#1620] / [Intel XE#2864]) +1 other test incomplete
>   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
>   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
>
>  * igt@kms_pm_rpm@legacy-planes@plane-59:
>    - shard-lnl:          [PASS][83] -> [DMESG-FAIL][84] ([Intel XE#1620]) +1 other test dmesg-fail
>   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-59.html
>   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-59.html
>
>  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2893]) +2 other tests skip
>   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
>
>  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1489]) +13 other tests skip
>   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
>
>  * igt@kms_psr@fbc-pr-suspend:
>    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406]) +2 other tests skip
>   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-7/igt@kms_psr@fbc-pr-suspend.html
>
>  * igt@kms_psr@psr-sprite-plane-onoff:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2850]) +16 other tests skip
>   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html
>
>  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1127])
>   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>
>  * igt@kms_rotation_crc@sprite-rotation-270:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#327]) +1 other test skip
>   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#899])
>   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>
>  * igt@kms_vrr@flip-dpms:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#455]) +22 other tests skip
>   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_vrr@flip-dpms.html
>
>  * igt@kms_vrr@max-min@pipe-a-edp-1:
>    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#2443]) +1 other test fail
>   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html
>   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_vrr@max-min@pipe-a-edp-1.html
>
>  * igt@kms_vrr@seamless-rr-switch-vrr:
>    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1499] / [Intel XE#599])
>   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.html
>
>  * igt@xe_evict@evict-beng-large-external-cm:
>    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#688]) +6 other tests skip
>   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html
>
>  * igt@xe_evict@evict-beng-mixed-threads-large:
>    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][98] ([Intel XE#1473])
>   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>
>  * igt@xe_evict@evict-large-multi-vm-cm:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][99] ([Intel XE#1600])
>   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html
>
>  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1392]) +6 other tests skip
>   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
>
>  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#288]) +37 other tests skip
>   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>
>  * igt@xe_gt_freq@freq_reset_multiple:
>    - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#2711])
>   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
>   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
>
>  * igt@xe_live_ktest@xe_migrate:
>    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#1192])
>   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
>   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
>
>  * igt@xe_mmap@small-bar:
>    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#512])
>   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@xe_mmap@small-bar.html
>
>  * igt@xe_module_load@load:
>    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#378])
>   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-8/igt@xe_module_load@load.html
>
>  * igt@xe_oa@closed-fd-and-unmapped-access:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2541]) +6 other tests skip
>   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html
>
>  * igt@xe_pat@pat-index-xehpc:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2838])
>   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
>
>  * igt@xe_peer2peer@read:
>    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1061])
>   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@xe_peer2peer@read.html
>
>  * igt@xe_pm@d3hot-mmap-system:
>    - shard-lnl:          [PASS][111] -> [TIMEOUT][112] ([Intel XE#1620])
>   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-1/igt@xe_pm@d3hot-mmap-system.html
>   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@xe_pm@d3hot-mmap-system.html
>
>  * igt@xe_pm@s2idle-vm-bind-userptr:
>    - shard-dg2-set2:     NOTRUN -> [ABORT][113] ([Intel XE#1694])
>   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html
>
>  * igt@xe_pm@s3-d3cold-basic-exec:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
>    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2284] / [Intel XE#366])
>   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@xe_pm@s3-d3cold-basic-exec.html
>
>  * igt@xe_pm@s4-basic:
>    - shard-lnl:          [PASS][116] -> [ABORT][117] ([Intel XE#1358] / [Intel XE#1607])
>   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-5/igt@xe_pm@s4-basic.html
>   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@xe_pm@s4-basic.html
>
>  * igt@xe_pm@s4-multiple-execs:
>    - shard-lnl:          [PASS][118] -> [ABORT][119] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html
>   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>
>  * igt@xe_pm_residency@toggle-gt-c6:
>    - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#958])
>   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
>   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
>
>  * igt@xe_query@multigpu-query-config:
>    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#944]) +2 other tests skip
>   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@xe_query@multigpu-query-config.html
>
>  * igt@xe_query@multigpu-query-uc-fw-version-huc:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#944]) +3 other tests skip
>   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>
>
>#### Possible fixes ####
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>    - shard-lnl:          [FAIL][124] ([Intel XE#1659]) -> [PASS][125]
>   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>    - shard-dg2-set2:     [INCOMPLETE][126] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][127]
>   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>    - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#1195]) -> [PASS][129] +1 other test pass
>   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
>   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     [DMESG-WARN][130] -> [PASS][131]
>   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>
>  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>    - shard-lnl:          [SKIP][132] ([Intel XE#1508]) -> [PASS][133]
>   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>
>  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:
>    - {shard-bmg}:        [DMESG-WARN][134] ([Intel XE#877]) -> [PASS][135] +7 other tests pass
>   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html
>   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html
>
>  * igt@kms_flip@absolute-wf_vblank:
>    - shard-lnl:          [FAIL][136] ([Intel XE#2631]) -> [PASS][137] +1 other test pass
>   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-5/igt@kms_flip@absolute-wf_vblank.html
>   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_flip@absolute-wf_vblank.html
>
>  * igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:
>    - shard-lnl:          [FAIL][138] ([Intel XE#886]) -> [PASS][139]
>   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1.html
>   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1.html
>
>  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>    - shard-lnl:          [FAIL][140] ([Intel XE#2879]) -> [PASS][141] +3 other tests pass
>   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
>   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
>
>  * igt@kms_joiner@basic-force-big-joiner:
>    - shard-dg2-set2:     [SKIP][142] -> [PASS][143] +1 other test pass
>   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html
>   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
>    - shard-lnl:          [SKIP][144] -> [PASS][145] +4 other tests pass
>   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-5/igt@kms_joiner@basic-force-big-joiner.html
>   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@kms_joiner@basic-force-big-joiner.html
>
>  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>    - shard-lnl:          [DMESG-WARN][146] ([Intel XE#324]) -> [PASS][147] +2 other tests pass
>   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>
>  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
>    - shard-lnl:          [DMESG-FAIL][148] ([Intel XE#324]) -> [PASS][149]
>   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
>   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
>
>  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>    - shard-dg2-set2:     [FAIL][150] ([Intel XE#616]) -> [PASS][151] +1 other test pass
>   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>
>  * igt@kms_pm_dc@dc6-dpms:
>    - shard-lnl:          [FAIL][152] ([Intel XE#1430]) -> [PASS][153]
>   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
>   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
>
>  * igt@kms_pm_rpm@cursor:
>    - shard-lnl:          [TIMEOUT][154] ([Intel XE#1620]) -> [PASS][155]
>   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-5/igt@kms_pm_rpm@cursor.html
>   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@kms_pm_rpm@cursor.html
>
>  * igt@kms_pm_rpm@universal-planes:
>    - shard-lnl:          [INCOMPLETE][156] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][157]
>   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
>   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html
>
>  * igt@kms_pm_rpm@universal-planes@plane-77:
>    - shard-lnl:          [DMESG-FAIL][158] ([Intel XE#1620]) -> [PASS][159]
>   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-77.html
>   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-77.html
>
>  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>    - shard-lnl:          [FAIL][160] -> [PASS][161] +47 other tests pass
>   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
>   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
>
>  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
>    - shard-lnl:          [FAIL][162] ([Intel XE#1649]) -> [PASS][163] +91 other tests pass
>   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
>   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
>
>  * igt@kms_vrr@cmrr@pipe-a-edp-1:
>    - shard-lnl:          [FAIL][164] ([Intel XE#2159]) -> [PASS][165] +1 other test pass
>   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>
>  * igt@xe_evict@evict-mixed-threads-large:
>    - shard-dg2-set2:     [FAIL][166] ([Intel XE#1000]) -> [PASS][167]
>   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
>
>  * igt@xe_oa@oa-exponents:
>    - {shard-bmg}:        [FAIL][168] ([Intel XE#2723]) -> [PASS][169]
>   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-bmg-6/igt@xe_oa@oa-exponents.html
>   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-bmg-4/igt@xe_oa@oa-exponents.html
>
>  * igt@xe_oa@oa-regs-whitelisted:
>    - shard-lnl:          [FAIL][170] ([Intel XE#2514]) -> [PASS][171]
>   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html
>   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
>
>  * igt@xe_pm@s4-basic-exec:
>    - shard-lnl:          [ABORT][172] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][173]
>   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
>
>  * igt@xe_pm@s4-d3hot-basic-exec:
>    - shard-lnl:          [ABORT][174] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][175]
>   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
>   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
>
>
>#### Warnings ####
>
>  * igt@kms_pm_dc@dc6-psr:
>    - shard-lnl:          [SKIP][176] -> [FAIL][177] ([Intel XE#1430])
>   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
>   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
>
>  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>    - shard-dg2-set2:     [TIMEOUT][178] -> [INCOMPLETE][179] ([Intel XE#1195]) +1 other test incomplete
>   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>
>
>  {name}: This element is suppressed. This means it is ignored when computing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
>  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
>  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
>  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
>  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  [Intel XE#2631]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631
>  [Intel XE#2711]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2711
>  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
>  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
>  [Intel XE#2879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2879
>  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>
>
>Build changes
>-------------
>
>  * IGT: IGT_8043 -> IGTPW_11839
>  * Linux: xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f -> xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1
>
>  IGTPW_11839: 11839
>  IGT_8043: 8043
>  xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f: 8a36a5499f143dc694afe235c6a1773421d2bd4f
>  xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1
>
>== Logs ==
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11839/index.html
