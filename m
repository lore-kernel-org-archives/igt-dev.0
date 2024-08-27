Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E15C5320E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC8A10E02A;
	Tue, 27 Aug 2024 05:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAt2fNdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9702B10E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737733; x=1756273733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gMFwtrKj8mKqOvrqaGSPR3MvTPIilJC+AqTyO6wocbA=;
 b=AAt2fNdc6gBLPwoqfrWJzU+2I+CVnzUm66AfZrjIKpz2g353xEgwiW2I
 7yOnUuDBL/v2CjzsPDsqtgkOHyV4JrfUBPY80klvFB/kFUa2LeNHn7DcL
 0YFOWjFMlCddZNckydhz/a7tRpFEPANsrPNreH7ONeAGDGAzuNGCNZaE/
 oVo42wDBGWEmOjWj59XxYc2zoh+HqUjvGVkMtpDxtWVi8rRwkpNsKLqVr
 MR67vzDAUzjXbSQhb21+2nzFSqL2KHNoXEJp8rGg/g1LGaOnvVqeuccQZ
 /9xscDVKJrQCvdqESOo1JlSbrClgTgZMq3ha7WYZ52tl6FBF9ltt4pXWO g==;
X-CSE-ConnectionGUID: bLJCIIGNRxeZXobjcTew3g==
X-CSE-MsgGUID: QU0qp6/wQ6uZcD5z9exduw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23347547"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23347547"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:48:52 -0700
X-CSE-ConnectionGUID: jXtLleBjTdafVHeMHC/FvA==
X-CSE-MsgGUID: cR5Rw1mIQ6Sqzq05sCkweQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="63468828"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 22:48:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:48:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:48:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 22:48:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 22:48:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KL/sIhtrLSbdjNmhPAEaRnwo/cV1y7FpVfaqkRb0+SKbeF2zXp1BvUF379Vep/MbSs+Ab6H06RdCAOHuhYk+SKQpYwUy+ERs1ONDP61soTozQel/li9xz9zXmFElVkd3KM+/cf3oeTrsdg0PkzkcuwKui4yxpeZGV36kNuawP+JByj6d/bayVyDDMQSu61GGL+cy8G30k0L/7at81FRLoswILw4sOq8luHTFZYvh/1610ui0F8yb+Mjza6E5gP0KIo3M7w3o5uRS+44bxkAdvuj3R+Xy1Wbw/OEnb3I3R7Wn36bXjKxka8AVNgtjw53IY9BPY0dcY0LAoql+2i95KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjXR7N/3JgcU2EGgrhWNAL+pVHfJ/x1Vi3jV98+Rupo=;
 b=X3mPwtZUi7sZTXIVjX+AgMxCse30VchWS3J9ERUBg0Tw0uDf37A5fzEvGgdm83bv+c2+4pZPhwciDBeBFwtv1nNC1+v2TbzKq6IFGPb9SClY5Ff4xjUgyI80xlvHyQIZiJAyUV5caW3gnsxOtwjwOw9BNGndDFueS9aO9pLrxhtlvRATil3+kTR+if6RH7kd1/rbTcqh8xWBKhyjhQSOJ3RjR5ypaoUrJh2u6uauujeklmY6VGO30Omuw2laUbhZ3SQiCpB4Zstf71nZKZFf/Y11zL1NXoLGcu2C2w+EwAFntpofr/fzJwO+9TssBEN7qTurc++rj4mO8DJm7luqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 27 Aug
 2024 05:48:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 05:48:49 +0000
