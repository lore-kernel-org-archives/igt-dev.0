Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12783EB1050
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 14:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AE410E147;
	Tue, 10 Mar 2026 14:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERxujZgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1140610E147;
 Tue, 10 Mar 2026 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773153303; x=1804689303;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BKgFIA2y5PcybNcy1dDNPwSetYynxQfnRiS57Qp5qAc=;
 b=ERxujZgwhlZfquudUfqDiZC7Z1Yo1ODXP3zge5rCEV7XKz9XKrkjRRq8
 5CCXCd1BtIgYqVoxK8qy03bSl5z0aHNOijIdhaBU+aBFdbcC5p5bWidng
 IlxfD99bjkzslgRPKK2PxydL/g2oc7CjDIrJ3mJe7JHuPOPZi9/N1lm0w
 FnWWtNF02/7O8N+9LevX3S5C5mYuuEPuHJPWFWIJ6QvYNYmRjvz9P+So0
 nzvMxSstC5JKohbxQb+GC4UVFpMZlVAYRwSc9RXHKq2Od/nYVRIOONzD1
 06JMVMMF2atFRGofdcoAAsWNOrUSYpEZW/2smO+b9GNrEZ6Vc4NCbOXGx Q==;
X-CSE-ConnectionGUID: sxdG9pjcRcCHDa5VXzTZZw==
X-CSE-MsgGUID: scIFUVIHRFqXm3wRiws0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85556127"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85556127"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 07:35:03 -0700
X-CSE-ConnectionGUID: qlPslEtnSFi7wVoauA8xYg==
X-CSE-MsgGUID: mTdI8Qp0TKKDMdup8dVd6Q==
X-ExtLoop1: 1
Received: from wtcline-desk20.amr.corp.intel.com (HELO localhost)
 ([10.245.246.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 07:35:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for lib/i915/fbc:
 switch the interface from pipe to CRTC (rev2)
In-Reply-To: <177314726572.338934.3819735917217243499@a3b018990fe9>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260309164225.716195-1-jani.nikula@intel.com>
 <177314726572.338934.3819735917217243499@a3b018990fe9>
Date: Tue, 10 Mar 2026 16:34:58 +0200
Message-ID: <1168d882aab206c78d4ea9586ad4b2373a2c8353@intel.com>
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

On Tue, 10 Mar 2026, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: lib/i915/fbc: switch the interface from pipe to CRTC (rev2)
> URL   : https://patchwork.freedesktop.org/series/162888/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_8789 -> IGTPW_14714
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_14714 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14714, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14714/index.html
>
> Participating hosts (40 -> 38)
> ------------------------------
>
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_14714:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@gem_exec_fence@basic-busy@rcs0:
>     - bat-mtlp-9:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8789/bat-mtlp-9/igt@gem_exec_fence@basic-busy@rcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14714/bat-mtlp-9/igt@gem_exec_fence@basic-busy@rcs0.html

Please re-report, this is unrelated.

BR,
Jani.

>
>   
> Known issues
> ------------
>
>   Here are the changes found in IGTPW_14714 that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@i915_module_load@load:
>     - fi-bsw-n3050:       [PASS][3] -> [DMESG-WARN][4] ([i915#15498])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8789/fi-bsw-n3050/igt@i915_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14714/fi-bsw-n3050/igt@i915_module_load@load.html
>
>   * igt@i915_selftest@live:
>     - bat-dg2-8:          [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8789/bat-dg2-8/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14714/bat-dg2-8/igt@i915_selftest@live.html
>
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-tgl-1115g4:      [PASS][7] -> [FAIL][8] ([i915#14867])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8789/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14714/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
>
>   * igt@kms_pipe_crc_basic@read-crc:
>     - fi-cfl-8109u:       [PASS][9] -> [DMESG-WARN][10] ([i915#15673]) +48 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8789/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14714/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
>
>   
> #### Possible fixes ####
>
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [DMESG-FAIL][11] ([i915#12061]) -> [PASS][12] +1 other test pass
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8789/bat-mtlp-8/igt@i915_selftest@live.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14714/bat-mtlp-8/igt@i915_selftest@live.html
>
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#14867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867
>   [i915#15498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15498
>   [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
>
>
> Build changes
> -------------
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8789 -> IGTPW_14714
>
>   CI-20190529: 20190529
>   CI_DRM_18116: 77e176657e782bb81270c230d1cfec91f7707162 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14714: 14714
>   IGT_8789: 8789
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14714/index.html

-- 
Jani Nikula, Intel
