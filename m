Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BCD10E605
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 12:59:55 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 14:59:46 +0200
Message-ID: <4866623.31r3eYUQgx@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <169713354471.25006.11612612671040897551@emeril.freedesktop.org>
References: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
 <169713354471.25006.11612612671040897551@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgS3VuaXQg?=
 =?utf-8?q?fixes_and_improvements_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thursday, 12 October 2023 19:59:04 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: Kunit fixes and improvements (rev4)
> URL   : https://patchwork.freedesktop.org/series/124554/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13741_full -> IGTPW_9985_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9985_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9985_full, please notify your bug team 
(lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in 
CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/
index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-rkl0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in 
IGTPW_9985_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-dg1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-
warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-19/
igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_rotation_crc@primary-rotation-270.html

False positives, not related to IGT changes introduced by patch series tested 
under this pre-merge run.  BUG Filing informed and asked for updating filters 
and re-reporting.

Thanks,
Janusz

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-
rc-ccs}:
>     - shard-dg1:          NOTRUN -> [SKIP][4] +8 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-17/
igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-
ccs.html
> 
>   * {igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc}:
>     - shard-dg1:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-16/
igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * {igt@kms_pm_rpm@modeset-pc8-residency-stress}:
>     - shard-rkl:          NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_pm_rpm@modeset-pc8-residency-stress.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_13741_full and 
IGTPW_9985_full:
> 
> ### New IGT tests (223) ###
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_optimistic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_range:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_smoke:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_align:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_align32:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_align64:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_bottomup:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_color:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_color_evict:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_color_evict_range:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_debug:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_evict:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_evict_range:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_frag:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_highest:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_init:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_insert:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_insert_range:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_lowest:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_replace:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_reserve:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_topdown:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-
mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-
rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-
rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-
mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-
rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-
rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-
mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-
rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-
rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-
mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-
rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-
rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-
linear:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-mc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-rc-
ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-rc-
ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-mc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-rc-ccs-cc:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_force_connector_basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_selftest@drm_cmdline_parser:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_extra_and_option:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_dvi:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_hdmi:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_not_digital:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_e_only:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_freestanding_force_e_and_options:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_freestanding_options:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_hmirror:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_margin_options:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_multiple_options:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_bpp_option:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_option:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_panel_orientation:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_off:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on_analog:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on_digital:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_interlaced:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_margins:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_margins_force_on:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_rblank:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_refresh:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa_margins:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa_rblank:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_0:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_180:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_270:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_90:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_vmirror:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_damage_helper:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_one_intersect:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_one_outside:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_src_moved:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_fractional_src:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_fractional_src_moved:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_not_visible:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_src_moved:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_fractional_src:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_fractional_src_moved:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_fractional_src:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_outside_fractional_src:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_outside_src:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_dp_mst_helper:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_calc_pbn_mode:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * 
igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_one_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_three_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_tiled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_height_two_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_one_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_three_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_tiled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_block_width_two_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_16bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_32bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_8bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_plane_helper:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state:
>     - Statuses : 8 pass(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9985_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8411]) +1 other test 
skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-3/
igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#6230])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@api_intel_bb@crc32.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#7701]) +1 other test 
skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@busy-hang@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8414]) +14 other tests 
skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@drm_fdinfo@busy-hang@bcs0.html
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          [PASS][12] -> [FAIL][13] ([i915#7742])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-rkl-1/
igt@drm_fdinfo@idle@rcs0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@bcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8414]) +4 other tests 
skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-13/
igt@drm_fdinfo@most-busy-check-all@bcs0.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][15] ([i915#7742])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#9323])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#4098] / [i915#9323])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#7697]) +1 other test 
skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#6335]) +1 other test 
skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [PASS][20] -> [FAIL][21] ([i915#6268])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-3/
igt@gem_ctx_exec@basic-nohangcheck.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-6/
igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@engines-hostile@vcs0:
>     - shard-mtlp:         [PASS][22] -> [FAIL][23] ([i915#2410]) +2 other 
tests fail
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-7/
igt@gem_ctx_persistence@engines-hostile@vcs0.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@gem_ctx_persistence@engines-hostile@vcs0.html
> 
>   * igt@gem_ctx_persistence@heartbeat-close:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#8555])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-3/
igt@gem_ctx_persistence@heartbeat-close.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#280]) +1 other test 
skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#280])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@gem_ctx_sseu@mmap-args.html
>     - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#280])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-1/
igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@kms:
>     - shard-dg1:          NOTRUN -> [FAIL][28] ([i915#5784])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-12/
igt@gem_eio@kms.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][29] -> [FAIL][30] ([i915#5784])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-19/
igt@gem_eio@reset-stress.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-14/
igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-false-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4812]) +1 other test 
skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@gem_exec_balancer@bonded-false-hang.html
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4812])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@gem_exec_balancer@bonded-semaphore.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4771])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4036])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#8555])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-17/
igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4525]) +3 other tests 
skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#6334])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#6344])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_capture@pi@vcs0:
>     - shard-mtlp:         [PASS][39] -> [FAIL][40] ([i915#4475])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-8/
igt@gem_exec_capture@pi@vcs0.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-6/
igt@gem_exec_capture@pi@vcs0.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][41] ([i915#2842]) +2 other tests 
fail
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@bcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][42] ([i915#2842]) +4 other tests 
fail
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-4/
igt@gem_exec_fair@basic-none@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-rkl:          [PASS][43] -> [FAIL][44] ([i915#2842])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-rkl-4/
igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539]) +2 other tests 
skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@gem_exec_fair@basic-throttle.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) 
+4 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) 
+2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-17/
igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#7697])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-rkl:          NOTRUN -> [SKIP][49] ([fdo#109283])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3281]) +2 other tests 
skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +17 other tests 
skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +31 other tests 
skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_exec_schedule@noreorder-corked@ccs0:
>     - shard-mtlp:         [PASS][53] -> [DMESG-WARN][54] ([i915#8962]) +1 
other test dmesg-warn
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-3/
igt@gem_exec_schedule@noreorder-corked@ccs0.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-4/
igt@gem_exec_schedule@noreorder-corked@ccs0.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4537] / [i915#4812])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_schedule@preemptive-hang@vcs0:
>     - shard-mtlp:         [PASS][56] -> [FAIL][57] ([i915#9051])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-1/
igt@gem_exec_schedule@preemptive-hang@vcs0.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@gem_exec_schedule@preemptive-hang@vcs0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][58] ([i915#7975] / [i915#8213])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-3/
igt@gem_exec_suspend@basic-s4-devices@lmem0.html
>     - shard-dg1:          [PASS][59] -> [ABORT][60] ([i915#7975] / 
[i915#8213])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-13/
igt@gem_exec_suspend@basic-s4-devices@lmem0.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-14/
igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_fenced_exec_thrash@2-spare-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4860])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@gem_fenced_exec_thrash@2-spare-fences.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4860])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613] / [i915#7582])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613]) +7 other tests 
skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify@lmem0:
>     - shard-dg1:          [PASS][65] -> [DMESG-WARN][66] ([i915#4423])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-13/
igt@gem_lmem_swapping@parallel-random-verify@lmem0.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-17/
igt@gem_lmem_swapping@parallel-random-verify@lmem0.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4613])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-7/
igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4613]) +1 other test 
skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-1/
igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@gem_madvise@dontneed-before-exec:
>     - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#3282])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@gem_madvise@dontneed-before-exec.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#8289])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_mmap@basic-small-bo:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4083]) +5 other tests 
skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@gem_mmap@basic-small-bo.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4077]) +20 other tests 
skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@gem_mmap_gtt@cpuset-big-copy.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4077]) +2 other tests 
skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-13/
igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_gtt@hang-user:
>     - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4077]) +1 other test 
skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@gem_mmap_gtt@hang-user.html
> 
>   * igt@gem_mmap_wc@write-prefaulted:
>     - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4083])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@gem_mmap_wc@write-prefaulted.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3282]) +17 other tests 
skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@gem_partial_pwrite_pread@writes-after-reads.html
>     - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3282]) +2 other tests 
skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-display:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3282]) +8 other tests 
skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-3/
igt@gem_partial_pwrite_pread@writes-after-reads-display.html
> 
>   * igt@gem_pxp@create-regular-context-2:
>     - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4270])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-12/
igt@gem_pxp@create-regular-context-2.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#4270])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-9/
igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4270]) +6 other tests 
skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4270]) +3 other tests 
skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4270])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-5/
igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-linear:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8428])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@gem_render_copy@y-tiled-ccs-to-linear.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4079]) +1 other test 
skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#8411]) +1 other test 
skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4079]) +1 other test 
skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-16/
igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4885])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3297]) +4 other tests 
skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@gem_userptr_blits@coherency-sync.html
>     - shard-tglu:         NOTRUN -> [SKIP][90] ([fdo#110542])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-6/
igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3297]) +4 other tests 
skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4880]) 
+1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297]) +1 other test 
skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-16/
igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([fdo#109289]) +7 other tests 
skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-3/
igt@gen3_render_linear_blits.html
> 
>   * igt@gen9_exec_parse@batch-without-end:
>     - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#2527])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-17/
igt@gen9_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#2856]) +3 other tests 
skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@gen9_exec_parse@bb-start-param.html
>     - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-10/
igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#2527]) +8 other tests 
skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#8399]) +2 other tests 
skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#6621])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-7/
igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#6621])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#8925])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4387])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@i915_pm_sseu@full-enable.html
>     - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#4387])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@i915_pm_sseu@full-enable.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4215] / [i915#5190])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4212]) +1 other test 
skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4212])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-14/
igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3826])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][109] ([i915#8247]) +3 other tests 
fail
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-14/
igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#6228])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#404])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#404])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4538] / [i915#5286]) 
+1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-13/
igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#5286]) +14 other 
tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-tglu:         NOTRUN -> [SKIP][115] ([fdo#111615] / [i915#5286]) 
+2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-7/
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>     - shard-mtlp:         [PASS][116] -> [FAIL][117] ([i915#5138])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][118] ([fdo#111614]) +1 other test 
skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-10/
igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][119] ([fdo#111614])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-3/
igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#3638])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-14/
igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][121] ([fdo#111614] / [i915#3638]) 
+10 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([fdo#111614]) +8 other 
tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         [PASS][123] -> [FAIL][124] ([i915#3743]) +2 other 
tests fail
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-10/
igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#5190]) +18 other 
tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4538]) +1 other test 
skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([fdo#111615]) +1 other test 
skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][128] ([fdo#111615])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-13/
igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#6187])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-5/
igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][130] ([fdo#110723]) +12 other 
tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4538] / [i915#5190]) 
+7 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] ([fdo#111615]) +2 other 
tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-7/
igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#2705])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@kms_big_joiner@basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#2705])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_big_joiner@basic.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#3742])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@kms_cdclk@mode-transition.html
>     - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#3742])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-10/
igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#7213]) +3 other tests 
skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4087]) +3 other tests 
skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2:          NOTRUN -> [SKIP][139] ([fdo#111827]) +1 other test 
skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][140] ([fdo#111827]) +5 other 
tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#7828]) +3 other tests 
skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-3/
igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#7828]) +9 other tests 
skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#7828]) +23 other 
tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#7828]) +2 other tests 
skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#7828]) +2 other tests 
skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-9/
igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_color@deep-color:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#3555]) +1 other test 
skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-3/
igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#3116])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#3299]) +2 other tests 
skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#7118]) +2 other tests 
skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@kms_content_protection@type1.html
>     - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#7118]) +1 other test 
skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_content_protection@type1.html
>     - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#3555] / [i915#6944])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#7116])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-17/
igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][153] ([fdo#109279] / [i915#3359])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3359])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3359]) +3 other tests 
skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#3359])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-15/
igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#3555]) +6 other tests 
skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@kms_cursor_crc@cursor-sliding-32x10.html
>     - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3555]) +3 other tests 
skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-17/
igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#3359])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-7/
igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][160] ([fdo#109274])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-6/
igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#3546])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-5/
igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#4103]) +3 other tests 
skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#4103] / [i915#4213] / 
[i915#5608])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#4103])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-6/
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][165] ([fdo#111825]) +29 other 
tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([fdo#111767] / 
[fdo#111825]) +2 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([fdo#109274] / [i915#5354]) 
+9 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [PASS][168] -> [FAIL][169] ([i915#2346])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-glk8/
igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-glk8/
igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#4103] / [i915#4213])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#8588])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#8588])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-13/
igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#1257])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_dp_aux_dev.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#8812])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3555] / [i915#3840]) 
+2 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3555] / [i915#3840])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3469])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3955])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][179] ([fdo#109274]) +5 other 
tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#2672]) +10 other 
tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#2672]) +6 other tests 
skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-
a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#2672])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-1/
igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-
default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#2587] / [i915#2672]) 
+1 other test skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-7/
igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-
valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#2672] / [i915#3555]) 
+1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-5/
igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#8708]) +1 other test 
skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-15/
igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][186] ([fdo#109280]) +10 other 
tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-9/
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][187] ([fdo#111825]) +10 other 
tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][188] ([i915#8912])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#5439])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3458]) +28 other 
tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][191] ([fdo#109271]) +3 other 
tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-glk5/
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#8708]) +27 other 
tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#5354]) +46 other 
tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3023]) +61 other 
tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][195] ([fdo#110189]) +10 other 
tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-6/
igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3458]) +6 other tests 
skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-14/
igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][197] ([fdo#111825] / [i915#1825]) 
+102 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#1825]) +6 other tests 
skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-5/
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#6118])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#3555] / [i915#8228])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-9/
igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8228]) 
+1 other test skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8228])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-12/
igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8228]) 
+1 other test skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#4816])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#6301])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
>     - shard-tglu:         NOTRUN -> [SKIP][206] ([fdo#109289])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-10/
igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-rkl:          NOTRUN -> [SKIP][207] ([fdo#109289]) +5 other 
tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
>     - shard-mtlp:         NOTRUN -> [SKIP][208] ([fdo#109289])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-5/
igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
>     - shard-apl:          [PASS][209] -> [ABORT][210] ([i915#180])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-apl4/
igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-apl7/
igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
>     - shard-apl:          [PASS][211] -> [DMESG-WARN][212] ([i915#180])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-apl4/
igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-apl7/
igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#8821])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#8806])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3555]) +19 other 
tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#6953])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][217] ([i915#8292])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
>     - shard-dg1:          NOTRUN -> [FAIL][218] ([i915#8292])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-
a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#5176] / [i915#9423]) 
+3 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-12/
igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-
hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-
b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#5176] / [i915#9423]) 
+1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-
hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
factor-0-25@pipe-c-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#5235]) +7 other tests 
skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-
hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-
vga-1:
>     - shard-snb:          NOTRUN -> [SKIP][222] ([fdo#109271]) +28 other 
tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-snb4/
igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-
vga-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-
hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#5235]) +7 other tests 
skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-
a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
factor-0-25@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#5235]) +19 other 
tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-14/
igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-
hdmi-a-4.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#658])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-6/
igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#658]) +3 other tests 
skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#658]) +2 other tests 
skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg1:          NOTRUN -> [SKIP][228] ([fdo#111068] / [i915#658]) 
+1 other test skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([fdo#111068] / [i915#658]) 
+3 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@cursor_blt:
>     - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#1072]) +21 other 
tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_psr@cursor_blt.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#1072] / [i915#4078]) 
+2 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-18/
igt@kms_psr@cursor_plane_move.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#1072]) +5 other tests 
skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_psr@primary_page_flip.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#5461] / [i915#658])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-5/
igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#5289])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([fdo#111615] / [i915#5289]) 
+3 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#4235] / [i915#5190])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-5/
igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>     - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#4235])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#4235])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [FAIL][239] ([i915#5465]) +1 other test 
fail
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-snb1/
igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3555] / [i915#4098]) 
+1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#8623])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#8623])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-tglu:         NOTRUN -> [SKIP][243] ([fdo#109309])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-4/
igt@kms_tv_load_detect@load-detect.html
>     - shard-mtlp:         NOTRUN -> [SKIP][244] ([fdo#109309])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-1/
igt@kms_tv_load_detect@load-detect.html
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([fdo#109309])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@kms_tv_load_detect@load-detect.html
>     - shard-rkl:          NOTRUN -> [SKIP][246] ([fdo#109309])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-1:
>     - shard-apl:          [PASS][247] -> [FAIL][248] ([i915#9196])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-apl4/
igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-1.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-apl6/
igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-tglu:         [PASS][249] -> [FAIL][250] ([i915#9196])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-5/
igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>     - shard-mtlp:         [PASS][251] -> [FAIL][252] ([i915#9196]) +1 other 
test fail
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-4/
igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#4070] / [i915#6768]) 
+14 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@pipe-d-wait-forked:
>     - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#4070] / [i915#533] / 
[i915#6768]) +11 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_vblank@pipe-d-wait-forked.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#2437]) +1 other test 
skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#2437]) +2 other tests 
skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#2437])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-10/
igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@unprivileged-single-ctx-counters:
>     - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#2433])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@perf@unprivileged-single-ctx-counters.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#8850])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][260] ([fdo#112283]) +1 other test 
skip
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@perf_pmu@event-wait@rcs0.html
>     - shard-rkl:          NOTRUN -> [SKIP][261] ([fdo#112283])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@perf_pmu@faulting-read@gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#8440])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@perf_pmu@faulting-read@gtt.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][263] ([i915#6806])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-1/
igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg2:          NOTRUN -> [FAIL][264] ([i915#5793])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#5608] / [i915#8516])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#8516])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@perf_pmu@render-node-busy-idle@vcs1:
>     - shard-dg1:          [PASS][267] -> [FAIL][268] ([i915#4349]) +2 other 
tests fail
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-14/igt@perf_pmu@render-node-busy-idle@vcs1.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-17/
igt@perf_pmu@render-node-busy-idle@vcs1.html
> 
>   * igt@prime_udl:
>     - shard-dg2:          NOTRUN -> [SKIP][269] ([fdo#109291])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-6/
igt@prime_udl.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#3291] / [i915#3708])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-3/
igt@prime_vgem@basic-write.html
>     - shard-rkl:          NOTRUN -> [SKIP][271] ([fdo#109295] / [i915#3291] 
/ [i915#3708]) +1 other test skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3708] / [i915#4077]) 
+1 other test skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#3708])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@prime_vgem@fence-flip-hang.html
>     - shard-rkl:          NOTRUN -> [SKIP][274] ([fdo#109295] / [i915#3708])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
>     - shard-tglu:         NOTRUN -> [SKIP][275] ([fdo#109315] / [i915#2575]) 
+2 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-5/
igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
> 
>   * igt@v3d/v3d_submit_csd@bad-pad:
>     - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#2575]) +4 other tests 
skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-18/
igt@v3d/v3d_submit_csd@bad-pad.html
> 
>   * igt@v3d/v3d_submit_csd@single-out-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#2575]) +17 other 
tests skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@v3d/v3d_submit_csd@single-out-sync.html
> 
>   * igt@v3d/v3d_wait_bo@bad-bo:
>     - shard-rkl:          NOTRUN -> [SKIP][278] ([fdo#109315]) +32 other 
tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-6/
igt@v3d/v3d_wait_bo@bad-bo.html
> 
>   * igt@v3d/v3d_wait_bo@unused-bo-0ns:
>     - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#2575]) +2 other tests 
skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-2/
igt@v3d/v3d_wait_bo@unused-bo-0ns.html
> 
>   * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
>     - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#2575]) +3 other tests 
skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-7/
igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html
> 
>   * igt@vc4/vc4_label_bo@set-kernel-name:
>     - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#7711]) +12 other 
tests skip
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-10/
igt@vc4/vc4_label_bo@set-kernel-name.html
> 
>   * igt@vc4/vc4_perfmon@create-perfmon-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#7711])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-5/
igt@vc4/vc4_perfmon@create-perfmon-0.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-purgeable:
>     - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#7711]) +22 other 
tests skip
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-4/
igt@vc4/vc4_purgeable_bo@mark-purgeable.html
> 
>   * igt@vc4/vc4_tiling@get-bad-modifier:
>     - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#7711]) +2 other tests 
skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@vc4/vc4_tiling@get-bad-modifier.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [FAIL][285] ([i915#7742]) -> [PASS][286]
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-rkl-7/
igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-1/
igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-rkl:          [FAIL][287] ([i915#6268]) -> [PASS][288]
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-rkl-6/
igt@gem_ctx_exec@basic-nohangcheck.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-rkl-7/
igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@bcs0:
>     - shard-dg2:          [FAIL][289] ([fdo#103375]) -> [PASS][290] +5 other 
tests pass
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg2-5/
igt@gem_ctx_isolation@preservation-s3@bcs0.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-2/
igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg2:          [FAIL][291] ([i915#5784]) -> [PASS][292]
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg2-5/
igt@gem_eio@reset-stress.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-3/
igt@gem_eio@reset-stress.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][293] ([i915#5784]) -> [PASS][294]
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-13/igt@gem_eio@unwedge-stress.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-19/
igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglu:         [FAIL][295] ([i915#2842]) -> [PASS][296]
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-6/igt@gem_exec_fair@basic-flow@rcs0.html
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-tglu-7/
igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [FAIL][297] ([i915#2842]) -> [PASS][298]
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-glk7/
igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-glk8/
igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_flush@basic-uc-set-default:
>     - shard-mtlp:         [DMESG-FAIL][299] ([i915#8962]) -> [PASS][300]
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-4/igt@gem_exec_flush@basic-uc-set-default.html
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-4/
igt@gem_exec_flush@basic-uc-set-default.html
> 
>   * igt@gem_exec_schedule@noreorder-priority@rcs0:
>     - shard-mtlp:         [DMESG-WARN][301] ([i915#8962]) -> [PASS][302] +1 
other test pass
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-4/igt@gem_exec_schedule@noreorder-priority@rcs0.html
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-7/
igt@gem_exec_schedule@noreorder-priority@rcs0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          [DMESG-WARN][303] ([i915#4936] / [i915#5493]) -> 
[PASS][304]
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg2-6/
igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg2-11/
igt@gem_lmem_swapping@smem-oom@lmem0.html
>     - shard-dg1:          [TIMEOUT][305] ([i915#5493]) -> [PASS][306]
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-dg1-15/
igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@i915_hangman@detector@vcs0:
>     - shard-mtlp:         [FAIL][307] ([i915#8456]) -> [PASS][308] +2 other 
tests pass
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/shard-mtlp-3/
igt@i915_hangman@detector@vcs0.html
> 
>   * igt@i915_hangman@engine-
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9985/
index.html
> 



