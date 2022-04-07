Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7948886194049911419=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 07 Apr 2022 15:32:39 -0000
Message-ID: <164934555947.14673.10981914047286861898@emeril.freedesktop.org>
References: <20220407051908.3390083-1-lucas.demarchi@intel.com>
In-Reply-To: <20220407051908.3390083-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel-ci/fast-feedback=3A_Move_gem=5Flmem=5Fswapping_further_?=
 =?utf-8?b?KHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============7948886194049911419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci/fast-feedback: Move gem_lmem_swapping further (rev2)
URL   : https://patchwork.freedesktop.org/series/102312/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11472 -> IGTPW_6894
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6894 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6894, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/index.html

Participating hosts (47 -> 46)
------------------------------

  Additional (4): bat-hsw-1 bat-rpls-2 bat-adlm-1 bat-adlp-4 
  Missing    (5): shard-tglu fi-bsw-cyan fi-elk-e7500 fi-blb-e6850 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6894:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-rkl-guc:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-tgl-u2:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_lmem_swapping@basic:
    - fi-bsw-nick:        NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@gem_lmem_swapping@basic.html

  * igt@i915_module_load@reload:
    - fi-glk-j4005:       NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-glk-j4005/igt@i915_module_load@reload.html
    - fi-cfl-8700k:       NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8700k/igt@i915_module_load@reload.html
    - fi-apl-guc:         NOTRUN -> [DMESG-FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-apl-guc/igt@i915_module_load@reload.html
    - fi-bxt-dsi:         NOTRUN -> [DMESG-FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bxt-dsi/igt@i915_module_load@reload.html
    - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-4770/igt@i915_module_load@reload.html
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-guc/igt@i915_module_load@reload.html
    - fi-tgl-u2:          NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-tgl-u2/igt@i915_module_load@reload.html
    - fi-bsw-n3050:       NOTRUN -> [DMESG-FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-n3050/igt@i915_module_load@reload.html
    - fi-ivb-3770:        NOTRUN -> [DMESG-FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ivb-3770/igt@i915_module_load@reload.html
    - fi-rkl-guc:         NOTRUN -> [INCOMPLETE][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-rkl-guc/igt@i915_module_load@reload.html
    - fi-skl-6700k2:      NOTRUN -> [DMESG-FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-6700k2/igt@i915_module_load@reload.html
    - fi-bsw-kefka:       NOTRUN -> [DMESG-FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-kefka/igt@i915_module_load@reload.html
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bdw-5557u/igt@i915_module_load@reload.html
    - fi-kbl-x1275:       NOTRUN -> [DMESG-FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-x1275/igt@i915_module_load@reload.html
    - fi-hsw-g3258:       NOTRUN -> [INCOMPLETE][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-g3258/igt@i915_module_load@reload.html
    - fi-snb-2600:        NOTRUN -> [INCOMPLETE][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-snb-2600/igt@i915_module_load@reload.html
    - fi-skl-guc:         NOTRUN -> [INCOMPLETE][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-guc/igt@i915_module_load@reload.html
    - bat-adlp-4:         NOTRUN -> [DMESG-FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-4/igt@i915_module_load@reload.html
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-rkl-11600/igt@i915_module_load@reload.html
    - fi-kbl-guc:         NOTRUN -> [INCOMPLETE][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-guc/igt@i915_module_load@reload.html
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8109u/igt@i915_module_load@reload.html
    - fi-bsw-nick:        NOTRUN -> [DMESG-FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@i915_module_load@reload.html
    - fi-kbl-7500u:       NOTRUN -> [INCOMPLETE][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-7500u/igt@i915_module_load@reload.html

  * igt@kms_chamelium@dp-crc-fast:
    - bat-adlp-4:         NOTRUN -> [SKIP][28] +146 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@basic:
    - fi-bsw-kefka:       [SKIP][29] ([fdo#109271]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-bsw-kefka/igt@gem_lmem_swapping@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-kefka/igt@gem_lmem_swapping@basic.html
    - fi-bsw-n3050:       [SKIP][31] ([fdo#109271]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-bsw-n3050/igt@gem_lmem_swapping@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-n3050/igt@gem_lmem_swapping@basic.html

  * igt@runner@aborted:
    - fi-adl-ddr5:        [FAIL][33] ([i915#4312]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-adl-ddr5/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-adl-ddr5/igt@runner@aborted.html
    - fi-kbl-7567u:       [FAIL][35] ([i915#4312]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-kbl-7567u/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-7567u/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-adls-5}:       NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adls-5/igt@core_hotunplug@unbind-rebind.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-jsl-1/igt@core_hotunplug@unbind-rebind.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_busy@busy:
    - {bat-adlp-6}:       NOTRUN -> [SKIP][41] +146 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-6/igt@gem_busy@busy.html

  * igt@i915_module_load@reload:
    - {bat-rpls-2}:       NOTRUN -> [DMESG-FAIL][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-rpls-2/igt@i915_module_load@reload.html
    - {fi-ehl-2}:         NOTRUN -> [INCOMPLETE][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ehl-2/igt@i915_module_load@reload.html
    - {bat-adlp-6}:       NOTRUN -> [DMESG-FAIL][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-6/igt@i915_module_load@reload.html
    - {bat-jsl-2}:        NOTRUN -> [DMESG-FAIL][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-jsl-2/igt@i915_module_load@reload.html
    - {bat-jsl-1}:        NOTRUN -> [DMESG-FAIL][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-jsl-1/igt@i915_module_load@reload.html
    - {fi-jsl-1}:         NOTRUN -> [INCOMPLETE][47]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-jsl-1/igt@i915_module_load@reload.html
    - {bat-adls-5}:       NOTRUN -> [DMESG-FAIL][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adls-5/igt@i915_module_load@reload.html

  * igt@kms_addfb_basic@no-handle:
    - {bat-rpls-2}:       NOTRUN -> [SKIP][49] +146 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-rpls-2/igt@kms_addfb_basic@no-handle.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {bat-jsl-2}:        NOTRUN -> [SKIP][50] +146 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-jsl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@runner@aborted:
    - {bat-adlm-1}:       NOTRUN -> [FAIL][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlm-1/igt@runner@aborted.html
    - {bat-hsw-1}:        NOTRUN -> [FAIL][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-hsw-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_6894 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][53] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][54] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][55] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][56] ([fdo#109271])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][57] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bxt-dsi/igt@core_hotunplug@unbind-rebind.html
    - fi-apl-guc:         NOTRUN -> [SKIP][58] ([fdo#109271])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][59] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][60] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-glk-j4005/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][61] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][62] ([fdo#109271])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-g3258/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][63] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-skl-guc:         NOTRUN -> [SKIP][64] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][65] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][66] ([fdo#109271])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][67] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-kefka/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_close_race@basic-process:
    - fi-ivb-3770:        NOTRUN -> [SKIP][68] ([fdo#109271]) +146 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ivb-3770/igt@gem_close_race@basic-process.html

  * igt@gem_exec_fence@basic-await:
    - fi-bsw-nick:        NOTRUN -> [SKIP][69] ([fdo#109271]) +151 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@gem_exec_fence@basic-await.html

  * igt@i915_getparams_basic@basic-eu-total:
    - fi-snb-2600:        NOTRUN -> [SKIP][70] ([fdo#109271]) +151 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-snb-2600/igt@i915_getparams_basic@basic-eu-total.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][71] ([fdo#109271]) +146 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#5341])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
    - bat-adlp-4:         NOTRUN -> [SKIP][73] ([i915#5341])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#5341])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
    - fi-snb-2600:        NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#5341])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-snb-2600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#5341])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@runner@aborted:
    - bat-adlp-4:         NOTRUN -> [FAIL][77] ([i915#4312])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-4/igt@runner@aborted.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-cfl-8109u:       [FAIL][78] -> [FAIL][79] ([i915#4312])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-cfl-8109u/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8109u/igt@runner@aborted.html
    - fi-bsw-nick:        [FAIL][80] ([i915#3690]) -> [FAIL][81] ([i915#4312])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-bsw-nick/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@runner@aborted.html
    - fi-hsw-4770:        [FAIL][82] ([i915#4312]) -> [FAIL][83] ([i915#4312] / [i915#5594])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-hsw-4770/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-4770/igt@runner@aborted.html
    - fi-kbl-7500u:       [FAIL][84] ([i915#4312]) -> [FAIL][85] ([i915#4312] / [i915#5257])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-kbl-7500u/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-7500u/igt@runner@aborted.html
    - fi-kbl-guc:         [FAIL][86] ([i915#4312] / [i915#5257]) -> [FAIL][87] ([i915#4312])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-kbl-guc/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-guc/igt@runner@aborted.html
    - fi-snb-2600:        [FAIL][88] -> [FAIL][89] ([i915#4312])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-snb-2600/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-snb-2600/igt@runner@aborted.html
    - fi-ivb-3770:        [FAIL][90] -> [FAIL][91] ([i915#4312])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-ivb-3770/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ivb-3770/igt@runner@aborted.html
    - fi-tgl-1115g4:      [FAIL][92] ([i915#4312] / [i915#5257]) -> [FAIL][93] ([i915#3690])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-tgl-1115g4/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-tgl-1115g4/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][94] ([i915#4312]) -> [FAIL][95] ([i915#4312] / [i915#5257])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-cfl-guc/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-guc/igt@runner@aborted.html
    - fi-skl-guc:         [FAIL][96] ([i915#4312] / [i915#5257]) -> [FAIL][97] ([i915#4312])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-skl-guc/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3690]: https://gitlab.freedesktop.org/drm/intel/issues/3690
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6415 -> IGTPW_6894

  CI-20190529: 20190529
  CI_DRM_11472: 85882df13168c5f46b41401b96975de857e3ccac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6894: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/index.html
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/index.html

--===============7948886194049911419==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci/fast-feedback: Move gem_lmem_swapping further (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102312/">https://patchwork.freedesktop.org/series/102312/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11472 -&gt; IGTPW_6894</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6894 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6894, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/index.html</p>
<h2>Participating hosts (47 -&gt; 46)</h2>
<p>Additional (4): bat-hsw-1 bat-rpls-2 bat-adlm-1 bat-adlp-4 <br />
  Missing    (5): shard-tglu fi-bsw-cyan fi-elk-e7500 fi-blb-e6850 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6894:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@gem_lmem_swapping@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-glk-j4005/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8700k/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-apl-guc/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bxt-dsi/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-4770/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-guc/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-tgl-u2/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-n3050/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ivb-3770/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-rkl-guc/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-6700k2/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bdw-5557u/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-x1275/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-g3258/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-snb-2600/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-guc/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-4/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-rkl-11600/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-guc/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8109u/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-7500u/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> +146 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-bsw-kefka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-kefka/igt@gem_lmem_swapping@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-bsw-n3050/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-n3050/igt@gem_lmem_swapping@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-adl-ddr5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-adl-ddr5/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adls-5/igt@core_hotunplug@unbind-rebind.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-jsl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy:</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-6/igt@gem_busy@busy.html">SKIP</a> +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-rpls-2/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ehl-2/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-6/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>{bat-jsl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-jsl-2/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-jsl-1/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-jsl-1/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adls-5/igt@i915_module_load@reload.html">DMESG-FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@no-handle:</p>
<ul>
<li>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-rpls-2/igt@kms_addfb_basic@no-handle.html">SKIP</a> +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>{bat-jsl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-jsl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlm-1/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>{bat-hsw-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-hsw-1/igt@runner@aborted.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6894 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bxt-dsi/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8700k/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-glk-j4005/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-g3258/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-kefka/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ivb-3770/igt@gem_close_race@basic-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@gem_exec_fence@basic-await.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +151 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_getparams_basic@basic-eu-total:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-snb-2600/igt@i915_getparams_basic@basic-eu-total.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +151 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-snb-2600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/bat-adlp-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3690">i915#3690</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-snb-2600/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-snb-2600/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-ivb-3770/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-ivb-3770/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-tgl-1115g4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-tgl-1115g4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3690">i915#3690</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6415 -&gt; IGTPW_6894</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11472: 85882df13168c5f46b41401b96975de857e3ccac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6894: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6894/index.html<br />
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7948886194049911419==--
