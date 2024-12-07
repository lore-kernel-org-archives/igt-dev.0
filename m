Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1260E77173
	for <igt-dev@archiver.kernel.org>; Sat,  7 Dec 2024 00:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5018610E1F4;
	Sat,  7 Dec 2024 00:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKoekx5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69B810E053
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Dec 2024 00:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733529679; x=1765065679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hhRVOJfBuQPiFgwvs1EnOIS+lWdydjhedcCTyn0Ny/I=;
 b=UKoekx5bgZzeUOAMcWs7lGjpH280/X1YWK9v5yAcZTZVxHXlbQ/IA368
 ffTVFUTh4i+YfMfhaL3oGz7QctSl2iG3JNiEAVKnRWjetHftIEgCPpk9l
 j8go9FENEoaDH+m0ZlvmtO+/0zaK9AdljSgp8+OEMnp8cJ/kYgslK5PRd
 qS0L4GenjoTi7oAJf/blXhfUw5RELZTAtgAbrMjPGD6TYDmKah7GtiImG
 7QFMsVJJIdDveAvv/PSzUdnLG3nxvGHDUL3OpdFSTbfYj34vp1uvUeL22
 o+HWDeS9oUuHRl4g6dF88RmhSDYUxbGQCosX1VJkxMlBEr9preTNMZUxo g==;
X-CSE-ConnectionGUID: zK3O+mNYSgiyPq2kwHwzXA==
X-CSE-MsgGUID: c14gafrtQIiNJttmliJtSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45293783"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="45293783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 16:01:18 -0800
X-CSE-ConnectionGUID: 35vkoBl5RdaVFkSIDztMLw==
X-CSE-MsgGUID: JFp83bl7QkO0uBGoTm2g1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="99355618"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 16:01:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 16:01:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 16:01:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 16:01:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSQtO1w4oCeaidQ7/f1fTqU/iTgYijRshfhnOl81H04HMAqwNhIZ752VN1KF2R2R/RdhQY5/TmBbiFo/6fgEMliMIo9G3EcYX+EMv3PnMBFXN6OMHNuRRkG7q9LM3PESuPbPF+y0SvCoUj/znxRYFGZm+UTTkllWVPsPESYcs5XcRBjYxNmpHjyXr1kIA2mD8d3XFioAyZdd+5aOHUFcHo1nR1p2ru63kiGw8Kc7iiwpEYRL32zfmKWfEkaU7CNBZLSwhWL+z9IptL7tlv1EgNiESk4btpP39Q50RDVdv70yzaZKDnMF+T68yr0VmUyfp2bkwn8J/jIunQS/qNY4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFn8VGK8CUjP+NU5G148Z5Mcjts66k7Smmr8Wvx7RII=;
 b=TU6zPn1OgCtHi2ROcfoOQv0keu6uxH7PvTZdDt2jPh3Qc8WecDuiohSi9Sps2SJiE8XuYmL5HNLXv6Gl+RRw6oS1ksFKDMB91A36WnY4DI2qgE2aukBTWHFZhHM2bMnKhosJKfAGvifYVqyKGtKPCbFeCVoEL4sH7pTa0PsfIh8hkkKAcDcpBnBZwExlcaiO8dpJEG7i0zIV9mzScy+bfEnNeinsr1XsizVp3Pvlahf7VgX6COWp24SeQx3g7yc9SCHW5FwgS9yqUUWrzsqwszwAbirTFaPc6zPxaFybkPRSVqRLIWzEqdXIl8NlbLozdehH86lza3mEZilqkLF0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Sat, 7 Dec
 2024 00:01:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 00:01:12 +0000
Date: Fri, 6 Dec 2024 16:01:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 5/8] XE3: tests/intel/kms_draw_crc: fix x-tiled
 tests for case when there is no x-tile
