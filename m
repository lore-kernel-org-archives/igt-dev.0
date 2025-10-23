Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5592CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 10:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2F310E3B6;
	Thu, 23 Oct 2025 10:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kK8Jef9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A558F10E3B6;
 Thu, 23 Oct 2025 10:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761216000; x=1792752000;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2sOqRB68ytHFriJxEcKV3H2YbaeRl4Wh6dcnlIp4q+I=;
 b=kK8Jef9Eh/o3uslfBZEj1OQmBo6pChEvSffABcY2oZWRiQmoQn7Ohoaz
 /6os3DpjaCH2GYd565+cTX0VdiiEtaao15zqbV5X394Uazxo+8swSa16z
 q+JTp1jnglSBEJn/eIIth3hOUBkYiJZbPP1OpPntV9e8v2ur6rzO98D9Q
 k3TJhEZwZ1Al7EjF1n0CvVFETYuCROdAbiD9a3OGm65eDXKvP8ouToyIO
 BAzFLY5Y2tSLreEF0n3rISAXZMncPRw5llesI96qQvI5qSvUrdDUUQHA9
 kisex1uabDSRV4h9Xy1EfSgS8PGoOuM0rdw7SKSMjJ0YCU954TMU+UHMa A==;
X-CSE-ConnectionGUID: ijayQ94GQf6+oHiugUB8JQ==
X-CSE-MsgGUID: 1E8JHHcYS5O0mQ61gh28Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74727782"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="74727782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:39:59 -0700
X-CSE-ConnectionGUID: Y85ykr/eSM6hTfyON3+9Mw==
X-CSE-MsgGUID: e8+IO18USlebURu6Jx97HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184192635"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:39:58 -0700
Date: Thu, 23 Oct 2025 12:39:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_exec_reset: Fix uninitialized var
Message-ID: <20251023103956.mfnysvbptcftjc4y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251022114655.70478-1-kamil.konieczny@linux.intel.com>
 <176118617289.44373.5938289983654466044@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176118617289.44373.5938289983654466044@97596180aaec>
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

Hi igt-dev,
On 2025-10-23 at 02:22:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_reset: Fix uninitialized var
> URL   : https://patchwork.freedesktop.org/series/156333/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17406_full -> IGTPW_13928_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13928_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13928_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13928/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13928_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-edp1:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17406/shard-mtlp-7/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13928/shard-mtlp-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-edp1.html
> 
>   * igt@kms_setmode@basic:
>     - shard-snb:          [PASS][3] -> [FAIL][4] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17406/shard-snb7/igt@kms_setmode@basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13928/shard-snb5/igt@kms_setmode@basic.html
> 

Unrelated to Xe test change,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17406_full and IGTPW_13928_full:
> 
> ### New IGT tests (99) ###
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.06, 0.12] s
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_optimistic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.14] s
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.17] s
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.12] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_align32:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_align64:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_debug:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_highest:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_init:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_lowest:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.06, 0.15] s
> 
>   * igt@kms_selftest@drm_cmdline_parser:
>     - Statuses : 6 fail(s)
>     - Exec time: [3.17, 5.19] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_extra_and_option:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.08, 0.13] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_dvi:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_hdmi:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_not_digital:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_e_only:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.06, 0.11] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_freestanding_force_e_and_options:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_freestanding_options:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_hmirror:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid:
>     - Statuses : 6 fail(s)
>     - Exec time: [0.12, 0.15] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_margin_options:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_multiple_options:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.10] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_bpp:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_bpp_option:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.06, 0.10] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_option:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_panel_orientation:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.13] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.13] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_off:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.06, 0.13] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on_analog:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on_digital:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_interlaced:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_margins:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_margins_force_on:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.15] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_rblank:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.13] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_refresh:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.06, 0.12] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa_margins:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.06, 0.15] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa_rblank:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.13] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_180:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_270:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_90:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options:
>     - Statuses : 6 fail(s)
>     - Exec time: [0.08, 0.14] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_vmirror:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.13] s
> 
>   * igt@kms_selftest@drm_damage_helper:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.50, 2.34] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.13] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_one_intersect:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_one_outside:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.06, 0.11] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_src_moved:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_fractional_src:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_fractional_src_moved:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.06, 0.14] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.10] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_not_visible:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.09] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_src_moved:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.06, 0.11] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_fractional_src:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.11] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_fractional_src_moved:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.06, 0.12] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_fractional_src:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.10] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_outside_fractional_src:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.08, 0.11] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_outside_src:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.12] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.13] s
> 
>   * igt@kms_selftest@drm_dp_mst_helper:
>     - Statuses : 7 fail(s)
>     - Exec time: [0.29, 0.52] s
> 
>   * igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_calc_pbn_mode:
>     - Statuses : 7 fail(s)
>     - Exec time: [0.09, 0.16] s
> 
>   * igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode:
>     - Statuses : 7 fail(s)
>     - Exec time: [0.08, 0.15] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.12] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_one_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.05, 0.10] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_three_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.14] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_tiled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.11] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_two_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.14] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.05, 0.14] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_one_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.13] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_three_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.10] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_tiled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.12] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_two_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.15] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.12] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_16bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.13] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.12] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_32bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.14] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_8bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.10] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.13] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.14] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.15] s
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - Statuses : 7 abort(s)
>     - Exec time: [0.0, 0.71] s
> 
>   * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
>     - Statuses : 1 abort(s) 6 fail(s)
>     - Exec time: [0.17, 0.39] s
> 
>   * igt@kms_selftest@drm_plane_helper:
>     - Statuses : 6 fail(s)
>     - Exec time: [0.17, 0.30] s
> 
>   * igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state:
>     - Statuses : 6 fail(s)
>     - Exec time: [0.08, 0.14] s
> 
>   * igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state:
>     - Statuses : 6 fail(s)
>     - Exec time: [0.09, 0.15] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13928_full that come from known issues:
> 
> ### IGT changes ###

...cut...

