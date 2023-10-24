Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0502283175388713510=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Oct 2023 01:45:42 -0000
Message-ID: <169811194226.18362.13449372950654094651@emeril.freedesktop.org>
References: <20231020133413.135395-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20231020133413.135395-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZml4IGln?=
 =?utf-8?q?t=5Frunner_job_list_handler?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0502283175388713510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix igt_runner job list handler
URL   : https://patchwork.freedesktop.org/series/125402/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7551 -> IGTPW_10042
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10042 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10042, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/index.html

Participating hosts (36 -> 35)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (2): fi-hsw-4770 bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10042:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_close_race@gem-close-race (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-tgl-1115g4/igt@gem_close_race@gem-close-race.html
    - fi-skl-guc:         NOTRUN -> [TIMEOUT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-guc/igt@gem_close_race@gem-close-race.html
    - fi-glk-j4005:       NOTRUN -> [TIMEOUT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-glk-j4005/igt@gem_close_race@gem-close-race.html
    - bat-adlp-9:         NOTRUN -> [TIMEOUT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-9/igt@gem_close_race@gem-close-race.html
    - bat-adls-5:         NOTRUN -> [TIMEOUT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adls-5/igt@gem_close_race@gem-close-race.html
    - fi-kbl-x1275:       NOTRUN -> [TIMEOUT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-x1275/igt@gem_close_race@gem-close-race.html
    - fi-blb-e6850:       NOTRUN -> [TIMEOUT][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-blb-e6850/igt@gem_close_race@gem-close-race.html
    - bat-adlp-6:         NOTRUN -> [TIMEOUT][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-6/igt@gem_close_race@gem-close-race.html
    - bat-mtlp-6:         NOTRUN -> [TIMEOUT][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-mtlp-6/igt@gem_close_race@gem-close-race.html
    - {bat-dg2-14}:       NOTRUN -> [TIMEOUT][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-14/igt@gem_close_race@gem-close-race.html
    - fi-bsw-nick:        NOTRUN -> [TIMEOUT][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-bsw-nick/igt@gem_close_race@gem-close-race.html
    - bat-jsl-3:          NOTRUN -> [TIMEOUT][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-jsl-3/igt@gem_close_race@gem-close-race.html
    - bat-jsl-1:          NOTRUN -> [TIMEOUT][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-jsl-1/igt@gem_close_race@gem-close-race.html
    - bat-rplp-1:         NOTRUN -> [TIMEOUT][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rplp-1/igt@gem_close_race@gem-close-race.html
    - fi-cfl-guc:         NOTRUN -> [TIMEOUT][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-guc/igt@gem_close_race@gem-close-race.html
    - fi-cfl-8109u:       NOTRUN -> [TIMEOUT][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-8109u/igt@gem_close_race@gem-close-race.html
    - fi-apl-guc:         NOTRUN -> [TIMEOUT][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-apl-guc/igt@gem_close_race@gem-close-race.html
    - fi-cfl-8700k:       NOTRUN -> [TIMEOUT][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-8700k/igt@gem_close_race@gem-close-race.html
    - fi-ivb-3770:        NOTRUN -> [TIMEOUT][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-ivb-3770/igt@gem_close_race@gem-close-race.html
    - fi-kbl-guc:         NOTRUN -> [TIMEOUT][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-guc/igt@gem_close_race@gem-close-race.html
    - bat-rpls-1:         NOTRUN -> [TIMEOUT][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rpls-1/igt@gem_close_race@gem-close-race.html
    - bat-adln-1:         NOTRUN -> [TIMEOUT][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adln-1/igt@gem_close_race@gem-close-race.html
    - fi-ilk-650:         NOTRUN -> [TIMEOUT][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-ilk-650/igt@gem_close_race@gem-close-race.html
    - fi-skl-6600u:       NOTRUN -> [TIMEOUT][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-6600u/igt@gem_close_race@gem-close-race.html
    - fi-kbl-soraka:      NOTRUN -> [TIMEOUT][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-soraka/igt@gem_close_race@gem-close-race.html
    - bat-kbl-2:          NOTRUN -> [TIMEOUT][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-kbl-2/igt@gem_close_race@gem-close-race.html
    - bat-adlm-1:         NOTRUN -> [TIMEOUT][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlm-1/igt@gem_close_race@gem-close-race.html
    - fi-bsw-n3050:       NOTRUN -> [TIMEOUT][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-bsw-n3050/igt@gem_close_race@gem-close-race.html
    - fi-pnv-d510:        NOTRUN -> [TIMEOUT][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-pnv-d510/igt@gem_close_race@gem-close-race.html
    - fi-rkl-11600:       NOTRUN -> [TIMEOUT][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-rkl-11600/igt@gem_close_race@gem-close-race.html
    - bat-dg2-9:          NOTRUN -> [TIMEOUT][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-9/igt@gem_close_race@gem-close-race.html

  * {igt@gem_ctx_create@maximum-mem} (NEW):
    - fi-elk-e7500:       NOTRUN -> [TIMEOUT][32] +1 other test timeout
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-elk-e7500/igt@gem_ctx_create@maximum-mem.html

  * {igt@gem_mmap@swap-bo} (NEW):
    - fi-blb-e6850:       NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-blb-e6850/igt@gem_mmap@swap-bo.html

  
New tests
---------

  New tests have been introduced between IGT_7551 and IGTPW_10042:

### New IGT tests (392) ###

  * igt@core_hotunplug@hotrebind:
    - Statuses :
    - Exec time: [None] s

  * igt@core_hotunplug@hotrebind-lateclose:
    - Statuses :
    - Exec time: [None] s

  * igt@core_hotunplug@hotreplug:
    - Statuses :
    - Exec time: [None] s

  * igt@core_hotunplug@hotreplug-lateclose:
    - Statuses :
    - Exec time: [None] s

  * igt@core_hotunplug@hotunbind-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@core_hotunplug@hotunplug-rescan:
    - Statuses :
    - Exec time: [None] s

  * igt@core_hotunplug@unplug-rescan:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_busy@hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_busy@hang-extended:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_busy@hang-extended@bcs0:
    - Statuses : 28 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@ccs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@ccs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@ccs2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@ccs3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@rcs0:
    - Statuses : 32 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@vcs0:
    - Statuses : 30 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@vcs1:
    - Statuses : 10 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@vecs0:
    - Statuses : 27 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang-extended@vecs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@bcs0:
    - Statuses : 16 pass(s) 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@ccs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@ccs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@ccs2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@ccs3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@rcs0:
    - Statuses : 31 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@vcs0:
    - Statuses : 29 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@vcs1:
    - Statuses : 10 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@vecs0:
    - Statuses : 27 pass(s)
    - Exec time: [0.0] s

  * igt@gem_busy@hang@vecs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_close_race@contexts:
    - Statuses : 32 pass(s)
    - Exec time: [0.0] s

  * igt@gem_close_race@gem-close-race:
    - Statuses : 32 timeout(s)
    - Exec time: [0.0] s

  * igt@gem_close_race@process-exit:
    - Statuses : 32 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@active:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@active-all:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@active@bcs0:
    - Statuses : 22 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@active@rcs0:
    - Statuses : 24 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@active@vcs0:
    - Statuses : 24 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@active@vcs1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@active@vecs0:
    - Statuses : 21 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@ext-param:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@files:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@forked-active:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@forked-active-all:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@forked-active@bcs0:
    - Statuses : 12 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@forked-active@rcs0:
    - Statuses : 15 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@forked-active@vcs0:
    - Statuses : 12 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@forked-active@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@forked-active@vecs0:
    - Statuses : 9 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@forked-files:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@hog:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@hog@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@hog@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@iris-pipeline:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@maximum-mem:
    - Statuses : 2 skip(s) 1 timeout(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@maximum-swap:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_exec@eviction:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_exec@reset-pin-leak:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@await-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@await-hang@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@busy-hang-all:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@busy-hang@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@nb-await-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@nb-await-hang@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@wait-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@wait-hang-all:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@wait-hang@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_suspend@basic-s4:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@cached:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@cached-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@cached-s4:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@fixed:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@fixed-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@fixed-s4:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@hang-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@hang-s4:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@power-s0:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@power-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@uncached:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@uncached-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_suspend@uncached-s4:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap@huge-bo:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap@swap-bo:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@clflush:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@cpuset-huge-copy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@cpuset-huge-copy-odd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@cpuset-huge-copy-xy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@cpuset-swap-copy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@cpuset-swap-copy-odd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@cpuset-swap-copy-xy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-basic-small-copy:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@forked-basic-small-copy-odd:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@forked-basic-small-copy-xy:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@forked-big-copy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-big-copy-odd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-big-copy-xy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-huge-copy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-huge-copy-odd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-huge-copy-xy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-medium-copy:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@forked-medium-copy-odd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-medium-copy-xy:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@forked-swap-copy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-swap-copy-odd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@forked-swap-copy-xy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@huge-bo:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@huge-bo-tiledx:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@huge-bo-tiledy:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@huge-copy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@huge-copy-odd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@huge-copy-xy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@swap-copy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@swap-copy-odd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_gtt@swap-copy-xy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_linear_blits@aperture-shrink:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_linear_blits@aperture-thrash:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_linear_blits@swap-thrash:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_tiled_blits@aperture-shrink:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_tiled_blits@aperture-thrash:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_tiled_blits@swap-thrash:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@engines-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@engines-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@engines-fd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@engines-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@engines-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@engines-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@engines-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@engines-s4:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-fd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-s4:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@evict-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@noreloc-s4:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@active:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@active-each:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@active-wakeup:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@active-wakeup-each:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@default:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@double-wakeup:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@double-wakeup-each:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@forked-all:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@forked-each:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@forked-store:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@forked-store-all:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@forked-store-each:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@forked-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@forked-switch-each:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@idle:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-active:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-active-wakeup:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-default:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-double-wakeup:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-forked-store:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-forked-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-many:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-store:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@legacy-wakeup:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@many:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@preempt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@preempt-all:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@store:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@store-all:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@switch:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@switch-each:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@wait-all:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@wakeup:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@wakeup-each:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_wait@hang-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_wait@hang-busy-write:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_wait@hang-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_wait@hang-wait-write:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@system-hibernate:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@system-hibernate-devices:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_suspend@debugfs-reader-hibernate:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_suspend@fence-restore-tiled2untiled-hibernate:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_suspend@fence-restore-untiled-hibernate:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_suspend@forcewake-hibernate:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_suspend@shrink:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_suspend@sysfs-reader-hibernate:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_10042 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - fi-skl-guc:         NOTRUN -> [FAIL][34] ([i915#4435])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-guc/igt@fbdev@pan.html

  * igt@fbdev@unaligned-read:
    - fi-kbl-guc:         NOTRUN -> [SKIP][35] ([fdo#109271]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-guc/igt@fbdev@unaligned-read.html
    - bat-rpls-1:         NOTRUN -> [SKIP][36] ([i915#2582]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rpls-1/igt@fbdev@unaligned-read.html
    - bat-kbl-2:          NOTRUN -> [SKIP][37] ([fdo#109271]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-kbl-2/igt@fbdev@unaligned-read.html
    - bat-adlm-1:         NOTRUN -> [SKIP][38] ([i915#2582]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlm-1/igt@fbdev@unaligned-read.html
    - bat-dg2-9:          NOTRUN -> [SKIP][39] ([i915#2582]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-9/igt@fbdev@unaligned-read.html
    - bat-adlp-9:         NOTRUN -> [SKIP][40] ([i915#2582]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-9/igt@fbdev@unaligned-read.html
    - bat-adls-5:         NOTRUN -> [SKIP][41] ([i915#2582]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adls-5/igt@fbdev@unaligned-read.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][42] ([i915#2582]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-mtlp-6/igt@fbdev@unaligned-read.html

  * igt@gem_basic@multigpu-create-close:
    - bat-adlm-1:         NOTRUN -> [SKIP][43] ([i915#7697]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlm-1/igt@gem_basic@multigpu-create-close.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][44] ([fdo#109271]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-bsw-n3050/igt@gem_basic@multigpu-create-close.html

  * {igt@gem_busy@hang@bcs0} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][45] ([fdo#109271]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-guc/igt@gem_busy@hang@bcs0.html

  * {igt@gem_busy@hang@rcs0} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][46] ([fdo#109271]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-ivb-3770/igt@gem_busy@hang@rcs0.html

  * igt@gem_busy@semaphore:
    - bat-rpls-1:         NOTRUN -> [SKIP][47] ([i915#3936])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rpls-1/igt@gem_busy@semaphore.html
    - bat-adln-1:         NOTRUN -> [SKIP][48] ([i915#3936])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adln-1/igt@gem_busy@semaphore.html
    - fi-ilk-650:         NOTRUN -> [SKIP][49] ([fdo#109271]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-ilk-650/igt@gem_busy@semaphore.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][50] ([fdo#109271]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-elk-e7500/igt@gem_busy@semaphore.html
    - bat-adlm-1:         NOTRUN -> [SKIP][51] ([i915#3936])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlm-1/igt@gem_busy@semaphore.html
    - bat-dg2-9:          NOTRUN -> [SKIP][52] ([i915#3936])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-9/igt@gem_busy@semaphore.html
    - bat-adlp-9:         NOTRUN -> [SKIP][53] ([i915#3936])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-9/igt@gem_busy@semaphore.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][54] ([i915#3936])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-mtlp-6/igt@gem_busy@semaphore.html
    - bat-adlp-6:         NOTRUN -> [SKIP][55] ([i915#3936])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-6/igt@gem_busy@semaphore.html
    - bat-rplp-1:         NOTRUN -> [SKIP][56] ([i915#3936])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rplp-1/igt@gem_busy@semaphore.html

  * igt@gem_close_race@multigpu-basic-process:
    - fi-rkl-11600:       NOTRUN -> [SKIP][57] ([i915#7697]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-rkl-11600/igt@gem_close_race@multigpu-basic-process.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][58] ([fdo#109271]) +21 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-pnv-d510/igt@gem_close_race@multigpu-basic-process.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][59] ([i915#7697]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-tgl-1115g4/igt@gem_close_race@multigpu-basic-process.html
    - bat-dg2-9:          NOTRUN -> [SKIP][60] ([i915#7697]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-9/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - bat-adls-5:         NOTRUN -> [SKIP][61] ([i915#7697]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adls-5/igt@gem_close_race@multigpu-basic-threads.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][62] ([fdo#109271]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-glk-j4005/igt@gem_close_race@multigpu-basic-threads.html
    - bat-adlp-9:         NOTRUN -> [SKIP][63] ([i915#7697]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-9/igt@gem_close_race@multigpu-basic-threads.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][64] ([fdo#109271]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-x1275/igt@gem_close_race@multigpu-basic-threads.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][65] ([i915#7697]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-mtlp-6/igt@gem_close_race@multigpu-basic-threads.html
    - bat-adlp-6:         NOTRUN -> [SKIP][66] ([i915#7697]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-6/igt@gem_close_race@multigpu-basic-threads.html
    - bat-jsl-3:          NOTRUN -> [SKIP][67] ([i915#7697]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-jsl-3/igt@gem_close_race@multigpu-basic-threads.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][68] ([fdo#109271]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-bsw-nick/igt@gem_close_race@multigpu-basic-threads.html
    - bat-jsl-1:          NOTRUN -> [SKIP][69] ([i915#7697]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-jsl-1/igt@gem_close_race@multigpu-basic-threads.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][70] ([fdo#109271]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-8109u/igt@gem_close_race@multigpu-basic-threads.html
    - bat-rplp-1:         NOTRUN -> [SKIP][71] ([i915#7697]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rplp-1/igt@gem_close_race@multigpu-basic-threads.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][72] ([fdo#109271]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-guc/igt@gem_close_race@multigpu-basic-threads.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][73] ([fdo#109271]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-8700k/igt@gem_close_race@multigpu-basic-threads.html
    - fi-apl-guc:         NOTRUN -> [SKIP][74] ([fdo#109271]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-apl-guc/igt@gem_close_race@multigpu-basic-threads.html
    - bat-rpls-1:         NOTRUN -> [SKIP][75] ([i915#7697]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rpls-1/igt@gem_close_race@multigpu-basic-threads.html
    - bat-adln-1:         NOTRUN -> [SKIP][76] ([i915#7697]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adln-1/igt@gem_close_race@multigpu-basic-threads.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][77] ([fdo#109271]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-6600u/igt@gem_close_race@multigpu-basic-threads.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][78] ([fdo#109271]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-soraka/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:
    - fi-blb-e6850:       NOTRUN -> [SKIP][79] ([fdo#109271]) +34 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-blb-e6850/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html

  * igt@gem_mmap_gtt@hang-busy:
    - fi-blb-e6850:       NOTRUN -> [FAIL][80] ([i915#3790]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-blb-e6850/igt@gem_mmap_gtt@hang-busy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3790]: https://gitlab.freedesktop.org/drm/intel/issues/3790
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#4435]: https://gitlab.freedesktop.org/drm/intel/issues/4435
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7551 -> IGTPW_10042

  CI-20190529: 20190529
  CI_DRM_13777: 1b4fd688d213556268c50f853746c94c9a0cfee7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10042: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/index.html
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/index.html

--===============0502283175388713510==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>fix igt_runner job list handler</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125402/">https://patchwork.freedesktop.org/series/125402/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7551 -&gt; IGTPW_10042</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10042 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10042, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (2): fi-hsw-4770 bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10042:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_close_race@gem-close-race (NEW):</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-tgl-1115g4/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-guc/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-glk-j4005/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-9/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adls-5/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-x1275/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-blb-e6850/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-6/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-mtlp-6/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-14/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-bsw-nick/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-jsl-3/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-jsl-1/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rplp-1/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-guc/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-8109u/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-apl-guc/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-8700k/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-ivb-3770/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-guc/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rpls-1/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adln-1/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-ilk-650/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-6600u/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-soraka/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-kbl-2/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlm-1/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-bsw-n3050/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-pnv-d510/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-rkl-11600/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-9/igt@gem_close_race@gem-close-race.html">TIMEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_create@maximum-mem} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-elk-e7500/igt@gem_ctx_create@maximum-mem.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@gem_mmap@swap-bo} (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-blb-e6850/igt@gem_mmap@swap-bo.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7551 and IGTPW_10042:</p>
<h3>New IGT tests (392)</h3>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@bcs0:</p>
<ul>
<li>Statuses : 28 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@ccs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@ccs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@ccs2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@ccs3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@rcs0:</p>
<ul>
<li>Statuses : 32 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@vcs0:</p>
<ul>
<li>Statuses : 30 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@vcs1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@vecs0:</p>
<ul>
<li>Statuses : 27 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang-extended@vecs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@bcs0:</p>
<ul>
<li>Statuses : 16 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@ccs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@ccs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@ccs2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@ccs3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@rcs0:</p>
<ul>
<li>Statuses : 31 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@vcs0:</p>
<ul>
<li>Statuses : 29 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@vcs1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@vecs0:</p>
<ul>
<li>Statuses : 27 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@hang@vecs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@contexts:</p>
<ul>
<li>Statuses : 32 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@gem-close-race:</p>
<ul>
<li>Statuses : 32 timeout(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@process-exit:</p>
<ul>
<li>Statuses : 32 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@active:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@active-all:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@active@bcs0:</p>
<ul>
<li>Statuses : 22 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@active@rcs0:</p>
<ul>
<li>Statuses : 24 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@active@vcs0:</p>
<ul>
<li>Statuses : 24 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@active@vcs1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@active@vecs0:</p>
<ul>
<li>Statuses : 21 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@ext-param:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@files:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@forked-active:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@forked-active-all:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@forked-active@bcs0:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@forked-active@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@forked-active@vcs0:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@forked-active@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@forked-active@vecs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@forked-files:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@hog:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@hog@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@hog@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@iris-pipeline:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@maximum-mem:</p>
<ul>
<li>Statuses : 2 skip(s) 1 timeout(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@maximum-swap:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@eviction:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@reset-pin-leak:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@await-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@await-hang@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@busy-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@busy-hang-all:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@busy-hang@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await-hang@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@wait-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@wait-hang-all:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@wait-hang@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@cached:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@cached-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@cached-s4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@fixed:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@fixed-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@fixed-s4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@hang-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@hang-s4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@power-s0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@power-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@uncached:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@uncached-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@uncached-s4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@huge-bo:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@swap-bo:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@clflush:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-huge-copy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-huge-copy-odd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-huge-copy-xy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-swap-copy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-swap-copy-odd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-swap-copy-xy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-basic-small-copy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-basic-small-copy-odd:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-basic-small-copy-xy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-big-copy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-big-copy-odd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-big-copy-xy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-huge-copy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-huge-copy-odd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-huge-copy-xy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-medium-copy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-medium-copy-odd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-medium-copy-xy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-swap-copy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-swap-copy-odd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@forked-swap-copy-xy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@huge-bo:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@huge-bo-tiledx:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@huge-bo-tiledy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@huge-copy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@huge-copy-odd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@huge-copy-xy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@swap-copy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@swap-copy-odd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@swap-copy-xy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@aperture-shrink:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@aperture-thrash:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@swap-thrash:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@aperture-shrink:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@aperture-thrash:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@swap-thrash:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-fd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-s4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-fd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-s4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@active:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@active-each:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@active-wakeup:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@active-wakeup-each:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@default:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@double-wakeup:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@double-wakeup-each:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@forked-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@forked-each:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@forked-store:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@forked-store-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@forked-store-each:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@forked-switch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@forked-switch-each:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-active:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-active-wakeup:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-default:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-double-wakeup:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-forked-store:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-forked-switch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-many:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-store:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-switch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@legacy-wakeup:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@many:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@preempt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@preempt-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@store:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@store-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@switch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@switch-each:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@wait-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@wakeup:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@wakeup-each:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@hang-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@hang-busy-write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@hang-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@hang-wait-write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-hibernate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-hibernate-devices:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader-hibernate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled-hibernate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled-hibernate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake-hibernate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@shrink:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader-hibernate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10042 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-guc/igt@fbdev@pan.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4435">i915#4435</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-guc/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rpls-1/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-kbl-2/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlm-1/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-9/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-9/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adls-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-mtlp-6/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlm-1/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-bsw-n3050/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_busy@hang@bcs0} (NEW):</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-guc/igt@gem_busy@hang@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@gem_busy@hang@rcs0} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-ivb-3770/igt@gem_busy@hang@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rpls-1/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adln-1/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-ilk-650/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-elk-e7500/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlm-1/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-9/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-9/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-mtlp-6/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-6/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rplp-1/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-rkl-11600/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-pnv-d510/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-tgl-1115g4/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-dg2-9/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adls-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-glk-j4005/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-9/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-x1275/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-mtlp-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adlp-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-jsl-3/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-bsw-nick/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-jsl-1/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-8109u/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rplp-1/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-guc/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-cfl-8700k/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-apl-guc/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-rpls-1/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/bat-adln-1/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-skl-6600u/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-kbl-soraka/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-blb-e6850/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/fi-blb-e6850/igt@gem_mmap_gtt@hang-busy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3790">i915#3790</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7551 -&gt; IGTPW_10042</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13777: 1b4fd688d213556268c50f853746c94c9a0cfee7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10042: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10042/index.html<br />
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0502283175388713510==--

