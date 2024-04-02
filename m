Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FA3CD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 13:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1793E10F70D;
	Tue,  2 Apr 2024 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQ1pClqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3B610F70D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712063690; x=1743599690;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=/J1IafBaRKlUJ0Qf1e75M1L3Ys923lVoUKMrlJNNWGI=;
 b=SQ1pClqe4/QLJKWy7L9lw5VAqSC4ES7m9IW/kpHcJxCmQD7CikJ08yZd
 j3ahylONJNTrt4EIMSd+pIOgXS/ER/SnIa8xbXG54mFpqe8yMeac/be8C
 2NQgBIlXZf65rNjppeCIPDtLbkV71B8m0Wohr/xXM9iOooAJMr48zBFKe
 bdisufns+h9o9zoeOvZLlyePJ5zuhDqesDPsaE0sw4puJBeaKX6TZsnt7
 ytHpTv0gqS1NupOrZj8I+PpE6vGOwTipkOhd0uIiZRHY/XSqay2vjpyX+
 OXSdHg9ibz6l2XTN7e+9GYlB0JBkHYvcCBwvA8q+AoubWAf+qR3SXxw6r Q==;
X-CSE-ConnectionGUID: bvhfuF2eRPaGtpdsB1JzYw==
X-CSE-MsgGUID: V3ckKvSTRNSbS1rYCcQ43g==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7165197"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7165197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 06:14:50 -0700
X-CSE-ConnectionGUID: t0i7zjXBTGKeYtUIGeTnnA==
X-CSE-MsgGUID: U3Nqqj+4QwuU87oxmwjsOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18648657"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 06:14:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 06:14:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 06:14:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 06:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icO5nAHjnZgsxtAUX6ZUWj7o3zkBytK8u+rgmA2iiVO5GfTrKi9AC2wkLgXY667U6UhZ11J2u2XG7foeRx4Ny/QVzNyDIJYrlpHelkMIxFE1uWEcTP2F/Vhx1obuZd3FNUh3jnY74igWIyykgVDhaff4pF9OiSJfAPwRlhYZIEYfHIP1MY/ac4rkk8UZMgc0lRMHGnnt2oczMqbUhHkGWkM1vgqPhHzfLTViJLoRJqTkQeXTzgruimez6bggD4ky16uq3sTHOjxiZB8hk65cM4AJ7assxPyaG0sREcBzljL8WR8Lf0pcNDUa2H1ZUuNtv5PREs1eHgkxha++cUDNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5SMVYzwmX/L9/oiGt5gnoohz8hNqoGyaQx/APkOnrM=;
 b=goZkqXtQTPwxGcM6LcIPAe+zfI43A1TpkGOIdpGdxF0+6xgkjyy0x2hQNjhiV+Pf+JTXVpVyfncdpo4xbPMn+xKBmpLXneOX8iIxPiB/HaqeBPbuGRkgufPKi98NaSgW9wDNbWn51s7HuhIGddKplC8KOAJ/WN0ezER/4rbzSnwz5VR6TXRVxyMOdwgLHql991uuzxYLRZV2g9+mlh33sXFXLq8Fkb5MPbYDIoitrht3jKEdGeVlrmdtWBKHWf4yLMKvL01zMGa5aG5pCg+7CcUxQUwOByPk+Bce4JpcLZxzwO/nnvKTKE5RLDY0M4o4cVt7GqQActgDQ/bsJSkvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.23; Tue, 2 Apr
 2024 13:14:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 13:14:45 +0000
