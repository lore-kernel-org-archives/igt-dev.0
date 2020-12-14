Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627F96E1E0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 11:31:46 +0000 (UTC)
Date: Mon, 14 Dec 2020 13:31:40 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201214113140.GD7444@platvala-desk.ger.corp.intel.com>
References: <20201214071612.5953-1-petri.latvala@intel.com>
 <160794182546.28163.3215689796717076071@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160794182546.28163.3215689796717076071@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgY29yZV9z?=
 =?utf-8?q?etmaster=3A_Load_modules_before_accessing_device_files?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 10:30:25AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: core_setmaster: Load modules before accessing device files
> URL   : https://patchwork.freedesktop.org/series/84887/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5892_full -> IGTPW_5283_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5283_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5283_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5283/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5283_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@api_intel_bb@blit-noreloc-purge-cache:
>     - shard-hsw:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw4/igt@api_intel_bb@blit-noreloc-purge-cache.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5283/shard-hsw8/igt@api_intel_bb@blit-noreloc-purge-cache.html
> 
>   * igt@gem_exec_whisper@basic-forked:
>     - shard-kbl:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-kbl6/igt@gem_exec_whisper@basic-forked.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5283/shard-kbl3/igt@gem_exec_whisper@basic-forked.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-iclb:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb8/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5283/shard-iclb8/igt@sysfs_timeslice_duration@timeout@vecs0.html
>     - shard-glk:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk3/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5283/shard-glk2/igt@sysfs_timeslice_duration@timeout@vecs0.html
>     - shard-apl:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-apl7/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5283/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html


Lakshmi, false positives here.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
