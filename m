Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 08 May 2020 22:30:03 -0000
Message-ID: <158897700352.22722.1044132074105640794@emeril.freedesktop.org>
References: <20200508220541.1796-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200508220541.1796-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaWd0L2dl?=
 =?utf-8?q?m=5Fshrink=3A_touch_each_page_in_pwrite=5F/pread=5F_=28rev3=29?=
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/gem_shrink: touch each page in pwrite_/pread_ (rev3)
URL   : https://patchwork.freedesktop.org/series/77085/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8455 -> IGTPW_4550
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/index.html

Known issues
------------

  Here are the changes found in IGTPW_4550 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-bwr-2160:        [SKIP][1] ([fdo#109271]) -> [FAIL][2] ([i915#1125] / [i915#489])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/fi-bwr-2160/igt@amdgpu/amd_basic@query-info.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/fi-bwr-2160/igt@amdgpu/amd_basic@query-info.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1125]: https://gitlab.freedesktop.org/drm/intel/issues/1125
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (48 -> 42)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5642 -> IGTPW_4550

  CI-20190529: 20190529
  CI_DRM_8455: 0fa901c0a0e4f6e0ab2821f7b26c417539cecd08 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4550: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/index.html
  IGT_5642: d1ce4abb01c70f7be6e777b6d45442663c4b830e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
