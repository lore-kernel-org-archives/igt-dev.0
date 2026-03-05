Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB98AF30946
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 12:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3F510EB53;
	Thu,  5 Mar 2026 12:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGr7Y9fu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7996A10EB53
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772714914; x=1804250914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QzCUe25C7e5O33fBQ75NsDK21mVxlxhEL0gXRbQRrWk=;
 b=VGr7Y9fuBES2xCtwUU9ARdAPQrPdqTTG0dSlLfDyZHaOkCwDkSq+spX7
 4pkVqXtUQe08Fq+0SctKiXCuKHil+VvU0Be5K9PeqNSn090WovI7keeh7
 vOnCPLxZSGX7D+05GtcIeqo1q1s7cKKspxVwdaIGlaj41Lqo3Pz8QqwYD
 AE+vHZY7FYn8luKXc7+5oE67jq5GWbRferwV/X49jHoeRqUkpp83fCa8d
 elBOrnCV5SNqBiRjnqabvPboPl4xhNHLXnCiySjOzTK/XqfdjHzaNSkwl
 j1ZQaqOTb/GezFe4+6PmD+/j+LONE4P0UbvRrg3Rd+nS0Yb/zLzKXOYiY A==;
X-CSE-ConnectionGUID: omc28+naTOGGZBNy9NzVNA==
X-CSE-MsgGUID: d5MJ7WUTTC2ctotRmwusWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85273145"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="85273145"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:48:34 -0800
X-CSE-ConnectionGUID: lAxqLl4WQvSrjBfG5orC7A==
X-CSE-MsgGUID: qruPzAwPSturw4MqbDdhjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218807241"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.31])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:48:32 -0800
Date: Thu, 5 Mar 2026 13:48:29 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: "Sharma, Nishit" <nishit.sharma@intel.com>, 
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe"
Message-ID: <ljwf3d6umvacbwlaohpphkbx2apcp4gdztcf7fqhsadafrxse5@dkntriwzboki>
References: <20260305003047.2290389-1-ashutosh.dixit@intel.com>
 <MW4PR11MB71513EA99A9655ED36977DD5E47DA@MW4PR11MB7151.namprd11.prod.outlook.com>
 <20260305040517.GM4694@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305040517.GM4694@mdroper-desk1.amr.corp.intel.com>
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

On Wed, Mar 04, 2026 at 08:05:17PM -0800, Matt Roper wrote:
> On one hand, we shouldn't let buggy tests dictate IGT library behavior
> and prevent us from developing the libraries that we need across the
> entire codebase.  But on the other hand, we also don't want to leave
> individual tests that we have in CI in a failing state with no
> documented plans on how to fix things.

I agree with Ashutosh. We shouldn't allow to merge code which breaks
another one regardless intention and necessity to expand the library.

