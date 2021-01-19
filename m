Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 Jan 2021 10:22:16 -0000
Message-ID: <161105173697.4865.3313254074493280471@emeril.freedesktop.org>
References: <20210118114810.478581-1-jigar.bhatt@intel.com>
In-Reply-To: <20210118114810.478581-1-jigar.bhatt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fdc=3A_Validate_display_enters_to_DC9_state?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0920931787=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0920931787==
Content-Type: multipart/alternative;
 boundary="===============2532140407629706639=="

--===============2532140407629706639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_dc: Validate display enters to DC9 state
URL   : https://patchwork.freedesktop.org/series/86027/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9636_full -> IGTPW_5401_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5401_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5401_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5401_full:

### IGT changes ###

#### Possible regressions ####

  * igt@drm_read@short-buffer-wakeup:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw7/igt@drm_read@short-buffer-wakeup.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw7/igt@drm_read@short-buffer-wakeup.html

  * {igt@i915_pm_dc@dc9-dpms} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl3/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_color@pipe-c-legacy-gamma-reset:
    - shard-kbl:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl7/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-apl:          [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl7/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl4/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-glk:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk2/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk9/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-hsw:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw7/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw7/igt@kms_color@pipe-c-legacy-gamma-reset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9636_full and IGTPW_5401_full:

### New IGT tests (1) ###

  * igt@i915_pm_dc@dc9-dpms:
    - Statuses : 3 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.55] s

  

