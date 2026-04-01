Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A031D35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40F410EA55;
	Wed,  1 Apr 2026 11:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKvPQcNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A0C10E3A3
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775042481; x=1806578481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RLADK2jR3/mtOAaaCeYuUhfyMl0BTBUBbjqlyB11MnI=;
 b=DKvPQcNyvNz/1XM10KfKrLIlLaoDIMEByNqUF6rF4r03z2sOwOLQGEu/
 Py2mE7EBY1pV+t1BlR8Wn0JpPyYqbOP1gL208FAVnUMlp7T2oFquw8zA+
 KPG+Y0e9yj08GMedq8Qbscp1Q7AiVCikKQCYKfjSnMB5wrD5IvzFqnTpY
 hgONCe54f9fQHxJHvWJv0197cMUHE8FC6e9I3RgNbQ68genn2qWdYOEJl
 kcomOgUcI4QRDQi2tN5xXR+MItA6FiXmomWbC6zJ0DxJHI89nbYmuFMFh
 j2PHWcHv5V/jxFlIQEK5qhpaTpdt/hTb0M1LetObuUOPEf1Y7xJhHBtwS w==;
X-CSE-ConnectionGUID: 13c5nL8HTIGCPTKl1jP4lw==
X-CSE-MsgGUID: 0rSwXfC8Sg+hd2PSVr37BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87466186"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87466186"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:21:21 -0700
X-CSE-ConnectionGUID: d4gvOM6oT1SZqCRRggpTBQ==
X-CSE-MsgGUID: OPZgw6wfSWiVBRVXG4UZ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231063987"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.206])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:21:19 -0700
Date: Wed, 1 Apr 2026 13:21:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Wang, X" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v5 4/4] tests/xe_pat: Verify PAT entries contain
 expected values
Message-ID: <4btf4v4wig7xudqhl7ritew5qjsr6y5vt6hj54l4jkuiwtmplc@nisikzbtd4ug>
References: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
 <20260331140541.2561104-10-zbigniew.kempczynski@intel.com>
 <c33f51c3-9dd1-429b-b1d9-d487ffebda95@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c33f51c3-9dd1-429b-b1d9-d487ffebda95@intel.com>
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