Date: Tue, 27 Aug 2024 00:48:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Rename and reorder tests
Message-ID: <hgnjbd35kengkkrcii6rtejvrsyid33pfiw5amzwzmvetxv6cj@v6vzekumg27e>
References: <20240827054223.1671414-1-lucas.demarchi@intel.com>
 <20240827054223.1671414-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240827054223.1671414-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:303:b7::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 417fe85a-fbcb-4b45-a198-08dcc65bec95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tQlW9d0vVcOgPwYccRyL1K1dAsGLWU2ieUiGFhOauMJ2WW91x4197/2viSCX?=
 =?us-ascii?Q?e+CTKFB39tCii0AlVnM9JAXKqdkHJrmqCyA6DWYGl2eO2eWQkmeG0nw+IbmP?=
 =?us-ascii?Q?GP5NIrls3iE69c5BiCNVsEws4SpKgPSfCszFzMwZuFOutlHmBkMMIwq9ExAZ?=
 =?us-ascii?Q?7dMScM2n1TqxilDCFqM5dnfo9BQYtBRgUiULCL/5mnyiLB7EOzNtmnIBiE+O?=
 =?us-ascii?Q?jYptAQwTi92v5n5OI2sB8MHCdxk0c2jkHCo6xPWwLqYYtv6vhxHPwt4aMIMM?=
 =?us-ascii?Q?vBMfIMcObwzMPz9zkF7IDGXtrlhJDozjiocyeVxa3sqaWtx4XsCJvZSRnOqC?=
 =?us-ascii?Q?wG7SX4oZ9Lm/mJOwL9SXJzumZTww8onGks5fyrp06rCOMFVUSTzihCHOlxf6?=
 =?us-ascii?Q?r/1hBmxd/be1HiNGd6fy0ZOiuLFtEwBH2QW5/Ko6l2Oxrcsw6ptRnveUF0wZ?=
 =?us-ascii?Q?/l/8W7HDsC8QS61KxRFMZOiR/oyb/CdzplQq3+ARjX+XBJXshhpxk8Y085Ii?=
 =?us-ascii?Q?7kZzlrIbH26LSiKd649evAYEMJUNY/MRm8fDyg72d8PS3yz0q01+5z40Vdis?=
 =?us-ascii?Q?mLv3CgLjaoBLSYTbcrKYWhNGGQgOIjSlbs1a1OycV7p0vi4gg6bn01ZWZPi+?=
 =?us-ascii?Q?bRSJcLOjhJerAleEnKtIMxrNfkAf+FfvyKKcNU4ub6yNWn6vYXM2elD4WYSS?=
 =?us-ascii?Q?RNhLltu/LxX8FiAvw1Feaz23iALTsgfLbpU9BNJxvOb9QPZgvQmbLQ7iYh6n?=
 =?us-ascii?Q?T4xWFAHR6rVKyKzBeQGj6WrUCm2vhsLv0+zDiUioOJP208ygtJTezNjpVuII?=
 =?us-ascii?Q?RbxwjAWOsmwLM8qE3fHOxwgh/wrD7cLIojX0ix7YsAptiRLAkVzbIAL5syMy?=
 =?us-ascii?Q?9wuwQDiNcrN8/aGXpg/KTpUJpPXinEOOZDNTWqfUaqRFLJqpSwfrH/ZQfB3L?=
 =?us-ascii?Q?fjXCEkiR80xSnEziCZuqxU5ZmSMzwWPok5vDG3ftEZt4Mw3CeoJyDlbNlc4b?=
 =?us-ascii?Q?xClCgnsCZ33UJwUFZM+9IQxyL0vjKi9rkfD+X2T3lw0C77b3HtHGqoVcS9P1?=
 =?us-ascii?Q?TYFiuYoPCJHzVr6wzBdKQFmux5xJdTtOeUcz12F/eWlskbVmj0mM+3HLD1sg?=
 =?us-ascii?Q?jXo1iseWikpDqB1safUVjRLUsR0z093M1dWsyLb12AaBjcqpjNuoLYYY6pkm?=
 =?us-ascii?Q?PrYxsfm3JIHYNRnQUHH6ZHczl5ZQq7R3l4Ripg33bss7ZfA1gV1spph9upHg?=
 =?us-ascii?Q?t/kcLQXVy5zFesra+nRe3toGhX9OGXLWcxsP04pptkPQKNFM6z1T6N2mOup9?=
 =?us-ascii?Q?IuqembyenVLLE3eOtV09qFEu+NWTPlUq7qkdz89uBhGdAA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0H9g/n6pUMY3KbAFqGyyWn0gLbXzI0Y9O0wmFhh85NuhDr3O9CIapFlEvMv?=
 =?us-ascii?Q?B1BoA3O9SQJFp5OqIKCTL7PrtOV6aH+0e1lHmAVdWu6PoYSLb/3mcsYLO3+s?=
 =?us-ascii?Q?0EBcY1eaaOI62/kY6BmnTM0MJsPP4vb0EfzjTvXP5RpmVkJ+fCqtKA9K9sb9?=
 =?us-ascii?Q?0EVQYOfZoJu89D6TIwYDR4Y6w3vNrOvYxcV5dxF2Eqm+G3sPMU+PjkM4LGIz?=
 =?us-ascii?Q?4Ctb7FmPkvxUlwRefOfKKnaP3bBriV4ZZ/1pZmmKJTTkBJr36U0L/IeOWvYn?=
 =?us-ascii?Q?rAivAzuLZf/Qc7X6USvxw31fkYxOkNV2eFbX7YL+102P4MXnEvb79blGlKD6?=
 =?us-ascii?Q?m+turHyKq5UojeyBzgePEAQH/AbZQS4H3gRI5HxBgtNSUYkEOoCef5rCDwHk?=
 =?us-ascii?Q?nIJPwS822ZTDJx/RsB3zB2dD/D+TSEmvQQpCmtzzRQlK/nNhki9YT/BQtaj2?=
 =?us-ascii?Q?b3gbuEIkfUr5TjXUbUQViWvPy44SjKahRlyeLr6LHyE4X0mALTmw5JotW6gm?=
 =?us-ascii?Q?uk1RnlNziomPvqB3ZTnV/NDClgd0QKZr9nJZfYdM2RwMQjgie20VKigmJlHo?=
 =?us-ascii?Q?S8UePOR5OZ7v8taY249Ne56nRXBDFUkJVp1ncoPZlM8TYp+UbCRcRt3Dx3wU?=
 =?us-ascii?Q?izqZAlmaB1eDfD18hnC2CFEVrsZEOlJ2Qxq17YLrwCPWuh888L/xv3u+69CS?=
 =?us-ascii?Q?UBT1yW8eFoJKHfqz8IXR2utJDbBcF/RCzNXenYTlv8qMZ9HNdyz7y6atmIdc?=
 =?us-ascii?Q?5psyCD23b8k+HX63lEV+hpa61FaeHbDTLaj6ZIAVFC3eCoQgs4mn8TeP/UqM?=
 =?us-ascii?Q?KHtR2OauZmcb9codniy1yy0roWHHqYzYKflQxPGCExvCoBVH7974G/pyzwL8?=
 =?us-ascii?Q?VWUJjCjKiWNiH9guGLPmc/W/SUKiodDnkAitJ/BUGKSRUu0eTNSsQiVZdbdW?=
 =?us-ascii?Q?ABY2i7se2khU/fyB1m+43h/Hp2hEipltXn3it6aTrlfuv5zMZYXqC5vxQq4t?=
 =?us-ascii?Q?a1njbxfJezQ9DIzp4RT43cYUy/CvTFCBIkK7l2ATXOpELRvHYMLCsdZ7k1QB?=
 =?us-ascii?Q?fnbDzKmcKJICJa2oRQM7NAuPAOkNulxM1PQP0wlcpMqkBXTLMx6evXhygXyP?=
 =?us-ascii?Q?DpQRd6Z80fg32ssYo6oQIK/SZNnFovnaciTbL7fOPS5rzf94XBY5MzJcbBIa?=
 =?us-ascii?Q?HBoVi2gLtQuiZ/JFZl5CCzydoTD5ixO4n7aqxDQzYV8hbO9jSwtYT04Wt60J?=
 =?us-ascii?Q?56MELRLVa3i96t19wWXy5eFWQZfQ443Sf2OakzepTw2P0eGLhHsFi9L7v8zB?=
 =?us-ascii?Q?TySS/ZHoubAfzxXAXbH3HTQzXxhGttNpbAZSjZoR9cp0K3sDL5ogdBKS47nU?=
 =?us-ascii?Q?bYEOfa5Gbj5/8f6P+ELMopCVYbf0UHIPgQnWZGuomyZ4laIfUrakCnL3pt1V?=
 =?us-ascii?Q?kASKCbsT7Yy5WYmS75MvtWZgIjhjG8RyBpVCINPy72MKuBkSjPTfXR8QTMvQ?=
 =?us-ascii?Q?/qyMpGCgGEkAS0gVMyrQ/p6t1wPivIqYj20eIJzJEVgdgw21c35LJ48G51eK?=
 =?us-ascii?Q?W72KJ7l2/r8K4YDaxVuaKrRUAWx6rDHzBvf9nfWJXhloD05bvo0Tr/yFU7Ht?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 417fe85a-fbcb-4b45-a198-08dcc65bec95
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 05:48:49.4631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVbZrSZCKbGQnjPFqP4i9vqd1838aJznCvKjR3lpSEh2kB3jFu40XlrRzdldrCdfK12ZBiaadjttE18qNiBddt1oOhaynpAGRc348rL1hxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
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

On Mon, Aug 26, 2024 at 10:42:23PM GMT, Lucas De Marchi wrote:
>There are 2 main categories of tests in xe_drm_fdinfo:
>mem and utilization. Group and name tests accordingly.
>
>For utilization, create subgroups: "single", "others" and "all",
>with variants on each of them.
>
>No change in behavior on each tests, it's just rename and reorder.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

ugh... this is what happens when you

	`git send-email -1 .... /dir/to/patches`

I will send this series again. Sorry for the noise.

Lucas De Marchi
