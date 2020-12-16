Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 16 Dec 2020 04:52:05 -0000
Message-ID: <160809432598.16512.9440587762058714622@emeril.freedesktop.org>
References: <20201215210658.1188718-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201215210658.1188718-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Fparams=3A_As?=
 =?utf-8?q?sert_a_4G_object_does_=5Fnot=5F_fit_without_48b_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1935970436=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1935970436==
Content-Type: multipart/alternative;
 boundary="===============5784273655917755653=="

--===============5784273655917755653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/gem_exec_params: Assert a 4G object does _not_ fit without 48b (rev2)
URL   : https://patchwork.freedesktop.org/series/84976/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9489_full -> IGTPW_5296_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5296_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5296_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5296_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb3/igt@gem_exec_params@larger-than-life-batch.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb6/igt@gem_exec_params@larger-than-life-batch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html
    - shard-iclb:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb6/igt@kms_hdr@bpc-switch-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb8/igt@kms_hdr@bpc-switch-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_balancer@fairslice}:
    - shard-iclb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb3/igt@gem_exec_balancer@fairslice.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb4/igt@gem_exec_balancer@fairslice.html

  * {igt@gem_exec_schedule@u-fairslice@vecs0}:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-tglb7/igt@gem_exec_schedule@u-fairslice@vecs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb5/igt@gem_exec_schedule@u-fairslice@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9489_full and IGTPW_5296_full:

