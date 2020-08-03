Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 03 Aug 2020 12:15:11 -0000
Message-ID: <159645691138.19296.17250401355350532974@emeril.freedesktop.org>
References: <20200803093051.2112-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200803093051.2112-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fparallel=3A_Add_basic_userptr_thrashing?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0187596137=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0187596137==
Content-Type: multipart/alternative;
 boundary="===============2391512825647885226=="

--===============2391512825647885226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_parallel: Add basic userptr thrashing
URL   : https://patchwork.freedesktop.org/series/80202/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8834_full -> IGTPW_4843_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4843_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4843_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4843_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@busy-hang@rcs0:
    - shard-snb:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb4/igt@perf_pmu@busy-hang@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@perf_pmu@busy-hang@rcs0.html

  * igt@perf_pmu@busy-hang@vecs0:
    - shard-hsw:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@perf_pmu@busy-hang@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@perf_pmu@busy-hang@vecs0.html

  * igt@prime_busy@after@vecs0:
    - shard-hsw:          [PASS][5] -> [FAIL][6] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw6/igt@prime_busy@after@vecs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw2/igt@prime_busy@after@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8834_full and IGTPW_4843_full:

### New IGT tests (7) ###

  * igt@gem_exec_parallel@engines@userptr:
    - Statuses : 7 pass(s)
    - Exec time: [1.38, 1.94] s

  * igt@gem_exec_parallel@userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_parallel@userptr@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.28, 2.18] s

  * igt@gem_exec_parallel@userptr@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.35, 2.02] s

  * igt@gem_exec_parallel@userptr@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.31, 1.92] s

  * igt@gem_exec_parallel@userptr@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [1.33, 1.42] s

  * igt@gem_exec_parallel@userptr@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.32, 1.96] s

  

Known issues
------------

  Here are the changes found in IGTPW_4843_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-hsw:          [PASS][9] -> [DMESG-WARN][10] ([i915#2165])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@gem_mmap_gtt@fault-concurrent.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][11] -> [WARN][12] ([i915#1519])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw8/igt@i915_pm_rc6_residency@rc6-idle.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [PASS][13] -> [INCOMPLETE][14] ([i915#1635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl3/igt@i915_selftest@mock@contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-apl7/igt@i915_selftest@mock@contexts.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][15] -> [DMESG-FAIL][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk3/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109642] / [fdo#111068])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb4/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-query-busy:
    - shard-hsw:          [PASS][27] -> [TIMEOUT][28] ([i915#1958]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@kms_vblank@pipe-b-query-busy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@kms_vblank@pipe-b-query-busy.html
    - shard-snb:          [PASS][29] -> [TIMEOUT][30] ([i915#1958])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb4/igt@kms_vblank@pipe-b-query-busy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@kms_vblank@pipe-b-query-busy.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#1542])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb4/igt@perf@blocking-parameterized.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb5/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@busy-hang@vcs0:
    - shard-snb:          [PASS][33] -> [INCOMPLETE][34] ([i915#82])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb4/igt@perf_pmu@busy-hang@vcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@perf_pmu@busy-hang@vcs0.html

  * igt@prime_busy@after@vcs0:
    - shard-hsw:          [PASS][35] -> [FAIL][36] ([i915#2258]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw6/igt@prime_busy@after@vcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw2/igt@prime_busy@after@vcs0.html

  
#### Possible fixes ####

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-glk:          [DMESG-WARN][37] ([i915#2165]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk6/igt@gem_mmap_gtt@fault-concurrent.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk3/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-apl:          [FAIL][39] ([i915#1635]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1436] / [i915#716]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_addfb_basic@small-bo:
    - shard-snb:          [TIMEOUT][43] ([i915#1958]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb2/igt@kms_addfb_basic@small-bo.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@kms_addfb_basic@small-bo.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-kbl:          [DMESG-WARN][45] ([i915#1982]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-hsw:          [TIMEOUT][47] ([i915#1958]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-glk:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb1/igt@kms_psr@psr2_sprite_render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@prime_busy@hang@bcs0:
    - shard-hsw:          [FAIL][55] ([i915#2258]) -> [PASS][56] +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw6/igt@prime_busy@hang@bcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@prime_busy@hang@bcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-apl:          [INCOMPLETE][57] ([i915#1635]) -> [FAIL][58] ([i915#1635] / [i915#1930])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl8/igt@gem_exec_reloc@basic-concurrent0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-apl2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][59] ([i915#2021]) -> [WARN][60] ([i915#2036])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][61] ([i915#1515]) -> [FAIL][62] ([i915#1515])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][63] ([i915#1319]) -> [TIMEOUT][64] ([i915#1319] / [i915#1958])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl2/igt@kms_content_protection@lic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-snb:          [TIMEOUT][65] ([i915#1958]) -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
    - shard-snb:          [SKIP][67] ([fdo#109271]) -> [TIMEOUT][68] ([i915#1958]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html
    - shard-hsw:          [SKIP][69] ([fdo#109271]) -> [TIMEOUT][70] ([i915#1958])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw4/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][71] ([i915#1226]) -> [SKIP][72] ([fdo#109349])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][73] ([i915#1611] / [i915#1635]) -> [FAIL][74] ([i915#1635] / [i915#2110])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl8/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-apl7/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2165]: https://gitlab.freedesktop.org/drm/intel/issues/2165
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5757 -> IGTPW_4843
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8834: ac25ad7789fe4cc689a854d823a226ce24bb0a62 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4843: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/index.html
  IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/index.html

--===============2391512825647885226==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_parallel: Add basic userptr thrashing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80202/">https://patchwork.freedesktop.org/series/80202/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8834_full -&gt; IGTPW_4843_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4843_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4843_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4843_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@perf_pmu@busy-hang@rcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb4/igt@perf_pmu@busy-hang@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@perf_pmu@busy-hang@rcs0.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-hang@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@perf_pmu@busy-hang@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@perf_pmu@busy-hang@vecs0.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw6/igt@prime_busy@after@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw2/igt@prime_busy@after@vecs0.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8834_full and IGTPW_4843_full:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.38, 1.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@userptr@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.28, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@userptr@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.35, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@userptr@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.31, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@userptr@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.33, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@userptr@vecs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.32, 1.96] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4843_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@gem_mmap_gtt@fault-concurrent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@gem_mmap_gtt@fault-concurrent.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2165">i915#2165</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw8/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl3/igt@i915_selftest@mock@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-apl7/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk3/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb4/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb8/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-busy:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@kms_vblank@pipe-b-query-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@kms_vblank@pipe-b-query-busy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb4/igt@kms_vblank@pipe-b-query-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@kms_vblank@pipe-b-query-busy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb4/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb5/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-hang@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb4/igt@perf_pmu@busy-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@perf_pmu@busy-hang@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw6/igt@prime_busy@after@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw2/igt@prime_busy@after@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk6/igt@gem_mmap_gtt@fault-concurrent.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2165">i915#2165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk3/igt@gem_mmap_gtt@fault-concurrent.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb2/igt@kms_addfb_basic@small-bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@kms_addfb_basic@small-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb1/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw6/igt@prime_busy@hang@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@prime_busy@hang@bcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl8/igt@gem_exec_reloc@basic-concurrent0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-apl2/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-others@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2021">i915#2021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2036">i915#2036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl2/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-kbl4/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-snb4/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw4/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-hsw6/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/shard-apl7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5757 -&gt; IGTPW_4843</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8834: ac25ad7789fe4cc689a854d823a226ce24bb0a62 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4843: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4843/index.html<br />
  IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2391512825647885226==--

--===============0187596137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0187596137==--
