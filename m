Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1948BC02183
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 17:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB0010E0DA;
	Wed, 15 Jan 2025 17:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTf9WBcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99D310E032;
 Wed, 15 Jan 2025 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736963001; x=1768499001;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zSUMoYM8qB46e8IoH/fcm6bs0CeOEakl1lNjUwB3yH0=;
 b=RTf9WBcVs+N2Jfslz64SG3S4hCzAgr8fdnH+JsOLiQq9rHs14oWs3W48
 YuPB6D37SsJDI1etEkyXiixvpmSq6V01ue1eK7Nzmo4rU057gTy1TotAV
 rBbg4tGGTjZ4MqkgojcEtfX25cpTVH5UoGwG1FGFVevDToPwK4+yUspJ5
 w//4VUjgHBGGqvuRmuaYOo7OSNrtzlzK0mSSf3x3AgA6RqMGL2EvFjlC7
 dJrxZTTnhv5Nuo5qlf1JN1fdQ9NtVdOs+ci6NJiKNb8GBQ1spSuwAlA8z
 zgs01DdnYJ0yUSCNdjscbaaXXQalS0OxEgGJJ8lxpzohLRO9P3EyYzQzW g==;
X-CSE-ConnectionGUID: xRAQ1hH8R2a17qeC0ArX5Q==
X-CSE-MsgGUID: wy4g/uWxT/aA0FNDDBTeHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47799168"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="47799168"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 09:42:27 -0800
X-CSE-ConnectionGUID: KH7cZhZmRVSU5iZLm+TS5w==
X-CSE-MsgGUID: Ry5peu9dQlCDnFnvepd0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="110184671"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 09:42:24 -0800
Date: Wed, 15 Jan 2025 18:42:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Oak Zeng <oak.zeng@intel.com>, I915-ci-infra@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel-ci: Fix a syntax err in xe.blocklist.txt
Message-ID: <20250115174209.tncafjjea6w5ajc6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@intel.com>
References: <20250114173523.3267049-1-oak.zeng@intel.com>
 <173695488863.3988582.6235434483664173814@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173695488863.3988582.6235434483664173814@b555e5b46a47>
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
On 2025-01-15 at 15:28:08 -0000, Patchwork wrote:

below are unrelated to xe blocklist change.

Regards,
Kamil

> == Series Details ==
> 
> Series: tests/intel-ci: Fix a syntax err in xe.blocklist.txt
> URL   : https://patchwork.freedesktop.org/series/143518/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15955_full -> IGTPW_12437_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12437_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12437_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12437/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12437_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_pxp@hw-rejects-pxp-buffer:
>     - shard-rkl:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12437/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15955/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12437/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_selftest@live@execlists:
>     - shard-glk:          [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15955/shard-glk1/igt@i915_selftest@live@execlists.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12437/shard-glk2/igt@i915_selftest@live@execlists.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
>     - shard-tglu-1:       NOTRUN -> [FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12437/shard-tglu-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12437_full that come from known issues:
> 
...cut...
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12437/index.html
