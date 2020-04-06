Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Apr 2020 17:17:17 -0000
Message-ID: <158619343729.4194.4431736429668229295@emeril.freedesktop.org>
References: <20200406135709.569315-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200406135709.569315-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/2=5D_include=3A_bump_i915_head?=
 =?utf-8?q?er_for_new_feature?=
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

Series: series starting with [i-g-t,v3,1/2] include: bump i915 header for new feature
URL   : https://patchwork.freedesktop.org/series/75551/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8261 -> IGTPW_4415
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/index.html

Known issues
------------

  Here are the changes found in IGTPW_4415 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-icl-dsi:         [PASS][1] -> [INCOMPLETE][2] ([i915#189])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/fi-icl-dsi/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/fi-icl-dsi/igt@i915_pm_rpm@basic-rte.html

  
#### Possible fixes ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189


Participating hosts (53 -> 46)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5572 -> IGTPW_4415

  CI-20190529: 20190529
  CI_DRM_8261: 80b64adc6f5ffeb1c69996737dbdc5ad275d8e6c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4415: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/index.html
  IGT_5572: 6c124b5c8501d900966c033ac86c3dc55c16a2da @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@gen8-unprivileged-multi-ctx-counters
+igt@perf@invalid-multi-ctx-params
+igt@perf@unprivileged-multi-ctx-counters

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
