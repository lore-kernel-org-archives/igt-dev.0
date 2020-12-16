Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 16 Dec 2020 03:11:40 -0000
Message-ID: <160808830037.16509.11187938241957825674@emeril.freedesktop.org>
References: <20201215210658.1188718-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201215210658.1188718-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Fparams=3A_As?=
 =?utf-8?q?sert_a_4G_object_does_=5Fnot=5F_fit_without_48b?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1253958825=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1253958825==
Content-Type: multipart/alternative;
 boundary="===============3999479156090101742=="

--===============3999479156090101742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/gem_exec_params: Assert a 4G object does _not_ fit without 48b
URL   : https://patchwork.freedesktop.org/series/84976/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5902_full -> IGTPW_5295_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5295_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5295_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5295_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@gem_exec_params@larger-than-life-batch.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb8/igt@gem_exec_params@larger-than-life-batch.html
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@gem_exec_params@larger-than-life-batch.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb3/igt@gem_exec_params@larger-than-life-batch.html

  * {igt@gem_softpin@zero} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl7/igt@gem_softpin@zero.html
    - shard-glk:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk7/igt@gem_softpin@zero.html
    - shard-iclb:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb7/igt@gem_softpin@zero.html
    - shard-kbl:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl3/igt@gem_softpin@zero.html
    - shard-tglb:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb5/igt@gem_softpin@zero.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-bottom-edge:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb3/igt@kms_cursor_edge_walk@pipe-d-64x64-bottom-edge.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb8/igt@kms_cursor_edge_walk@pipe-d-64x64-bottom-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-iclb:         [PASS][12] -> [DMESG-WARN][13] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][16] -> [DMESG-WARN][17] +4 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_balancer@fairslice}:
    - shard-iclb:         [PASS][18] -> [FAIL][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@gem_exec_balancer@fairslice.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@gem_exec_balancer@fairslice.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-tglb:         [PASS][20] -> [DMESG-WARN][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb1/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [PASS][22] -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@gem_vm_create@destroy-race.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb5/igt@gem_vm_create@destroy-race.html

  
New tests
---------

  New tests have been introduced between IGT_5902_full and IGTPW_5295_full:

### New IGT tests (1) ###

  * igt@gem_softpin@zero:
    - Statuses : 5 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_5295_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2389])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#118] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * {igt@gem_softpin@zero} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][28] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-snb2/igt@gem_softpin@zero.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#579])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb6/igt@i915_pm_rpm@reg-read-ioctl.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw4/igt@i915_pm_rpm@reg-read-ioctl.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw6/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#579])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@i915_pm_rpm@reg-read-ioctl.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-kbl:          [PASS][37] -> [SKIP][38] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl4/igt@i915_pm_rpm@reg-read-ioctl.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl1/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl3/igt@i915_pm_rpm@reg-read-ioctl.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl8/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl4/igt@i915_suspend@forcewake.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_chamelium@dp-crc-fast:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb7/igt@kms_chamelium@dp-crc-fast.html
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl3/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk8/igt@kms_chamelium@hdmi-aspect-ratio.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@kms_chamelium@hdmi-aspect-ratio.html
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl1/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +9 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl6/igt@kms_color@pipe-d-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#1149])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb6/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-hsw:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw1/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111828])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb6/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][52] ([i915#1319])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl6/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109300] / [fdo#111066])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb3/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][54] ([i915#1319])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109279])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [fdo#109279])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][57] -> [FAIL][58] ([i915#96])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][59] -> [FAIL][60] ([i915#2346]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109274]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111825]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][63] -> [INCOMPLETE][64] ([i915#155])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [PASS][65] -> [DMESG-WARN][66] ([i915#2635])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [PASS][67] -> [DMESG-WARN][68] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-hsw:          [PASS][69] -> [DMESG-WARN][70] ([i915#2637]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
    - shard-glk:          [PASS][71] -> [DMESG-WARN][72] ([i915#2635])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-tglb:         [PASS][73] -> [DMESG-FAIL][74] ([i915#1982])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-tglb:         [PASS][75] -> [INCOMPLETE][76] ([i915#1436] / [i915#2295])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109280])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-hsw:          NOTRUN -> [SKIP][78] ([fdo#109271]) +16 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271]) +11 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271]) +9 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109289])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109289])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb3/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109441])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb6/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109441])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][86] -> [SKIP][87] ([fdo#109271]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][88] -> [SKIP][89] ([fdo#109278])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][90] ([i915#2295])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw6/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][91] ([i915#644]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-hsw:          [INCOMPLETE][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw8/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][95] -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk8/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk3/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][97] ([i915#2598]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][99] ([i915#49]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-iclb:         [FAIL][101] ([i915#49]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-kbl:          [DMESG-WARN][103] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl6/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][107] ([i915#658]) -> [SKIP][108] ([i915#588])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][109] ([i915#579]) -> [SKIP][110] ([fdo#109293] / [fdo#109506])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][111] ([i915#579]) -> [SKIP][112] ([fdo#109506] / [i915#2411])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][113] ([fdo#109349]) -> [DMESG-WARN][114] ([i915#1226])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][115] ([i915#2295] / [i915#2722]) -> ([FAIL][116], [FAIL][117]) ([i915#2248] / [i915#2295] / [i915#2426] / [i915#2722])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@runner@aborted.html

  
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
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2248]: https://gitlab.freedesktop.org/drm/intel/issues/2248
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5902 -> IGTPW_5295

  CI-20190529: 20190529
  CI_DRM_9488: 610a032e0c8eff40d87d9344f92311382f4acd49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5295: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/index.html
  IGT_5902: 1c1fc6c4d506dc69d8e85b09bcb932466712d416 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/index.html

--===============3999479156090101742==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] i915/gem_exec_params: Assert a 4G object does _not_ fit without 48b</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84976/">https://patchwork.freedesktop.org/series/84976/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5902_full -&gt; IGTPW_5295_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5295_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5295_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5295_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@gem_exec_params@larger-than-life-batch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb8/igt@gem_exec_params@larger-than-life-batch.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@gem_exec_params@larger-than-life-batch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb3/igt@gem_exec_params@larger-than-life-batch.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@zero} (NEW):</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl7/igt@gem_softpin@zero.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk7/igt@gem_softpin@zero.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb7/igt@gem_softpin@zero.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl3/igt@gem_softpin@zero.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb5/igt@gem_softpin@zero.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-bottom-edge:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb3/igt@kms_cursor_edge_walk@pipe-d-64x64-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb8/igt@kms_cursor_edge_walk@pipe-d-64x64-bottom-edge.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">DMESG-WARN</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">DMESG-WARN</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@gem_exec_balancer@fairslice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@gem_exec_balancer@fairslice.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@gem_vm_create@destroy-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb5/igt@gem_vm_create@destroy-race.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5902_full and IGTPW_5295_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_softpin@zero:<ul>
<li>Statuses : 5 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5295_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@zero} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-snb2/igt@gem_softpin@zero.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb6/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw4/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw6/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl4/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl1/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl3/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl8/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl4/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl1/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb7/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl3/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk8/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl1/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl6/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb6/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw1/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111828">fdo#111828</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl6/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb3/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl2/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb2/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-apl4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb3/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb6/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb7/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-random:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-hsw7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-hsw8/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk8/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk3/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-kbl6/igt@kms_plane_lowres@pipe-a-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5902/shard-tglb5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/shard-tglb7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2248">i915#2248</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5902 -&gt; IGTPW_5295</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9488: 610a032e0c8eff40d87d9344f92311382f4acd49 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5295: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5295/index.html<br />
  IGT_5902: 1c1fc6c4d506dc69d8e85b09bcb932466712d416 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3999479156090101742==--

--===============1253958825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1253958825==--
