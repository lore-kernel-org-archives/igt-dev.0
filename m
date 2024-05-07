Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B027C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 19:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2891125F8;
	Tue,  7 May 2024 19:51:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE281125F7;
 Tue,  7 May 2024 19:51:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6132333872643347642=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C1/2=5D_tests/kms=5Fvrr=3A_Add_a_subtest_for_seamless_modeset_t?=
 =?utf-8?q?o_a_virtual_LRR_mode_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <navaremanasi@chromium.org>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 May 2024 19:51:47 -0000
Message-ID: <171511150704.1963160.10898754831133154623@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424201344.783935-1-navaremanasi@chromium.org>
In-Reply-To: <20240424201344.783935-1-navaremanasi@chromium.org>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

--===============6132333872643347642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode (rev3)
URL   : https://patchwork.freedesktop.org/series/132866/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14723 -> IGTPW_11108
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11108 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11108, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (3): fi-glk-j4005 bat-kbl-2 bat-jsl-1 
  Missing    (4): bat-dg2-11 bat-mtlp-9 fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11108:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@max-min@pipe-a-dp-1:
    - bat-adls-6:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@max-min@pipe-a-dp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/igt@kms_vrr@seamless-rr-switch-virtual.html
    - {bat-arls-4}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adlp-6:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-dg2-14:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-arls-3:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-jsl-3:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adls-6:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-jsl-1:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-arls-1:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-dg1-7:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adlp-9:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - {bat-rpls-4}:       NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rpls-4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adln-1:         NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-rplp-1:         NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch-virtual.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@load:
    - {bat-apl-1}:        [PASS][20] -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14723/bat-apl-1/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-apl-1/igt@i915_module_load@load.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - {bat-twl-1}:        NOTRUN -> [SKIP][22] +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14723 and IGTPW_11108:

### New IGT tests (1) ###

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_11108 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][23] ([i915#9318])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][24] ([i915#1849])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][25] ([i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@gem_huc_copy@huc-copy.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][26] ([i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][27] +49 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-jsl-1:          NOTRUN -> [SKIP][28] ([i915#4613]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][29] ([i915#4613]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [PASS][30] -> [DMESG-WARN][31] ([i915#9427]) +2 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14723/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][32] ([i915#4103]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][33] ([i915#3555] / [i915#9886])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-1:          NOTRUN -> [SKIP][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-glk-j4005:       NOTRUN -> [SKIP][35] +20 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_vrr@flip-basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][36] ([i915#6078]) +9 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-atsm-1/igt@kms_vrr@flip-basic.html
    - bat-jsl-3:          NOTRUN -> [SKIP][37] ([i915#3555]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@flip-basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][38] +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ivb-3770/igt@kms_vrr@flip-basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][39] ([i915#3555] / [i915#8808]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@flip-basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][40] +9 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-elk-e7500/igt@kms_vrr@flip-basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][41] ([i915#9197]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-8/igt@kms_vrr@flip-basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][42] +9 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-guc/igt@kms_vrr@flip-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][43] ([i915#3555]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - fi-pnv-d510:        NOTRUN -> [SKIP][44] +9 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-pnv-d510/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg1-7:          NOTRUN -> [SKIP][45] ([i915#9906]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][46] +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-7567u/igt@kms_vrr@flip-basic-fastset.html
    - bat-adln-1:         NOTRUN -> [SKIP][47] ([i915#9906]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@flip-basic-fastset.html
    - bat-rplp-1:         NOTRUN -> [SKIP][48] ([i915#9906]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@flip-basic-fastset.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][49] ([i915#9906]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@flip-basic-fastset.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][50] +9 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-guc/igt@kms_vrr@flip-basic-fastset.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][51] ([i915#9792]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-6/igt@kms_vrr@flip-basic-fastset.html
    - bat-adlp-6:         NOTRUN -> [SKIP][52] ([i915#9906]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - bat-rplp-1:         NOTRUN -> [SKIP][53] ([i915#3555]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@flip-suspend.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][54] ([i915#3555]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@flip-suspend.html
    - bat-dg1-7:          NOTRUN -> [SKIP][55] ([i915#3555]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@flip-suspend.html
    - bat-adlp-11:        NOTRUN -> [SKIP][56] ([i915#10470] / [i915#10501]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/igt@kms_vrr@flip-suspend.html
    - bat-adln-1:         NOTRUN -> [SKIP][57] ([i915#3555]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@flip-suspend.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][58] ([i915#3555]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - bat-dg2-14:         NOTRUN -> [SKIP][59] ([i915#3555]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - bat-adlm-1:         NOTRUN -> [SKIP][60] ([i915#9900]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlm-1/igt@kms_vrr@max-min.html
    - bat-arls-1:         NOTRUN -> [SKIP][61] ([i915#8808]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/igt@kms_vrr@max-min.html
    - bat-arls-3:         NOTRUN -> [SKIP][62] ([i915#8808]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/igt@kms_vrr@max-min.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][63] ([i915#8808] / [i915#9906]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - bat-adlp-9:         NOTRUN -> [SKIP][64] ([i915#3555])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@negative-basic.html
    - bat-adls-6:         NOTRUN -> [SKIP][65] ([i915#3555])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][66] +9 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][67] +9 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-dg2-14:         NOTRUN -> [SKIP][68] ([i915#9906]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][69] +9 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-jsl-3:          NOTRUN -> [SKIP][70] ([i915#9906]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][71] ([i915#9197]) +9 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][72] +9 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-adlp-11:        NOTRUN -> [SKIP][73] ([i915#10470]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][74] +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-ilk-650:         NOTRUN -> [SKIP][75] +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ilk-650/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - bat-adlp-9:         NOTRUN -> [SKIP][76] ([i915#9906]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-adls-6:         NOTRUN -> [SKIP][77] ([i915#9906]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-jsl-1:          NOTRUN -> [SKIP][78] ([i915#9906]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][79] ([i915#9906]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-arls-2:         NOTRUN -> [SKIP][80] ([i915#8808]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9427
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7838 -> IGTPW_11108

  CI-20190529: 20190529
  CI_DRM_14723: f58676e47c12a99409b71f7d3bab9f89e14522b4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11108: 70f39756b8310ef49e565789055cfab85b5cef58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html

--===============6132333872643347642==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132866/">https://patchwork.freedesktop.org/series/132866/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14723 -&gt; IGTPW_11108</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11108 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11108, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (3): fi-glk-j4005 bat-kbl-2 bat-jsl-1 <br />
  Missing    (4): bat-dg2-11 bat-mtlp-9 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11108:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@max-min@pipe-a-dp-1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@max-min@pipe-a-dp-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rpls-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14723/bat-apl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-apl-1/igt@i915_module_load@load.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14723 and IGTPW_11108:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_vrr@seamless-rr-switch-virtual:<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11108 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +49 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14723/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9427">i915#9427</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-atsm-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +9 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ivb-3770/igt@kms_vrr@flip-basic.html">SKIP</a> +9 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-elk-e7500/igt@kms_vrr@flip-basic.html">SKIP</a> +9 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +9 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> +9 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-pnv-d510/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +9 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-7567u/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +9 other tests skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-guc/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +9 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +9 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>) +6 other tests skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlm-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +9 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +8 other tests skip</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +7 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +9 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +9 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +9 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +9 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +9 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +2 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +9 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ilk-650/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +3 other tests skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7838 -&gt; IGTPW_11108</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14723: f58676e47c12a99409b71f7d3bab9f89e14522b4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11108: 70f39756b8310ef49e565789055cfab85b5cef58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6132333872643347642==--
