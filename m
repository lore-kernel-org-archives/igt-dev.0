Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D0BFEFB6E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 17:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741F710EBDB;
	Fri, 27 Feb 2026 17:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nf8dN5rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C264610EBDB
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772214346; x=1803750346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a31ACKTYOEhyctbCefzD/vv/NJxigooYyVXpgbhGpak=;
 b=nf8dN5rwn/DWTQOoNk1zkeplgI4f9ZNrvDz5r+118T0SBiU88G/dK/nl
 97MZtWGvk3cwHYtiM8RZisooGMS3oz94WW9tlvqsVKXKcahAnoJU2l83m
 f+z2T7yfELEdZFianmMXT7hvE1nWQl9cOOwT6dnksZwGtYjq8nYxQ3jI9
 3dJflt097skLP4TfCOVRX1uwsneIVKNUD6TV7ZLedXDlGfjhBRLWkEi7f
 l+Ktpll1EHoufD7uqP8EhFrQ9aKO/Q7j8kXr7gaRqKVdTGV41WnyLZlDt
 g5VAQMDHMiB4FM20Twgbq992yxVp1pcek6slAmrYyEzJ+S86HU3jjMWtV g==;
X-CSE-ConnectionGUID: pbJrC6MbRB2ljNuvwS6wAg==
X-CSE-MsgGUID: G4gwRKZkQRyV0LE4mrZ1Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73410501"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73410501"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:45:45 -0800
X-CSE-ConnectionGUID: e1jvFlN4R12N/JaNkQvbPg==
X-CSE-MsgGUID: 30Y3WD0bS9KNFWBX0IslPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216983563"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:45:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:45:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 09:45:45 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:45:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWAdhvqriuMPEd/U3o0pmjOroXbRkd3j3Jf25L8orqR2CaXi9Tayqfn6jaj7l5Yu+adhoCJJlEpiN5JM2iuqUWY4L2E91VTyX5JoWrmWl/Y5pnvBuiB/2/lyDFceXzAyiXt0rHvUIH8r5hw6Ro5tLlXgWFb+JJSUypUL0vEEOOyEgpDUfMIxsEdWw/Kk8RK+/d6DM8zo+HDIjvWYyxkKZoHP32JiMqEqxyW0Xf27ZUr2BMedfijJpYbejCwKlsI54RVHql4TNV0Zk2niNlSyWe7jCp1bCAKYJF+6F5yuALFSWu7Ibahww0lug0XqKHCKUgjGqRwBd5YeQCjMSsk9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ3dBzHIa3u+96mnFpA6cprPMnFo10mFehHiZ5j9JKg=;
 b=LSYFJvbwt5FMzqmXl0zMUY/A+trNJM90NWXSHAMiDBl+jJuIJihgVgLPsi0ESSlJoh6acLGhR+kK/OPWVOVCGSr2CUPZzt/vSwf3z12NSJs1QSIcMp42IZjx+ZfPw2ka+sCpnPw3Ey24gx4WaZPTCFQmm6yCaOLVzb5WEZqVLToldERVep6hB/su2oZr+h0gvtpGjvyD7xRBQZBJXPByhKNAv+fHroF/iv/ZPYpjjF28ZebtacXQOaa+dt7gr/2e3YWyldAYHwmDLjzWBTjum0Vh5OLtfozoagRmYw9ZmwJITblLsQ6hLEPaa3R9Baq/IiPpYQ25HcUtI/jAG5wv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 17:45:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 17:45:39 +0000
