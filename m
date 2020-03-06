Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 13:38:05 -0000
Message-ID: <158350188521.3082.10051410330427959923@emeril.freedesktop.org>
References: <20200306125002.21316-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200306125002.21316-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_tools/intel=5Freg=3A_Simplify_?=
 =?utf-8?q?negative_ports?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] tools/intel_reg: Simplify negative ports
URL   : https://patchwork.freedesktop.org/series/74389/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8080 -> IGTPW_4272
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4272 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4272, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4272:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-hsw-peppy:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/fi-hsw-peppy/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_selftest@live@ring_submission}:
    - fi-hsw-peppy:       [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8080/fi-hsw-peppy/igt@i915_selftest@live@ring_submission.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/fi-hsw-peppy/igt@i915_selftest@live@ring_submission.html

  
Known issues
------------

  Here are the changes found in IGTPW_4272 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][4] -> [DMESG-WARN][5] ([i915#44])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8080/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-read:
    - fi-tgl-y:           [PASS][6] -> [DMESG-WARN][7] ([CI#94] / [i915#402]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8080/fi-tgl-y/igt@prime_vgem@basic-read.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/fi-tgl-y/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][8] ([fdo#111096] / [i915#323]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8080/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-llseek-size:
    - fi-tgl-y:           [DMESG-WARN][10] ([CI#94] / [i915#402]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8080/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44


Participating hosts (47 -> 44)
------------------------------

  Additional (3): fi-gdg-551 fi-ivb-3770 fi-snb-2520m 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4272

  CI-20190529: 20190529
  CI_DRM_8080: d122b6eaf8f3999f69ddd9cfde05cc0775e0e68e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4272: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/index.html
  IGT_5495: 22df72de8affcec22d9f354bb6148d77f60cc580 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4272/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
