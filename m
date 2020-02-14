Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 Feb 2020 23:05:11 -0000
Message-ID: <158172151139.9929.11321428191512769690@emeril.freedesktop.org>
References: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBV?=
 =?utf-8?q?pdate_selftests_to_use_dynamic_subtests?=
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

Series: lib: Update selftests to use dynamic subtests
URL   : https://patchwork.freedesktop.org/series/73486/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7943 -> IGTPW_4158
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4158 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4158, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4158:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_evict:
    - fi-cml-u2:          [PASS][1] -> [SKIP][2] +31 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-cml-u2/igt@i915_selftest@live_evict.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-cml-u2/igt@i915_selftest@live_evict.html

  * igt@i915_selftest@live_gt_contexts:
    - fi-icl-guc:         [PASS][3] -> [SKIP][4] +30 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-guc/igt@i915_selftest@live_gt_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-guc/igt@i915_selftest@live_gt_contexts.html

  * igt@i915_selftest@live_gt_mocs:
    - fi-icl-y:           [PASS][5] -> [SKIP][6] +29 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-y/igt@i915_selftest@live_gt_mocs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-y/igt@i915_selftest@live_gt_mocs.html

  * igt@i915_selftest@live_hugepages:
    - fi-icl-u2:          [PASS][7] -> [SKIP][8] +30 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-u2/igt@i915_selftest@live_hugepages.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-u2/igt@i915_selftest@live_hugepages.html

  * igt@i915_selftest@live_reset:
    - fi-icl-dsi:         [PASS][9] -> [SKIP][10] +30 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-dsi/igt@i915_selftest@live_reset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-dsi/igt@i915_selftest@live_reset.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-icl-u3:          [PASS][11] -> [SKIP][12] +30 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html

  * igt@i915_selftest@live_uncore:
    - fi-cml-s:           [PASS][13] -> [SKIP][14] +31 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-cml-s/igt@i915_selftest@live_uncore.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-cml-s/igt@i915_selftest@live_uncore.html

  * igt@runner@aborted:
    - fi-kbl-7500u:       NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-kbl-7500u/igt@runner@aborted.html

  
