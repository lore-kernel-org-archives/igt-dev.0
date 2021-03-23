Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7586F89BD5
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 10:02:22 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 23 Mar 2021 11:02:16 +0100
Message-ID: <2893648.xgJ6IN8ObU@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <161608206562.12740.17398922160855506155@emeril.freedesktop.org>
References: <20210318120554.961342-1-janusz.krzysztofik@linux.intel.com>
 <161608206562.12740.17398922160855506155@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Be_more_specific_on_sysfs_vs=2E_debugfs_iss?=
 =?utf-8?q?ues?=
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
To: igt-dev@lists.freedesktop.org, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On czwartek, 18 marca 2021 16:41:05 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_hotunplug: Be more specific on sysfs vs. debugfs issues
> URL   : https://patchwork.freedesktop.org/series/88115/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_6036_full -> IGTPW_5621_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5621_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5621_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5621_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_persistence@close-replace-race:
>     - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb6/igt@gem_ctx_persistence@close-replace-race.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html

Not related to the change in any way - false positive.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5621_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_import_export@prime:
>     - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#750])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-tglb7/igt@drm_import_export@prime.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb2/igt@drm_import_export@prime.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-mixed:
>     - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +6 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-iclb:         [PASS][6] -> [TIMEOUT][7] ([i915#2369] / [i915#2481] / [i915#3070])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb8/igt@gem_eio@unwedge-stress.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb5/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@hang:
>     - shard-iclb:         [PASS][8] -> [INCOMPLETE][9] ([i915#1895] / [i915#3031])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb5/igt@gem_exec_balancer@hang.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb4/igt@gem_exec_balancer@hang.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-apl:          NOTRUN -> [FAIL][10] ([i915#2846])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl6/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
>     - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-wide-active@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2389])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html
> 
>   * igt@gem_exec_schedule@u-fairslice-all:
>     - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#1610] / [i915#2803])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl4/igt@gem_exec_schedule@u-fairslice-all.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl4/igt@gem_exec_schedule@u-fairslice-all.html
> 
>   * igt@gem_exec_whisper@basic-queues-forked-all:
>     - shard-glk:          [PASS][18] -> [DMESG-WARN][19] ([i915#118] / [i915#95])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#2190])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl6/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy:
>     - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#2428])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb1/igt@gem_mmap_gtt@cpuset-medium-copy.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-snb:          NOTRUN -> [WARN][23] ([i915#2658])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-snb5/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#768]) +1 similar issue
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109312])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb1/igt@gem_softpin@evict-snoop-interruptible.html
>     - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109312])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_userptr_blits@input-checking:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][27] ([i915#3002])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl3/igt@gem_userptr_blits@input-checking.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#1436] / [i915#716])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk7/igt@gen9_exec_parse@allowed-all.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk3/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_hangman@engine-error@vecs0:
>     - shard-kbl:          NOTRUN -> [SKIP][30] ([fdo#109271]) +88 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl4/igt@i915_hangman@engine-error@vecs0.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>     - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1937])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
> 
>   * igt@i915_selftest@live@client:
>     - shard-glk:          [PASS][32] -> [DMESG-FAIL][33] ([i915#3047])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk4/igt@i915_selftest@live@client.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk9/igt@i915_selftest@live@client.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-kbl:          NOTRUN -> [INCOMPLETE][34] ([i915#155] / [i915#794])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111614])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#2705])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl2/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_chamelium@vga-hpd-after-suspend:
>     - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109284] / [fdo#111827]) +2 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb1/igt@kms_chamelium@vga-hpd-after-suspend.html
>     - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk8/igt@kms_chamelium@vga-hpd-after-suspend.html
> 
>   * igt@kms_chamelium@vga-hpd-with-enabled-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb1/igt@kms_chamelium@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_color@pipe-c-degamma:
>     - shard-iclb:         NOTRUN -> [FAIL][40] ([i915#1149])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb3/igt@kms_color@pipe-c-degamma.html
>     - shard-tglb:         NOTRUN -> [FAIL][41] ([i915#1149])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb5/igt@kms_color@pipe-c-degamma.html
> 
>   * igt@kms_color@pipe-d-ctm-red-to-blue:
>     - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278] / [i915#1149])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb1/igt@kms_color@pipe-d-ctm-red-to-blue.html
> 
>   * igt@kms_color_chamelium@pipe-a-degamma:
>     - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl2/igt@kms_color_chamelium@pipe-a-degamma.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-max:
>     - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +18 similar issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl7/igt@kms_color_chamelium@pipe-c-ctm-max.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
>     - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +21 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-kbl:          NOTRUN -> [FAIL][46] ([i915#2105])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl4/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-512x512-random:
>     - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109279])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html
> 
>   * igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge:
>     - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278]) +5 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb3/igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111825]) +9 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109274]) +1 similar issue
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
>     - shard-apl:          NOTRUN -> [FAIL][51] ([i915#2641]) +1 similar issue
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
>     - shard-snb:          NOTRUN -> [SKIP][52] ([fdo#109271]) +311 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271]) +32 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109280]) +7 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#1187])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb1/igt@kms_hdr@static-toggle-suspend.html
>     - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#1187])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb3/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-d:
>     - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#533]) +1 similar issue
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
>     - shard-kbl:          NOTRUN -> [FAIL][58] ([fdo#108145] / [i915#265]) +2 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-apl:          NOTRUN -> [FAIL][59] ([fdo#108145] / [i915#265]) +4 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
>     - shard-glk:          NOTRUN -> [FAIL][60] ([fdo#108145] / [i915#265]) +1 similar issue
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>     - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#658])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
>     - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#658])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
>     - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#658]) +3 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
>     - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#658]) +4 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
> 
>   * igt@kms_psr2_su@page_flip:
>     - shard-iclb:         [PASS][65] -> [SKIP][66] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb2/igt@kms_psr2_su@page_flip.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb7/igt@kms_psr2_su@page_flip.html
> 
>   * igt@kms_psr@psr2_sprite_blt:
>     - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109441])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html
> 
>   * igt@kms_setmode@basic:
>     - shard-snb:          NOTRUN -> [FAIL][69] ([i915#31])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-snb7/igt@kms_setmode@basic.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-suspend:
>     - shard-tglb:         [PASS][70] -> [INCOMPLETE][71] ([i915#1436] / [i915#1982] / [i915#2828] / [i915#456])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
>     - shard-kbl:          [PASS][72] -> [INCOMPLETE][73] ([i915#155] / [i915#2405])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-idle:
>     - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271]) +229 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl6/igt@kms_vblank@pipe-d-ts-continuation-idle.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109502])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb7/igt@kms_vrr@flip-dpms.html
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109502])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb7/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2437]) +1 similar issue
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl3/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@prime_nv_api@i915_self_import_to_different_fd:
>     - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109291])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb7/igt@prime_nv_api@i915_self_import_to_different_fd.html
>     - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109291])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb5/igt@prime_nv_api@i915_self_import_to_different_fd.html
> 
>   * igt@sysfs_clients@recycle:
>     - shard-iclb:         [PASS][80] -> [FAIL][81] ([i915#3028])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb3/igt@sysfs_clients@recycle.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb7/igt@sysfs_clients@recycle.html
> 
>   * igt@sysfs_clients@recycle-many:
>     - shard-apl:          NOTRUN -> [FAIL][82] ([i915#3028])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl6/igt@sysfs_clients@recycle-many.html
>     - shard-kbl:          [PASS][83] -> [FAIL][84] ([i915#3028])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl1/igt@sysfs_clients@recycle-many.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl4/igt@sysfs_clients@recycle-many.html
> 
>   * igt@sysfs_clients@split-10@bcs0:
>     - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#3026])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl2/igt@sysfs_clients@split-10@bcs0.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109307])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb2/igt@tools_test@sysfs_l3_parity.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +1 similar issue
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-apl7/igt@gem_eio@in-flight-suspend.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl2/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-tglb:         [TIMEOUT][89] ([i915#2369] / [i915#3063]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-tglb8/igt@gem_eio@unwedge-stress.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb7/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         [FAIL][91] ([i915#2842]) -> [PASS][92] +1 similar issue
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-glk:          [FAIL][93] ([i915#2842]) -> [PASS][94] +1 similar issue
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk6/igt@gem_exec_fair@basic-none@vcs0.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs1:
>     - shard-kbl:          [FAIL][95] ([i915#2842]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
> 
>   * igt@gem_exec_whisper@basic-forked-all:
>     - shard-glk:          [DMESG-WARN][97] ([i915#118] / [i915#95]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk1/igt@gem_exec_whisper@basic-forked-all.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy:
>     - shard-glk:          [FAIL][99] ([i915#307]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk3/igt@gem_mmap_gtt@cpuset-big-copy.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk2/igt@gem_mmap_gtt@cpuset-big-copy.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-iclb:         [FAIL][101] ([i915#307]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-dp1:
>     - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [PASS][104] +1 similar issue
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-glk:          [FAIL][105] ([i915#49]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
>     - shard-kbl:          [FAIL][107] ([i915#49]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_psr2_su@frontbuffer:
>     - shard-iclb:         [SKIP][109] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
> 
>   * igt@kms_psr@psr2_sprite_plane_onoff:
>     - shard-iclb:         [SKIP][111] ([fdo#109441]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb6/igt@kms_psr@psr2_sprite_plane_onoff.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
> 
>   * igt@sysfs_clients@busy@vecs0:
>     - shard-kbl:          [FAIL][113] ([i915#3009]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl2/igt@sysfs_clients@busy@vecs0.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl1/igt@sysfs_clients@busy@vecs0.html
> 
>   * igt@sysfs_clients@split-10@bcs0:
>     - shard-glk:          [SKIP][115] ([fdo#109271] / [i915#3026]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-glk5/igt@sysfs_clients@split-10@bcs0.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-glk2/igt@sysfs_clients@split-10@bcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][117] ([i915#658]) -> [SKIP][118] ([i915#588])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-iclb:         [SKIP][119] ([i915#3116]) -> [FAIL][120] ([i915#3137])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
>     - shard-apl:          [DMESG-FAIL][121] ([IGT#6]) -> [DMESG-FAIL][122] ([IGT#6] / [i915#1982])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
>     - shard-iclb:         [SKIP][123] ([i915#2920]) -> [SKIP][124] ([i915#658])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          ([FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129]) ([i915#180] / [i915#2724] / [i915#3002]) -> ([FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133]) ([i915#2426] / [i915#2505] / [i915#2724] / [i915#3002])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl7/igt@runner@aborted.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl7/igt@runner@aborted.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl7/igt@runner@aborted.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl3/igt@runner@aborted.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-kbl3/igt@runner@aborted.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl6/igt@runner@aborted.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl1/igt@runner@aborted.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl7/igt@runner@aborted.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-kbl4/igt@runner@aborted.html
>     - shard-apl:          ([FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138]) ([i915#1610] / [i915#180] / [i915#1814] / [i915#2426] / [i915#2724] / [i915#3002]) -> ([FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1610] / [i915#2426] / [i915#3002])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-apl2/igt@runner@aborted.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-apl6/igt@runner@aborted.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-apl7/igt@runner@aborted.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-apl1/igt@runner@aborted.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-apl8/igt@runner@aborted.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl7/igt@runner@aborted.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl8/igt@runner@aborted.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-apl3/igt@runner@aborted.html
>     - shard-tglb:         ([FAIL][142], [FAIL][143], [FAIL][144]) ([i915#2667] / [i915#3002]) -> ([FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148]) ([i915#1602] / [i915#2667] / [i915#3002])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-tglb3/igt@runner@aborted.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-tglb2/igt@runner@aborted.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6036/shard-tglb1/igt@runner@aborted.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb5/igt@runner@aborted.html
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb7/igt@runner@aborted.html
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb5/igt@runner@aborted.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/shard-tglb3/igt@runner@aborted.html
> 
>   
>   [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109502]: https://bugs.freedesktop.org/show_bug.cgi?id=109502
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1187]:
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5621/index.html
> 




_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
