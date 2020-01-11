Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 11 Jan 2020 06:15:09 -0000
Message-ID: <157872330994.16374.1928842122379141984@emeril.freedesktop.org>
References: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
In-Reply-To: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/gem=5Fmman=3A_Priorit?=
 =?utf-8?q?ize_GTT_mappings_over_WC?=
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/i915/gem_mman: Prioritize GTT mappings over WC
URL   : https://patchwork.freedesktop.org/series/71916/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7721 -> IGTPW_3916
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/index.html

Known issues
------------

  Here are the changes found in IGTPW_3916 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][1] -> [DMESG-WARN][2] ([i915#889])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-lmem:        [PASS][3] -> [INCOMPLETE][4] ([i915#671])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_execlists:
    - fi-kbl-soraka:      [PASS][5] -> [DMESG-FAIL][6] ([i915#656])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-kbl-soraka/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-kbl-soraka/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_reset:
    - fi-cfl-guc:         [PASS][7] -> [DMESG-FAIL][8] ([i915#889]) +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-cfl-guc/igt@i915_selftest@live_reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-cfl-guc/igt@i915_selftest@live_reset.html

  * igt@i915_selftest@live_workarounds:
    - fi-cfl-guc:         [PASS][9] -> [DMESG-WARN][10] ([i915#889]) +23 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-cfl-guc/igt@i915_selftest@live_workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-cfl-guc/igt@i915_selftest@live_workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-skl-6770hq:      [PASS][11] -> [SKIP][12] ([fdo#109271]) +27 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][13] ([i915#816]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_render_linear_blits@basic:
    - fi-icl-dsi:         [DMESG-WARN][15] ([i915#109]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-icl-dsi/igt@gem_render_linear_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-icl-dsi/igt@gem_render_linear_blits@basic.html

  * igt@gem_sync@basic-each:
    - fi-tgl-y:           [INCOMPLETE][17] ([i915#472] / [i915#707]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-tgl-y/igt@gem_sync@basic-each.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-tgl-y/igt@gem_sync@basic-each.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][19] ([i915#553] / [i915#725]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (47 -> 42)
------------------------------

  Additional (4): fi-hsw-4770r fi-byt-n2820 fi-bdw-5557u fi-snb-2520m 
  Missing    (9): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-ctg-p8600 fi-byt-clapper fi-ivb-3770 fi-snb-2600 fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5364 -> IGTPW_3916

  CI-20190529: 20190529
  CI_DRM_7721: 3a2436c56fcf2d133d701a112eb1e0dfce0b846d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3916: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/index.html
  IGT_5364: b7cb6ffdb65cbd233f5ddee2f2dabf97b34fa640 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
