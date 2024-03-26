Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76166C54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 21:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0209D10F326;
	Tue, 26 Mar 2024 21:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiF0k0qk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D567510F326
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711487055; x=1743023055;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aejQm1V0kNKSzMHxDPKqODernyxpQXFMHuGaJNHAFlg=;
 b=OiF0k0qkr87cKntwHDmHWPsqKx2Dv24IW4pBIWd0xyDKpS5U6RPY4J0C
 gMX3Kdhb58RH7J+AJtiZQZOGadVAbE4zlSriD97xaRVZitmFekVj0gS34
 3m1O52jxTeZN4sFnWWpq9om8gpRclJfgFSg62moIrxmMHnOr47CnATQlV
 6McVBpYKZ/f8f56dMe4Y3YpU2VS+HTOH7aVfymD7wZgGkoXIP2uW4ny6k
 aPtcOI5ltJCC3rmMY+N/MUuYPdZfaOD/MlX6eX0GlyuJFBbu9Y6xceXoo
 +DcZQQvRUCiqIgJ0EvgsZe4PjPgMTG+tKMrQBl91iqBQZ+dU8U9lDwwVo Q==;
X-CSE-ConnectionGUID: GfPpR03HTbSpT7wepzZDiA==
X-CSE-MsgGUID: WfiL9op4QzyxrbwsJN6aEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="24007005"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="24007005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 14:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="47092937"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 14:04:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 14:04:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 14:04:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 14:04:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 14:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag9kby5BQhZuUHsLEtPpi+uGQhwH80hI2Aox4d2RE6h5H+N2CQYr/HX8JDtjKAafG7su6FBLWLf/xguIBHu3BsypUajEOg3EJzhzyUAqfhAPciTHXh5HD4E3KOe7bBsZOzziD16la5Aub77Z/lGVMIattGi0hMEGp6yY142JdRpnA9ere8qXXewQp6Hox77PXSSbg7KlFtzXUgUPtU3k2mKpNBketSWrTP0IpTgUrD6W2JsuVd+uuElVPWu9Nk/JofVaFiyS4Gi5Po2NuV3cfRJ3LDjSoqQSPMcq5XP1lO7LZqNpoaK/yvVToL1VvJ+8JjlPPCQtuD+tQHvT4v0mFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZt032uH01ETlbF5WAVNfsW5OY6pvQWLGy73usQ9XE8=;
 b=O05gdje8mVyGFJ6nlDruYc3ChMh9y28+XkA7wF12AChBgB/xESSmjyYp4mpvfrZ6N7ORWevI8b5XhgJK6ToOBtXg4ghBbVC3At+8kUpbGYdM3nlM37WPzOexTl+Xn7vsNqAsNxQ0I90O66d4Hcfh5awFoOutfi/XY3t/Zx8zUg4BEaq8aESwMtV3ru3UhHS6d9wnf4GO+JiaQaWclT+YfodIMce97eUN2slDVfyUY0FsGSTFLFiBWNWdz/d8ZHcHpTLYl8fr7Xbl6Fcmglv+o1NIPdDYtRREbVygdd6zsXulbfhmuhTO6LWvwrp0N0rA9gfjxymIdmhpuiaJGmZkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 21:03:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 21:03:58 +0000
Date: Tue, 26 Mar 2024 14:03:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <balasubramani.vivekanandan@intel.com>,
 <lucas.demarchi@intel.com>, <clinton.a.taylor@intel.com>,
 <haridhar.kalvala@intel.com>, <radhakrishna.sripada@intel.com>,
 <matthew.s.atwood@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <shekhar.chauhan@intel.com>
