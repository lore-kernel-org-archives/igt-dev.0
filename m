Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 23:36:34 -0000
Message-ID: <158466099436.17935.14448593366082058789@emeril.freedesktop.org>
References: <20200319225254.29840-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200319225254.29840-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVGVzdCBj?=
 =?utf-8?q?onfigurable_poll_delay_in_perf_OA_=28rev3=29?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test configurable poll delay in perf OA (rev3)
URL   : https://patchwork.freedesktop.org/series/74655/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8161 -> IGTPW_4332
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/index.html

Known issues
------------

  Here are the changes found in IGTPW_4332 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@ring_submission:
    - fi-bwr-2160:        [PASS][1] -> [INCOMPLETE][2] ([i915#489])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/fi-bwr-2160/igt@i915_selftest@live@ring_submission.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/fi-bwr-2160/igt@i915_selftest@live@ring_submission.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([i915#323])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-icl-dsi:         [INCOMPLETE][5] ([i915#189]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - {fi-ehl-1}:         [INCOMPLETE][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/fi-ehl-1/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/fi-ehl-1/igt@i915_selftest@live@execlists.html
    - fi-kbl-soraka:      [INCOMPLETE][9] ([fdo#112259] / [i915#656]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (36 -> 41)
------------------------------

  Additional (7): fi-bdw-5557u fi-kbl-7560u fi-bsw-n3050 fi-ivb-3770 fi-cfl-8109u fi-blb-e6850 fi-skl-6600u 
  Missing    (2): fi-byt-clapper fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4332

  CI-20190529: 20190529
  CI_DRM_8161: b2b8d8634bf653904ef3268ca7ccedf51f6405af @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4332: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@blocking-parameterized
+igt@perf@polling-parameterized

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
