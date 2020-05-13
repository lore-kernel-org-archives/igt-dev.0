Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 13 May 2020 14:37:58 -0000
Message-ID: <158938067875.25404.15849330012954045288@emeril.freedesktop.org>
References: <20200513131001.10566-1-petri.latvala@intel.com>
In-Reply-To: <20200513131001.10566-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fgt=3A_Add_newline_to_IGT=5FHANG=3D0_skips_=28rev2=29?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_gt: Add newline to IGT_HANG=0 skips (rev2)
URL   : https://patchwork.freedesktop.org/series/77227/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8474 -> IGTPW_4566
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4566/index.html

Known issues
------------

  Here are the changes found in IGTPW_4566 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@active:
    - fi-icl-y:           [PASS][1] -> [DMESG-FAIL][2] ([i915#765])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8474/fi-icl-y/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4566/fi-icl-y/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-guc:         [PASS][3] -> [INCOMPLETE][4] ([CI#80] / [i915#1874])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8474/fi-kbl-guc/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4566/fi-kbl-guc/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [DMESG-FAIL][5] ([i915#656]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8474/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4566/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [i915#1803]: https://gitlab.freedesktop.org/drm/intel/issues/1803
  [i915#1874]: https://gitlab.freedesktop.org/drm/intel/issues/1874
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5651 -> IGTPW_4566

  CI-20190529: 20190529
  CI_DRM_8474: 2244df7018f329285893f900c738e7074e6ae1d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4566: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4566/index.html
  IGT_5651: e54e2642f1967ca3c488db32264607df670d1dfb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4566/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