Message-ID: <20241207000110.GM3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
 <20241206212748.2101217-6-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206212748.2101217-6-clinton.a.taylor@intel.com>
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: c04006b0-4b9b-4eb3-ad1d-08dd165242f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?otyjaMjq/97gSsuu4wcwESu/oj/81Fm/AfrVXCDOjAGMUe3LO8Oo8NcOO6pN?=
 =?us-ascii?Q?0bsNNub+txhdry/uoRi17MwZ/l4e3HrJVqFiHp9f7t5DCZLFSo0zxFgiBS0S?=
 =?us-ascii?Q?T4wMoJYjPeU9MSLid9xJLvJ4Z4JOZIzSKzKnq0XNNeKz+JfLqrG/J8s59RbS?=
 =?us-ascii?Q?KOz0jtg7tMBbyHum9P4VmWpv++VunP6vxIk5ESjApP7UtN41xG2HxIcxGfDk?=
 =?us-ascii?Q?EgpdQbgJgQiSUwzIhl8X3rIyFJ5r63hQvw99PxIS9HVJhjWxA00+DwZ0e8EA?=
 =?us-ascii?Q?B1wkEKRePgR67OtiZnsw/phcsu9sbch4FL+PLYKsZNhXl/3F9NE25SxDlH2S?=
 =?us-ascii?Q?JNTfPFUq3Eodlckvo4cTHyieeVf1CC3sAea7DE8Jtz6GOMB5JFp3rChQKDhW?=
 =?us-ascii?Q?stAXVwMWqHoKBmZYIAiBPkYUZlTn8qMgzbx+VsHXYJZwvLAlG/1LQvwOy99p?=
 =?us-ascii?Q?vRV08dJlsRB1yQFvMVZbl3nDw+ZgFpyj4/xC7lsbDAk4VKHdrhW/cnddxw23?=
 =?us-ascii?Q?AjKisRrbkRQG2leVjpbWTVJb5GPOrNSkQiVKvdXRP+rzlfSfpNocfjB60MvU?=
 =?us-ascii?Q?2HR/PlJQnwLrhjfOIkZscB75tZidPSTCsOp0PiTjcU5t3I5alAbxdIYTth75?=
 =?us-ascii?Q?51LP9WRTK1mLYMQG4BJWpWjRoqFHilglJZBOS5E0uVha7jIgICV5CYtNnyFQ?=
 =?us-ascii?Q?klFC6rmkoaatuq9//VRa9zBhAmIIjRyMyB1GnjixzCnbK5RUUJLYNNB92GwQ?=
 =?us-ascii?Q?0LYjQE6X4ox10yVI+4sC8EFJB9uC8lvQKtuPnFZX6BvYw/OTNclAmbZuwuxs?=
 =?us-ascii?Q?d13oESwfYOcoAefOxUfqc4voA2p/2O/Kkk49OiY5+z/PO26AeBGaCBE7ighu?=
 =?us-ascii?Q?D7dWXPsSe9fru5LaYRJJ8WQOUPGrLukOWSpnbYaKJQVGdKkdT6vxsaTJu79H?=
 =?us-ascii?Q?60D3mUvWK79Ze9399iTrqVev4zBFehvu2cal/w8kGZMFX4nqujrdONrYo3J2?=
 =?us-ascii?Q?7tj6RlfGn9KxEKgRd8uaGf6KXjzY9Bs+OzEFGHQyM2lnenZ691ND5+Xp1SwA?=
 =?us-ascii?Q?Kp8vo05oh7+pqwVrz64I85REmSUHENMFYNmOkU+URNx+fz0gDoGjBKKmTEbs?=
 =?us-ascii?Q?EAh6PvFSLFO6JZt/grAcqFXSgXb+TiuY4rfFXx3e2cfK/F5U9QUQ0NQN8MJK?=
 =?us-ascii?Q?xUPeO5T4O9hY4NYhE6Nz2ni8bxt44P1K9u30BHSa1jblYg55VwF1c0Y2XO44?=
 =?us-ascii?Q?0cM32gJHILO1xxU1ljcKjMik+TdohH/HMcjdlGiIzORo+smdGimqsFwM54HV?=
 =?us-ascii?Q?xnjWpnrRsQLXSp+CQo9eRyt04wFTzgENMpWxQIwOWKM1hQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LoppKWXmIdQjSNftUBhWXXmxMfqab9xMqQydshrW2hGm7YPivWet8P56+wn3?=
 =?us-ascii?Q?ssxp6kgIYCK7uD43UnJsIJ6wLHIVN7rAcDpnLNh3BW1nkHLG93DL8xm/MTf/?=
 =?us-ascii?Q?FXl4ETQcwm7iT8ZQukOAemFujN9rs6bEEhPT8i9968zVHIOQQoqb4241gumX?=
 =?us-ascii?Q?Ei0iAOriWZYOG0F+Ij2rgNl2WxLfEGXcc2zfjzl9rsoL+PMmrYttaGQC/e9G?=
 =?us-ascii?Q?yO7bv23z57lKw8JyQYk61lk814og9fcWfKh5cwY9A6WJ+1i7rje7Aa6wB9d7?=
 =?us-ascii?Q?cWu1iOnK/gah52pFycj7Kb3sA+3pYAAx1hUkU3B79WaS7UMy0z0GkbMWB0Mi?=
 =?us-ascii?Q?mevxA6Nq0lYcuy4zTROoL1sWIox2Mq33bRTtGLmRoCoKflVtd8QPm3qTj2LE?=
 =?us-ascii?Q?1SfUls3+BMOrwttHKGruYJaMH1ZNbw+UU4hYNseop2b8Kuua5/sUYdmrQk4H?=
 =?us-ascii?Q?tfjZs6tFooF5SEwH2NeJzEHWAj2APpE8K5Spe4Y1y+0ld9MnVNFA1jyuIxb8?=
 =?us-ascii?Q?1VMrvl3BaiGGdffTWbtPTmg3eBppt/k67yW41DUYcyUKm8m9MDdvgRaZ0sP3?=
 =?us-ascii?Q?LaX0N5XsKDdIheAoQjoGD0y4xeL7LO3/TdEnGMZ2PcK0AcQffdLVvVv6TQIs?=
 =?us-ascii?Q?nv0FV5+JR1Q0RuzAh3nHTMwvPlkvFAa5pcQm/b6z+uytVumypfP/8YxGQlOv?=
 =?us-ascii?Q?sbphLIkphpzhf3gphwURili+IUplglME2y3Gbu3fabe0z3s2SLLPPkJ1ht1P?=
 =?us-ascii?Q?5c5kQlvkJ+Gpbh3vPjDjtVsT+dgEAc1YhkI9crNMH+F31k4ylKlTs5yiGXtI?=
 =?us-ascii?Q?EqACBY13u+Le35olVLzgqr9crgDgoyww4OVhR2xo7csDyOejGdATqUlf3omf?=
 =?us-ascii?Q?GHigsr8Qv/tD64JL33YLFN7fE4AiHg4kzto8OPLL7OvjXbfL2jLiOBMgjZ1S?=
 =?us-ascii?Q?PPSdodgPgV9HPdpw77U4BXH4pi3waspJm5sopuquD5p9fu7xdTzixRleB6Wz?=
 =?us-ascii?Q?mZpBlTc5AhzaB+eWpGuHFaWLcVDkbG1BD5rhWJpL4AV5/tBAvHwda0BXy6SV?=
 =?us-ascii?Q?AndLsXycVhJE3cA7mh27UYdWCV3j7qW5i0mG3hclOiPmTZ9CDgmWaaulVySL?=
 =?us-ascii?Q?tK7deXXw01+wZ3Nbov0Sh+/symErlCqHQhxrmbw6s3SZM1XMEFb0x3Z0KTMf?=
 =?us-ascii?Q?N/vWURS9aI98kRCCGy+b0hxNRzWx+2RiKFuVQfzhf+gPrBtk+3Czu/z2ahcr?=
 =?us-ascii?Q?9P0bJTIi+1uBI8rnIrd/Q6RYgwz8dCVOgMTO4/2ckLGzw56mrRDFIFm+bUCN?=
 =?us-ascii?Q?sB4/a40K/AKnlF38lHmXeht+5b3d6rC+8yRCEYG1jpQSQjJEz8A+48U50wLU?=
 =?us-ascii?Q?/xfnSwL5iqwnXrdvxpGml49vybkH89/RYzGSCB90bFbmzPzKE5eX7Lp8BIQH?=
 =?us-ascii?Q?PbALQcwzud1fFKYqIoI170+3AntoH+VnqOiIEpkFwNPCCpksliHrUJPrC44f?=
 =?us-ascii?Q?M21a5B612SFWRq+7MHw0gOMURnSobqp2mfqNAOZPCQ4BdYPOXjxTCc0dfYQf?=
 =?us-ascii?Q?TXbwZ8OLqZX/cXttuS+GM/xm7eu3+BvPuIWhuGI9i72IESj85Oo+uSjZV0g1?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c04006b0-4b9b-4eb3-ad1d-08dd165242f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 00:01:12.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeglErx2TNLqSaISOjvLCjxXLcdjTwTAGMVUI2rc1ZO+DgHQW4t4NpaIrh8qzAht3A6qIC07mIj9RHlKYrNgU7KDhxYuZTVqPM2e3y5ni7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On Fri, Dec 06, 2024 at 01:27:45PM -0800, Clint Taylor wrote:
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
> 
> On Xe3 display no more support x-tile and will disable such framebuffers
> 
> v2: Optimize display_ver check (Sai Teja)
> 
> Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>  tests/intel/kms_draw_crc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index e3d1c0ba9..8af0d475c 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -243,8 +243,10 @@ static void fill_fb_subtest(void)
>  	get_fill_crc(DRM_FORMAT_MOD_LINEAR, &crc);
>  	igt_assert_crc_equal(&crc, &base_crc);
>  
> -	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
> -	igt_assert_crc_equal(&crc, &base_crc);
> +	if (intel_display_ver(intel_get_drm_devid(drm_fd)) < 30) {

Rather than hardcoding the behavior for certain IP versions it would
probably be better if we just trust the list of modifiers the kernel
reports supporting and make our decisions based on that.  I.e., use
igt_display_has_format_mod() to test whether X-tile is supported or not.
We probably should have done that for the Y/4-tile case farther down
too.


Matt

> +		get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
> +		igt_assert_crc_equal(&crc, &base_crc);
> +	}
>  
>  	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
>  		get_fill_crc(has_4tile ?
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
