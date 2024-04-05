Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEF8CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 14:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D1D10EC32;
	Fri,  5 Apr 2024 14:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbO64Ply";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317B8113C3F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712325994; x=1743861994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=quFK8ERcz56yYW78OxbiHplKbc73lYcZ6Sc7kxFufKw=;
 b=JbO64PlyNz3pWe8jbFgWfgMLrUfWl6Ff+6Qluzz0ygTZa1xZ2C6y1lJV
 NtZ1vX560LWGqKze9MN22OHDKtb3kWw0bWv20pf/ha2OXzXo7mwYeg746
 iVc3NHgJ0DfqxJkQAH1z/6FLBnbaOPYr5bL0QW6JXNRoNFQcHlWBC3F/J
 tU7r7G+wv1E3B6TC5Gcz1pAHzRg0ADB/iY/rlZyJ9lfgskwYA9zJGBqZu
 hk8ajWsiUs/QjGFepTJS+P6yk50T8KwD0zStVAv4oQK1ba+6IFLav13m1
 epX/19d6DzFOpRUMd7Cam9VzGcGu2Wwn6XCDlj0QN9HCVFb7Yx4DCkwNY Q==;
X-CSE-ConnectionGUID: 3TVlPLnGR0qc6IROTSTTBw==
X-CSE-MsgGUID: jfxAWOqLRIGAIoMNwd5ZrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19090423"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19090423"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 07:06:34 -0700
X-CSE-ConnectionGUID: Pv6pBEL9SsOXI99af3SvVg==
X-CSE-MsgGUID: 3JClOLnoQgCWibvwKsrnrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23866111"
Received: from unknown (HELO localhost) ([10.245.246.109])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 07:06:32 -0700
Date: Fri, 5 Apr 2024 16:06:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>
Subject: Re: [i-g-t,v2] tests/intel-ci: Addback evict & threads tests to BAT
Message-ID: <ZhAFZWofqs1MZQdO@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>
References: <20240405123154.15406-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240405123154.15406-1-himanshu.girotra@intel.com>
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