On Tue, Mar 31, 2026 at 02:20:12PM -0700, Wang, X wrote:
> 
> On 3/31/2026 07:05, Zbigniew Kempczyński wrote:
> > Debugfs exposes PAT entries for different GTs so verify they
> > contain expected values. Verify they are correct also in reset
> > and suspend scenarios.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > v4: Test is rewritten to support PAT + PTA + ATS entries.
> > ---
> >   tests/intel/xe_pat.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 79 insertions(+)
> > 
> > diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> > index 2e2d7e01e7..4fbe2714ad 100644
> > --- a/tests/intel/xe_pat.c
> > +++ b/tests/intel/xe_pat.c
> > @@ -238,6 +238,76 @@ static void pat_sanity(int fd)
> >   	}
> >   }
> > +enum pat_test_opts {
> > +	PAT_CHECK = 1,
> > +	PAT_RESET_GT = 2,
> > +	PAT_SUSPEND = 3,
> > +};
> > +
> > +/**
> > + * SUBTEST: pat-sw-hw-compare
> > + * Description: verify debugfs 'pat' reflects 'pat_sw_config'
> > + *
> > + * SUBTEST: pat-sw-hw-reset-compare
> > + * Description: verify debugfs 'pat' reflects 'pat_sw_config' after gt reset
> > + *
> > + * SUBTEST: pat-sw-hw-suspend
> > + * Description: verify debugfs 'pat' reflects 'pat_sw_config' after suspend
> > + */
> > +static void pat_sw_hw_compare(int fd, enum pat_test_opts opts)
> > +{
> > +	bool matches = true;
> > +	int gt;
> > +
> > +	xe_for_each_gt(fd, gt) {
> > +		struct intel_pat_cache pat_hw_config = {};
> > +		struct intel_pat_cache pat_sw_config = {};
> > +		int hw_entries, sw_entries;
> > +
> > +		if (opts == PAT_RESET_GT)
> > +			xe_force_gt_reset_sync(fd, gt);
> > +		else if (opts == PAT_SUSPEND)
> > +			igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
> > +
> > +		hw_entries = xe_get_pat_hw_config(fd, &pat_hw_config, gt);
> > +		sw_entries = xe_get_pat_sw_config(fd, &pat_sw_config, gt);
> > +		igt_assert_eq(hw_entries, sw_entries);
> > +

Thank you for the comments.

> I think there might be two issues with this block:
> 1. False success on read failure: if an incorrect KMD is used or the
> debugfs file fails to read, both hw_entries and sw_entries may return
> -1. In that case, igt_assert_eq(hw_entries, sw_entries) would still
> pass, silently masking the underlying failure.

In case of incorrect KMD I prefer to fail, not to skip. I think adding
asserts which expects hw_entries > 0 and sw_entries > 0 will detect
such case (you're right, eq is not enough.


> 2. SRIOV compatibility: when running under SRIOV, hw_entries = -1
> since the HW PAT table may not be readable, causing the test to fail
> unnecessarily.
> Would it make sense to use igt_skip_on_f() when hw_entries returns -1?
> That way the test is skipped rather than silently passing or failing
> with a potentially misleading result.

I think this check should skip on !pf:

igt_require(igt_sriov_is_pf(fd));

--
Zbigniew

> 
> Xin
> > +		igt_debug("[GT%d] hw_entries: %d, sw_entries: %d\n", gt, hw_entries, sw_entries);
> > +
> > +		for (int i = 0; i < hw_entries; i++) {
> > +			uint32_t hw_pat, sw_pat;
> > +
> > +			hw_pat = pat_hw_config.entries[i].pat;
> > +			sw_pat = pat_sw_config.entries[i].pat;
> > +			if (hw_pat != sw_pat) {
> > +				igt_debug("[GT%d] Mismatch of pat register vs sw config "
> > +					  "- index: %i, entries: %08x <> %08x\n",
> > +					  gt, i, hw_pat, sw_pat);
> > +				matches = false;
> > +			}
> > +		}
> > +
> > +		/* Check PTA if was explicitly programmed */
> > +		if (pat_sw_config.pta_mode != UINT32_MAX &&
> > +			pat_hw_config.pta_mode != pat_sw_config.pta_mode) {
> > +			igt_debug("[GT%d] Mismatch of PTA_MODE - pta: %x, pta expected: %x\n",
> > +				  gt, pat_hw_config.pta_mode, pat_sw_config.pta_mode);
> > +			matches = false;
> > +		}
> > +
> > +		/* Check ATS if was explicitly programmed */
> > +		if (pat_sw_config.pat_ats != UINT32_MAX &&
> > +			pat_hw_config.pat_ats != pat_sw_config.pat_ats) {
> > +			igt_debug("[GT%d] Mismatch of PAT_ATS - ats: %x, ats expected: %x\n",
> > +				  gt, pat_hw_config.pat_ats, pat_sw_config.pat_ats);
> > +			matches = false;
> > +		}
> > +	}
> > +
> > +	igt_assert_eq(matches, true);
> > +}
> > +
> >   /**
> >    * SUBTEST: pat-index-all
> >    * Test category: functionality test
> > @@ -2152,6 +2222,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
> >   	igt_subtest("pat-sanity")
> >   		pat_sanity(fd);
> > +	igt_subtest("pat-sw-hw-compare")
> > +		pat_sw_hw_compare(fd, 0);
> > +
> > +	igt_subtest("pat-sw-hw-reset-compare")
> > +		pat_sw_hw_compare(fd, PAT_RESET_GT);
> > +
> > +	igt_subtest("pat-sw-hw-suspend")
> > +		pat_sw_hw_compare(fd, PAT_SUSPEND);
> > +
> >   	igt_subtest("pat-index-all")
> >   		pat_index_all(fd);
