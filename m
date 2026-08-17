Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4D9C5DF70
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 09:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350AD10E6FD;
	Mon, 17 Aug 2026 09:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/BWkhtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F2110E6FD
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786960211; x=1818496211;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uCbGuf4Wmc9HYbFW2G4y2VlfcPhr/HqIDID4B6cPH1Q=;
 b=c/BWkhtXKXonr5dwksdmn3Cn2iYcABlMi87i9Fdi27tRFqoFBj35Mxrs
 HeFuw0Xy80MkHDcDUdlpy5EbgBvknIs5ShKzCBDZKm/tBhdWshe7hdacm
 PUI9tWp3VSt3qykBZYaoZZbKrUnA64pCUWj7zCnIlvDQMGALF4P3g34us
 M5cpbUCV5Xqfo+VhH4H0OJMXx+vKLCg8eE9C3uvlyDwlrW8smzTbsx0Kb
 vhTUS9TW6zquExrXsbb0RhHZwcxf6vE7+a16I+2uT+pmzuBBySNBSm2Og
 KFYnMdWx7W+0nwvJ/LaZznzwlCbfUKz3BXXiaM3FncPA3BgoLeMWuBk94 g==;
X-CSE-ConnectionGUID: wko+GOp0S6Cmg0B8AsR2yQ==
X-CSE-MsgGUID: VQh7I9GjQ46YxPPlx4YtdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87307433"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87307433"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:50:11 -0700
X-CSE-ConnectionGUID: 5p5tgkbjQt6pspmQFg0DGA==
X-CSE-MsgGUID: sZqByqOzRGyCJel6kXLObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="258666409"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:50:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Cc: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t v5 0/4] kms_dp_linktrain_fallback: Add UHBR-to-HBR
 fallback subtest
In-Reply-To: <PH7PR11MB679620384BF43A2B334BD04EE5A72@PH7PR11MB6796.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260817082612.1101382-1-sowmiya.s@intel.com>
 <6a1c71f29004da4f88d9f6f0c22128cd735ef06d@intel.com>
 <PH7PR11MB679620384BF43A2B334BD04EE5A72@PH7PR11MB6796.namprd11.prod.outlook.com>
Date: Mon, 17 Aug 2026 12:50:07 +0300
Message-ID: <ed91f89c1aad62372f11e0d4c167e855547665cf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 17 Aug 2026, "S, Sowmiya" <sowmiya.s@intel.com> wrote:
> Hi @Nikula, Jani,
>
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: 17 August 2026 14:32
>> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
>> <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
>> Subject: Re: [PATCH i-g-t v5 0/4] kms_dp_linktrain_fallback: Add UHBR-to-HBR
>> fallback subtest
>> 
>> On Mon, 17 Aug 2026, Sowmiya S <sowmiya.s@intel.com> wrote:
>> > DP 2.x links use 128b/132b channel encoding for UHBR rates
>> > (UHBR10/13.5/20) and 8b/10b for legacy HBR3 and below. The transition
>> > between the two encodings goes through a port-slice reset on the
>> > source side. The existing dp-fallback subtest only covers
>> > 8b/10b-to-8b/10b fallback; this series adds a dedicated subtest for the UHBR-
>> >HBR direction.
>> >
>> > Adds two library helpers to lib/i915/i915_dp:
>> >   - i915_dp_is_uhbr_rate(): mirrors the kernel's drm_dp_is_uhbr_rate()
>> >   - i915_dp_get_next_lower_rate(): parses the force_link_rate debugfs list
>> >     with proper strtok_r/strtol/errno handling
>> 
>> It occurs to me anything named "i915" is misleading here. This is about Intel
>> display shared between the i915 and xe drivers, not specific to
>> i915 alone.
>> 
>> BR,
>> Jani.
>> 
> Agreed on the naming being misleading - but every other function in i915_dp.c/.h already uses the i915_dp_ prefix (i915_dp_get_current_link_rate(), i915_dp_force_link_retrain(), i915_dp_reset_link_params(), etc.), and all of those are used by the same xe-capable tests too. If I rename just these two new functions to intel_dp_* now, the file ends up with two inconsistent naming conventions side by side, which is arguably more confusing than the current single (if misleadingly-named) one.
>
> If you can confirm, I can add these two following the existing i915_dp_ convention for now, and send a separate follow-up patch renaming the whole file's API (and called from other functions) to intel_dp*? 

The long term goal should be to migrate towards driver agnostic naming
for Intel display stuff.

BR,
Jani.


>> >
>> > const char * signature for i915_dp_set_link_params() so string
>> > literals can be passed directly without a writable-array workaround.
>> >
>> > Fixes a pre-existing bug where the file-static
>> > traversed_mst_output_count was never reset between subtests, causing
>> > all MST outputs to be silently skipped as "already visited" in a full-binary run.
>> >
>> > Adds the uhbr-to-hbr-fallback subtest. The subtest pins the link at
>> > the highest sustainable UHBR rate (stepping down if the cable cannot
>> > sustain the sink's max), forces repeated LT_FAILURE_REDUCED_CAPS
>> > failures, and asserts the rate drops below UHBR10. MST topologies are
>> > supported since all siblings share the physical link. The existing
>> > run_lt_fallback_test() is extended with force_uhbr parameter to avoid ~45
>> lines of duplication.
>> >
>> > v2: Resets MST traversal state per test run
>> > v3:
>> >   - Drop "exercising the port slice reset path" from SUBTEST description
>> >   - Revert unrelated cosmetic hunk in setup_mst_outputs()
>> >   - Single UHBR capability gate using i915_dp_get_max_link_rate()
>> >   - remove duplicate gate using i915_dp_get_max_supported_rate()
>> >   - Fix link rate log units (10 kbit/s, not kbps)
>> >   - Add igt_reset_connectors() to pin-loop early-return path
>> >   - Replace UHBR10_LINK_RATE define with i915_dp_is_uhbr_rate() helper
>> >   - Replace open-coded strtok() parsing with i915_dp_get_next_lower_rate()
>> >   - Hard-assert "fallback not reached" instead of returning false
>> >   - Remove dead traversed_mst_output_count reset in run_dsc path
>> >   - Merge run_uhbr_to_hbr_fallback_test() into run_lt_fallback_test()
>> >   - Use "auto" string literal directly (const char * param fix)
>> >   - Move reset before UHBR capability gate read in run_lt_fallback_test()
>> >   - Document force_uhbr parameter and "clear the pin" reset behaviour
>> > v4:
>> >   - name the UHBR10 threshold and make i915_dp_is_uhbr_rate() a
>> >     static inline in the header to avoid a cross-TU call
>> >   - parse intel_dp_allowed_link_configs instead of the source-only
>> >     i915_dp_force_link_rate list in i915_dp_get_next_lower_rate()
>> >   - avoid the implicit long to int narrowing on the return value
>> > v5: commit display reset before fallback
>> >
>> > Sowmiya S (4):
>> >   lib/i915/i915_dp: Add UHBR helpers and const-correct set_link_params
>> >   tests/intel/kms_dp_linktrain_fallback: Reset traversed MST output
>> >     count
>> >   tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback
>> >     subtest
>> >   tests/intel/kms_dp_linktrain_fallback: commit display reset before
>> >     fallback
>> >
>> >  lib/i915/i915_dp.c                      |  58 ++++++-
>> >  lib/i915/i915_dp.h                      |  24 ++-
>> >  tests/intel/kms_dp_linktrain_fallback.c | 202
>> > +++++++++++++++++++++---
>> >  3 files changed, 260 insertions(+), 24 deletions(-)
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
