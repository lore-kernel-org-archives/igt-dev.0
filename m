Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BFCC282DE
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 23:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CED810E347;
	Fri,  7 Mar 2025 23:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLIYH1pg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40D410E347
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 23:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741389554; x=1772925554;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QxsGvUBwzBraCuZbufGNxgL4BJMp73T/9MDu7YOkHSo=;
 b=jLIYH1pgMCWCiIQ0nR4TxqjsrGISRrNaIf1KxCb96IOLX2rhEF7wFDeS
 M0v0HCGAUgw/o+SsoO0Qf815ucLFHc3HxMLesKSd4raA3racLBlHO3o9S
 Mir1tm+2sjeAZYU2rrjE5mgQs1h0iLWCsSYGvSrV+WfTz3ONqcefjEEXB
 qJ93CBBBqRixD+MYXadIQmUjzZMRrjm6tgMJcRYkEzkXEHUkBhspLECFQ
 oILBpJaJxa0Bdz76Xo3baj+6078OBVDjfE+yiVRMniO0uZ3vis46IStB+
 yw3tH2GhTnfDdqDa2Utp8cMZ19h/zNweX5ocQlqWb/nUDJj+cB55I6iyB w==;
X-CSE-ConnectionGUID: d/KITOidT/CMTrONp4moVg==
X-CSE-MsgGUID: kkCOpH5CRlaJW267h0lHKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="53090487"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="53090487"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 15:19:14 -0800
X-CSE-ConnectionGUID: zm1DUSOASzC13JIxSK7xZA==
X-CSE-MsgGUID: maJz3XzaRqqhO30PujSoaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="120150831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 15:19:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 15:19:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 15:19:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 15:19:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaD7GYSSL5W4JsDhfxDTMHtXjaAghLFpgIuj2cWN5lDNf6Xm4fRlsTmjUMTeh40nHZKUH+CKCcP65VTiK6/om4HS+DzSZuuHE2OgFe8hDiMS2quRyW2INGn6LlMlSr549whb9uYW5Lj3yC5ULCTIxZ9tdoMb3XPTYl8GFAVNi26/56hJxMcG14cWK4JBC0a9QdK/3jZ+JlNRvvKgR5KBE6Q1wYChF4/xnY9y+8H2W3g2Pi5zpfhIwsCijDHeZ9pTFSkeMMhPJJAryfC94kBNwL2kjA3RGnxkdBCTNFYleJZn3+0j99fB6wRK/MK6Ets+RslesyBsZWD4EjschkbyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qWOhkSZalsBbuL7KvqzDAu/lTk1jNSkDr5fqbsT1qs=;
 b=poVP3S5NhYZLzPlT8kw6Y1ldr/KYs23KtQl3+GQglpH8IM6C5fC9XI3I27ONCbg9d3Fz+znwzFA75OlwmuO9aBBLHJ3unyzoUC9RFrvcJOjwMOsCuJy021rVy2GDH1ka2omMiFMcOF0Q7A925R2OEBHBgfXIWhSA5wyORcaAuSuqDJV4QmxB5FjFBCxQ9ScQ0kGL/hT3DXptL6/CS9G1sTnskJkK4kUI0gl2L1sd7AYurv1KuQD2oNbPGKBbfYpM46dDSePDGW/8ITNvVAHYtgGMM0UuryLW8YuvIMWkmqtKNYPtaB5ri+dY4uQOr96aL+qzGYZbOOMh0J9FzSrisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 23:19:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 23:19:04 +0000
