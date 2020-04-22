Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Apr 2020 09:06:05 -0000
Message-ID: <158754636599.5178.16440643637234646417@emeril.freedesktop.org>
References: <20200422081011.3523086-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200422081011.3523086-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frpm=3A_Split_the_planes_into_dynamic_subtests_=28rev?=
 =?utf-8?q?2=29?=
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

Series: i915/i915_pm_rpm: Split the planes into dynamic subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/76311/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8347 -> IGTPW_4498
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4498 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4498, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4498/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4498:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@ring_submission:
    - fi-ivb-3770:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8347/fi-ivb-3770/igt@i915_selftest@live@ring_submission.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4498/fi-ivb-3770/igt@i915_selftest@live@ring_submission.html

  
Known issues
------------

  Here are the changes found in IGTPW_4498 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [DMESG-FAIL][3] ([i915#1314]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8347/fi-icl-y/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4498/fi-icl-y/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][5] ([fdo#109271]) -> [FAIL][6] ([i915#62])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8347/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4498/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1314]: https://gitlab.freedesktop.org/drm/intel/issues/1314
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Participating hosts (49 -> 41)
------------------------------

  Missing    (8): fi-cml-u2 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-elk-e7500 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5604 -> IGTPW_4498

  CI-20190529: 20190529
  CI_DRM_8347: 4acd2fd67fbcfe23e07130bab11a47d4b43d0bd4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4498: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4498/index.html
  IGT_5604: 18cc19ece602ba552a8386222b49e7e82820f9aa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4498/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
