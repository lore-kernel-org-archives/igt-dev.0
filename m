Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Apr 2020 11:24:31 -0000
Message-ID: <158772747109.10800.18010136608064934648@emeril.freedesktop.org>
References: <20200424101941.4109878-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200424101941.4109878-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcGVyZjog?=
 =?utf-8?q?Verify_rc6_works_first?=
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

Series: perf: Verify rc6 works first
URL   : https://patchwork.freedesktop.org/series/76424/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8358 -> IGTPW_4506
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/index.html

Known issues
------------

  Here are the changes found in IGTPW_4506 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-hsw-4770:        [SKIP][1] ([fdo#109271]) -> [PASS][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@uncore:
    - fi-bwr-2160:        [INCOMPLETE][3] ([i915#489]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/fi-bwr-2160/igt@i915_selftest@live@uncore.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/fi-bwr-2160/igt@i915_selftest@live@uncore.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5609 -> IGTPW_4506

  CI-20190529: 20190529
  CI_DRM_8358: 03d069b768bdd8a6382b296152a676422a4859a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4506: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/index.html
  IGT_5609: c100fe19f7b144538549415e8503093053883ec6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
