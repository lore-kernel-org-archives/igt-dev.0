Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F3AE9A74D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE8410E453;
	Tue, 24 Mar 2026 09:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFcujg+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20CB10E451;
 Tue, 24 Mar 2026 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774345189; x=1805881189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h/HZGIMPVEZ8Gv73V5uXKfRJ3bjTkWxtKwxnsuSjfFc=;
 b=aFcujg+f3HaFuuk10fgWIPFz/ju/ey4XCDT+d7mpFsaldXT67ii0hxLJ
 ZRuV7FGHluJ0YdraUaybYejqkBbLXniUxECyv7emsVRc9Jb20DbNkACI0
 7oPlmmvTyyljRgu+bgwkfLTe1wQAQv4KzeMg6jBvp5ckYAx5PNJhb8WG1
 drAouK0X19uOIB0LWJy+xW8Z1j1RVpYwq6YLHPD6e6/jPMvLt7U19Tc3T
 RvJW+8yFTWtBwHkcbZZH+p0P5CJG/tk7GUF/qQNRcCKsxZVbvXzwDNmW0
 Y7eQt+g0beAwVIbrS8ktrDaEh8Q/F3DOgHxiqVIeHls0Ai1jlTcUHHcl+ g==;
X-CSE-ConnectionGUID: T582+JQ3ThSMaLLhKWn/PQ==
X-CSE-MsgGUID: 0JxlqWSnRg6YdrRUGd3k7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74539844"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74539844"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:39:48 -0700
X-CSE-ConnectionGUID: qIbAuUK4S1uMGySrhfjX2g==
X-CSE-MsgGUID: 4sufhspTQiaoq3trM/wd6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="221405566"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:39:48 -0700
Date: Tue, 24 Mar 2026 10:39:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 lib/igt_fb: add YUV|YVU-410|411|444 formats (rev2)
Message-ID: <20260324093928.azs7jdpev5q5pfks@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260216181610.129209-1-kamil.konieczny@linux.intel.com>
 <177430499420.387756.4886642343947328879@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177430499420.387756.4886642343947328879@a3b018990fe9>
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
On 2026-03-23 at 22:29:54 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_fb: add YUV|YVU-410|411|444 formats (rev2)
> URL   : https://patchwork.freedesktop.org/series/161665/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8820 -> IGTPW_14838
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14838 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14838, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14838/index.html
> 
> Participating hosts (41 -> 40)
> ------------------------------
> 
>   Additional (1): bat-adls-6 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14838:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@execlists:
>     - bat-mtlp-9:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8820/bat-mtlp-9/igt@i915_selftest@live@execlists.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14838/bat-mtlp-9/igt@i915_selftest@live@execlists.html
> 

Unrelated, please submit bug and run full i915 testing.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14838 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14838/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
> 
...cut...
