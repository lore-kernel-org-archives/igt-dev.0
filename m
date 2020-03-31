Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 31 Mar 2020 02:45:37 -0000
Message-ID: <158562273742.5566.14241758561820611729@emeril.freedesktop.org>
References: <20200330092117.810776-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200330092117.810776-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_i915/gem=5Fbad=5Freloc=3A_Redu?=
 =?utf-8?q?ce_negative_testing?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] i915/gem_bad_reloc: Reduce negative testing
URL   : https://patchwork.freedesktop.org/series/75221/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8213_full -> IGTPW_4371_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4371_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4371_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4371_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb7/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-tglb1/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8213_full and IGTPW_4371_full:

### New IGT tests (33) ###

  * igt@gem_bad_reloc@negative-reloc:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_bad_reloc@negative-reloc-lut:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_async@concurrent-writes:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_async@concurrent-writes@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_async@concurrent-writes@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_async@concurrent-writes@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_async@concurrent-writes@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_async@concurrent-writes@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_capture@capture:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_capture@capture@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_exec_capture@capture@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_capture@capture@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@gem_exec_capture@capture@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@gem_exec_capture@capture@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@gem_exec_parallel@basic@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.41, 1.61] s

  * igt@gem_exec_parallel@basic@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.41, 1.81] s

  * igt@gem_exec_parallel@basic@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [1.32, 1.58] s

  * igt@gem_exec_parallel@basic@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.33] s

  * igt@gem_exec_parallel@basic@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [1.28, 1.68] s

  * igt@gem_exec_parallel@contexts@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.35, 3.21] s

  * igt@gem_exec_parallel@contexts@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.47, 3.79] s

  * igt@gem_exec_parallel@contexts@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.37, 3.49] s

  * igt@gem_exec_parallel@contexts@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [2.04, 2.88] s

  * igt@gem_exec_parallel@contexts@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.42, 3.50] s

  * igt@gem_exec_parallel@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_parallel@engines@basic:
    - Statuses : 7 pass(s)
    - Exec time: [1.33, 1.69] s

  * igt@gem_exec_parallel@engines@contexts:
    - Statuses : 7 pass(s)
    - Exec time: [1.41, 3.38] s

  * igt@gem_exec_parallel@engines@fds:
    - Statuses : 7 pass(s)
    - Exec time: [1.41, 3.58] s

  * igt@gem_exec_parallel@fds@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.69, 3.57] s

  * igt@gem_exec_parallel@fds@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.84, 3.86] s

  * igt@gem_exec_parallel@fds@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.61, 3.95] s

  * igt@gem_exec_parallel@fds@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 3.31] s

  * igt@gem_exec_parallel@fds@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.83, 3.78] s

  

Known issues
------------

  Here are the changes found in IGTPW_4371_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [i915#677]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +12 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#1119] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1119] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#72])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#57])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#155])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1297])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl4/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible.html
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl8/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl2/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#433])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([fdo#108145] / [i915#93] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([fdo#108145] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#93] / [i915#95]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb4/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [i915#677]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][51] ([i915#677]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_wait@await-vcs1:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb5/igt@gem_wait@await-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb4/igt@gem_wait@await-vcs1.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [INCOMPLETE][59] ([i915#1390]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [INCOMPLETE][61] ([i915#1390] / [i915#58] / [k.org#198133]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [INCOMPLETE][63] ([i915#82]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-iclb:         [INCOMPLETE][65] ([i915#1390] / [i915#140]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb3/igt@i915_module_load@reload-with-fault-injection.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-hsw:          [INCOMPLETE][67] ([i915#61]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@requests:
    - shard-iclb:         [INCOMPLETE][69] ([i915#1505]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb6/igt@i915_selftest@live@requests.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb1/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][73] ([i915#155]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][75] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [FAIL][77] ([i915#54] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][79] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][81] ([i915#52] / [i915#54]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][83] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][85] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-fences:
    - shard-kbl:          [DMESG-WARN][87] ([i915#1297]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_flip@flip-vs-fences.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl4/igt@kms_flip@flip-vs-fences.html
    - shard-apl:          [DMESG-WARN][89] ([i915#1297]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl8/igt@kms_flip@flip-vs-fences.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl3/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][91] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][93] ([i915#95]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][95] ([i915#93] / [i915#95]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl4/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][97] ([fdo#108145] / [i915#93] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][99] ([fdo#108145] / [i915#95]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][101] ([i915#173]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@kms_psr@no_drrs.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb4/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-query-forked-hang:
    - shard-snb:          [SKIP][105] ([fdo#109271]) -> [PASS][106] +5 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb1/igt@kms_vblank@pipe-a-query-forked-hang.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-snb5/igt@kms_vblank@pipe-a-query-forked-hang.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][107] ([i915#1542]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb5/igt@perf@polling-parameterized.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb3/igt@perf@polling-parameterized.html
    - shard-hsw:          [FAIL][109] ([i915#1542]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw6/igt@perf@polling-parameterized.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-hsw1/igt@perf@polling-parameterized.html
    - shard-tglb:         [FAIL][111] ([i915#1542]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb5/igt@perf@polling-parameterized.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-tglb1/igt@perf@polling-parameterized.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][113] ([fdo#109276]) -> [PASS][114] +14 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][115] ([i915#1390] / [i915#879]) -> [INCOMPLETE][116] ([i915#1423] / [i915#879])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@i915_module_load@reload-with-fault-injection.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-apl:          [INCOMPLETE][117] ([i915#1390]) -> [INCOMPLETE][118] ([i915#1423])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@i915_module_load@reload-with-fault-injection.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-snb:          [SKIP][119] ([fdo#109271]) -> [INCOMPLETE][120] ([i915#82])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb2/igt@i915_pm_rpm@pm-tiling.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-snb5/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          [FAIL][121] ([i915#1121] / [i915#64]) -> [FAIL][122] ([i915#64])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][123] ([fdo#108145] / [i915#95]) -> [FAIL][124] ([fdo#108145])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][125] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][126] ([fdo#108145])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][127] ([i915#1423] / [i915#1485] / [i915#92]) -> [FAIL][128] ([i915#1423] / [i915#92])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          [FAIL][129] ([i915#1423] / [i915#1485]) -> [FAIL][130] ([i915#1423])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#1505]: https://gitlab.freedesktop.org/drm/intel/issues/1505
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