Date: Fri, 7 Mar 2025 15:19:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_multi_tile: Multi-Tile support in IGT
Message-ID: <20250307231901.GB3701377@mdroper-desk1.amr.corp.intel.com>
References: <20250228092251.15170-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228092251.15170-1-nishit.sharma@intel.com>
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: e009c2f7-26c9-4d97-39a7-08dd5dce73b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WI+5t/34w0BLo7FBMyGv0qkIY0n0o2I84j7tOGmC3qyj34uuh4XIYf4b3M?=
 =?iso-8859-1?Q?o7NIKQFZbshwq/BnhVPF/8EG4rbBXXeg+YYu3GO8jxsG/+gbEZXyh/Ztfn?=
 =?iso-8859-1?Q?tXaZ6gZJMg2wV7JH6+lygTvsRlZpRt/jzRsJaxAEl0VfxgGh9fBNEvOZnP?=
 =?iso-8859-1?Q?O8H3j8pmNmp8XamWPtZdL68YrZe0pbXscpZf3bSOLYXYhEDecnqe/sWtQN?=
 =?iso-8859-1?Q?Pvf3MIt4rOmLuaSkdNSYFZMZvChWSczicGaYG7/AJjPYEGU6SPerZwbzXv?=
 =?iso-8859-1?Q?514gjW4SlBrD8VfdSfsiV1edWEFwnGqNCb+8P68GZpdnRNykeLVoCfJu2o?=
 =?iso-8859-1?Q?oPF6jGgY1Jldvnn4YJkGIun1e1lkprFoE8785rrC10OL2I31VXyuWqpcsg?=
 =?iso-8859-1?Q?y0nVAWwT3DbHx+PQC57JdkLywKopaEXCM19kN9ohMxYbIBexIx0/Ps+3Ru?=
 =?iso-8859-1?Q?gpyeEeM4kHpFucqMfN3CZcXbsb+dyArV5dp6YMVrnKB+K2LvtSEtfxIXQT?=
 =?iso-8859-1?Q?/yp4x1DNTe7k+rLGMXxL/aUqO5ilsNwRnA3mkc38OPNtwNRFF/k5h3PjkG?=
 =?iso-8859-1?Q?5u1i2PoYl6LluiWY1L1rSff7qCHAPrB/nAcsk4s+Q9oy2Ufqz4YKrkmyIN?=
 =?iso-8859-1?Q?2oXpm2tmHPMC2FB+BlsblfcJ6Nu+j7/GeeGWh3nbdf5TICmORJ0AOO0waC?=
 =?iso-8859-1?Q?GPcXceQMSkHyQCyRYQyepKfPBzdKKWJjzC9YO9PrC0hsiQdn87/0pyTu33?=
 =?iso-8859-1?Q?xF3cy2I95JmJzJIaprICiHWGtDOZ8alTbtMClHtTBQCUjFMijZXEmI7LFc?=
 =?iso-8859-1?Q?DiWC9+lyhGIYV2OCricHGAIbjvejdqX/G1GcTf2XYjNryt8BgG/h3jm7sC?=
 =?iso-8859-1?Q?taU8M1isIUkzsjCC7JunDlG3+bZFHeF+6H9DehFUSmY4qZHAJe9YESGd4u?=
 =?iso-8859-1?Q?kmCtTPAsPiaOeb/KuwF/s6HQB/6a8mepsV3UnSQ1dCQcF7F/VChM8SAuI6?=
 =?iso-8859-1?Q?ccQUt73GRcFucDiVVYF9/TCndS48hARqJvdRn7HYYRdifldGAyBlCpNEho?=
 =?iso-8859-1?Q?l7J+33HttaaA/iJp0RRAnPXBQyKDzoMgNR0bhi3v5JZ+yD2I2aOgNtjleL?=
 =?iso-8859-1?Q?LPXqHY8eAk408PO3K4bumuckz8bEXQDlTuMLL6ae3DjOfKnsFANypLUgtz?=
 =?iso-8859-1?Q?NY1kfI4pOZsymJHUgbbWC4FJqrW/8oF00ylG+RWM+7h6jq+b6+sh8KcXqX?=
 =?iso-8859-1?Q?gxjZwSTn/Ui/QZiwBLvFpJpzysvPhm9Y1qqWXijCgFRbSr3nelxIf2VEKG?=
 =?iso-8859-1?Q?frFytMtucQEOSzxVjWsbPyWUGzGySHzrcPM+DyawMnC0yEAh9fmEhGFyWd?=
 =?iso-8859-1?Q?RaYdvMe4NGEH/w5JZFVG+kBqNU5VsTJNI0M+BI9XC+Ql5ZUpF1yNy/SlOc?=
 =?iso-8859-1?Q?nVu8GCxHde8CPKQt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ncIGq4BZePTydoRxZlBuwwg4C/cPJOsw3vepybP8W6SXA4m3UuhwfYkygi?=
 =?iso-8859-1?Q?tkWwOYF+GiwLEDWs1TGph7W1K4b7pbM/d0pWw5+MyEHKuPwYExcftvcbOy?=
 =?iso-8859-1?Q?Pp3kI6UMfTAgBwNUIYeFpwciPj5uP3RKj7Fyxj+O/GUYM9JgaGEmafAlqo?=
 =?iso-8859-1?Q?hMt90pyG2NOIiISdhUPaVfvpSj/k3gPIWJpH+JkqJAWfja8X46ZploBnTP?=
 =?iso-8859-1?Q?AEJ9NDwII7i0/4PULp2Xf5Zn7v9oHsq1+7fFRrtxpVD2tP30HPBOy0TzYC?=
 =?iso-8859-1?Q?/qMNl9mCAtBQqbhuj8mIwa2yfp9okRWNAmGa2htWpikyEtJvc4GfujsvEx?=
 =?iso-8859-1?Q?bRI3joUGokeSR2E5L8ZTqa0D1EXoUdn52g5HxAjEADEriJ1p70QkZxhi17?=
 =?iso-8859-1?Q?1cn9FhHKPg1p8mZ31k8pGrTp8DJbOaXnmlzhZJp+/OTVglof/vYDyLnqJi?=
 =?iso-8859-1?Q?8wAyvksc8947vOA1ZVvjS61SqJlW8ztGPUgXTKAfeDvZTcv6Vsy4GBJMJz?=
 =?iso-8859-1?Q?TBtEJU+8IOfO9kK5rXF1DdbLLzjjiKcz1r4foVbLl72DbTwuOK8MFm/V35?=
 =?iso-8859-1?Q?OevYoyz071L00qjtXYbCemaL5IteHrHxQjvwxCL0PQv6DwxfigjMR/TEda?=
 =?iso-8859-1?Q?2US7gvpAuGYPQTpDjIQb9Tb4fiN7HOL16kKjqCifH0jX59Our5H9Fr59H1?=
 =?iso-8859-1?Q?GXt2ILYeeTfed1NETpGBNmbFD8QOAs0hVa6Gv5IYgCYOIg5+QRCBNqNULF?=
 =?iso-8859-1?Q?mhLhsLjfGB90KtUP3adkcUMhXbEf2HVRaZHjrPXZ4ZJRuRoCZDPK5FiX+c?=
 =?iso-8859-1?Q?XRBc17SnlrmZ/u8GPdZ0YZPLRunf63lxY6ouX3HsbD7lpHOSbEfa0rViW3?=
 =?iso-8859-1?Q?hMx2Bw7FlC2MD+Jnzq8wEAm2mmcz+v6a0J89jAoCsM94e9UZqU97TJeJDa?=
 =?iso-8859-1?Q?XS+KQ6EhZkyS2icF1SaiAU5Fe4ESrdG2IUTHkfPL/v4S+EmblSTZfHdB0D?=
 =?iso-8859-1?Q?xB/zHEB1AQOUK9cklncgm2w/+EYtzu9o2hHXoxwm/v9kK6RNynacYPaJbM?=
 =?iso-8859-1?Q?3V5H7lJOzBrj09ZVp/eE0P4vpIAWHYl/A4ewxBNe3Mw3kE7QUNuaUE0Hkp?=
 =?iso-8859-1?Q?5tZW6NaFyDO0KN6HMDEP4qNvC+Yx3OUSOM8K6hLp8Zg694PB24+qsQgYGO?=
 =?iso-8859-1?Q?zNmZKrXz/8AmgGYpd0fMbwtJMNqLJvoIuDz2uDRPgIKbQDjQ+XI8NGB4E2?=
 =?iso-8859-1?Q?wIUJS48BxYraNtvW5NBRaOPZ5dxBjUIWi4//p7YXwmKZz4yX4OuZ2ksfLA?=
 =?iso-8859-1?Q?GuEfU9cqUN+ZzyVhQlKo0dFR6Nf4O6nhqnxNwMBhb72aFqUXatVl/DQ+KX?=
 =?iso-8859-1?Q?aUXVyYkLOh1KdKzDp5TJWGgGrMkvX8/HbO4u8q29D+1/LHyRlriUJJed1n?=
 =?iso-8859-1?Q?jXhRFRJhf4YkqMQI5sPbBqbr9JV8H8QBvJ1o4HtKaz7JNlfIr1RSKNfDV4?=
 =?iso-8859-1?Q?qUpmGXx3nlT3uOWoLhErzm5QQ3Z8SoNgUv747h0QVDvg1cGTpi6IWlj5rm?=
 =?iso-8859-1?Q?LXabmvQGk1aK0aMlcG3RBnZRehcKFqSmL3QKNaHGGhmYhUWbic/Y5r6kv6?=
 =?iso-8859-1?Q?LYdbsoF/94+0Rsk+wx+2N1xozjUzKMwMrQXJtnpIQjVHZmKyDdptqVuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e009c2f7-26c9-4d97-39a7-08dd5dce73b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 23:19:04.4823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHyQGYenjyh/VolzypK52hglqBKCmkFIoFgOEvThK7yoAROse2FgwZhwSpGiLggsNhi32CVaYea7asnHDxE+6OY68ifMaY6kvnIbKcxSoaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
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

