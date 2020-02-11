Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 Feb 2020 09:42:26 -0000
Message-ID: <158141414625.23971.1697611693568061738@emeril.freedesktop.org>
References: <20200211090614.7852-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200211090614.7852-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Ffence=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fe?=
 =?utf-8?q?ngine_to_utilize_all_available_engines=2E_=28rev3=29?=
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
To: saigowth <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_fence:Added __for_each_physical_engine to utilize all available engines. (rev3)
URL   : https://patchwork.freedesktop.org/series/72916/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7905 -> IGTPW_4125
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4125:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_fence@basic-await@bcs0} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/fi-cml-u2/igt@gem_exec_fence@basic-await@bcs0.html

  * {igt@gem_exec_fence@basic-wait@bcs0} (NEW):
    - fi-cml-s:           NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/fi-cml-s/igt@gem_exec_fence@basic-wait@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7905 and IGTPW_4125:

### New IGT tests (24) ###

  * igt@gem_exec_fence@basic-await:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-await@bcs0:
    - Statuses : 14 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@gem_exec_fence@basic-await@rcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.06, 0.21] s

  * igt@gem_exec_fence@basic-await@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.06, 0.19] s

  * igt@gem_exec_fence@basic-await@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.06, 0.15] s

  * igt@gem_exec_fence@basic-await@vecs0:
    - Statuses : 30 pass(s)
    - Exec time: [0.06, 0.18] s

  * igt@gem_exec_fence@basic-busy:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-busy@bcs0:
    - Statuses : 14 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_fence@basic-busy@rcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@gem_exec_fence@basic-busy@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-busy@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-busy@vecs0:
    - Statuses : 30 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-wait:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-wait@bcs0:
    - Statuses : 14 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_fence@basic-wait@rcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@gem_exec_fence@basic-wait@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_fence@basic-wait@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-wait@vecs0:
    - Statuses : 30 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@nb-await:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@nb-await@bcs0:
    - Statuses : 14 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@gem_exec_fence@nb-await@rcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@gem_exec_fence@nb-await@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@gem_exec_fence@nb-await@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@gem_exec_fence@nb-await@vecs0:
    - Statuses : 30 pass(s)
    - Exec time: [0.05, 0.07] s

  

Known issues
------------

  Here are the changes found in IGTPW_4125 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-4770:        [PASS][3] -> [TIMEOUT][4] ([fdo#112271] / [i915#1084])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7905/fi-hsw-4770/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/fi-hsw-4770/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [PASS][5] -> [DMESG-FAIL][6] ([i915#877])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7905/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][7] ([i915#45]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7905/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [INCOMPLETE][9] ([i915#424]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7905/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (46 -> 40)
------------------------------

  Additional (5): fi-glk-dsi fi-snb-2520m fi-skl-lmem fi-skl-6600u fi-kbl-r 
  Missing    (11): fi-ilk-m540 fi-bdw-5557u fi-bsw-n3050 fi-byt-j1900 fi-skl-6770hq fi-hsw-4200u fi-hsw-peppy fi-byt-squawks fi-bwr-2160 fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5433 -> IGTPW_4125

  CI-20190529: 20190529
  CI_DRM_7905: db98da3dd757a19dbaaeaef8640276fe7be2fc4e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4125: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/index.html
  IGT_5433: 6a96c17f3a1b4e1f90b1a0b0ce42a7219875d1a4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_fence@await-hang
+igt@gem_exec_fence@basic-await
+igt@gem_exec_fence@basic-busy
+igt@gem_exec_fence@basic-wait
+igt@gem_exec_fence@busy-hang
+igt@gem_exec_fence@keep-in-fence
+igt@gem_exec_fence@nb-await
+igt@gem_exec_fence@nb-await-hang
+igt@gem_exec_fence@parallel
+igt@gem_exec_fence@wait-hang
-igt@gem_exec_fence@await-blt
-igt@gem_exec_fence@await-bsd
-igt@gem_exec_fence@await-bsd1
-igt@gem_exec_fence@await-bsd2
-igt@gem_exec_fence@await-hang-blt
-igt@gem_exec_fence@await-hang-bsd
-igt@gem_exec_fence@await-hang-bsd1
-igt@gem_exec_fence@await-hang-bsd2
-igt@gem_exec_fence@await-hang-default
-igt@gem_exec_fence@await-hang-render
-igt@gem_exec_fence@await-hang-vebox
-igt@gem_exec_fence@await-render
-igt@gem_exec_fence@await-vebox
-igt@gem_exec_fence@basic-await-default
-igt@gem_exec_fence@basic-busy-default
-igt@gem_exec_fence@basic-wait-default
-igt@gem_exec_fence@busy-blt
-igt@gem_exec_fence@busy-bsd
-igt@gem_exec_fence@busy-bsd1
-igt@gem_exec_fence@busy-bsd2
-igt@gem_exec_fence@busy-hang-blt
-igt@gem_exec_fence@busy-hang-bsd
-igt@gem_exec_fence@busy-hang-bsd1
-igt@gem_exec_fence@busy-hang-bsd2
-igt@gem_exec_fence@busy-hang-default
-igt@gem_exec_fence@busy-hang-render
-igt@gem_exec_fence@busy-hang-vebox
-igt@gem_exec_fence@busy-render
-igt@gem_exec_fence@busy-vebox
-igt@gem_exec_fence@keep-in-fence-blt
-igt@gem_exec_fence@keep-in-fence-bsd
-igt@gem_exec_fence@keep-in-fence-bsd1
-igt@gem_exec_fence@keep-in-fence-bsd2
-igt@gem_exec_fence@keep-in-fence-default
-igt@gem_exec_fence@keep-in-fence-render
-igt@gem_exec_fence@keep-in-fence-vebox
-igt@gem_exec_fence@nb-await-blt
-igt@gem_exec_fence@nb-await-bsd
-igt@gem_exec_fence@nb-await-bsd1
-igt@gem_exec_fence@nb-await-bsd2
-igt@gem_exec_fence@nb-await-default
-igt@gem_exec_fence@nb-await-hang-blt
-igt@gem_exec_fence@nb-await-hang-bsd
-igt@gem_exec_fence@nb-await-hang-bsd1
-igt@gem_exec_fence@nb-await-hang-bsd2
-igt@gem_exec_fence@nb-await-hang-default
-igt@gem_exec_fence@nb-await-hang-render
-igt@gem_exec_fence@nb-await-hang-vebox
-igt@gem_exec_fence@nb-await-render
-igt@gem_exec_fence@nb-await-vebox
-igt@gem_exec_fence@parallel-blt
-igt@gem_exec_fence@parallel-bsd1
-igt@gem_exec_fence@parallel-bsd2
-igt@gem_exec_fence@parallel-render
-igt@gem_exec_fence@parallel-vebox
-igt@gem_exec_fence@wait-blt
-igt@gem_exec_fence@wait-bsd
-igt@gem_exec_fence@wait-bsd1
-igt@gem_exec_fence@wait-bsd2
-igt@gem_exec_fence@wait-hang-blt
-igt@gem_exec_fence@wait-hang-bsd
-igt@gem_exec_fence@wait-hang-bsd1
-igt@gem_exec_fence@wait-hang-bsd2
-igt@gem_exec_fence@wait-hang-default
-igt@gem_exec_fence@wait-hang-render
-igt@gem_exec_fence@wait-hang-vebox
-igt@gem_exec_fence@wait-render
-igt@gem_exec_fence@wait-vebox

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4125/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
