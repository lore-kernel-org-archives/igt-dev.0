Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EB96E32F
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Mar 2021 10:36:56 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v15so10179555wrx.4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Mar 2021 03:36:56 -0700 (PDT)
Date: Tue, 16 Mar 2021 11:36:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YFCKRHpk8ds1GgKP@phenom.ffwll.local>
References: <20210315165842.64488-1-zbigniew.kempczynski@intel.com>
 <161583482830.30953.15518190784927259231@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161583482830.30953.15518190784927259231@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev26=29?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 15, 2021 at 07:00:28PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce IGT allocator (rev26)
> URL   : https://patchwork.freedesktop.org/series/82954/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_9857_full -> IGTPW_5601_full
> ====================================================

No in-depth review by far, but it looks all very reasonable and careful,
test results look solid, abstraction doesn't seem to leak too badly.

The only thing I've noticed, and like I've said we've kinda been a bit
sloppy with this for years is the lack of nice docs. But that can be fixed
afterwards, and it's also a much wider issue than just intel_bb/allocator
and the various other helper libraries you add/update.

On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5601_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@api_intel_bb@last-page} (NEW):
>     - shard-apl:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl2/igt@api_intel_bb@last-page.html
>     - shard-glk:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk2/igt@api_intel_bb@last-page.html
>     - shard-kbl:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl2/igt@api_intel_bb@last-page.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_9857_full and IGTPW_5601_full:
> 
> ### New IGT tests (48) ###
> 
>   * igt@api_intel_allocator@alloc-simple:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@api_intel_allocator@execbuf-with-allocator:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@api_intel_allocator@fork-simple-once:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01, 0.05] s
> 
>   * igt@api_intel_allocator@fork-simple-stress:
>     - Statuses : 6 pass(s)
>     - Exec time: [5.40, 5.51] s
> 
>   * igt@api_intel_allocator@fork-simple-stress-signal:
>     - Statuses : 5 pass(s)
>     - Exec time: [5.41, 5.53] s
> 
>   * igt@api_intel_allocator@open-vm:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@api_intel_allocator@random-allocator:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@api_intel_allocator@random-allocator@basic:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@api_intel_allocator@random-allocator@parallel-one:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@api_intel_allocator@random-allocator@print:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@api_intel_allocator@reloc-allocator:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@api_intel_allocator@reloc-allocator@basic:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@api_intel_allocator@reloc-allocator@parallel-one:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@api_intel_allocator@reloc-allocator@print:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@api_intel_allocator@reopen:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@api_intel_allocator@reopen-fork:
>     - Statuses : 5 pass(s)
>     - Exec time: [3.24, 3.27] s
> 
>   * igt@api_intel_allocator@reserve:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@api_intel_allocator@reserve-simple:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@api_intel_allocator@reuse:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@api_intel_allocator@simple-allocator:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@api_intel_allocator@simple-allocator@basic:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@api_intel_allocator@simple-allocator@parallel-one:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.08, 0.16] s
> 
>   * igt@api_intel_allocator@simple-allocator@print:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@api_intel_allocator@simple-allocator@reserve:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@api_intel_allocator@simple-allocator@reuse:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@api_intel_allocator@standalone:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.02, 0.06] s
> 
>   * igt@api_intel_allocator@two-level-inception:
>     - Statuses : 6 pass(s)
>     - Exec time: [5.41, 5.56] s
> 
>   * igt@api_intel_allocator@two-level-inception-interruptible:
>     - Statuses : 6 pass(s)
>     - Exec time: [5.41, 5.62] s
> 
>   * igt@api_intel_bb@add-remove-objects:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@api_intel_bb@bb-with-allocator:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@api_intel_bb@bb-with-vm:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@api_intel_bb@blit-noreloc-keep-cache-random:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@api_intel_bb@blit-noreloc-purge-cache-random:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@api_intel_bb@destroy-bb:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@api_intel_bb@last-page:
>     - Statuses : 3 fail(s) 2 pass(s) 1 skip(s)
>     - Exec time: [0.0, 6.79] s
> 
>   * igt@api_intel_bb@object-noreloc-keep-cache-random:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@api_intel_bb@object-noreloc-keep-cache-simple:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@api_intel_bb@object-noreloc-purge-cache-random:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@api_intel_bb@object-noreloc-purge-cache-simple:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@api_intel_bb@purge-bb:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@api_intel_bb@reset-bb:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@gem_softpin@allocator-basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@allocator-basic-reserve:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.07, 0.29] s
> 
>   * igt@gem_softpin@allocator-fork:
>     - Statuses : 5 pass(s)
>     - Exec time: [2.19, 2.36] s
> 
>   * igt@gem_softpin@allocator-nopin:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.19] s
> 
>   * igt@gem_softpin@allocator-nopin-reserve:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.07, 0.30] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5601_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-noreloc-purge-cache:
>     - shard-snb:          [PASS][4] -> [SKIP][5] ([fdo#109271])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-snb7/igt@api_intel_bb@blit-noreloc-purge-cache.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-snb5/igt@api_intel_bb@blit-noreloc-purge-cache.html
> 
>   * igt@feature_discovery@display-4x:
>     - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#1839])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb2/igt@feature_discovery@display-4x.html
>     - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#1839])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb5/igt@feature_discovery@display-4x.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-tglb:         NOTRUN -> [SKIP][8] ([fdo#109314])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb5/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-iclb:         NOTRUN -> [SKIP][9] ([fdo#109314])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb3/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@engines-mixed:
>     - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +5 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-tglb:         [PASS][11] -> [TIMEOUT][12] ([i915#3063])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-tglb:         [PASS][13] -> [TIMEOUT][14] ([i915#2369] / [i915#3063])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-tglb2/igt@gem_eio@unwedge-stress.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb2/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          NOTRUN -> [FAIL][15] ([i915#2846])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk2/igt@gem_exec_fair@basic-deadline.html
>     - shard-apl:          NOTRUN -> [FAIL][16] ([i915#2846])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl6/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk2/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-many-active@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2389])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html
> 
>   * igt@gem_exec_schedule@u-fairslice@rcs0:
>     - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1610] / [i915#2803])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl7/igt@gem_exec_schedule@u-fairslice@rcs0.html
> 
>   * igt@gem_exec_whisper@basic-queues-all:
>     - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#118] / [i915#95]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-glk4/igt@gem_exec_whisper@basic-queues-all.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html
> 
>   * igt@gem_mmap_gtt@cpuset-basic-small-copy:
>     - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#307]) +1 similar issue
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-glk8/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
> 
>   * igt@gem_render_copy@linear-to-vebox-y-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#768]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb1/igt@gem_render_copy@linear-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
>     - shard-snb:          NOTRUN -> [SKIP][28] ([fdo#109271]) +396 similar issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-snb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:
>     - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#1317]) +3 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb8/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc:
>     - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#1317]) +3 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb6/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb:
>     - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271]) +83 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk5/igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb.html
> 
>   * igt@gem_userptr_blits@process-exit-mmap@wc:
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#1699]) +3 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb7/igt@gem_userptr_blits@process-exit-mmap@wc.html
> 
>   * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
>     - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#1704]) +3 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb1/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#1704]) +3 similar issues
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb7/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
> 
>   * igt@gen3_render_mixed_blits:
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109289]) +4 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb7/igt@gen3_render_mixed_blits.html
> 
>   * igt@gen7_exec_parse@bitmasks:
>     - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109289]) +3 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb8/igt@gen7_exec_parse@bitmasks.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#112306]) +2 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb1/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#112306])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb2/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence:
>     - shard-tglb:         [PASS][39] -> [WARN][40] ([i915#2681])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html
>     - shard-iclb:         [PASS][41] -> [WARN][42] ([i915#2684])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
> 
>   * igt@kms_async_flips@test-time-stamp:
>     - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#2574])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb3/igt@kms_async_flips@test-time-stamp.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111614]) +2 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110725] / [fdo#111614]) +2 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111615]) +2 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
>     - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110723])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
>     - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +6 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk1/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium@hdmi-hpd-storm:
>     - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +22 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html
> 
>   * igt@kms_chamelium@vga-frame-dump:
>     - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +12 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb7/igt@kms_chamelium@vga-frame-dump.html
> 
>   * igt@kms_color@pipe-a-ctm-0-25:
>     - shard-tglb:         NOTRUN -> [FAIL][52] ([i915#1149] / [i915#315]) +1 similar issue
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb7/igt@kms_color@pipe-a-ctm-0-25.html
> 
>   * igt@kms_color@pipe-b-ctm-0-25:
>     - shard-iclb:         NOTRUN -> [FAIL][53] ([i915#1149] / [i915#315]) +1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb8/igt@kms_color@pipe-b-ctm-0-25.html
> 
>   * igt@kms_color@pipe-d-ctm-max:
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278] / [i915#1149]) +1 similar issue
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html
> 
>   * igt@kms_color@pipe-d-degamma:
>     - shard-tglb:         NOTRUN -> [FAIL][55] ([i915#1149])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb6/igt@kms_color@pipe-d-degamma.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
>     - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +23 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
>     - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +6 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb1/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
>     - shard-snb:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +24 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-apl:          NOTRUN -> [TIMEOUT][59] ([i915#1319])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl3/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-kbl:          NOTRUN -> [TIMEOUT][60] ([i915#1319])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl6/igt@kms_content_protection@lic.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          [PASS][61] -> [DMESG-WARN][62] ([i915#180]) +1 similar issue
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [fdo#109279]) +2 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109279]) +7 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-suspend:
>     - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271]) +236 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274] / [fdo#109278]) +1 similar issue
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-tglb:         [PASS][67] -> [FAIL][68] ([i915#2346])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
>     - shard-kbl:          NOTRUN -> [DMESG-FAIL][69] ([IGT#6])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
>     - shard-apl:          NOTRUN -> [DMESG-FAIL][70] ([IGT#6])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-tglb:         NOTRUN -> [FAIL][71] ([i915#2346])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_dp_dsc@basic-dsc-enable-dp:
>     - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109349])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb1/igt@kms_dp_dsc@basic-dsc-enable-dp.html
>     - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109349])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-dp.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274]) +1 similar issue
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb7/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>     - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111825]) +47 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][76] -> [FAIL][77] ([i915#2122])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
>     - shard-tglb:         NOTRUN -> [FAIL][78] ([i915#2122])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][79] ([i915#180])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
>     - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#2672])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>     - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#2642]) +1 similar issue
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
>     - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109280]) +26 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +247 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          [PASS][84] -> [INCOMPLETE][85] ([i915#155])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#1187]) +2 similar issues
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html
>     - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#1187]) +1 similar issue
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb3/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>     - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#533]) +2 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
>     - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109278]) +13 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb7/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
>     - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#533])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk9/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-apl:          NOTRUN -> [FAIL][91] ([fdo#108145] / [i915#265]) +1 similar issue
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>     - shard-kbl:          NOTRUN -> [FAIL][92] ([i915#265])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
>     - shard-glk:          NOTRUN -> [FAIL][93] ([fdo#108145] / [i915#265])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk3/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
>     - shard-kbl:          NOTRUN -> [FAIL][94] ([fdo#108145] / [i915#265])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
>     - shard-kbl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +4 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>     - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +7 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
>     - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658]) +2 similar issues
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
>     - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#658]) +1 similar issue
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
>     - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#2920])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
> 
>   * igt@kms_psr@psr2_primary_blt:
>     - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109441])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb7/igt@kms_psr@psr2_primary_blt.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][101] -> [SKIP][102] ([fdo#109441]) +3 similar issues
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9857/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#533]) +4 similar issues
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl2/igt@kms_vblank@pipe-d-wait-idle.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109502])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb8/igt@kms_vrr@flipline.html
>     - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109502])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb6/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-kbl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2437]) +1 similar issue
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-kbl3/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#2437])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-tglb6/igt@kms_writeback@writeback-invalid-parameters.html
>     - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2437])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html
>     - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-glk6/igt@kms_writeback@writeback-invalid-parameters.html
>     - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2437])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/shard-iclb4/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@nouveau_crc@pipe-b-source-outp-inactive:
>     - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#2530]) +1 sim
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5601/index.html

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