Subject: Re: [PATCH] lib/pci: Add new and missing PCI IDs to DG2 platform
Message-ID: <20240326210354.GT2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8433:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgH6Mhwb7etkzOrLCTWhJEY8L1/z1L3Ac4QndzHXFwBd7cNEuOAKW2fyHtlI4SyssiZLPZM7CAxs5xpGVClArCluLZ4B/mp5/mygtC7v+lTeDrddJB/HfiWRhAyS5I+p3JJSGgWdjNJNw8hTlwRgUpEvPprVxoxwHJcbRlSwmP/S+VlKrQZWXJM6ISTxhRftU6G1Vm8xE700SjYqqzeiZ95p0MLv6nDBrGvvfEzMA3xXzDbiFw4pZyNuZvdOV8tqBhuS+VR7EVSRxjFw7kJY47gSqrj1n+4IAzumeJXEmPrqQLwWzfCPGBpeASSOUsE166co2VAQsTVL0vs0ae5i8GyXirPxVI3lff0E9Pa14Pf+dV3QSfRDEiU+FS/4vBIUrGlmlNMMsrwBLjZ5golUAyqZuZ62S4gYwOBNeIShOtuv4Qj0804BOzl60TbzStDJxX69VgOZCwVX7LlFHPBZen//vtGTliFk362C8EFqvPTOc+nNcui96KO7MmI3xlYljnnAqb2MmIZQhArwIySgi8oZEWjwqRjbIHLCdwkLZ5WDBp/eaSG16+rVRD9oYd9zPiXEeHbvyh7opGYhajOB5fC1iwng/h5dnKOb/jLKjeQLmUVUfaAAGqHpAD8q1bf5RzR9Kde9OZy9o02dqvU7TKe8ryMJ/VCnofTkHDgTG9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jT7Mx9D6QT7ZuorYcLBxpWgKtkMzKJjNJsetLRNY6HUTjiUDdMyLE2bs26GI?=
 =?us-ascii?Q?2wpc1/ap4Y8FYmgHJzMS7ZGC7EgJVLeGz41BGUb76oeQBKk+Wz8ycVvUG/ch?=
 =?us-ascii?Q?W0351l+iGzuV8vqQ0TwXMqKBim84ovS07HGDowGC/yDODqij+rsM0cBdWNWn?=
 =?us-ascii?Q?bmpsSJSnpcwNqGeGbeFqRUoqvznwQQUjxnS0h3PdGNgEzFElfTh21wMwrwVs?=
 =?us-ascii?Q?ozh5xlbCgb/T5fY6LV+8iuVi+u4g8Bfb0eSrytFlooP8XoVD31xf15LdIEF6?=
 =?us-ascii?Q?IsK6khXxOfQeHdD0CaVzZcZ3K7c804Jya4PONMfthJiLevGQOCdvpX+vRaqZ?=
 =?us-ascii?Q?icBtXMMOQ/F6b8evzql5yH6u/xbFEadZGedMNKPUE4IGCv4z73aP9TSl5zQk?=
 =?us-ascii?Q?AiglqsBjVsQwyA6tkkXGYJZOAJ9+G5D83kPsniYq5sqcndbzF0WyRJI1D89n?=
 =?us-ascii?Q?SOTPzJRoAHi9yVpMWU2j28b6kWDyjm/OLMy9XxojD4OqTA4szfiDlDYsZtAp?=
 =?us-ascii?Q?twY/4is0rWr6yYOLF3/QIst1XTABIsACJoS4sNxyj+OUqb3UECK983kopAkS?=
 =?us-ascii?Q?bh04NAgEFo88CS480Z/l5trv4mSNbYaZftqAqRKLTsPqn62tnOL8ABBgX8Oa?=
 =?us-ascii?Q?OW9l+ux/d1b1ckAQD/2EYaj/v+vhAERuHgPX7u5gAPuFaF1AIQYRYNDVfMNa?=
 =?us-ascii?Q?MBDMlBVJvOTjqIHYYu+0O417Hk77Glw4NgwXUcIMEBB87fcy9N6LFQiPPJaP?=
 =?us-ascii?Q?Puw/LR3A5FmjLvxfNhOGJ2aJjZ4YVv19N+ZkO0eGyL7Uju9UAxGUNUJ65hSs?=
 =?us-ascii?Q?79CVpLbunbDq7sV0Oo/t+g1J0EYJWaffpZnj5FpiLQ+6SfnpRXwJl1/tpzRB?=
 =?us-ascii?Q?pWAE5oP3iUEPDtMmRpD68yu74E9fBIoQcFNU/J/qFiyVJn83x0M5WbkaDH4h?=
 =?us-ascii?Q?1A1W5M2s2fgRGvtpSpJbe2sbMA4Zo4KPYrM77MeXVuEVAHM0tg+5mx8ooNVN?=
 =?us-ascii?Q?ovJDJjT1smwikGQMlYQeVaGx5M3vWtGB39TAoiWBqm8CY9xaBeJfPJHoUQEf?=
 =?us-ascii?Q?WGgBRrkgyP1aZU00MkHMQx3pGo6E/Q6KuUl2Ihecky8zY1kBcKzKeAu9X/zu?=
 =?us-ascii?Q?+64wmPmfNdRzmobFm7Hvg2utsuspxxrjoz0mYF87iByT6WtCMUqjgXOns5bl?=
 =?us-ascii?Q?QluTYdW0aEI6cdHnKv6U/r2mRcDo6uEbPVVD/OIkXteKCWtYpavpiPPJY/Dl?=
 =?us-ascii?Q?lWU+tP/qJw2aggMMByc664BroOVR4vXErUw2Vt4C23z2IopjgLxFi4xsSb1i?=
 =?us-ascii?Q?ZlK3uax2By32BJH/N9r2F88YP3koR3sJ3gp1A7QFXPAL3QLXmJ5Z8DqDYZpk?=
 =?us-ascii?Q?Ib8e8llYzN8v+c3feied7QvWFn93ueCjV8SSSVoxJuMe0vLazN0+XIfnfhmk?=
 =?us-ascii?Q?JDQUmgYbxR4E0kbMv9q342FKTS7PKgCqHt3vqBg+kq/M0Z3sD0fk/YxqyO2M?=
 =?us-ascii?Q?kUU0P88f2dmSv/SBfn8fMi0Gb0qMRSpz8OSe2pHMcX4WOWJAKtLKN0vi00tl?=
 =?us-ascii?Q?VetTvpft4InUdfE435y65Cd9N8ybENFRq38yYUxa//g8P8Xo1N5EsGeR0C3/?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a21fbe-cc80-4be5-3a04-08dc4dd84132
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:03:58.3170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5jCmVgrLiz7L6mFWA28GydIJjYFhXdz5aVXHiheklCt+zFpYFKTIuH5ueSfttY1hDh//d/qzfYkq9ISUlnO33z329wDGvdBj6Vt95/kaD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
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

