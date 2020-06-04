Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Jun 2020 00:27:31 -0000
Message-ID: <159123045179.14553.10634529172825652018@emeril.freedesktop.org>
References: <20200603234758.1961637-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200603234758.1961637-1-chris@chris-wilson.co.uk>
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
URL   : https://patchwork.freedesktop.org/series/77973/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8579 -> IGTPW_4648
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4648:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-flow@bcs0} (NEW):
    - {fi-tgl-u}:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-tgl-u/igt@gem_exec_schedule@fair-flow@bcs0.html

  * {igt@gem_exec_schedule@fair-flow@rcs0} (NEW):
    - fi-glk-dsi:         NOTRUN -> [FAIL][2] +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-glk-dsi/igt@gem_exec_schedule@fair-flow@rcs0.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][3] +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-skl-lmem/igt@gem_exec_schedule@fair-flow@rcs0.html

  * {igt@gem_exec_schedule@fair-flow@vecs0} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [FAIL][4] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-kbl-8809g/igt@gem_exec_schedule@fair-flow@vecs0.html
    - fi-kbl-r:           NOTRUN -> [FAIL][5] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-kbl-r/igt@gem_exec_schedule@fair-flow@vecs0.html

  * {igt@gem_exec_schedule@fair-none@bcs0} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-cml-u2/igt@gem_exec_schedule@fair-none@bcs0.html

  * {igt@gem_exec_schedule@fair-none@rcs0} (NEW):
    - fi-kbl-guc:         NOTRUN -> [FAIL][7] +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-kbl-guc/igt@gem_exec_schedule@fair-none@rcs0.html
    - fi-icl-y:           NOTRUN -> [FAIL][8] +14 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-icl-y/igt@gem_exec_schedule@fair-none@rcs0.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][9] +11 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-cfl-8109u/igt@gem_exec_schedule@fair-none@rcs0.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][10] +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-bsw-nick/igt@gem_exec_schedule@fair-none@rcs0.html

  * {igt@gem_exec_schedule@fair-none@vcs0} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [FAIL][11] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-kbl-x1275/igt@gem_exec_schedule@fair-none@vcs0.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][12] +7 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-kbl-7500u/igt@gem_exec_schedule@fair-none@vcs0.html

  * {igt@gem_exec_schedule@fair-none@vecs0} (NEW):
    - fi-skl-guc:         NOTRUN -> [FAIL][13] +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-skl-guc/igt@gem_exec_schedule@fair-none@vecs0.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][14] +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-cfl-guc/igt@gem_exec_schedule@fair-none@vecs0.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][15] +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-bxt-dsi/igt@gem_exec_schedule@fair-none@vecs0.html
    - {fi-tgl-u}:         NOTRUN -> [FAIL][16] +10 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-tgl-u/igt@gem_exec_schedule@fair-none@vecs0.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][17] +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-skl-6700k2/igt@gem_exec_schedule@fair-none@vecs0.html

  * {igt@gem_exec_schedule@fair-pace@bcs0} (NEW):
    - fi-bdw-5557u:       NOTRUN -> [FAIL][18] +5 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-bdw-5557u/igt@gem_exec_schedule@fair-pace@bcs0.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][19] +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-bsw-kefka/igt@gem_exec_schedule@fair-pace@bcs0.html
    - fi-cml-s:           NOTRUN -> [SKIP][20] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-cml-s/igt@gem_exec_schedule@fair-pace@bcs0.html

  * {igt@gem_exec_schedule@fair-pace@rcs0} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [FAIL][21] +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-cfl-8700k/igt@gem_exec_schedule@fair-pace@rcs0.html

  * {igt@gem_exec_schedule@fair-pace@vcs0} (NEW):
    - fi-icl-u2:          NOTRUN -> [FAIL][22] +14 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-icl-u2/igt@gem_exec_schedule@fair-pace@vcs0.html
    - fi-whl-u:           NOTRUN -> [FAIL][23] +7 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-whl-u/igt@gem_exec_schedule@fair-pace@vcs0.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][24] +6 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-skl-6600u/igt@gem_exec_schedule@fair-pace@vcs0.html
    - {fi-ehl-1}:         NOTRUN -> [FAIL][25] +10 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-ehl-1/igt@gem_exec_schedule@fair-pace@vcs0.html
    - {fi-kbl-7560u}:     NOTRUN -> [FAIL][26] +11 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-kbl-7560u/igt@gem_exec_schedule@fair-pace@vcs0.html
    - fi-cml-s:           NOTRUN -> [FAIL][27] +8 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-cml-s/igt@gem_exec_schedule@fair-pace@vcs0.html
    - fi-icl-guc:         NOTRUN -> [FAIL][28] +14 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-icl-guc/igt@gem_exec_schedule@fair-pace@vcs0.html

  * {igt@gem_exec_schedule@fair-pace@vecs0} (NEW):
    - fi-cml-u2:          NOTRUN -> [FAIL][29] +6 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-cml-u2/igt@gem_exec_schedule@fair-pace@vecs0.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][30] +7 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-bsw-n3050/igt@gem_exec_schedule@fair-pace@vecs0.html
    - fi-apl-guc:         NOTRUN -> [FAIL][31] +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/fi-apl-guc/igt@gem_exec_schedule@fair-pace@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8579 and IGTPW_4648:

