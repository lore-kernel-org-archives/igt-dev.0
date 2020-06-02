Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 23:30:00 -0000
Message-ID: <159114060059.21430.2176314494459158583@emeril.freedesktop.org>
References: <20200602100551.1413463-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200602100551.1413463-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Fschedule=3A_?=
 =?utf-8?q?Try_to_spot_unfairness_=28rev2=29?=
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

Series: series starting with [i-g-t,1/2] i915/gem_exec_schedule: Try to spot unfairness (rev2)
URL   : https://patchwork.freedesktop.org/series/77911/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8574 -> IGTPW_4641
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4641:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-flow@vcs0} (NEW):
    - {fi-tgl-u}:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/fi-tgl-u/igt@gem_exec_schedule@fair-flow@vcs0.html

  * {igt@gem_exec_schedule@fair-none@bcs0} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/fi-cml-u2/igt@gem_exec_schedule@fair-none@bcs0.html

  * {igt@gem_exec_schedule@fair-pace@bcs0} (NEW):
    - fi-tgl-y:           NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/fi-tgl-y/igt@gem_exec_schedule@fair-pace@bcs0.html
    - {fi-tgl-dsi}:       NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/fi-tgl-dsi/igt@gem_exec_schedule@fair-pace@bcs0.html
    - fi-cml-s:           NOTRUN -> [SKIP][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/fi-cml-s/igt@gem_exec_schedule@fair-pace@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8574 and IGTPW_4641:

### New IGT tests (18) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 9 pass(s) 19 skip(s)
    - Exec time: [0.0, 9.54] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 28 pass(s)
    - Exec time: [8.46, 10.45] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 1 incomplete(s) 27 pass(s)
    - Exec time: [0.0, 12.86] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 6 pass(s)
    - Exec time: [8.43, 8.95] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 27 pass(s)
    - Exec time: [8.43, 10.60] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 11 pass(s) 19 skip(s)
    - Exec time: [0.0, 12.58] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 30 pass(s)
    - Exec time: [9.21, 12.30] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 30 pass(s)
    - Exec time: [8.57, 14.95] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [8.47, 11.73] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 30 pass(s)
    - Exec time: [9.72, 15.14] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 incomplete(s) 9 pass(s) 19 skip(s)
    - Exec time: [0.0, 9.42] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 30 pass(s)
    - Exec time: [8.39, 10.32] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 28 pass(s)
    - Exec time: [8.38, 10.54] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 7 pass(s)
    - Exec time: [8.42, 8.60] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 28 pass(s)
    - Exec time: [8.39, 10.35] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (50 -> 45)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5691 -> IGTPW_4641

  CI-20190529: 20190529
  CI_DRM_8574: bdf0c111ec1ac9a62dc082b887ea010605fdf1ea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4641: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/index.html
  IGT_5691: 5648db25034883e1437d28d6a8b89acbb5cb74b2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_schedule@fair-flow
+igt@gem_exec_schedule@fair-half
+igt@gem_exec_schedule@fair-none
+igt@gem_exec_schedule@fair-pace
+igt@gem_exec_schedule@fair-solo
+igt@gem_exec_schedule@fair-spare
+igt@gem_exec_schedule@fair-sync

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
