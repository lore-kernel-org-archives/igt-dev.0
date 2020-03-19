Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 12:29:55 -0000
Message-ID: <158462099520.17935.9277220397792553660@emeril.freedesktop.org>
References: <20200319114206.1307-1-mika.kahola@intel.com>
In-Reply-To: <20200319114206.1307-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Test_for_maximum_number_of_planes?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Test for maximum number of planes
URL   : https://patchwork.freedesktop.org/series/74872/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8159 -> IGTPW_4324
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4324/index.html

Known issues
------------

  Here are the changes found in IGTPW_4324 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-glk-dsi:         [PASS][1] -> [INCOMPLETE][2] ([i915#58] / [i915#656] / [k.org#198133])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-glk-dsi/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4324/fi-glk-dsi/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-skl-lmem:        [PASS][3] -> [DMESG-FAIL][4] ([i915#933])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4324/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-cml-u2:          [INCOMPLETE][5] ([i915#283] / [i915#656]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-cml-u2/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4324/fi-cml-u2/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [FAIL][7] ([i915#665] / [i915#704]) -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4324/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#665]: https://gitlab.freedesktop.org/drm/intel/issues/665
  [i915#704]: https://gitlab.freedesktop.org/drm/intel/issues/704
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (43 -> 36)
------------------------------

  Additional (1): fi-bwr-2160 
  Missing    (8): fi-kbl-soraka fi-bdw-5557u fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-gdg-551 fi-byt-clapper fi-skl-6600u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5522 -> IGTPW_4324

  CI-20190529: 20190529
  CI_DRM_8159: 00b2e0f1e7b3ea36379d68855f46a86400935411 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4324: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4324/index.html
  IGT_5522: bd2b01af69c9720d54e68a8702a23e4ff3637746 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4324/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