On 2024-04-05 at 18:01:54 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> Addback xe_evict and xe_exec_threads to fast feedback testlist to bring
> back the coverage of BAT and reorder testlist so that kms tests run
> before core tests to encounter problem caused by "6.9.0-rc1-xe"
> Regression.
> 
> v2: move evict, threads tests at the end(Rama)
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 138 +++++++++++++----------
>  1 file changed, 80 insertions(+), 58 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index c859acdca..f9dbf5705 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -1,6 +1,64 @@
>  # Should be the first test
>  igt@xe_module_load@load
>  
> +igt@kms_addfb_basic@addfb25-4-tiled
> +igt@kms_addfb_basic@addfb25-bad-modifier
> +igt@kms_addfb_basic@addfb25-modifier-no-flag
> +igt@kms_addfb_basic@addfb25-x-tiled-legacy
> +igt@kms_addfb_basic@addfb25-yf-tiled-legacy
> +igt@kms_addfb_basic@addfb25-y-tiled-legacy
> +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_addfb_basic@bad-pitch-0
> +igt@kms_addfb_basic@bad-pitch-1024
> +igt@kms_addfb_basic@bad-pitch-128
> +igt@kms_addfb_basic@bad-pitch-256
> +igt@kms_addfb_basic@bad-pitch-32
> +igt@kms_addfb_basic@bad-pitch-63
> +igt@kms_addfb_basic@bad-pitch-65536
> +igt@kms_addfb_basic@bad-pitch-999
> +igt@kms_addfb_basic@basic
> +igt@kms_addfb_basic@basic-x-tiled-legacy
> +igt@kms_addfb_basic@bo-too-small
> +igt@kms_addfb_basic@invalid-get-prop
> +igt@kms_addfb_basic@invalid-get-prop-any
> +igt@kms_addfb_basic@invalid-set-prop
> +igt@kms_addfb_basic@invalid-set-prop-any
> +igt@kms_addfb_basic@no-handle
> +igt@kms_addfb_basic@size-max
> +igt@kms_addfb_basic@small-bo
> +igt@kms_addfb_basic@too-high
> +igt@kms_addfb_basic@too-wide
> +igt@kms_addfb_basic@unused-handle
> +igt@kms_addfb_basic@unused-modifier
> +igt@kms_addfb_basic@unused-offsets
> +igt@kms_addfb_basic@unused-pitches
> +igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
> +igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
> +igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
> +igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> +igt@kms_dsc@dsc-basic
> +igt@kms_flip@basic-flip-vs-dpms
> +igt@kms_flip@basic-flip-vs-modeset
> +igt@kms_flip@basic-flip-vs-wf_vblank
> +igt@kms_flip@basic-plain-flip
> +igt@kms_force_connector_basic@force-connector-state
> +igt@kms_force_connector_basic@force-edid
> +igt@kms_force_connector_basic@prune-stale-modes
> +igt@kms_frontbuffer_tracking@basic
> +igt@kms_hdmi_inject@inject-audio
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
> +igt@kms_pipe_crc_basic@hang-read-crc
> +igt@kms_pipe_crc_basic@nonblocking-crc
> +igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> +igt@kms_pipe_crc_basic@read-crc
> +igt@kms_pipe_crc_basic@read-crc-frame-sequence
> +igt@kms_prop_blob@basic
> +igt@kms_psr@psr-primary-page-flip
> +igt@kms_psr@psr-cursor-plane-move
> +igt@kms_psr@psr-sprite-plane-onoff
>  igt@xe_compute@compute-square
>  igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
> @@ -142,64 +200,6 @@ igt@xe_pat@pat-index-xe2
>  igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
> -igt@kms_addfb_basic@addfb25-4-tiled
> -igt@kms_addfb_basic@addfb25-bad-modifier
> -igt@kms_addfb_basic@addfb25-modifier-no-flag
> -igt@kms_addfb_basic@addfb25-x-tiled-legacy
> -igt@kms_addfb_basic@addfb25-yf-tiled-legacy
> -igt@kms_addfb_basic@addfb25-y-tiled-legacy
> -igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> -igt@kms_addfb_basic@bad-pitch-0
> -igt@kms_addfb_basic@bad-pitch-1024
> -igt@kms_addfb_basic@bad-pitch-128
> -igt@kms_addfb_basic@bad-pitch-256
> -igt@kms_addfb_basic@bad-pitch-32
> -igt@kms_addfb_basic@bad-pitch-63
> -igt@kms_addfb_basic@bad-pitch-65536
> -igt@kms_addfb_basic@bad-pitch-999
> -igt@kms_addfb_basic@basic
> -igt@kms_addfb_basic@basic-x-tiled-legacy
> -igt@kms_addfb_basic@bo-too-small
> -igt@kms_addfb_basic@invalid-get-prop
> -igt@kms_addfb_basic@invalid-get-prop-any
> -igt@kms_addfb_basic@invalid-set-prop
> -igt@kms_addfb_basic@invalid-set-prop-any
> -igt@kms_addfb_basic@no-handle
> -igt@kms_addfb_basic@size-max
> -igt@kms_addfb_basic@small-bo
> -igt@kms_addfb_basic@too-high
> -igt@kms_addfb_basic@too-wide
> -igt@kms_addfb_basic@unused-handle
> -igt@kms_addfb_basic@unused-modifier
> -igt@kms_addfb_basic@unused-offsets
> -igt@kms_addfb_basic@unused-pitches
> -igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
> -igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
> -igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
> -igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> -igt@kms_dsc@dsc-basic
> -igt@kms_flip@basic-flip-vs-dpms
> -igt@kms_flip@basic-flip-vs-modeset
> -igt@kms_flip@basic-flip-vs-wf_vblank
> -igt@kms_flip@basic-plain-flip
> -igt@kms_force_connector_basic@force-connector-state
> -igt@kms_force_connector_basic@force-edid
> -igt@kms_force_connector_basic@prune-stale-modes
> -igt@kms_frontbuffer_tracking@basic
> -igt@kms_hdmi_inject@inject-audio
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
> -igt@kms_pipe_crc_basic@hang-read-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc
> -igt@kms_pipe_crc_basic@read-crc-frame-sequence
> -igt@kms_prop_blob@basic
> -igt@kms_psr@psr-primary-page-flip
> -igt@kms_psr@psr-cursor-plane-move
> -igt@kms_psr@psr-sprite-plane-onoff
>  
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the
> @@ -235,3 +235,25 @@ igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch
>  igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch
>  igt@xe_exec_fault_mode@twice-invalid-fault
>  igt@xe_exec_fault_mode@twice-invalid-userptr-fault
> +igt@xe_exec_threads@threads-basic
> +igt@xe_exec_threads@threads-mixed-basic
> +igt@xe_exec_threads@threads-mixed-shared-vm-basic
> +igt@xe_exec_threads@threads-mixed-fd-basic
> +igt@xe_exec_threads@threads-mixed-userptr-invalidate
> +igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
> +igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
> +igt@xe_evict@evict-beng-small
> +igt@xe_evict@evict-beng-small-cm
> +igt@xe_evict@evict-beng-small-external
> +igt@xe_evict@evict-beng-small-external-cm
> +igt@xe_evict@evict-beng-small-multi-vm
> +igt@xe_evict@evict-cm-threads-small
> +igt@xe_evict@evict-mixed-threads-small
> +igt@xe_evict@evict-mixed-threads-small-multi-vm
> +igt@xe_evict@evict-small
> +igt@xe_evict@evict-small-cm
> +igt@xe_evict@evict-small-external
> +igt@xe_evict@evict-small-external-cm
> +igt@xe_evict@evict-small-multi-vm
> +igt@xe_evict@evict-small-multi-vm-cm
> +igt@xe_evict@evict-threads-small
