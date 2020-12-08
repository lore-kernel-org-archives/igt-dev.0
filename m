Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Dec 2020 21:36:25 -0000
Message-ID: <160746338576.9600.14693506269030547903@emeril.freedesktop.org>
References: <20201208170205.2039137-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201208170205.2039137-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fvm=5Fcreate=3A_Race_vm-destroy_against_object_free?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1145093361=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1145093361==
Content-Type: multipart/alternative;
 boundary="===============3620981981665384068=="

--===============3620981981665384068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_vm_create: Race vm-destroy against object free
URL   : https://patchwork.freedesktop.org/series/84692/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9461_full -> IGTPW_5260_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5260_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5260_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5260_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [PASS][5] -> [DMESG-WARN][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb2/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a2:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk7/igt@kms_flip@flip-vs-suspend@c-hdmi-a2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk4/igt@kms_flip@flip-vs-suspend@c-hdmi-a2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9461_full and IGTPW_5260_full:

### New IGT tests (1) ###

  * igt@gem_vm_create@destroy-race:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 15.07] s

  

Known issues
------------

  Here are the changes found in IGTPW_5260_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-glk:          NOTRUN -> [SKIP][9] ([fdo#109271]) +35 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk6/igt@feature_discovery@display-3x.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#1839])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb2/igt@feature_discovery@display-3x.html
    - shard-tglb:         NOTRUN -> [SKIP][11] ([i915#1839])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@feature_discovery@display-3x.html

  * igt@gem_exec_endless@dispatch@vcs1:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#2270])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb3/igt@gem_exec_endless@dispatch@vcs1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb3/igt@gem_exec_endless@dispatch@vcs1.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][14] -> [FAIL][15] ([i915#2389])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][16] ([i915#2389])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1602])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb4/igt@gem_softpin@noreloc-s3.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb1/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1602] / [i915#2635])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl2/igt@gem_softpin@noreloc-s3.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl1/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1602] / [i915#2635])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk6/igt@gem_softpin@noreloc-s3.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk2/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1602])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * {igt@gem_vm_create@destroy-race} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-snb5/igt@gem_vm_create@destroy-race.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#112306]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb3/igt@gen9_exec_parse@bb-secure.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#112306]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109302])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109302])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb5/igt@i915_query@query-topology-unsupported.html

  * igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#112025])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb5/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110723])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111615]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_color@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109278] / [i915#1149])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb3/igt@kms_color@pipe-d-degamma.html
    - shard-tglb:         NOTRUN -> [FAIL][36] ([i915#1149])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_color@pipe-d-degamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-negative:
    - shard-hsw:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw6/igt@kms_color_chamelium@pipe-a-ctm-negative.html
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk2/igt@kms_color_chamelium@pipe-a-ctm-negative.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109279]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#54])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#54])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#54])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109274] / [fdo#109278])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [FAIL][52] ([i915#2346])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109274])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#79])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][56] ([i915#2122])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][57] -> [FAIL][58] ([i915#2598])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-kbl:          [PASS][59] -> [FAIL][60] ([i915#79])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          NOTRUN -> [INCOMPLETE][61] ([i915#2295])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][62] -> [DMESG-WARN][63] ([i915#2635])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-tglb:         [PASS][64] -> [DMESG-WARN][65] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [PASS][66] -> [DMESG-WARN][67] ([i915#2635])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-vga1:
    - shard-hsw:          [PASS][68] -> [DMESG-WARN][69] ([i915#2637]) +6 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-hsw6/igt@kms_flip@flip-vs-suspend@a-vga1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw2/igt@kms_flip@flip-vs-suspend@a-vga1.html

  * igt@kms_flip@flip-vs-suspend@b-edp1:
    - shard-tglb:         [PASS][70] -> [DMESG-FAIL][71] ([i915#1982])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb7/igt@kms_flip@flip-vs-suspend@b-edp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_flip@flip-vs-suspend@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-tglb:         [PASS][72] -> [INCOMPLETE][73] ([i915#1436])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb7/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#111825]) +16 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271]) +42 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109280]) +11 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#433])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#1187])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][79] ([i915#1187])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271]) +79 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - shard-kbl:          [PASS][81] -> [DMESG-WARN][82] ([i915#165])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][83] ([fdo#108145] / [i915#265])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][85] ([fdo#108145] / [i915#265]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278]) +6 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb6/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-hsw:          NOTRUN -> [SKIP][87] ([fdo#109271]) +18 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][88] -> [SKIP][89] ([fdo#109642] / [fdo#111068])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][90] -> [SKIP][91] ([fdo#109441]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb4/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109441])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#533])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109502])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb1/igt@kms_vrr@flipline.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109502])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#2437])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#2530])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2530])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109291])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109291]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb3/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#109307])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb5/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [DMESG-WARN][102] ([i915#118] / [i915#95]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk1/igt@gem_exec_whisper@basic-fds-forked-all.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk8/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][104] ([i915#2598]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][106] ([i915#49]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [FAIL][108] ([i915#49]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][110] ([i915#49]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][112] ([fdo#109441]) -> [PASS][113] +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [DMESG-WARN][114] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb8/igt@kms_psr@psr2_suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb8/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [DMESG-WARN][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-kbl:          [DMESG-WARN][118] -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-hsw:          [DMESG-WARN][120] ([i915#2637]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-glk:          [DMESG-WARN][122] ([i915#2635]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-apl:          [DMESG-WARN][124] ([i915#2635]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-tglb:         [INCOMPLETE][126] ([i915#1436] / [i915#1602] / [i915#1798] / [i915#1887] / [i915#1982] / [i915#2411] / [i915#456]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][128] ([i915#1804] / [i915#2684]) -> [WARN][129] ([i915#2684])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][130] ([i915#2295]) -> ([FAIL][131], [FAIL][132]) ([i915#2295] / [i915#483])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-hsw6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw1/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw2/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][133], [FAIL][134]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602]) -> ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#2295] / [i915#2722] / [i915#483])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl1/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][138], [FAIL][139]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][140], [FAIL][141], [FAIL][142]) ([i915#2295] / [i915#2722] / [i915#483])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb6/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb1/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][143], [FAIL][144]) ([i915#1814] / [i915#2295] / [i915#2722]) -> ([FAIL][145], [FAIL][146], [FAIL][147]) ([i915#2295] / [i915#2722])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl1/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl6/igt@runner@aborted.html
    - shard-glk:          ([FAIL][148], [FAIL][149]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -> ([FAIL][150], [FAIL][151], [FAIL][152]) ([i915#2295] / [i915#2722] / [i915#86] / [k.org#202321])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk6/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk7/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk2/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk8/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][153], [FAIL][154], [FAIL][155]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2722]) -> ([FAIL][156], [FAIL][157]) ([i915#2295] / [i915#2722])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb6/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb8/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb6/igt@runner@aborted.htm

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/index.html

--===============3620981981665384068==
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
<tr><td><b>Series:</b></td><td>i915/gem_vm_create: Race vm-destroy against object free</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84692/">https://patchwork.freedesktop.org/series/84692/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9461_full -&gt; IGTPW_5260_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5260_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5260_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5260_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb2/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk7/igt@kms_flip@flip-vs-suspend@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk4/igt@kms_flip@flip-vs-suspend@c-hdmi-a2.html">DMESG-WARN</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9461_full and IGTPW_5260_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_vm_create@destroy-race:<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 15.07] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5260_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk6/igt@feature_discovery@display-3x.html">SKIP</a> ([fdo#109271]) +35 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb2/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb3/igt@gem_exec_endless@dispatch@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb3/igt@gem_exec_endless@dispatch@vcs1.html">INCOMPLETE</a> ([i915#2270])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb4/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl2/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk6/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl1/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl7/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-snb5/igt@gem_vm_create@destroy-race.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb3/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb5/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb5/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html">SKIP</a> ([fdo#112025])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb3/igt@kms_color@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [i915#1149])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_color@pipe-d-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-negative:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw6/igt@kms_color_chamelium@pipe-a-ctm-negative.html">SKIP</a> ([fdo#109271] / [fdo#111827])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk2/igt@kms_color_chamelium@pipe-a-ctm-negative.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109279]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2295])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#2635])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_flip@flip-vs-suspend@a-edp1.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> ([i915#2635])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-hsw6/igt@kms_flip@flip-vs-suspend@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw2/igt@kms_flip@flip-vs-suspend@a-vga1.html">DMESG-WARN</a> ([i915#2637]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb7/igt@kms_flip@flip-vs-suspend@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_flip@flip-vs-suspend@b-edp1.html">DMESG-FAIL</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb7/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_flip@flip-vs-suspend@c-edp1.html">INCOMPLETE</a> ([i915#1436])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([fdo#109280]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> ([fdo#109271]) +79 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">DMESG-WARN</a> ([i915#165])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb6/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html">SKIP</a> ([fdo#109278]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw6/igt@kms_plane_lowres@pipe-a-tiling-y.html">SKIP</a> ([fdo#109271]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb4/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb1/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb7/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_cpu_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb3/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb5/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk1/igt@gem_exec_whisper@basic-fds-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk8/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb4/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb8/igt@kms_psr@psr2_suspend.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb8/igt@kms_psr@psr2_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1602] / [i915#1798] / [i915#1887] / [i915#1982] / [i915#2411] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-hsw6/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-hsw2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#483])</p>
</li>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-kbl3/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-iclb6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-iclb2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-apl3/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-apl6/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-glk7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5260/shard-glk4/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [i915#86] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9461/shard-tglb6/igt@runner@aborted.htm">FAIL</a>) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2722]) -&gt; ([FAIL][156], [FAIL][157]) ([i915#2295] / [i915#2722])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3620981981665384068==--

--===============1145093361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1145093361==--
