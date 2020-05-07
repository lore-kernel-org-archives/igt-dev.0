Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 07 May 2020 11:07:52 -0000
Message-ID: <158884967255.2188.8989328627947827272@emeril.freedesktop.org>
References: <20200507102210.23599-1-anshuman.gupta@intel.com>
In-Reply-To: <20200507102210.23599-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbHBzcCBw?=
 =?utf-8?q?latform_agnostic_support_=28rev10=29?=
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

Series: lpsp platform agnostic support (rev10)
URL   : https://patchwork.freedesktop.org/series/74647/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5638 -> IGTPW_4542
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4542 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4542, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4542/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4542:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4542/fi-bsw-kefka/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4542 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-kefka:       [PASS][2] -> [INCOMPLETE][3] ([i915#151] / [i915#392])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4542/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-8809g:       [PASS][4] -> [SKIP][5] ([fdo#109271])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4542/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#392]: https://gitlab.freedesktop.org/drm/intel/issues/392


Participating hosts (49 -> 44)
------------------------------

  Additional (2): fi-bdw-gvtdvm fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5638 -> IGTPW_4542

  CI-20190529: 20190529
  CI_DRM_8441: 6c0ee41a7c3201ef2a89800234803a95f65989be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4542: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4542/index.html
  IGT_5638: 50868ab3c532a86aa147fb555b69a1078c572b13 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_pm_lpsp@kms-lpsp
-igt@i915_pm_lpsp@edp-native
-igt@i915_pm_lpsp@edp-panel-fitter
-igt@i915_pm_lpsp@non-edp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4542/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
