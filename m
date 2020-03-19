Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 14:53:51 -0000
Message-ID: <158462963185.17934.10532095622532232374@emeril.freedesktop.org>
References: <20200319140608.25405-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200319140608.25405-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fmultiple=3A_Avoid_CRC_buffer_overflows_=28rev2=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_plane_multiple: Avoid CRC buffer overflows (rev2)
URL   : https://patchwork.freedesktop.org/series/74846/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8159 -> IGTPW_4325
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/index.html

Known issues
------------

  Here are the changes found in IGTPW_4325 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-r:           [PASS][1] -> [INCOMPLETE][2] ([fdo#112259] / [i915#656])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-kbl-r/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/fi-kbl-r/igt@i915_selftest@live@execlists.html
    - fi-cfl-8109u:       [PASS][3] -> [INCOMPLETE][4] ([i915#1430] / [i915#656])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
    - fi-bxt-dsi:         [PASS][5] -> [INCOMPLETE][6] ([fdo#103927] / [i915#1430] / [i915#656])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-cml-u2:          [INCOMPLETE][7] ([i915#283] / [i915#656]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-cml-u2/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/fi-cml-u2/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][9] ([fdo#111407]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [FAIL][11] ([i915#665] / [i915#704]) -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8159/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [i915#1430]: https://gitlab.freedesktop.org/drm/intel/issues/1430
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#665]: https://gitlab.freedesktop.org/drm/intel/issues/665
  [i915#704]: https://gitlab.freedesktop.org/drm/intel/issues/704


Participating hosts (43 -> 35)
------------------------------

  Additional (1): fi-bwr-2160 
  Missing    (9): fi-tgl-dsi fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-gdg-551 fi-ivb-3770 fi-elk-e7500 fi-byt-clapper fi-skl-6600u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5522 -> IGTPW_4325

  CI-20190529: 20190529
  CI_DRM_8159: 00b2e0f1e7b3ea36379d68855f46a86400935411 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4325: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/index.html
  IGT_5522: bd2b01af69c9720d54e68a8702a23e4ff3637746 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4325/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