Date: Fri, 27 Feb 2026 09:45:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: <himanshu.girotra@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2 i-g-t] lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe
Message-ID: <20260227174537.GE4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224170737.12151-1-himanshu.girotra@intel.com>
 <d606728e-436f-4f94-8992-1c39155199f9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d606728e-436f-4f94-8992-1c39155199f9@intel.com>
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: a4bf5ff4-b9af-4a54-15dc-08de76280592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: GISYAatQ94fTeItqEZ0fWt+Ggk2SQ42SdT8CL8sNjPaJ0Q+7BPuDlJJncDGsvddNDCo/lmiF4Q3X3QV88YGDG+Sy719WO7RpE15XNv6sDVcpNPMK3bH9SktjBgga1Qt5DhmFr2igiPM1Hl7BMEzkW1ZZBmUKlWCS9ZiSczmlP+cCLpuBNrLSPhAHLFsKT/lCrW2I1vs3x8/YIeVTxfV6UUr0T5OJmBQLdZP0pNn6rjNztDdYbiGp6sCJOQ0fBo4E1UqmiYln3PALQIeTGHuyft6axs72sf+qMswx9jngK7nJerh0qYdMgwBI/RbEWEeRgd4n30ttmfl+qF2mzpBzRyTa+x8xjfEnE89L494O3cmeFMAgdo3I8dXTApG3vvEWwG0hloXCIckOpMnrQ8DoIPIRCxd/Fxl096QK+pG6wUHZrEW7YFznLXLisJVvlomr6RwJQEJjXil4KoQ7rVV7gjueKQcfJcUyB7KtXKUlqyyFmgwaL6d5ilv8C+HCfBg/ehwWW1BYf6Q/sEVinWT0Foc2WrRrd6K75BFG4iUcY5qYEa34T320rD9uQDtScAdyQSqUorzX5f4ATfUqVnqJrLuU58bhORrEJ1B/LEflU1O47EuKvaMjXxTcrqBcXzZY8KeiFIBHu25Pts2kIVE5rJ3AzuHOyhy/ijSKbb87Vqm2GAfWHtQrx4ahJYRGdjE5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NFdWfhfCtTCaBz9UdB0g6AYXm5J3j9sBSdG01TCtZ87XlMW2POuikg1+sOOw?=
 =?us-ascii?Q?P6AxWPlN1qR3z6xQTSGDlMrOmPCzd6mcIrrLw6YEyH7J0qj0EiXlSdDB7syX?=
 =?us-ascii?Q?nlUJPRbaGrCop+Y6PeoMMbXH03lAAy+ps8OFqJEQksu0Fvn7I6Y3/lfGgZ0I?=
 =?us-ascii?Q?gPJIg5mI19bXZUmTVbBDka+K3qj69G0RsDq2r0VZSkeIXX+k9J/RPfBV5HjR?=
 =?us-ascii?Q?l6jZAHwMBSGZjoj/ez+tvqTxfeLqFoKry1ATpoqk1+QZ1N0SdkkCeWHWuWhA?=
 =?us-ascii?Q?l7k/Dg4VQDBnvIhJE1ciNiG1tgbejAkYI/elC/OJS+PjGy2WCJBc6Isy6UhE?=
 =?us-ascii?Q?bpaime08FwlwMgtQcULM7RBuEJiEor2U1wCf93381OmXKGn1Opg+pvplDtzG?=
 =?us-ascii?Q?2QxXaMpBbBKCUwHKn5npb4d718QSg9IGS/e5IMxR1lHXI9xzLXWgrHfGyT/o?=
 =?us-ascii?Q?G3li5hPJN83sRjfurtPWtnYPZts9yNlxLP/xvMTRRpM2FKsb2Wzb651Vwj7R?=
 =?us-ascii?Q?zZCDG9487wf8OhKbW3joJB5bQWrtDKF54aDKgVYlmJ61cPKGkdpyfstWD/pW?=
 =?us-ascii?Q?XnB/UFSVQ99diOVYT/Ad73wbS/jqq6NeqiLU9wJUi+8vdma0M9CqQxv9Cdia?=
 =?us-ascii?Q?9CsaaHGiNwTzuXxK/ExvQkKfte7MkahDdWZtVZLKHhPWkcTr/8UyraTVvK3f?=
 =?us-ascii?Q?eYyGbeGm6X0IyWhQpJJ8+5MNY3kGJLULIqIQXAGGhA3k0KcqU5qKOeMIg3FI?=
 =?us-ascii?Q?OqcCZwkpTSys6qutQ7lm4p0JvhjNHatHtUtdM/pCBavWw9g6EUu78CnpKkMv?=
 =?us-ascii?Q?IPm8aLl2rgSJsqWzGfFjSEa/AjzNRBzbEXOMbgY8XeLZ7+1YejgxSil6FOoA?=
 =?us-ascii?Q?DJMZYDTZjGjcGA8oS0pAor/CxAVN890NaQ+1op0kVy+QGnBKiorsj+qB5I/c?=
 =?us-ascii?Q?F42MB/s9lXSkAbebAq24DLHcVzIhzvNtEGiHf8ZX/1RSJyvV1qqxwk/yO5yO?=
 =?us-ascii?Q?mp7cAhPGivOM/mHBhPL72QqYu6NHP0YUve6zVJnUL2MhoUIscSn+bntB6mhX?=
 =?us-ascii?Q?l8Lgaom28ypvHzghQyfw9r+zpgF92eT71ASEBmFQ+KZkqfmMpuGbw+SKwZF/?=
 =?us-ascii?Q?SnnX0EAw9+USQRtybfodmUf6qWfU8i4xFuyh3jeAFl4eeBSUeE2xsPH/4Ih1?=
 =?us-ascii?Q?LsJKFS0qn5XxbC5X42EmeWo33AUIciYJVs2TlQLUuUHcju7AwfYlDFbTla2h?=
 =?us-ascii?Q?Mj7dKvoXQfchXp6PSQyFhhW9CNvstLyP3qVYD3D+ouYcqPYhKlgvEoLa5iR9?=
 =?us-ascii?Q?7DBVImzRie3TpJ9/y6SH/YjAEJhOn+VflXJoupX/eXG4vRC4FTNcQ14JEIKM?=
 =?us-ascii?Q?Sh1XBRV1agj4L19ez1gS/CfxAa/3Y3qUYJRpRtutQDqmeweQeDuT3z0xevi6?=
 =?us-ascii?Q?HHkK3yVDygzwEo7ZzvcLcxtGmGWErKUCXq/smGMp/c6uD/z93o32b4TVCWvN?=
 =?us-ascii?Q?QS1sx9msH/y2P2DhbhLXnykP11aFJUO7CRdJPVh8veDfiH9x0XX831Y5209m?=
 =?us-ascii?Q?eWMljtAWyFnJJYuy1xgcbY6KePFonCIbUyOdSV/jKxlh5Inl9tcAwtWTNz7G?=
 =?us-ascii?Q?XAMmdL9/yRYNRFQWfYs3C1Tj7hLMUAU/IpufKApxRgvhRX4/1ntCNu3oGTFX?=
 =?us-ascii?Q?+dBksiXVj3y3q5dzpBtASE0KFghlCibk0QmrZ+arXR1IBC0sl7zB4qph9d6I?=
 =?us-ascii?Q?i1f2URX2DVLp8lH8AUUyxRgqZNWuJC8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bf5ff4-b9af-4a54-15dc-08de76280592
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 17:45:39.8650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5ph14nHaIypp+Btmio3Ng8CyUQh/sc51LMj4hC3GzqzLlZXjd9aF6zMa0N+j0OHuH5UxS4MiLr635UrsZeFUUw+rjQixlFUlui7s+A7WP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
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

