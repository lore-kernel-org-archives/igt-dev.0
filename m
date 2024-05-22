Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F0BC25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDB510E44A;
	Wed, 22 May 2024 16:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbuXHSkn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D4710E1C4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394874; x=1747930874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F33gBbzLPe5MR4xjBt51xlfqOYTDiz1fqm5eXf8wTvU=;
 b=UbuXHSkngbBUHZNCdxus4rN7wySvwBsRJPCiMzbSxvekAJu7A6cTCmnK
 XlzE2YJrBXpGRKyagrPI5RwNTi8Ppb7gGIgtG39Fb++BSlYIgvwfhgZhZ
 iNgTI3UK8kP+yDNCwfwEBih8mCF6BddN53Ezun7SbzgU9OYRMNpnAbl+q
 tS1uKXNH1RHgEhEwfnmFYJRVPIV/c+ArRGLNoocPhXl/f0aUtIDpWnIG0
 i9Q687ijUXZoFKISpnhp0v55wkCDgyRJG0Bm+1/tWjS9tAfPJvoCtJuUe
 ko9AQMK1f0jTDqjuopMAiRPg2rnlSc6WYw9LvdqYYVyzQ2DJb195mRxHH w==;
X-CSE-ConnectionGUID: Re+y5HPBQJ64wwSR9fkLGw==
X-CSE-MsgGUID: YkU4mlucQ7K1rFt3leEeug==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30163128"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30163128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:21:13 -0700
X-CSE-ConnectionGUID: oYHfUTKFQZuK/6p6uaIB7Q==
X-CSE-MsgGUID: 5QLPua3OTEm0xs99cI6Ehw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33261308"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:21:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:21:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:21:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsteycAj4Q+Kw32NQ6BxEMk68HYPi0TrxDbzUQXVxN222pULrDj++5yp9rhPGWeFUSl7Ebir1PSRLrTsN9no/OyQ2ceOf4NUt/fk2C+PI7iXU73N3dJCZBrcNKpHmXewW6f4iPbDHyXdTUoBcuPTHglSlCRh5hHy9EquZJfdfcJJiWtkVa9JLk3sdmhrZg7yu99wCs3ilO1IAMmZP/f+1hJ4ungQ8paxUkdXTVVwO1iNM0mwj9o5Gv0S7loNje3aZVY5CrDsXbZFBimwO/qOAfM+6CDNg/83ovvGNEE0GOI8AjKYjJcT8BgUAZAh+JV0RbW/r81A7OaGPLPinGAURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thydrrn+l4qEQMlGp3cBMuAwW7F0Y2XeH4qVa+4p+c8=;
 b=FjzJfUDfPbM7+bRTUEesslJEMhMbc9f64ToteHhJK+9bJR66Mjyit/HMxUN1CZcGf9UmXAQWHJxPdjHBW/LLBmhSRy3Wrj8X9Bf6QftdMlj/QLjXO+seS6AsObzHV8k9wFPZIDIPBQJkmSG7ufK2BElcQMkJuopRxKPdmAZI18loTn8HNew+Do7mA/0px3Uce434RKsDJJ7ekpqyNkeqT7ed3W4cpRDPohSZNRMGLW+dIrcihPDs7gemuA0zzhZDFUixMY44H/d5RUjqyaarlVsFX1PTx5zfX1lKOwftF8DhiLRg1+iJSmHiHis4pJjkbfOm6VSROhFKbEmQaY54Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6244.namprd11.prod.outlook.com (2603:10b6:208:3e6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.21; Wed, 22 May
 2024 16:21:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:21:10 +0000
Date: Wed, 22 May 2024 12:21:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 10/10] lib: switch i915_pciids_local.h to xe driver
 style PCI ID macros
