Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26BAC3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F17810E167;
	Wed, 17 Jul 2024 14:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gaTnpgLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486C710E167;
 Wed, 17 Jul 2024 14:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721225019; x=1752761019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Npz2aPupjbxfa+c+A1uouyJjTZO/Qo0WVl4MKbVc7B4=;
 b=gaTnpgLkmo0iIsxfo1pYbvhSHVY8DxLq5JiPn5R3hP0K1resxXpGjh6e
 bPp+3WprATF5tShlIY1VvfRwEJ/GfYVZmKu2pr7QQ/qxyy/BwZI79dIkh
 MpQbWn5sc6Z0cyfBFDMBywpe0zAXLzFlTCs45njwRjZ7m2ss58exezc90
 Xk+Cl9UPiJZ5SwDHSO4SWNEjioamleLvl8rfkBTdpDL9KIB+eSdPX5cna
 wjQvVYNp343bWz5PT48OeaLbYKVm26Zzw15h7+l4vjrCzblX6KJXKbRbl
 FmH32HEGhSASguUH2IC6bd651s20Uq2SVzHb/a8v72cYSzoKVXbGiKl01 A==;
X-CSE-ConnectionGUID: Z1JJaBm+SmSd1TiM5eGf/g==
X-CSE-MsgGUID: CqJPJnYqQbCXDb89xVVoZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29341261"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29341261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:03:39 -0700
X-CSE-ConnectionGUID: rkQwLbRxRuKyhBI2vrE5+Q==
X-CSE-MsgGUID: WNARUOC1QpWWwsI1bJCzww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87868652"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:03:38 -0700
Date: Wed, 17 Jul 2024 16:03:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for Add
 gputop support for sysfs profiling knob
Message-ID: <20240717140334.4rrcx6f5t3hq35cw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
References: <20240716205756.2973341-1-adrian.larumbe@collabora.com>
 <172119642297.254371.18418063103536861896@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172119642297.254371.18418063103536861896@2413ebb6fbb6>
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
On 2024-07-17 at 06:07:02 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add gputop support for sysfs profiling knob
> URL   : https://patchwork.freedesktop.org/series/136161/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15084_full -> IGTPW_11414_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11414_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11414_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11414/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11414_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_big@single:
>     - shard-tglu:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11414/shard-tglu-3/igt@gem_exec_big@single.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
>     - shard-glk:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15084/shard-glk3/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11414/shard-glk1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
> 

This is unrelated to change in tools/gputop.

Regards,
Kamil


>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_15084_full and IGTPW_11414_full:
> 
> ### New IGT tests (6) ###
> 
>   * igt@kms_cursor_crc@cursor-size-change@pipe-a-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.95] s
> 
>   * igt@kms_cursor_crc@cursor-size-change@pipe-d-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.66] s
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.99] s
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.94] s
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.94] s
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.93] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11414_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#6230])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11414/shard-dg1-16/igt@api_intel_bb@crc32.html
> 
...cut...
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7927 -> IGTPW_11414
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15084: 49a697d7731bfbd13087d4167151cc91ec613f13 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11414: 11414
>   IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11414/index.html
