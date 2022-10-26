Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C94910E4BD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Oct 2022 11:36:36 +0000 (UTC)
Date: Wed, 26 Oct 2022 13:36:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y1kbwKvR/du6+nro@kamilkon-desk1>
References: <20221021131933.3122199-1-vikas.srivastava@intel.com>
 <166639475735.18265.14205584279929205660@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166639475735.18265.14205584279929205660@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fengines=3A_Avoid_SET=5FCACHING_ioctl_during_fo?=
 =?utf-8?b?cmsgKHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On 2022-10-21 at 23:25:57 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915/gem_ctx_engines: Avoid SET_CACHING ioctl during fork (rev2)
> URL   : https://patchwork.freedesktop.org/series/109995/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12273_full -> IGTPW_7998_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7998_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7998_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/index.html
> 
> Participating hosts (11 -> 8)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7998_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_mmap_write_crc@main@pipe-a-edp-1:
>     - shard-iclb:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb1/igt@kms_mmap_write_crc@main@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@kms_mmap_write_crc@main@pipe-a-edp-1.html
> 
>   * igt@kms_mmap_write_crc@main@pipe-a-hdmi-a-1:
>     - shard-glk:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk3/igt@kms_mmap_write_crc@main@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk5/igt@kms_mmap_write_crc@main@pipe-a-hdmi-a-1.html
> 