### New IGT tests (18) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 5 fail(s) 1 incomplete(s) 5 pass(s) 20 skip(s)
    - Exec time: [0.0, 8.58] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 18 fail(s) 13 pass(s)
    - Exec time: [2.10, 8.60] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 17 fail(s) 13 pass(s)
    - Exec time: [2.09, 8.36] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 6 fail(s) 3 pass(s)
    - Exec time: [2.09, 6.51] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 21 fail(s) 9 pass(s)
    - Exec time: [2.10, 8.58] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 9 fail(s) 2 pass(s) 20 skip(s)
    - Exec time: [0.0, 5.06] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 26 fail(s) 5 pass(s)
    - Exec time: [2.55, 7.45] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 24 fail(s) 7 pass(s)
    - Exec time: [2.05, 7.41] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 7 fail(s) 3 pass(s)
    - Exec time: [2.05, 7.34] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 28 fail(s) 3 pass(s)
    - Exec time: [2.57, 7.48] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 8 fail(s) 3 pass(s) 20 skip(s)
    - Exec time: [0.0, 8.50] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 28 fail(s) 3 pass(s)
    - Exec time: [2.10, 6.31] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 24 fail(s) 7 pass(s)
    - Exec time: [2.05, 6.31] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 7 fail(s) 3 pass(s)
    - Exec time: [2.05, 6.32] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 26 fail(s) 5 pass(s)
    - Exec time: [2.10, 6.32] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (51 -> 45)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5694 -> IGTPW_4648

  CI-20190529: 20190529
  CI_DRM_8579: 289eb12c88c49a4ac8d325dc457d8878c7f5bdc0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4648: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/index.html
  IGT_5694: a9b6c4c74bfddf7d3d2da3be08804fe315945cea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_schedule@fair-flow
+igt@gem_exec_schedule@fair-half
+igt@gem_exec_schedule@fair-next
+igt@gem_exec_schedule@fair-next-share
+igt@gem_exec_schedule@fair-none
+igt@gem_exec_schedule@fair-none-ping
+igt@gem_exec_schedule@fair-none-rrul
+igt@gem_exec_schedule@fair-none-share
+igt@gem_exec_schedule@fair-none-vip
+igt@gem_exec_schedule@fair-pace
+igt@gem_exec_schedule@fair-pace-share
+igt@gem_exec_schedule@fair-solo
+igt@gem_exec_schedule@fair-spare
+igt@gem_exec_schedule@fair-sync
+igt@gem_exec_schedule@fair-sync-vip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
