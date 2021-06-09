Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Jun 2021 00:49:19 -0000
Message-ID: <162319975961.27475.10820700775440593904@emeril.freedesktop.org>
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=5D_tests/gem=5Fexec=5Freloc=3A_Remove_b?=
 =?utf-8?q?anned_tests_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1789615245=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1789615245==
Content-Type: multipart/alternative;
 boundary="===============4590450352084350930=="

--===============4590450352084350930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t] tests/gem_exec_reloc: Remove banned tests (rev2)
URL   : https://patchwork.freedesktop.org/series/91160/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10194_full -> IGTPW_5901_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5901_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5901_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5901_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_reloc@gpu} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk7/igt@gem_exec_reloc@gpu.html
    - shard-kbl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl3/igt@gem_exec_reloc@gpu.html

  * {igt@gem_exec_reloc@readonly-30} (NEW):
    - shard-kbl:          NOTRUN -> [TIMEOUT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl1/igt@gem_exec_reloc@readonly-30.html
    - shard-snb:          NOTRUN -> [TIMEOUT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb2/igt@gem_exec_reloc@readonly-30.html

  * {igt@gem_exec_reloc@readonly-31} (NEW):
    - shard-apl:          NOTRUN -> [INCOMPLETE][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl8/igt@gem_exec_reloc@readonly-31.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk3/igt@gem_exec_reloc@readonly-31.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@gem_exec_reloc@readonly-31.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@gem_exec_reloc@readonly-31.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb5/igt@gem_exec_reloc@readonly-31.html
    - shard-tglb:         NOTRUN -> [TIMEOUT][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb6/igt@gem_exec_reloc@readonly-31.html

  * {igt@gem_exec_reloc@readonly-32} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@gem_exec_reloc@readonly-32.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][12], [FAIL][13], [FAIL][14]) ([i915#2426] / [i915#2782] / [i915#3002]) -> ([FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19]) ([i915#2782] / [i915#3002])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-iclb1/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-iclb8/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-iclb1/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb3/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb3/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb7/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb1/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10194_full and IGTPW_5901_full:

### New IGT tests (107) ###

  * igt@gem_exec_reloc@cpu-12:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@cpu-13:
    - Statuses : 5 pass(s)
    - Exec time: [0.29, 0.92] s

  * igt@gem_exec_reloc@cpu-14:
    - Statuses : 5 pass(s)
    - Exec time: [0.19, 0.49] s

  * igt@gem_exec_reloc@cpu-15:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 0.34] s

  * igt@gem_exec_reloc@cpu-16:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.20] s

  * igt@gem_exec_reloc@cpu-17:
    - Statuses : 4 pass(s)
    - Exec time: [0.33, 0.85] s

  * igt@gem_exec_reloc@cpu-18:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.16] s

  * igt@gem_exec_reloc@cpu-19:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 1.23] s

  * igt@gem_exec_reloc@cpu-20:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.22] s

  * igt@gem_exec_reloc@cpu-21:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@gem_exec_reloc@cpu-22:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.21] s

  * igt@gem_exec_reloc@cpu-23:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.29] s

  * igt@gem_exec_reloc@cpu-24:
    - Statuses : 6 pass(s)
    - Exec time: [0.12, 0.42] s

  * igt@gem_exec_reloc@cpu-25:
    - Statuses : 6 pass(s)
    - Exec time: [0.21, 0.69] s

  * igt@gem_exec_reloc@cpu-26:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 1.39] s

  * igt@gem_exec_reloc@cpu-27:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@cpu-28:
    - Statuses : 5 pass(s)
    - Exec time: [0.93, 2.66] s

  * igt@gem_exec_reloc@cpu-29:
    - Statuses : 6 pass(s)
    - Exec time: [1.69, 6.48] s

  * igt@gem_exec_reloc@cpu-30:
    - Statuses : 6 pass(s)
    - Exec time: [3.44, 13.03] s

  * igt@gem_exec_reloc@cpu-31:
    - Statuses : 4 pass(s)
    - Exec time: [6.68, 24.84] s

  * igt@gem_exec_reloc@cpu-32:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@gpu:
    - Statuses : 2 fail(s)
    - Exec time: [0.08, 0.13] s

  * igt@gem_exec_reloc@gtt-12:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.48] s

  * igt@gem_exec_reloc@gtt-13:
    - Statuses : 6 pass(s)
    - Exec time: [0.18, 0.63] s

  * igt@gem_exec_reloc@gtt-14:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.22] s

  * igt@gem_exec_reloc@gtt-15:
    - Statuses : 6 pass(s)
    - Exec time: [0.28, 0.92] s

  * igt@gem_exec_reloc@gtt-16:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.16] s

  * igt@gem_exec_reloc@gtt-17:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@gem_exec_reloc@gtt-18:
    - Statuses : 5 pass(s)
    - Exec time: [0.08, 0.22] s

  * igt@gem_exec_reloc@gtt-19:
    - Statuses : 6 pass(s)
    - Exec time: [0.33, 1.07] s

  * igt@gem_exec_reloc@gtt-20:
    - Statuses : 5 pass(s)
    - Exec time: [0.11, 0.33] s

  * igt@gem_exec_reloc@gtt-21:
    - Statuses : 5 pass(s)
    - Exec time: [0.11, 0.27] s

  * igt@gem_exec_reloc@gtt-22:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@gem_exec_reloc@gtt-23:
    - Statuses : 6 pass(s)
    - Exec time: [0.24, 0.70] s

  * igt@gem_exec_reloc@gtt-24:
    - Statuses : 6 pass(s)
    - Exec time: [0.43, 1.42] s

  * igt@gem_exec_reloc@gtt-25:
    - Statuses : 5 pass(s)
    - Exec time: [0.45, 1.62] s

  * igt@gem_exec_reloc@gtt-26:
    - Statuses : 5 pass(s)
    - Exec time: [1.17, 3.56] s

  * igt@gem_exec_reloc@gtt-27:
    - Statuses : 5 pass(s)
    - Exec time: [1.55, 5.38] s

  * igt@gem_exec_reloc@gtt-28:
    - Statuses : 5 pass(s)
    - Exec time: [3.83, 17.30] s

  * igt@gem_exec_reloc@gtt-29:
    - Statuses : 6 pass(s)
    - Exec time: [6.93, 30.12] s

  * igt@gem_exec_reloc@gtt-30:
    - Statuses : 4 pass(s)
    - Exec time: [17.42, 57.39] s

  * igt@gem_exec_reloc@gtt-31:
    - Statuses : 6 pass(s)
    - Exec time: [26.31, 118.00] s

  * igt@gem_exec_reloc@gtt-32:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.12, 100.09] s

  * igt@gem_exec_reloc@invalid-domains:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_reloc@mmap-12:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@mmap-13:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.27] s

  * igt@gem_exec_reloc@mmap-14:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.24] s

  * igt@gem_exec_reloc@mmap-15:
    - Statuses : 4 pass(s)
    - Exec time: [0.11, 0.25] s

  * igt@gem_exec_reloc@mmap-16:
    - Statuses : 5 pass(s)
    - Exec time: [0.10, 0.35] s

  * igt@gem_exec_reloc@mmap-17:
    - Statuses : 5 pass(s)
    - Exec time: [0.08, 0.29] s

  * igt@gem_exec_reloc@mmap-18:
    - Statuses : 6 pass(s)
    - Exec time: [0.32, 1.04] s

  * igt@gem_exec_reloc@mmap-19:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@gem_exec_reloc@mmap-20:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.20] s

  * igt@gem_exec_reloc@mmap-21:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.27] s

  * igt@gem_exec_reloc@mmap-22:
    - Statuses : 6 pass(s)
    - Exec time: [0.36, 1.20] s

  * igt@gem_exec_reloc@mmap-23:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.23] s

  * igt@gem_exec_reloc@mmap-24:
    - Statuses : 6 pass(s)
    - Exec time: [0.32, 1.03] s

  * igt@gem_exec_reloc@mmap-25:
    - Statuses : 6 pass(s)
    - Exec time: [0.41, 1.67] s

  * igt@gem_exec_reloc@mmap-26:
    - Statuses : 6 pass(s)
    - Exec time: [0.30, 0.92] s

  * igt@gem_exec_reloc@mmap-27:
    - Statuses : 6 pass(s)
    - Exec time: [0.19, 0.94] s

  * igt@gem_exec_reloc@mmap-28:
    - Statuses : 5 pass(s)
    - Exec time: [0.34, 0.81] s

  * igt@gem_exec_reloc@mmap-29:
    - Statuses : 5 pass(s)
    - Exec time: [0.56, 1.47] s

  * igt@gem_exec_reloc@mmap-30:
    - Statuses : 5 pass(s)
    - Exec time: [1.23, 3.68] s

  * igt@gem_exec_reloc@mmap-31:
    - Statuses : 6 pass(s)
    - Exec time: [1.79, 7.21] s

  * igt@gem_exec_reloc@mmap-32:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.07, 4.85] s

  * igt@gem_exec_reloc@readonly-12:
    - Statuses : 5 pass(s)
    - Exec time: [0.24, 0.71] s

  * igt@gem_exec_reloc@readonly-13:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@gem_exec_reloc@readonly-14:
    - Statuses : 6 pass(s)
    - Exec time: [0.12, 0.34] s

  * igt@gem_exec_reloc@readonly-15:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@gem_exec_reloc@readonly-16:
    - Statuses : 5 pass(s)
    - Exec time: [0.16, 0.30] s

  * igt@gem_exec_reloc@readonly-17:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 0.38] s

  * igt@gem_exec_reloc@readonly-18:
    - Statuses : 5 pass(s)
    - Exec time: [0.08, 0.24] s

  * igt@gem_exec_reloc@readonly-19:
    - Statuses : 6 pass(s)
    - Exec time: [0.13, 0.52] s

  * igt@gem_exec_reloc@readonly-20:
    - Statuses : 5 pass(s)
    - Exec time: [0.18, 0.48] s

  * igt@gem_exec_reloc@readonly-21:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 1.19] s

  * igt@gem_exec_reloc@readonly-22:
    - Statuses : 4 pass(s)
    - Exec time: [0.23, 1.43] s

  * igt@gem_exec_reloc@readonly-23:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 2.49] s

  * igt@gem_exec_reloc@readonly-24:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@readonly-25:
    - Statuses : 4 pass(s)
    - Exec time: [3.04, 7.93] s

  * igt@gem_exec_reloc@readonly-26:
    - Statuses : 6 pass(s)
    - Exec time: [6.86, 27.54] s

  * igt@gem_exec_reloc@readonly-27:
    - Statuses : 6 pass(s)
    - Exec time: [3.23, 69.91] s

  * igt@gem_exec_reloc@readonly-28:
    - Statuses : 5 pass(s)
    - Exec time: [26.42, 104.69] s

  * igt@gem_exec_reloc@readonly-29:
    - Statuses : 5 pass(s)
    - Exec time: [23.44, 97.25] s

  * igt@gem_exec_reloc@readonly-30:
    - Statuses : 2 incomplete(s) 2 pass(s) 2 timeout(s)
    - Exec time: [0.0, 143.27] s

  * igt@gem_exec_reloc@readonly-31:
    - Statuses : 5 incomplete(s) 1 timeout(s)
    - Exec time: [0.0, 241.27] s

  * igt@gem_exec_reloc@readonly-32:
    - Statuses : 2 incomplete(s) 2 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@gem_exec_reloc@wc-12:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.18] s

  * igt@gem_exec_reloc@wc-13:
    - Statuses : 5 pass(s)
    - Exec time: [0.12, 0.30] s

  * igt@gem_exec_reloc@wc-14:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.18] s

  * igt@gem_exec_reloc@wc-15:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.49] s

  * igt@gem_exec_reloc@wc-16:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.24] s

  * igt@gem_exec_reloc@wc-17:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.31] s

  * igt@gem_exec_reloc@wc-18:
    - Statuses : 5 pass(s)
    - Exec time: [0.12, 0.36] s

  * igt@gem_exec_reloc@wc-19:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.96] s

  * igt@gem_exec_reloc@wc-20:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.19] s

  * igt@gem_exec_reloc@wc-21:
    - Statuses : 6 pass(s)
    - Exec time: [0.10, 0.26] s

  * igt@gem_exec_reloc@wc-22:
    - Statuses : 6 pass(s)
    - Exec time: [0.15, 0.41] s

  * igt@gem_exec_reloc@wc-23:
    - Statuses : 4 pass(s)
    - Exec time: [0.16, 0.34] s

  * igt@gem_exec_reloc@wc-24:
    - Statuses : 6 pass(s)
    - Exec time: [0.23, 0.53] s

  * igt@gem_exec_reloc@wc-25:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@gem_exec_reloc@wc-26:
    - Statuses : 6 pass(s)
    - Exec time: [0.68, 1.48] s

  * igt@gem_exec_reloc@wc-27:
    - Statuses : 4 pass(s)
    - Exec time: [1.32, 2.56] s

  * igt@gem_exec_reloc@wc-28:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@wc-29:
    - Statuses : 5 pass(s)
    - Exec time: [4.94, 11.04] s

  * igt@gem_exec_reloc@wc-30:
    - Statuses : 6 pass(s)
    - Exec time: [10.15, 21.59] s

  * igt@gem_exec_reloc@wc-31:
    - Statuses : 5 pass(s)
    - Exec time: [19.66, 43.73] s

  * igt@gem_exec_reloc@wc-32:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5901_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#3160])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-glk6/igt@gem_create@create-clear.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk8/igt@gem_create@create-clear.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][22] ([i915#3002])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl3/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#1099]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][24] -> [TIMEOUT][25] ([i915#3063])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][29] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#2842]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][32] -> [FAIL][33] ([i915#2849])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#2190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][35] ([i915#2658])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3323])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#3323])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3323])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3323])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3323])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109289]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109289]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb3/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271]) +194 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][44] ([i915#3462])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl2/igt@i915_selftest@live@execlists.html

  * igt@kms_ccs@pipe-c-random-ccs-data:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271]) +377 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb6/igt@kms_ccs@pipe-c-random-ccs-data.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb7/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl1/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl6/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#1149])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max.html
    - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk5/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][53] ([i915#1319]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl4/igt@kms_content_protection@atomic.html
    - shard-apl:          NOTRUN -> [TIMEOUT][54] ([i915#1319]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111828])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb6/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109300] / [fdo#111066])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][57] ([i915#2105])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3359]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3319]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][61] -> [DMESG-WARN][62] ([i915#180])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109279] / [i915#3359]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109278]) +11 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb8/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111825]) +15 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274] / [fdo#109278])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#533]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][68] -> [SKIP][69] ([fdo#109271]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-snb6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][71] -> [FAIL][72] ([i915#2122])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2672])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2642])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271]) +141 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271]) +37 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109280]) +10 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#533])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][79] ([i915#180]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][80] ([i915#265])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-glk:          NOTRUN -> [FAIL][81] ([i915#265])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][82] ([i915#265])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][83] ([fdo#108145] / [i915#265]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#3536])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@kms_plane_lowres@pipe-c-tiling-yf.html
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#111615])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
    - shard-glk:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#2920])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109441])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html
    - shard-tglb:         NOTRUN -> [FAIL][93] ([i915#132] / [i915#3467

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html

--===============4590450352084350930==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t] tests/gem_exec_reloc: Remove banned tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91160/">https://patchwork.freedesktop.org/series/91160/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10194_full -&gt; IGTPW_5901_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5901_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5901_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5901_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_reloc@gpu} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk7/igt@gem_exec_reloc@gpu.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl3/igt@gem_exec_reloc@gpu.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_reloc@readonly-30} (NEW):</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl1/igt@gem_exec_reloc@readonly-30.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb2/igt@gem_exec_reloc@readonly-30.html">TIMEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_reloc@readonly-31} (NEW):</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl8/igt@gem_exec_reloc@readonly-31.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk3/igt@gem_exec_reloc@readonly-31.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@gem_exec_reloc@readonly-31.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@gem_exec_reloc@readonly-31.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb5/igt@gem_exec_reloc@readonly-31.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb6/igt@gem_exec_reloc@readonly-31.html">TIMEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_reloc@readonly-32} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@gem_exec_reloc@readonly-32.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-iclb1/igt@runner@aborted.html">FAIL</a>) ([i915#2426] / [i915#2782] / [i915#3002]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb1/igt@runner@aborted.html">FAIL</a>) ([i915#2782] / [i915#3002])</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10194_full and IGTPW_5901_full:</p>
<h3>New IGT tests (107)</h3>
<ul>
<li>
<p>igt@gem_exec_reloc@cpu-12:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-13:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.29, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-14:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.19, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-15:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-16:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.06, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-17:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.33, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-18:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.06, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-19:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.36, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-20:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-21:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-22:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-23:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-24:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.12, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-25:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.21, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-26:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-27:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-28:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.93, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-29:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.69, 6.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-30:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.44, 13.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-31:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.68, 24.84] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-32:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gpu:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.08, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-12:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-13:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.18, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-14:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-15:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.28, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-16:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.06, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-17:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-18:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.08, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-19:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.33, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-20:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.11, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-21:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.11, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-22:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-23:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.24, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-24:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.43, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-25:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.45, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-26:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.17, 3.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-27:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.55, 5.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-28:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.83, 17.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-29:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [6.93, 30.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-30:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [17.42, 57.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-31:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [26.31, 118.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-32:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.12, 100.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@invalid-domains:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-12:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-13:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-14:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-15:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.11, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-16:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.10, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-17:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.08, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-18:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.32, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-19:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-20:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-22:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.36, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-23:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-24:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.32, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-25:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.41, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-26:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.30, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-27:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.19, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-28:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.34, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-29:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.56, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-30:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.23, 3.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-31:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.79, 7.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-32:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.07, 4.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-12:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.24, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-13:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-14:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.12, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-15:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-16:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.16, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-17:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-18:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.08, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-19:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.13, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-20:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.18, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-21:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.42, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-22:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.23, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-23:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.53, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-24:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-25:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [3.04, 7.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-26:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [6.86, 27.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-27:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.23, 69.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-28:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [26.42, 104.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-29:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [23.44, 97.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-30:</p>
<ul>
<li>Statuses : 2 incomplete(s) 2 pass(s) 2 timeout(s)</li>
<li>Exec time: [0.0, 143.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-31:</p>
<ul>
<li>Statuses : 5 incomplete(s) 1 timeout(s)</li>
<li>Exec time: [0.0, 241.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-32:</p>
<ul>
<li>Statuses : 2 incomplete(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-12:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.06, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-13:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.12, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-14:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.06, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-15:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-16:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-17:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-18:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.12, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-19:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-20:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-21:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.10, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-22:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.15, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-23:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.16, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-24:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.23, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-25:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-26:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.68, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-27:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.32, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-28:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-29:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [4.94, 11.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-30:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [10.15, 21.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-31:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [19.66, 43.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-32:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5901_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-glk6/igt@gem_create@create-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk8/igt@gem_create@create-clear.html">FAIL</a> ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb7/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl8/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl3/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb3/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([fdo#109271]) +194 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb6/igt@kms_ccs@pipe-c-random-ccs-data.html">SKIP</a> ([fdo#109271]) +377 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb7/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl1/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl6/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk5/igt@kms_color_chamelium@pipe-b-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl4/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb6/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl1/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb8/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html">SKIP</a> ([fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +15 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-snb6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-snb2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109271]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +141 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb4/igt@kms_plane_lowres@pipe-c-tiling-yf.html">SKIP</a> ([i915#3536])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-yf.html">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-tglb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; [FAIL][93] ([i915#132] / [i915#3467</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4590450352084350930==--

--===============1789615245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1789615245==--
