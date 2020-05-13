Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 13 May 2020 18:10:21 -0000
Message-ID: <158939342133.25407.3080059153904850292@emeril.freedesktop.org>
References: <20200513170224.848726-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200513170224.848726-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915=3A_Report_scheduler_c?=
 =?utf-8?q?aps_for_timeslicing?=
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

Series: series starting with [i-g-t,1/2] lib/i915: Report scheduler caps for timeslicing
URL   : https://patchwork.freedesktop.org/series/77236/
State : success

== Summary ==

CI Bug Log - changes from IGT_5652 -> IGTPW_4567
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/index.html

Known issues
------------

  Here are the changes found in IGTPW_4567 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] ([i915#1874])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/fi-skl-6600u/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/fi-skl-6600u/igt@i915_selftest@live@execlists.html

  
  [i915#1874]: https://gitlab.freedesktop.org/drm/intel/issues/1874


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5652 -> IGTPW_4567

  CI-20190529: 20190529
  CI_DRM_8475: fdb67b76a2d3b315585813539269dac22e2305f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4567: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/index.html
  IGT_5652: 60e8be7ccc72086a88d2eff3bcd02495fad5fa46 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_fence@syncobj-future
+igt@gem_exec_fence@syncobj-future-cycle
+igt@gem_exec_fence@syncobj-future-deadlock
+igt@gem_exec_fence@syncobj-future-group
+igt@gem_exec_fence@syncobj-future-pair
+igt@gem_exec_fence@syncobj-future-past
+igt@gem_exec_fence@syncobj-future-self
+igt@gem_exec_fence@syncobj-future-self-submit
+igt@gem_exec_fence@syncobj-future-submit
+igt@gem_exec_fence@syncobj-future-submit-cycle
+igt@gem_exec_fence@syncobj-future-submit-deadlock
+igt@gem_exec_fence@syncobj-future-submit-past
+igt@gem_exec_fence@syncobj-incomplete-wait-submit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
