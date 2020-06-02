Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 11:26:02 -0000
Message-ID: <159109716265.21428.6965571876148169930@emeril.freedesktop.org>
References: <20200602100551.1413463-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200602100551.1413463-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Fschedule=3A_?=
 =?utf-8?q?Try_to_spot_unfairness?=
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

Series: series starting with [i-g-t,1/2] i915/gem_exec_schedule: Try to spot unfairness
URL   : https://patchwork.freedesktop.org/series/77911/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8571 -> IGTPW_4638
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4638:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-flow@bcs0} (NEW):
    - fi-tgl-y:           NOTRUN -> [INCOMPLETE][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-tgl-y/igt@gem_exec_schedule@fair-flow@bcs0.html
    - {fi-tgl-dsi}:       NOTRUN -> [INCOMPLETE][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-tgl-dsi/igt@gem_exec_schedule@fair-flow@bcs0.html

  * {igt@gem_exec_schedule@fair-flow@vcs0} (NEW):
    - fi-cml-u2:          NOTRUN -> [INCOMPLETE][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-cml-u2/igt@gem_exec_schedule@fair-flow@vcs0.html

  * {igt@gem_exec_schedule@fair-none@bcs0} (NEW):
    - fi-icl-y:           NOTRUN -> [INCOMPLETE][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-icl-y/igt@gem_exec_schedule@fair-none@bcs0.html
    - fi-cml-u2:          NOTRUN -> [SKIP][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-cml-u2/igt@gem_exec_schedule@fair-none@bcs0.html
    - {fi-tgl-u}:         NOTRUN -> [INCOMPLETE][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-tgl-u/igt@gem_exec_schedule@fair-none@bcs0.html
    - {fi-ehl-1}:         NOTRUN -> [INCOMPLETE][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-ehl-1/igt@gem_exec_schedule@fair-none@bcs0.html
    - fi-icl-guc:         NOTRUN -> [INCOMPLETE][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-icl-guc/igt@gem_exec_schedule@fair-none@bcs0.html

  * {igt@gem_exec_schedule@fair-pace@bcs0} (NEW):
    - fi-icl-u2:          NOTRUN -> [INCOMPLETE][9] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-icl-u2/igt@gem_exec_schedule@fair-pace@bcs0.html
    - fi-cml-s:           NOTRUN -> [SKIP][10] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-cml-s/igt@gem_exec_schedule@fair-pace@bcs0.html

  * {igt@gem_exec_schedule@fair-pace@vcs0} (NEW):
    - fi-cml-s:           NOTRUN -> [INCOMPLETE][11] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/fi-cml-s/igt@gem_exec_schedule@fair-pace@vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8571 and IGTPW_4638:

### New IGT tests (18) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 7 incomplete(s) 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 9.57] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 29 pass(s)
    - Exec time: [8.45, 10.45] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 2 incomplete(s) 20 pass(s)
    - Exec time: [0.0, 12.73] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [8.58, 8.84] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 20 pass(s)
    - Exec time: [8.52, 10.54] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 7 incomplete(s) 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 10.34] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 29 pass(s)
    - Exec time: [9.18, 12.44] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 2 incomplete(s) 20 pass(s)
    - Exec time: [0.0, 15.48] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [8.65, 9.90] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 20 pass(s)
    - Exec time: [9.87, 15.51] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 7 incomplete(s) 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 9.46] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 29 pass(s)
    - Exec time: [8.39, 10.26] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 2 incomplete(s) 20 pass(s)
    - Exec time: [0.0, 10.87] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [8.45, 8.77] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 20 pass(s)
    - Exec time: [8.39, 10.51] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (50 -> 44)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5690 -> IGTPW_4638

  CI-20190529: 20190529
  CI_DRM_8571: 0536dff30eff69abcf6355bdd9b9fdf45a560099 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4638: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_schedule@fair-flow
+igt@gem_exec_schedule@fair-half
+igt@gem_exec_schedule@fair-none
+igt@gem_exec_schedule@fair-pace
+igt@gem_exec_schedule@fair-solo
+igt@gem_exec_schedule@fair-spare
+igt@gem_exec_schedule@fair-sync

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
