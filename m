Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEF06EEB0
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 07:52:51 +0000 (UTC)
References: <20200219094652.685022-1-lionel.g.landwerlin@intel.com>
 <158223835736.17406.9446356426862669624@emeril.freedesktop.org>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <6c560335-6cdd-fc57-ed54-74bdf56d556e@intel.com>
Date: Fri, 21 Feb 2020 09:52:48 +0200
MIME-Version: 1.0
In-Reply-To: <158223835736.17406.9446356426862669624@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_add_i915-query_perf_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Yey, all green!

On 21/02/2020 00:39, Patchwork wrote:
> == Series Details ==
>
> Series: tests: add i915-query perf tests
> URL   : https://patchwork.freedesktop.org/series/73631/
> State : success
>
> == Summary ==
>
> CI Bug Log - changes from IGT_5449_full -> IGTPW_4182_full
> ====================================================
>
> Summary
> -------
>
>    **SUCCESS**
>
>    No regressions found.
>
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/index.html
>
> New tests
> ---------
>
>    New tests have been introduced between IGT_5449_full and IGTPW_4182_full:
>
> ### New IGT tests (3) ###
>
>    * igt@i915_query@query-perf-config-data-invalid:
>      - Statuses : 6 pass(s) 1 skip(s)
>      - Exec time: [0.0, 0.00] s
>
>    * igt@i915_query@query-perf-config-list-invalid:
>      - Statuses : 6 pass(s) 1 skip(s)
>      - Exec time: [0.0] s
>
>    * igt@i915_query@query-perf-configs:
>      - Statuses : 6 pass(s) 1 skip(s)
>      - Exec time: [0.0, 0.00] s
>
>    
>
> Known issues
> ------------
>
>    Here are the changes found in IGTPW_4182_full that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>    * igt@gem_ctx_isolation@vcs1-none:
>      - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +8 similar issues
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb5/igt@gem_ctx_isolation@vcs1-none.html
>
>    * igt@gem_exec_balancer@smoke:
>      - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb4/igt@gem_exec_balancer@smoke.html
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb6/igt@gem_exec_balancer@smoke.html
>
>    * igt@gem_exec_schedule@out-order-bsd2:
>      - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +13 similar issues
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb6/igt@gem_exec_schedule@out-order-bsd2.html
>
>    * igt@gem_exec_schedule@pi-userfault-bsd:
>      - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb3/igt@gem_exec_schedule@pi-userfault-bsd.html
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html
>
>    * igt@gem_exec_schedule@preempt-bsd:
>      - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +1 similar issue
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb6/igt@gem_exec_schedule@preempt-bsd.html
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html
>
>    * igt@gem_mmap_gtt@big-copy-xy:
>      - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([i915#478])
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-snb4/igt@gem_mmap_gtt@big-copy-xy.html
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-snb4/igt@gem_mmap_gtt@big-copy-xy.html
>
>    * igt@gem_ppgtt@flink-and-close-vma-leak:
>      - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#644])
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-hsw5/igt@gem_ppgtt@flink-and-close-vma-leak.html
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-hsw5/igt@gem_ppgtt@flink-and-close-vma-leak.html
>
>    * igt@gen9_exec_parse@allowed-all:
>      - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#716])
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-glk4/igt@gen9_exec_parse@allowed-all.html
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-glk7/igt@gen9_exec_parse@allowed-all.html
>
>    * igt@i915_pm_rps@waitboost:
>      - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#39])
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-glk9/igt@i915_pm_rps@waitboost.html
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-glk7/igt@i915_pm_rps@waitboost.html
>
>    * igt@i915_selftest@live_gtt:
>      - shard-kbl:          [PASS][19] -> [TIMEOUT][20] ([fdo#112271])
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-kbl2/igt@i915_selftest@live_gtt.html
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-kbl3/igt@i915_selftest@live_gtt.html
>
>    * igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
>      - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#54])
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
>      - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
>      - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54])
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
>
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>      - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#72])
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>
>    * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>      - shard-hsw:          [PASS][29] -> [FAIL][30] ([i915#57])
>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#79])
>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>
>    * igt@kms_flip@flip-vs-suspend-interruptible:
>      - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180])
>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
>
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>      - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#668]) +4 similar issues
>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
>
>    * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>      - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +5 similar issues
>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
>
>    * igt@kms_psr@psr2_cursor_mmap_cpu:
>      - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html
>
>    * igt@kms_setmode@basic:
>      - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#31])
>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-apl7/igt@kms_setmode@basic.html
>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-apl2/igt@kms_setmode@basic.html
>
>    
> #### Possible fixes ####
>
>    * {igt@gem_ctx_persistence@close-replace-race}:
>      - shard-iclb:         [FAIL][43] ([i915#1241]) -> [PASS][44]
>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html
>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb1/igt@gem_ctx_persistence@close-replace-race.html
>
>    * igt@gem_ctx_shared@exec-shared-gtt-bsd2:
>      - shard-tglb:         [FAIL][45] ([i915#616]) -> [PASS][46]
>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-tglb2/igt@gem_ctx_shared@exec-shared-gtt-bsd2.html
>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-tglb8/igt@gem_ctx_shared@exec-shared-gtt-bsd2.html
>
>    * igt@gem_ctx_shared@exec-shared-gtt-render:
>      - shard-tglb:         [FAIL][47] ([i915#607] / [i915#616]) -> [PASS][48]
>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-tglb7/igt@gem_ctx_shared@exec-shared-gtt-render.html
>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-tglb3/igt@gem_ctx_shared@exec-shared-gtt-render.html
>
>    * igt@gem_exec_balancer@hang:
>      - shard-tglb:         [FAIL][49] -> [PASS][50]
>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-tglb5/igt@gem_exec_balancer@hang.html
>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-tglb1/igt@gem_exec_balancer@hang.html
>
>    * igt@gem_exec_parallel@vcs1-fds:
>      - shard-iclb:         [SKIP][51] ([fdo#112080]) -> [PASS][52] +15 similar issues
>     [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
>     [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html
>
>    * {igt@gem_exec_schedule@implicit-both-bsd1}:
>      - shard-iclb:         [SKIP][53] ([fdo#109276] / [i915#677]) -> [PASS][54]
>     [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd1.html
>     [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html
>
>    * igt@gem_exec_schedule@pi-distinct-iova-bsd:
>      - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56] +1 similar issue
>     [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
>     [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
>
>    * igt@gem_exec_schedule@preempt-queue-bsd1:
>      - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +17 similar issues
>     [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
>     [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
>
>    * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
>      - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +5 similar issues
>     [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
>     [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
>
>    * igt@gem_linear_blits@normal:
>      - shard-hsw:          [FAIL][61] ([i915#694]) -> [PASS][62] +1 similar issue
>     [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-hsw7/igt@gem_linear_blits@normal.html
>     [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-hsw7/igt@gem_linear_blits@normal.html
>
>    * igt@gem_ppgtt@flink-and-close-vma-leak:
>      - shard-kbl:          [FAIL][63] ([i915#644]) -> [PASS][64]
>     [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
>     [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
>
>    * igt@gem_userptr_blits@sync-unmap-after-close:
>      - shard-snb:          [DMESG-WARN][65] ([fdo#111870] / [i915#478]) -> [PASS][66]
>     [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
>     [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html
>
>    * igt@i915_selftest@live_gt_lrc:
>      - shard-tglb:         [INCOMPLETE][67] ([i915#1233]) -> [PASS][68]
>     [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-tglb2/igt@i915_selftest@live_gt_lrc.html
>     [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-tglb7/igt@i915_selftest@live_gt_lrc.html
>
>    * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
>      - shard-snb:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
>     [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-snb2/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
>     [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-snb1/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
>      - shard-glk:          [FAIL][71] ([i915#49]) -> [PASS][72]
>     [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
>     [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
>
>    * {igt@kms_hdr@bpc-switch-suspend}:
>      - shard-kbl:          [INCOMPLETE][73] ([fdo#103665]) -> [PASS][74]
>     [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
>     [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
>
>    * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>      - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +2 similar issues
>     [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>     [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>
>    * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
>      - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +5 similar issues
>     [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
>     [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
>
>    * igt@kms_plane_lowres@pipe-a-tiling-y:
>      - shard-glk:          [FAIL][79] ([i915#899]) -> [PASS][80]
>     [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
>     [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html
>
>    * igt@kms_psr@psr2_primary_mmap_gtt:
>      - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
>     [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html
>     [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
>
>    * igt@perf@gen12-mi-rpc:
>      - shard-tglb:         [TIMEOUT][83] ([fdo#112271] / [i915#1085]) -> [PASS][84]
>     [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-tglb1/igt@perf@gen12-mi-rpc.html
>     [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-tglb1/igt@perf@gen12-mi-rpc.html
>
>    * igt@perf_pmu@cpu-hotplug:
>      - shard-hsw:          [INCOMPLETE][85] ([i915#1176] / [i915#61]) -> [PASS][86]
>     [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-hsw6/igt@perf_pmu@cpu-hotplug.html
>     [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-hsw2/igt@perf_pmu@cpu-hotplug.html
>
>    
> #### Warnings ####
>
>    * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
>      - shard-snb:          [DMESG-WARN][87] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][88] ([fdo#110789] / [fdo#111870] / [i915#478])
>     [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
>     [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
>
>    * igt@kms_dp_dsc@basic-dsc-enable-edp:
>      - shard-iclb:         [SKIP][89] ([fdo#109349]) -> [DMESG-WARN][90] ([i915#1226])
>     [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5449/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html
>     [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
>
>    
>    {name}: This element is suppressed. This means it is ignored when computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>    [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>    [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>    [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>    [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
>    [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>    [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
>    [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
>    [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
>    [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>    [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>    [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
>    [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
>    [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
>    [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
>    [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
>    [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
>    [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>    [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>    [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
>    [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
>    [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>    [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>    [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
>    [i915#607]: https://gitlab.freedesktop.org/drm/intel/issues/607
>    [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>    [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
>    [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>    [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
>    [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
>    [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
>    [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>    [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
>    [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>    [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
>
>
> Participating hosts (8 -> 8)
> ------------------------------
>
>    No changes in participating hosts
>
>
> Build changes
> -------------
>
>    * CI: CI-20190529 -> None
>    * IGT: IGT_5449 -> IGTPW_4182
>
>    CI-20190529: 20190529
>    CI_DRM_7963: e0d737598eb749378a5dc4ed3dfafc6f79d512cb @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_4182: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/index.html
>    IGT_5449: 5c5d5952a04117074db660ad25d8a6010cbf6116 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4182/index.html


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
