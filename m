Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Apr 2020 09:38:51 -0000
Message-ID: <158798033168.26355.8480665017982683788@emeril.freedesktop.org>
References: <20200427090014.10041-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200427090014.10041-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZ2VtX3dz?=
 =?utf-8?q?im=3A_Fix_preempt_period_assert?=
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

Series: gem_wsim: Fix preempt period assert
URL   : https://patchwork.freedesktop.org/series/76544/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5612 -> IGTPW_4509
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4509 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4509, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4509/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4509:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4509/fi-icl-y/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_4509 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_pm:
    - fi-skl-6700k2:      [PASS][2] -> [DMESG-FAIL][3] ([i915#1791])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/fi-skl-6700k2/igt@i915_selftest@live@gt_pm.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4509/fi-skl-6700k2/igt@i915_selftest@live@gt_pm.html
    - fi-kbl-x1275:       [PASS][4] -> [DMESG-FAIL][5] ([i915#1791])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/fi-kbl-x1275/igt@i915_selftest@live@gt_pm.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4509/fi-kbl-x1275/igt@i915_selftest@live@gt_pm.html
    - fi-kbl-r:           [PASS][6] -> [DMESG-FAIL][7] ([i915#1791])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/fi-kbl-r/igt@i915_selftest@live@gt_pm.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4509/fi-kbl-r/igt@i915_selftest@live@gt_pm.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - fi-bdw-5557u:       [DMESG-FAIL][8] ([i915#1791]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/fi-bdw-5557u/igt@i915_selftest@live@gt_pm.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4509/fi-bdw-5557u/igt@i915_selftest@live@gt_pm.html

  
  [i915#1791]: https://gitlab.freedesktop.org/drm/intel/issues/1791


Participating hosts (45 -> 43)
------------------------------

  Additional (3): fi-icl-y fi-kbl-7560u fi-bxt-dsi 
  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5612 -> IGTPW_4509

  CI-20190529: 20190529
  CI_DRM_8370: 1f3ffd7683d5457e14a1f879a8714a74b7b7faeb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4509: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4509/index.html
  IGT_5612: c8dc1fd926a550308b971ca7d83fe0a927a38152 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4509/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
