Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 10:23:23 -0000
Message-ID: <158590940386.13351.17852309979848006624@emeril.freedesktop.org>
References: <20200403091704.32232-1-karthik.b.s@intel.com>
In-Reply-To: <20200403091704.32232-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=3A_Add_test_to_validate_asynchronous_flips?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_async: Add test to validate asynchronous flips
URL   : https://patchwork.freedesktop.org/series/75453/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8243 -> IGTPW_4400
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/index.html

Known issues
------------

  Here are the changes found in IGTPW_4400 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_tiled_fence_blits@basic:
    - fi-blb-e6850:       [PASS][1] -> [DMESG-WARN][2] ([i915#1612])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][3] -> [FAIL][4] ([i915#262])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-icl-dsi:         [INCOMPLETE][5] ([i915#189]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [INCOMPLETE][7] ([i915#656]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
  [i915#1612]: https://gitlab.freedesktop.org/drm/intel/issues/1612
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (41 -> 43)
------------------------------

  Additional (8): fi-skl-6770hq fi-bwr-2160 fi-snb-2520m fi-ivb-3770 fi-cfl-8109u fi-skl-lmem fi-byt-n2820 fi-skl-6600u 
  Missing    (6): fi-tgl-dsi fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5560 -> IGTPW_4400

  CI-20190529: 20190529
  CI_DRM_8243: 45ccb1b8606b6ba1a5d4f8a8b4dda27bd8dbb04c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4400: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/index.html
  IGT_5560: 213062c7dcf0cbc8069cbb5f91acbc494def33fd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_async@async-flip-without-page-flip-events
+igt@kms_async@async-flip-with-page-flip-events

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
