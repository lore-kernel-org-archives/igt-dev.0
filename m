Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 17 Dec 2020 12:27:05 -0000
Message-ID: <160820802531.2011.16561269270818207047@emeril.freedesktop.org>
References: <20201217093857.3283640-1-kunal1.joshi@intel.com>
In-Reply-To: <20201217093857.3283640-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=5Fchamelium_fix_update_success?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0472550589=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0472550589==
Content-Type: multipart/alternative;
 boundary="===============0057748691568092047=="

--===============0057748691568092047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color_chamelium fix update success
URL   : https://patchwork.freedesktop.org/series/85038/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9496_full -> IGTPW_5304_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5304_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5304_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5304_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@fence-restore-untiled:
    - shard-iclb:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb7/igt@i915_suspend@fence-restore-untiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb2/igt@i915_suspend@fence-restore-untiled.html
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-kbl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-kbl3/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl1/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9496_full and IGTPW_5304_full:

### New IGT tests (4) ###

  * igt@kms_atomic_transition@modeset-transition:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5304_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_exec_endless@dispatch@vecs0:
    - shard-iclb:         [PASS][8] -> [INCOMPLETE][9] ([i915#2502])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb8/igt@gem_exec_endless@dispatch@vecs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb8/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][10] ([fdo#109271]) +9 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk2/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([fdo#112283])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb7/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#112283])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb5/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][13] ([i915#2389]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-snb6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][14] ([i915#2658])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-snb2/igt@gem_pwrite@basic-exhaustion.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1937])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([i915#579])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb1/igt@i915_pm_rpm@sysfs-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb3/igt@i915_pm_rpm@sysfs-read.html
    - shard-apl:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-apl6/igt@i915_pm_rpm@sysfs-read.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl4/igt@i915_pm_rpm@sysfs-read.html
    - shard-glk:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk4/igt@i915_pm_rpm@sysfs-read.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk7/igt@i915_pm_rpm@sysfs-read.html
    - shard-tglb:         [PASS][22] -> [SKIP][23] ([i915#579])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb8/igt@i915_pm_rpm@sysfs-read.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb5/igt@i915_pm_rpm@sysfs-read.html
    - shard-hsw:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-hsw1/igt@i915_pm_rpm@sysfs-read.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw1/igt@i915_pm_rpm@sysfs-read.html
    - shard-kbl:          [PASS][26] -> [SKIP][27] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-kbl2/igt@i915_pm_rpm@sysfs-read.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl2/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [PASS][28] -> [DMESG-WARN][29] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb6/igt@i915_suspend@debugfs-reader.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb5/igt@i915_suspend@debugfs-reader.html
    - shard-glk:          [PASS][30] -> [DMESG-WARN][31] ([i915#1602] / [i915#2635])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk7/igt@i915_suspend@debugfs-reader.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk7/igt@i915_suspend@debugfs-reader.html
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#1602] / [i915#2635])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-apl8/igt@i915_suspend@debugfs-reader.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl4/igt@i915_suspend@debugfs-reader.html
    - shard-iclb:         [PASS][34] -> [DMESG-WARN][35] ([i915#1602])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb2/igt@i915_suspend@debugfs-reader.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb3/igt@i915_suspend@debugfs-reader.html
    - shard-kbl:          [PASS][36] -> [INCOMPLETE][37] ([i915#155])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-kbl6/igt@i915_suspend@debugfs-reader.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl2/igt@i915_suspend@debugfs-reader.html
    - shard-hsw:          [PASS][38] -> [DMESG-WARN][39] ([i915#2637]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-hsw6/igt@i915_suspend@debugfs-reader.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw1/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          [PASS][40] -> [DMESG-WARN][41] ([i915#2635])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk6/igt@i915_suspend@fence-restore-untiled.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk8/igt@i915_suspend@fence-restore-untiled.html
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#2635])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl8/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111615]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#110723])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#2705])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl3/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109274]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [PASS][50] -> [FAIL][51] ([i915#2122])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111825]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109280])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271]) +14 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-hsw:          NOTRUN -> [SKIP][55] ([fdo#109271]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#1187])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#1187])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-snb:          NOTRUN -> [SKIP][58] ([fdo#109271]) +29 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-snb2/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][59] ([fdo#108145] / [i915#265])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][60] -> [SKIP][61] ([fdo#109441]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][62] -> [FAIL][63] ([i915#1542])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb2/igt@perf@polling-parameterized.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb8/igt@perf@polling-parameterized.html
    - shard-apl:          [PASS][64] -> [FAIL][65] ([i915#1542])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-apl8/igt@perf@polling-parameterized.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl7/igt@perf@polling-parameterized.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271]) +41 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl2/igt@prime_nv_pcopy@test2.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@fds@vecs0:
    - shard-glk:          [FAIL][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk5/igt@gem_exec_parallel@fds@vecs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk3/igt@gem_exec_parallel@fds@vecs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][69] ([i915#2389]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-hsw:          [FAIL][71] ([i915#2389]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][73] ([i915#118] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk5/igt@gem_exec_whisper@basic-queues-all.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][75] ([i915#2190]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb5/igt@gem_huc_copy@huc-copy.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [FAIL][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb1/igt@gem_vm_create@destroy-race.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb6/igt@gem_vm_create@destroy-race.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-kbl7/igt@gem_workarounds@suspend-resume.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl2/igt@gem_workarounds@suspend-resume.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-snb:          [DMESG-WARN][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-snb6/igt@i915_suspend@fence-restore-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-snb5/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][83] ([i915#2635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [DMESG-WARN][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [DMESG-WARN][87] ([i915#2635]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [DMESG-WARN][89] ([i915#2637]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-tglb:         [INCOMPLETE][91] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][93] ([i915#96]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][95] ([i915#2370]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98] +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][101] ([i915#1804] / [i915#2684]) -> [WARN][102] ([i915#2681] / [i915#2684])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][103] ([i915#2681] / [i915#2684]) -> [WARN][104] ([i915#2684])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         [SKIP][105] ([i915#579]) -> [SKIP][106] ([fdo#109293] / [fdo#109506])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         [SKIP][107] ([i915#579]) -> [SKIP][108] ([fdo#109506] / [i915#2411])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][109] ([i915#2295]) -> ([FAIL][110], [FAIL][111]) ([i915#2295] / [i915#483])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-hsw4/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw7/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][112], [FAIL][113]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -> ([FAIL][114], [FAIL][115], [FAIL][116]) ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb5/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb3/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][117], [FAIL][118]) ([i915#1814] / [i915#2295] / [i915#2722]) -> ([FAIL][119], [FAIL][120], [FAIL][121]) ([i915#2295] / [i915#2722])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-apl7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-apl4/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl6/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl8/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][122], [FAIL][123]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -> ([FAIL][124], [FAIL][125], [FAIL][126]) ([i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk8/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk3/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk4/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][127], [FAIL][128]) ([i915#1602] / [i915#2295] / [i915#2722]) -> ([FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1602] / [i915#2295] / [i915#2426] / [i915#2722])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb5/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#2804]: https://gitlab.freedesktop.org/drm/intel/issues/2804
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5905 -> IGTPW_5304
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9496: c1bf99ceda83bcdd33f05515deb9efc3649d449e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5304: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/index.html
  IGT_5905: 3d0934900bddeb7a68f1abab4cd05077f0609e32 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/index.html

--===============0057748691568092047==
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
<tr><td><b>Series:</b></td><td>tests/kms_color_chamelium fix update success=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85038/">https://patchwork.freedesktop.org/series/85038/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5304/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9496_full -&gt; IGTPW_5304_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5304_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5304_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5304=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-iclb7/igt@i915_suspend@fence-restore-untiled.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/sha=
rd-iclb2/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shar=
d-kbl4/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-kbl3/igt@sysfs_timeslice_duration@timeout@vecs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304=
/shard-kbl1/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9496_full and IGTPW_5304_f=
ull:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5304_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
queued.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-iclb8/igt@gem_exec_endless@dispatch@vecs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard=
-iclb8/igt@gem_exec_endless@dispatch@vecs0.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-glk2/igt@gem_exec_fence@basic-wait@bcs0.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/shard-tglb7/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/shard-iclb5/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-snb6/igt@gem_exec_reloc@basic-many-active@rc=
s0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-snb2/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-iclb1/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb3/igt=
@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-apl6/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl4/igt@i=
915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-glk4/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk7/igt@i=
915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-tglb8/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb5/igt=
@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-hsw1/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw1/igt@i=
915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-kbl2/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl2/igt@i=
915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-tglb6/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb=
5/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</=
a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-glk7/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk7/=
igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-apl8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl4/=
igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-iclb2/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb=
3/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-kbl6/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-kbl2/=
igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-hsw6/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw1/=
igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) +1 similar issue=
</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-glk6/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shar=
d-glk8/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-apl6/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shar=
d-apl8/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-kbl3/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">=
i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-iclb6/igt@kms_flip@2x-flip-vs-modeset-vs-han=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5304/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915=
#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i9=
15#1187</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5304/shard-iclb4/igt@kms_hdr@static-toggle-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i9=
15#1187</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-snb2/igt@kms_pipe_b_c_ivb@pipe-b-double-mode=
set-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-=
iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-iclb2/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb8=
/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1542">i915#1542</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-apl8/igt@perf@polling-parameterized.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl7/i=
gt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1542">i915#1542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-kbl2/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) +41 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@fds@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-glk5/igt@gem_exec_parallel@fds@vecs0.html">FAIL</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk3=
/igt@gem_exec_parallel@fds@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915=
#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5304/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915=
#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5304/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-glk5/igt@gem_exec_whisper@basic-queues-all.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i9=
15#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95"=
>i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5304/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tg=
lb5/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-tglb1/igt@gem_vm_create@destroy-race.html">FAIL</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb=
6/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-kbl7/igt@gem_workarounds@suspend-resume.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#=
180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
04/shard-kbl2/igt@gem_workarounds@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-snb6/igt@i915_suspend@fence-restore-untiled.html">DMESG-=
WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
04/shard-snb5/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635"=
>i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5304/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMES=
G-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5304/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635"=
>i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5304/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637"=
>i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5304/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436=
">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5304/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-sus=
pend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/96">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5304/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i=
915#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5304/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
04/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> +3 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5304/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html=
">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5304/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5304/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304=
/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109293">fdo#109293</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506">fdo#1095=
06</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304=
/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506">fdo#109506</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9496/shard-hsw4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-hsw7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5304/shard-hsw1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-iclb5/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb3/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
304/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-iclb2/igt@runner@aborted.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295=
">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-apl4/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5304/shard-apl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-apl=
8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5304/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#27=
22</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-glk3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kerne=
l.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
304/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-glk8/igt@runner@aborted.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">=
i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.c=
gi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9496/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9496/shard-tglb2/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-=
tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5304/shard-tglb5/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/shard-tglb6=
/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
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
<li>IGT: IGT_5905 -&gt; IGTPW_5304</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9496: c1bf99ceda83bcdd33f05515deb9efc3649d449e @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5304: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5304/index.htm=
l<br />
  IGT_5905: 3d0934900bddeb7a68f1abab4cd05077f0609e32 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0057748691568092047==--

--===============0472550589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0472550589==--