On Fri, Feb 28, 2025 at 09:22:51AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Added functionality to check Multi-Tile available in platform or not. GT%d exposed
> related to each Tile%d. Functionality added to check if any tile%d not provided by
> driver or missed E.g.tile available in platforms in order tile0, tile1...tileX in
> serial order, If tile1 tile2 tile4...tileX populated than will get Warning tile3 not available.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  include/drm-uapi/xe_drm.h   |  88 ++++++++
>  lib/igt_sysfs.c             |   3 +-
>  lib/xe/xe_query.h           |  38 +++-
>  tests/intel/xe_multi_tile.c | 423 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  5 files changed, 551 insertions(+), 2 deletions(-)
>  create mode 100644 tests/intel/xe_multi_tile.c
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 08e263b3b..5e2a54353 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h

This is a uapi header and should always be a synchronized copy of the
kernel's header; it's not something you can make new changes to inside
of IGT.  The things you're adding below don't exist on the kernel side
and aren't part of the userspace<->kernel interface, so this isn't the
right place to put them.

If your test does need something that's recently been added to the
kernel uapi and just hasn't shown up in the IGT copy of this header yet,
then you'd create an initial patch that just syncs with the kernel
version and does nothing else.  For example, see ef0abf7f3
("drm-uapi/xe: Sync with OA uapi updates") for an example of a previous
synchronization commit.

