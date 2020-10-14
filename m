Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 14 Oct 2020 13:48:35 -0000
Message-ID: <160268331593.21209.17160909665570482798@emeril.freedesktop.org>
References: <20201013142202.2416663-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201013142202.2416663-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?en9=5Fexec=5Fparse=3A_Check_oversized_batch_with_length=3D=3D0?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1349111002=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1349111002==
Content-Type: multipart/alternative;
 boundary="===============7453278504580490446=="

--===============7453278504580490446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gen9_exec_parse: Check oversized batch with length==0
URL   : https://patchwork.freedesktop.org/series/82632/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9136_full -> IGTPW_5064_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/index.html

Known issues
------------

  Here are the changes found in IGTPW_5064_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([i915#658])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb2/igt@feature_discovery@psr2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb8/igt@feature_discovery@psr2.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk8/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-kbl:          [PASS][5] -> [TIMEOUT][6] ([i915#1288])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-apl:          [PASS][7] -> [TIMEOUT][8] ([i915#1288] / [i915#1635])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1635] / [i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl6/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl3/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#49])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-snb:          [PASS][13] -> [FAIL][14] ([i915#2546]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-snb6/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-snb4/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#1836])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-snb2/igt@kms_prime@basic-crc@first-to-second.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-snb2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl6/igt@kms_prime@basic-crc@first-to-second.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#1836])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@kms_prime@basic-crc@first-to-second.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk9/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-a-accuracy-idle:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@kms_vblank@pipe-a-accuracy-idle.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb8/igt@kms_vblank@pipe-a-accuracy-idle.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [PASS][29] -> [SKIP][30] ([fdo#109271] / [i915#1635]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl2/igt@perf@invalid-oa-metric-set-id.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl1/igt@perf@invalid-oa-metric-set-id.html
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#405])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@perf@invalid-oa-metric-set-id.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb1/igt@perf@invalid-oa-metric-set-id.html
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-hsw2/igt@perf@invalid-oa-metric-set-id.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-hsw2/igt@perf@invalid-oa-metric-set-id.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@parallel@rcs0:
    - shard-tglb:         [FAIL][35] ([i915#1893]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb6/igt@gem_exec_fence@parallel@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb5/igt@gem_exec_fence@parallel@rcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][37] ([i915#118] / [i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_workarounds@basic-read-context:
    - shard-hsw:          [INCOMPLETE][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-hsw2/igt@gem_workarounds@basic-read-context.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-hsw2/igt@gem_workarounds@basic-read-context.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-tglb:         [FAIL][41] -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-kbl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb1/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-kbl:          [DMESG-WARN][47] ([i915#165] / [i915#78]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl2/igt@kms_hdr@bpc-switch-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-apl:          [FAIL][49] ([i915#1635] / [i915#247]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl3/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl3/igt@kms_plane@plane-position-covered-pipe-c-planes.html
    - shard-kbl:          [FAIL][51] ([i915#247]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [SKIP][53] ([fdo#109271] / [i915#1635]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl7/igt@kms_prime@basic-crc@second-to-first.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [SKIP][55] ([fdo#109271]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [SKIP][57] ([i915#1836]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [SKIP][59] ([fdo#109271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-snb2/igt@kms_prime@basic-crc@second-to-first.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-snb2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [SKIP][61] ([i915#1836]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [SKIP][63] ([fdo#109271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@kms_prime@basic-crc@second-to-first.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk9/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][65] ([i915#1635] / [i915#31]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl8/igt@kms_setmode@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl2/igt@kms_setmode@basic.html

  * igt@sysfs_heartbeat_interval@mixed@vcs1:
    - shard-kbl:          [INCOMPLETE][67] ([i915#1731]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@vcs1.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][69] ([i915#1515]) -> [WARN][70] ([i915#1515])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][71] ([i915#1319] / [i915#1635]) -> [FAIL][72] ([fdo#110321] / [i915#1635])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl7/igt@kms_content_protection@lic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-tglb:         [FAIL][73] -> [DMESG-FAIL][74] ([i915#1982]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1893]: https://gitlab.freedesktop.org/drm/intel/issues/1893
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-snb-2600 pig-glk-j5005 pig-skl-6260u pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5813 -> IGTPW_5064
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9136: 29eb1a8ba2cc0d14d3cae7213f9cdaaa13f3dd99 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5064: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/index.html
  IGT_5813: d4e6dd955a1dad02271aa41c9389f5097ee17765 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/index.html

--===============7453278504580490446==
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
<tr><td><b>Series:</b></td><td>i915/gen9_exec_parse: Check oversized batch with length==0</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82632/">https://patchwork.freedesktop.org/series/82632/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9136_full -&gt; IGTPW_5064_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5064_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk8/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1288">i915#1288</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1288">i915#1288</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl6/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl3/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-snb6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-snb4/igt@kms_frontbuffer_tracking@fbc-stridechange.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-snb2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-snb2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk9/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-accuracy-idle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@kms_vblank@pipe-a-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb8/igt@kms_vblank@pipe-a-accuracy-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-metric-set-id:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl2/igt@perf@invalid-oa-metric-set-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl1/igt@perf@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@perf@invalid-oa-metric-set-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb1/igt@perf@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-hsw2/igt@perf@invalid-oa-metric-set-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-hsw2/igt@perf@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@parallel@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb6/igt@gem_exec_fence@parallel@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1893">i915#1893</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb5/igt@gem_exec_fence@parallel@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@basic-read-context:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-hsw2/igt@gem_workarounds@basic-read-context.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-hsw2/igt@gem_workarounds@basic-read-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb1/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl2/igt@kms_hdr@bpc-switch-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl2/igt@kms_hdr@bpc-switch-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered-pipe-c-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl3/igt@kms_plane@plane-position-covered-pipe-c-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/247">i915#247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl3/igt@kms_plane@plane-position-covered-pipe-c-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-c-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/247">i915#247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-c-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-snb2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-snb2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-glk1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-glk9/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl2/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@vcs1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-apl7/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-apl8/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9136/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-snb-2600 pig-glk-j5005 pig-skl-6260u pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5813 -&gt; IGTPW_5064</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9136: 29eb1a8ba2cc0d14d3cae7213f9cdaaa13f3dd99 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5064: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5064/index.html<br />
  IGT_5813: d4e6dd955a1dad02271aa41c9389f5097ee17765 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7453278504580490446==--

--===============1349111002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1349111002==--