### New IGT tests (1) ###

  * igt@gem_softpin@zero:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_5296_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2389])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2389])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][14] ([i915#2658])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl4/igt@gem_pread@exhaustion.html

  * {igt@gem_softpin@zero} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-snb4/igt@gem_softpin@zero.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#454])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_chamelium@dp-crc-fast:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb5/igt@kms_chamelium@dp-crc-fast.html
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl1/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/igt@kms_chamelium@hdmi-aspect-ratio.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb3/igt@kms_chamelium@hdmi-aspect-ratio.html
    - shard-kbl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl2/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][23] ([fdo#109271]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl7/igt@kms_color@pipe-d-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109278] / [i915#1149])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-hsw:          NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw4/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111828])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb2/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][27] ([i915#1319])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl4/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109300] / [fdo#111066])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb5/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][29] ([i915#1319])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109279])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109278] / [fdo#109279])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][34] -> [FAIL][35] ([i915#96])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-iclb:         [PASS][36] -> [DMESG-WARN][37] ([i915#262])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb7/igt@kms_dp_aux_dev.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb7/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109274]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111825]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#2122])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][42] -> [FAIL][43] ([i915#2598])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][44] -> [INCOMPLETE][45] ([i915#2295])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-hsw:          NOTRUN -> [SKIP][47] ([fdo#109271]) +14 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271]) +11 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][49] -> [SKIP][50] ([i915#433])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-glk:          [PASS][51] -> [DMESG-WARN][52] ([i915#2635])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk6/igt@kms_hdr@bpc-switch-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/igt@kms_hdr@bpc-switch-suspend.html
    - shard-hsw:          [PASS][53] -> [DMESG-WARN][54] ([i915#2637])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-hsw6/igt@kms_hdr@bpc-switch-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw1/igt@kms_hdr@bpc-switch-suspend.html
    - shard-tglb:         [PASS][55] -> [DMESG-WARN][56] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-tglb2/igt@kms_hdr@bpc-switch-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271]) +22 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl7/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109289])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109289])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][60] -> [SKIP][61] ([fdo#109441]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109441])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][63] -> [FAIL][64] ([i915#1542])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk5/igt@perf@polling-parameterized.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/igt@perf@polling-parameterized.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][65] ([i915#2295] / [i915#483])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw1/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-glk:          [DMESG-WARN][66] ([i915#118] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk2/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk9/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * {igt@gem_exec_schedule@u-fairslice@vcs0}:
    - shard-apl:          [DMESG-WARN][68] ([i915#1610]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-apl7/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl2/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][70] ([i915#644]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][72] ([i915#1519]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-kbl:          [FAIL][74] ([i915#2521]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_legacy@pipe-b-forked-bo:
    - shard-hsw:          [INCOMPLETE][76] -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-hsw4/igt@kms_cursor_legacy@pipe-b-forked-bo.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw7/igt@kms_cursor_legacy@pipe-b-forked-bo.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][78] -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk7/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-hdmi-a1-hdmi-a2.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-vga1-hdmi-a1:
    - shard-hsw:          [FAIL][80] ([i915#2122]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ac-vga1-hdmi-a1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw7/igt@kms_flip@2x-plain-flip-fb-recreate@ac-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [FAIL][82] ([i915#2122]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][84] ([i915#49]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][86] ([fdo#109441]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * {igt@perf@non-zero-reason}:
    - shard-iclb:         [FAIL][88] -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb5/igt@perf@non-zero-reason.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb7/igt@perf@non-zero-reason.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][90] ([i915#2681] / [i915#2684]) -> [WARN][91] ([i915#1804] / [i915#2684])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][92] ([i915#579]) -> [SKIP][93] ([fdo#109293] / [fdo#109506])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb3/igt@i915_pm_rpm@pc8-residency.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb4/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][94] ([i915#579]) -> [SKIP][95] ([fdo#109506] / [i915#2411])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][96] ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][97], [FAIL][98], [FAIL][99]) ([i915#1436] / [i915#1814] / [i915#2295] / [i915#2722] / [i915#483])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-kbl4/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl2/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl3/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         [FAIL][100] ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -> ([FAIL][101], [FAIL][102]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-iclb6/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb8/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][103], [FAIL][104]) ([i915#1610] / [i915#2295] / [i915#2426] / [i915#2722]) -> ([FAIL][105], [FAIL][106]) ([i915#1814] / [i915#2295] / [i915#2722])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-apl7/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-apl8/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl1/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl7/igt@runner@aborted.html
    - shard-glk:          [FAIL][107] ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][108], [FAIL][109]) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-glk6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk4/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/igt@runner@aborted.html
    - shard-tglb:         [FAIL][110] ([i915#2295] / [i915#2722]) -> ([FAIL][111], [FAIL][112], [FAIL][113]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2722])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-tglb2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb1/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5902 -> IGTPW_5296
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9489: bef2104ec6e0aa163b1b01b661e734b08b567aeb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5296: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/index.html
  IGT_5902: 1c1fc6c4d506dc69d8e85b09bcb932466712d416 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/index.html

--===============5784273655917755653==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] i915/gem_ex=
ec_params: Assert a 4G object does _not_ fit without 48b (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84976/">https://patchwork.freedesktop.org/series/84976/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5296/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9489_full -&gt; IGTPW_5296_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5296_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5296_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5296=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-iclb3/igt@gem_exec_params@larger-than-life-batch.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_529=
6/shard-iclb6/igt@gem_exec_params@larger-than-life-batch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl7/i=
gt@kms_hdr@bpc-switch-suspend.html">DMESG-FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-iclb6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb8=
/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-iclb3/igt@gem_exec_balancer@fairslice.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-icl=
b4/igt@gem_exec_balancer@fairslice.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vecs0}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-tglb7/igt@gem_exec_schedule@u-fairslice@vecs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/s=
hard-tglb5/igt@gem_exec_schedule@u-fairslice@vecs0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9489_full and IGTPW_5296_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_softpin@zero:<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5296_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/=
shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-apl4/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@zero} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-snb4/igt@gem_softpin@zero.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb6/igt@i9=
15_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-iclb5/igt@kms_chamelium@dp-crc-fast.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fd=
o#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-apl1/igt@kms_chamelium@dp-crc-fast.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-glk1/igt@kms_chamelium@hdmi-aspect-ratio.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-tglb3/igt@kms_chamelium@hdmi-aspect-ratio.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-kbl2/igt@kms_chamelium@hdmi-aspect-ratio.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-kbl7/igt@kms_color@pipe-d-ctm-blue-to-red.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1149">i915#1149</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-hsw4/igt@kms_color_chamelium@pipe-d-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-tglb2/igt@kms_content_protection@srm.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111828">f=
do#111828</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-kbl4/igt@kms_content_protection@srm.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-iclb5/igt@kms_content_protection@srm.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">f=
do#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-apl1/igt@kms_content_protection@srm.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/s=
hard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5296/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96=
">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-iclb7/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb7/igt@kms_dp=
_aux_dev.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-iclb8/igt@kms_flip@2x-flip-vs-wf_vblank-inte=
rruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-tglb3/igt@kms_flip@2x-plain-flip-fb-recreate=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5296/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recr=
eate-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5296/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5296/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +14 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-rgb=
101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tg=
lb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-glk6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/i=
gt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-hsw6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-hsw1/i=
gt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-tglb2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb8=
/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-apl7/igt@kms_pipe_b_c_ivb@disable-pipe-b-enab=
le-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +22 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-iclb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-ena=
ble-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5296/shard-tglb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-ena=
ble-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-i=
clb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-iclb7/igt@kms_psr@psr2_suspend.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-glk5/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/=
igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-hsw1/igt@runner@aborted.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483<=
/a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-glk2/igt@gem_exec_flush@basic-batch-kernel-default-uc.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5296/shard-glk9/igt@gem_exec_flush@basic-batch-kernel-default=
-uc.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs0}:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-apl7/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">=
i915#1610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5296/shard-apl2/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/644">i915#64=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296=
/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/s=
hard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521"=
>i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5296/shard-kbl3/igt@kms_async_flips@alternate-sync-async-flip.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-b-forked-bo:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-hsw4/igt@kms_cursor_legacy@pipe-b-forked-bo.html">INCOMP=
LETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
96/shard-hsw7/igt@kms_cursor_legacy@pipe-b-forked-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-glk7/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-hdmi-a1-=
hdmi-a2.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5296/shard-glk1/igt@kms_flip@2x-flip-vs-modeset-vs-hang@a=
b-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ac-vga1-hdmi=
-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5296/shard-hsw7/igt@kms_flip@2x-plain-flip-fb-recreate@ac-vga=
1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/212=
2">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5296/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-=
pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5296/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndsc=
rn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/=
shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@perf@non-zero-reason}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-iclb5/igt@perf@non-zero-reason.html">FAIL</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb7/igt@=
perf@non-zero-reason.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#268=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5296/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-iclb3/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-ic=
lb4/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109293">fdo#109293</a> / <a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tg=
lb6/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109506">fdo#109506</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-kbl4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-k=
bl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5296/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-kbl7/igt=
@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-iclb6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483<=
/a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/=
shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5296/shard-iclb8/igt@runner@aborted.html">FAI=
L</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i9=
15#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9489/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9489/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-apl1/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/sha=
rd-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-glk6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a hr=
ef=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/sh=
ard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5296/shard-glk1/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1=
814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">=
i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2722">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?i=
d=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9489/shard-tglb2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb=
1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5296/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/shard-tglb8/igt=
@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5902 -&gt; IGTPW_5296</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9489: bef2104ec6e0aa163b1b01b661e734b08b567aeb @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5296: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5296/index.htm=
l<br />
  IGT_5902: 1c1fc6c4d506dc69d8e85b09bcb932466712d416 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5784273655917755653==--

--===============1935970436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1935970436==--
