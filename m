Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB80F4BB6D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 18:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D80F10E614;
	Tue, 24 Feb 2026 18:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJDVsQWv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541CB10E611;
 Tue, 24 Feb 2026 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771957846; x=1803493846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o0IBbWIt1o9YFF2Gh2GN6mvK+5c6/37AbaCAEXnV8V8=;
 b=aJDVsQWvBrAPR93aZCPRDk5MF7vPULthByLJxGLgMxUIFD7xWGCu/5Jo
 hOkerE/s5KVcrZFoWFsWubaxA+5LNyy6mzXf6//29RKlgtyl530uyfKXc
 8O9QPzvWrtzkMFhojPl1Kt+gHFjUIvzb3q4CyTqfVp4BuWsq3Az7rWbHQ
 TWANE8ZyBAmW99Nu042MqOQWdjJhwupeHmZe/++9iALNgDtJiNnVE8ud7
 zy8J8Y213gT8lxwmjU3NVVHD7fT2SHwTXAMVA7XN94W7Op/j1G+jhonWn
 IDizlD5cI/56oW5mH2MgkHBY8GncIyjicclJ1KzKpwMilyj30PGhXgnrB w==;
X-CSE-ConnectionGUID: N5V7eSr4Q32LCYdP+JZepA==
X-CSE-MsgGUID: dCIuiULvRzyWf6AgfQc5uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73026446"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="73026446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:30:46 -0800
X-CSE-ConnectionGUID: S+aYSNOUS9WYfScsrbX/VA==
X-CSE-MsgGUID: JyRwZuYmTdmexl1LYcT4KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215090887"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 10:30:45 -0800
Date: Tue, 24 Feb 2026 19:30:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@google.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/kms_colorop: Include local glib header for Android
Message-ID: <20260224183042.iwncmmsiysxa74hx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260223164151.3307217-1-markyacoub@google.com>
 <177188698297.277693.4812132811463658088@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177188698297.277693.4812132811463658088@a3b018990fe9>
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
On 2026-02-23 at 22:49:42 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_colorop: Include local glib header for Android
> URL   : https://patchwork.freedesktop.org/series/161992/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8766 -> IGTPW_14598
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14598 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14598, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14598/index.html
> 
> Participating hosts (43 -> 41)
> ------------------------------
> 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14598:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@read-crc:
>     - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] +48 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8766/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14598/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
> 

Not related.

Regards,
Kamil 

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14598 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-2:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8766/bat-arlh-2/igt@i915_selftest@live@workarounds.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14598/bat-arlh-2/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-tgl-1115g4:      [PASS][5] -> [FAIL][6] ([i915#14867])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8766/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14598/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - bat-jsl-1:          [DMESG-FAIL][7] ([i915#15394]) -> [PASS][8] +1 other test pass
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8766/bat-jsl-1/igt@i915_selftest@live.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14598/bat-jsl-1/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-14:         [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8766/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14598/bat-dg2-14/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#14867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867
>   [i915#15394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8766 -> IGTPW_14598
> 
>   CI-20190529: 20190529
>   CI_DRM_18022: 45a3045fc0dc46a893cb8bbe304afafd4120c904 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14598: 3a233da32a02c9d263cf0c204457dfd75c81e81e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8766: 8766
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14598/index.html
