Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 Feb 2020 13:59:26 -0000
Message-ID: <158168876626.9930.11522027488794103618@emeril.freedesktop.org>
References: <20200214125254.2420-1-satyavathi.k@intel.com>
In-Reply-To: <20200214125254.2420-1-satyavathi.k@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengin?=
 =?utf-8?q?e_to_utilize_all_available_engines=2E?=
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
To: satyavat <satyavathi.k@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all available engines.
URL   : https://patchwork.freedesktop.org/series/73463/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7939 -> IGTPW_4152
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4152 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4152, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4152:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ringfill@basic-default-forked:
    - fi-icl-u3:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-icl-u3/igt@gem_ringfill@basic-default-forked.html
    - fi-icl-y:           [PASS][2] -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-icl-y/igt@gem_ringfill@basic-default-forked.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-icl-y/igt@gem_ringfill@basic-default-forked.html
    - fi-icl-u2:          [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-icl-u2/igt@gem_ringfill@basic-default-forked.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-icl-u2/igt@gem_ringfill@basic-default-forked.html
    - fi-cml-u2:          [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-cml-u2/igt@gem_ringfill@basic-default-forked.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-cml-u2/igt@gem_ringfill@basic-default-forked.html
    - fi-icl-dsi:         [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-icl-dsi/igt@gem_ringfill@basic-default-forked.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-icl-dsi/igt@gem_ringfill@basic-default-forked.html
    - fi-ilk-650:         [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-ilk-650/igt@gem_ringfill@basic-default-forked.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-ilk-650/igt@gem_ringfill@basic-default-forked.html
    - fi-icl-guc:         [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-icl-guc/igt@gem_ringfill@basic-default-forked.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-icl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-cml-s:           [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-cml-s/igt@gem_ringfill@basic-default-forked.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-cml-s/igt@gem_ringfill@basic-default-forked.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ringfill@basic-default-forked:
    - {fi-tgl-u}:         [PASS][16] -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-tgl-u/igt@gem_ringfill@basic-default-forked.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-tgl-u/igt@gem_ringfill@basic-default-forked.html
    - {fi-tgl-dsi}:       [PASS][18] -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-tgl-dsi/igt@gem_ringfill@basic-default-forked.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-tgl-dsi/igt@gem_ringfill@basic-default-forked.html

  
Known issues
------------

  Here are the changes found in IGTPW_4152 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][20] -> [INCOMPLETE][21] ([i915#45])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_ringfill@basic-default-forked:
    - fi-kbl-x1275:       [PASS][22] -> [SKIP][23] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-kbl-x1275/igt@gem_ringfill@basic-default-forked.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-kbl-x1275/igt@gem_ringfill@basic-default-forked.html
    - fi-kbl-7500u:       [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-kbl-7500u/igt@gem_ringfill@basic-default-forked.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-kbl-7500u/igt@gem_ringfill@basic-default-forked.html
    - fi-hsw-4770r:       [PASS][26] -> [SKIP][27] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-hsw-4770r/igt@gem_ringfill@basic-default-forked.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-hsw-4770r/igt@gem_ringfill@basic-default-forked.html
    - fi-kbl-guc:         [PASS][28] -> [SKIP][29] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-kbl-guc/igt@gem_ringfill@basic-default-forked.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-kbl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-skl-guc:         [PASS][30] -> [SKIP][31] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-skl-guc/igt@gem_ringfill@basic-default-forked.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-skl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-kbl-8809g:       [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-kbl-8809g/igt@gem_ringfill@basic-default-forked.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-kbl-8809g/igt@gem_ringfill@basic-default-forked.html
    - fi-blb-e6850:       [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-blb-e6850/igt@gem_ringfill@basic-default-forked.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-blb-e6850/igt@gem_ringfill@basic-default-forked.html
    - fi-bsw-nick:        [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-bsw-nick/igt@gem_ringfill@basic-default-forked.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-bsw-nick/igt@gem_ringfill@basic-default-forked.html
    - fi-bdw-5557u:       [PASS][38] -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-bdw-5557u/igt@gem_ringfill@basic-default-forked.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-bdw-5557u/igt@gem_ringfill@basic-default-forked.html
    - fi-apl-guc:         [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-apl-guc/igt@gem_ringfill@basic-default-forked.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-apl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-cfl-8109u:       [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-cfl-8109u/igt@gem_ringfill@basic-default-forked.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-cfl-8109u/igt@gem_ringfill@basic-default-forked.html
    - fi-snb-2520m:       [PASS][44] -> [SKIP][45] ([fdo#109271])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-snb-2520m/igt@gem_ringfill@basic-default-forked.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-snb-2520m/igt@gem_ringfill@basic-default-forked.html
    - fi-cfl-8700k:       [PASS][46] -> [SKIP][47] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-cfl-8700k/igt@gem_ringfill@basic-default-forked.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-cfl-8700k/igt@gem_ringfill@basic-default-forked.html
    - fi-bxt-dsi:         [PASS][48] -> [SKIP][49] ([fdo#109271])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-bxt-dsi/igt@gem_ringfill@basic-default-forked.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-bxt-dsi/igt@gem_ringfill@basic-default-forked.html
    - fi-pnv-d510:        [PASS][50] -> [SKIP][51] ([fdo#109271])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-pnv-d510/igt@gem_ringfill@basic-default-forked.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-pnv-d510/igt@gem_ringfill@basic-default-forked.html
    - fi-bsw-n3050:       [PASS][52] -> [SKIP][53] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-bsw-n3050/igt@gem_ringfill@basic-default-forked.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-bsw-n3050/igt@gem_ringfill@basic-default-forked.html
    - fi-hsw-4770:        [PASS][54] -> [SKIP][55] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-hsw-4770/igt@gem_ringfill@basic-default-forked.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-hsw-4770/igt@gem_ringfill@basic-default-forked.html
    - fi-cfl-guc:         [PASS][56] -> [SKIP][57] ([fdo#109271])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-cfl-guc/igt@gem_ringfill@basic-default-forked.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-cfl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-skl-6700k2:      [PASS][58] -> [SKIP][59] ([fdo#109271])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-skl-6700k2/igt@gem_ringfill@basic-default-forked.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-skl-6700k2/igt@gem_ringfill@basic-default-forked.html
    - fi-skl-lmem:        [PASS][60] -> [SKIP][61] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-skl-lmem/igt@gem_ringfill@basic-default-forked.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-skl-lmem/igt@gem_ringfill@basic-default-forked.html
    - fi-snb-2600:        [PASS][62] -> [SKIP][63] ([fdo#109271])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-snb-2600/igt@gem_ringfill@basic-default-forked.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-snb-2600/igt@gem_ringfill@basic-default-forked.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [PASS][64] -> [DMESG-FAIL][65] ([i915#877])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][66] ([fdo#108569]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-icl-y/igt@i915_selftest@live_execlists.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-icl-y/igt@i915_selftest@live_execlists.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [FAIL][68] ([i915#579]) -> [SKIP][69] ([fdo#109271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (44 -> 44)
------------------------------

  Additional (7): fi-hsw-peppy fi-glk-dsi fi-ivb-3770 fi-icl-u3 fi-bsw-kefka fi-skl-6600u fi-kbl-r 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bwr-2160 fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5441 -> IGTPW_4152

  CI-20190529: 20190529
  CI_DRM_7939: cceb0c30a34af6ca96e35211ecdc5ca198d44e7e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4152: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/index.html
  IGT_5441: 534ca091fe4ffed916752165bc5becd7ff56cd84 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ringfill@basic
+igt@gem_ringfill@basic-fd
+igt@gem_ringfill@basic-forked
+igt@gem_ringfill@basic-hang
+igt@gem_ringfill@basic-interruptible
+igt@gem_ringfill@-bomb
+igt@gem_ringfill@-child
+igt@gem_ringfill@-s3
+igt@gem_ringfill@-s4
-igt@gem_ringfill@basic-default
-igt@gem_ringfill@basic-default-fd
-igt@gem_ringfill@basic-default-forked
-igt@gem_ringfill@basic-default-hang
-igt@gem_ringfill@basic-default-interruptible
-igt@gem_ringfill@blt
-igt@gem_ringfill@blt-bomb
-igt@gem_ringfill@blt-child
-igt@gem_ringfill@blt-fd
-igt@gem_ringfill@blt-forked
-igt@gem_ringfill@blt-hang
-igt@gem_ringfill@blt-interruptible
-igt@gem_ringfill@blt-s3
-igt@gem_ringfill@blt-s4
-igt@gem_ringfill@bsd
-igt@gem_ringfill@bsd1
-igt@gem_ringfill@bsd1-bomb
-igt@gem_ringfill@bsd1-child
-igt@gem_ringfill@bsd1-fd
-igt@gem_ringfill@bsd1-forked
-igt@gem_ringfill@bsd1-hang
-igt@gem_ringfill@bsd1-interruptible
-igt@gem_ringfill@bsd1-s3
-igt@gem_ringfill@bsd1-s4
-igt@gem_ringfill@bsd2
-igt@gem_ringfill@bsd2-bomb
-igt@gem_ringfill@bsd2-child
-igt@gem_ringfill@bsd2-fd
-igt@gem_ringfill@bsd2-forked
-igt@gem_ringfill@bsd2-hang
-igt@gem_ringfill@bsd2-interruptible
-igt@gem_ringfill@bsd2-s3
-igt@gem_ringfill@bsd2-s4
-igt@gem_ringfill@bsd-bomb
-igt@gem_ringfill@bsd-child
-igt@gem_ringfill@bsd-fd
-igt@gem_ringfill@bsd-forked
-igt@gem_ringfill@bsd-hang
-igt@gem_ringfill@bsd-interruptible
-igt@gem_ringfill@bsd-s3
-igt@gem_ringfill@bsd-s4
-igt@gem_ringfill@default-bomb
-igt@gem_ringfill@default-child
-igt@gem_ringfill@default-s3
-igt@gem_ringfill@default-s4
-igt@gem_ringfill@render
-igt@gem_ringfill@render-bomb
-igt@gem_ringfill@render-child
-igt@gem_ringfill@render-fd
-igt@gem_ringfill@render-forked
-igt@gem_ringfill@render-hang
-igt@gem_ringfill@render-interruptible
-igt@gem_ringfill@render-s3
-igt@gem_ringfill@render-s4
-igt@gem_ringfill@vebox
-igt@gem_ringfill@vebox-bomb
-igt@gem_ringfill@vebox-child
-igt@gem_ringfill@vebox-fd
-igt@gem_ringfill@vebox-forked
-igt@gem_ringfill@vebox-hang
-igt@gem_ringfill@vebox-interruptible
-igt@gem_ringfill@vebox-s3
-igt@gem_ringfill@vebox-s4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4152/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
