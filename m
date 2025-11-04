Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC359CCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 16:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B38A10E63E;
	Tue,  4 Nov 2025 16:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKDbciy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B4910E28F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762274006; x=1793810006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=48fOh25bXsbAljMNdhwRSTg4ooTiXbveZGDlE7slRl0=;
 b=EKDbciy63oJA4D6n8P78/XjeopIzSwmwa78bG6iBoNxXwrJMZyJkhKZL
 ZFNB0sPgdL753bkqlcOsUSKfmf7nSz97iLGOxNLqVJo2T4wm7ocnfZX/Y
 7P+XG/JVAfjT8x81fI2ltYUue6zoAj9dDm/5H09gTAU2LmbK8pVpseZz0
 i9KSygwugHLmFPke8S2IkDtZy9CE261Gmk/hRoUEsFJ1STFk+drSzAVwC
 hD3DIsdx+HNGjwBCMUcDKTLbtCxzBvZVRVI/aAArtaGhArZxzBSvNpX35
 ntQTvO9SHZDwSfn1gLoZJ/2snRaQrozh7Drpqw/4KEuZdFcc94KLtZFSM A==;
X-CSE-ConnectionGUID: hrM1ZzxfQPmfFLSi/WrUMw==
X-CSE-MsgGUID: apIzp+MPRJSx5xt3/YdnmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63384582"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="63384582"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:33:25 -0800
X-CSE-ConnectionGUID: ZYK0KmJCQeS4bjjn7kySPw==
X-CSE-MsgGUID: ZvYadbiVR5iUXPsp75Uh0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186440551"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:33:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:33:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 08:33:25 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:33:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzC1sNx1VF0DktixWZc21UqD/0iuehUkUX5D3HQRITiLAeY1czckcWOEq+Q0W+mBbULAYldjHu5/T+VdoNBWt9FwYKzQB0zjSRfmW0c+2ooNGlGblp90QlZE1SVDxSLL2+7eUjN3qJpVvC6SrN3nLgNqOWMLIIHxpeTL1HHEm/Saf++8w2uPYQpJdCloPZFk+luyC610PC4ZN/pzW/b3UhT0rpKwhsBGYKDKcRtHjzHYX+0YFIq4uoWiy/zJMM/00XS/noR2gKLhZdPk5FWjHu9F0OMgGSs7RCZhZ8apCkYzD0Qq4UUwKY9tea+/kC7aggjVCF1qJvPG07VaTp/byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4Xz7Q7uIe++dNR8wLPzP0YiWHx9+TmDEBwoUFNrO+U=;
 b=bESC39F4BKEcn5JKNlu1WfUSyKLG0ZpMsPjKgtTbC4+0oOkDdZZiMLxgbJSElp/fI6PwUO3+s4ibDW9frD2ttLurstGiz/meJsvO2Ph4DlrHSZO7h1UJzOCuug09IV0AMScU0ot7KHY5JRAGeKks6bVjgwZgRc1vJ5sSYPwiyJj02qL8G1q0XOqwPo+M7ZCOfIKzat7Zrm/ZGbZclfmQm44X7LpZoF8I94RxAyPjx8jCO8A3qWnGJcxi9WpU08tczuNDUB02ypnPgKlghxQ14TEbNyORoW7pFQqGIS3ou3tKPCEXxvrhGKpVrgg+9LdQeX6H4FOM9IlF1wEyy6jB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 16:33:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 16:33:22 +0000
