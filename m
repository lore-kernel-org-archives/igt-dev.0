Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D49CCF3963
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 19:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B250410E1B8;
	Thu, 19 Sep 2024 19:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RImra2uo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DFF10E1B8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 19:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726774237; x=1758310237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yaujWW8EH/rwuKmLxHSAVuFinBccZPbX3uF+ZCwzEBM=;
 b=RImra2uo84/7+Px9p+mWKznlqhC++q7lU8w2x1yNVL6Pa02i1aWb6dnn
 UHWyhIMj7DWj7UQB1JCPNtG9H9V1hUVn7CsOSrJtzGmDjfFbHicVSdqqq
 XKDEjOWTcoYDFoGDS0N+SoF+9fr2Y9iQnw9lA82JmNMolBF2GoiNV7iHn
 +jkb5YEQsVzI5ZUC+EcmzsQk0iabYlDAxf84ggwfn52j02I/FRFBnlaSb
 ZD6L2UzIA7apT+BMznFnh79TXVHS3lhD82xQZdGLmm48GOSW6LOpyX4oB
 yKhD/kIGnTu+jM1hKeSN043zh6qG6Il8h1knwofGP5A64dVqT9Y4FRFDV g==;
X-CSE-ConnectionGUID: EMkqiHRkRlGSizpGSn7wDA==
X-CSE-MsgGUID: Hdz3EX0MQouBzgxUi2kUtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29546863"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="29546863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:30:37 -0700
X-CSE-ConnectionGUID: HiP9sh/0RD+gD0u1AQYkMA==
X-CSE-MsgGUID: sTUJ03S8RuK79M0Jn5AaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="69908849"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 12:30:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:30:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:30:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 12:30:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 12:30:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Smrw1tUGmdZn/CCSCrVutqMl1uOiKYNvJYQXKVm1bbEsnglcSxYHMGsnXNGf9paTqYVDBQRhvB0+A6pAJ8nLDx2zwiobLbS7JP9Zu92yswxYkgQ5vdZ3m1PfFuf5A0ksXavJ9RklCqcljgfqQjTseG1D9k/6P4PJHc3G3pC/D8quIvfQSjn+Juthiuzy9mukX5F647/neuP5U0YEe6sEl7914329tpuZlcc+vN17SNrGt3V4qM8/u93B0Vk7q+NzJYMgmwRJl8BT1mYi9QhJgK8dyLZ4wgYJDjl62EvF4fmtCVKfIpkRnQJTLRb/9zUolCtHbTwPjSsfKm3rM56IFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHvzZ8wE1Y4jIZJbWM9L5whYvHrhMpRCovD1KDyTu70=;
 b=QZLi2xinz73ELQTz1BzBY1KnLlTj8TJYsVWddfd6XG9+bebhUc2MTmYrMTzAJ7B+VqBcFmfrDi11Hv2UGyAw17PwcygO9n3/VTUm9TnkcXjJtJFolafV7/4wrtlQOo7qY6kS4WbWM/ijuTvVvwHO5aZgDugAOE2QgUQ6raap9x535zwcRhTifXVPOyiFkbwvsN0ydFdOKGjWVO7K+hW+Yyqr37irEGWhnnDKc0lJmDQ2JMYgMff+BagsMQIz/fbc/p6AMnOXtY8eOjyZG3/uu2vjzxIazSvrdPytGB2GGWbsR6bfY3rKOEqLzcR+FwPjbHkHLuEtBh3X+Z131ZSusg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 19:30:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 19:30:32 +0000
