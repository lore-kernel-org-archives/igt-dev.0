Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Apr 2020 11:10:06 -0000
Message-ID: <158651700691.10042.7064791757014764142@emeril.freedesktop.org>
References: <20200410102046.6428-1-terrence.xu@intel.com>
In-Reply-To: <20200410102046.6428-1-terrence.xu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Correct_the_logic_of_finding_i915_pmu_event_path?=
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
To: Terrence Xu <terrence.xu@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/perf: Correct the logic of finding i915 pmu event path
URL   : https://patchwork.freedesktop.org/series/75794/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8289 -> IGTPW_4444
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4444 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4444, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4444/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4444:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-skl-lmem:        [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8289/fi-skl-lmem/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4444/fi-skl-lmem/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_4444 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-skl-lmem:        [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8289/fi-skl-lmem/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4444/fi-skl-lmem/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [FAIL][5] ([i915#62] / [i915#95]) -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8289/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4444/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (52 -> 46)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5586 -> IGTPW_4444

  CI-20190529: 20190529
  CI_DRM_8289: 81e3d7ff72672b6aeadbf9c0b9cc514cec9c889d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4444: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4444/index.html
  IGT_5586: 29fad328e6a1b105c8d688cafe19b1b5c19ad0c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4444/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