On Tue, Feb 24, 2026 at 11:00:05AM -0800, Wang, X wrote:
> 
> On 2/24/2026 09:07, himanshu.girotra@intel.com wrote:
> > From: Himanshu Girotra <himanshu.girotra@intel.com>
> > 
> > IGT should treat the kernel as authoritative for PAT configuration
> > rather than replicating platform-specific logic and workaround
> > adjustments in hardcoded tables, which is error-prone as PAT layouts
> > vary across platforms.
> > 
> > For Xe devices, query pat_sw_config from debugfs instead of using
> > hardcoded PAT indices. Remove the Xe-only hardcoded entries and
> > retain the i915 fallback for older platforms.
> > 
> > Drop the now-redundant max_index assert in pat_sanity().
> > 
> > v2: Drop redundant index asserts; instead validate actual PAT register contents for correct cache types (Matt Roper)
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Xin Wang <x.wang@intel.com>
> > Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> > ---
> >   lib/intel_pat.c      | 37 ++++++++++----------
> >   tests/intel/xe_pat.c | 81 ++++++++++++++++++++++++++++++++++++++++----
> >   2 files changed, 94 insertions(+), 24 deletions(-)
> > 
> > diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> > index 9815efc18..8660a2515 100644
> > --- a/lib/intel_pat.c
> > +++ b/lib/intel_pat.c
> > @@ -96,24 +96,27 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
> >   static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
> >   {
> > -	uint16_t dev_id = intel_get_drm_devid(fd);
> > +	uint16_t dev_id;
> > +
> > +	/*
> > +	 * For Xe driver, query the kernel's PAT software configuration
> > +	 * via debugfs. The kernel is the authoritative source for PAT
> > +	 * indices, accounting for platform-specific workarounds
> > +	 * (e.g. Wa_16023588340) at runtime.
> > +	 */
> > +	if (is_xe_device(fd)) {
> > +		int32_t parsed = xe_get_pat_sw_config(fd, pat);
> > +
> > +		igt_assert_f(parsed > 0,
> > +			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
> > +			     parsed);
> > +		return;
> > +	}
> > -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> > -		pat->uc = 3;
> > -		pat->wb = 2;
> > -		pat->max_index = 31;
> > -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> > -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> > -		pat->uc = 3;
> > -		pat->wt = 15; /* Compressed + WB-transient */
> > -		pat->wb = 2;
> > -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> > -		pat->max_index = 31;
> > -
> > -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> > -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> > -			pat->max_index -= 4;
> > -	} else if (IS_METEORLAKE(dev_id)) {
> > +	/* i915 fallback: hardcoded PAT indices */
> Actually, from the very beginning when I modified the intel_pat library,
> I wanted to remove this IGT code
> (https://patchwork.freedesktop.org/series/157481/#rev2).
> However, there was a problem: in the IGT test, the xe_oa test would drop
> root privileges before starting the test. You can see the specific issue
> in the CI.FULL fail case of your first version
> (https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14590/shard-bmg-2/igt@xe_oa@mmio-triggered-reports@oag-0.html).
> I previously tried caching the read pat table to prevent it from being read
> again after
> dropping the root. However, while caching at the library level is advisable,
> cached
> data can become problematic, especially when running on different GPUs.
> Therefore,
> I didn't modify this part. Instead, I validated this data in pat_santiy to
> prevent errors
> caused by not updating it in the IGT in a timely manner.

I think this is really just a bug in the xe_oa test.  The test itself
should be collecting the information it needs (including figuring out
appropriate PAT indices) before it drops privileges and loses access to
that information.

Part of the problem with xe_oa in general is that it isn't even using
the Xe programming model but rather is trying to use the bufops library
which was really intended mostly for i915.  bufops does run on Xe in
order to provide compatibility for display tests and such that need to
execute on both drivers, but if you use it you lose the ability to
directly control buffer mappings (including PAT), synchronization, etc.
because the library tries to handle that all implicitly internally. So
that also means the bufops just isn't compatible with tests like xe_oa
that drop privilege because the library doesn't have the necessary
permissions to perform some of the operations it wants to and doesn't
provide a way for the test to pass in the necessary information.


Matt

> 
> Xin
> 
> 
> > +	dev_id = intel_get_drm_devid(fd);
> > +
> > +	if (IS_METEORLAKE(dev_id)) {
> >   		pat->uc = 2;
> >   		pat->wt = 1;
> >   		pat->wb = 3;
> > diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> > index 21547c84e..6ad6adab7 100644
> > --- a/tests/intel/xe_pat.c
> > +++ b/tests/intel/xe_pat.c
> > @@ -103,6 +103,57 @@ static void userptr_coh_none(int fd)
> >   #define COH_MODE_1WAY		2
> >   #define COH_MODE_2WAY		3
> > +/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
> > +#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
> > +
> > +static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
> > +{
> > +	if (gfx_ver >= IP_VER(20, 0))
> > +		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> > +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> > +
> > +	if (gfx_ver >= IP_VER(12, 70))
> > +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> > +
> > +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 0;
> > +}
> > +
> > +static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
> > +{
> > +	if (gfx_ver >= IP_VER(20, 0)) {
> > +		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
> > +
> > +		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD;
> > +	}
> > +
> > +	if (gfx_ver >= IP_VER(12, 70))
> > +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WB;
> > +
> > +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 3;
> > +}
> > +
> > +static bool pat_entry_is_wt(unsigned int gfx_ver, uint32_t pat)
> > +{
> > +	if (gfx_ver >= IP_VER(20, 0))
> > +		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
> > +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> > +
> > +	if (gfx_ver >= IP_VER(12, 70))
> > +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> > +
> > +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 2;
> > +}
> > +
> > +static bool pat_entry_is_uc_comp(unsigned int gfx_ver, uint32_t pat)
> > +{
> > +	if (gfx_ver >= IP_VER(20, 0))
> > +		return !!(pat & XE2_COMP_EN) &&
> > +		       REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> > +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> > +
> > +	return false;
> > +}
> > +
> >   static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
> >   {
> >   	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
> > @@ -120,13 +171,14 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
> >   static void pat_sanity(int fd)
> >   {
> >   	uint16_t dev_id = intel_get_drm_devid(fd);
> > +	unsigned int gfx_ver = intel_graphics_ver(dev_id);
> >   	struct intel_pat_cache pat_sw_config = {};
> >   	int32_t parsed;
> >   	bool has_uc_comp = false, has_wt = false;
> >   	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
> > -	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> > +	if (gfx_ver >= IP_VER(20, 0)) {
> >   		for (int i = 0; i < parsed; i++) {
> >   			uint32_t pat = pat_sw_config.entries[i].pat;
> >   			if (pat_sw_config.entries[i].rsvd)
> > @@ -144,13 +196,28 @@ static void pat_sanity(int fd)
> >   	} else {
> >   		has_wt = true;
> >   	}
> > -	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
> > -	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
> > -	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
> > +
> > +	/*
> > +	 * Validate that the selected PAT indices actually have the expected
> > +	 * cache types rather than comparing against hardcoded values.
> > +	 */
> > +	igt_assert_f(pat_entry_is_uc(gfx_ver, pat_sw_config.entries[pat_sw_config.uc].pat),
> > +		     "UC index %d does not point to an uncached entry (pat=0x%x)\n",
> > +		     pat_sw_config.uc, pat_sw_config.entries[pat_sw_config.uc].pat);
> > +	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config.wb].pat),
> > +		     "WB index %d does not point to a WB/XA/XD entry (pat=0x%x)\n",
> > +		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
> >   	if (has_wt)
> > -		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
> > -	if (has_uc_comp)
> > -		igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
> > +		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_config.wt].pat),
> > +			     "WT index %d does not point to a WT entry (pat=0x%x)\n",
> > +			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
> > +	if (has_uc_comp) {
> > +		uint32_t uc_comp_pat = pat_sw_config.entries[pat_sw_config.uc_comp].pat;
> > +
> > +		igt_assert_f(pat_entry_is_uc_comp(gfx_ver, uc_comp_pat),
> > +			     "UC_COMP index %d does not point to a compressed UC entry (pat=0x%x)\n",
> > +			     pat_sw_config.uc_comp, uc_comp_pat);
> > +	}
> >   }
> >   /**

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
