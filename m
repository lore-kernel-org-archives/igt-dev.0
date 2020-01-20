Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 10:28:55 -0000
Message-ID: <157951613501.682.17588592811659656512@emeril.freedesktop.org>
References: <20200120085158.9151-1-anshuman.gupta@intel.com>
In-Reply-To: <20200120085158.9151-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hlY2sg?=
 =?utf-8?q?for_DPMS_off_state?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Check for DPMS off state
URL   : https://patchwork.freedesktop.org/series/72264/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7777 -> IGTPW_3948
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3948 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3948, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3948:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@atomic-dpms:
    - fi-icl-u2:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-icl-u2/igt@kms_content_protection@atomic-dpms.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-skl-6700k2/igt@kms_content_protection@atomic-dpms.html
    - fi-icl-u3:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-icl-u3/igt@kms_content_protection@atomic-dpms.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-kbl-x1275/igt@kms_content_protection@atomic-dpms.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-kbl-7500u/igt@kms_content_protection@atomic-dpms.html

  
Known issues
------------

  Here are the changes found in IGTPW_3948 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][6] -> [TIMEOUT][7] ([fdo#112271] / [i915#816])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-kbl-x1275:       [PASS][8] -> [INCOMPLETE][9] ([i915#879])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][10] -> [DMESG-FAIL][11] ([i915#770])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-bsw-nick:        [PASS][12] -> [DMESG-FAIL][13] ([i915#541])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-bsw-nick/igt@i915_selftest@live_gt_heartbeat.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-bsw-nick/igt@i915_selftest@live_gt_heartbeat.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-peppy:       [DMESG-FAIL][14] ([i915#553] / [i915#725]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-hsw-peppy/igt@i915_selftest@live_blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-hsw-peppy/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][16] ([i915#553] / [i915#725]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-icl-u2:          [FAIL][18] ([fdo#109635] / [i915#217]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html

  
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879


Participating hosts (40 -> 42)
------------------------------

  Additional (6): fi-kbl-soraka fi-ilk-650 fi-snb-2520m fi-elk-e7500 fi-skl-lmem fi-skl-6600u 
  Missing    (4): fi-kbl-7560u fi-byt-squawks fi-bsw-cyan fi-ilk-m540 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5372 -> IGTPW_3948

  CI-20190529: 20190529
  CI_DRM_7777: 7d2e349542ee3d682a98cc12c3ebdd4677d00d71 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3948: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/index.html
  IGT_5372: 0d00a27fbbd4d4a77d24499ea9811e07e65eb0ac @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3948/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