Date: Thu, 19 Sep 2024 14:30:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>
Subject: Re: [i-g-t] tests/intel-ci/xe: Block kms_rmfb@close-fd test
Message-ID: <7fdfa4i7mpzmdja4fzhfgvsqyfdttwddvquzyskavsavolksmq@iuvzarueixvu>
References: <20240731061512.1954095-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240731061512.1954095-1-bhanuprakash.modem@intel.com>
X-ClientProxiedBy: MW4PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:303:8e::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2bac37-a986-451d-4f2a-08dcd8e186c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rARFlfuI5W/gpsugaG+RpXc6In+gnAnT/OC0Y11X/Jmo0qRkv1oCIRyimGnY?=
 =?us-ascii?Q?0i2ia8B4hp/LgqN8pdlz6VAkYJj92PD2pLwbZCCTT61jCi6oVxJwVB2pjiwF?=
 =?us-ascii?Q?LFsaTOPd6/+kH5BAgBf4J+LxvKIfxOVEZb3KKSwZOCk5Ry141BVQl7f4Rkui?=
 =?us-ascii?Q?gQixQh4SsxkDyqv2m5f0OZHDBH1DK1RIWu4trk1BPTnLMq4nLLyKOHz8rGwJ?=
 =?us-ascii?Q?eOtmdOR1PSB8b5U95WKwnN5Kf49fvDf8+LMo7vdqUm1RA97t+ZviTVaUXfgb?=
 =?us-ascii?Q?vFXDxc+0FkBLX9yarxGgMGhcRmFmDmve0Oq9T3E+niSDvRJtfgG41WGxSB8Q?=
 =?us-ascii?Q?qWHBEcqt9C2yhhmtHnXiQjggZ8eqVVySf+lXlmslhBerlRcKDQcAcT3VW0wp?=
 =?us-ascii?Q?HGrVcwFd/xIWKdWHUNL3AtMRVpPMXEJg1wQmMw4RTmRc0k40YKZVmLBHuli8?=
 =?us-ascii?Q?f5QhdCW2tS5hGSfYea2CLnNMEH/JX25Fyl9TUrFa/WM5fJx+Hc51vx8QUTsZ?=
 =?us-ascii?Q?VKdP7BcWGpJJSPPLb9lQ/lK/2TJCRezPfFqrKt9iL4Uv2EepJceSbWUyGaKn?=
 =?us-ascii?Q?hc25NcRson87CBa1Opwc02vgjTmbUzZV4Uz3Yv2w9XV5jaP/cNTRVAaKPo9l?=
 =?us-ascii?Q?ZzR2eP8jhdK76ifEf830qggmJzNztBMjxFm/6R/YflFjJNpbFmifV+j56d6K?=
 =?us-ascii?Q?KGoJQzVac93Wnb5wgFqbXBYi9lTIJhGWhiDsKVICPHRbzHPi/5nGDLhzjI+p?=
 =?us-ascii?Q?ZRjhwybMNa4i1qpAGxPMcjDpDGHvOaT4OZFEKzkzmcWhbSioNV3eJWRh0Zrz?=
 =?us-ascii?Q?cT7gfi1RU2jcqD568xiYXEMy0Ww9W18AH5QXKgqNZ8MwK0Jt6JTNnBytBzHh?=
 =?us-ascii?Q?PnrwCKBXJJsdVBpEMlIWquKHTV5aXO6hRMeT5UqkkQGF1HH5sQcryFRqw69r?=
 =?us-ascii?Q?Zf8gXx/EY5h++2bFOOLmQK306Gp3MEOyFr+YyAZT8Mzsip2pP6QIZaR+Yy6X?=
 =?us-ascii?Q?kDElslud40xltOrxJItigu97jat8hYsVTPUSVctTHsCEgK1/132KvfRRV0UH?=
 =?us-ascii?Q?510Y5hZsJh/KgFP0BxY5/oFJ2ckdg8A8WbuLkLfxbIUmAddI92TcNnN+PH0t?=
 =?us-ascii?Q?7mmCxWJ1NpkRd6KfySZ6T8cj4jGbzWBgcz2vLGXCPEHOhLocrPy7NEsgd6HF?=
 =?us-ascii?Q?G+13Do7yonFRRzI/47Pdm+tCjV5f2fCDkRrDZcn4mnno/CZNm0n+Cx7TgFwE?=
 =?us-ascii?Q?oVuNsRMyNuBSayDQSmQBHILta5c2CrIvUlORnxooOXLfOa3LIBlGJUkJJOVW?=
 =?us-ascii?Q?jns=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RWGznfyE0SnM8myYF+5qx93v9V6IWa6BGFFTNunRUbwVo6nwhJqv08z9iy/e?=
 =?us-ascii?Q?cGDxLVIgZnKTOYT6RNwbQ82Y7l/y+gMWeqYgFU6m9Q0OD7ta9B5LtFisfUhW?=
 =?us-ascii?Q?g/K5JatYPgCWt3qvLiY+vc3taFZAh0UBfqf2iWBrjficBrO6jTwXeGzWcfY2?=
 =?us-ascii?Q?vqdT4eVHwH4+v2wt4j0fT3THlPZ/7NcUf2Xk9lA5TTnF7gBqAjA/41gRJ34u?=
 =?us-ascii?Q?a9tifwWIkF3NsN3V2B1Pir/fDxq/Iwne+q4xCKk5QFcrOV2faZwkGa5OvY+O?=
 =?us-ascii?Q?tgC9zGfuiaa7DEcuOdLeRlXR8N9x4ihB4GVv+ZDRqWfl6aY9wl1OlBzuAPu+?=
 =?us-ascii?Q?WFReX1M+pUPEjljRdXFRXDNb0h6Ed0WnynAmkDfKMI0pM7D9VpNLy0nALBAT?=
 =?us-ascii?Q?iENW3DfmDg7c7gu8oigVStZK8tZzx0peQ1mMtAtHwJk3w2NoRuQy9rTnxKPc?=
 =?us-ascii?Q?p52ogaBY1hTvGg/kMHQs+Ct7ZlaRbmwgQCeI4PjX+5Q+dlEaDEitvK67rlAq?=
 =?us-ascii?Q?y+m5n8ktUTpGLGj/kdPFkyWfM9no51f2CQF/8Cq69qMcMDg71cXkV5voW36D?=
 =?us-ascii?Q?pzoalC/a17nrPTGNMqEBHbiSqDM37U0jK3hYWDkfuhNKqeU2M16cqWKt+mxO?=
 =?us-ascii?Q?8OQdx2/luYtY2lIUfhEsVP0toeKB2DgM15r2TMzpfWzeDXv66P72wacJiOm9?=
 =?us-ascii?Q?/RxMo9k7uHreLmOTPOXz6MPK0tYl9d2AlsxXsqjx5a0nrhosDdmOlQwu892v?=
 =?us-ascii?Q?dDCEDNNwdRARfCgmMRubCALLWcsfqtYxfNm5lr+ZVUh92jIBQ5LeRfUd9Xx4?=
 =?us-ascii?Q?SkBbV2F4uWvGQtV0fy72UeILY5ZkXNYteBrNgmJRiaaMW3RsEMBKKSCmS2iP?=
 =?us-ascii?Q?Q5MMbeSrRIR8iaa1qjDWkbfCRMBTONwHDruT4The6uOm1Qg1xoRz7RhP1rAL?=
 =?us-ascii?Q?oyTGDEJlLnuj/9WLTtcYlQnd+xIvTMDcIdmxhUG0t0VgxHTWtIi8jZCynf+z?=
 =?us-ascii?Q?RPsO5CYajx5e0gUaJpmWdKOGc/e+5apcwVLI3oqVKnqLChob5JdkXAUFnoU8?=
 =?us-ascii?Q?GR7zn97JH3quZ/RYDJea06Wp+EQj4fBw8ULSiXIbTtd0uONJGjX70YdR9lPI?=
 =?us-ascii?Q?NNCqkddlNF87QLz910bEGhGw12audILpid8zzrCtm5/T+31dMvrjhSX4d+eE?=
 =?us-ascii?Q?4zvq19t7mA74s26Iq4WfYTlMYqvrAhvlzYPcSSsG1tclLl1XBE4uiG8d51GN?=
 =?us-ascii?Q?C+0oD2TuP0ud5+EL8/7gYIWyBmq/q/UCDKiwVWq5MSFmBWZ54X9pcDfL/gB9?=
 =?us-ascii?Q?zUNm53JlH/dc+qOD0eG/m9lusR+03eH3FJH/YmnCC36qBGn9TcDjHgVBDIvL?=
 =?us-ascii?Q?M3bYgKl+RzJmK+HrRxonnaMVqPCwpJmW38w6uMz4pCotXZrOoCaKvyeY8Hm3?=
 =?us-ascii?Q?4dpZgIINnE1rRtQxhlXJWERihMzyYBfMWzb0OV87gO9B0X2mYy953fxh8g+g?=
 =?us-ascii?Q?nD5ljqsOfhYZTMiBuETXkjzJfmyrvfw4eX7np0dhiRfH4zl2q1/CgeG8l5ps?=
 =?us-ascii?Q?GfKmqEblBMjGyZaQNx1zTUyvuhUnnpj+/PvX+7O99dTQfB0oRTcOqdBDhr5f?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2bac37-a986-451d-4f2a-08dcd8e186c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 19:30:32.2669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxrQcDUfFZAIIOTpeIxfzXF35tGEp2beW28p64zPpAK9wsia1FAmDx7EsAdPcD17116SAdjtO7HT8V8cPe7b5My/XcRyh9TQlCb0nhuTzDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
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