> @@ -188,6 +188,94 @@ struct drm_xe_user_extension {
>  	__u32 pad;
>  };
>  
> +enum xe_gt_type {
> +	XE_GT_TYPE_UNINITIALIZED,
> +	XE_GT_TYPE_MAIN,
> +	XE_GT_TYPE_MEDIA,
> +};
> +
> +/**
> + * struct xe_gt - A "Graphics Technology" unit of the GPU
> + *
> + * A GT ("Graphics Technology") is the subset of a GPU primarily responsible
> + * for implementing the graphics, compute, and/or media IP.
> + *
> + */
> +struct xe_gt {
> +	/** @tile: Backpointer to GT's tile */
> +	struct drm_xe_tile *tile;
> +
> +	/** @info: GT info */
> +	struct {
> +		/** @info.type: type of GT */
> +		enum xe_gt_type type;
> +
> +		/** @info.id: Unique ID of this GT within the PCI Device */
> +
> +		__u8 id;
> +
> +		/**
> +		 * @gt_count: Number of GT/s available in tile
> +		 *
> +		 * */
> +		__u8 gt_count;

Why is there a GT count inside the the per-GT structure?  This seems
like the kind of thing that would be at the tile level instead.


> +	} info;
> +};
> +
> +/**
> + * struct drm_xe_tile - hardware tile structure
> + *
> + * Tile structure contains info like tile ID, vram id, flag to check any tile
> + * missing or out of order, gt count per tile
> + *
> + */
> +struct drm_xe_tile {
> +	/** @xe: Backpointer to tile's PCI device */
> +	struct xe_device *xe;
> +
> +	/** @id: ID of the tile */
> +	__u8 id;
> +
> +	/**
> +	 * @vram_id: ID of associated TTM VRAM region
> +	 *
> +	 * For multi-tile platforms not using unified vram, this is same
> +	 * as @id.  Otherwise this is always 0 to denote a single unified
> +	 * vram region is in use.
> +	 */
> +	__u8 vram_id;
> +
> +	/**
> +	 * @mis_tile: Flasg to check if tile ID missing or out of order
> +	 *
> +	 */
> +	__u8 mis_tile:1;
> +
> +	/**
> +	 * @gt_count: Number of GT/s available in tile
> +	 *
> +	 * */
> +	__u8 gt_count;
> +
> +	/**
> +	 * @primary_gt: Primary GT
> +	 */
> +	struct xe_gt *primary_gt;
> +
> +	/**
> +	 * @media_gt: Media GT
> +	 *
> +	 * Only present on devices with media version >= 13.
> +	 */
> +	struct xe_gt *media_gt;

This seems like we're trying to copy the kernel's internal details
inside IGT.  From userspace's perspective, we query a list of GTs and
each of those GTs have a type.  If we already have the GT list itself, 
why are we adding these extra pointers (which may not even work on
future platforms if we get new types of GTs, multiple GTs of the same
type per tile, etc.)?

IGT should be following the uapi exposed by the kernel, not trying to
mimic the kernel's internal details (which we fully expect to change in
the future).

