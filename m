Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 15 May 2020 11:15:05 -0000
Message-ID: <158954130502.26211.3581485495363932533@emeril.freedesktop.org>
References: <20200515074150.475142-1-harish.chegondi@intel.com>
In-Reply-To: <20200515074150.475142-1-harish.chegondi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?/resultgen=3A_Fix_dmesg_whitelist_entry=27s_regular_expression?=
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
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner/resultgen: Fix dmesg whitelist entry's regular expression
URL   : https://patchwork.freedesktop.org/series/77299/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8486 -> IGTPW_4573
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/index.html

Known issues
------------

  Here are the changes found in IGTPW_4573 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@active:
    - fi-apl-guc:         [PASS][1] -> [DMESG-FAIL][2] ([i915#666])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/fi-apl-guc/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/fi-apl-guc/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@execlists:
    - fi-whl-u:           [PASS][3] -> [INCOMPLETE][4] ([i915#656])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/fi-whl-u/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/fi-whl-u/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bwr-2160:        [PASS][5] -> [INCOMPLETE][6] ([i915#489])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/fi-bwr-2160/igt@i915_selftest@live@late_gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/fi-bwr-2160/igt@i915_selftest@live@late_gt_pm.html

  
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666


Participating hosts (51 -> 44)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-hsw-4770 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5654 -> IGTPW_4573

  CI-20190529: 20190529
  CI_DRM_8486: f43bb5d8b1ed34a349ce5721ce5c064935a6cf6f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4573: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/index.html
  IGT_5654: 5637a466a0b09535517751608f5525a8b468a76b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4573/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