> 
> If a fix of xe_oa is easy, then we should develop that immediately (and
> if we'd done that early we probably could even have submitted it in the
> same series as the library changes so that they'd go in together). But
> in this case the issues with the xe_oa test are a bit deeper and
> probably non-trivial to fix:
> 
>  * Some of the tests are just plain wrong.  E.g., rather than checking
>    for the behavior expected by userspace (e.g., "can I access this
>    register for read/write as expected?") they're checking internal
>    implementation details that userspace has no business being aware of
>    in the first place ("is this register specifically programmed in the
>    FORCE_TO_NONPRIV registers?") and what they're trying to confirm is
>    itself incorrect (and will fail once we make some fixes on the KMD
>    side).

Fully agree.

> 
>  * Other tests are logically correct at the high-level, but rather than
>    being written as a proper Xe test that uses the Xe interfaces that
>    real userspace would, they're using an IGT library that's mostly
>    intended for display tests that need to run on both i915 and Xe.
>    Since important uapi details like PAT index don't exist on i915,
>    they're not part of this library's interface and thus the test can't
>    pick the values it wants and pass them in; instead the library
>    handles them implicitly internally.  That's fine for tests that are
>    running as root, but once we stopped hardcoding magic numbers into
>    the library, there was an implicit requirement that the test calling
>    the library have root privilege to access debugfs --- since the xe_oa
>    test drops privileges, this doesn't work.

You may blame me for this. When xe was initially released we had to
enable kms tests and easiest part was to adopt previous library to
support xe. I didn't know the answer for the question how long will
we support both drivers and keeping some compatibility layer was
imo only reasonable choice. Differencies between drivers may be more
or less addressed, but when we want to fully control what we're doing
library not always is the best choice.

> 
>  * Even the tests that are 100% functionally correct are still hard to
>    follow because the i915-compatibility libraries are trying to cobble
>    together something that works across a couple decades worth of i915
>    uapi evolution, followed by a switch to an entirely different driver.
>    For pure-Xe tests we really need to cut out all the unnecessary
>    compatibility layers so that it's clear what a test is doing and so
>    that it can be accurately debugged if/when it reports failures.

xe_oa uses render-copy, so it's not so easy to detach from intel_bb
library.

> 
> So maybe in the short term we need to blacklist the test to prevent CI
> from trying to run it, and then as the test gets rewritten to fix its
> issues the various subtests can be removed from the blacklist to let
> them start running again?
> 
> Another option which might be quicker in the short term would be to add
> a new library function like "intel_bb_prepare_to_drop_priv()" which
> could be called at the beginning of any test using intel_bb that plans
> to drop privileges so that the library can grab all the necessary
> details from debugfs while it still has root powers and cache them
> internally.  Then it could use that internal cache later once it has
> dropped privilege and can no longer get values directly from debugfs.
> But I don't know if we really want to add a new interface to the
> intel_bb library's house of cards if we really want to re-write the test
> anyway.

ATM I think simplest would be to to add drop function you've mentioned.
Unless someone will provide render-copy replacement.

We already started to go toward intel-bb free implementation for common
part (blitter) in intel_blt. It still contains some old code reference
(intel_ctx) but this can be removed or replaced with xe-only code.

--
Zbigniew

> 
> 
> Matt
> 
> On Wed, Mar 04, 2026 at 06:27:43PM -0800, Sharma, Nishit wrote:
> > Hi Ashutosh,
> > 
> > I understand the concern but the xe_pat patch was reviewed and +1 given by MattR and with reasoning regarding xe_oa https://patchwork.freedesktop.org/patch/706754/?series=161927&rev=2
> > Hence, we went ahead with the merge. In case if you feel it's major regression a partial revert of lib changes can be done.
> > 
> > Regards
> > Nishit
> > 
> > -----Original Message-----
> > From: Dixit, Ashutosh <ashutosh.dixit@intel.com> 
> > Sent: Thursday, March 5, 2026 6:01 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Girotra, Himanshu <himanshu.girotra@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> > Subject: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe"
> > 
> > This reverts commit 4e59b8e7779b04ba982cd5b17c023511ee2f0ed7.
> > 
> > This patch caused a major regression in xe_oa tests and should not have been merged. Revert for now and re-merge after the regression is fixed.
> > 
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  lib/intel_pat.c      | 37 ++++++++++----------
> >  tests/intel/xe_pat.c | 80 ++++----------------------------------------
> >  2 files changed, 24 insertions(+), 93 deletions(-)
> > 
> > diff --git a/lib/intel_pat.c b/lib/intel_pat.c index 8660a25153..9815efc187 100644
> > --- a/lib/intel_pat.c
> > +++ b/lib/intel_pat.c
> > @@ -96,27 +96,24 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
> >  
> >  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)  {
> > -	uint16_t dev_id;
> > -
> > -	/*
> > -	 * For Xe driver, query the kernel's PAT software configuration
> > -	 * via debugfs. The kernel is the authoritative source for PAT
> > -	 * indices, accounting for platform-specific workarounds
> > -	 * (e.g. Wa_16023588340) at runtime.
> > -	 */
> > -	if (is_xe_device(fd)) {
> > -		int32_t parsed = xe_get_pat_sw_config(fd, pat);
> > -
> > -		igt_assert_f(parsed > 0,
> > -			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
> > -			     parsed);
> > -		return;
> > -	}
> > -
> > -	/* i915 fallback: hardcoded PAT indices */
> > -	dev_id = intel_get_drm_devid(fd);
> > +	uint16_t dev_id = intel_get_drm_devid(fd);
> >  
> > -	if (IS_METEORLAKE(dev_id)) {
> > +	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> > +		pat->uc = 3;
> > +		pat->wb = 2;
> > +		pat->max_index = 31;
> > +	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> > +		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> > +		pat->uc = 3;
> > +		pat->wt = 15; /* Compressed + WB-transient */
> > +		pat->wb = 2;
> > +		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> > +		pat->max_index = 31;
> > +
> > +		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> > +		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> > +			pat->max_index -= 4;
> > +	} else if (IS_METEORLAKE(dev_id)) {
> >  		pat->uc = 2;
> >  		pat->wt = 1;
> >  		pat->wb = 3;
> > diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index ab519aab0f..21547c84e7 100644
> > --- a/tests/intel/xe_pat.c
> > +++ b/tests/intel/xe_pat.c
> > @@ -103,55 +103,6 @@ static void userptr_coh_none(int fd)
> >  #define COH_MODE_1WAY		2
> >  #define COH_MODE_2WAY		3
> >  
> > -/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
> > -#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
> > -
> > -static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat) -{
> > -	if (gfx_ver >= IP_VER(20, 0))
> > -		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> > -		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> > -
> > -	if (gfx_ver >= IP_VER(12, 70))
> > -		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> > -
> > -	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 0;
> > -}
> > -
> > -static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat) -{
> > -	if (gfx_ver >= IP_VER(20, 0)) {
> > -		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
> > -
> > -		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD;
> > -	}
> > -
> > -	if (gfx_ver >= IP_VER(12, 70))
> > -		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WB;
> > -
> > -	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 3;
> > -}
> > -
> > -static bool pat_entry_is_wt(unsigned int gfx_ver, uint32_t pat) -{
> > -	if (gfx_ver >= IP_VER(20, 0))
> > -		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
> > -		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> > -
> > -	if (gfx_ver >= IP_VER(12, 70))
> > -		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> > -
> > -	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 2;
> > -}
> > -
> > -static bool pat_entry_is_compressed(unsigned int gfx_ver, uint32_t pat) -{
> > -	if (gfx_ver < IP_VER(20, 0))
> > -		return false;
> > -
> > -	return !!(pat & XE2_COMP_EN);
> > -}
> > -
> >  static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)  {
> >  	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config); @@ -169,14 +120,13 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)  static void pat_sanity(int fd)  {
> >  	uint16_t dev_id = intel_get_drm_devid(fd);
> > -	unsigned int gfx_ver = intel_graphics_ver(dev_id);
> >  	struct intel_pat_cache pat_sw_config = {};
> >  	int32_t parsed;
> >  	bool has_uc_comp = false, has_wt = false;
> >  
> >  	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
> >  
> > -	if (gfx_ver >= IP_VER(20, 0)) {
> > +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> >  		for (int i = 0; i < parsed; i++) {
> >  			uint32_t pat = pat_sw_config.entries[i].pat;
> >  			if (pat_sw_config.entries[i].rsvd)
> > @@ -194,29 +144,13 @@ static void pat_sanity(int fd)
> >  	} else {
> >  		has_wt = true;
> >  	}
> > -
> > -	/*
> > -	 * Validate that the selected PAT indices actually have the expected
> > -	 * cache types rather than comparing against hardcoded values.
> > -	 */
> > -	igt_assert_f(pat_entry_is_uc(gfx_ver, pat_sw_config.entries[pat_sw_config.uc].pat),
> > -		     "UC index %d does not point to an uncached entry (pat=%#x)\n",
> > -		     pat_sw_config.uc, pat_sw_config.entries[pat_sw_config.uc].pat);
> > -	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config.wb].pat),
> > -		     "WB index %d does not point to a WB/XA/XD entry (pat=%#x)\n",
> > -		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
> > +	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
> > +	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
> > +	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
> >  	if (has_wt)
> > -		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_config.wt].pat),
> > -			     "WT index %d does not point to a WT entry (pat=%#x)\n",
> > -			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
> > -	if (has_uc_comp) {
> > -		uint32_t uc_comp_pat = pat_sw_config.entries[pat_sw_config.uc_comp].pat;
> > -
> > -		igt_assert_f(pat_entry_is_compressed(gfx_ver, uc_comp_pat) &&
> > -			     pat_entry_is_uc(gfx_ver, uc_comp_pat),
> > -			     "UC_COMP index %d does not point to a compressed UC entry (pat=%#x)\n",
> > -			     pat_sw_config.uc_comp, uc_comp_pat);
> > -	}
> > +		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
> > +	if (has_uc_comp)
> > +		igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
> >  }
> >  
> >  /**
> > --
> > 2.48.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
