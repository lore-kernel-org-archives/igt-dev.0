Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 16 Dec 2020 01:44:54 -0000
Message-ID: <160808309439.16511.16345299692602471405@emeril.freedesktop.org>
References: <20201215174656.3956-1-jcline@redhat.com>
In-Reply-To: <20201215174656.3956-1-jcline@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?device=5Freset=3A_check_for_i915_in_unbind=5Freset=5Frebind=28?=
 =?utf-8?b?KSAocmV2Mik=?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0483659101=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeremy Cline <jcline@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0483659101==
Content-Type: multipart/alternative;
 boundary="===============5623414832508840503=="

--===============5623414832508840503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/device_reset: check for i915 in unbind_reset_rebind() (rev2)
URL   : https://patchwork.freedesktop.org/series/84971/
State : success

== Summary ==

CI Bug Log - changes from IGT_5902_full -> IGTPW_5294_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5294_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf@non-zero-reason}:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb8/igt@perf@non-zero-reason.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb3/igt@perf@non-zero-reason.html

  
Known issues
------------

  Here are the changes found in IGTPW_5294_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2389])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][7] ([i915#2389])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-kbl:          [PASS][8] -> [SKIP][9] ([fdo#109271])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl3/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-apl:          [PASS][10] -> [SKIP][11] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl4/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-glk:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-hsw:          [PASS][14] -> [SKIP][15] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-hsw8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_chamelium@dp-crc-fast:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb6/igt@kms_chamelium@dp-crc-fast.html
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl7/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk7/igt@kms_chamelium@hdmi-aspect-ratio.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb1/igt@kms_chamelium@hdmi-aspect-ratio.html
    - shard-kbl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl4/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271]) +9 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl4/igt@kms_color@pipe-d-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109278] / [i915#1149])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-hsw:          NOTRUN -> [SKIP][23] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-hsw8/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#111828])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb2/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][25] ([i915#1319])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl1/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109300] / [fdo#111066])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][27] ([i915#1319])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109279])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109278] / [fdo#109279])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][30] -> [FAIL][31] ([i915#2346]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [PASS][32] -> [INCOMPLETE][33] ([i915#1185])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb7/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglb:         [PASS][34] -> [INCOMPLETE][35] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb2/igt@kms_fbcon_fbt@psr-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109274]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111825]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][38] -> [FAIL][39] ([i915#2598])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#49])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-hsw:          NOTRUN -> [SKIP][43] ([fdo#109271]) +19 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][44] ([fdo#109271]) +11 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271]) +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109289])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb3/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109289])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes:
    - shard-tglb:         [PASS][48] -> [INCOMPLETE][49] ([i915#1436] / [i915#1982] / [i915#456])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109441])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb7/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109441])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-hsw:          [PASS][53] -> [DMESG-WARN][54] ([i915#2637])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-hsw8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
    - shard-glk:          [PASS][55] -> [DMESG-WARN][56] ([i915#1602] / [i915#2635])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
    - shard-apl:          [PASS][57] -> [DMESG-WARN][58] ([i915#1602] / [i915#2635])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
    - shard-iclb:         [PASS][59] -> [DMESG-WARN][60] ([i915#1602])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
    - shard-kbl:          [PASS][61] -> [DMESG-WARN][62] ([i915#1602])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][63] ([i915#2295])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-hsw8/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-hsw:          [WARN][64] ([i915#2283]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw2/igt@device_reset@unbind-reset-rebind.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-hsw4/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][66] ([i915#644]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-hsw:          [INCOMPLETE][68] -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-hsw4/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk8/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk6/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][72] ([i915#49]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-iclb:         [FAIL][74] ([i915#49]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-kbl:          [DMESG-WARN][76] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl4/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][80] ([i915#1804] / [i915#2684]) -> [WARN][81] ([i915#2681] / [i915#2684])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-iclb:         [SKIP][82] ([fdo#110892]) -> [SKIP][83] ([i915#579])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][84] ([i915#579]) -> [SKIP][85] ([fdo#109293] / [fdo#109506])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][86] ([i915#579]) -> [SKIP][87] ([fdo#109506] / [i915#2411])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb3/igt@i915_pm_rpm@pc8-residency.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][88] ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][89], [FAIL][90]) ([i915#1436] / [i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl6/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl1/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         [FAIL][91] ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -> ([FAIL][92], [FAIL][93], [FAIL][94]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb1/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb7/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb3/igt@runner@aborted.html
    - shard-apl:          [FAIL][95] ([i915#2295] / [i915#2722]) -> ([FAIL][96], [FAIL][97]) ([i915#1814] / [i915#2295] / [i915#2722])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl3/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl4/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl4/igt@runner@aborted.html
    - shard-glk:          [FAIL][98] ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][99], [FAIL][100]) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk6/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk2/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         [FAIL][101] ([i915#2295] / [i915#2722]) -> ([FAIL][102], [FAIL][103], [FAIL][104]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2722])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb5/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb8/igt@runner@aborted.html

  
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
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5902 -> IGTPW_5294

  CI-20190529: 20190529
  CI_DRM_9488: 610a032e0c8eff40d87d9344f92311382f4acd49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5294: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/index.html
  IGT_5902: 1c1fc6c4d506dc69d8e85b09bcb932466712d416 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/index.html

--===============5623414832508840503==
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
<tr><td><b>Series:</b></td><td>tests/device_reset: check for i915 in unbind=
_reset_rebind() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84971/">https://patchwork.freedesktop.org/series/84971/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5294/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5902_full -&gt; IGTPW_5294_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5294=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@perf@non-zero-reason}:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-iclb8/igt@perf@non-zero-reason.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb3/igt@per=
f@non-zero-reason.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5294_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/sh=
ard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/sha=
rd-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-kbl4/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl3/igt@i=
915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-apl6/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl4/igt@i=
915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-glk4/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-glk2/igt@i=
915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-hsw1/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-hsw8/igt@i=
915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-iclb6/igt@kms_chamelium@dp-crc-fast.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fd=
o#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-apl7/igt@kms_chamelium@dp-crc-fast.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-glk7/igt@kms_chamelium@hdmi-aspect-ratio.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-tglb1/igt@kms_chamelium@hdmi-aspect-ratio.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-kbl4/igt@kms_chamelium@hdmi-aspect-ratio.html=
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
tree/drm-tip/IGTPW_5294/shard-kbl4/igt@kms_color@pipe-d-ctm-blue-to-red.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.ht=
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
/tree/drm-tip/IGTPW_5294/shard-hsw8/igt@kms_color_chamelium@pipe-d-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-tglb2/igt@kms_content_protection@srm.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111828">f=
do#111828</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-kbl1/igt@kms_content_protection@srm.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-iclb4/igt@kms_content_protection@srm.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">f=
do#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-apl1/igt@kms_content_protection@srm.html">TIM=
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
tree/drm-tip/IGTPW_5294/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/=
shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb7/igt=
@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-tglb2/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb5/igt=
@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-inte=
rruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-tglb7/igt@kms_flip@2x-plain-flip-fb-recreate=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/s=
hard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plf=
lip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5294/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-sh=
rfb-plflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +19 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-rgb=
101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-apl4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enab=
le-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-iclb3/igt@kms_pipe_b_c_ivb@disable-pipe-b-ena=
ble-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5294/shard-tglb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-ena=
ble-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe=
-d-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5294/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-d-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb7/=
igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@kms_psr@psr2_suspend.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5294/shard-hsw8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
37">i915#2637</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-glk5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5294/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
02">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5294/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
02">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5294/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5294/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
02">i915#1602</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-hsw8/igt@runner@aborted.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)=
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-hsw2/igt@device_reset@unbind-reset-rebind.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/sh=
ard-hsw4/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/sh=
ard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-random:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-hsw7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5294/shard-hsw4/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-glk8/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdm=
i-a2.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5294/shard-glk6/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-h=
dmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgf=
lip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5294/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-move.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5294/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-=
spr-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i91=
5#165</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
78">i915#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5294/shard-kbl4/igt@kms_plane_lowres@pipe-a-tiling-none.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/=
shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#=
2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
294/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5902/shard-iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110892</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-=
iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-iclb=
7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109293">fdo#109293</a> / <a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb=
3/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109506">fdo#109506</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-kbl6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-kbl=
1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5294/shard-kbl3/igt@runner@aborted.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#18=
14</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i=
915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/602">i915#602</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-iclb1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/sha=
rd-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5294/shard-iclb4/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-ic=
lb3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-apl3/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-apl4/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5294/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#=
2722</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-glk6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=
=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shar=
d-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5294/shard-glk8/igt@runner@aborted.html">FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#181=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i9=
15#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/27=
22">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=
=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5902/shard-tglb5/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb5/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5294/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/shard-tglb8/igt@ru=
nner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5902 -&gt; IGTPW_5294</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9488: 610a032e0c8eff40d87d9344f92311382f4acd49 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5294: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5294/index.htm=
l<br />
  IGT_5902: 1c1fc6c4d506dc69d8e85b09bcb932466712d416 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5623414832508840503==--

--===============0483659101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0483659101==--