#### Warnings ####

  * igt@i915_selftest@live_active:
    - fi-icl-y:           [DMESG-FAIL][16] ([i915#765]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-y/igt@i915_selftest@live_active.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-y/igt@i915_selftest@live_active.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live_client:
    - {fi-tgl-u}:         [PASS][18] -> [SKIP][19] +31 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-tgl-u/igt@i915_selftest@live_client.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-tgl-u/igt@i915_selftest@live_client.html

  * igt@i915_selftest@live_execlists:
    - {fi-tgl-dsi}:       [PASS][20] -> [SKIP][21] +31 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-tgl-dsi/igt@i915_selftest@live_execlists.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-tgl-dsi/igt@i915_selftest@live_execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_4158 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@dma_fence:
    - fi-ilk-650:         [PASS][22] -> [SKIP][23] ([fdo#109271]) +31 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-ilk-650/igt@dmabuf@dma_fence.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-ilk-650/igt@dmabuf@dma_fence.html

  * igt@dmabuf@sanitycheck:
    - fi-kbl-x1275:       [PASS][24] -> [SKIP][25] ([fdo#109271]) +31 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-kbl-x1275/igt@dmabuf@sanitycheck.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-kbl-x1275/igt@dmabuf@sanitycheck.html

  * igt@i915_selftest@live_active:
    - fi-bdw-5557u:       [PASS][26] -> [SKIP][27] ([fdo#109271]) +31 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-bdw-5557u/igt@i915_selftest@live_active.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-bdw-5557u/igt@i915_selftest@live_active.html

  * igt@i915_selftest@live_coherency:
    - fi-hsw-4770:        [PASS][28] -> [SKIP][29] ([fdo#109271]) +31 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-hsw-4770/igt@i915_selftest@live_coherency.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-hsw-4770/igt@i915_selftest@live_coherency.html

  * igt@i915_selftest@live_dmabuf:
    - fi-hsw-4770r:       [PASS][30] -> [SKIP][31] ([fdo#109271]) +31 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-hsw-4770r/igt@i915_selftest@live_dmabuf.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-hsw-4770r/igt@i915_selftest@live_dmabuf.html

  * igt@i915_selftest@live_execlists:
    - fi-glk-dsi:         [PASS][32] -> [SKIP][33] ([fdo#109271]) +31 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-glk-dsi/igt@i915_selftest@live_execlists.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-glk-dsi/igt@i915_selftest@live_execlists.html
    - fi-gdg-551:         [PASS][34] -> [SKIP][35] ([fdo#109271]) +31 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-gdg-551/igt@i915_selftest@live_execlists.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-gdg-551/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-apl-guc:         [PASS][36] -> [SKIP][37] ([fdo#109271]) +31 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-apl-guc/igt@i915_selftest@live_gem_contexts.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-apl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gt_contexts:
    - fi-kbl-r:           [PASS][38] -> [SKIP][39] ([fdo#109271]) +31 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-kbl-r/igt@i915_selftest@live_gt_contexts.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-kbl-r/igt@i915_selftest@live_gt_contexts.html

  * igt@i915_selftest@live_gt_engines:
    - fi-kbl-guc:         [PASS][40] -> [SKIP][41] ([fdo#109271]) +31 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-kbl-guc/igt@i915_selftest@live_gt_engines.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-kbl-guc/igt@i915_selftest@live_gt_engines.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-pnv-d510:        [PASS][42] -> [SKIP][43] ([fdo#109271]) +31 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-pnv-d510/igt@i915_selftest@live_gt_heartbeat.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-pnv-d510/igt@i915_selftest@live_gt_heartbeat.html

  * igt@i915_selftest@live_gt_pm:
    - fi-cfl-8700k:       [PASS][44] -> [SKIP][45] ([fdo#109271]) +31 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-cfl-8700k/igt@i915_selftest@live_gt_pm.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-cfl-8700k/igt@i915_selftest@live_gt_pm.html

  * igt@i915_selftest@live_gt_timelines:
    - fi-cfl-guc:         [PASS][46] -> [SKIP][47] ([fdo#109271]) +31 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-cfl-guc/igt@i915_selftest@live_gt_timelines.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-cfl-guc/igt@i915_selftest@live_gt_timelines.html

  * igt@i915_selftest@live_gtt:
    - fi-bwr-2160:        [PASS][48] -> [SKIP][49] ([fdo#109271]) +31 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-bwr-2160/igt@i915_selftest@live_gtt.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-bwr-2160/igt@i915_selftest@live_gtt.html
    - fi-skl-guc:         [PASS][50] -> [SKIP][51] ([fdo#109271]) +31 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-skl-guc/igt@i915_selftest@live_gtt.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-skl-guc/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_late_gt_pm:
    - fi-bsw-kefka:       [PASS][52] -> [SKIP][53] ([fdo#109271]) +31 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-bsw-kefka/igt@i915_selftest@live_late_gt_pm.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-bsw-kefka/igt@i915_selftest@live_late_gt_pm.html

  * igt@i915_selftest@live_mman:
    - fi-bxt-dsi:         [PASS][54] -> [SKIP][55] ([fdo#109271]) +31 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-bxt-dsi/igt@i915_selftest@live_mman.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-bxt-dsi/igt@i915_selftest@live_mman.html

  * igt@i915_selftest@live_objects:
    - fi-snb-2600:        [PASS][56] -> [SKIP][57] ([fdo#109271]) +31 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-snb-2600/igt@i915_selftest@live_objects.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-snb-2600/igt@i915_selftest@live_objects.html

  * igt@i915_selftest@live_perf:
    - fi-skl-6700k2:      [PASS][58] -> [SKIP][59] ([fdo#109271]) +31 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-skl-6700k2/igt@i915_selftest@live_perf.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-skl-6700k2/igt@i915_selftest@live_perf.html

  * igt@i915_selftest@live_requests:
    - fi-icl-guc:         [PASS][60] -> [SKIP][61] ([fdo#109644] / [fdo#110464])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-guc/igt@i915_selftest@live_requests.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-guc/igt@i915_selftest@live_requests.html
    - fi-icl-dsi:         [PASS][62] -> [SKIP][63] ([fdo#109644] / [fdo#110464])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-dsi/igt@i915_selftest@live_requests.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-dsi/igt@i915_selftest@live_requests.html
    - fi-icl-u2:          [PASS][64] -> [SKIP][65] ([fdo#109644] / [fdo#110464])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-u2/igt@i915_selftest@live_requests.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-u2/igt@i915_selftest@live_requests.html
    - fi-icl-y:           [PASS][66] -> [SKIP][67] ([fdo#109644] / [fdo#110464])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-y/igt@i915_selftest@live_requests.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-y/igt@i915_selftest@live_requests.html
    - fi-icl-u3:          [PASS][68] -> [SKIP][69] ([fdo#109644] / [fdo#110464])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-icl-u3/igt@i915_selftest@live_requests.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-icl-u3/igt@i915_selftest@live_requests.html

  * igt@i915_selftest@live_reset:
    - fi-snb-2520m:       [PASS][70] -> [SKIP][71] ([fdo#109271]) +31 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-snb-2520m/igt@i915_selftest@live_reset.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-snb-2520m/igt@i915_selftest@live_reset.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][72] ([i915#45]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@basic:
    - {fi-ehl-1}:         [FAIL][74] ([i915#996]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7943/fi-ehl-1/igt@gem_exec_parallel@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/fi-ehl-1/igt@gem_exec_parallel@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109644]: https://bugs.freedesktop.org/show_bug.cgi?id=109644
  [fdo#110464]: https://bugs.freedesktop.org/show_bug.cgi?id=110464
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765
  [i915#996]: https://gitlab.freedesktop.org/drm/intel/issues/996


Participating hosts (41 -> 44)
------------------------------

  Additional (9): fi-kbl-soraka fi-bsw-n3050 fi-hsw-peppy fi-ivb-3770 fi-cfl-8109u fi-skl-lmem fi-blb-e6850 fi-bsw-nick fi-skl-6600u 
  Missing    (6): fi-hsw-4200u fi-byt-j1900 fi-byt-squawks fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5442 -> IGTPW_4158

  CI-20190529: 20190529
  CI_DRM_7943: 865945b076689b2e99bc1c52fad95cec05cff9ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4158: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/index.html
  IGT_5442: 3f6080996885b997685f08ecb8b416b2dc485290 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@dmabuf@all
+igt@drm_mm@all
+igt@i915_selftest@live
+igt@i915_selftest@mock
+igt@i915_selftest@perf
+igt@kms_selftest@all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4158/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
