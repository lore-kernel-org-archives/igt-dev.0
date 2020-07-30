Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jul 2020 13:26:59 -0000
Message-ID: <159611561963.11112.4375654367717147058@emeril.freedesktop.org>
References: <20200729222938.6038-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200729222938.6038-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpipe=5Fcrc=5Fbasic=3A_Sanity_check_for_CRC_mismatches_=28?=
 =?utf-8?q?rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0023998671=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0023998671==
Content-Type: multipart/alternative;
 boundary="===============8633024128756166253=="

--===============8633024128756166253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_pipe_crc_basic: Sanity check for CRC mismatches (rev2)
URL   : https://patchwork.freedesktop.org/series/80040/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5752_full -> IGTPW_4828_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4828_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4828_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4828_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-iclb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb4/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb1/igt@kms_prime@basic-crc@second-to-first.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@kms_prime@basic-crc@second-to-first.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between IGT_5752_full and IGTPW_4828_full:

### New IGT tests (1) ###

  * igt@kms_pipe_crc_basic@compare-crc-basic:
    - Statuses : 7 pass(s)
    - Exec time: [0.27, 0.70] s

  

Known issues
------------

  Here are the changes found in IGTPW_4828_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([i915#1602])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb1/igt@device_reset@unbind-reset-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#1930])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][10] -> [DMESG-WARN][11] ([i915#118] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk7/igt@gem_exec_whisper@basic-forked.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk3/igt@gem_exec_whisper@basic-forked.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#454]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][14] -> [DMESG-FAIL][15] ([i915#118] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#54])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#1635] / [i915#54])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#54])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-hsw:          [PASS][22] -> [TIMEOUT][23] ([i915#1958] / [i915#2119])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
    - shard-snb:          [PASS][24] -> [TIMEOUT][25] ([i915#1958] / [i915#2119]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb1/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#1982])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk5/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#2122])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp1:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#1635] / [i915#2122])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][34] -> [SKIP][35] ([fdo#109271] / [i915#1635])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [PASS][38] -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_prime@basic-crc@second-to-first.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk2/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][44] -> [FAIL][45] ([i915#173])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@no_drrs.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-c-wait-forked-busy:
    - shard-tglb:         [PASS][48] -> [DMESG-WARN][49] ([i915#1982]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb6/igt@kms_vblank@pipe-c-wait-forked-busy.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb1/igt@kms_vblank@pipe-c-wait-forked-busy.html
    - shard-kbl:          [PASS][50] -> [DMESG-WARN][51] ([i915#1982])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@kms_vblank@pipe-c-wait-forked-busy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl4/igt@kms_vblank@pipe-c-wait-forked-busy.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-iclb:         [FAIL][52] -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@core_setmaster@master-drop-set-user.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb3/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          [FAIL][54] -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@core_setmaster@master-drop-set-user.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl6/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          [FAIL][56] -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@core_setmaster@master-drop-set-user.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb4/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         [FAIL][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@core_setmaster@master-drop-set-user.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb7/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          [FAIL][60] ([i915#1635]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl4/igt@core_setmaster@master-drop-set-user.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl4/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          [FAIL][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk5/igt@core_setmaster@master-drop-set-user.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk7/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          [FAIL][64] -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@core_setmaster@master-drop-set-user.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw6/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [DMESG-WARN][66] ([i915#118] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@kms_addfb_basic@bo-too-small:
    - shard-hsw:          [TIMEOUT][68] ([i915#1958] / [i915#2119]) -> [PASS][69] +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw4/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-glk:          [DMESG-WARN][70] ([i915#1982]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-snb:          [TIMEOUT][72] ([i915#1958] / [i915#2119]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb6/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][74] ([i915#1982]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +8 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][78] ([i915#2055]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-kbl:          [DMESG-WARN][80] ([i915#1982]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [DMESG-WARN][82] ([i915#1982]) -> [PASS][83] +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
    - shard-iclb:         [DMESG-WARN][84] ([i915#1982]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][86] ([i915#155]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [SKIP][88] ([i915#1836]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb4/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [SKIP][90] ([fdo#109271]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-hsw:          [SKIP][92] ([fdo#109271]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [SKIP][94] ([fdo#109271]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [SKIP][96] ([fdo#109271] / [i915#1635]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl8/igt@kms_prime@basic-crc@first-to-second.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl8/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [SKIP][98] ([i915#1836]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb1/igt@kms_prime@basic-crc@first-to-second.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [SKIP][100] ([fdo#109271]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_prime@basic-crc@first-to-second.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk2/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][102] ([fdo#109441]) -> [PASS][103] +4 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][104] ([i915#31]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl7/igt@kms_setmode@basic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-apl:          [DMESG-WARN][106] ([i915#1635] / [i915#1982]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl3/igt@kms_vblank@pipe-c-query-forked-busy.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl3/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][108] ([i915#1542]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@perf@blocking-parameterized.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb5/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][110] ([i915#155]) -> [DMESG-WARN][111] ([i915#180])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@i915_suspend@debugfs-reader.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][112] ([i915#1319] / [i915#2119]) -> [TIMEOUT][113] ([i915#1319] / [i915#1958] / [i915#2119])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_content_protection@atomic.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-snb:          [TIMEOUT][114] ([i915#1958] / [i915#2119]) -> [SKIP][115] ([fdo#109271])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][116] ([fdo#109349]) -> [DMESG-WARN][117] ([i915#1226])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-hsw:          [TIMEOUT][118] ([i915#1958] / [i915#2119]) -> [SKIP][119] ([fdo#109271]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-snb:          [SKIP][120] ([fdo#109271]) -> [TIMEOUT][121] ([i915#1958] / [i915#2119]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][122] ([fdo#109271]) -> [TIMEOUT][123] ([i915#1958] / [i915#2119]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5752 -> IGTPW_4828

  CI-20190529: 20190529
  CI_DRM_8815: 521846d50ed323d4dcb0ffafa63e34528b0a4996 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4828: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/index.html
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/index.html

--===============8633024128756166253==
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
<tr><td><b>Series:</b></td><td>tests/kms_pipe_crc_basic: Sanity check for CRC mismatches (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80040/">https://patchwork.freedesktop.org/series/80040/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5752_full -&gt; IGTPW_4828_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4828_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4828_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4828_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5752_full and IGTPW_4828_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-basic:<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.27, 0.70] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4828_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb1/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk7/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk3/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb1/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk5/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb1/igt@kms_psr@no_drrs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/173">i915#173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb6/igt@kms_vblank@pipe-c-wait-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb1/igt@kms_vblank@pipe-c-wait-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@kms_vblank@pipe-c-wait-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl4/igt@kms_vblank@pipe-c-wait-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb3/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl6/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb4/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb7/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl4/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl4/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk7/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw6/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw4/igt@kms_addfb_basic@bo-too-small.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb6/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb4/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl8/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl8/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-glk2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl3/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-apl3/igt@kms_vblank@pipe-c-query-forked-busy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb5/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl7/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-kbl2/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5752 -&gt; IGTPW_4828</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8815: 521846d50ed323d4dcb0ffafa63e34528b0a4996 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4828: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4828/index.html<br />
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8633024128756166253==--

--===============0023998671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0023998671==--
