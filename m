Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 16:00:38 -0000
Message-ID: <157970883823.22395.640536886963302522@emeril.freedesktop.org>
References: <20200122101043.21347-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200122101043.21347-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fengine=5Ftopology=3A_Generate_engine_names_based_on_class_?=
 =?utf-8?b?KHJldjIp?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_engine_topology: Generate engine names based on class (rev2)
URL   : https://patchwork.freedesktop.org/series/72384/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7792 -> IGTPW_3967
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3967 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3967, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3967:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@fds:
    - fi-hsw-peppy:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-hsw-peppy/igt@gem_exec_parallel@fds.html

  
Known issues
------------

  Here are the changes found in IGTPW_3967 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_execlists:
    - fi-kbl-soraka:      [PASS][2] -> [DMESG-FAIL][3] ([i915#656])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7792/fi-kbl-soraka/igt@i915_selftest@live_execlists.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-kbl-soraka/igt@i915_selftest@live_execlists.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][4] -> [FAIL][5] ([i915#217])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7792/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
    - fi-kbl-7500u:       [PASS][6] -> [FAIL][7] ([fdo#111096] / [i915#323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7792/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_coherency:
    - fi-cfl-guc:         [DMESG-FAIL][8] ([i915#889]) -> [PASS][9] +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7792/fi-cfl-guc/igt@i915_selftest@live_coherency.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-cfl-guc/igt@i915_selftest@live_coherency.html

  * igt@i915_selftest@live_gt_timelines:
    - fi-cfl-guc:         [DMESG-WARN][10] ([i915#889]) -> [PASS][11] +23 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7792/fi-cfl-guc/igt@i915_selftest@live_gt_timelines.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-cfl-guc/igt@i915_selftest@live_gt_timelines.html

  
#### Warnings ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [INCOMPLETE][12] ([i915#45]) -> [TIMEOUT][13] ([fdo#112271] / [i915#816])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7792/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][14] ([i915#725]) -> [DMESG-FAIL][15] ([i915#553] / [i915#725])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7792/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-icl-u2:          [SKIP][16] ([fdo#109309]) -> [FAIL][17] ([i915#217])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7792/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html

  
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (40 -> 42)
------------------------------

  Additional (5): fi-bdw-5557u fi-hsw-peppy fi-gdg-551 fi-blb-e6850 fi-skl-6600u 
  Missing    (3): fi-byt-clapper fi-whl-u fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3967

  CI-20190529: 20190529
  CI_DRM_7792: 1eaee9143cc2e9d5a03dc8243cc0fcfac894dc94 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3967: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ctx_isolation@-clean
+igt@gem_ctx_isolation@-dirty-create
+igt@gem_ctx_isolation@-dirty-switch
+igt@gem_ctx_isolation@-none
+igt@gem_ctx_isolation@-nonpriv
+igt@gem_ctx_isolation@-nonpriv-switch
+igt@gem_ctx_isolation@-reset
+igt@gem_ctx_isolation@-s3
+igt@gem_ctx_isolation@-s4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3967/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
