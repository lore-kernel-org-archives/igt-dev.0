Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Apr 2020 12:01:51 -0000
Message-ID: <158747051119.17661.7196865198564021677@emeril.freedesktop.org>
References: <20200421111537.3403622-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200421111537.3403622-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci/blacklists=3A_Lift_premerge_ban_for_gem=5Fexec=5Falignment?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: intel-ci/blacklists: Lift premerge ban for gem_exec_alignment
URL   : https://patchwork.freedesktop.org/series/76258/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8342 -> IGTPW_4494
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/index.html

Known issues
------------

  Here are the changes found in IGTPW_4494 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_pm:
    - fi-apl-guc:         [PASS][1] -> [DMESG-FAIL][2] ([i915#1751])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/fi-apl-guc/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/fi-apl-guc/igt@i915_selftest@live@gt_pm.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - fi-glk-dsi:         [DMESG-FAIL][3] ([i915#1751]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/fi-glk-dsi/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/fi-glk-dsi/igt@i915_selftest@live@gt_pm.html

  
#### Warnings ####

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-y:           [DMESG-FAIL][5] ([i915#1744]) -> [DMESG-FAIL][6] ([i915#1759])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/fi-tgl-y/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/fi-tgl-y/igt@i915_selftest@live@gt_pm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1744]: https://gitlab.freedesktop.org/drm/intel/issues/1744
  [i915#1751]: https://gitlab.freedesktop.org/drm/intel/issues/1751
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759


Participating hosts (48 -> 43)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (6): fi-cml-u2 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5602 -> IGTPW_4494

  CI-20190529: 20190529
  CI_DRM_8342: 17407a9f61a0ee402254522e391a626acc4375ec @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4494: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/index.html
  IGT_5602: a8fcccd15dcc2dd409edd23785a2d6f6e85fb682 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