Date: Tue, 4 Nov 2025 10:33:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
Message-ID: <yuxnp4bzgyjjkk4imiuak2j7rrbbkrxlczaezkzcwnlydshb33@4mscvrkq2en6>
References: <20251104055129.3826274-1-soham.purkait@intel.com>
 <20251104055129.3826274-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251104055129.3826274-4-soham.purkait@intel.com>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f8a3bd-330a-4c53-f1b0-08de1bbfdeaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o1jt5uYyuG2esHicXKZnAJsUfozWM/xVbX07UWnMj4v+FZgOIrBM9axlOmps?=
 =?us-ascii?Q?saqbXtIlC986b7ZSY0WISydSwlFTE5miEADeyw8Be8oSVp2qhrQp99lJ7ZZb?=
 =?us-ascii?Q?on71aRTpVjrn5me93elJf0VeRr+XnTl+YUqtOQwaAE/fN6qdkro6qqr06t3K?=
 =?us-ascii?Q?A0aaS02nCVVDLKdU76KHtMeR4DXwujMqZiJO6BxvAg8F0Z8JijhByGpAyi9Q?=
 =?us-ascii?Q?fUD0uN3Z/yF/T76T/Y6P7W7GYOWaxE6OL+7WKbFJkNvMxM+vPNS3lXbiII4X?=
 =?us-ascii?Q?pCx9Y295V3dSLWvAS69WyyXwM/sNYzphBSpuSvpPUxsl6X0KJzOg1xUG8uuB?=
 =?us-ascii?Q?BI4xNVKoNqCnW7Uqwm2qVGV99zJsHziIiN3v3WWYgp1GzGoku0MMo+JWO/fE?=
 =?us-ascii?Q?Hd7Mv9LMTaJI4wv/6aw4mLSp1lGfRWeYqtsNEeF5ltbLuGP2Rdt5iWuCiP/+?=
 =?us-ascii?Q?HthbKeaWezMykOQr1D7yi0TbHG9/5zESL529zOb9cdV6CiK6a8T1AX0v48HA?=
 =?us-ascii?Q?fu37d1TsU9p1Ps1p+vtOaBfYLWzTIq9Ix2e2lOVVcbu2g4usauWl0aF6TETK?=
 =?us-ascii?Q?8eR/Ef0rlgFxnbRQa6rap5My7dSZbpj1PQmGiVEg6vsDO9NiUao84mV/9Raq?=
 =?us-ascii?Q?JvN6SwsnF+c0eVZOePjQAKitJ0S7PTaW4PH0wwKHfuVzz/eoIE3WH8gxp9qG?=
 =?us-ascii?Q?zZP3hj743m7X+XMdn/+YbQljmst6rr8AbGfpCbIrPjGUNCofQfUsMLYC2WI+?=
 =?us-ascii?Q?AIajtB4y8zEaFkxKgfRt3KP1k0HrU7gkirJjDeyiqZNZAlMQHbsitW4n3uQu?=
 =?us-ascii?Q?20aQ4DWBwOC0FpBupRSdeXhp+SP4xaYUrB0fIMuOHJ+NYyNVgBD82cpwWCoQ?=
 =?us-ascii?Q?MU/LOaaiGctCoXnavaRBIxdzlRSZCq0D1e2tTcaUcNSqI9yZQdEejyjHeWt+?=
 =?us-ascii?Q?4MvChHrLNhyGv9wUAN5Dmm1bIaET4pxpMKvf7GTHxWjvdh2upNDwRD3YJbTW?=
 =?us-ascii?Q?XLDT3XwIqhd3qqN/SkRyV3AlvBgiZLyR3XVhFO6oreFFwH4p29h+8MvGymPX?=
 =?us-ascii?Q?fKZyShrax4MTIbCgRoZMard1suQqpjZw5LhvciKO7k/vXSUDk5V3s24n0Gm1?=
 =?us-ascii?Q?UTUCVRsZKNhwvLAOZLltnnhON3rucxrE2J+24jMQGXpaTfmHsdyPBX4lrfpy?=
 =?us-ascii?Q?dmc9IeNBppJtiZr+8ag8CMv/6OTVT3cLxxlx7XANnYC6xgh/nQSe7/ya79As?=
 =?us-ascii?Q?Rv6dQIpqPszYhreqFEUOFV+zY/ATpPnfuRX1qf/vo5+vYx8cupTM3odYgTPo?=
 =?us-ascii?Q?JLaOmViUBipYZV1ixa6gxx9MquYQkf9i014ZDRvmuMs+7+YiEfB5AtcN6px1?=
 =?us-ascii?Q?Sogxza3BF99fXecnSU1Yz3uIYO+Fr5Atj43lnOfztunBR3jEfiXfuHUOFAyG?=
 =?us-ascii?Q?f/38XEqQvLp+38qXvM03+wF1QDC4QOp5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XOU353fvikeGxlt9qDhD3mu1H1Owc7+5/MhoybHP453Md6BGznWQG+bpm6TH?=
 =?us-ascii?Q?XY0HnMXcNr9a96FThZn7sEXZAAuOaY4eHTN65tBUSrk+E5X7DboaJ+bOkG7R?=
 =?us-ascii?Q?iq2dv3MdDXSCw4JwA/j+y/LSFnahMYsecmxSqer8XEkN2IGAKBgTWuMu7nUY?=
 =?us-ascii?Q?iI96v420cT7LkY6ULioXe8ZKiQ6jcwKbJ1j8L/g9hEPLH/mpzZfjLx+zUdjH?=
 =?us-ascii?Q?T8GIDtqpKNl27NVe0aQUHoAY5CsA5MbnlLbcnLJsEgDuwsbpiz740PLZcx2e?=
 =?us-ascii?Q?tzGrFsYFa5aNk4RZ8tJnaLouqGnawavWwzmP+/RdHWLTN0Sd2yHdqZ4I7J/E?=
 =?us-ascii?Q?In4cxwB8o6Ker7k6p1+4vsiZULO+NxEX+FCAtduslt7G1qZfHp55WBqb9A8T?=
 =?us-ascii?Q?CgIyeJORhOhE7RlhW+FHmbZng2Nj+UGBJaUa7B2Enrzrml8UDeW/c827AmQF?=
 =?us-ascii?Q?2DJEnYQIqXGCuv6RFL+TPMZG7tM031+x/bOWJg2Zmf6I3x7Vlp8Q9982PiOE?=
 =?us-ascii?Q?uXVHQeMSpsF8TpKBraOvjUTy9nYMWSA0TKzjVnMZPSyGwj2f7RAI41DFetJo?=
 =?us-ascii?Q?o3HrdD4sxOh0MkVLLnJ9qdTjnMDS+UW6gz4e9Xvh29fM44P9oCsukYIO64kj?=
 =?us-ascii?Q?c72uq1WsXlWSRbQFlVh20Ybm3WxOwW8IkDwP6hPlF23/dv08ONce+rv4TzSW?=
 =?us-ascii?Q?Up4sy1Ro4Jilpy/ZmP2qGzG7Yj0yXG4bNs9TIYvpexWyjMbeBtaRmj0LVx1U?=
 =?us-ascii?Q?+JJxxl5xNPTP+pREBbIkY9cvEvZ/1mSY9R5yqnwRO0JReg3OPVklyIqkIYUB?=
 =?us-ascii?Q?CEQPepr9Yz1tXnUb2KgSuzt/k9P1Rn6SPimxst3Tv7weh1+r0BOeYu/JCFmu?=
 =?us-ascii?Q?MxIpQJ5eYuoq9LJFGi+686XbOYwcZQGbwkiBEPmL1Wx+S32b/xI7DKP8k68d?=
 =?us-ascii?Q?hKr2hFeUh4fB+05zltZEypM7Uc/f8JwRHj+fxPIStavJFyy3p86KZjMqRIKe?=
 =?us-ascii?Q?Wm5QI96Jd1612vktpsCMOvJ1Cw3N/FyEWb2gzt9U7lZmxT3WV6lBCTDlTNom?=
 =?us-ascii?Q?jOwCwqH47PAW6j+UffReqTimbYnAg/GXVB0F0zWvJl2xR8vtJSXBTyz5s+zy?=
 =?us-ascii?Q?2vidt25GfbGwOAsW0oZgIWOPtohyyenDlEYrhHO7q3WwMnBfwrADzDoZjNyb?=
 =?us-ascii?Q?NOuKaTrRHQ885/bXR+dJRq/oCbvn3yF/PnymQmnFNPQkYqmcWWQRxHrSqogf?=
 =?us-ascii?Q?VBTQ8bVL8Y/huX1YYUeU1CwFXxcSGsHuUBvYXqZffg7qp9yH4gSEcDPFYKS6?=
 =?us-ascii?Q?4jaFxtf1uXr/H9MdgxYWHE9eoojUYvkEmlT2p81urmeqB8zDMx2qtDRl/Vud?=
 =?us-ascii?Q?idodd+o8se8H877oNqviyqwQM91MAjLhVO6v1dVmOMRqAjnayHBS8yXB9vtZ?=
 =?us-ascii?Q?YU8HErmVNT4fP3d5am4fQl6FuYMfNhYT6Woy0DpGYoNi7yk6MRvyURR6lRe2?=
 =?us-ascii?Q?Yi1mJSHWpvCTS3h+NU/acnmxkGg1I87hj+1hGQGZntkADQcxVvFbkBDe/jQR?=
 =?us-ascii?Q?QHb0OsT8D1b5UFsfozh0maWt1o0/DcuXEaOkprqFCnU67zsXMIr7pK13w5LZ?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f8a3bd-330a-4c53-f1b0-08de1bbfdeaf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 16:33:22.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oozQ2nwFMUbSIq+TKo+JgxQh7z2cC1u2uNGXlMbpFJVUIx+Z7e7sNuEPsZMVVwuW1V94idQOhw8XL2oqPyuFFEdCT1RM93ARk4mQQQrjxmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
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

