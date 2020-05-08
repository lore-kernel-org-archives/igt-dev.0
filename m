Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 08 May 2020 07:09:23 -0000
Message-ID: <158892176384.22723.11971515815136643832@emeril.freedesktop.org>
References: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVXNlIGRl?=
 =?utf-8?q?vice_dependant_module_parameters_=28rev9=29?=
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

Series: Use device dependant module parameters (rev9)
URL   : https://patchwork.freedesktop.org/series/76163/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8449 -> IGTPW_4546
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/index.html

Known issues
------------

  Here are the changes found in IGTPW_4546 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-skl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#1847])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/fi-skl-guc/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/fi-skl-guc/igt@i915_selftest@live@gt_lrc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-skl-6700k2:      [INCOMPLETE][3] ([i915#1847]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/fi-skl-6700k2/igt@i915_selftest@live@gt_lrc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/fi-skl-6700k2/igt@i915_selftest@live@gt_lrc.html

  
  [i915#1847]: https://gitlab.freedesktop.org/drm/intel/issues/1847


Participating hosts (50 -> 42)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5640 -> IGTPW_4546

  CI-20190529: 20190529
  CI_DRM_8449: 4af0ec12ca5e0180d2497d3db24e66bd0f28e24f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4546: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/index.html
  IGT_5640: 5efb4a1c9cc944eff129cae7794951ae617bca17 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