> +
> +	/**
> +	 * @gt_list: List of GT descriptors from driver
> +	 *
> +	 */
> +	struct drm_xe_query_gt_list *gt_list;
> +};
> +
>  /**
>   * struct drm_xe_ext_set_property - Generic set property extension
>   *
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2e4c2ee63..6fb70ccc9 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -235,7 +235,8 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
>  
>  	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
>  		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> +			 major(st.st_rdev), minor(st.st_rdev),
> +			 xe_gt_get_tile_id(xe_device, gt), gt);
>  	else
>  		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
>  			 major(st.st_rdev), minor(st.st_rdev), gt);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index a84a6bfa5..34fea94d1 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -21,6 +21,7 @@
>  #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
>  
>  struct xe_device {
> +#define XE_MAX_TILES_PER_DEVICE	4

This should probably be 2 rather than 4.  The only multi-tile platform
we have today is PVC which just has two tiles.  Way back I think
XeHP_SDV might have had some 4-tile configurations, but that platform
was just an early SDV for the Xe_HP architecture and no longer exists so
it isn't supported by the Xe driver.  If new new platforms show up in
the future with higher tile counts, we can change this #define at that
time, once we know what the proper counts are.

>  	/** @fd: xe fd */
>  	int fd;
>  
> @@ -36,6 +37,27 @@ struct xe_device {
>  	/** @gt_list: gt info */
>  	struct drm_xe_query_gt_list *gt_list;
>  
> +	/** @tiles: device tiles */
> +	struct drm_xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
> +
> +	/** @info: device info */
> +	struct drm_xe_tile_info {

If this structure holds device information, then why does it have 'tile'
in the structure name?

What is the point of info substructure in general?  xe_device already
holds information about the device, so it's unclear why some fields are
inside this substructure and others are outside.

> +		/** @info.tile_count: Number of tiles */
> +		uint8_t tile_count;
> +		/** @info.gt_count: Total number of GTs for entire device */
> +		uint8_t gt_count;
> +		/** @tile_unvailable: Flag to check if tile is missing or out of order */
> +		uint8_t tile_unavailable:1;

What do you mean by 'missing or out of order?'  That sounds like the
kind of thing that a specific IGT test would be checking to see if we
have driver bugs somewhere.  It's not something that would need to go
into the common shared library used by all tests.  Same for the next
couple fields too.

> +		/** @mis_tile: Tile ID missing or out of order */
> +		uint8_t mis_tile_id[XE_MAX_TILES_PER_DEVICE];
> +		/** @mis_tile_count: missing TIle ID **/
> +		uint8_t mis_tile_count;
> +		/** @info.graphics_verx100: graphics IP version */
> +		__u32 graphics_verx100;
> +		/** @info.media_verx100: media IP version */
> +		__u32 media_verx100;
> +	} info;

When/where do all of the fields in this substructure get initialized?
If I'm using this IGT library, then I'd expect the whole structure to be
usable (in any test I write) after I call xe_device_get().  But as far
as I can see, nothing here ever gets initialized, except when running
the multitile test.  On any other test (both current and future) all of
the fields here are just uninitialized.

If we're adding general information to the shared device library code,
then it should work for all tests.  If it's only for one specific test,
then it doesn't really belong in the library in the first place.

> +
>  	/** @gt_list: bitmask of all memory regions */
>  	uint64_t memory_regions;
>  
> @@ -75,13 +97,22 @@ struct xe_device {
>  	     ++__class)
>  #define xe_for_each_gt(__fd, __gt) \
>  	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
> -
> +#define xe_for_each_tile(tile__, xe__, id__) \
> +        for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
> +                for_each_if((tile__) = &(xe__)->tiles[(id__)])
> +#define xe_for_each_remote_tile(tile__, xe__, id__) \
> +        for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
> +                for_each_if((tile__) = &(xe__)->tiles[(id__)])

What's the difference between 'xe_for_each_tile' and
'xe_for_each_remote_tile?'  They seem to be identical.  And the remote
version isn't used anywhere.


> +#define xe_for_each_device_gt(gt__, xe__, id__) \
> +       for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
> +               for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
>  #define xe_for_each_mem_region(__fd, __memreg, __r) \
>  	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
>  		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
>  
>  #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
>  #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
> +#define MEDIA_VER(xe) ((xe)->info.media_verx100 / 100)
>  
>  /*
>   * Max possible engine instance in drm_xe_engine_class_instance::engine_instance. Only
> @@ -89,6 +120,11 @@ struct xe_device {
>   */
>  #define XE_MAX_ENGINE_INSTANCE	9
>  
> +/*
> + * Max possible GT per Tile
> + */
> +#define XE_MAX_GT_PER_TILE	2
> +
>  unsigned int xe_number_gt(int fd);
>  uint64_t all_memory_regions(int fd);
>  uint64_t system_memory(int fd);
> diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c
> new file mode 100644
> index 000000000..c5b2e0472
> --- /dev/null
> +++ b/tests/intel/xe_multi_tile.c
> @@ -0,0 +1,423 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + * 
> + * Authors:
> + *    Nishit Sharma <nishit.sharma@intel.com>
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Test to verify if multi-tile support available in platform

The description here is confusing.  A platform may or may not have
multiple tiles, and either case is fine (not a problem).  So what are we
actually testing here?  What kind of driver bug are we trying to catch
by adding this new test?

> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Tile/GT operations
> + * Functionality: multi-tile
> + * Test category: functionality test
> + */
> +
> +/**
> + * SUBTEST: multi-tile-info
> + * Description: Test gathers Tile_ID/s and GT_ID/s, update internal struct

As above, we should describe what the test is actually checking, not
just the steps it happens to take internally while doing that.  I.e.,
what are we checking to decide between "PASS" and "FAIL?"

We already have tests for "make sure the information reported by the
query ioctl looks sane" in tests/intel/xe_query.c.  If this test is just
going to exercise the query interface, then why aren't we extending the
existing test?  If this test is trying to test something else (some
specific aspect of multi-tile execution), then we need to explain what
that is, and create subtests that match the specific behaviors we're
trying to test.

> + */
> +
> +struct xe_gt *xe_gt_alloc(struct drm_xe_tile *tile);
> +int xe_tile_init(struct drm_xe_tile *tile, struct xe_device *xe, uint8_t id);
> +struct drm_xe_tile *xe_device_get_root_tile(struct xe_device *xe);
> +struct xe_gt *xe_tile_get_gt(struct drm_xe_tile *tile, u8 gt_id);
> +struct xe_gt *xe_device_get_gt(struct xe_device *xe_dev, uint8_t gt_id);
> +
> +/*
> + * xe_gt_list: Get the list of gt%d, tile%d and count from driver
> + * @fd: GPU device descriptor
> + *
> + * Function gets the count of gt available in device
> + * including other information such as gt count, graphics ip version
> + *
> + * Return: Returns drm_xe_query_gt_list pointer
> + */
> +struct drm_xe_query_gt_list *xe_gt_list(int fd)
> +{
> +	struct drm_xe_query_gt_list *gt_list;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_assert_neq(query.size, 0);
> +
> +	gt_list = malloc(query.size);
> +	igt_assert(gt_list);
> +
> +	query.data = to_user_pointer(gt_list);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	return gt_list;
> +}
> +/*
> + * xe_gt_alloc: Memory allocation for gt struct and initializing 
> + * 		struct drm_xe_tile as per gt
> + * @tile *: Tile structure
> + *
> + * This allocates memory per GT available on tile and assigns corresponding tile address
> + * to corresponding gt
> + *
> + * Return: Returns gt structure pointer
> + */  
> +struct xe_gt *xe_gt_alloc(struct drm_xe_tile *tile)
> +{
> +	struct xe_gt *gt;
> +
> +	gt = malloc(sizeof(*gt));
> +	igt_assert(gt);
> +
> +	gt->tile = tile;
> +	return gt;
> +}
> +/**
> + * xe_tile_init - Initialize the tile structure and allocates memmory for primary GT
> + * @tile: Tile to initialize
> + * @xe: Parent Xe device
> + * @id: Tile ID
> + *
> + * Initializes per-tile resources.
> + *
> + * Returns: 0 on success, assert if no memory allocation.
> + */
> +int xe_tile_init(struct drm_xe_tile *tile, struct xe_device *xe, uint8_t id)
> +{
> +	tile->xe = xe;
> +	tile->id = id;
> +
> +	tile->primary_gt = xe_gt_alloc(tile);
> +	igt_assert(tile->primary_gt);
> +
> +	return 0;
> +}
> +/**
> + * xe_device_get_root_tile: Returns address of root tile
> + * @xe: GPU Device structure which holds information about tile
> + * 	available in system
> + *
> + * Return: root tile address
> + */
> +struct drm_xe_tile *xe_device_get_root_tile(struct xe_device *xe)
> +{
> +	return &xe->tiles[0];
> +}
> +/**
> + * xe_tile_get_gt: Return address gt struct
> + * @tile *: Tile associated with gt
> + * @gt_id: gt%d 
> + *
> + * Returns: Based on gt_id passed xe_gt address returned which
> + * 	    can be media_gt or primary gt 
> + */
> +struct xe_gt *xe_tile_get_gt(struct drm_xe_tile *tile, u8 gt_id)
> +{
> +	igt_assert_f(gt_id <= XE_MAX_GT_PER_TILE, "gt_id greater than defined XE_MAX_GT_PER_TILE");
> +
> +	return gt_id ? tile->media_gt : tile->primary_gt;
> +}
> +/**
> + * @xe_dev: GPU Device structure which holds information about tile
> + * @gt_id: gt%d
> + *
> + * Returns: gt struct address based on media version available in platform
> + */
> +struct xe_gt *xe_device_get_gt(struct xe_device *xe_dev, uint8_t gt_id)
> +{
> +	struct drm_xe_tile *root_tile = xe_device_get_root_tile(xe_dev);
> +	struct xe_gt *gt;
> +
> +	if (MEDIA_VER(xe_dev) >= 13)
> +		gt = xe_tile_get_gt(root_tile, gt_id);
> +	else
> +		gt = xe_dev->tiles[gt_id].primary_gt;
> +
> +	igt_assert(gt);
> +
> +	return gt;
> +}
> +/**
> + * @xe_dev: GPU Device structure which holds information about tile 
> + * @gt_id: gt%d
> + *
> + * Check gt%d passed available or not on tile%d
> + *
> + * Return: None
> + */
> +static void igt_check_gt_per_tile(struct xe_device *xe_dev, uint8_t gt_id)
> +{
> +	uint8_t id;
> +	struct drm_xe_tile *tile;
> +	struct xe_gt *gt;
> +
> +	xe_for_each_device_gt(gt, xe_dev, id) {
> +		tile = gt->tile;
> +		if(gt_id == gt->info.id)
> +		{
> +			igt_info("GT ID :%d available in Tile :tile%d\n",
> +				 gt_id, tile->id);
> +		}
> +	}
> +}

This function didn't actually check anything; all it did was print some
debug output on the console (which isn't something we'll even look at in
CI if the test isn't reporting a failure).

> +/**
> + * @xe_dev: GPU Device structure which holds information about tile
> + * @gt_id: gt%d
> + *
> + * To query gt%d available in tile%d by iterating over list of tiles available
> + *
> + * Returns: None
> + */
> +static void igt_query_gt_per_tile(struct xe_device *xe_dev, uint8_t gt_id)
> +{
> +	struct drm_xe_tile *tile;
> +	struct xe_gt *gt;
> +
> +	xe_for_each_tile(tile, xe_dev, gt_id) {
> +		gt = tile->primary_gt;
> +
> +		if(MEDIA_VER(xe_dev) >= 12)
> +			gt = tile->media_gt;
> +
> +		igt_info("Inside GT Id :%d GT type :%d GT count :%d for Tile ID :%d GT count in Tile :%d\n",
> +				gt->info.id, gt->info.type, gt->info.gt_count, tile->id, tile->gt_count);
> +	}
> +}
> +/**
> + * igt_show_device_gt: To show gt availale on GPU device
> + * @xe_dev: GPU Device structure which holds information about tile
> + * @fd: GPU device descriptor
> + *
> + * Show GT%d available on device
> + *
> + * Return: None
> + */
> +static void igt_show_device_gt(struct xe_device *xe_dev, int fd)
> +{
> +	struct drm_xe_tile *tile;
> +	struct xe_gt *gt;
> +
> +	uint8_t id;
> +
> +	xe_for_each_device_gt(gt, xe_dev, id) {
> +		tile = gt->tile;
> +		igt_info("GT Id :%d GT type :%d Tile ID :%d\n",
> +				gt->info.id, gt->info.type, tile->id);
> +	}
> +}
> +/**
> + * igt_gt_init_per_tile: Initialize xe_gt structure per gt%d and per tile%d
> + * @xe_dev: GPU Device structure which holds information about tile
> + * @fd: GPU device descriptor
> + *
> + * Returns: 0 in case of success or assert
> + */
> +static uint8_t igt_gt_init_per_tile(struct xe_device *xe_dev, int fd)
> +{
> +	uint8_t gt_id = 0;
> +	struct drm_xe_tile *tile;
> +	struct xe_gt *gt;
> +	int ip_version, media_version;
> +	char name[100];
> +	FILE *file;
> +
> +	igt_info("per Tile initialization\n");
> +
> +	xe_for_each_tile(tile, xe_dev, gt_id) {
> +		int err;
> +		err = xe_tile_init(tile, xe_dev, gt_id);
> +		igt_assert_eq(err, 0);
> +	}
> +
> +	xe_for_each_tile(tile, xe_dev, gt_id) {
> +		gt = tile->primary_gt;
> +		//new_gt = gt;
> +		gt->info.id = xe_dev->info.gt_count++;
> +		gt->info.type= XE_GT_TYPE_MAIN;
> +		gt->info.gt_count++;
> +		tile->gt_count++;
> +
> +		file = fopen("/sys/kernel/debug/dri/0/info", "r");
> +		igt_assert(file);
> +
> +		while (fscanf(file, "%s %d", name, &ip_version) == 1) {
> +			ip_version = -1;
> +		}
> +		while (fscanf(file, "%s %d", name, &media_version) == 1) {
> +			media_version = -1;
> +		}

If we're trying to get the graphics and media versions, then it would be
best to use the official query uapi for that, rather than the unofficial
debugfs output.  Switching over to that is something that needs to
happen throughout our IGT Xe test codebase; I believe Sai Teja is
working on that at the moment.

> +
> +		fclose(file);
> +
> +		xe_dev->info.graphics_verx100 = ip_version;
> +		xe_dev->info.media_verx100 = media_version;
> +
> +		if (MEDIA_VER(xe_dev) < 13)
> +			continue;
> +
> +		/*
> +		 * Allocate and setup media GT for platforms with standalone
> +		 * media.
> +		 *
> +		 */
> +		tile->media_gt = xe_gt_alloc(tile);
> +		igt_assert(tile->media_gt);
> +		gt->info.type = XE_GT_TYPE_MEDIA;
> +		gt->info.id = xe_dev->info.gt_count++;
> +		gt->info.gt_count++;
> +		tile->gt_count++;
> +	}
> +
> +	return 0;
> +}
> +/**
> + * igt_check_missing_tile_sysfs: Checking if tile missing or out of order in system
> + * @xe_device: GPU Device structure which holds information about tile
> + * @fd: Device descriptor
> + *
> + * This opens the sysfs tile directory corresponding to device and tile for use
> + * The mis_tile_id[] contains tile%d which is checked with sysfs whether entry is present
> + * or not. E.g. After tile2 user get tile4, tile3 is missing which will be checked in sysfs path  
> + *
> + * Returns: None
> + */
> +static void igt_check_missing_tile_sysfs(struct xe_device *xe_dev,
> +					 int fd)
> +{
> +	char path[96];
> +
> +	igt_info("Checking missing tiles with sysfs\n");
> +
> +	for(int mis = 0; mis < xe_dev->info.mis_tile_count; mis++) {
> +		xe_sysfs_tile_path(fd, xe_dev->info.mis_tile_id[mis], path, sizeof(path));
> +	}
> +
> +	igt_assert_f(xe_dev->info.mis_tile_count < 0, "No Tile entry in sysfs found.");
> +}
> +/**
> + * igt_check_if_missingtile: Checking if tile missing by iterating over
> + * 			     filled mis tile array
> + * @xe_dev: GPU Device structure which holds information about tile
> + * fd: GPU device descriptor
> + *
> + * Returns: None
> + */
> +static void igt_check_if_missingtile(struct xe_device *xe_dev, int fd)
> +{
> +	igt_info("Checking missing/out of order tiles\n");
> +
> +	for(int i= 0; i < xe_dev->info.mis_tile_count; i++){
> +		igt_warn("Tile :%d out of order/missing\n",
> +				xe_dev->info.mis_tile_id[i]);
> +	}
> +}
> +/**
> + * igt_get_tile_count: To get count of tile/s available in system,
> + * 		       Getting missing tile and tle count if any
> + * @xe_dev: GPU Device structure which holds information about tile
> + * @fd: Device descriptor
> + * gt_list: list of gt%d and relavant information returned from Driver via IOCTL
> + *
> + * Return: Tile count
> + */
> +static uint8_t igt_get_tile_count(struct xe_device *xe_dev, int fd,
> +				  struct drm_xe_query_gt_list *gt_list)
> +{
> +	int prev_tile = -1, tile_id;
> +	uint8_t tile_mis_count = -1;
> +
> +	for(int index = 0; index < gt_list->num_gt; index++) {
> +		tile_id = gt_list->gt_list[index].tile_id;
> +		if(prev_tile != tile_id)
> +		{
> +			if(++tile_mis_count != tile_id) {
> +				xe_dev->info.tile_unavailable = true;
> +				xe_dev->info.mis_tile_id[xe_dev->info.mis_tile_count++] = tile_mis_count;
> +			}
> +			prev_tile = tile_id;
> +			xe_dev->info.tile_count++;
> +		}
> +		xe_dev->info.tile_unavailable = false;
> +	}
> +
> +	return xe_dev->info.tile_count;
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	struct drm_xe_query_gt_list *gt_list;
> +	struct xe_device *xe_dev;
> +	struct drm_xe_tile *tile;
> +	uint8_t gt_count;
> +	uint8_t gt_arr[] = {0,1,2,3,4,5,6,7,8};
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_dev = xe_device_get(fd);
> +	}
> +
> +	tile = malloc(sizeof(*tile));
> +	igt_assert(tile);
> +
> +	igt_subtest("multi-tile-info") {
> +		/** get gt information from driver using ioctl **/
> +		gt_list = xe_gt_list(fd);
> +		/** store pointer returned from driver which have gt information **/
> +		tile->gt_list = gt_list;
> +
> +		/** Get tile count, initialize flag to check if any tile missing
> +		 * Fill internal struct
> +		 */
> +		gt_count = igt_get_tile_count(xe_dev, fd, gt_list);
> +		igt_assert_neq(gt_count, 0);
> +		igt_info("Tiles :%d available in platform\n", gt_count);
> +
> +		/** check if multi-tile supported in platform */
> +		igt_assert_f(xe_dev->info.tile_count > 1,
> +				"Multi-Tile not supported in platform :%d\n",
> +				xe_dev->info.tile_count);

We shouldn't fail here.  It's perfectly legal for platforms to not have
multiple tiles (in fact that's the usual case).  If a test isn't
relevant on platforms without a certain configuration, we should be
using igt_require/igt_skip to make the test skip rather than fail.


> +
> +		/************* Per Tile Initilization ***********/

The comment style in this file is a bit crazy.  We should just follow
standard comment style and eliminate all the extra asterisks.

> +		igt_assert_eq(igt_gt_init_per_tile(xe_dev, fd), 0);
> +
> +		/******** Condition to check if any tile missing/out of order *****/
> +		if (xe_dev->info.tile_unavailable)
> +			igt_check_if_missingtile(xe_dev, fd);

This (and a bunch of the other functions called here) don't actually do
any checking.  All they do is print messages on the console.  The point
of IGT tests is to return pass/fail for various actions.  If we wanted
something to just print output, then that would be more appropriate for
the tools/ folder rather than the tests/ folder.  Remember that IGT
mostly gets used in CI, run among hundreds of other tests; if we're not
returning failure results, nobody is even going to look at the log
output for an individual test.

> +
> +		/******* Checking missing/out of order tile comparing with sysfs ***/
> +		if (xe_dev->info.tile_unavailable)
> +			igt_check_missing_tile_sysfs(xe_dev, fd);
> +
> +		/****** Display GT information on GPU Device  *******/
> +		igt_show_device_gt(xe_dev, fd);
> +
> +		/****** Query GT per Tile *****/
> +		igt_query_gt_per_tile(xe_dev, fd);	
> +
> +		/***** Checking GT exist, if exist on which tile or doesn't exist ******/
> +		for(int gt_id = 0; gt_id < sizeof(gt_arr); gt_id++)
> +			igt_check_gt_per_tile(xe_dev, gt_id);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a0f984b34..9def89f38 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -294,6 +294,7 @@ intel_xe_progs = [
>  	'xe_exec_reset',
>  	'xe_exec_sip',
>  	'xe_exec_store',
> +        'xe_multi_tile',

The whitespace here doesn't match (you're using spaces and surrounding
code is using tabs).


At a high level it seems like we don't have a single, clear goal with
this patch.  It seems like the patch here contains bits of three
different things all kind of mixed together, but none of them are really
complete or explained:

 * Update IGT's libraries to obtain more information about the device
   and make it available to any test(s) interested in using that
   information.
 * Create new test(s) that exercise a specific behavior to make sure the
   driver is operating as expected and doesn't have any bugs.
 * Dump information about a device for interactive use.

I think the first step is to clearly explain the motivation of making
changes (i.e., what is IGT lacking today?) and what the end goal of your
work is.  If there are multiple goals, then those likely need to be
accomplished as separate patches and/or separate series.


Matt

>  	'xe_exec_threads',
>  	'xe_exercise_blt',
>  	'xe_fault_injection',
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
