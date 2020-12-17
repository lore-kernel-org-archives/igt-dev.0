Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 17 Dec 2020 03:15:56 -0000
Message-ID: <160817495693.2013.779452185913053271@emeril.freedesktop.org>
References: <20201216230223.24311-1-sungkim@amd.com>
In-Reply-To: <20201216230223.24311-1-sungkim@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_lib=3A_Add_stride_and_size_calculation?=
 =?utf-8?q?_for_amdgpu_+_tiling?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0009003216=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sung Joon Kim <sungkim@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0009003216==
Content-Type: multipart/alternative;
 boundary="===============6999721225029395675=="

--===============6999721225029395675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] lib: Add stride and size calculation for amdgpu + tiling
URL   : https://patchwork.freedesktop.org/series/85020/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9495_full -> IGTPW_5303_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9495_full and IGTPW_5303_full:

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

  Here are the changes found in IGTPW_5303_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([i915#658])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb2/igt@feature_discovery@psr2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb8/igt@feature_discovery@psr2.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][3] ([fdo#109271]) +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-glk5/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([fdo#112283])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb1/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][5] ([fdo#112283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb1/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-many-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][6] ([i915#2389])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([fdo#109289]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb7/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([fdo#112306])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb3/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb7/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [PASS][10] -> [SKIP][11] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-glk9/igt@i915_pm_rpm@i2c.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-glk7/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-hsw1/igt@i915_pm_rpm@i2c.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-hsw6/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#579])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb1/igt@i915_pm_rpm@i2c.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb3/igt@i915_pm_rpm@i2c.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][16] -> [FAIL][17] ([i915#2574])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb3/igt@kms_async_flips@test-time-stamp.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271]) +34 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl7/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#111614])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#111615]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#110723])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_chamelium@dp-audio-edid:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#109284] / [fdo#111827])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb8/igt@kms_chamelium@dp-audio-edid.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl2/igt@kms_chamelium@vga-hpd-enable-disable-mode.html
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl6/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][25] ([i915#1319])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl1/igt@kms_content_protection@legacy.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111828])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb1/igt@kms_content_protection@legacy.html
    - shard-apl:          NOTRUN -> [TIMEOUT][27] ([i915#1319])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271]) +33 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#533]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#533]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109274]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [PASS][32] -> [FAIL][33] ([i915#2122])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111825]) +8 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-hsw:          NOTRUN -> [SKIP][36] ([fdo#109271]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#1187])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#1187])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-glk:          [PASS][41] -> [DMESG-WARN][42] ([i915#1602] / [i915#2635])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-tglb:         [PASS][43] -> [INCOMPLETE][44] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#1602] / [i915#2635])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#1602])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-hsw:          [PASS][49] -> [DMESG-WARN][50] ([i915#2637])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-iclb:         [PASS][51] -> [DMESG-WARN][52] ([i915#1602])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109291])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb8/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][54] ([i915#2389]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-kbl:          [DMESG-WARN][56] ([i915#1610]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-kbl7/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl6/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-apl:          [DMESG-WARN][58] ([i915#1610]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@kms_concurrent@pipe-b:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180] / [i915#78]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-kbl2/igt@kms_concurrent@pipe-b.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl4/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][62] ([i915#2635]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [DMESG-WARN][64] -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [DMESG-WARN][66] ([i915#2635]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [DMESG-WARN][68] ([i915#2637]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [DMESG-WARN][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-tglb:         [INCOMPLETE][72] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][74] ([i915#96]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][76] ([i915#2598]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-hsw:          [SKIP][80] ([fdo#109271]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-hsw8/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-hsw2/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][82] ([i915#588]) -> [SKIP][83] ([i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][84] ([i915#1804] / [i915#2684]) -> [WARN][85] ([i915#2681] / [i915#2684])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         [SKIP][86] ([i915#579]) -> [SKIP][87] ([fdo#109293] / [fdo#109506])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         [SKIP][88] ([i915#579]) -> [SKIP][89] ([fdo#109506] / [i915#2411])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][90], [FAIL][91], [FAIL][92]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2722] / [i915#483]) -> ([FAIL][93], [FAIL][94]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-kbl2/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-kbl7/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-kbl3/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl1/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][95], [FAIL][96]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -> ([FAIL][97], [FAIL][98], [FAIL][99]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2722] / [i915#2724])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb8/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb5/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb3/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb3/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][100], [FAIL][101], [FAIL][102]) ([i915#1610] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2722]) -> ([FAIL][103], [FAIL][104]) ([i915#1814] / [i915#2295] / [i915#2722])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-apl6/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-apl7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-apl1/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl3/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl1/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][105], [FAIL][106], [FAIL][107]) ([i915#1602] / [i915#1764] / [i915#2295] / [i915#2426] / [i915#2722]) -> ([FAIL][108], [FAIL][109], [FAIL][110]) ([i915#1602] / [i915#2295] / [i915#2426] / [i915#2722])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb7/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb3/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb1/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb7/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2574]: https://gitlab.freedesktop.org/drm/intel/issues/2574
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5905 -> IGTPW_5303
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9495: 2960e86fd8fd7659400d05f40a1e06d3a97b6987 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5303: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/index.html
  IGT_5905: 3d0934900bddeb7a68f1abab4cd05077f0609e32 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/index.html

--===============6999721225029395675==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] lib: Add stride a=
nd size calculation for amdgpu + tiling</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85020/">https://patchwork.freedesktop.org/series/85020/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5303/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9495_full -&gt; IGTPW_5303_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/index.=
html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9495_full and IGTPW_5303_f=
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
<p>Here are the changes found in IGTPW_5303_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb8/ig=
t@feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-glk5/igt@gem_exec_fence@basic-wait@bcs0.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-tglb1/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-iclb1/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-iclb4/igt@gem_exec_reloc@basic-many-active@v=
cs1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-tglb7/igt@gen7_exec_parse@basic-allowed.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
9">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-tglb3/igt@gen9_exec_parse@secure-batches.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1123=
06">fdo#112306</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-tglb7/igt@i915_pm_rpm@i2c.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)<=
/p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-glk9/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-glk7/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-hsw1/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-hsw6/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-iclb1/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb3/igt@i915_p=
m_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard=
-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2574">i915#2574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-apl7/igt@kms_big_fb@linear-16bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +34 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-tglb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-audio-edid:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-tglb8/igt@kms_chamelium@dp-audio-edid.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-apl2/igt@kms_chamelium@vga-hpd-enable-disable=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-kbl6/igt@kms_chamelium@vga-hpd-enable-disable=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-kbl1/igt@kms_content_protection@legacy.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-tglb1/igt@kms_content_protection@legacy.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111828=
">fdo#111828</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-apl6/igt@kms_content_protection@legacy.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspen=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-apl1/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-iclb7/igt@kms_flip@2x-flip-vs-modeset-vs-han=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-tglb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5303/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915=
#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>) +8 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i9=
15#1187</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5303/shard-iclb3/igt@kms_hdr@static-toggle-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i9=
15#1187</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard=
-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
03/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i91=
5#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
303/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i=
915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/456">i915#456</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
03/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i91=
5#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
03/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i91=
5#1602</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
03/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i91=
5#2637</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
303/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i=
915#1602</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5303/shard-tglb8/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5303/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-kbl7/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i=
915#1610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5303/shard-kbl6/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i=
915#1610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5303/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-b:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-kbl2/igt@kms_concurrent@pipe-b.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shar=
d-kbl4/igt@kms_concurrent@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635"=
>i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5303/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMES=
G-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5303/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635"=
>i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5303/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637"=
>i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5303/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG=
-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
303/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436=
">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5303/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-sus=
pend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/96">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5303/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2598">i915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5303/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-inter=
ruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard=
-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-hsw8/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5303/shard-hsw2/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html=
">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/s=
hard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5303/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303=
/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109293">fdo#109293</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506">fdo#1095=
06</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9495/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303=
/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href=
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
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-kbl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9495/shard-kbl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#4=
83</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
03/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-kbl2/igt@runner@aborted.html">FA=
IL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i=
915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/602">i915#602</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-iclb5/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb3/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
303/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-iclb4/igt@runner@aborted.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814=
">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2724">i915#2724</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-apl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9495/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#=
2722</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5303/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-apl1/igt@runner@aborted.html">=
FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814"=
>i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2722">i915#2722</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9495/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9495/shard-tglb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9495/shard-tglb3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1764">i915#1764</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i91=
5#2722</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5303/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/shard-tglb7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_530=
3/shard-tglb8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
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
<li>IGT: IGT_5905 -&gt; IGTPW_5303</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9495: 2960e86fd8fd7659400d05f40a1e06d3a97b6987 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5303: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5303/index.htm=
l<br />
  IGT_5905: 3d0934900bddeb7a68f1abab4cd05077f0609e32 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6999721225029395675==--

--===============0009003216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0009003216==--