Message-ID: <Zk4bch_ZlDFZWW6W@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <dca416158698f28ba603e804467b2bee6c2e5d59.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dca416158698f28ba603e804467b2bee6c2e5d59.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e998787-4a43-4969-7ae2-08dc7a7b30f3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wKgN6qVdO3cE1nkAuliJkiIIZrboSIOaiqEdKkG/A+9bc7FomJRwz4LqT+QF?=
 =?us-ascii?Q?2Qvo8DKhaGKfHEoz5jCpcPcRidqHNY7yzmPbRPsltdcPvz6TEQU5eyZxvwsZ?=
 =?us-ascii?Q?yZrvXBDvtCIAX7EurN/u5d+Gr4SmfK9YYQSk0Xb3FraosETOdG7HZiZsjp5Y?=
 =?us-ascii?Q?S0KbAIS1tQ9DOUzjEh7Y90WIlgQ0Zp7ghmOntpRdPEnSTB4sFT2ueKhXc54f?=
 =?us-ascii?Q?Q+IxLOoimuluKBWbTbI2GKZ3idUX0RR317vfWN505Jnofsf9kK0Rq+nlGtNC?=
 =?us-ascii?Q?K5gswyUpFvH4NYUbAsflwIvoTZTUZ625jso5OdBJXylcQ66ShtS4f6zUW6WO?=
 =?us-ascii?Q?/rwOJqHlp0dNQa8oV0mMitt56Vhfa3bTR7buqQcm1KzZXWf8Q+T54hLjh8Lq?=
 =?us-ascii?Q?Vb7RIhOei9x952y+DTOuKDc9N0Qv334xUsK1npnggjRGjY9+C1vg28FO4KAL?=
 =?us-ascii?Q?K8syDGo9r7GlVzBGFG/8wa9K0cgsS9ctR6F5DT+cxV0tsfdw800CQjmqMJzT?=
 =?us-ascii?Q?9ajVpPXTbGheiePS/X/9GHFM48pHjI6RfNVScYTZ3DyGbPX8c/Nel9EO1AGo?=
 =?us-ascii?Q?UX+7KkuAhV41FDyoybl6VG1RtXuXZPZhAau0xZ5q67wSjKypdkL4kvzovFJn?=
 =?us-ascii?Q?c0HdOUvw072KmENp51YhOzs2I4w+MfpsLdHOVK+cLOJuHyFerfnYDNb474NH?=
 =?us-ascii?Q?M50FOd5C0helGEfdJg4dzEvQ0NjrEZUrB0u1XiyqQq1NweoodBT5Nrm+ASCN?=
 =?us-ascii?Q?87Z1rdNtyDMm70pN8JfjlMpreGcBTcBcB03q3OOyi+oodZJyZmfhUDMXvQg1?=
 =?us-ascii?Q?7L/YGfyUM96TZXDCkS0qTnvlBFNy9MuVbFkyvmX82EdJwHrvo1IqAqeUd7Jq?=
 =?us-ascii?Q?4iZxYCDEyOkec8gkqPZjZH/nzlpo/FzWbFN5i47AjTps/y6ho3B+G7xZUREQ?=
 =?us-ascii?Q?VeJQNmB+uGUnL+9pg0oQNR31xungFZcZaKb54EzrElETp4D41G4/bCgxvFZG?=
 =?us-ascii?Q?+zsCqx9MdjN+ko4AR5GBoRPbnl/G5RIzYBjag5WLTqeBMAD13bx3EsbKqj0l?=
 =?us-ascii?Q?UH7vdG/bBng68PtIzoUGKX9BvezxGtKxNm189txOK1WRjzx8cneCCclcqSV7?=
 =?us-ascii?Q?/fmG7+SvEfuLPJMZr7O465db5FpwHadpNqFsDJEObCdzsj5tW4yoXwcCfbGe?=
 =?us-ascii?Q?tyUNp+suSnc2gK1kln9hq3pZ9+b4AHB2civwMwKj2Gv4LP4YOEvOV81VOimI?=
 =?us-ascii?Q?/hyCo1lMDjLO5z2LFkF10qfymeRAUz+whm9U7XouLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+lzRsWDSduxXlmiTY3SKt+at4iXitM7wHUMdc6ZXCG7mDXOBiPdnP68Rdtu?=
 =?us-ascii?Q?nxrRF7hhJ++MX+LJa3/ENy3YmmPRnXGy8Qg3LcZ6xKxLte/Y6cmpRElUXrZT?=
 =?us-ascii?Q?fp42/c3iWfEXj4S+PBXKAAua9eB2JFT6VTHtJ8UVoDyg0QWtVR8QIKOZFCT6?=
 =?us-ascii?Q?hZ31KkkHVySCcbIyVUIWOSrGiCCzDlKuFOI4bj+zm4zDWzf6LQu2IQ25jkCG?=
 =?us-ascii?Q?v4pgS7BnigFHiYk93JNFVRoQL7FOtC+usLA2LIpGrlWqV+xb6wtJxJA6nWjQ?=
 =?us-ascii?Q?mlDrOI391yGdJ46a6LE0OnlsHUqGBwYZgg3eMFlSR7hCdFSASsZ14Sy43CAz?=
 =?us-ascii?Q?Y5BRYHF0taWHmk4eZTY49egZdmv27u5ly/yXY+IhXjYv9G0TII/6QcIXixRi?=
 =?us-ascii?Q?pw4LNReqrxDq+nbtLD9RXLZG6eDfTgrkIVQc7VfDrwpmxEwDuLuccA8qe+Tt?=
 =?us-ascii?Q?phUy0hMFVAmeZr5tgbYAvpdOMrooal1e4P6QHaWq05/R1vYDZSe2TW9rBEB7?=
 =?us-ascii?Q?FOtThEfGaGY68Eouvz8ZACz2yPxMiJAeSKQOOjbUafcaoirSaMPLgoBdLsIa?=
 =?us-ascii?Q?l4k8Z7YSbwDlM7ASGufctpVkiNMLsFQSQp/WwVI91GUA8iI88mVvHj5swv4/?=
 =?us-ascii?Q?trG1qRIgokPxVthvLMx/EvNvWWe5CJq1arXEyG2cIPV2I+jZ08kA0Y5gASnp?=
 =?us-ascii?Q?C4PQZZQ9JPRYUVr1658sHCCEFnp8yfl7S5dylUGhV9adZ/TlqSKTN6wxSnVt?=
 =?us-ascii?Q?fxKXwYCSa2XDMOEJpL4FkIqPiTACilcGsjm/LWMl6UK/ojtGvJzEufXJVxXg?=
 =?us-ascii?Q?KSTS6G+5M0VQ2cYfsaYVxK1SbTrlmBqKTKSxGHjtggzU6XlvKJ3BcFZZ/iSE?=
 =?us-ascii?Q?ZDj72k5vVCjMcugZf7PZ3ukeJdPwNxJsHXUu9BMi9GP2HpuxPwEoJSz2yTsn?=
 =?us-ascii?Q?WRNcS1ze2NCT9Er9ANNjX40FnzC2Rw3wz8zUkyQntRIhpEgP/mU4xoHJynBv?=
 =?us-ascii?Q?xzLhnkzurmrJJHEGK1/rCJG2nI7n67j3ut72CpU2eL7GD8uqG01nWyyLL5ih?=
 =?us-ascii?Q?TV1sMencwGFH/NHwYQeslHlv+HHO0S3j4WtKioVXRfIOw7rppW+bVxZ64EEz?=
 =?us-ascii?Q?RYRC1n7hS31G8tZq/IIAJoE6LjGHsihTY8ZL6RS6G5mJZdqG6ch5vb0HRg+b?=
 =?us-ascii?Q?OEu8C7w0TAbYX2r5bC70RK/lwO98SsZ3Ndrr3ImYDzcP2VPXJtw5wvMTRTo7?=
 =?us-ascii?Q?YboGkf15/AsBjqKO+Czg0pjNNTCgtrzS1qVrFpt9d90YhMuFSXtZ44/7gG9S?=
 =?us-ascii?Q?Ri/dyO2lqZe7Etoe4a6UhkBIk+1izuQ3wt8//H0AJQcnnQQXb8NjKtrdBvGt?=
 =?us-ascii?Q?O5DTyROW0ujJaiW/AzdWHfbhDWkdQMr18iNm4nSWy44mU1XyNDoKn5gxWNs6?=
 =?us-ascii?Q?3LV5o/O9Tu16gKN+eOziW8OoUa0ltD6iek/A5od3WjZJpUPdJE4ZcDKE4c3I?=
 =?us-ascii?Q?5xF93EejpN5ZW1ctvEoSaA5xJLmrWM+mVFaoEOLLta5Nj1mz7ywrS8d3S8ZE?=
 =?us-ascii?Q?LP81ay1EBJYu7TEWNeBON1ObNGd5R6/GHOu89cZI7JB1EMSz0PR10VEM7hIO?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e998787-4a43-4969-7ae2-08dc7a7b30f3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:21:10.3711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3ZwOzvJMlTv8q5dHZ/6x99XHAfuEST49rRY6shS0p8PVe0KESC8J8p1Hb2MNx2lkeJ6z5Q7SZE1BLaeCoxqbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6244
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

