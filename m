Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 14:51:12 -0000
Message-ID: <160622947274.10864.17866988508401923600@emeril.freedesktop.org>
References: <20201124094149.1004-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201124094149.1004-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkZWQg?=
 =?utf-8?q?dynamic_Subtest_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0769683284=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0769683284==
Content-Type: multipart/alternative;
 boundary="===============8202443244388823789=="

--===============8202443244388823789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added dynamic Subtest (rev5)
URL   : https://patchwork.freedesktop.org/series/83576/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9382_full -> IGTPW_5215_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5215_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5215_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5215_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_bb@reset-flags:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@api_intel_bb@reset-flags.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw2/igt@api_intel_bb@reset-flags.html
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@api_intel_bb@reset-flags.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk4/igt@api_intel_bb@reset-flags.html
    - shard-snb:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb4/igt@api_intel_bb@reset-flags.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb2/igt@api_intel_bb@reset-flags.html
    - shard-kbl:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl6/igt@api_intel_bb@reset-flags.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl2/igt@api_intel_bb@reset-flags.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-iclb:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_eio@banned:
    - shard-tglb:         NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb2/igt@gem_eio@banned.html

  * igt@gem_eio@execbuf:
    - shard-iclb:         NOTRUN -> [FAIL][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb3/igt@gem_eio@execbuf.html

  * igt@gem_eio@in-flight-internal-immediate:
    - shard-glk:          NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk6/igt@gem_eio@in-flight-internal-immediate.html

  * igt@gem_userptr_blits@process-exit-busy:
    - shard-tglb:         [PASS][13] -> [SKIP][14] +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb3/igt@gem_userptr_blits@process-exit-busy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb2/igt@gem_userptr_blits@process-exit-busy.html
    - shard-iclb:         [PASS][15] -> [SKIP][16] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@gem_userptr_blits@process-exit-busy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb3/igt@gem_userptr_blits@process-exit-busy.html

  * {igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-fencing} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][17] +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb1/igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-fencing.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-tglb:         [PASS][18] -> [FAIL][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
    - shard-iclb:         [PASS][20] -> [FAIL][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][22] -> [INCOMPLETE][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-hsw:          [WARN][24] -> [FAIL][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@gem_eio@in-flight-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw1/igt@gem_eio@in-flight-suspend.html
    - shard-iclb:         [WARN][26] -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@gem_eio@in-flight-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         [SKIP][28] ([fdo#109313]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         [SKIP][30] ([fdo#109313]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         [SKIP][32] ([i915#768]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb5/igt@gem_render_copy@linear-to-vebox-yf-tiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb3/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@prime_vgem@basic-userptr}:
    - shard-tglb:         [PASS][34] -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@prime_vgem@basic-userptr.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb6/igt@prime_vgem@basic-userptr.html
    - shard-iclb:         [PASS][36] -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@prime_vgem@basic-userptr.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb6/igt@prime_vgem@basic-userptr.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9382_full and IGTPW_5215_full:

### New IGT tests (17) ###

  * igt@kms_atomic_transition@modeset-transitions:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transitions@1x-modeset-transitions:
    - Statuses : 7 pass(s)
    - Exec time: [0.71, 22.88] s

  * igt@kms_atomic_transition@modeset-transitions@1x-modeset-transitions-fencing:
    - Statuses : 7 pass(s)
    - Exec time: [0.75, 23.68] s

  * igt@kms_atomic_transition@modeset-transitions@1x-modeset-transitions-nonblocking:
    - Statuses : 7 pass(s)
    - Exec time: [0.75, 23.79] s

  * igt@kms_atomic_transition@modeset-transitions@1x-modeset-transitions-nonblocking-fencing:
    - Statuses : 7 pass(s)
    - Exec time: [0.75, 23.99] s

  * igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 12.43] s

  * igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions-fencing:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 12.67] s

  * igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions-nonblocking:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 12.40] s

  * igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions-nonblocking-fencing:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 12.42] s

  * igt@kms_atomic_transition@modeset-transitions@3x-modeset-transitions:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_transition@modeset-transitions@3x-modeset-transitions-fencing:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_transition@modeset-transitions@3x-modeset-transitions-nonblocking:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_transition@modeset-transitions@3x-modeset-transitions-nonblocking-fencing:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-fencing:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-nonblocking:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-nonblocking-fencing:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5215_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@reset-flags:
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#1635])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl2/igt@api_intel_bb@reset-flags.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl4/igt@api_intel_bb@reset-flags.html

  * igt@gem_exec_fence@invalid-timeline-fence-array:
    - shard-kbl:          [PASS][40] -> [SKIP][41] ([fdo#109271]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl3/igt@gem_exec_fence@invalid-timeline-fence-array.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl6/igt@gem_exec_fence@invalid-timeline-fence-array.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-hsw:          [PASS][42] -> [SKIP][43] ([fdo#109271]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#2389])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_userptr_blits@process-exit-busy:
    - shard-snb:          [PASS][46] -> [SKIP][47] ([fdo#109271]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@gem_userptr_blits@process-exit-busy.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb6/igt@gem_userptr_blits@process-exit-busy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][48] -> [WARN][49] ([i915#2681])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][50] -> [DMESG-FAIL][51] ([i915#118] / [i915#95])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-kbl:          [PASS][52] -> [FAIL][53] ([i915#54])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
    - shard-apl:          [PASS][54] -> [FAIL][55] ([i915#1635] / [i915#54])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-tglb:         [PASS][56] -> [DMESG-WARN][57] ([i915#1982]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
    - shard-apl:          [PASS][58] -> [DMESG-WARN][59] ([i915#1635] / [i915#1982]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-hsw:          [PASS][60] -> [DMESG-WARN][61] ([i915#1982])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw2/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][62] -> [FAIL][63] ([i915#79])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][64] -> [INCOMPLETE][65] ([i915#2635])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk2/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][66] -> [INCOMPLETE][67] ([i915#2637])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          [PASS][68] -> [FAIL][69] ([i915#1635] / [i915#79])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][70] -> [INCOMPLETE][71] ([i915#2055] / [i915#2295])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([fdo#109642] / [fdo#111068])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][74] -> [SKIP][75] ([fdo#109441]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr@psr2_basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb7/igt@kms_psr@psr2_basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-hsw:          [PASS][76] -> [FAIL][77] ([IGT#2])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@kms_sysfs_edid_timing.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-glk:          [PASS][78] -> [DMESG-WARN][79] ([i915#1982]) +5 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_vblank@pipe-c-wait-idle.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk8/igt@kms_vblank@pipe-c-wait-idle.html
    - shard-kbl:          [PASS][80] -> [DMESG-WARN][81] ([i915#1982]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_vblank@pipe-c-wait-idle.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl1/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [PASS][82] -> [SKIP][83] ([fdo#109271]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@perf_pmu@rc6-runtime-pm.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk2/igt@perf_pmu@rc6-runtime-pm.html
    - shard-apl:          [PASS][84] -> [SKIP][85] ([fdo#109271] / [i915#1635]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl8/igt@perf_pmu@rc6-runtime-pm.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl2/igt@perf_pmu@rc6-runtime-pm.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-iclb:         [SKIP][88] -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@i915_hangman@error-state-basic:
    - shard-snb:          [TIMEOUT][90] -> [PASS][91] +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@i915_hangman@error-state-basic.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb7/igt@i915_hangman@error-state-basic.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][92] ([i915#454]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][94] ([i915#2597]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb3/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][96] ([i915#1982]) -> [PASS][97] +5 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][98] ([i915#1635] / [i915#1982]) -> [PASS][99] +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl6/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][100] ([i915#1982]) -> [PASS][101] +5 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][102] ([i915#1982]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-tglb:         [FAIL][104] -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
    - shard-iclb:         [FAIL][106] -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:
    - shard-hsw:          [DMESG-WARN][108] ([i915#1982]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw2/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][110] ([fdo#109642] / [fdo#111068]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][112] ([fdo#109441]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [SKIP][114] ([fdo#109271]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@perf@disabled-read-error.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk5/igt@perf@disabled-read-error.html
    - shard-apl:          [SKIP][116] ([fdo#109271] / [i915#1635]) -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl8/igt@perf@disabled-read-error.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl3/igt@perf@disabled-read-error.html
    - shard-kbl:          [SKIP][118] ([fdo#109271]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl4/igt@perf@disabled-read-error.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl7/igt@perf@disabled-read-error.html
    - shard-tglb:         [SKIP][120] -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@perf@disabled-read-error.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb8/igt@perf@disabled-read-error.html
    - shard-hsw:          [SKIP][122] ([fdo#109271]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@perf@disabled-read-error.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw2/igt@perf@disabled-read-error.html

  * igt@prime_vgem@coherency-blt:
    - shard-tglb:         [INCOMPLETE][124] -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@prime_vgem@coherency-blt.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb5/igt@prime_vgem@coherency-blt.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          [SKIP][126] ([fdo#109271] / [i915#1099]) -> [SKIP][127] ([fdo#109271])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile.html
    - shard-hsw:          [SKIP][128] ([fdo#109271] / [i915#1099]) -> [SKIP][129] ([fdo#109271])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@gem_ctx_persistence@legacy-engines-hostile.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw6/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-snb:          [TIMEOUT][130] -> [SKIP][131] ([fdo#109271]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@gem_exec_schedule@preempt-queue.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb6/igt@gem_exec_schedule@preempt-queue.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][132] ([i915#2681]) -> [WARN][133] ([i915#1804])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [INCOMPLETE][134] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -> [DMESG-WARN][135] ([i915#2411]) +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_suspend@sysfs-reader.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-snb:          [TIMEOUT][136] -> [SKIP][137] ([fdo#109271] / [fdo#111827])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-tglb:         [DMESG-WARN][138] ([i915#2411]) -> [SKIP][139] ([fdo#111719])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@perf_pmu@rc6-runtime-pm.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb7/igt@perf_pmu@rc6-runtime-pm.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][140] ([i915#2295]) -> [FAIL][141] ([i915#2295] / [i915#483])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][142], [FAIL][143]) ([i915#2295] / [i915#483]) -> ([FAIL][144], [FAIL][145]) ([i915#2295])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][146], [FAIL][147]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -> ([FAIL][148], [FAIL][149]) ([i915#2295] / [k.org#202321])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk7/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk6/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#409]) -> [FAIL][154] ([i915#2295])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb5/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb7/igt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html

--===============8202443244388823789==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Added dynamic Subtest (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83576/">https://patchwork.freedesktop.org/series/83576/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9382_full -&gt; IGTPW_5215_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5215_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5215_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5215_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@api_intel_bb@reset-flags:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@api_intel_bb@reset-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw2/igt@api_intel_bb@reset-flags.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@api_intel_bb@reset-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk4/igt@api_intel_bb@reset-flags.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb4/igt@api_intel_bb@reset-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb2/igt@api_intel_bb@reset-flags.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl6/igt@api_intel_bb@reset-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl2/igt@api_intel_bb@reset-flags.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@banned:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb2/igt@gem_eio@banned.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@execbuf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb3/igt@gem_eio@execbuf.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-immediate:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk6/igt@gem_eio@in-flight-internal-immediate.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-busy:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb3/igt@gem_userptr_blits@process-exit-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb2/igt@gem_userptr_blits@process-exit-busy.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@gem_userptr_blits@process-exit-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb3/igt@gem_userptr_blits@process-exit-busy.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-fencing} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb1/igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-fencing.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@gem_eio@in-flight-suspend.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw1/igt@gem_eio@in-flight-suspend.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@gem_eio@in-flight-suspend.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb6/igt@gem_eio@in-flight-suspend.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb5/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb3/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@prime_vgem@basic-userptr}:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb6/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb6/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9382_full and IGTPW_5215_full:</p>
<h3>New IGT tests (17)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transitions:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@1x-modeset-transitions:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.71, 22.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@1x-modeset-transitions-fencing:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.75, 23.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@1x-modeset-transitions-nonblocking:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.75, 23.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@1x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.75, 23.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 12.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions-fencing:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 12.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions-nonblocking:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 12.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 12.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@3x-modeset-transitions:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@3x-modeset-transitions-fencing:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@3x-modeset-transitions-nonblocking:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@3x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-fencing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-nonblocking:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transitions@4x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5215_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@reset-flags:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl2/igt@api_intel_bb@reset-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl4/igt@api_intel_bb@reset-flags.html">FAIL</a> ([i915#1635])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@invalid-timeline-fence-array:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl3/igt@gem_exec_fence@invalid-timeline-fence-array.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl6/igt@gem_exec_fence@invalid-timeline-fence-array.html">SKIP</a> ([fdo#109271]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109271]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-busy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@gem_userptr_blits@process-exit-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb6/igt@gem_userptr_blits@process-exit-busy.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-FAIL</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">FAIL</a> ([i915#1635] / [i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw2/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk2/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> ([i915#2635])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">INCOMPLETE</a> ([i915#2637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">FAIL</a> ([i915#1635] / [i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2055] / [i915#2295])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb7/igt@kms_psr@psr2_basic.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk8/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> ([i915#1982]) +5 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl1/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> ([i915#1982]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk2/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> ([fdo#109271]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl8/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl2/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> ([fdo#109271] / [i915#1635]) +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@i915_hangman@error-state-basic.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb7/igt@i915_hangman@error-state-basic.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl6/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw2/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk5/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl8/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-apl3/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl4/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl7/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@perf@disabled-read-error.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb8/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw2/igt@perf@disabled-read-error.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@prime_vgem@coherency-blt.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb5/igt@prime_vgem@coherency-blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-hsw6/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@gem_exec_schedule@preempt-queue.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb6/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([fdo#109271]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb2/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-negative:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html">SKIP</a> ([fdo#109271] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@perf_pmu@rc6-runtime-pm.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb7/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> ([fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-kbl2/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-iclb2/igt@runner@aborted.html">FAIL</a>) ([i915#2295])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-glk2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@runner@aborted.html">FAIL</a>) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#409]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/shard-tglb7/igt">FAIL</a> ([i915#2295])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8202443244388823789==--

--===============0769683284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0769683284==--
