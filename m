Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A3EFEFB6E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 17:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19F10EBD8;
	Fri, 27 Feb 2026 17:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdDlzKWC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515AE10EBD8
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 17:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772213841; x=1803749841;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XRlJAbPDBYTvKNmaLAheOgvI4hl4QVfprFwV5zgFU0Q=;
 b=FdDlzKWCbTANJ13/FURPmAhn1+zNhs/ItNnBoGcyoXjYaeCzSEJU9EFx
 von19LqEHdylkqHlfh4tlB/OmSb3w68+wo0zr8LfPAS6IL3kJ1Y0fJrPk
 58hgIzhfwN/y3nIMcaiixQMmp/2lPRHgr8iNu6Yb6S6BFSL+fP4m8pkWj
 DzgUJIMGxrDif8N+dP+GwO74BUNKe2dipdISsxozAE2/L3abfHuGDDArz
 2oFBJN+i7+Qw/YVb+2aGhPzNJoqiTKiT4lJ21xFoZi3YFJMCMdYIOp3Ex
 HvBvdrihpSe0X1uA+eIMPpretqao8xlkoO9YylO1mKq/BWu/hnKZi0+IX A==;
X-CSE-ConnectionGUID: oHYoX5kfSVGG4cAY0/JqSw==
X-CSE-MsgGUID: kg/C1hV1QemGN1w9qmfKyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77141195"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="77141195"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:37:17 -0800
X-CSE-ConnectionGUID: JvYTv5OEQjGUaoGT+o/V9w==
X-CSE-MsgGUID: bEqIViiHT2CxfbOPGMfBqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="220196996"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:37:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:37:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 09:37:16 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:37:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7tqmYlSdN6/UsWoxIo9nzkX55Wli9t5xYjwIFIdVVYnynuE2IvWmnuk3xNA9IOjL8dnvUyc03IqmFOPrtBwy+qMabKtMYgdUKfIB20qBQqxbJuIznKCszvy1hD/sx06IV8ror29GMcH+97q5hINgWwmPr3NFwSHnVFao1cQJbbVFKALFPFJh8xT7XzZXFQRHf9pXFh+1qHwFHo2A4XulZfM0pv7N2BJbZJpOIpi/v63vG83kwEwSAmKqbu48qR5J7ruuzat5fxJDlV6aBjoyxdkw/aOhK5qZuNfbXWh419TsRPjnpNXEsayyd2X9dyPNb5l9fxaQUTOjID76uyH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suoY6hBm5uNUu4qE8zT7XGHP60DY8vuLx1Qhln4iFT0=;
 b=OfK8NqXCvYnc88AMpbmyvOqfKJvUDDR0Im3ixipKQ7VWzlUKHvZaOEylz6l9eHlgYjfPsAc30Sv1OWbbOfToaKmGEP0lSHeQ9R4oDcNePhpF5O24dOSesWT4gnYYAYF2peFbX762WO1Cio79AwegU2TW1rEx4dCgL2PrfKqamgEkSedNWhuxr4DDRTEQCipm+X/mbF/kIOn+nmxdOTwzvoJdrH3xLIAL+S3v19CDPw59s/LBh029AlBbMLU4c+xbFsjzYZ/qfJ57tD+8pSm61ehQJnKx5gHo0CZFIJtbc/rcUHJ43iEpHKN4SHKBnlNsr1kFweI+aQm+5K9htgJM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 17:37:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 17:37:13 +0000
