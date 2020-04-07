Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Apr 2020 11:56:14 -0000
Message-ID: <158626057440.26326.14243746827966763177@emeril.freedesktop.org>
References: <20200407110904.13008-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200407110904.13008-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_survive_cdclk_caused_modeset?=
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

Series: tests/kms_plane: survive cdclk caused modeset
URL   : https://patchwork.freedesktop.org/series/75610/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8264 -> IGTPW_4424
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4424/index.html

Known issues
------------

  Here are the changes found in IGTPW_4424 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-edid-read:
    - fi-kbl-7500u:       [PASS][1] -> [FAIL][2] ([i915#976])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/fi-kbl-7500u/igt@kms_chamelium@dp-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4424/fi-kbl-7500u/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][3] ([i915#1158]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4424/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-y:           [INCOMPLETE][5] ([i915#1580]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/fi-icl-y/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4424/fi-icl-y/igt@i915_selftest@live@hangcheck.html

  
  [i915#1158]: https://gitlab.freedesktop.org/drm/intel/issues/1158
  [i915#1580]: https://gitlab.freedesktop.org/drm/intel/issues/1580
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (53 -> 47)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5573 -> IGTPW_4424

  CI-20190529: 20190529
  CI_DRM_8264: e0104585f880a64d4a9b40803cf4fb51ab499f7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4424: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4424/index.html
  IGT_5573: 9c582425d6b4fc1de9fc2ffc8015cc6f0a0d3e98 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4424/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
