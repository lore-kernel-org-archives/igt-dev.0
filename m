Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F7EC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 17:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5411D10EF36;
	Fri, 17 May 2024 17:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8O78hax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0110A10EF35;
 Fri, 17 May 2024 17:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715967094; x=1747503094;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n8dPI60GS8rlzwBi+Y0r5Ovyq6uL7E/PPJ3UkaJeMi0=;
 b=I8O78haxaGw8q4YF3jD/7kIHmCOtvoy/9apKMXjf9zGkcFmhLS77z3VR
 rFXZTg0VMxh3d6gGTHA7VcyjKQAJrjOKy9u9IycbfbelVgaZCgHboM7WH
 xdFt2tvX+h5znDBaQ2YTqnA3qhdk6WTEam16ts9e9k+PJT0an0PSVbd2R
 ismSz7TeHSX0J/bdRzAgzjOg6FXuY3aOrVyhsxuUbyMfV4qZDucXoLfA4
 jULCudp7w2JR4MOVzMDXxZCS3IVD56+IwwncIsD5F7LZXCN/gGcZYxO7g
 nbndydbqhq4C7eeRnWr6FtNbvb6z5bR1YnmRRa4fggjemnbTbzhx2hGa6 Q==;
X-CSE-ConnectionGUID: HrX9+000SKm+M6rDAwgHng==
X-CSE-MsgGUID: 8hG8yMuzRUG8OosZk0Oqzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="34674099"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="34674099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 10:31:32 -0700
X-CSE-ConnectionGUID: nTmE/ATaT+WF7KgeuNk7xw==
X-CSE-MsgGUID: ac1jbZcaTo+WeEV5eOH7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="31699469"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 10:31:30 -0700
Date: Fri, 17 May 2024 19:31:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 tests/xe_pm: s3 vs s2idle: Validate only the platform default
Message-ID: <20240517173113.clevyll57ewqmmnf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240516180732.144162-1-rodrigo.vivi@intel.com>
 <171593898388.2142370.18157840841506763483@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171593898388.2142370.18157840841506763483@8e613ede5ea5>
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
On 2024-05-17 at 09:43:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_pm: s3 vs s2idle: Validate only the platform default
> URL   : https://patchwork.freedesktop.org/series/133713/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7859_full -> IGTPW_11152_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11152_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11152_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11152/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11152_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_balancer@smoke:
>     - shard-dg2:          NOTRUN -> [DMESG-FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11152/shard-dg2-10/igt@gem_exec_balancer@smoke.html
> 
>   * igt@gem_exec_whisper@basic-contexts-forked:
>     - shard-dg2:          [PASS][2] -> [DMESG-FAIL][3] +1 other test dmesg-fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7859/shard-dg2-7/igt@gem_exec_whisper@basic-contexts-forked.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11152/shard-dg2-10/igt@gem_exec_whisper@basic-contexts-forked.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-dg2:          [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7859/shard-dg2-11/igt@i915_suspend@sysfs-reader.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11152/shard-dg2-10/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256:
>     - shard-dg2:          [PASS][6] -> [FAIL][7] +12 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7859/shard-dg2-10/igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11152/shard-dg2-10/igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256.html
> 

Unrelated to xe_pm changes,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11152_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7859 -> IGTPW_11152
> 
>   CI-20190529: 20190529
>   CI_DRM_14776: 01e8fd3a8450d33ddf644820ffa8de5369e6a7a8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11152: 11152
>   IGT_7859: 7859
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11152/index.html
