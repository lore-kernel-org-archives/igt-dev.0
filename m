Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 16 Feb 2020 19:31:15 -0000
Message-ID: <158188147512.23350.11455333382851716686@emeril.freedesktop.org>
References: <20200216180006.14439-1-anshuman.gupta@intel.com>
In-Reply-To: <20200216180006.14439-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgREMgc3Rh?=
 =?utf-8?q?tes_IGT_misc_=28rev2=29?=
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

Series: DC states IGT misc (rev2)
URL   : https://patchwork.freedesktop.org/series/73509/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7951 -> IGTPW_4161
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4161/index.html

Known issues
------------

  Here are the changes found in IGTPW_4161 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][1] ([i915#877]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7951/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4161/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [FAIL][3] ([i915#262]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7951/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4161/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [FAIL][5] ([i915#217] / [i915#976]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7951/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4161/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (41 -> 44)
------------------------------

  Additional (7): fi-kbl-soraka fi-byt-j1900 fi-hsw-peppy fi-glk-dsi fi-kbl-7500u fi-cfl-8109u fi-skl-lmem 
  Missing    (4): fi-byt-clapper fi-byt-squawks fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5444 -> IGTPW_4161

  CI-20190529: 20190529
  CI_DRM_7951: 3e7954595748cb1671c02a97069f137a3f6b6d72 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4161: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4161/index.html
  IGT_5444: c46bae259d427f53fcfcd5f05de0181a9e82d6fe @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4161/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
