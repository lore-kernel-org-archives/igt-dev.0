Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Feb 2020 22:48:09 -0000
Message-ID: <158111568923.8754.11914775756240198472@emeril.freedesktop.org>
References: <20200205123927.2865-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200205123927.2865-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZ2VtX2N0?=
 =?utf-8?q?x=5Fcreate=3AAdjusted_test_to_use_=5F=5Ffor=5Feach=5Fphysical?=
 =?utf-8?q?=5Fengine_to_utilize_all_available_engines_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: gem_ctx_create:Adjusted test to use __for_each_physical_engine to utilize all available engines (rev2)
URL   : https://patchwork.freedesktop.org/series/72889/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7869_full -> IGTPW_4100_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4100_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4100_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4100_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_4100_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb5/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_caching@read-writes:
    - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#694])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw2/igt@gem_caching@read-writes.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-hsw4/igt@gem_caching@read-writes.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([fdo#103665])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb5/igt@gem_exec_schedule@deep-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb4/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +11 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@gem_exec_schedule@fifo-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb8/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][17] -> [INCOMPLETE][18] ([i915#58] / [k.org#198133])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][19] -> [DMESG-FAIL][20] ([i915#553] / [i915#725])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw2/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-hsw4/igt@i915_selftest@live_blt.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1140])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk4/igt@kms_flip@flip-vs-expired-vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#899])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-iclb:         [INCOMPLETE][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@gem_ctx_exec@basic-nohangcheck.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][33] ([fdo#112080]) -> [PASS][34] +9 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][35] ([i915#677]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#112146]) -> [PASS][38] +7 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-hsw:          [FAIL][39] ([i915#694]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw7/igt@gem_partial_pwrite_pread@write.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-hsw6/igt@gem_partial_pwrite_pread@write.html

  * igt@i915_pm_rps@reset:
    - shard-apl:          [FAIL][41] ([i915#39]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl1/igt@i915_pm_rps@reset.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-apl4/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][45] ([i915#79]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][49] ([fdo#109642] / [fdo#111068]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +14 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [FAIL][56] ([IGT#28])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][57] ([IGT#28]) -> [SKIP][58] ([fdo#112080])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][59] ([i915#818]) -> [FAIL][60] ([i915#694])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-hsw8/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][61] ([i915#694]) -> [FAIL][62] ([i915#818])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw1/igt@gem_tiled_blits@normal.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][63] ([fdo#109349]) -> [DMESG-WARN][64] ([fdo#107724])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5419 -> IGTPW_4100
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7869: db0579be255412f38a450c3c577f8d10f1195034 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4100: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/index.html
  IGT_5419: 44913a91e77434b03001bb9ea53216cd03c476e6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4100/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