On Tue, Mar 26, 2024 at 07:18:43PM +0530, Ravi Kumar Vodapalli wrote:
> New PCI ID is added in Bspec and some are missing in IGT, add them
> to driver

Generally rather than modifying these headers by hand in IGT we just
copy the version of the files out of the kernel source tree and then
create a commit that specifies the specific kernel commit ID that we've
synchronized up to.  For example, see commit 1b32bcdb2 ("lib: sync
i915_pciids.h with kernel").

The Xe driver kernel patch has landed, but the i915 one is still waiting
for CI, so we should probably wait for that to land, then create a
"sync" commit here to copy the latest snapshot of these headers over.


Matt

> 
> Bspec: 44477
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  lib/i915_pciids.h |  4 +++-
>  lib/xe_pciids.h   | 10 ++++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index fcf1849aa..16221ce77 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -709,7 +709,9 @@
>  	INTEL_VGA_DEVICE(0x5692, info), \
>  	INTEL_VGA_DEVICE(0x56A0, info), \
>  	INTEL_VGA_DEVICE(0x56A1, info), \
> -	INTEL_VGA_DEVICE(0x56A2, info)
> +	INTEL_VGA_DEVICE(0x56A2, info), \
> +	INTEL_VGA_DEVICE(0x56BE, info), \
> +	INTEL_VGA_DEVICE(0x56BF, info)
>  
>  #define INTEL_DG2_G11_IDS(info) \
>  	INTEL_VGA_DEVICE(0x5693, info), \
> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
> index 29f07a00a..77aa412d2 100644
> --- a/lib/xe_pciids.h
> +++ b/lib/xe_pciids.h
> @@ -128,7 +128,9 @@
>  	MACRO__(0x5692, ## __VA_ARGS__),	\
>  	MACRO__(0x56A0, ## __VA_ARGS__),	\
>  	MACRO__(0x56A1, ## __VA_ARGS__),	\
> -	MACRO__(0x56A2, ## __VA_ARGS__)
> +	MACRO__(0x56A2, ## __VA_ARGS__),	\
> +	MACRO__(0x56BE, ## __VA_ARGS__),	\
> +	MACRO__(0x56BF, ## __VA_ARGS__)
>  
>  #define XE_DG2_G11_IDS(MACRO__, ...)		\
>  	MACRO__(0x5693, ## __VA_ARGS__),	\
> @@ -138,7 +140,11 @@
>  	MACRO__(0x56A5, ## __VA_ARGS__),	\
>  	MACRO__(0x56A6, ## __VA_ARGS__),	\
>  	MACRO__(0x56B0, ## __VA_ARGS__),	\
> -	MACRO__(0x56B1, ## __VA_ARGS__)
> +	MACRO__(0x56B1, ## __VA_ARGS__),	\
> +	MACRO__(0x56BA, ## __VA_ARGS__),	\
> +	MACRO__(0x56BB, ## __VA_ARGS__),	\
> +	MACRO__(0x56BC, ## __VA_ARGS__),	\
> +	MACRO__(0x56BD, ## __VA_ARGS__)
>  
>  #define XE_DG2_G12_IDS(MACRO__, ...)		\
>  	MACRO__(0x5696, ## __VA_ARGS__),	\
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