Date: Tue, 2 Apr 2024 08:14:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 lib/xe_spin: Fix doc whitespaces and typo
Message-ID: <wldd7zxvmhklcqthzqmnxcyocvdt7ispdvi2cmvlyqoanvqi76@3mg34jqfermw>
References: <20240329211243.924363-1-lucas.demarchi@intel.com>
 <171175045260.1081852.11378164174589968477@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171175045260.1081852.11378164174589968477@8e613ede5ea5>
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7276:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMfGiYoLyh9CWlO3PrisRABx92jRuJimY/qKh8o9wpQnq5g8kPvw4Mv9BxKAwWQeQvmJ+2xvfszrXY/1lPcSP3lCFOkkss5M8AoeiXU3hBb0bbEsxEO4BzHRPrQ3HBIgRq3x1F60yRXFg0tZKGOxJPytR/q32jKPiH2nHVwjujxT0w3H0rLNZFvpLS+RZcU85I/AmyfQxZwCKLOFRlB8f1T3nT6zV18nnKkbaqQXO//59LfOU67ZW/ATDGM0lqglh1P8bB/qfOz5WjEF1rzMbIJQ7sVxyHo3XoMuv8wuMXDZaPH2RjyKQXjwUEzLDDUsYKk32QQIGM+No132PzYFj3rVtkBK2ezVCj1WKVDzMwQ9XsyYIghiDDdtWGgZDZhefPjS/faKUHjgnasLYzFziKdieIQOD6BtHIboR+MogNTQdUaWZrYUAi/qOEfpVeYIKTQsLFWOOyy8EHg9YQSklAHcJEVMpEVT8NZ/xKxU59xqPL5QM8vi5BNPVAOqbIQ2JjF0JOyqVlJNQXvp2JVOKcGIIR52ycvGlTHCpyDs93ZJSIntqZlSWnuGGafZisLxIU+GolTRiZ832owoUrRzTQ0mlYVHKQn0pIiQDixhdzH3gEm3Sy2y1wliq+GkkJa4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?txi4QPIxvo5LVkT0TbeRjseO+5fvS7NX65B55XK/m7YlbR53rhshTR58j8Xz?=
 =?us-ascii?Q?utQtlcqMQpEjd1gufYUGH+47fFhCkmF/hTrju0XSKwjKeB24pQ1Gv61vNccj?=
 =?us-ascii?Q?FMGxn2bDDRLN90+PqHYwQDTrd36g5bdnRnWgNWhLF5QNetMyCts/LljkC89R?=
 =?us-ascii?Q?pfm9A8TQFNyFJHMMnB9LVWiXWxTl0TtL+75P8PMIdEEzZGg0e091ipWfohXf?=
 =?us-ascii?Q?lAXwZRru/HN1/gTqQvMp8qQqfMg+rh5UhQ09GpzFx6fHcKpXc8thV2RQrvWm?=
 =?us-ascii?Q?CLki3Jgvk198qfCoIboyV/FT29/XRIJeo9iUexo6cUO6mjipz4Uv4dElsnvt?=
 =?us-ascii?Q?EcXc0JvWhCxExkvy3VVAJfVJvr44zugLjfPDdCu1zp+s1qj+f0Wzxzh7pzLF?=
 =?us-ascii?Q?owqO0JXu4V9C3Q1EKfmzqYOFpYapAffcV8UjVfEUbnVW3C2GxRquE9/u7v2X?=
 =?us-ascii?Q?ilBioFLZ0XKzIPFa0dDLPprApslO+M9BucXqb+Ig1w440A5RkdB5JpyP0cwh?=
 =?us-ascii?Q?Jy7RHcyJIVQia32QJOYUtYaT/UQYLDmjKBrSbL6cxOEddV9ol2xaVQxO7a6m?=
 =?us-ascii?Q?zljsxsg16ErYO6Vp/A0R+Ube3HleZ5E4c7CRWt1voY7XcdoD5ejUnmsMQpKT?=
 =?us-ascii?Q?/dNr5kGKbLuAFpZFrz133fo+lF1BK7F7zGgJBWXCzXDVC2eDYMm1Xr8ZeiUy?=
 =?us-ascii?Q?50qTtiUTbvTD40r70NzfMapBs8YNPV6ALt4tkExOn2wq4se2uOUusoh2sk5q?=
 =?us-ascii?Q?B9pknMKx60pSVOg/gOiX2xx+1P7C3aXmCwj6LGcolEuvxyBuua6oRnTqCw81?=
 =?us-ascii?Q?tRqZBFG8t9Fij34MMgGvkE7b1Q6yVbnk7v20DbYZ5LESXSrFhl9YucJnQfK6?=
 =?us-ascii?Q?ouXeZettmbew8nbrLijzqK2dKCQJnR3B8ItOb/sNE86Bo+tOw+kmDdSycAb8?=
 =?us-ascii?Q?MNHk9RS5xyu/zMH9ZtLU+1sEH2+heyk4zKuk0sVYLSY8xXgkbEIA+e3VFWC3?=
 =?us-ascii?Q?XuKSUy66RQfzS5lTzyG2n3C8Xm1yIkmRJrdKUetTf8OoEF2OxrrFxF56gNNE?=
 =?us-ascii?Q?3p5nbc7VG5WGI67Lq/qsm/vILebNm2/zwEgH7WxbF6tLqAuxueYi1qYV6k8+?=
 =?us-ascii?Q?h+u5v/voNLoUyK6sIRMKccPCMKVGf2o36dHyl1gNM1gTk74OG7dhIp40ndZO?=
 =?us-ascii?Q?muBSZMM1kk6AsjxeJ6lIE1VDhTZlkIvX88/q8Uz1RoRhKmL59c/aV5kcu9X6?=
 =?us-ascii?Q?zrClUIwamnNij8McYwHeIU7CTdeqicoeWjaOU9rBnHY1Ju/Hr/qgQmR5G4AA?=
 =?us-ascii?Q?g+SL7FGVoGdGnF12Kync55VqhMI7moIhQfR9IgCt/pEEduIlmWD90kXwzevF?=
 =?us-ascii?Q?+HrpTm+d2u4eXTE8RL8LZEIcu7xd10nAyKSJXCzaFvK3VRK9x9CumEqBk+NF?=
 =?us-ascii?Q?qgjGKwtFnvuZhhXumE4oF5Wyyd1F5b1qmNioxeZF5ZTjnhBWgG+aP4xTfKEK?=
 =?us-ascii?Q?H2GC2Ej22SBUg4iD69rcySLiNfJvDGu6c++mFlpYpmf3itnKJFes3E2EiuWg?=
 =?us-ascii?Q?KDTJ8b9aC0U2r6+hRHX/DKv93wnSJH1f4p/aW0pvUAIBp3JtPrH0ik3rZOBX?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eae3fc69-1b86-494b-88c0-08dc5316ddea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:14:45.8727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iwe/Tm5JFiU86UrCnxp1FcNTuzUQGuOyqYO/7cHce8Ijl9FsFdd6qoPvpZ70s/gksfAYfvSQSWAe7D+tTQ5YSGIrdIccqg6/sDTxRjaDW6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
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

On Fri, Mar 29, 2024 at 10:14:12PM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: lib/xe_spin: Fix doc whitespaces and typo
>URL   : https://patchwork.freedesktop.org/series/131830/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from CI_DRM_14509 -> IGTPW_10953
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with IGTPW_10953 absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in IGTPW_10953, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10953/index.html
>
>Participating hosts (39 -> 37)
>------------------------------
>
>  Missing    (2): bat-jsl-1 fi-snb-2520m

again some random machines missing :-/

>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in IGTPW_10953:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@i915_selftest@live@requests:
>    - bat-dg2-11:         NOTRUN -> [TIMEOUT][1]
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10953/bat-dg2-11/igt@i915_selftest@live@requests.html

notrun -> {fail, timeout} are always interesting.

maybe we could have some script parsing the patch series noting it
has nothing to do with the test that failed and start labeling some of
our tests as "noisy / not-very-stable"

Lucas De Marchi
