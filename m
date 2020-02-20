Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 13:55:28 -0000
Message-ID: <158220692852.17409.2903261018675001177@emeril.freedesktop.org>
References: <20200220125207.16423-1-petri.latvala@intel.com>
In-Reply-To: <20200220125207.16423-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib=3A_Update_selftests_to_use?=
 =?utf-8?q?_dynamic_subtests?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib: Update selftests to use dynamic subtests
URL   : https://patchwork.freedesktop.org/series/73710/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7973 -> IGTPW_4193
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4193 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4193, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4193:

### IGT changes ###

#### Possible regressions ####

  * igt@dmabuf@sanitycheck:
    - fi-icl-u3:          [PASS][1] -> [SKIP][2] +29 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@dmabuf@sanitycheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-u3/igt@dmabuf@sanitycheck.html

  * {igt@i915_selftest@live@gt_lrc} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [DMESG-FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-tgl-dsi/igt@i915_selftest@live@gt_lrc.html
    - {fi-tgl-u}:         NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-tgl-u/igt@i915_selftest@live@gt_lrc.html

  * {igt@i915_selftest@live@gt_pm} (NEW):
    - {fi-ehl-1}:         NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-ehl-1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live_evict:
    - fi-cml-u2:          [PASS][6] -> [SKIP][7] +31 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cml-u2/igt@i915_selftest@live_evict.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-cml-u2/igt@i915_selftest@live_evict.html

  * igt@i915_selftest@live_gt_contexts:
    - fi-icl-guc:         [PASS][8] -> [SKIP][9] +30 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-guc/igt@i915_selftest@live_gt_contexts.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-guc/igt@i915_selftest@live_gt_contexts.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-icl-dsi:         [PASS][10] -> [SKIP][11] +30 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-dsi/igt@i915_selftest@live_gt_heartbeat.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-dsi/igt@i915_selftest@live_gt_heartbeat.html

  * igt@i915_selftest@live_gt_mocs:
    - fi-icl-y:           [PASS][12] -> [SKIP][13] +30 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-y/igt@i915_selftest@live_gt_mocs.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-y/igt@i915_selftest@live_gt_mocs.html

  * igt@i915_selftest@live_hugepages:
    - fi-icl-u2:          [PASS][14] -> [SKIP][15] +30 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u2/igt@i915_selftest@live_hugepages.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-u2/igt@i915_selftest@live_hugepages.html

  * igt@i915_selftest@live_uncore:
    - fi-cml-s:           [PASS][16] -> [SKIP][17] +30 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cml-s/igt@i915_selftest@live_uncore.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-cml-s/igt@i915_selftest@live_uncore.html

  
#### Warnings ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][18] ([i915#877]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@dmabuf@dma_fence:
    - {fi-ehl-1}:         [PASS][20] -> [SKIP][21] +30 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-ehl-1/igt@dmabuf@dma_fence.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-ehl-1/igt@dmabuf@dma_fence.html

  * igt@i915_selftest@live_execlists:
    - {fi-tgl-dsi}:       [PASS][22] -> [SKIP][23] +30 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-dsi/igt@i915_selftest@live_execlists.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-tgl-dsi/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gt_lrc:
    - {fi-tgl-dsi}:       [DMESG-FAIL][24] ([i915#1233]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-dsi/igt@i915_selftest@live_gt_lrc.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-tgl-dsi/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_gt_pm:
    - {fi-ehl-1}:         [DMESG-FAIL][26] ([i915#801]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-ehl-1/igt@i915_selftest@live_gt_pm.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-ehl-1/igt@i915_selftest@live_gt_pm.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7973 and IGTPW_4193:

### New IGT tests (34) ###

  * igt@dmabuf@all:
    - Statuses :
    - Exec time: [None] s

  * igt@dmabuf@all@dma_fence:
    - Statuses : 39 pass(s)
    - Exec time: [0.13, 0.23] s

  * igt@dmabuf@all@sanitycheck:
    - Statuses : 39 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@i915_selftest@live:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@live@active:
    - Statuses : 39 pass(s)
    - Exec time: [0.42, 2.16] s

  * igt@i915_selftest@live@blt:
    - Statuses : 39 pass(s)
    - Exec time: [0.47, 11.35] s

  * igt@i915_selftest@live@client:
    - Statuses : 39 pass(s)
    - Exec time: [0.47, 6.56] s

  * igt@i915_selftest@live@coherency:
    - Statuses : 39 pass(s)
    - Exec time: [0.83, 15.78] s

  * igt@i915_selftest@live@dmabuf:
    - Statuses : 39 pass(s)
    - Exec time: [0.41, 2.04] s

  * igt@i915_selftest@live@evict:
    - Statuses : 39 pass(s)
    - Exec time: [0.46, 15.20] s

  * igt@i915_selftest@live@execlists:
    - Statuses : 39 pass(s)
    - Exec time: [0.46, 52.23] s

  * igt@i915_selftest@live@gem:
    - Statuses : 39 pass(s)
    - Exec time: [0.53, 6.78] s

  * igt@i915_selftest@live@gem_contexts:
    - Statuses : 39 pass(s)
    - Exec time: [0.46, 31.79] s

  * igt@i915_selftest@live@gt_contexts:
    - Statuses : 40 pass(s)
    - Exec time: [0.42, 2.19] s

  * igt@i915_selftest@live@gt_engines:
    - Statuses : 40 pass(s)
    - Exec time: [0.41, 2.11] s

  * igt@i915_selftest@live@gt_heartbeat:
    - Statuses : 39 pass(s)
    - Exec time: [0.49, 2.22] s

  * igt@i915_selftest@live@gt_lrc:
    - Statuses : 2 dmesg-fail(s) 1 incomplete(s) 37 pass(s)
    - Exec time: [0.0, 4.00] s

  * igt@i915_selftest@live@gt_mocs:
    - Statuses : 39 pass(s)
    - Exec time: [0.45, 2.52] s

  * igt@i915_selftest@live@gt_pm:
    - Statuses : 1 dmesg-fail(s) 38 pass(s)
    - Exec time: [0.96, 2.86] s

  * igt@i915_selftest@live@gt_timelines:
    - Statuses : 40 pass(s)
    - Exec time: [1.54, 16.75] s

  * igt@i915_selftest@live@gtt:
    - Statuses : 39 pass(s)
    - Exec time: [3.28, 11.92] s

  * igt@i915_selftest@live@hangcheck:
    - Statuses : 39 pass(s)
    - Exec time: [1.54, 28.85] s

  * igt@i915_selftest@live@hugepages:
    - Statuses : 39 pass(s)
    - Exec time: [0.47, 10.23] s

  * igt@i915_selftest@live@late_gt_pm:
    - Statuses : 39 pass(s)
    - Exec time: [0.44, 2.15] s

  * igt@i915_selftest@live@memory_region:
    - Statuses : 39 pass(s)
    - Exec time: [0.40, 2.04] s

  * igt@i915_selftest@live@mman:
    - Statuses : 39 pass(s)
    - Exec time: [2.04, 17.68] s

  * igt@i915_selftest@live@objects:
    - Statuses : 39 pass(s)
    - Exec time: [0.75, 6.90] s

  * igt@i915_selftest@live@perf:
    - Statuses : 39 pass(s)
    - Exec time: [0.46, 2.24] s

  * igt@i915_selftest@live@requests:
    - Statuses : 39 pass(s)
    - Exec time: [1.99, 10.35] s

  * igt@i915_selftest@live@reset:
    - Statuses : 39 pass(s)
    - Exec time: [0.40, 2.63] s

  * igt@i915_selftest@live@sanitycheck:
    - Statuses : 40 pass(s)
    - Exec time: [0.40, 2.08] s

  * igt@i915_selftest@live@uncore:
    - Statuses : 40 pass(s)
    - Exec time: [0.43, 2.06] s

  * igt@i915_selftest@live@vma:
    - Statuses : 39 pass(s)
    - Exec time: [0.41, 2.09] s

  * igt@i915_selftest@live@workarounds:
    - Statuses : 40 pass(s)
    - Exec time: [0.47, 2.63] s

  

Known issues
------------

  Here are the changes found in IGTPW_4193 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@sanitycheck:
    - fi-tgl-y:           [PASS][28] -> [SKIP][29] ([CI#94]) +30 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@dmabuf@sanitycheck.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-tgl-y/igt@dmabuf@sanitycheck.html
    - fi-glk-dsi:         [PASS][30] -> [SKIP][31] ([fdo#109271]) +31 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-glk-dsi/igt@dmabuf@sanitycheck.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-glk-dsi/igt@dmabuf@sanitycheck.html

  * igt@i915_selftest@live_active:
    - fi-bdw-5557u:       [PASS][32] -> [SKIP][33] ([fdo#109271]) +31 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-bdw-5557u/igt@i915_selftest@live_active.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-bdw-5557u/igt@i915_selftest@live_active.html
    - fi-snb-2600:        [PASS][34] -> [SKIP][35] ([fdo#109271]) +31 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-snb-2600/igt@i915_selftest@live_active.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-snb-2600/igt@i915_selftest@live_active.html

  * igt@i915_selftest@live_coherency:
    - fi-byt-n2820:       [PASS][36] -> [SKIP][37] ([fdo#109271]) +31 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-byt-n2820/igt@i915_selftest@live_coherency.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-byt-n2820/igt@i915_selftest@live_coherency.html

  * igt@i915_selftest@live_dmabuf:
    - fi-hsw-4770r:       [PASS][38] -> [SKIP][39] ([fdo#109271]) +31 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-hsw-4770r/igt@i915_selftest@live_dmabuf.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-hsw-4770r/igt@i915_selftest@live_dmabuf.html
    - fi-kbl-r:           [PASS][40] -> [SKIP][41] ([fdo#109271]) +31 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-kbl-r/igt@i915_selftest@live_dmabuf.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-kbl-r/igt@i915_selftest@live_dmabuf.html

  * igt@i915_selftest@live_execlists:
    - fi-bsw-nick:        [PASS][42] -> [SKIP][43] ([fdo#109271]) +31 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-bsw-nick/igt@i915_selftest@live_execlists.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-bsw-nick/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-apl-guc:         [PASS][44] -> [SKIP][45] ([fdo#109271]) +31 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-apl-guc/igt@i915_selftest@live_gem_contexts.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-apl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-kbl-x1275:       [PASS][46] -> [SKIP][47] ([fdo#109271]) +31 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-kbl-x1275/igt@i915_selftest@live_gt_heartbeat.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-kbl-x1275/igt@i915_selftest@live_gt_heartbeat.html
    - fi-cfl-8700k:       [PASS][48] -> [SKIP][49] ([fdo#109271]) +31 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cfl-8700k/igt@i915_selftest@live_gt_heartbeat.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-cfl-8700k/igt@i915_selftest@live_gt_heartbeat.html

  * igt@i915_selftest@live_gt_mocs:
    - fi-blb-e6850:       [PASS][50] -> [SKIP][51] ([fdo#109271]) +31 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-blb-e6850/igt@i915_selftest@live_gt_mocs.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-blb-e6850/igt@i915_selftest@live_gt_mocs.html

  * igt@i915_selftest@live_gt_pm:
    - fi-cfl-8109u:       [PASS][52] -> [SKIP][53] ([fdo#109271]) +31 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cfl-8109u/igt@i915_selftest@live_gt_pm.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-cfl-8109u/igt@i915_selftest@live_gt_pm.html
    - fi-kbl-7500u:       [PASS][54] -> [SKIP][55] ([fdo#109271]) +31 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-kbl-7500u/igt@i915_selftest@live_gt_pm.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-kbl-7500u/igt@i915_selftest@live_gt_pm.html

  * igt@i915_selftest@live_gtt:
    - fi-kbl-guc:         [PASS][56] -> [SKIP][57] ([fdo#109271]) +31 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-kbl-guc/igt@i915_selftest@live_gtt.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-kbl-guc/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_late_gt_pm:
    - fi-bsw-kefka:       [PASS][58] -> [SKIP][59] ([fdo#109271]) +31 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-bsw-kefka/igt@i915_selftest@live_late_gt_pm.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-bsw-kefka/igt@i915_selftest@live_late_gt_pm.html
    - fi-skl-6600u:       [PASS][60] -> [SKIP][61] ([fdo#109271]) +31 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html

  * igt@i915_selftest@live_mman:
    - fi-bxt-dsi:         [PASS][62] -> [SKIP][63] ([fdo#109271]) +31 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-bxt-dsi/igt@i915_selftest@live_mman.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-bxt-dsi/igt@i915_selftest@live_mman.html
    - fi-gdg-551:         [PASS][64] -> [SKIP][65] ([fdo#109271]) +31 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-gdg-551/igt@i915_selftest@live_mman.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-gdg-551/igt@i915_selftest@live_mman.html

  * igt@i915_selftest@live_perf:
    - fi-skl-6700k2:      [PASS][66] -> [SKIP][67] ([fdo#109271]) +31 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-skl-6700k2/igt@i915_selftest@live_perf.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-skl-6700k2/igt@i915_selftest@live_perf.html

  * igt@i915_selftest@live_requests:
    - fi-hsw-peppy:       [PASS][68] -> [SKIP][69] ([fdo#109271]) +31 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-hsw-peppy/igt@i915_selftest@live_requests.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-hsw-peppy/igt@i915_selftest@live_requests.html
    - fi-icl-dsi:         [PASS][70] -> [SKIP][71] ([fdo#109644] / [fdo#110464])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-dsi/igt@i915_selftest@live_requests.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-dsi/igt@i915_selftest@live_requests.html
    - fi-icl-y:           [PASS][72] -> [SKIP][73] ([fdo#109644] / [fdo#110464])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-y/igt@i915_selftest@live_requests.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-y/igt@i915_selftest@live_requests.html
    - fi-icl-u3:          [PASS][74] -> [SKIP][75] ([fdo#109644] / [fdo#110464])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@i915_selftest@live_requests.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-u3/igt@i915_selftest@live_requests.html
    - fi-icl-guc:         [PASS][76] -> [SKIP][77] ([fdo#109644] / [fdo#110464])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-guc/igt@i915_selftest@live_requests.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-guc/igt@i915_selftest@live_requests.html
    - fi-icl-u2:          [PASS][78] -> [SKIP][79] ([fdo#109644] / [fdo#110464])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u2/igt@i915_selftest@live_requests.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-u2/igt@i915_selftest@live_requests.html

  * igt@i915_selftest@live_reset:
    - fi-snb-2520m:       [PASS][80] -> [SKIP][81] ([fdo#109271]) +31 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-snb-2520m/igt@i915_selftest@live_reset.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-snb-2520m/igt@i915_selftest@live_reset.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-hsw-4770:        [PASS][82] -> [SKIP][83] ([fdo#109271]) +31 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-hsw-4770/igt@i915_selftest@live_sanitycheck.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-hsw-4770/igt@i915_selftest@live_sanitycheck.html

  * igt@i915_selftest@live_workarounds:
    - fi-ilk-650:         [PASS][84] -> [SKIP][85] ([fdo#109271]) +31 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-ilk-650/igt@i915_selftest@live_workarounds.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-ilk-650/igt@i915_selftest@live_workarounds.html
    - fi-bsw-n3050:       [PASS][86] -> [SKIP][87] ([fdo#109271]) +31 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-bsw-n3050/igt@i915_selftest@live_workarounds.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-bsw-n3050/igt@i915_selftest@live_workarounds.html
    - fi-cfl-guc:         [PASS][88] -> [SKIP][89] ([fdo#109271]) +31 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cfl-guc/igt@i915_selftest@live_workarounds.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-cfl-guc/igt@i915_selftest@live_workarounds.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch:
    - fi-tgl-y:           [PASS][90] -> [DMESG-WARN][91] ([CI#94] / [i915#402]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-tgl-y/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html

  
#### Possible fixes ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [FAIL][92] ([i915#217]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][94] ([CI#94] / [i915#402]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Warnings ####

  * igt@i915_selftest@live_gt_lrc:
    - fi-tgl-y:           [DMESG-FAIL][96] ([CI#94] / [i915#1233]) -> [SKIP][97] ([CI#94])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@i915_selftest@live_gt_lrc.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-tgl-y/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-icl-u3:          [DMESG-WARN][98] ([i915#585]) -> [SKIP][99] ([i915#585])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109644]: https://bugs.freedesktop.org/show_bug.cgi?id=109644
  [fdo#110464]: https://bugs.freedesktop.org/show_bug.cgi?id=110464
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#801]: https://gitlab.freedesktop.org/drm/intel/issues/801
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (49 -> 43)
------------------------------

  Additional (4): fi-kbl-soraka fi-skl-lmem fi-ivb-3770 fi-pnv-d510 
  Missing    (10): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-bdw-gvtdvm fi-skl-guc fi-byt-squawks fi-bwr-2160 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4193

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4193: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@dmabuf@all
+igt@drm_mm@all
+igt@i915_selftest@live
+igt@i915_selftest@mock
+igt@i915_selftest@perf
+igt@kms_selftest@all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