On Wed, May 22, 2024 at 01:35:23PM +0300, Jani Nikula wrote:
> Follow-up the kernel i915_pciids.h switching to xe driver style PCI ID
> macros, and do the same for i915_pciids_local.h. This is a clear
> improvement in the perf code, for example.

I'm confused now on why do we need this i915_pciids_local.h o.O
but anyway, the change is good and right:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915/perf.c         | 12 +++--------
>  lib/i915_pciids_local.h | 44 ++++++++++++++++++++---------------------
>  lib/intel_device_info.c |  2 +-
>  3 files changed, 26 insertions(+), 32 deletions(-)
> 
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 4b00ba5de9d4..ee950b3c03e4 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -204,13 +204,10 @@ is_acm_gt3(const struct intel_perf_devinfo *devinfo)
>  static bool
>  is_mtl_gt2(const struct intel_perf_devinfo *devinfo)
>  {
> -#undef INTEL_VGA_DEVICE
> -#define INTEL_VGA_DEVICE(_id, _info) _id
>  	static const uint32_t devids[] = {
> -		INTEL_MTL_M_IDS(NULL),
> -		INTEL_MTL_P_GT2_IDS(NULL),
> +		INTEL_MTL_M_IDS(ID),
> +		INTEL_MTL_P_GT2_IDS(ID),
>  	};
> -#undef INTEL_VGA_DEVICE
>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>  		if (devids[i] == devinfo->devid)
>  			return true;
> @@ -222,12 +219,9 @@ is_mtl_gt2(const struct intel_perf_devinfo *devinfo)
>  static bool
>  is_mtl_gt3(const struct intel_perf_devinfo *devinfo)
>  {
> -#undef INTEL_VGA_DEVICE
> -#define INTEL_VGA_DEVICE(_id, _info) _id
>  	static const uint32_t devids[] = {
> -		INTEL_MTL_P_GT3_IDS(NULL),
> +		INTEL_MTL_P_GT3_IDS(ID),
>  	};
> -#undef INTEL_VGA_DEVICE
>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>  		if (devids[i] == devinfo->devid)
>  			return true;
> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
> index 0043b0cd9b34..92879704aa8e 100644
> --- a/lib/i915_pciids_local.h
> +++ b/lib/i915_pciids_local.h
> @@ -9,41 +9,41 @@
>  
>  /* MTL perf */
>  #ifndef INTEL_MTL_M_IDS
> -#define INTEL_MTL_M_IDS(info) \
> -	INTEL_VGA_DEVICE(0x7D60, info), \
> -	INTEL_VGA_DEVICE(0x7D67, info)
> +#define INTEL_MTL_M_IDS(MACRO__, ...) \
> +	MACRO__(0x7D60, ## __VA_ARGS__), \
> +	MACRO__(0x7D67, ## __VA_ARGS__)
>  #endif
>  
>  #ifndef INTEL_MTL_P_GT2_IDS
> -#define INTEL_MTL_P_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x7D45, info)
> +#define INTEL_MTL_P_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x7D45, ## __VA_ARGS__)
>  #endif
>  
>  #ifndef INTEL_MTL_P_GT3_IDS
> -#define INTEL_MTL_P_GT3_IDS(info) \
> -	INTEL_VGA_DEVICE(0x7D55, info), \
> -	INTEL_VGA_DEVICE(0x7DD5, info)
> +#define INTEL_MTL_P_GT3_IDS(MACRO__, ...) \
> +	MACRO__(0x7D55, ## __VA_ARGS__), \
> +	MACRO__(0x7DD5, ## __VA_ARGS__)
>  #endif
>  
>  #ifndef INTEL_MTL_P_IDS
> -#define INTEL_MTL_P_IDS(info) \
> -	INTEL_MTL_P_GT2_IDS(info), \
> -	INTEL_MTL_P_GT3_IDS(info)
> +#define INTEL_MTL_P_IDS(MACRO__, ...) \
> +	INTEL_MTL_P_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_MTL_P_GT3_IDS(MACRO__, ## __VA_ARGS__)
>  #endif
>  
>  /* PVC */
>  #ifndef INTEL_PVC_IDS
> -#define INTEL_PVC_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0BD0, info), \
> -	INTEL_VGA_DEVICE(0x0BD1, info), \
> -	INTEL_VGA_DEVICE(0x0BD2, info), \
> -	INTEL_VGA_DEVICE(0x0BD5, info), \
> -	INTEL_VGA_DEVICE(0x0BD6, info), \
> -	INTEL_VGA_DEVICE(0x0BD7, info), \
> -	INTEL_VGA_DEVICE(0x0BD8, info), \
> -	INTEL_VGA_DEVICE(0x0BD9, info), \
> -	INTEL_VGA_DEVICE(0x0BDA, info), \
> -	INTEL_VGA_DEVICE(0x0BDB, info)
> +#define INTEL_PVC_IDS(MACRO__, ...) \
> +	MACRO__(0x0BD0, ## __VA_ARGS__), \
> +	MACRO__(0x0BD1, ## __VA_ARGS__), \
> +	MACRO__(0x0BD2, ## __VA_ARGS__), \
> +	MACRO__(0x0BD5, ## __VA_ARGS__), \
> +	MACRO__(0x0BD6, ## __VA_ARGS__), \
> +	MACRO__(0x0BD7, ## __VA_ARGS__), \
> +	MACRO__(0x0BD8, ## __VA_ARGS__), \
> +	MACRO__(0x0BD9, ## __VA_ARGS__), \
> +	MACRO__(0x0BDA, ## __VA_ARGS__), \
> +	MACRO__(0x0BDB, ## __VA_ARGS__)
>  #endif
>  
>  #endif /* _I915_PCIIDS_LOCAL_H */
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 30aca2abd7be..e80ea54707de 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -617,7 +617,7 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &intel_meteorlake_info),
>  
> -	INTEL_PVC_IDS(&intel_pontevecchio_info),
> +	INTEL_PVC_IDS(INTEL_VGA_DEVICE, &intel_pontevecchio_info),
>  
>  	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
>  
> -- 
> 2.39.2
> 
