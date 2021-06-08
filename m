Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Jun 2021 16:02:15 -0000
Message-ID: <162316813580.419.16992582803975270114@emeril.freedesktop.org>
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/7=5D_tests/gem=5Fexec=5Freloc=3A_Re?=
 =?utf-8?q?move_banned_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0725117853=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0725117853==
Content-Type: multipart/alternative;
 boundary="===============7476900527918254007=="

--===============7476900527918254007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/7] tests/gem_exec_reloc: Remove banned tests
URL   : https://patchwork.freedesktop.org/series/91160/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10189_full -> IGTPW_5898_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5898_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5898_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5898_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_reloc@basic-cpu-gtt-active:
    - shard-iclb:         [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-iclb2/igt@gem_exec_reloc@basic-cpu-gtt-active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb8/igt@gem_exec_reloc@basic-cpu-gtt-active.html

  * igt@gem_exec_reloc@basic-cpu-read-active:
    - shard-glk:          [PASS][3] -> [TIMEOUT][4] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-glk1/igt@gem_exec_reloc@basic-cpu-read-active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk1/igt@gem_exec_reloc@basic-cpu-read-active.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-apl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-apl1/igt@gem_exec_reloc@basic-cpu-wc-active.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl6/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-tglb:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb5/igt@gem_exec_reloc@basic-gtt-active.html
    - shard-apl:          NOTRUN -> [TIMEOUT][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl7/igt@gem_exec_reloc@basic-gtt-active.html
    - shard-glk:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk7/igt@gem_exec_reloc@basic-gtt-active.html
    - shard-iclb:         NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb2/igt@gem_exec_reloc@basic-gtt-active.html
    - shard-kbl:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl4/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-iclb:         [PASS][12] -> [FAIL][13] +13 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-iclb1/igt@gem_exec_reloc@basic-gtt-read-active.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb1/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-wc-active:
    - shard-snb:          [PASS][14] -> [FAIL][15] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-snb7/igt@gem_exec_reloc@basic-wc-active.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_exec_reloc@basic-wc-active.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-apl:          [PASS][16] -> [TIMEOUT][17] +7 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-apl3/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl1/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-tglb:         [PASS][18] -> [FAIL][19] +14 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb6/igt@gem_exec_reloc@basic-wc-read-active.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb8/igt@gem_exec_reloc@basic-wc-read-active.html
    - shard-kbl:          [PASS][20] -> [FAIL][21] +9 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-kbl1/igt@gem_exec_reloc@basic-wc-read-active.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl4/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-snb:          NOTRUN -> [FAIL][22] +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb6/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-glk:          [PASS][23] -> [FAIL][24] +9 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-glk5/igt@gem_exec_reloc@basic-write-read-active.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk9/igt@gem_exec_reloc@basic-write-read-active.html
    - shard-apl:          NOTRUN -> [FAIL][25] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl7/igt@gem_exec_reloc@basic-write-read-active.html

  * {igt@gem_exec_reloc@readonly-30} (NEW):
    - shard-glk:          NOTRUN -> [TIMEOUT][26] +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk5/igt@gem_exec_reloc@readonly-30.html
    - shard-snb:          NOTRUN -> [TIMEOUT][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_exec_reloc@readonly-30.html

  * {igt@gem_exec_reloc@readonly-31} (NEW):
    - shard-apl:          NOTRUN -> [INCOMPLETE][28] +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl1/igt@gem_exec_reloc@readonly-31.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk6/igt@gem_exec_reloc@readonly-31.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][30] +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb2/igt@gem_exec_reloc@readonly-31.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl7/igt@gem_exec_reloc@readonly-31.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_exec_reloc@readonly-31.html
    - shard-tglb:         NOTRUN -> [TIMEOUT][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb6/igt@gem_exec_reloc@readonly-31.html

  * {igt@gem_exec_reloc@readonly-32} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][34] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@gem_exec_reloc@readonly-32.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][35], [FAIL][36], [FAIL][37]) ([i915#2782] / [i915#3002]) -> ([FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42]) ([i915#1814] / [i915#2782] / [i915#3002])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-iclb1/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-iclb7/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-iclb6/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb1/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb5/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb7/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb2/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46]) ([i915#1436] / [i915#2426] / [i915#2966] / [i915#3002] / [i915#409]) -> ([FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52]) ([i915#1436] / [i915#2426] / [i915#2966] / [i915#3002])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb2/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb8/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb3/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb6/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb6/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb5/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb6/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10189_full and IGTPW_5898_full:

### New IGT tests (107) ###

  * igt@gem_exec_reloc@cpu-12:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.31] s

  * igt@gem_exec_reloc@cpu-13:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.19] s

  * igt@gem_exec_reloc@cpu-14:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.16] s

  * igt@gem_exec_reloc@cpu-15:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@cpu-16:
    - Statuses : 5 pass(s)
    - Exec time: [0.30, 0.84] s

  * igt@gem_exec_reloc@cpu-17:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.23] s

  * igt@gem_exec_reloc@cpu-18:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.26] s

  * igt@gem_exec_reloc@cpu-19:
    - Statuses : 5 pass(s)
    - Exec time: [0.12, 0.44] s

  * igt@gem_exec_reloc@cpu-20:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.26] s

  * igt@gem_exec_reloc@cpu-21:
    - Statuses : 5 pass(s)
    - Exec time: [0.29, 0.97] s

  * igt@gem_exec_reloc@cpu-22:
    - Statuses : 3 pass(s)
    - Exec time: [0.09, 0.17] s

  * igt@gem_exec_reloc@cpu-23:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@cpu-24:
    - Statuses : 5 pass(s)
    - Exec time: [0.34, 1.16] s

  * igt@gem_exec_reloc@cpu-25:
    - Statuses : 6 pass(s)
    - Exec time: [0.18, 0.64] s

  * igt@gem_exec_reloc@cpu-26:
    - Statuses : 5 pass(s)
    - Exec time: [0.27, 0.75] s

  * igt@gem_exec_reloc@cpu-27:
    - Statuses : 3 pass(s)
    - Exec time: [0.80, 2.19] s

  * igt@gem_exec_reloc@cpu-28:
    - Statuses : 6 pass(s)
    - Exec time: [0.89, 3.38] s

  * igt@gem_exec_reloc@cpu-29:
    - Statuses : 6 pass(s)
    - Exec time: [1.77, 6.70] s

  * igt@gem_exec_reloc@cpu-30:
    - Statuses : 5 pass(s)
    - Exec time: [3.41, 13.05] s

  * igt@gem_exec_reloc@cpu-31:
    - Statuses : 5 pass(s)
    - Exec time: [6.70, 18.19] s

  * igt@gem_exec_reloc@cpu-32:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.36, 15.39] s

  * igt@gem_exec_reloc@gpu:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@gtt-12:
    - Statuses : 4 pass(s)
    - Exec time: [0.13, 0.40] s

  * igt@gem_exec_reloc@gtt-13:
    - Statuses : 5 pass(s)
    - Exec time: [0.27, 1.15] s

  * igt@gem_exec_reloc@gtt-14:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@gem_exec_reloc@gtt-15:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.18] s

  * igt@gem_exec_reloc@gtt-16:
    - Statuses : 3 pass(s)
    - Exec time: [0.06, 0.14] s

  * igt@gem_exec_reloc@gtt-17:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@gtt-18:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.24] s

  * igt@gem_exec_reloc@gtt-19:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@gem_exec_reloc@gtt-20:
    - Statuses : 4 pass(s)
    - Exec time: [0.10, 0.24] s

  * igt@gem_exec_reloc@gtt-21:
    - Statuses : 5 pass(s)
    - Exec time: [0.14, 0.46] s

  * igt@gem_exec_reloc@gtt-22:
    - Statuses : 6 pass(s)
    - Exec time: [0.41, 1.14] s

  * igt@gem_exec_reloc@gtt-23:
    - Statuses : 6 pass(s)
    - Exec time: [0.60, 1.75] s

  * igt@gem_exec_reloc@gtt-24:
    - Statuses : 4 pass(s)
    - Exec time: [0.66, 0.88] s

  * igt@gem_exec_reloc@gtt-25:
    - Statuses : 5 pass(s)
    - Exec time: [0.45, 1.61] s

  * igt@gem_exec_reloc@gtt-26:
    - Statuses : 4 pass(s)
    - Exec time: [0.96, 2.63] s

  * igt@gem_exec_reloc@gtt-27:
    - Statuses : 5 pass(s)
    - Exec time: [1.85, 5.44] s

  * igt@gem_exec_reloc@gtt-28:
    - Statuses : 5 pass(s)
    - Exec time: [3.19, 17.48] s

  * igt@gem_exec_reloc@gtt-29:
    - Statuses : 4 pass(s)
    - Exec time: [6.44, 29.08] s

  * igt@gem_exec_reloc@gtt-30:
    - Statuses : 2 pass(s)
    - Exec time: [23.55, 58.25] s

  * igt@gem_exec_reloc@gtt-31:
    - Statuses : 4 pass(s)
    - Exec time: [34.70, 115.44] s

  * igt@gem_exec_reloc@gtt-32:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.15, 99.82] s

  * igt@gem_exec_reloc@invalid-domains:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@gem_exec_reloc@mmap-12:
    - Statuses : 6 pass(s)
    - Exec time: [0.31, 1.35] s

  * igt@gem_exec_reloc@mmap-13:
    - Statuses : 3 pass(s)
    - Exec time: [0.12, 0.28] s

  * igt@gem_exec_reloc@mmap-14:
    - Statuses : 6 pass(s)
    - Exec time: [0.31, 1.30] s

  * igt@gem_exec_reloc@mmap-15:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@gem_exec_reloc@mmap-16:
    - Statuses : 5 pass(s)
    - Exec time: [0.08, 0.23] s

  * igt@gem_exec_reloc@mmap-17:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 1.06] s

  * igt@gem_exec_reloc@mmap-18:
    - Statuses : 6 pass(s)
    - Exec time: [0.14, 0.37] s

  * igt@gem_exec_reloc@mmap-19:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@mmap-20:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@gem_exec_reloc@mmap-21:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@mmap-22:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.24] s

  * igt@gem_exec_reloc@mmap-23:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.29] s

  * igt@gem_exec_reloc@mmap-24:
    - Statuses : 5 pass(s)
    - Exec time: [0.10, 0.33] s

  * igt@gem_exec_reloc@mmap-25:
    - Statuses : 5 pass(s)
    - Exec time: [0.15, 0.46] s

  * igt@gem_exec_reloc@mmap-26:
    - Statuses : 5 pass(s)
    - Exec time: [0.34, 0.76] s

  * igt@gem_exec_reloc@mmap-27:
    - Statuses : 4 pass(s)
    - Exec time: [0.24, 0.70] s

  * igt@gem_exec_reloc@mmap-28:
    - Statuses : 5 pass(s)
    - Exec time: [0.34, 1.06] s

  * igt@gem_exec_reloc@mmap-29:
    - Statuses : 6 pass(s)
    - Exec time: [0.49, 1.90] s

  * igt@gem_exec_reloc@mmap-30:
    - Statuses : 5 pass(s)
    - Exec time: [0.93, 2.70] s

  * igt@gem_exec_reloc@mmap-31:
    - Statuses : 4 pass(s)
    - Exec time: [1.96, 2.67] s

  * igt@gem_exec_reloc@mmap-32:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.41, 5.08] s

  * igt@gem_exec_reloc@readonly-12:
    - Statuses : 5 pass(s)
    - Exec time: [0.32, 1.19] s

  * igt@gem_exec_reloc@readonly-13:
    - Statuses : 6 pass(s)
    - Exec time: [0.29, 0.99] s

  * igt@gem_exec_reloc@readonly-14:
    - Statuses : 4 pass(s)
    - Exec time: [0.32, 0.86] s

  * igt@gem_exec_reloc@readonly-15:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.22] s

  * igt@gem_exec_reloc@readonly-16:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@gem_exec_reloc@readonly-17:
    - Statuses : 5 pass(s)
    - Exec time: [0.10, 0.25] s

  * igt@gem_exec_reloc@readonly-18:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.27] s

  * igt@gem_exec_reloc@readonly-19:
    - Statuses : 3 pass(s)
    - Exec time: [0.14, 0.29] s

  * igt@gem_exec_reloc@readonly-20:
    - Statuses : 5 pass(s)
    - Exec time: [0.23, 0.77] s

  * igt@gem_exec_reloc@readonly-21:
    - Statuses : 6 pass(s)
    - Exec time: [0.52, 1.38] s

  * igt@gem_exec_reloc@readonly-22:
    - Statuses : 6 pass(s)
    - Exec time: [0.25, 2.18] s

  * igt@gem_exec_reloc@readonly-23:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 3.27] s

  * igt@gem_exec_reloc@readonly-24:
    - Statuses : 5 pass(s)
    - Exec time: [1.90, 7.45] s

  * igt@gem_exec_reloc@readonly-25:
    - Statuses : 6 pass(s)
    - Exec time: [0.97, 11.60] s

  * igt@gem_exec_reloc@readonly-26:
    - Statuses : 5 pass(s)
    - Exec time: [6.36, 17.73] s

  * igt@gem_exec_reloc@readonly-27:
    - Statuses : 5 pass(s)
    - Exec time: [17.81, 70.74] s

  * igt@gem_exec_reloc@readonly-28:
    - Statuses : 5 pass(s)
    - Exec time: [6.47, 67.41] s

  * igt@gem_exec_reloc@readonly-29:
    - Statuses : 1 incomplete(s) 4 pass(s) 1 timeout(s)
    - Exec time: [0.0, 170.49] s

  * igt@gem_exec_reloc@readonly-30:
    - Statuses : 1 incomplete(s) 2 pass(s) 2 timeout(s)
    - Exec time: [0.0, 247.28] s

  * igt@gem_exec_reloc@readonly-31:
    - Statuses : 5 incomplete(s) 1 timeout(s)
    - Exec time: [0.0, 162.78] s

  * igt@gem_exec_reloc@readonly-32:
    - Statuses : 2 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@gem_exec_reloc@wc-12:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@gem_exec_reloc@wc-13:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.59] s

  * igt@gem_exec_reloc@wc-14:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@wc-15:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.29] s

  * igt@gem_exec_reloc@wc-16:
    - Statuses : 6 pass(s)
    - Exec time: [0.12, 0.37] s

  * igt@gem_exec_reloc@wc-17:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.26] s

  * igt@gem_exec_reloc@wc-18:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@wc-19:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@gem_exec_reloc@wc-20:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.16] s

  * igt@gem_exec_reloc@wc-21:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.29] s

  * igt@gem_exec_reloc@wc-22:
    - Statuses : 4 pass(s)
    - Exec time: [0.12, 0.29] s

  * igt@gem_exec_reloc@wc-23:
    - Statuses : 5 pass(s)
    - Exec time: [0.15, 0.37] s

  * igt@gem_exec_reloc@wc-24:
    - Statuses : 3 pass(s)
    - Exec time: [0.26, 0.50] s

  * igt@gem_exec_reloc@wc-25:
    - Statuses : 6 pass(s)
    - Exec time: [0.39, 0.94] s

  * igt@gem_exec_reloc@wc-26:
    - Statuses : 4 pass(s)
    - Exec time: [0.73, 1.51] s

  * igt@gem_exec_reloc@wc-27:
    - Statuses : 5 pass(s)
    - Exec time: [1.38, 2.88] s

  * igt@gem_exec_reloc@wc-28:
    - Statuses : 5 pass(s)
    - Exec time: [2.80, 5.39] s

  * igt@gem_exec_reloc@wc-29:
    - Statuses : 4 pass(s)
    - Exec time: [5.40, 11.07] s

  * igt@gem_exec_reloc@wc-30:
    - Statuses : 2 pass(s)
    - Exec time: [14.72, 19.59] s

  * igt@gem_exec_reloc@wc-31:
    - Statuses : 3 pass(s)
    - Exec time: [21.05, 38.82] s

  * igt@gem_exec_reloc@wc-32:
    - Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 42.72] s

  

