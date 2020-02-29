Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 29 Feb 2020 18:00:37 -0000
Message-ID: <158299923746.19635.4150416018979978711@emeril.freedesktop.org>
References: <20200229170438.28820-1-anshuman.gupta@intel.com>
In-Reply-To: <20200229170438.28820-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgREMgc3Rh?=
 =?utf-8?q?tes_IGT_misc_=28rev4=29?=
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

Series: DC states IGT misc (rev4)
URL   : https://patchwork.freedesktop.org/series/73509/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8036 -> IGTPW_4241
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/index.html

Known issues
------------

  Here are the changes found in IGTPW_4241 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6700k2:      [PASS][1] -> [INCOMPLETE][2] ([i915#146] / [i915#69])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][3] -> [FAIL][4] ([CI#94])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][7] -> [FAIL][8] ([fdo#111096] / [i915#323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][9] ([CI#94] / [i915#402]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69


Participating hosts (42 -> 38)
------------------------------

  Additional (4): fi-hsw-peppy fi-skl-lmem fi-bwr-2160 fi-bsw-n3050 
  Missing    (8): fi-bdw-5557u fi-tgl-dsi fi-byt-squawks fi-bsw-cyan fi-ivb-3770 fi-elk-e7500 fi-bdw-samus fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5480 -> IGTPW_4241

  CI-20190529: 20190529
  CI_DRM_8036: 0f36a1b338da9019bde23189927497551256a90c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4241: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/index.html
  IGT_5480: 13dbe276f21d75a42795567973b9303112bd7c5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
