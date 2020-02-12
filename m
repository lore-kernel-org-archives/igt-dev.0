Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 Feb 2020 11:01:44 -0000
Message-ID: <158150530436.24263.16612394300199941722@emeril.freedesktop.org>
References: <20200211212237.1269-1-juston.li@intel.com>
In-Reply-To: <20200211212237.1269-1-juston.li@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv6=2Ci-g-t=2C1/2=5D_include/drm-uapi=3A_Impor?=
 =?utf-8?q?t_headers_from_e62bf83aa1bb?=
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
To: Juston Li <juston.li@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v6,i-g-t,1/2] include/drm-uapi: Import headers from e62bf83aa1bb
URL   : https://patchwork.freedesktop.org/series/73334/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7918 -> IGTPW_4134
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/index.html

Known issues
------------

  Here are the changes found in IGTPW_4134 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][1] -> [TIMEOUT][2] ([fdo#112271] / [i915#1084])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_hangcheck:
    - fi-bsw-kefka:       [PASS][3] -> [INCOMPLETE][4] ([fdo#105876])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/fi-bsw-kefka/igt@i915_selftest@live_hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/fi-bsw-kefka/igt@i915_selftest@live_hangcheck.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-ivb-3770:        [TIMEOUT][5] ([fdo#112271]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/fi-ivb-3770/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/fi-ivb-3770/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [SKIP][7] ([fdo#109271]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [INCOMPLETE][9] ([fdo#106070] / [i915#424]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-bwr-2160:        [FAIL][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/fi-bwr-2160/igt@i915_selftest@live_gt_heartbeat.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/fi-bwr-2160/igt@i915_selftest@live_gt_heartbeat.html

  
  [fdo#105876]: https://bugs.freedesktop.org/show_bug.cgi?id=105876
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424


Participating hosts (49 -> 45)
------------------------------

  Additional (4): fi-skl-guc fi-byt-n2820 fi-bsw-nick fi-bsw-n3050 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5435 -> IGTPW_4134

  CI-20190529: 20190529
  CI_DRM_7918: d9dbc4c91c2c141a9492c88255231ef6aae6fbd9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4134: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/index.html
  IGT_5435: 2b6d4476dde53c363b8808ed9f0dd5547ac78641 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_getfb@getfb2-accept-ccs
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4134/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