On Wed, Jul 31, 2024 at 11:45:12AM GMT, Bhanuprakash Modem wrote:
>Upon reopening the driver, the 'kms_rmfb@close-fd' test expects
>that 'getcrtc' should return an FB ID of 0. However, due to the
>default modeset, 'getcrtc' always returns a non-zero FB ID, which
>is expected behavior.

I'm trying to understand the issue here. Do you know when this default
modeset is triggered?

>
>In the case of the i915 driver, the 'i915_gem_drop_caches' clears
>the cache and sets the FB ID to 0. Currently, there is no equivalent

not sure if this is really related to gem_drop_caches. To me it's more
related to something preventing the modeset

>mechanism in the XE driver.

doing some tests, it seems we have:

commit
close-fd
   drop caches
check-fb-id
modeset kicks in

The check for fb_id then works because it happens before the modeset.
In fact, I can reproduce the same issue with xe and the other variant
of the test (igt@kms_rmfb@rmfb-ioctl) by simply adding a sleep(1)
before the last drmModeFreeCrtc(). I think we should either check that
fb_id != prev_fb_id or provide the same guarantee in xe that it will
remain 0 until the process exit.

AFAICS the latter can be guaranteed by doing this in the fixture:

drm_reopen_driver(data.drm_fd);

Let me send a patch to double check in CI...

Lucas De Marchi

>
>Therefore, we should block this test from XE execution until an
>alternative solution is implemented.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
>Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>---
> tests/intel-ci/xe.blocklist.txt | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
>index f9ef612c4..4ee8fb0d4 100644
>--- a/tests/intel-ci/xe.blocklist.txt
>+++ b/tests/intel-ci/xe.blocklist.txt
>@@ -78,6 +78,10 @@ igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
> # KMS: Yet to add/missing XE support
> ##################################################################
> igt@kms_prime@.*
>+
>+# Expected failure on XE:
>+# https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
>+igt@kms_rmfb@close-fd
> ##################################################################
> # KMS: Non-Intel tests
> ##################################################################
>-- 
>2.43.2
>
