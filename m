Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5FC10E3E0
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 09:16:02 +0000 (UTC)
Date: Mon, 16 May 2022 12:13:32 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Message-ID: <YoIVvMpuTeA6FtwW@platvala-desk.ger.corp.intel.com>
References: <20220513095300.6785-1-petri.latvala@intel.com>
 <165244846695.9638.5961914363232913663@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165244846695.9638.5961914363232913663@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBB?=
 =?utf-8?q?dd_missing_newline_in_igt=5Ffopen=5Fdata=27s_logging?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 13, 2022 at 01:27:46PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: Add missing newline in igt_fopen_data's logging
> URL   : https://patchwork.freedesktop.org/series/103977/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11647_full -> IGTPW_7098_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7098_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7098_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7098/index.html
> 
> Participating hosts (11 -> 8)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7098_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_whisper@basic-fds-forked-all:
>     - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11647/shard-kbl1/igt@gem_exec_whisper@basic-fds-forked-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7098/shard-kbl6/igt@gem_exec_whisper@basic-fds-forked-all.html
> 

Lakshmi, false positive for you.

<4> [236.913564] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b7c63: 0000 [#1] PREEMPT SMP PTI


-- 
Petri Latvala