Known issues
------------

  Here are the changes found in IGTPW_5898_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_import_export@flink:
    - shard-tglb:         [PASS][53] -> [INCOMPLETE][54] ([i915#750]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb3/igt@drm_import_export@flink.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb2/igt@drm_import_export@flink.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#1099]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb7/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][56] ([i915#3354])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][57] ([i915#2846])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          [PASS][58] -> [FAIL][59] ([i915#2842]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          NOTRUN -> [FAIL][60] ([i915#2842])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][61] ([i915#2842])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][62] -> [FAIL][63] ([i915#2842]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][64] -> [FAIL][65] ([i915#2842]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * {igt@gem_exec_reloc@readonly-32} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271]) +53 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk9/igt@gem_exec_reloc@readonly-32.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-iclb:         [PASS][67] -> [INCOMPLETE][68] ([i915#1895])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-iclb7/igt@gem_exec_whisper@basic-contexts-forked.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb7/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#307])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-glk9/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-iclb:         [PASS][71] -> [FAIL][72] ([i915#307])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][73] ([i915#2658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb6/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#768])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@input-checking:
    - shard-snb:          NOTRUN -> [DMESG-WARN][75] ([i915#3002])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@gem_userptr_blits@unsync-overlap.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3297])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb8/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][78] ([i915#2724])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb7/igt@gem_userptr_blits@vma-merge.html
    - shard-apl:          NOTRUN -> [FAIL][79] ([i915#3318])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl3/igt@gem_userptr_blits@vma-merge.html
    - shard-iclb:         NOTRUN -> [FAIL][80] ([i915#3318])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb5/igt@gem_userptr_blits@vma-merge.html
    - shard-glk:          NOTRUN -> [FAIL][81] ([i915#3318])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk9/igt@gem_userptr_blits@vma-merge.html
    - shard-kbl:          NOTRUN -> [FAIL][82] ([i915#3318])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl1/igt@gem_userptr_blits@vma-merge.html
    - shard-tglb:         NOTRUN -> [FAIL][83] ([i915#3318])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          NOTRUN -> [DMESG-WARN][84] ([i915#180])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_hangman@engine-error@vecs0:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271]) +162 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl3/igt@i915_hangman@engine-error@vecs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][86] ([i915#454])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#1937])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#1937])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#111644] / [i915#1397] / [i915#2411])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][90] ([i915#3462])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl8/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl8/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][92] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-glk7/igt@kms_chamelium@hdmi-aspect-ratio.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb5/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][94] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][97] ([i915#1319])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][98] ([i915#1319])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][99] ([i915#2105])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][100] -> [DMESG-WARN][101] ([i915#180]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109278]) +11 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#3359]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/index.html

--===============7476900527918254007==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/7] tests/gem_e=
xec_reloc: Remove banned tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/91160/">https://patchwork.freedesktop.org/series/91160/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5898/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10189_full -&gt; IGTPW_5898_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5898_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5898_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5898=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-active:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-iclb2/igt@gem_exec_reloc@basic-cpu-gtt-active.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/=
shard-iclb8/igt@gem_exec_reloc@basic-cpu-gtt-active.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-active:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-glk1/igt@gem_exec_reloc@basic-cpu-read-active.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/=
shard-glk1/igt@gem_exec_reloc@basic-cpu-read-active.html">TIMEOUT</a> +4 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-active:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-apl1/igt@gem_exec_reloc@basic-cpu-wc-active.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/sh=
ard-apl6/igt@gem_exec_reloc@basic-cpu-wc-active.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-active:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-tglb5/igt@gem_exec_reloc@basic-gtt-active.htm=
l">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-apl7/igt@gem_exec_reloc@basic-gtt-active.html=
">TIMEOUT</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-glk7/igt@gem_exec_reloc@basic-gtt-active.html=
">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-iclb2/igt@gem_exec_reloc@basic-gtt-active.htm=
l">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-kbl4/igt@gem_exec_reloc@basic-gtt-active.html=
">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-iclb1/igt@gem_exec_reloc@basic-gtt-read-active.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898=
/shard-iclb1/igt@gem_exec_reloc@basic-gtt-read-active.html">FAIL</a> +13 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-active:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-snb7/igt@gem_exec_reloc@basic-wc-active.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-=
snb2/igt@gem_exec_reloc@basic-wc-active.html">FAIL</a> +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-apl3/igt@gem_exec_reloc@basic-wc-cpu-active.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/sh=
ard-apl1/igt@gem_exec_reloc@basic-wc-cpu-active.html">TIMEOUT</a> +7 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10189/shard-tglb6/igt@gem_exec_reloc@basic-wc-read-active.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/s=
hard-tglb8/igt@gem_exec_reloc@basic-wc-read-active.html">FAIL</a> +14 simil=
ar issues</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10189/shard-kbl1/igt@gem_exec_reloc@basic-wc-read-active.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/sh=
ard-kbl4/igt@gem_exec_reloc@basic-wc-read-active.html">FAIL</a> +9 similar =
issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-snb6/igt@gem_exec_reloc@basic-write-gtt-acti=
ve.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10189/shard-glk5/igt@gem_exec_reloc@basic-write-read-active.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898=
/shard-glk9/igt@gem_exec_reloc@basic-write-read-active.html">FAIL</a> +9 si=
milar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-apl7/igt@gem_exec_reloc@basic-write-read-acti=
ve.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_reloc@readonly-30} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-glk5/igt@gem_exec_reloc@readonly-30.html">TIM=
EOUT</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_exec_reloc@readonly-30.html">TIM=
EOUT</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_reloc@readonly-31} (NEW):</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-apl1/igt@gem_exec_reloc@readonly-31.html">INC=
OMPLETE</a> +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-glk6/igt@gem_exec_reloc@readonly-31.html">INC=
OMPLETE</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-iclb2/igt@gem_exec_reloc@readonly-31.html">IN=
COMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-kbl7/igt@gem_exec_reloc@readonly-31.html">INC=
OMPLETE</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_exec_reloc@readonly-31.html">INC=
OMPLETE</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-tglb6/igt@gem_exec_reloc@readonly-31.html">TI=
MEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_reloc@readonly-32} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@gem_exec_reloc@readonly-32.html">I=
NCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-iclb7/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10189/shard-iclb6/igt@runner@aborted.html">FAIL</a>) ([i915#2782] / =
[i915#3002]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5898/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb5/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_58=
98/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-iclb2/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/sh=
ard-iclb4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2782] / [=
i915#3002])</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb8/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10189/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10189/shard-tglb6/igt@runner@ab=
orted.html">FAIL</a>) ([i915#1436] / [i915#2426] / [i915#2966] / [i915#3002=
] / [i915#409]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5898/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5898/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898=
/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb6/igt@runner@aborted.html">FA=
IL</a>) ([i915#1436] / [i915#2426] / [i915#2966] / [i915#3002])</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10189_full and IGTPW_5898_=
full:</p>
<h3>New IGT tests (107)</h3>
<ul>
<li>
<p>igt@gem_exec_reloc@cpu-12:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-13:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-14:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-15:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-16:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.30, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-17:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-18:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-19:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.12, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-20:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-21:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.29, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-22:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.09, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-23:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-24:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.34, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-25:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.18, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-26:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.27, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-27:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.80, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-28:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.89, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-29:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.77, 6.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-30:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.41, 13.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-31:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.70, 18.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@cpu-32:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.36, 15.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-12:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.13, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-13:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.27, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-14:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-15:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-16:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.06, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-17:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-18:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-19:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-20:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.10, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-21:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.14, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-22:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.41, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-23:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.60, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-24:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.66, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-25:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.45, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-26:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.96, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-27:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.85, 5.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-28:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.19, 17.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-29:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.44, 29.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [23.55, 58.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-31:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [34.70, 115.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@gtt-32:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.15, 99.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@invalid-domains:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-12:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.31, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-13:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.12, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-14:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.31, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-15:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-16:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.08, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-17:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.42, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-18:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.14, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-19:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-20:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-21:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-22:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-23:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-24:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.10, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-25:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.15, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-26:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.34, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-27:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.24, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-28:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.34, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-29:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.49, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-30:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.93, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-31:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.96, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@mmap-32:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.41, 5.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-12:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.32, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-13:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.29, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-14:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.32, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-15:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-17:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.10, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-18:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-19:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.14, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-20:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.23, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-21:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.52, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-22:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.25, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-23:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.50, 3.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-24:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.90, 7.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-25:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.97, 11.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-26:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.36, 17.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-27:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [17.81, 70.74] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-28:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.47, 67.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-29:</p>
<ul>
<li>Statuses : 1 incomplete(s) 4 pass(s) 1 timeout(s)</li>
<li>Exec time: [0.0, 170.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-30:</p>
<ul>
<li>Statuses : 1 incomplete(s) 2 pass(s) 2 timeout(s)</li>
<li>Exec time: [0.0, 247.28] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-31:</p>
<ul>
<li>Statuses : 5 incomplete(s) 1 timeout(s)</li>
<li>Exec time: [0.0, 162.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@readonly-32:</p>
<ul>
<li>Statuses : 2 incomplete(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-12:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-13:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-14:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-15:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-16:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.12, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-17:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-18:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-19:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-20:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-21:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-22:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.12, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-23:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.15, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-24:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.26, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-25:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.39, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-26:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.73, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-27:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.38, 2.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-28:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.80, 5.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-29:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [5.40, 11.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-30:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [14.72, 19.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-31:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [21.05, 38.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@wc-32:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 42.72] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5898_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_import_export@flink:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-tglb3/igt@drm_import_export@flink.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-tglb2/=
igt@drm_import_export@flink.html">INCOMPLETE</a> ([i915#750]) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-snb7/igt@gem_ctx_persistence@engines-queued.=
html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</=
a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-apl3/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shard-k=
bl7/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html"=
>FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/=
shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2=
842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/sh=
ard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]=
) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_reloc@readonly-32} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-glk9/igt@gem_exec_reloc@readonly-32.html">SK=
IP</a> ([fdo#109271]) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-iclb7/igt@gem_exec_whisper@basic-contexts-forked.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_58=
98/shard-iclb7/igt@gem_exec_whisper@basic-contexts-forked.html">INCOMPLETE<=
/a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-glk9/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shar=
d-glk6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/shar=
d-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-snb2/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-tglb3/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-iclb8/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-snb7/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> ([i915#2724])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-apl3/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-iclb5/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-glk9/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-kbl1/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-tglb3/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> ([i915#3318])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-apl2/igt@gem_workarounds@suspend-resume-fd.h=
tml">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-kbl3/igt@i915_hangman@engine-error@vecs0.htm=
l">SKIP</a> ([fdo#109271]) +162 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-glk8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-apl8/igt@i915_selftest@live@execlists.html">=
DMESG-FAIL</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-apl8/igt@kms_chamelium@dp-hpd-storm-disable.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-glk7/igt@kms_chamelium@hdmi-aspect-ratio.html=
">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-tglb5/igt@kms_chamelium@hdmi-aspect-ratio.htm=
l">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-apl2/igt@kms_content_protection@atomic.html"=
>TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-kbl1/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-apl8/igt@kms_content_protection@uevent.html"=
>FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10189/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5898/=
shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([=
i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-32x10-=
onscreen.html">SKIP</a> ([fdo#109278]) +11 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5898/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-=
onscreen.html">SKIP</a> ([i915#3359]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5898/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-random.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7476900527918254007==--

--===============0725117853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0725117853==--
