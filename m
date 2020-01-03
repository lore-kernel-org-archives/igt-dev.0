Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Jan 2020 12:53:11 -0000
Message-ID: <157805599186.20613.7287731263422371023@emeril.freedesktop.org>
References: <20200103103022.13889-1-anshuman.gupta@intel.com>
In-Reply-To: <20200103103022.13889-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Iga21zX2Nv?=
 =?utf-8?q?ntent=5Fprotection=3A_use_delay_for_few_panels_which_don=27t_re?=
 =?utf-8?q?spond_for_AKE_cert_read=2E?=
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
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: kms_content_protection: use delay for few panels which don't respond for AKE cert read.
URL   : https://patchwork.freedesktop.org/series/71598/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7673 -> IGTPW_3896
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/index.html

Known issues
------------

  Here are the changes found in IGTPW_3896 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6770hq:      [PASS][1] -> [INCOMPLETE][2] ([i915#671])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_active:
    - fi-icl-y:           [PASS][3] -> [DMESG-FAIL][4] ([i915#765])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-icl-y/igt@i915_selftest@live_active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-icl-y/igt@i915_selftest@live_active.html

  * igt@i915_selftest@live_blt:
    - fi-byt-j1900:       [PASS][5] -> [DMESG-FAIL][6] ([i915#725])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-byt-j1900/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-byt-j1900/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][7] -> [DMESG-FAIL][8] ([i915#889]) +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_late_gt_pm:
    - fi-skl-6600u:       [PASS][9] -> [DMESG-WARN][10] ([i915#889]) +23 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html

  * igt@kms_addfb_basic@basic-y-tiled:
    - fi-icl-dsi:         [PASS][11] -> [DMESG-WARN][12] ([i915#109])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-icl-dsi/igt@kms_addfb_basic@basic-y-tiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-icl-dsi/igt@kms_addfb_basic@basic-y-tiled.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic-all:
    - fi-byt-n2820:       [FAIL][13] ([i915#894]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-byt-n2820/igt@gem_exec_store@basic-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-byt-n2820/igt@gem_exec_store@basic-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-guc:         [INCOMPLETE][15] ([i915#505] / [i915#671]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-cfl-guc/igt@i915_module_load@reload-with-fault-injection.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-cfl-guc/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-hsw-4770:        [SKIP][17] ([fdo#109271]) -> [PASS][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-hsw-4770/igt@i915_pm_rpm@basic-pci-d3-state.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-hsw-4770/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [DMESG-FAIL][19] ([i915#722]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][21] ([i915#553] / [i915#725]) -> [DMESG-FAIL][22] ([i915#725])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][23] ([fdo#111407]) -> [FAIL][24] ([fdo#111096] / [i915#323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7673/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#894]: https://gitlab.freedesktop.org/drm/intel/issues/894


Participating hosts (45 -> 44)
------------------------------

  Additional (7): fi-kbl-soraka fi-bwr-2160 fi-snb-2520m fi-ilk-650 fi-elk-e7500 fi-skl-lmem fi-blb-e6850 
  Missing    (8): fi-hsw-4770r fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-tgl-y fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5357 -> IGTPW_3896

  CI-20190529: 20190529
  CI_DRM_7673: 6e3335ed7b56aaf9d55ddf51cddea4d844dc3a78 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3896: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/index.html
  IGT_5357: a555a4b98f90dab655d24bb3d07e9291a8b8dac8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3896/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
