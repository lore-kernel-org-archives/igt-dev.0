Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2941067857388984662=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Date: Tue, 31 Oct 2023 09:41:13 -0000
Message-ID: <169874527375.27661.12376084388774519785@emeril.freedesktop.org>
References: <20231031080949.1145422-1-kunal1.joshi@intel.com>
In-Reply-To: <20231031080949.1145422-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZXh0ZW5k?=
 =?utf-8?q?_kms=5Fpsr_test_to_validate_pr_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2941067857388984662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend kms_psr test to validate pr (rev3)
URL   : https://patchwork.freedesktop.org/series/125379/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13817 -> IGTPW_10093
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10093 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10093, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-kbl-soraka bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10093:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][1] +62 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-jsl-3/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][2] +62 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_primary_mmap_gtt} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][3] +62 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-rplp-1/igt@kms_psr@pr_primary_mmap_gtt.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][4] +62 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][5] +41 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-14/igt@kms_psr@pr_sprite_blt.html

  * {igt@kms_psr@pr_sprite_render} (NEW):
    - bat-adlp-11:        NOTRUN -> [SKIP][6] +62 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-11/igt@kms_psr@pr_sprite_render.html

  * igt@kms_psr@psr2_no_drrs:
    - bat-jsl-1:          NOTRUN -> [SKIP][7] +62 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-jsl-1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - bat-dg2-9:          NOTRUN -> [SKIP][8] +62 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-9/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] +62 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_primary_render:
    - bat-mtlp-6:         NOTRUN -> [SKIP][10] +62 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-mtlp-6/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - bat-adlp-9:         NOTRUN -> [SKIP][11] +62 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr@psr2_suspend:
    - bat-adln-1:         NOTRUN -> [SKIP][12] +62 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adln-1/igt@kms_psr@psr2_suspend.html

  * {igt@kms_psr@psr_primary_blt} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] +62 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html
    - bat-adls-5:         NOTRUN -> [SKIP][14] +62 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adls-5/igt@kms_psr@psr_primary_blt.html

  * {igt@kms_psr@psr_primary_mmap_cpu} (NEW):
    - bat-rpls-1:         NOTRUN -> [SKIP][15] +62 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-rpls-1/igt@kms_psr@psr_primary_mmap_cpu.html

  * {igt@kms_psr@psr_sprite_blt} (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][16] +62 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg1-5/igt@kms_psr@psr_sprite_blt.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-rpls-1:         [SKIP][17] ([i915#1072]) -> [SKIP][18] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-rpls-1/igt@kms_psr@cursor_plane_move.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-rpls-1/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-9:         [SKIP][19] ([i915#1072]) -> [SKIP][20] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-adlp-9/igt@kms_psr@primary_page_flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-9/igt@kms_psr@primary_page_flip.html
    - fi-rkl-11600:       [SKIP][21] ([i915#1072]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
    - bat-adls-5:         [SKIP][23] ([i915#1072]) -> [SKIP][24] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-adls-5/igt@kms_psr@primary_page_flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adls-5/igt@kms_psr@primary_page_flip.html
    - bat-dg1-5:          [SKIP][25] ([i915#1072] / [i915#4078]) -> [SKIP][26] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-dg1-5/igt@kms_psr@primary_page_flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg1-5/igt@kms_psr@primary_page_flip.html
    - bat-dg2-9:          [SKIP][27] ([i915#1072]) -> [SKIP][28] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-dg2-9/igt@kms_psr@primary_page_flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-9/igt@kms_psr@primary_page_flip.html
    - fi-tgl-1115g4:      [SKIP][29] ([fdo#110189]) -> [SKIP][30] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
    - bat-mtlp-6:         [SKIP][31] ([i915#1072]) -> [SKIP][32] +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-mtlp-6/igt@kms_psr@primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-mtlp-6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg2-11:         [SKIP][33] ([i915#1072]) -> [SKIP][34] +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - {bat-dg2-14}:       NOTRUN -> [SKIP][35] +20 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13817 and IGTPW_10093:

### New IGT tests (42) ###

  * igt@kms_psr@pr_basic:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_move:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_dpms:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_no_drrs:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_page_flip:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_move:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_suspend:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_basic:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_move:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_page_flip:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10093 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-6:         NOTRUN -> [SKIP][36] ([i915#3555] / [i915#3840])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5:
    - bat-adlp-11:        [PASS][37] -> [DMESG-WARN][38] ([i915#6868])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp5:
    - bat-adlp-11:        [PASS][39] -> [FAIL][40] ([i915#6121]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp5.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp5.html

  * igt@kms_flip@basic-plain-flip:
    - bat-adlp-11:        NOTRUN -> [SKIP][41] ([i915#3637])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-11/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adlp-6:         NOTRUN -> [SKIP][42] ([fdo#109285])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [PASS][43] -> [FAIL][44] ([IGT#3])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][45] ([i915#8841]) +6 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@cursor_plane_move:
    - bat-jsl-1:          [PASS][46] -> [SKIP][47] ([fdo#112080]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-jsl-1/igt@kms_psr@cursor_plane_move.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-jsl-1/igt@kms_psr@cursor_plane_move.html

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][48] ([i915#6078]) +62 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][49] ([fdo#109271]) +62 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-skl-6600u/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][50] ([fdo#109271]) +62 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-cfl-8700k/igt@kms_psr@pr_sprite_blt.html

  * {igt@kms_psr@pr_sprite_render} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][51] ([fdo#109271]) +62 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html

  * {igt@kms_psr@pr_suspend} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][52] ([fdo#109271]) +62 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-skl-guc/igt@kms_psr@pr_suspend.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][53] -> [SKIP][54] ([fdo#109271]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_dpms:
    - fi-blb-e6850:       NOTRUN -> [SKIP][55] ([fdo#109271]) +62 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-blb-e6850/igt@kms_psr@psr2_dpms.html
    - bat-kbl-2:          NOTRUN -> [SKIP][56] ([fdo#109271]) +62 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-kbl-2/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_render:
    - fi-cfl-guc:         NOTRUN -> [SKIP][57] ([fdo#109271]) +62 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-cfl-guc/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - fi-elk-e7500:       NOTRUN -> [SKIP][58] ([fdo#109271]) +62 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][59] ([fdo#109271]) +62 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][60] ([fdo#109271]) +62 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - fi-apl-guc:         NOTRUN -> [SKIP][61] ([fdo#109271]) +62 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-apl-guc/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - fi-hsw-4770:        NOTRUN -> [SKIP][62] ([fdo#109271]) +62 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-hsw-4770/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@psr2_suspend:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][63] ([fdo#109271]) +62 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][64] ([fdo#109271]) +62 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html

  * {igt@kms_psr@psr_cursor_blt} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][65] ([fdo#109271]) +62 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-ivb-3770/igt@kms_psr@psr_cursor_blt.html

  * {igt@kms_psr@psr_cursor_render} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][66] ([fdo#109271]) +62 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-ilk-650/igt@kms_psr@psr_cursor_render.html

  * {igt@kms_psr@psr_dpms} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][67] ([fdo#109271]) +62 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-glk-j4005/igt@kms_psr@psr_dpms.html

  * {igt@kms_psr@psr_sprite_blt} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][68] ([fdo#109271]) +62 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-pnv-d510/igt@kms_psr@psr_sprite_blt.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-3:          [PASS][69] -> [SKIP][70] ([fdo#112080]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  
#### Warnings ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-atsm-1:         [SKIP][71] ([i915#1072]) -> [SKIP][72] ([i915#6078]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
    - fi-hsw-4770:        [SKIP][73] ([fdo#109271] / [i915#1072]) -> [SKIP][74] ([fdo#109271]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7566 -> IGTPW_10093

  CI-20190529: 20190529
  CI_DRM_13817: 1f7a04390904ad852806492c71a11828923915aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10093: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/index.html
  IGT_7566: 7566


Testlist changes
----------------

+igt@kms_psr@pr_basic
+igt@kms_psr@pr_cursor_blt
+igt@kms_psr@pr_cursor_mmap_cpu
+igt@kms_psr@pr_cursor_mmap_gtt
+igt@kms_psr@pr_cursor_plane_move
+igt@kms_psr@pr_cursor_plane_onoff
+igt@kms_psr@pr_cursor_render
+igt@kms_psr@pr_dpms
+igt@kms_psr@pr_no_drrs
+igt@kms_psr@pr_primary_blt
+igt@kms_psr@pr_primary_mmap_cpu
+igt@kms_psr@pr_primary_mmap_gtt
+igt@kms_psr@pr_primary_page_flip
+igt@kms_psr@pr_primary_render
+igt@kms_psr@pr_sprite_blt
+igt@kms_psr@pr_sprite_mmap_cpu
+igt@kms_psr@pr_sprite_mmap_gtt
+igt@kms_psr@pr_sprite_plane_move
+igt@kms_psr@pr_sprite_plane_onoff
+igt@kms_psr@pr_sprite_render
+igt@kms_psr@pr_suspend
+igt@kms_psr@psr_basic
+igt@kms_psr@psr_cursor_blt
+igt@kms_psr@psr_cursor_mmap_cpu
+igt@kms_psr@psr_cursor_mmap_gtt
+igt@kms_psr@psr_cursor_plane_move
+igt@kms_psr@psr_cursor_plane_onoff
+igt@kms_psr@psr_cursor_render
+igt@kms_psr@psr_dpms
+igt@kms_psr@psr_no_drrs
+igt@kms_psr@psr_primary_blt
+igt@kms_psr@psr_primary_mmap_cpu
+igt@kms_psr@psr_primary_mmap_gtt
+igt@kms_psr@psr_primary_page_flip
+igt@kms_psr@psr_primary_render
+igt@kms_psr@psr_sprite_blt
+igt@kms_psr@psr_sprite_mmap_cpu
+igt@kms_psr@psr_sprite_mmap_gtt
+igt@kms_psr@psr_sprite_plane_move
+igt@kms_psr@psr_sprite_plane_onoff
+igt@kms_psr@psr_sprite_render
+igt@kms_psr@psr_suspend
-igt@kms_frontbuffer_tracking@plane-fbc-rte
-igt@kms_psr@basic
-igt@kms_psr@cursor_blt
-igt@kms_psr@cursor_mmap_cpu
-igt@kms_psr@cursor_mmap_gtt
-igt@kms_psr@cursor_plane_move
-igt@kms_psr@cursor_plane_onoff
-igt@kms_psr@cursor_render
-igt@kms_psr@dpms
-igt@kms_psr@no_drrs
-igt@kms_psr@primary_blt
-igt@kms_psr@primary_mmap_cpu
-igt@kms_psr@primary_mmap_gtt
-igt@kms_psr@primary_page_flip
-igt@kms_psr@primary_render
-igt@kms_psr@sprite_blt
-igt@kms_psr@sprite_mmap_cpu
-igt@kms_psr@sprite_mmap_gtt
-igt@kms_psr@sprite_plane_move
-igt@kms_psr@sprite_plane_onoff
-igt@kms_psr@sprite_render
-igt@kms_psr@suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/index.html

--===============2941067857388984662==
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
<tr><td><b>Series:</b></td><td>extend kms_psr test to validate pr (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125379/">https://patchwork.freedesktop.org/series/125379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13817 -&gt; IGTPW_10093</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10093 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10093, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-kbl-soraka bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10093:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-jsl-3/igt@kms_psr@pr_cursor_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_mmap_gtt} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-rplp-1/igt@kms_psr@pr_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +62 other tests skip</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-14/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +41 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_render} (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-11/igt@kms_psr@pr_sprite_render.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-jsl-1/igt@kms_psr@psr2_no_drrs.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-9/igt@kms_psr@psr2_primary_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-mtlp-6/igt@kms_psr@psr2_primary_render.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adln-1/igt@kms_psr@psr2_suspend.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_blt} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html">SKIP</a> +62 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adls-5/igt@kms_psr@psr_primary_blt.html">SKIP</a> +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_mmap_cpu} (NEW):</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-rpls-1/igt@kms_psr@psr_primary_mmap_cpu.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_blt} (NEW):</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg1-5/igt@kms_psr@psr_sprite_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-adlp-9/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-9/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-adls-5/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adls-5/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-dg1-5/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg1-5/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-dg2-9/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-9/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-mtlp-6/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-mtlp-6/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_psr@psr2_sprite_mmap_cpu:<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13817 and IGTPW_10093:</p>
<h3>New IGT tests (42)</h3>
<ul>
<li>
<p>igt@kms_psr@pr_basic:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_move:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_dpms:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_no_drrs:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_page_flip:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_move:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_suspend:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_basic:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_move:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_dpms:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_no_drrs:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_page_flip:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_move:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_suspend:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10093 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-11/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-jsl-1/igt@kms_psr@cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-jsl-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-skl-6600u/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-cfl-8700k/igt@kms_psr@pr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_render} (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_suspend} (NEW):</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-skl-guc/igt@kms_psr@pr_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-blb-e6850/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-kbl-2/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-cfl-guc/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-apl-guc/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-hsw-4770/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_blt} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-ivb-3770/igt@kms_psr@psr_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_render} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-ilk-650/igt@kms_psr@psr_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_dpms} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-glk-j4005/igt@kms_psr@psr_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_blt} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-pnv-d510/igt@kms_psr@psr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13817/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7566 -&gt; IGTPW_10093</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13817: 1f7a04390904ad852806492c71a11828923915aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10093: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10093/index.html<br />
  IGT_7566: 7566</p>
<h2>Testlist changes</h2>
<p>+igt@kms_psr@pr_basic<br />
+igt@kms_psr@pr_cursor_blt<br />
+igt@kms_psr@pr_cursor_mmap_cpu<br />
+igt@kms_psr@pr_cursor_mmap_gtt<br />
+igt@kms_psr@pr_cursor_plane_move<br />
+igt@kms_psr@pr_cursor_plane_onoff<br />
+igt@kms_psr@pr_cursor_render<br />
+igt@kms_psr@pr_dpms<br />
+igt@kms_psr@pr_no_drrs<br />
+igt@kms_psr@pr_primary_blt<br />
+igt@kms_psr@pr_primary_mmap_cpu<br />
+igt@kms_psr@pr_primary_mmap_gtt<br />
+igt@kms_psr@pr_primary_page_flip<br />
+igt@kms_psr@pr_primary_render<br />
+igt@kms_psr@pr_sprite_blt<br />
+igt@kms_psr@pr_sprite_mmap_cpu<br />
+igt@kms_psr@pr_sprite_mmap_gtt<br />
+igt@kms_psr@pr_sprite_plane_move<br />
+igt@kms_psr@pr_sprite_plane_onoff<br />
+igt@kms_psr@pr_sprite_render<br />
+igt@kms_psr@pr_suspend<br />
+igt@kms_psr@psr_basic<br />
+igt@kms_psr@psr_cursor_blt<br />
+igt@kms_psr@psr_cursor_mmap_cpu<br />
+igt@kms_psr@psr_cursor_mmap_gtt<br />
+igt@kms_psr@psr_cursor_plane_move<br />
+igt@kms_psr@psr_cursor_plane_onoff<br />
+igt@kms_psr@psr_cursor_render<br />
+igt@kms_psr@psr_dpms<br />
+igt@kms_psr@psr_no_drrs<br />
+igt@kms_psr@psr_primary_blt<br />
+igt@kms_psr@psr_primary_mmap_cpu<br />
+igt@kms_psr@psr_primary_mmap_gtt<br />
+igt@kms_psr@psr_primary_page_flip<br />
+igt@kms_psr@psr_primary_render<br />
+igt@kms_psr@psr_sprite_blt<br />
+igt@kms_psr@psr_sprite_mmap_cpu<br />
+igt@kms_psr@psr_sprite_mmap_gtt<br />
+igt@kms_psr@psr_sprite_plane_move<br />
+igt@kms_psr@psr_sprite_plane_onoff<br />
+igt@kms_psr@psr_sprite_render<br />
+igt@kms_psr@psr_suspend<br />
-igt@kms_frontbuffer_tracking@plane-fbc-rte<br />
-igt@kms_psr@basic<br />
-igt@kms_psr@cursor_blt<br />
-igt@kms_psr@cursor_mmap_cpu<br />
-igt@kms_psr@cursor_mmap_gtt<br />
-igt@kms_psr@cursor_plane_move<br />
-igt@kms_psr@cursor_plane_onoff<br />
-igt@kms_psr@cursor_render<br />
-igt@kms_psr@dpms<br />
-igt@kms_psr@no_drrs<br />
-igt@kms_psr@primary_blt<br />
-igt@kms_psr@primary_mmap_cpu<br />
-igt@kms_psr@primary_mmap_gtt<br />
-igt@kms_psr@primary_page_flip<br />
-igt@kms_psr@primary_render<br />
-igt@kms_psr@sprite_blt<br />
-igt@kms_psr@sprite_mmap_cpu<br />
-igt@kms_psr@sprite_mmap_gtt<br />
-igt@kms_psr@sprite_plane_move<br />
-igt@kms_psr@sprite_plane_onoff<br />
-igt@kms_psr@sprite_render<br />
-igt@kms_psr@suspend</p>

</body>
</html>

--===============2941067857388984662==--