On Tue, Nov 04, 2025 at 11:21:29AM +0530, Soham Purkait wrote:
>Create spinner once and reuse by ending and resetting between iterations
>instead of reallocating. This removes redundant allocations and improves
>timing consistency, leading to more accurate engine activity measurements.

why does it improve that?

>
>Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate engine activity accuracy")
>Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>---
> tests/intel/xe_pmu.c | 11 ++++++++---
> 1 file changed, 8 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 9525655ba..af0c2dfe4 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -534,6 +534,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
> 		intel_allocator_init();
> 		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>
>+		spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>+		xe_spin_end(spin->xe_spin);
>+		xe_spin_sync_wait(fd, spin);

so you start and then finish it. It look like we need a flag to
igt_spin_new() to avoid the exec instead?

>+
> 		for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
> 			unsigned int target_idle_us = idle_us;
> 			struct timespec start = { };
>@@ -552,10 +556,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
> 				igt_measured_usleep(target_idle_us);
>
> 				/* start spinner */
>-				spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>+				xe_spin_reset(fd, spin);
> 				loop_idle_ns = igt_nsec_elapsed(&start);
> 				igt_measured_usleep(active_us);
>-				igt_spin_free(fd, spin);
>+				xe_spin_end(spin->xe_spin);

I don't see how this would make it anywhere more accurate. It may be
faster since you are not creating a new one from scratch, but I'm
missing things in the commit message:

	1) explain why
	2) run before and after and show the numbers with the said
	   improvement.

Lucas De Marchi

>
> 				now = igt_nsec_elapsed(&start);
> 				loop_active_ns = now - loop_idle_ns;
>@@ -590,6 +594,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
> 				      sizeof(expected));
> 		}
>
>+		igt_spin_free(fd, spin);
> 		xe_vm_destroy(fd, vm);
> 		put_ahnd(ahnd);
> 	}
>@@ -622,7 +627,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
> 	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
> 		 (engine_activity - expected) * 100, 100 * engine_activity, 100 * expected);
>
>-	assert_within(100.0 * engine_activity, 100.0 * expected, 3);
>+	assert_within(100.0 * engine_activity, 100.0 * expected, 2);
> }
>
> static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
>-- 
>2.34.1
>
