Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Mar 2020 08:49:27 -0000
Message-ID: <158495336744.9808.5807603175075903939@emeril.freedesktop.org>
References: <20200323064607.7041-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200323064607.7041-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fcreate=3A_Reverted_device_reopen_logic?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_create: Reverted device reopen logic
URL   : https://patchwork.freedesktop.org/series/74958/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8172_full -> IGTPW_4339_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4339_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4339_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4339_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload-no-display:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-tglb1/igt@i915_module_load@reload-no-display.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-tglb8/igt@i915_module_load@reload-no-display.html
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-kbl7/igt@i915_module_load@reload-no-display.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl7/igt@i915_module_load@reload-no-display.html

  
Known issues
------------

  Here are the changes found in IGTPW_4339_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#977])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-tglb7/igt@gem_busy@close-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-tglb6/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([i915#1402])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [PASS][9] -> [INCOMPLETE][10] ([fdo#103927] / [i915#1402])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-apl7/igt@gem_ctx_persistence@close-replace-race.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][11] -> [INCOMPLETE][12] ([i915#1402] / [i915#58] / [k.org#198133])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-glk7/igt@gem_ctx_persistence@close-replace-race.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#110841])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#110854])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112080]) +11 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109276] / [i915#677])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#677])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112146]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1401])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-tglb6/igt@gem_exec_whisper@basic-fds-all.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-tglb6/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#1318] / [i915#1401])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-tglb6/igt@gem_exec_whisper@basic-fds-forked.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-tglb5/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][29] -> [DMESG-WARN][30] ([fdo#111870] / [i915#478])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-hsw:          [PASS][31] -> [DMESG-WARN][32] ([fdo#111870]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [PASS][33] -> [INCOMPLETE][34] ([i915#82])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-snb6/igt@i915_module_load@reload-no-display.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-snb5/igt@i915_module_load@reload-no-display.html
    - shard-iclb:         [PASS][35] -> [INCOMPLETE][36] ([i915#1120])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb7/igt@i915_module_load@reload-no-display.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb2/igt@i915_module_load@reload-no-display.html
    - shard-apl:          [PASS][37] -> [INCOMPLETE][38] ([fdo#103927])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-apl7/igt@i915_module_load@reload-no-display.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl2/igt@i915_module_load@reload-no-display.html
    - shard-glk:          [PASS][39] -> [INCOMPLETE][40] ([i915#58] / [k.org#198133])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-glk7/igt@i915_module_load@reload-no-display.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk9/igt@i915_module_load@reload-no-display.html
    - shard-hsw:          [PASS][41] -> [INCOMPLETE][42] ([i915#61])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw7/igt@i915_module_load@reload-no-display.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw7/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#447])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-apl2/igt@i915_suspend@sysfs-reader.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#54])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#72])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-glk2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-hsw:          [PASS][51] -> [DMESG-WARN][52] ([i915#478])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw1/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw8/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#34])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-glk4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][55] -> [SKIP][56] ([i915#433])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#180]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109642] / [fdo#111068])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([fdo#109276]) +21 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][65] ([fdo#112080]) -> [PASS][66] +8 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb8/igt@gem_busy@extended-parallel-vcs1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [SKIP][67] ([fdo#112146]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb4/igt@gem_exec_schedule@deep-bsd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb3/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][69] ([i915#677]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][71] ([fdo#109276] / [i915#677]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-hsw:          [DMESG-WARN][73] ([i915#478]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw6/igt@gem_mmap_gtt@basic-small-copy-odd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw6/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-iclb:         [FAIL][75] ([i915#644]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-hsw:          [DMESG-WARN][77] ([fdo#111870]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw5/igt@gem_userptr_blits@sync-unmap.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw8/igt@gem_userptr_blits@sync-unmap.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][79] ([i915#716]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [FAIL][81] ([i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-glk:          [FAIL][83] ([i915#54]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [FAIL][85] ([i915#54]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-kbl:          [FAIL][87] ([i915#79]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][89] ([i915#155]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][97] ([fdo#112015]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][99] ([fdo#109278]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][101] ([fdo#109276]) -> [PASS][102] +21 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  * {igt@sysfs_preempt_timeout@timeout@vecs0}:
    - shard-glk:          [FAIL][103] ([i915#1459]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-glk1/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk8/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][105] ([i915#478]) -> [DMESG-WARN][106] ([fdo#110789] / [i915#478])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-snb:          [INCOMPLETE][107] ([i915#82]) -> [SKIP][108] ([fdo#109271])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-snb6/igt@i915_pm_rpm@gem-pread.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-snb5/igt@i915_pm_rpm@gem-pread.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116]) ([fdo#109271] / [fdo#111870] / [i915#1485]) -> ([FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125]) ([fdo#111870] / [i915#1485])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw8/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw5/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw7/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw6/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-hsw6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw1/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw8/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw5/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw5/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw8/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw7/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          [FAIL][126] ([i915#92]) -> ([FAIL][127], [FAIL][128], [FAIL][129]) ([i915#1389] / [i915#1402] / [i915#1485] / [i915#592] / [i915#92])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-kbl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl3/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          [FAIL][130] ([fdo#103927]) -> ([FAIL][131], [FAIL][132], [FAIL][133]) ([fdo#103927] / [i915#1402] / [i915#1485] / [i915#592])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-apl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl8/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-apl2/igt@runner@aborted.html
    - shard-glk:          [FAIL][134] ([k.org#202321]) -> ([FAIL][135], [FAIL][136]) ([i915#1402] / [i915#1485] / [k.org#202321])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/shard-glk1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk7/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/shard-glk9/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1459]: https://gitlab.freedesktop.org/drm/intel/issues/1459
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#592]: https://gitlab.freedesktop.org/drm/intel/issues/592
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5526 -> IGTPW_4339
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8172: b53e00acaa550df13d601f258011b180013c5d38 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4339: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/index.html
  IGT_5526: f49ebeee9f54d6f23c60a842f75f65561d452ab0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
