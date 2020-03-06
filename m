Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 10:16:31 -0000
Message-ID: <158348979157.3083.15882382468839278330@emeril.freedesktop.org>
References: <20200306084550.12618-1-karthik.b.s@intel.com>
In-Reply-To: <20200306084550.12618-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdp=5Ftiled=5Fdisplay=3A_Increase_the_time_limit_to_receiv?=
 =?utf-8?q?e_all_page_flips_=28rev2=29?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_dp_tiled_display: Increase the time limit to receive all page flips (rev2)
URL   : https://patchwork.freedesktop.org/series/74367/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8076 -> IGTPW_4271
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4271:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_selftest@live@ring_submission}:
    - fi-byt-j1900:       [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-byt-j1900/igt@i915_selftest@live@ring_submission.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-byt-j1900/igt@i915_selftest@live@ring_submission.html

  
Known issues
------------

  Here are the changes found in IGTPW_4271 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][3] -> [FAIL][4] ([i915#217])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@vgem_basic@create:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-tgl-y/igt@vgem_basic@create.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-tgl-y/igt@vgem_basic@create.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][7] ([i915#877]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_mocs:
    - fi-snb-2520m:       [DMESG-WARN][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-snb-2520m/igt@i915_selftest@live@gt_mocs.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-snb-2520m/igt@i915_selftest@live@gt_mocs.html

  * {igt@i915_selftest@live@ring_submission}:
    - fi-hsw-peppy:       [DMESG-FAIL][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-hsw-peppy/igt@i915_selftest@live@ring_submission.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-hsw-peppy/igt@i915_selftest@live@ring_submission.html
    - fi-snb-2520m:       [INCOMPLETE][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-snb-2520m/igt@i915_selftest@live@ring_submission.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-snb-2520m/igt@i915_selftest@live@ring_submission.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - fi-tgl-y:           [DMESG-WARN][15] ([CI#94] / [i915#402]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-63.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-63.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][17] ([fdo#111096] / [i915#323]) -> [FAIL][18] ([fdo#111407])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#998]: https://gitlab.freedesktop.org/drm/intel/issues/998


Participating hosts (45 -> 43)
------------------------------

  Additional (3): fi-skl-lmem fi-blb-e6850 fi-kbl-r 
  Missing    (5): fi-byt-squawks fi-bsw-cyan fi-kbl-guc fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4271

  CI-20190529: 20190529
  CI_DRM_8076: bb93ee259288a580da4625a7a747bcd9bbedaf96 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4271: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/index.html
  IGT_5495: 22df72de8affcec22d9f354bb6148d77f60cc580 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
