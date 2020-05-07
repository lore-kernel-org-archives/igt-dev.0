Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 07 May 2020 21:10:53 -0000
Message-ID: <158888585320.2188.2391990011231266813@emeril.freedesktop.org>
References: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVXNlIGRl?=
 =?utf-8?q?vice_dependant_module_parameters_=28rev6=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Use device dependant module parameters (rev6)
URL   : https://patchwork.freedesktop.org/series/76163/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8447 -> IGTPW_4543
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4543 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4543, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4543/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4543:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-cfl-guc:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8447/fi-cfl-guc/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4543/fi-cfl-guc/igt@i915_selftest@live@gt_lrc.html

  
Known issues
------------

  Here are the changes found in IGTPW_4543 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@mman:
    - fi-bwr-2160:        [PASS][3] -> [INCOMPLETE][4] ([i915#489])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8447/fi-bwr-2160/igt@i915_selftest@live@mman.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4543/fi-bwr-2160/igt@i915_selftest@live@mman.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - {fi-tgl-dsi}:       [INCOMPLETE][5] ([i915#1803]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8447/fi-tgl-dsi/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4543/fi-tgl-dsi/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1803]: https://gitlab.freedesktop.org/drm/intel/issues/1803
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (49 -> 43)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5640 -> IGTPW_4543

  CI-20190529: 20190529
  CI_DRM_8447: 0d8b690dc3bc082d0deb2424e43ececcabf36caa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4543: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4543/index.html
  IGT_5640: 5efb4a1c9cc944eff129cae7794951ae617bca17 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4543/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