Date: Fri, 27 Feb 2026 09:37:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <himanshu.girotra@intel.com>
CC: <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2 i-g-t] lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe
Message-ID: <20260227173710.GD4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224170737.12151-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260224170737.12151-1-himanshu.girotra@intel.com>
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d60fd6-512d-4b20-1d18-08de7626d75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 9xflKXLFSXK2WJ3UxT2MiBspQnNX6ixyty7iT07rxpEZlGIB8DK1BtZTyk3jAfURNR24kZ0pl04QhH+6TVh2No818LS6osdRafEPt8s9mV3Zo8IYmbqfyJY7M6Iumax4FXEeHR7Pykq+rM6FNYYQP4eXauu3ie5bi3umPRFisZcqQdiOJ4KQ1ozrX1wpHPCaUExjcdRUiFwvQkn60Fi8bENhia46wiVy6E1Y1DoqKfouzdFokgdhq9zX8XdoQhJWdvk9BXNFaJEuvda0XuyGGFG5MCB4f2WF/fNcpoVOxiqWd/BXl+PkfApm/ebq88i1On4DcE5plNxQVzYU82wjIyUcgOhKapPEtDpt8vILZiX4xF47dxhec58I7aeig3xqEPNRMrvZw3zdfp5l7ZPH4OCwho2Bt9tjCJJ6xKn2/OIBzIdfWtOsKX+ZG+pjavZbQxWgtc4lznYBi1tJ9QCkiTq99iY0mzZ0IyhBqFUuJSyTfE4P1zEDcjtLysMCA2YNVQ6jDJEndz/7A97tkXID3A1eMK1p9IxI5GgMjZeXYqrJneaTUmWF2SrIDgDiVQnmXT7Gx/AvofUPLxPbluKugU99qCZcujmSSujTxExicfOMssqNGZkQPHNtJR5hPlxxUNpDNCb3BHYgTmyz7KQnaDZe74hgEx9sl4Pq3rgOgtiSlGK+hlc7JaJSo4pS5RthT494vOvh/Nl7qoA2EBYdVpPu/DN47gp0cwCQq4QjxRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?60xAqOQWqbvbkhKMnx7L989Hbxw9V3bkoe1Kue32emr5sOec4FMvP5sAW/c9?=
 =?us-ascii?Q?8QDaXzt5KuTEe98ODnNCSSBHXJlZlV64deGmFhXQJg0vQWsyA2L6IFHLnDyQ?=
 =?us-ascii?Q?1N98jv918f/Xn/1ufGx1teQUEcVACbaWx2msC64tC0jWwKyjD7j2xgIExAwd?=
 =?us-ascii?Q?HSE4zC2Rpe8aaju4aZqbRYGiL1s4PlSPZbUXUWSarGaQWezoC8Vfk++HjcsS?=
 =?us-ascii?Q?wgHRif/CdTNPtpnd9gByCY4Pxsaix69MJprL/svToGjWumn/pniPqx9sjdh5?=
 =?us-ascii?Q?Ic0qW6oBlV3v63GrcHFBkgoaPqn5qmk2oKRtbfOYm4ReBRcFv61P+RmoxEt8?=
 =?us-ascii?Q?fshplR7+TiYeOuxvJTPj4kAUXTXAQxVHs/9rrXZKb/swHhRKhWO9/06QLBdZ?=
 =?us-ascii?Q?9dk/RS5P0gz56PlKKASrkWkcS+BEJsKhrGb81a2Zp+BX/JFFH6BHzIAbLnGb?=
 =?us-ascii?Q?lI/juzcTqEPV46EpNkxo2aqY5BOC59qYxhkNFeutJR3ID/Km+NaDYK6ONt6+?=
 =?us-ascii?Q?gH0Yto48lxEWuiued7KwYMr2mTUxzwqAOiq6Dhx0pSyMhHGhlNwtJ4MZ7Tus?=
 =?us-ascii?Q?2GVYRcS5bxLGcl9W/KuJkoBjec/8lsV9iisy3CGt6iKGg2ffXTTLqVFcQoqi?=
 =?us-ascii?Q?Dk+FgxQiGzVFJbFbWk+cyrF1fxoovczi397uYiHRN+nYSu+cayT6riPu9ZGt?=
 =?us-ascii?Q?EwbCA2cd5N9mbVJO34LKcLm2Vf/YLwhIO/ETDKnqzi/nzXe20yLteIKM2uVX?=
 =?us-ascii?Q?HAs0PP2V89ulobBQGlhw3IOAZeuh0W/By5Le1N7nMM1/bG2P9qtPcv4N51nd?=
 =?us-ascii?Q?NfOpJVU8G//dpXoGhBIfRKsfGZDnR/azz/EVuFjFK954AN9SXfko6N2jCgzc?=
 =?us-ascii?Q?Of4C24/d+GixW6tg5XBZOThtEfx4SxvfO4OQ0Uysbjf0KRhhfegG0noF3inK?=
 =?us-ascii?Q?ISsOHPxgJGWhVgis7dk31xgrtCivKvhM/ErqOpB7N1VrnN8Tcn5PJ/cT9ce6?=
 =?us-ascii?Q?oyiSv66Rk0veSLBgQCzYRA34gl1C0b46kyP42TiO181HM3/JpUBm0GmOxSez?=
 =?us-ascii?Q?JDIAhVhvdnaYr1J5nbb3rBGbX/XW9PC2Y1NykhGwkD0YhWDUDo5LaPof6KXS?=
 =?us-ascii?Q?XfYrDDmUsle6FUDttqcxYodf/MccuP0iGEPeEwlFsnqNKYbGTADGlVpxQzaE?=
 =?us-ascii?Q?0DLgEX4ayiQhZU9df72E/l/WGRsjAHns6PoiLfK/ktwEfbIJpnuOLgsdIiwl?=
 =?us-ascii?Q?Tom7v2W3DXlxuH0LOi9SklvOFqtCJKhyRxWGigIBkfQtPRoCa+uawG99EZrE?=
 =?us-ascii?Q?zzqWPjuvgSuM7H6DnQW+8tm3HGgT8HDj22eZ6a5tH4g3fhu2h406/moC5ljS?=
 =?us-ascii?Q?IWrJ55Ev013oGrpR6wjBpbEeGuXfrEuvAq8viyP9XZ+sS7j2PpkuWCz7C+Ya?=
 =?us-ascii?Q?1ttlgs1mtDmsr1xZQbpVx3MkqyAEjZo+/6idcp5SDkTEN2KdSrVJ5V6rKhcC?=
 =?us-ascii?Q?IUiKhSrH4D77LUR7N32xG8IVua8ot6ASvgqVUfDdTw8KuqcFpqEHbtgi7JbM?=
 =?us-ascii?Q?mV7mCaebrjzmB5R2R2TMxQwhSLox1bTJ6d7nN+OXWf/30ca7UAiQvDCkA7OZ?=
 =?us-ascii?Q?vgNLnAXd5MpPjCy3OkJGfzDSJ0np3tPUpm/dg/xzPKVKMYhesh/35bGANktj?=
 =?us-ascii?Q?52DY8uMqcvzCRAvyLRYfhtj7yVbK3SWdLpyYoSU5bCoWy340zqmbJgnwSQ7T?=
 =?us-ascii?Q?luXse8OibqgpRAVRFVKZD/FZIMUCimI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d60fd6-512d-4b20-1d18-08de7626d75c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 17:37:12.9555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1cyR+ugyNjQHcMe5jkJM9TBjH1tQh/mMV5Ra+FPNLrgCf4wjgQmrBNabMmltgWh4hi9WBD+5uR0H+62vZVFlYhacImA47BBGv4epuyjX5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
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