These are unrelated to change in gem_ctx_engines,

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_exec_whisper@basic-fds-priority-all:
>     - {shard-rkl}:        [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-4/igt@gem_exec_whisper@basic-fds-priority-all.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-5/igt@gem_exec_whisper@basic-fds-priority-all.html
> 
>   * igt@gem_mmap_gtt@flink-race:
>     - {shard-rkl}:        [PASS][7] -> [DMESG-FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-5/igt@gem_mmap_gtt@flink-race.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-5/igt@gem_mmap_gtt@flink-race.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - {shard-rkl}:        [PASS][9] -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-5/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-5/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_12273_full and IGTPW_7998_full:
> 
> ### New IGT tests (446) ###
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.30] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.42] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.30] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.30] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.55] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-b-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.28] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-c-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.55] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-cc-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-cc-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-cc-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-cc-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-cc-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-rc_ccs-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-cc-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-cc-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-cc-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-cc-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-cc-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.26] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-rc_ccs-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.32] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-cc-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-cc-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-cc-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-cc-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-cc-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.30] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-rc_ccs-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-to-linear:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-to-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-to-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.09, 0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.32] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.08] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.08] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.08] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.08] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.08] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.08] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-cc-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-cc-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-cc-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-cc-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-cc-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.30] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-rc_ccs-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-to-y-rc_ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-y-to-y-rc_ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.09] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.24] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.19] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.24] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.52] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.19] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.48] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.19] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.55] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.40] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.19] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-ccs-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-ccs-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-ccs-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-ccs-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-ccs-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.40] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-to-y-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-yf-to-yf-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-linear-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-linear-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-linear-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-linear-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-x-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-x-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-x-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.16] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-x-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-y-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-y-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-y-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-y-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-yf-to-linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.17] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-yf-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.15] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-yf-to-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-c-yf-to-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.40] s
> 
>   * igt@kms_invalid_mode@zero-hdisplay:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7998_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@display-3x:
>     - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#1839])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb8/igt@feature_discovery@display-3x.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#6268])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1099])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-snb5/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#280])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb3/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-iclb:         [PASS][16] -> [SKIP][17] ([i915#4525])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_balancer@parallel-bb-first:
>     - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#4525]) +1 similar issue
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#6117])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-tglb:         [PASS][20] -> [FAIL][21] ([i915#2842])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@bcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][22] ([i915#2842]) +4 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb3/igt@gem_exec_fair@basic-none@bcs0.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][23] ([i915#2842]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#2842]) +3 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb6/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#2842])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi:
>     - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#4613]) +4 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@gem_lmem_swapping@heavy-verify-multi.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4613]) +4 similar issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
>     - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl6/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#4270]) +1 similar issue
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#4270])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#768]) +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109290])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb4/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#2527] / [i915#2856]) +2 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb8/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#2856]) +2 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - shard-apl:          NOTRUN -> [FAIL][37] ([i915#7036])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#6590])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@i915_pm_freq_mult@media-freq@gt0.html
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#6590])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109289]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence:
>     - shard-iclb:         NOTRUN -> [WARN][41] ([i915#2684])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html
>     - shard-tglb:         NOTRUN -> [WARN][42] ([i915#2681])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109303])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb3/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109303])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb6/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@kms_atomic@atomic_plane_damage:
>     - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#4765])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb4/igt@kms_atomic@atomic_plane_damage.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
>     - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#5286]) +2 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#5286]) +1 similar issue
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111614]) +1 similar issue
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#110725] / [fdo#111614]) +1 similar issue
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb8/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271]) +93 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111615]) +4 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#110723])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#2705])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb1/igt@kms_big_joiner@2x-modeset.html
>     - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#2705])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb5/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278]) +20 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3689] / [i915#3886]) +2 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3689] / [i915#6095]) +2 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb3/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl6/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [i915#3886]) +3 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#6095]) +3 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb8/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk9/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3689]) +7 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html
> 
>   * igt@kms_chamelium@dp-hpd-with-enabled-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109284] / [fdo#111827]) +5 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb1/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium@hdmi-hpd-after-suspend:
>     - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109284] / [fdo#111827]) +6 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb1/igt@kms_chamelium@hdmi-hpd-after-suspend.html
>     - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk9/igt@kms_chamelium@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_chamelium@vga-hpd-with-enabled-mode:
>     - shard-snb:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-snb7/igt@kms_chamelium@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_color@ctm-0-75@pipe-a-edp-1:
>     - shard-iclb:         NOTRUN -> [FAIL][68] ([i915#315] / [i915#6946]) +2 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb1/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_color_chamelium@ctm-0-50:
>     - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl6/igt@kms_color_chamelium@ctm-0-50.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#3116])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@lic@pipe-a-dp-1:
>     - shard-apl:          NOTRUN -> [INCOMPLETE][71] ([i915#7121] / [i915#7173])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl8/igt@kms_content_protection@lic@pipe-a-dp-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#3359])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3359])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271]) +111 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl8/igt@kms_cursor_crc@cursor-sliding-32x32.html
>     - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3555]) +4 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb1/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109274] / [fdo#111825]) +2 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank:
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109274]) +5 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@kms_flip@2x-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109274] / [fdo#111825] / [i915#3637]) +5 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
>     - shard-apl:          [PASS][79] -> [DMESG-WARN][80] ([i915#180])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#2587] / [i915#2672]) +2 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#2672]) +7 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#2587] / [i915#2672]) +3 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#2672] / [i915#3555])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
>     - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109280]) +26 similar issues
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
>     - shard-iclb:         [PASS][86] -> [FAIL][87] ([i915#2546]) +1 similar issue
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
>     - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#6497]) +8 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109280] / [fdo#111825]) +25 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglb:         [PASS][90] -> [SKIP][91] ([i915#433])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#3555]) +5 similar issues
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
>     - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109289]) +1 similar issue
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
> 
>   * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#3536]) +2 similar issues
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb8/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
>     - shard-iclb:         [PASS][95] -> [SKIP][96] ([i915#5176]) +2 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb8/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#5176]) +5 similar issues
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-edp-1:
>     - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#5176]) +7 similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
>     - shard-iclb:         [PASS][99] -> [SKIP][100] ([i915#5235]) +2 similar issues
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#6524])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb4/igt@kms_prime@basic-crc-hybrid.html
>     - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#6524])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2920]) +2 similar issues
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#111068] / [i915#658]) +2 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#658]) +1 similar issue
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>     - shard-snb:          NOTRUN -> [SKIP][106] ([fdo#109271]) +157 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-snb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>     - shard-glk:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#658]) +2 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>     - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#658])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109642] / [fdo#111068] / [i915#658]) +1 similar issue
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb3/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr2_basic:
>     - shard-tglb:         NOTRUN -> [FAIL][110] ([i915#132] / [i915#3467])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb8/igt@kms_psr@psr2_basic.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_cpu:
>     - shard-iclb:         [PASS][111] -> [SKIP][112] ([fdo#109441])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
> 
>   * igt@kms_selftest@all:
>     - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#6433])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb6/igt@kms_selftest@all.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-apl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2437])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109295]) +1 similar issue
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@sysfs_clients@pidname:
>     - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#2994]) +2 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl2/igt@sysfs_clients@pidname.html
>     - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#2994]) +3 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@sysfs_clients@pidname.html
>     - shard-glk:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2994]) +2 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk3/igt@sysfs_clients@pidname.html
> 
>   * igt@sysfs_clients@split-10:
>     - shard-iclb:         NOTRUN -> [SKIP][119] ([i915#2994]) +3 similar issues
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb4/igt@sysfs_clients@split-10.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@info:
>     - {shard-rkl}:        [SKIP][120] ([i915#2582]) -> [PASS][121] +1 similar issue
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-5/igt@fbdev@info.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-6/igt@fbdev@info.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - {shard-rkl}:        [SKIP][122] ([i915#6252]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-5/igt@gem_ctx_persistence@hang.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-2/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][124] ([i915#2842]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-glk:          [FAIL][126] ([i915#2842]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fence@basic-busy@bcs0:
>     - {shard-rkl}:        [SKIP][128] ([i915#6251]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-5/igt@gem_exec_fence@basic-busy@bcs0.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-1/igt@gem_exec_fence@basic-busy@bcs0.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu:
>     - {shard-rkl}:        [SKIP][130] ([i915#3281]) -> [PASS][131] +7 similar issues
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html
> 
>   * igt@gem_pread@self:
>     - {shard-rkl}:        [SKIP][132] ([i915#3282]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-4/igt@gem_pread@self.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-5/igt@gem_pread@self.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - {shard-rkl}:        [SKIP][134] ([i915#2527]) -> [PASS][135] +1 similar issue
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-4/igt@gen9_exec_parse@unaligned-access.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [SKIP][136] ([fdo#109271]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl8/igt@i915_pm_dc@dc9-dpms.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl8/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-snb:          [INCOMPLETE][138] ([i915#4528] / [i915#4817]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>     - {shard-rkl}:        [SKIP][140] ([i915#1845] / [i915#4098]) -> [PASS][141] +10 similar issues
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>     - {shard-rkl}:        [SKIP][142] ([i915#1849] / [i915#4098]) -> [PASS][143] +6 similar issues
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
>     - shard-apl:          [DMESG-WARN][144] ([i915#180]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
> 
>   * igt@kms_plane@plane-panning-top-left@pipe-a-planes:
>     - {shard-rkl}:        [SKIP][146] ([i915#1849] / [i915#3558]) -> [PASS][147] +1 similar issue
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-5/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1:
>     - shard-tglb:         [INCOMPLETE][148] -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-tglb8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1.html
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-tglb7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [SKIP][150] ([fdo#109441]) -> [PASS][151] +1 similar issue
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_psr@sprite_plane_move:
>     - {shard-rkl}:        [SKIP][152] ([i915#1072]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-5/igt@kms_psr@sprite_plane_move.html
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-6/igt@kms_psr@sprite_plane_move.html
> 
>   * igt@perf_pmu@busy-idle-check-all@vecs0:
>     - {shard-dg1}:        [FAIL][154] ([i915#4521]) -> [PASS][155] +2 similar issues
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-dg1-13/igt@perf_pmu@busy-idle-check-all@vecs0.html
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - {shard-rkl}:        [SKIP][156] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][157] +1 similar issue
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-5/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@testdisplay:
>     - {shard-rkl}:        [SKIP][158] ([i915#4098]) -> [PASS][159] +1 similar issue
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-rkl-4/igt@testdisplay.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-rkl-6/igt@testdisplay.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk:          [WARN][160] ([i915#2658]) -> [INCOMPLETE][161] ([i915#7248])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk6/igt@gem_pwrite@basic-exhaustion.html
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk6/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-iclb:         [SKIP][162] ([i915#2920]) -> [SKIP][163] ([i915#658])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][164], [FAIL][165], [FAIL][166], [FAIL][167], [FAIL][168], [FAIL][169]) ([i915#3002] / [i915#4312]) -> ([FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173], [FAIL][174]) ([i915#180] / [i915#4312])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl1/igt@runner@aborted.html
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl6/igt@runner@aborted.html
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl3/igt@runner@aborted.html
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl3/igt@runner@aborted.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl1/igt@runner@aborted.html
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-apl3/igt@runner@aborted.html
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl2/igt@runner@aborted.html
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl7/igt@runner@aborted.html
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl2/igt@runner@aborted.html
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl7/igt@runner@aborted.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-apl3/igt@runner@aborted.html
>     - shard-glk:          ([FAIL][175], [FAIL][176], [FAIL][177], [FAIL][178], [FAIL][179], [FAIL][180]) ([i915#3002] / [i915#4312]) -> ([FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184]) ([i915#4312])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk5/igt@runner@aborted.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk2/igt@runner@aborted.html
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk6/igt@runner@aborted.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk7/igt@runner@aborted.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk6/igt@runner@aborted.html
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-glk1/igt@runner@aborted.html
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk1/igt@runner@aborted.html
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk3/igt@runner@aborted.html
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk7/igt@runner@aborted.html
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-glk8/igt@runner@aborted.html
>     - shard-iclb:         ([FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191]) ([i915#3002] / [i915#4312] / [i915#7300]) -> ([FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196]) ([i915#4312])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb7/igt@runner@aborted.html
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb8/igt@runner@aborted.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb4/igt@runner@aborted.html
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb5/igt@runner@aborted.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb7/igt@runner@aborted.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb5/igt@runner@aborted.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/shard-iclb3/igt@runner@aborted.html
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb8/igt@runner@aborted.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb4/igt@runner@aborted.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb1/igt@runner@aborted.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb2/igt@runner@aborted.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/shard-iclb2/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7998/index.html
