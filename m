Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 13:57:42 -0000
Message-ID: <158574946291.25628.10175648995486001453@emeril.freedesktop.org>
References: <20200401104850.139397-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200401104850.139397-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/perf=3A_fixup_convert?=
 =?utf-8?q?er_script?=
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

Series: series starting with [i-g-t,1/2] lib/i915/perf: fixup converter script
URL   : https://patchwork.freedesktop.org/series/75361/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8232 -> IGTPW_4390
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/index.html

Known issues
------------

  Here are the changes found in IGTPW_4390 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-cml-u2:          [PASS][1] -> [INCOMPLETE][2] ([i915#283] / [i915#656])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/fi-cml-u2/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/fi-cml-u2/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][3] -> [FAIL][4] ([i915#262])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - fi-icl-guc:         [INCOMPLETE][5] ([i915#1505] / [i915#1581]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/fi-icl-guc/igt@i915_selftest@live@requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/fi-icl-guc/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1314]: https://gitlab.freedesktop.org/drm/intel/issues/1314
  [i915#1351]: https://gitlab.freedesktop.org/drm/intel/issues/1351
  [i915#1505]: https://gitlab.freedesktop.org/drm/intel/issues/1505
  [i915#1581]: https://gitlab.freedesktop.org/drm/intel/issues/1581
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (49 -> 43)
------------------------------

  Additional (2): fi-kbl-soraka fi-kbl-7560u 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5553 -> IGTPW_4390

  CI-20190529: 20190529
  CI_DRM_8232: cade363a69762c57ffb58f91b47670df7ca520bf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4390: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/index.html
  IGT_5553: 60475d9b41c58b7d256e83c7d53eaf7c2f1f8ecc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
