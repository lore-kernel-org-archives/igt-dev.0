Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 02 Mar 2020 13:21:33 -0000
Message-ID: <158315529347.30643.17502993088256293395@emeril.freedesktop.org>
References: <20200302103152.1780202-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200302103152.1780202-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_global_sseu_parameter_tests_=28rev2=29?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: add global sseu parameter tests (rev2)
URL   : https://patchwork.freedesktop.org/series/74111/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8042 -> IGTPW_4244
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/index.html

Known issues
------------

  Here are the changes found in IGTPW_4244 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_linear_blits@basic:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/fi-tgl-y/igt@gem_render_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/fi-tgl-y/igt@gem_render_linear_blits@basic.html

  * igt@i915_selftest@live@active:
    - fi-icl-y:           [PASS][3] -> [DMESG-FAIL][4] ([i915#765])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/fi-icl-y/igt@i915_selftest@live@active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/fi-icl-y/igt@i915_selftest@live@active.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][5] -> [FAIL][6] ([i915#217] / [i915#976])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][7] ([i915#877]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gtt:
    - fi-bxt-dsi:         [INCOMPLETE][9] ([fdo#103927]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/fi-bxt-dsi/igt@i915_selftest@live@gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/fi-bxt-dsi/igt@i915_selftest@live@gtt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][11] ([fdo#111407]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@vgem_basic@dmabuf-fence:
    - fi-tgl-y:           [DMESG-WARN][13] ([CI#94] / [i915#402]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/fi-tgl-y/igt@vgem_basic@dmabuf-fence.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/fi-tgl-y/igt@vgem_basic@dmabuf-fence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (47 -> 46)
------------------------------

  Additional (5): fi-glk-dsi fi-bwr-2160 fi-elk-e7500 fi-bsw-kefka fi-blb-e6850 
  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5483 -> IGTPW_4244

  CI-20190529: 20190529
  CI_DRM_8042: d8191f679bee7619af0f3ec5b1848376a4cdab40 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4244: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/index.html
  IGT_5483: 1707153df224ffb6333c6c660a792b7f334eb3d3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@global-sseu-config
+igt@perf@global-sseu-config-invalid

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