On Tue, Feb 24, 2026 at 10:37:37PM +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> IGT should treat the kernel as authoritative for PAT configuration
> rather than replicating platform-specific logic and workaround
> adjustments in hardcoded tables, which is error-prone as PAT layouts
> vary across platforms.
> 
> For Xe devices, query pat_sw_config from debugfs instead of using
> hardcoded PAT indices. Remove the Xe-only hardcoded entries and
> retain the i915 fallback for older platforms.
> 
> Drop the now-redundant max_index assert in pat_sanity().
> 
> v2: Drop redundant index asserts; instead validate actual PAT register contents for correct cache types (Matt Roper)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  lib/intel_pat.c      | 37 ++++++++++----------
>  tests/intel/xe_pat.c | 81 ++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 94 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 9815efc18..8660a2515 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -96,24 +96,27 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>  
>  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  {
> -	uint16_t dev_id = intel_get_drm_devid(fd);
> +	uint16_t dev_id;
> +
> +	/*
> +	 * For Xe driver, query the kernel's PAT software configuration
> +	 * via debugfs. The kernel is the authoritative source for PAT
> +	 * indices, accounting for platform-specific workarounds
> +	 * (e.g. Wa_16023588340) at runtime.
> +	 */
> +	if (is_xe_device(fd)) {
> +		int32_t parsed = xe_get_pat_sw_config(fd, pat);
> +
> +		igt_assert_f(parsed > 0,
> +			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
> +			     parsed);
> +		return;
> +	}
>  
> -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> -		pat->uc = 3;
> -		pat->wb = 2;
> -		pat->max_index = 31;
> -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> -		pat->uc = 3;
> -		pat->wt = 15; /* Compressed + WB-transient */
> -		pat->wb = 2;
> -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> -		pat->max_index = 31;
> -
> -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> -			pat->max_index -= 4;
> -	} else if (IS_METEORLAKE(dev_id)) {
> +	/* i915 fallback: hardcoded PAT indices */
> +	dev_id = intel_get_drm_devid(fd);
> +
> +	if (IS_METEORLAKE(dev_id)) {
>  		pat->uc = 2;
>  		pat->wt = 1;
>  		pat->wb = 3;
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 21547c84e..6ad6adab7 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -103,6 +103,57 @@ static void userptr_coh_none(int fd)
>  #define COH_MODE_1WAY		2
>  #define COH_MODE_2WAY		3
>  
> +/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
> +#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
> +
> +static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
> +{
> +	if (gfx_ver >= IP_VER(20, 0))
> +		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> +
> +	if (gfx_ver >= IP_VER(12, 70))
> +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> +
> +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 0;
> +}
> +
> +static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
> +{
> +	if (gfx_ver >= IP_VER(20, 0)) {
> +		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
> +
> +		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD;
> +	}
> +
> +	if (gfx_ver >= IP_VER(12, 70))
> +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WB;
> +
> +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 3;
> +}
> +
> +static bool pat_entry_is_wt(unsigned int gfx_ver, uint32_t pat)
> +{
> +	if (gfx_ver >= IP_VER(20, 0))
> +		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
> +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> +
> +	if (gfx_ver >= IP_VER(12, 70))
> +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> +
> +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 2;
> +}
> +
> +static bool pat_entry_is_uc_comp(unsigned int gfx_ver, uint32_t pat)
> +{
> +	if (gfx_ver >= IP_VER(20, 0))
> +		return !!(pat & XE2_COMP_EN) &&
> +		       REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> +
> +	return false;

Minor nitpick:  I think it's slightly more common to use an "early
bailout" pattern (and it reduces indentation a bit for the interesting
case).  I.e.,

        if (gfx_ver < IP_VER(20, 0))
                return false;

        return ...

For simplicity, I'd also just make this helper function check whether a
PAT is compressed and not worry about the UC part.  The caller can
simply do

        pat_entry_is_compressed() && pat_entry_is_uc()

to test for uc_comp


> +}
> +
>  static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
>  {
>  	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
> @@ -120,13 +171,14 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
>  static void pat_sanity(int fd)
>  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
> +	unsigned int gfx_ver = intel_graphics_ver(dev_id);
>  	struct intel_pat_cache pat_sw_config = {};
>  	int32_t parsed;
>  	bool has_uc_comp = false, has_wt = false;
>  
>  	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
>  
> -	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> +	if (gfx_ver >= IP_VER(20, 0)) {
>  		for (int i = 0; i < parsed; i++) {
>  			uint32_t pat = pat_sw_config.entries[i].pat;
>  			if (pat_sw_config.entries[i].rsvd)
> @@ -144,13 +196,28 @@ static void pat_sanity(int fd)
>  	} else {
>  		has_wt = true;
>  	}
> -	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
> -	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
> -	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
> +
> +	/*
> +	 * Validate that the selected PAT indices actually have the expected
> +	 * cache types rather than comparing against hardcoded values.
> +	 */
> +	igt_assert_f(pat_entry_is_uc(gfx_ver, pat_sw_config.entries[pat_sw_config.uc].pat),
> +		     "UC index %d does not point to an uncached entry (pat=0x%x)\n",

Nitpick:  It's slightly more idiomatic to use "%#x" to have the "0x"
prefix added automatically.


Anyway, the overall changes look good to me, so up to you if you want to
make any of the suggestions above or not.  Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>



Matt

> +		     pat_sw_config.uc, pat_sw_config.entries[pat_sw_config.uc].pat);
> +	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config.wb].pat),
> +		     "WB index %d does not point to a WB/XA/XD entry (pat=0x%x)\n",
> +		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
>  	if (has_wt)
> -		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
> -	if (has_uc_comp)
> -		igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
> +		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_config.wt].pat),
> +			     "WT index %d does not point to a WT entry (pat=0x%x)\n",
> +			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
> +	if (has_uc_comp) {
> +		uint32_t uc_comp_pat = pat_sw_config.entries[pat_sw_config.uc_comp].pat;
> +
> +		igt_assert_f(pat_entry_is_uc_comp(gfx_ver, uc_comp_pat),
> +			     "UC_COMP index %d does not point to a compressed UC entry (pat=0x%x)\n",
> +			     pat_sw_config.uc_comp, uc_comp_pat);
> +	}
>  }
>  
>  /**
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