Known issues
------------

  Here are the changes found in IGTPW_5401_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-hsw:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-iclb:         [PASS][22] -> [DMESG-WARN][23] ([i915#2803])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb3/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#1610])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl8/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl7/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-hsw:          NOTRUN -> [SKIP][26] ([fdo#109271]) +178 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw6/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][27] ([fdo#109271]) +7 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#768])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#110426] / [i915#1704])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#110426] / [i915#1704])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#2912])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb2/igt@gem_vm_create@destroy-race.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb5/igt@gem_vm_create@destroy-race.html

  * {igt@i915_pm_dc@dc9-dpms} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][33] ([i915#2411])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb8/igt@i915_pm_dc@dc9-dpms.html
    - shard-snb:          NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-snb4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-hsw:          [PASS][35] -> [FAIL][36] ([i915#2768])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw5/igt@i915_pm_lpsp@screens-disabled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw2/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl3/igt@i915_pm_rpm@drm-resources-equal.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-hsw:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw5/igt@i915_pm_rpm@drm-resources-equal.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw2/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#579])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb3/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk2/igt@i915_pm_rpm@drm-resources-equal.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk9/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-apl:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl1/igt@i915_pm_rpm@drm-resources-equal.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl2/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#579])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb5/igt@i915_pm_rpm@drm-resources-equal.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb7/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb5/igt@kms_ccs@pipe-d-missing-ccs-buffer.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb4/igt@kms_chamelium@dp-frame-dump.html
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk7/igt@kms_chamelium@dp-frame-dump.html
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl1/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-hsw:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw4/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-apl:          [PASS][56] -> [FAIL][57] ([i915#54])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
    - shard-kbl:          [PASS][58] -> [FAIL][59] ([i915#54])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111825]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109274] / [fdo#109278])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][62] -> [FAIL][63] ([i915#2598])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][64] -> [INCOMPLETE][65] ([i915#2295])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271]) +8 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109280]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +9 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][69] -> [SKIP][70] ([i915#433])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#533])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#533])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][74] -> [SKIP][75] ([fdo#109441]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][76] -> [INCOMPLETE][77] ([i915#155] / [i915#2295])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-tglb:         [PASS][78] -> [DMESG-WARN][79] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-apl:          [PASS][80] -> [DMESG-WARN][81] ([i915#1602] / [i915#2635] / [i915#295])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-glk:          [PASS][82] -> [DMESG-WARN][83] ([i915#1602] / [i915#2635] / [i915#295])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-iclb:         [PASS][84] -> [DMESG-WARN][85] ([i915#1602])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [TIMEOUT][86] ([i915#2918]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk4/igt@gem_ctx_persistence@close-replace-race.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][88] ([i915#2842]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][90] ([i915#2842]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][92] ([i915#2842]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][94] ([i915#2842]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-glk:          [DMESG-WARN][96] ([i915#118] / [i915#95]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [FAIL][98] ([i915#2346]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-apl:          [FAIL][100] ([i915#79]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][102] ([fdo#109441]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][104] ([i915#658]) -> [SKIP][105] ([i915#588])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][106] ([i915#2684]) -> [WARN][107] ([i915#1804] / [i915#2684])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][108] ([i915#1804] / [i915#2684]) -> [WARN][109] ([i915#2684])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][110] -> [FAIL][111] ([i915#2105])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl6/igt@kms_content_protection@uevent.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl4/igt@kms_content_protection@uevent.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][112] ([i915#2920]) -> [SKIP][113] ([i915#658]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         [SKIP][114] ([i915#658]) -> [SKIP][115] ([i915#2920])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][116] ([i915#2295] / [i915#2505]) -> [FAIL][117] ([i915#2295])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         [FAIL][118] ([i915#2295] / [i915#2724]) -> ([FAIL][119], [FAIL][120], [FAIL][121]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2724])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb7/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@runner@aborted.html
    - shard-apl:          [FAIL][122] ([i915#2295]) -> ([FAIL][123], [FAIL][124], [FAIL][125]) ([i915#1610] / [i915#1814] / [i915#2295] / [i915#2426])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl8/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl3/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl7/igt@runner@aborted.html
    - shard-glk:          [FAIL][126] ([i915#2295] / [k.org#202321]) -> ([FAIL][127], [FAIL][128]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk5/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         [FAIL][129] ([i915#2295] / [i915#2667]) -> ([FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1602] / [i915#2295] / [i915#2667] / [i915#2843])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb5/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb3/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb5/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110426]: https://bugs.freedesktop.org/show_bug.cgi?id=110426
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1704]: https://gitlab.freedesktop.org/drm/intel/issues/1704
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2768]: https://gitlab.freedesktop.org/drm/intel/issues/2768
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2843]: https://gitlab.freedesktop.org/drm/intel/issues/2843
  [i915#2912]: https://gitlab.freedesktop.org/drm/intel/issues/2912
  [i915#2918]: https://gitlab.freedesktop.org/drm/intel/issues/2918
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5960 -> IGTPW_5401
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9636: f560ac388c527f2f166897c9091f7b9ad652050f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5401: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/index.html
  IGT_5960: ace82fcd5f3623f8dde7c220a825873dc53dfae4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/index.html

--===============2532140407629706639==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_dc: Validate display enters to DC9 state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86027/">https://patchwork.freedesktop.org/series/86027/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9636_full -&gt; IGTPW_5401_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5401_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5401_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5401_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-wakeup:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw7/igt@drm_read@short-buffer-wakeup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw7/igt@drm_read@short-buffer-wakeup.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@i915_pm_dc@dc9-dpms} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl3/igt@i915_pm_dc@dc9-dpms.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl7/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl7/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl4/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk2/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk9/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw7/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw7/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9636_full and IGTPW_5401_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_pm_dc@dc9-dpms:<ul>
<li>Statuses : 3 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5401_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw7/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb3/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2803">i915#2803</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl8/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl7/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw6/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +178 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110426">fdo#110426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1704">i915#1704</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110426">fdo#110426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1704">i915#1704</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb2/igt@gem_vm_create@destroy-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb5/igt@gem_vm_create@destroy-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2912">i915#2912</a>)</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_dc@dc9-dpms} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb8/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-snb4/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw5/igt@i915_pm_lpsp@screens-disabled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw2/igt@i915_pm_lpsp@screens-disabled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2768">i915#2768</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl3/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw5/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb3/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk2/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk9/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl1/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb5/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb7/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb5/igt@kms_ccs@pipe-d-missing-ccs-buffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb4/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk7/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl1/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw4/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb7/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk4/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2918">i915#2918</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk6/igt@gem_ctx_persistence@close-replace-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl6/igt@kms_content_protection@uevent.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-kbl4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-iclb6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-glk7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/shard-tglb1/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2843">i915#2843</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5960 -&gt; IGTPW_5401</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9636: f560ac388c527f2f166897c9091f7b9ad652050f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5401: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5401/index.html<br />
  IGT_5960: ace82fcd5f3623f8dde7c220a825873dc53dfae4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2532140407629706639==--

--===============0920931787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0920931787==--
