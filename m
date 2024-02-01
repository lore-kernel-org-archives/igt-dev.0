Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57979C47258
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 02:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF1610FE70;
	Thu,  1 Feb 2024 02:56:46 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACF610FE70;
 Thu,  1 Feb 2024 02:56:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6662686128351312621=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_igt=5Fkmod_and_sysfs_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 01 Feb 2024 02:56:45 -0000
Message-ID: <170675620503.878358.11640284411878842855@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
In-Reply-To: <20240201005115.352192-1-lucas.demarchi@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============6662686128351312621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt_kmod and sysfs fixes
URL   : https://patchwork.freedesktop.org/series/129398/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7699 -> IGTPW_10617
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10617 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10617, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (2): bat-arls-1 bat-arls-2 
  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10617:

### IGT changes ###

#### Possible regressions ####

  * igt@core_auth@basic-auth:
    - bat-adlp-9:         [PASS][1] -> [FAIL][2] +97 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@core_auth@basic-auth.html

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [PASS][3] -> [FAIL][4] +92 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@gem_basic@bad-close:
    - bat-adlp-6:         [PASS][5] -> [FAIL][6] +97 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@gem_basic@bad-close.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@gem_basic@bad-close.html

  * igt@gem_basic@create-close:
    - fi-elk-e7500:       [PASS][7] -> [FAIL][8] +98 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-elk-e7500/igt@gem_basic@create-close.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-elk-e7500/igt@gem_basic@create-close.html
    - bat-dg2-8:          [PASS][9] -> [FAIL][10] +79 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@gem_basic@create-close.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_basic@create-close.html
    - fi-bsw-nick:        [PASS][11] -> [FAIL][12] +98 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-nick/igt@gem_basic@create-close.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-nick/igt@gem_basic@create-close.html

  * igt@gem_busy@busy:
    - fi-elk-e7500:       NOTRUN -> [FAIL][13] +21 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-elk-e7500/igt@gem_busy@busy.html
    - bat-dg2-8:          NOTRUN -> [FAIL][14] +22 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_busy@busy.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][15] +9 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-guc/igt@gem_busy@busy.html
    - bat-adlm-1:         NOTRUN -> [FAIL][16] +9 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@gem_busy@busy.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][17] +9 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@gem_busy@busy.html

  * igt@gem_ctx_create@basic-files:
    - fi-bsw-n3050:       [PASS][18] -> [FAIL][19] +98 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-n3050/igt@gem_ctx_create@basic-files.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-n3050/igt@gem_ctx_create@basic-files.html
    - bat-mtlp-6:         [PASS][20] -> [FAIL][21] +61 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@gem_ctx_create@basic-files.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_ctx_create@basic-files.html

  * igt@gem_exec_basic@basic:
    - fi-ilk-650:         NOTRUN -> [FAIL][22] +21 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ilk-650/igt@gem_exec_basic@basic.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][23] +21 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-n3050/igt@gem_exec_basic@basic.html

  * igt@gem_exec_fence@basic-await:
    - bat-adlp-6:         NOTRUN -> [FAIL][24] +22 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@gem_exec_fence@basic-await.html

  * igt@gem_exec_fence@basic-busy:
    - bat-dg2-9:          NOTRUN -> [FAIL][25] +22 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@gem_exec_fence@basic-busy.html

  * igt@gem_exec_fence@basic-wait:
    - fi-kbl-7567u:       NOTRUN -> [FAIL][26] +21 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@gem_exec_fence@basic-wait.html
    - bat-adln-1:         NOTRUN -> [FAIL][27] +22 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@gem_exec_fence@basic-wait.html

  * igt@gem_exec_fence@nb-await:
    - fi-kbl-x1275:       NOTRUN -> [FAIL][28] +9 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@gem_exec_fence@nb-await.html
    - bat-kbl-2:          NOTRUN -> [FAIL][29] +9 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-kbl-2/igt@gem_exec_fence@nb-await.html

  * igt@gem_exec_parallel@engines:
    - fi-skl-guc:         NOTRUN -> [FAIL][30] +21 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-guc/igt@gem_exec_parallel@engines.html
    - bat-dg2-11:         NOTRUN -> [FAIL][31] +21 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_exec_parallel@engines.html

  * igt@gem_flink_basic@bad-flink:
    - bat-adln-1:         [PASS][32] -> [FAIL][33] +97 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@gem_flink_basic@bad-flink.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@gem_flink_basic@bad-flink.html
    - fi-ivb-3770:        [PASS][34] -> [FAIL][35] +100 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ivb-3770/igt@gem_flink_basic@bad-flink.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ivb-3770/igt@gem_flink_basic@bad-flink.html

  * igt@gem_linear_blits@basic:
    - bat-rplp-1:         [PASS][36] -> [FAIL][37] +97 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@gem_linear_blits@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@gem_linear_blits@basic.html

  * igt@gem_render_linear_blits@basic:
    - fi-rkl-11600:       [PASS][38] -> [FAIL][39] +97 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@gem_render_linear_blits@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@gem_render_linear_blits@basic.html

  * igt@gem_softpin@allocator-basic:
    - bat-dg2-11:         [PASS][40] -> [FAIL][41] +79 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@gem_softpin@allocator-basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_softpin@allocator-basic.html

  * igt@gem_sync@basic-each:
    - bat-atsm-1:         [PASS][42] -> [FAIL][43] +40 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@gem_sync@basic-each.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_sync@basic-each.html

  * igt@gem_tiled_blits@basic:
    - fi-kbl-guc:         [PASS][44] -> [FAIL][45] +94 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-guc/igt@gem_tiled_blits@basic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-guc/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-kbl-2:          [PASS][46] -> [FAIL][47] +93 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-kbl-2/igt@gem_tiled_pread_basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-kbl-2/igt@gem_tiled_pread_basic.html

  * igt@gem_wait@busy:
    - bat-atsm-1:         NOTRUN -> [FAIL][48] +9 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_wait@busy.html
    - bat-dg1-7:          NOTRUN -> [FAIL][49] +21 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@gem_wait@busy.html
    - bat-jsl-3:          NOTRUN -> [FAIL][50] +22 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@gem_wait@busy.html

  * igt@gem_wait@wait:
    - fi-rkl-11600:       NOTRUN -> [FAIL][51] +21 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@gem_wait@wait.html

  * igt@i915_getparams_basic@basic-eu-total:
    - bat-dg1-7:          [PASS][52] -> [FAIL][53] +80 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@i915_getparams_basic@basic-eu-total.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_module_load@reload:
    - bat-mtlp-6:         NOTRUN -> [FAIL][54] +38 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@i915_module_load@reload.html

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - fi-apl-guc:         [PASS][55] -> [FAIL][56] +98 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - bat-jsl-3:          [PASS][57] -> [FAIL][58] +101 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_addfb_basic@addfb25-bad-modifier.html
    - fi-glk-j4005:       [PASS][59] -> [FAIL][60] +101 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-glk-j4005/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - bat-adlm-1:         [PASS][61] -> [FAIL][62] +89 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_addfb_basic@bad-pitch-63.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - fi-blb-e6850:       [PASS][63] -> [FAIL][64] +92 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-blb-e6850/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-blb-e6850/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - fi-cfl-8109u:       [PASS][65] -> [FAIL][66] +101 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8109u/igt@kms_addfb_basic@invalid-set-prop.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@kms_addfb_basic@invalid-set-prop.html
    - fi-kbl-7567u:       [PASS][67] -> [FAIL][68] +99 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-dg2-9:          [PASS][69] -> [FAIL][70] +79 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_addfb_basic@size-max:
    - fi-cfl-guc:         [PASS][71] -> [FAIL][72] +102 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-guc/igt@kms_addfb_basic@size-max.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-guc/igt@kms_addfb_basic@size-max.html

  * igt@kms_addfb_basic@small-bo:
    - fi-skl-6600u:       [PASS][73] -> [FAIL][74] +101 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-6600u/igt@kms_addfb_basic@small-bo.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@kms_addfb_basic@small-bo.html

  * igt@kms_addfb_basic@too-high:
    - fi-cfl-8700k:       [PASS][75] -> [FAIL][76] +101 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8700k/igt@kms_addfb_basic@too-high.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@kms_addfb_basic@too-high.html

  * igt@kms_busy@basic:
    - fi-ivb-3770:        NOTRUN -> [FAIL][77] +21 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ivb-3770/igt@kms_busy@basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-cfl-guc:         NOTRUN -> [FAIL][78] +21 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-jsl-1:          NOTRUN -> [FAIL][79] +131 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][80] +21 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][81] +21 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-blb-e6850/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-skl-6600u:       NOTRUN -> [FAIL][82] +22 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-rplp-1:         NOTRUN -> [FAIL][83] +22 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-apl-guc:         NOTRUN -> [FAIL][84] +21 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][85] +21 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][86] +21 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [FAIL][87] +21 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       NOTRUN -> [FAIL][88] +21 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        NOTRUN -> [FAIL][89] +21 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-ilk-650:         [PASS][90] -> [FAIL][91] +100 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ilk-650/igt@prime_self_import@basic-llseek-bad.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ilk-650/igt@prime_self_import@basic-llseek-bad.html
    - fi-tgl-1115g4:      [PASS][92] -> [FAIL][93] +93 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@prime_self_import@basic-llseek-bad.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@prime_self_import@basic-llseek-bad.html

  * igt@prime_vgem@basic-fence-mmap:
    - fi-pnv-d510:        [PASS][94] -> [FAIL][95] +89 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-pnv-d510/igt@prime_vgem@basic-fence-mmap.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-pnv-d510/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - fi-skl-guc:         [PASS][96] -> [FAIL][97] +102 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-guc/igt@prime_vgem@basic-read.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-guc/igt@prime_vgem@basic-read.html

  
#### Warnings ####

  * igt@debugfs_test@basic-hwmon:
    - bat-adlp-9:         [SKIP][98] ([i915#9318]) -> [FAIL][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-6:         [SKIP][100] ([i915#9318]) -> [FAIL][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
    - bat-rplp-1:         [SKIP][102] ([i915#9318]) -> [FAIL][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
    - fi-rkl-11600:       [SKIP][104] ([i915#9318]) -> [FAIL][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-3:          [SKIP][106] ([i915#9318]) -> [FAIL][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
    - bat-adln-1:         [SKIP][108] ([i915#9318]) -> [FAIL][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@debugfs_test@basic-hwmon.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@debugfs_test@basic-hwmon.html
    - bat-adlm-1:         [SKIP][110] ([i915#3826]) -> [FAIL][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
    - fi-tgl-1115g4:      [SKIP][112] ([i915#9318]) -> [FAIL][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-6:         [SKIP][114] ([i915#9318]) -> [FAIL][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       [SKIP][116] ([fdo#109271] / [i915#2190]) -> [FAIL][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-7567u:       [SKIP][118] ([fdo#109271] / [i915#2190]) -> [FAIL][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
    - fi-ivb-3770:        [SKIP][120] ([fdo#109271]) -> [FAIL][121] +8 other tests fail
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ivb-3770/igt@gem_huc_copy@huc-copy.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ivb-3770/igt@gem_huc_copy@huc-copy.html
    - fi-elk-e7500:       [SKIP][122] ([fdo#109271]) -> [FAIL][123] +10 other tests fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html
    - fi-bsw-nick:        [SKIP][124] ([fdo#109271]) -> [FAIL][125] +10 other tests fail
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-nick/igt@gem_huc_copy@huc-copy.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-nick/igt@gem_huc_copy@huc-copy.html
    - fi-ilk-650:         [SKIP][126] ([fdo#109271]) -> [FAIL][127] +8 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ilk-650/igt@gem_huc_copy@huc-copy.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ilk-650/igt@gem_huc_copy@huc-copy.html
    - fi-tgl-1115g4:      [SKIP][128] ([i915#2190]) -> [FAIL][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html
    - fi-cfl-8700k:       [SKIP][130] ([fdo#109271] / [i915#2190]) -> [FAIL][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html
    - fi-rkl-11600:       [SKIP][132] ([i915#2190]) -> [FAIL][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html
    - fi-skl-6600u:       [SKIP][134] ([fdo#109271] / [i915#2190]) -> [FAIL][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-3:          [SKIP][136] ([i915#2190]) -> [FAIL][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@gem_huc_copy@huc-copy.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@gem_huc_copy@huc-copy.html
    - fi-glk-j4005:       [SKIP][138] ([fdo#109271] / [i915#2190]) -> [FAIL][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-x1275:       [SKIP][140] ([fdo#109271] / [i915#2190]) -> [FAIL][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap@basic:
    - bat-atsm-1:         [SKIP][142] ([i915#4083]) -> [FAIL][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@gem_mmap@basic.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_mmap@basic.html
    - bat-dg1-7:          [SKIP][144] ([i915#4083]) -> [FAIL][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@gem_mmap@basic.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@gem_mmap@basic.html
    - bat-dg2-9:          [SKIP][146] ([i915#4083]) -> [FAIL][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@gem_mmap@basic.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@gem_mmap@basic.html
    - bat-dg2-11:         [SKIP][148] ([i915#4083]) -> [FAIL][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@gem_mmap@basic.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_mmap@basic.html
    - bat-dg2-8:          [SKIP][150] ([i915#4083]) -> [FAIL][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@gem_mmap@basic.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_mmap@basic.html
    - bat-mtlp-6:         [SKIP][152] ([i915#4083]) -> [FAIL][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@gem_mmap@basic.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-9:          [SKIP][154] ([i915#4077]) -> [FAIL][155] +2 other tests fail
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@gem_mmap_gtt@basic.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@gem_mmap_gtt@basic.html
    - bat-dg2-8:          [SKIP][156] ([i915#4077]) -> [FAIL][157] +2 other tests fail
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@gem_mmap_gtt@basic.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-9:          [SKIP][158] ([i915#4079]) -> [FAIL][159] +1 other test fail
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@gem_render_tiled_blits@basic.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - fi-bsw-n3050:       [SKIP][160] ([fdo#109271]) -> [FAIL][161] +10 other tests fail
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-n3050/igt@gem_tiled_blits@basic.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-n3050/igt@gem_tiled_blits@basic.html
    - bat-mtlp-6:         [SKIP][162] ([i915#4077]) -> [FAIL][163] +2 other tests fail
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@gem_tiled_blits@basic.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-atsm-1:         [SKIP][164] ([i915#4077]) -> [FAIL][165] +2 other tests fail
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
    - bat-dg1-7:          [SKIP][166] ([i915#4077]) -> [FAIL][167] +2 other tests fail
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html
    - bat-dg2-11:         [SKIP][168] ([i915#4077]) -> [FAIL][169] +2 other tests fail
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-6:         [SKIP][170] ([i915#3282]) -> [FAIL][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@gem_tiled_pread_basic.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@gem_tiled_pread_basic.html
    - fi-rkl-11600:       [SKIP][172] ([i915#3282]) -> [FAIL][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@gem_tiled_pread_basic.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@gem_tiled_pread_basic.html
    - bat-atsm-1:         [SKIP][174] ([i915#4079]) -> [FAIL][175] +1 other test fail
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@gem_tiled_pread_basic.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_tiled_pread_basic.html
    - bat-dg1-7:          [SKIP][176] ([i915#4079]) -> [FAIL][177] +1 other test fail
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@gem_tiled_pread_basic.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@gem_tiled_pread_basic.html
    - bat-adlp-9:         [SKIP][178] ([i915#3282]) -> [FAIL][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@gem_tiled_pread_basic.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@gem_tiled_pread_basic.html
    - bat-dg2-11:         [SKIP][180] ([i915#4079]) -> [FAIL][181] +1 other test fail
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@gem_tiled_pread_basic.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_tiled_pread_basic.html
    - bat-adln-1:         [SKIP][182] ([i915#3282]) -> [FAIL][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@gem_tiled_pread_basic.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@gem_tiled_pread_basic.html
    - bat-dg2-8:          [SKIP][184] ([i915#4079]) -> [FAIL][185] +1 other test fail
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@gem_tiled_pread_basic.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_tiled_pread_basic.html
    - bat-adlm-1:         [SKIP][186] ([i915#3282]) -> [FAIL][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@gem_tiled_pread_basic.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@gem_tiled_pread_basic.html
    - bat-rplp-1:         [SKIP][188] ([i915#3282]) -> [FAIL][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@gem_tiled_pread_basic.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@gem_tiled_pread_basic.html
    - bat-mtlp-6:         [SKIP][190] ([i915#4079]) -> [FAIL][191] +1 other test fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@gem_tiled_pread_basic.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-7:          [SKIP][192] ([i915#6621]) -> [FAIL][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@i915_pm_rps@basic-api.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@i915_pm_rps@basic-api.html
    - bat-adlp-9:         [SKIP][194] ([i915#6621]) -> [FAIL][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@i915_pm_rps@basic-api.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@i915_pm_rps@basic-api.html
    - bat-adlp-6:         [SKIP][196] ([i915#6621]) -> [FAIL][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@i915_pm_rps@basic-api.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@i915_pm_rps@basic-api.html
    - bat-rplp-1:         [SKIP][198] ([i915#6621]) -> [FAIL][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@i915_pm_rps@basic-api.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@i915_pm_rps@basic-api.html
    - bat-atsm-1:         [SKIP][200] ([i915#6621]) -> [FAIL][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@i915_pm_rps@basic-api.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@i915_pm_rps@basic-api.html
    - bat-dg2-9:          [SKIP][202] ([i915#6621]) -> [FAIL][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@i915_pm_rps@basic-api.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@i915_pm_rps@basic-api.html
    - bat-dg2-11:         [SKIP][204] ([i915#6621]) -> [FAIL][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@i915_pm_rps@basic-api.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@i915_pm_rps@basic-api.html
    - bat-adln-1:         [SKIP][206] ([i915#6621]) -> [FAIL][207]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@i915_pm_rps@basic-api.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@i915_pm_rps@basic-api.html
    - bat-dg2-8:          [SKIP][208] ([i915#6621]) -> [FAIL][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@i915_pm_rps@basic-api.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@i915_pm_rps@basic-api.html
    - bat-adlm-1:         [SKIP][210] ([i915#6621]) -> [FAIL][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@i915_pm_rps@basic-api.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-mtlp-6:         [SKIP][212] ([i915#4212] / [i915#9792]) -> [FAIL][213] +8 other tests fail
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg1-7:          [SKIP][214] ([i915#4212]) -> [FAIL][215] +7 other tests fail
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - bat-dg2-11:         [SKIP][216] ([i915#4212]) -> [FAIL][217] +7 other tests fail
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          [SKIP][218] ([i915#5190]) -> [FAIL][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-8:          [SKIP][220] ([i915#5190]) -> [FAIL][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-6:         [SKIP][222] ([i915#5190] / [i915#9792]) -> [FAIL][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-11:         [SKIP][224] ([i915#5190]) -> [FAIL][225]
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-9:          [SKIP][226] ([i915#4215] / [i915#5190]) -> [FAIL][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-8:          [SKIP][228] ([i915#4215] / [i915#5190]) -> [FAIL][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-7:          [SKIP][230] ([i915#4215]) -> [FAIL][231]
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-11:         [SKIP][232] ([i915#4215] / [i915#5190]) -> [FAIL][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-9:          [SKIP][234] ([i915#4212]) -> [FAIL][235] +7 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - bat-dg2-8:          [SKIP][236] ([i915#4212]) -> [FAIL][237] +7 other tests fail
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@size-max:
    - bat-atsm-1:         [SKIP][238] ([i915#6077]) -> [FAIL][239] +37 other tests fail
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_addfb_basic@size-max.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_busy@basic:
    - fi-tgl-1115g4:      [SKIP][240] ([i915#4303]) -> [FAIL][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_busy@basic.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       [SKIP][242] ([fdo#109271]) -> [FAIL][243] +6 other tests fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-adlp-9:         [SKIP][244] ([i915#4103]) -> [FAIL][245] +1 other test fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-dg2-11:         [SKIP][246] ([i915#4103] / [i915#4213]) -> [FAIL][247] +1 other test fail
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-adln-1:         [SKIP][248] ([i915#4213]) -> [FAIL][249] +1 other test fail
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-rplp-1:         [SKIP][250] ([i915#4103] / [i915#4213]) -> [FAIL][251] +1 other test fail
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-rkl-11600:       [SKIP][252] ([i915#4103]) -> [FAIL][253] +1 other test fail
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-cfl-guc:         [SKIP][254] ([fdo#109271]) -> [FAIL][255] +6 other tests fail
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-3:          [SKIP][256] ([i915#4103]) -> [FAIL][257] +1 other test fail
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-9:          [SKIP][258] ([i915#4103] / [i915#4213]) -> [FAIL][259] +1 other test fail
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-8:          [SKIP][260] ([i915#4103] / [i915#4213]) -> [FAIL][261] +1 other test fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-6:         [SKIP][262] ([i915#4103]) -> [FAIL][263] +1 other test fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-skl-6600u:       [SKIP][264] ([fdo#109271]) -> [FAIL][265] +5 other tests fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg1-7:          [SKIP][266] ([i915#4103] / [i915#4213]) -> [FAIL][267] +1 other test fail
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         [SKIP][268] ([i915#6078]) -> [FAIL][269] +15 other tests fail
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-mtlp-6:         [SKIP][270] ([i915#9792]) -> [FAIL][271] +9 other tests fail
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlm-1:         [SKIP][272] ([i915#9875] / [i915#9900]) -> [FAIL][273] +16 other tests fail
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-tgl-1115g4:      [SKIP][274] ([i915#10158]) -> [FAIL][275] +15 other tests fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-kbl-guc:         [SKIP][276] ([fdo#109271]) -> [FAIL][277] +26 other tests fail
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - fi-skl-guc:         [SKIP][278] ([fdo#109271]) -> [FAIL][279] +6 other tests fail
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-guc/igt@kms_dsc@dsc-basic.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-guc/igt@kms_dsc@dsc-basic.html
    - bat-dg2-11:         [SKIP][280] ([i915#3555] / [i915#3840]) -> [FAIL][281]
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_dsc@dsc-basic.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - bat-adln-1:         [SKIP][282] ([i915#3555] / [i915#3840]) -> [FAIL][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@kms_dsc@dsc-basic.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][284] ([i915#3555] / [i915#3840]) -> [FAIL][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-rkl-11600:       [SKIP][286] ([i915#3555] / [i915#3840]) -> [FAIL][287]
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
    - bat-adlp-6:         [SKIP][288] ([i915#3555] / [i915#3840]) -> [FAIL][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@kms_dsc@dsc-basic.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][290] ([i915#3555] / [i915#3840]) -> [FAIL][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_dsc@dsc-basic.html
    - bat-jsl-3:          [SKIP][292] ([i915#3555] / [i915#9886]) -> [FAIL][293]
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_dsc@dsc-basic.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_dsc@dsc-basic.html
    - bat-adlp-9:         [SKIP][294] ([i915#3555] / [i915#3840]) -> [FAIL][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_dsc@dsc-basic.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-mtlp-6:         [SKIP][296] ([i915#3637] / [i915#9792]) -> [FAIL][297] +3 other tests fail
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-plain-flip:
    - bat-adlm-1:         [SKIP][298] ([i915#3637]) -> [FAIL][299] +3 other tests fail
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_flip@basic-plain-flip.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_flip@basic-plain-flip.html
    - fi-tgl-1115g4:      [SKIP][300] ([i915#3637]) -> [FAIL][301] +3 other tests fail
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_flip@basic-plain-flip.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-7567u:       [SKIP][302] ([fdo#109271]) -> [FAIL][303] +6 other tests fail
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adln-1:         [SKIP][304] ([fdo#109285]) -> [FAIL][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html
    - fi-cfl-8700k:       [SKIP][306] ([fdo#109271]) -> [FAIL][307] +6 other tests fail
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlm-1:         [SKIP][308] ([fdo#109285]) -> [FAIL][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-rplp-1:         [SKIP][310] ([fdo#109285]) -> [FAIL][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html
    - fi-rkl-11600:       [SKIP][312] ([fdo#109285]) -> [FAIL][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
    - fi-tgl-1115g4:      [SKIP][314] ([fdo#109285]) -> [FAIL][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-3:          [SKIP][316] ([fdo#109285]) -> [FAIL][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-9:          [SKIP][318] ([fdo#109285]) -> [FAIL][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-8:          [SKIP][320] ([fdo#109285]) -> [FAIL][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-6:         [SKIP][322] ([fdo#109285]) -> [FAIL][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg1-7:          [SKIP][324] ([fdo#109285]) -> [FAIL][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-9:         [SKIP][326] ([fdo#109285]) -> [FAIL][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-11:         [SKIP][328] ([fdo#109285]) -> [FAIL][329]
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-atsm-1:         [SKIP][330] ([i915#6093]) -> [FAIL][331] +4 other tests fail
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-9:          [SKIP][332] ([i915#5274]) -> [FAIL][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-11:         [SKIP][334] ([i915#5274]) -> [FAIL][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-8:          [SKIP][336] ([i915#5274]) -> [FAIL][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlm-1:         [SKIP][338] ([i915#1849] / [i915#4342]) -> [FAIL][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html
    - fi-tgl-1115g4:      [SKIP][340] ([i915#1849]) -> [FAIL][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         [SKIP][342] ([fdo#109271]) -> [FAIL][343] +10 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html
    - fi-pnv-d510:        [SKIP][344] ([fdo#109271]) -> [FAIL][345] +19 other tests fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-pnv-d510/igt@kms_hdmi_inject@inject-audio.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-pnv-d510/igt@kms_hdmi_inject@inject-audio.html
    - bat-dg1-7:          [SKIP][346] ([i915#433]) -> [FAIL][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-1:         [SKIP][348] ([i915#1836]) -> [FAIL][349] +6 other tests fail
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-kbl-x1275:       [SKIP][350] ([fdo#109271]) -> [FAIL][351] +27 other tests fail
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-blb-e6850:       [SKIP][352] ([fdo#109271]) -> [FAIL][353] +16 other tests fail
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html
    - bat-kbl-2:          [SKIP][354] ([fdo#109271]) -> [FAIL][355] +27 other tests fail
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][356] ([i915#5354]) -> [FAIL][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-7:          [SKIP][358] ([i915#5354]) -> [FAIL][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-11:         [SKIP][360] ([i915#5354]) -> [FAIL][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
    - fi-cfl-8109u:       [SKIP][362] ([fdo#109271]) -> [FAIL][363] +6 other tests fail
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-8:          [SKIP][364] ([i915#5354]) -> [FAIL][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlm-1:         [SKIP][366] ([i915#5354]) -> [FAIL][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html
    - fi-tgl-1115g4:      [SKIP][368] ([i915#9812]) -> [FAIL][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-9:          [SKIP][370] ([i915#5354]) -> [FAIL][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlp-9:         [SKIP][372] ([i915#9812]) -> [FAIL][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-1:         [SKIP][374] ([i915#7357]) -> [FAIL][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_prop_blob@basic.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adlp-9:         [SKIP][376] ([i915#3555]) -> [FAIL][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlp-6:         [SKIP][378] ([i915#3555]) -> [FAIL][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-rplp-1:         [SKIP][380] ([i915#3555]) -> [FAIL][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-rkl-11600:       [SKIP][382] ([i915#3555]) -> [FAIL][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-atsm-1:         [SKIP][384] ([i915#6094]) -> [FAIL][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-jsl-3:          [SKIP][386] ([i915#3555]) -> [FAIL][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-9:          [SKIP][388] ([i915#3555]) -> [FAIL][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-11:         [SKIP][390] ([i915#3555]) -> [FAIL][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adln-1:         [SKIP][392] ([i915#3555]) -> [FAIL][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@kms_setmode@basic-clone-single-crtc.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-8:          [SKIP][394] ([i915#3555]) -> [FAIL][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlm-1:         [SKIP][396] ([i915#3555]) -> [FAIL][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-tgl-1115g4:      [SKIP][398] ([i915#3555]) -> [FAIL][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-7:          [SKIP][400] ([i915#3555]) -> [FAIL][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-atsm-1:         [SKIP][402] ([fdo#109295] / [i915#6078]) -> [FAIL][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html
    - bat-dg1-7:          [SKIP][404] ([i915#3708]) -> [FAIL][405] +3 other tests fail
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-9:          [SKIP][406] ([i915#3708]) -> [FAIL][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-11:         [SKIP][408] ([i915#3708]) -> [FAIL][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-8:          [SKIP][410] ([i915#3708]) -> [FAIL][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
    - bat-adlm-1:         [SKIP][412] ([i915#3708] / [i915#9900]) -> [FAIL][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html
    - fi-tgl-1115g4:      [SKIP][414] ([fdo#109295]) -> [FAIL][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-atsm-1:         [SKIP][416] ([fdo#109295] / [i915#4077]) -> [FAIL][417] +1 other test fail
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg1-7:          [SKIP][418] ([i915#3708] / [i915#4077]) -> [FAIL][419] +1 other test fail
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg2-11:         [SKIP][420] ([i915#3708] / [i915#4077]) -> [FAIL][421] +1 other test fail
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg2-8:          [SKIP][422] ([i915#3708] / [i915#4077]) -> [FAIL][423] +1 other test fail
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg2-9:          [SKIP][424] ([i915#3708] / [i915#4077]) -> [FAIL][425] +1 other test fail
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adlp-9:         [SKIP][426] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [FAIL][427] +2 other tests fail
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@prime_vgem@basic-fence-read.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@prime_vgem@basic-fence-read.html
    - bat-adlp-6:         [SKIP][428] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [FAIL][429] +2 other tests fail
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@prime_vgem@basic-fence-read.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - bat-dg2-11:         [SKIP][430] ([i915#3291] / [i915#3708]) -> [FAIL][431] +2 other tests fail
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@prime_vgem@basic-read.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@prime_vgem@basic-read.html
    - bat-rplp-1:         [SKIP][432] ([i915#3708]) -> [FAIL][433] +2 other tests fail
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@prime_vgem@basic-read.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@prime_vgem@basic-read.html
    - fi-rkl-11600:       [SKIP][434] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [FAIL][435] +2 other tests fail
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@prime_vgem@basic-read.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-atsm-1:         [SKIP][436] ([fdo#109295]) -> [FAIL][437] +2 other tests fail
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@prime_vgem@basic-write.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@prime_vgem@basic-write.html
    - bat-dg2-9:          [SKIP][438] ([i915#3291] / [i915#3708]) -> [FAIL][439] +2 other tests fail
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@prime_vgem@basic-write.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@prime_vgem@basic-write.html
    - bat-adln-1:         [SKIP][440] ([fdo#109295] / [i915#3291]) -> [FAIL][441] +2 other tests fail
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@prime_vgem@basic-write.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@prime_vgem@basic-write.html
    - bat-dg2-8:          [SKIP][442] ([i915#3291] / [i915#3708]) -> [FAIL][443] +2 other tests fail
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@prime_vgem@basic-write.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@prime_vgem@basic-write.html
    - bat-adlm-1:         [SKIP][444] ([i915#3708]) -> [FAIL][445] +2 other tests fail
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@prime_vgem@basic-write.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@prime_vgem@basic-write.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-arls-1}:       NOTRUN -> [SKIP][446] +144 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@debugfs_test@basic-hwmon:
    - {bat-adls-6}:       [SKIP][447] ([i915#9318]) -> [FAIL][448]
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@debugfs_test@basic-hwmon.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@debugfs_test@basic-hwmon.html

  * igt@gem_busy@busy:
    - {bat-adls-6}:       NOTRUN -> [FAIL][449] +21 other tests fail
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@gem_busy@busy.html

  * igt@gem_lmem_swapping@verify-random:
    - {bat-arls-2}:       NOTRUN -> [SKIP][450] +3 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - {bat-dg2-14}:       [SKIP][451] ([i915#4083]) -> [FAIL][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@gem_mmap@basic.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - {bat-dg2-14}:       [SKIP][453] ([i915#4079]) -> [FAIL][454] +1 other test fail
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@gem_render_tiled_blits@basic.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - {bat-dg2-14}:       [SKIP][455] ([i915#4077]) -> [FAIL][456] +2 other tests fail
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - {bat-adls-6}:       [SKIP][457] ([i915#3282]) -> [FAIL][458]
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@gem_tiled_pread_basic.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - {bat-dg2-14}:       [SKIP][459] ([i915#6621]) -> [FAIL][460]
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@i915_pm_rps@basic-api.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_timelines:
    - {bat-arls-2}:       NOTRUN -> [DMESG-WARN][461] +14 other tests dmesg-warn
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-2/igt@i915_selftest@live@gt_timelines.html

  * igt@i915_selftest@live@objects:
    - {bat-arls-1}:       NOTRUN -> [DMESG-FAIL][462] +38 other tests dmesg-fail
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-1/igt@i915_selftest@live@objects.html
    - {bat-arls-2}:       NOTRUN -> [ABORT][463]
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-2/igt@i915_selftest@live@objects.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - {bat-arls-2}:       NOTRUN -> [FAIL][464] +135 other tests fail
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - {bat-dg2-14}:       [SKIP][465] ([i915#5190]) -> [FAIL][466]
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - {bat-dg2-14}:       [SKIP][467] ([i915#4212]) -> [FAIL][468] +7 other tests fail
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - {bat-dg2-14}:       [SKIP][469] ([i915#4215] / [i915#5190]) -> [FAIL][470]
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@unused-offsets:
    - {bat-dg2-14}:       [PASS][471] -> [FAIL][472] +79 other tests fail
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_addfb_basic@unused-offsets.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - {bat-dg2-13}:       [SKIP][473] ([Intel XE#484]) -> [FAIL][474] +2 other tests fail
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - {bat-dg2-13}:       [PASS][475] -> [FAIL][476] +4 other tests fail
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - {bat-dg2-13}:       [SKIP][477] ([Intel XE#484] / [i915#4550]) -> [FAIL][478] +1 other test fail
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {bat-dg2-14}:       [SKIP][479] ([i915#4103] / [i915#4213]) -> [FAIL][480] +1 other test fail
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - {bat-adls-6}:       [SKIP][481] ([i915#4103]) -> [FAIL][482] +1 other test fail
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - {bat-dg2-14}:       [SKIP][483] ([i915#3555] / [i915#3840]) -> [FAIL][484]
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - {bat-adls-6}:       [SKIP][485] ([i915#3555] / [i915#3840]) -> [FAIL][486]
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - {bat-adls-6}:       [PASS][487] -> [FAIL][488] +98 other tests fail
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - {bat-dg2-14}:       [SKIP][489] ([fdo#109285]) -> [FAIL][490]
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
    - {bat-adls-6}:       [SKIP][491] ([fdo#109285]) -> [FAIL][492]
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - {bat-dg2-14}:       [SKIP][493] ([i915#5274]) -> [FAIL][494]
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - {bat-dg2-14}:       NOTRUN -> [FAIL][495] +21 other tests fail
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - {bat-dg2-14}:       [SKIP][496] ([i915#5354]) -> [FAIL][497]
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - {bat-adls-6}:       [SKIP][498] ([i915#5354]) -> [FAIL][499]
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * {igt@kms_psr@psr-cursor-plane-move}:
    - fi-cfl-guc:         [SKIP][500] ([fdo#109271]) -> [FAIL][501] +3 other tests fail
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
    - bat-mtlp-6:         NOTRUN -> [FAIL][502] +3 other tests fail
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][503] +3 other tests fail
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html
    - fi-pnv-d510:        [SKIP][504] ([fdo#109271]) -> [FAIL][505] +3 other tests fail
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html
    - fi-blb-e6850:       [SKIP][506] ([fdo#109271]) -> [FAIL][507] +3 other tests fail
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-blb-e6850/igt@kms_psr@psr-cursor-plane-move.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-blb-e6850/igt@kms_psr@psr-cursor-plane-move.html
    - bat-adlp-6:         NOTRUN -> [FAIL][508] +3 other tests fail
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html
    - fi-apl-guc:         [SKIP][509] ([fdo#109271]) -> [FAIL][510] +3 other tests fail
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-apl-guc/igt@kms_psr@psr-cursor-plane-move.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-apl-guc/igt@kms_psr@psr-cursor-plane-move.html

  * {igt@kms_psr@psr-primary-mmap-gtt}:
    - fi-bsw-n3050:       [SKIP][511] ([fdo#109271]) -> [FAIL][512] +3 other tests fail
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
    - {bat-adls-6}:       [SKIP][513] ([i915#9732]) -> [FAIL][514] +3 other tests fail
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * {igt@kms_psr@psr-primary-page-flip}:
    - bat-dg1-7:          [SKIP][515] ([i915#9732]) -> [FAIL][516] +3 other tests fail
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
    - fi-glk-j4005:       [SKIP][517] ([fdo#109271]) -> [FAIL][518] +3 other tests fail
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html

  * {igt@kms_psr@psr-sprite-plane-onoff}:
    - bat-adlp-9:         [SKIP][519] ([i915#9673] / [i915#9732]) -> [FAIL][520] +3 other tests fail
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-skl-guc:         [SKIP][521] ([fdo#109271]) -> [FAIL][522] +3 other tests fail
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-guc/igt@kms_psr@psr-sprite-plane-onoff.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-guc/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-11:         [SKIP][523] ([i915#9732]) -> [FAIL][524] +3 other tests fail
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-kbl-7567u:       [SKIP][525] ([fdo#109271]) -> [FAIL][526] +3 other tests fail
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@kms_psr@psr-sprite-plane-onoff.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-cfl-8700k:       [SKIP][527] ([fdo#109271]) -> [FAIL][528] +3 other tests fail
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
    - {bat-dg2-14}:       [SKIP][529] ([i915#9732]) -> [FAIL][530] +3 other tests fail
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-bsw-nick:        [SKIP][531] ([fdo#109271]) -> [FAIL][532] +3 other tests fail
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-kbl-2:          [SKIP][533] ([fdo#109271]) -> [FAIL][534] +3 other tests fail
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-kbl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-kbl-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-rplp-1:         [SKIP][535] ([i915#9673] / [i915#9732]) -> [FAIL][536] +3 other tests fail
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-rkl-11600:       [SKIP][537] ([i915#9732]) -> [FAIL][538] +3 other tests fail
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-atsm-1:         [SKIP][539] ([i915#6078]) -> [FAIL][540] +3 other tests fail
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-jsl-3:          NOTRUN -> [FAIL][541] +3 other tests fail
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-9:          [SKIP][542] ([i915#9673] / [i915#9732]) -> [FAIL][543] +3 other tests fail
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-kbl-x1275:       [SKIP][544] ([fdo#109271]) -> [FAIL][545] +3 other tests fail
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-x1275/igt@kms_psr@psr-sprite-plane-onoff.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-cfl-8109u:       [SKIP][546] ([fdo#109271]) -> [FAIL][547] +3 other tests fail
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8109u/igt@kms_psr@psr-sprite-plane-onoff.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-adln-1:         NOTRUN -> [FAIL][548] +3 other tests fail
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-ivb-3770:        [SKIP][549] ([fdo#109271]) -> [FAIL][550] +3 other tests fail
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ivb-3770/igt@kms_psr@psr-sprite-plane-onoff.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ivb-3770/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-elk-e7500:       [SKIP][551] ([fdo#109271]) -> [FAIL][552] +3 other tests fail
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-elk-e7500/igt@kms_psr@psr-sprite-plane-onoff.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-elk-e7500/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-8:          [SKIP][553] ([i915#9673] / [i915#9732]) -> [FAIL][554] +3 other tests fail
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-kbl-guc:         [SKIP][555] ([fdo#109271]) -> [FAIL][556] +3 other tests fail
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-guc/igt@kms_psr@psr-sprite-plane-onoff.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-guc/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-adlm-1:         [SKIP][557] ([i915#9673] / [i915#9732]) -> [FAIL][558] +3 other tests fail
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-ilk-650:         [SKIP][559] ([fdo#109271]) -> [FAIL][560] +3 other tests fail
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ilk-650/igt@kms_psr@psr-sprite-plane-onoff.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ilk-650/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-jsl-1:          NOTRUN -> [FAIL][561] +3 other tests fail
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-tgl-1115g4:      [SKIP][562] ([i915#9732]) -> [FAIL][563] +3 other tests fail
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - {bat-dg2-14}:       [SKIP][564] ([i915#3555]) -> [FAIL][565]
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
    - {bat-adls-6}:       [SKIP][566] ([i915#3555]) -> [FAIL][567]
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - {bat-dg2-14}:       [SKIP][568] ([i915#3708]) -> [FAIL][569]
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - {bat-dg2-14}:       [SKIP][570] ([i915#3708] / [i915#4077]) -> [FAIL][571] +1 other test fail
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - {bat-adls-6}:       [SKIP][572] ([fdo#109295] / [i915#3291]) -> [FAIL][573] +2 other tests fail
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@prime_vgem@basic-fence-read.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - {bat-dg2-14}:       [SKIP][574] ([i915#3291] / [i915#3708]) -> [FAIL][575] +2 other tests fail
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@prime_vgem@basic-read.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@prime_vgem@basic-read.html

  
Known issues
------------

  Here are the changes found in IGTPW_10617 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@verify-random:
    - bat-mtlp-6:         NOTRUN -> [SKIP][576] ([i915#4613]) +3 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
    - bat-jsl-1:          NOTRUN -> [SKIP][577] ([i915#4613]) +3 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_module_load@reload:
    - fi-kbl-7567u:       [PASS][578] -> [DMESG-FAIL][579] ([i915#180]) +1 other test dmesg-fail
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@i915_module_load@reload.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [PASS][580] -> [DMESG-WARN][581] ([i915#9730]) +36 other tests dmesg-warn
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][582] -> [DMESG-WARN][583] ([i915#180] / [i915#8585]) +2 other tests dmesg-warn
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#10158]: https://gitlab.freedesktop.org/drm/intel/issues/10158
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4303]: https://gitlab.freedesktop.org/drm/intel/issues/4303
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4550]: https://gitlab.freedesktop.org/drm/intel/issues/4550
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9730]: https://gitlab.freedesktop.org/drm/intel/issues/9730
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9875]: https://gitlab.freedesktop.org/drm/intel/issues/9875
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7699 -> IGTPW_10617

  CI-20190529: 20190529
  CI_DRM_14193: c655e0fd280

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/index.html

--===============6662686128351312621==
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
<tr><td><b>Series:</b></td><td>igt_kmod and sysfs fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129398/">https://patchwork.freedesktop.org/series/129398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7699 -&gt; IGTPW_10617</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10617 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10617, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (2): bat-arls-1 bat-arls-2 <br />
  Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10617:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@core_auth@basic-auth.html">FAIL</a> +97 other tests fail</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">FAIL</a> +92 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_basic@bad-close:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@gem_basic@bad-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@gem_basic@bad-close.html">FAIL</a> +97 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_basic@create-close:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-elk-e7500/igt@gem_basic@create-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-elk-e7500/igt@gem_basic@create-close.html">FAIL</a> +98 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@gem_basic@create-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_basic@create-close.html">FAIL</a> +79 other tests fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-nick/igt@gem_basic@create-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-nick/igt@gem_basic@create-close.html">FAIL</a> +98 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-elk-e7500/igt@gem_busy@busy.html">FAIL</a> +21 other tests fail</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_busy@busy.html">FAIL</a> +22 other tests fail</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-guc/igt@gem_busy@busy.html">FAIL</a> +9 other tests fail</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@gem_busy@busy.html">FAIL</a> +9 other tests fail</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@gem_busy@busy.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic-files:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-n3050/igt@gem_ctx_create@basic-files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-n3050/igt@gem_ctx_create@basic-files.html">FAIL</a> +98 other tests fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@gem_ctx_create@basic-files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_ctx_create@basic-files.html">FAIL</a> +61 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ilk-650/igt@gem_exec_basic@basic.html">FAIL</a> +21 other tests fail</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-n3050/igt@gem_exec_basic@basic.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@gem_exec_fence@basic-await.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@gem_exec_fence@basic-busy.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@gem_exec_fence@basic-wait.html">FAIL</a> +21 other tests fail</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@gem_exec_fence@basic-wait.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@gem_exec_fence@nb-await.html">FAIL</a> +9 other tests fail</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-kbl-2/igt@gem_exec_fence@nb-await.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-guc/igt@gem_exec_parallel@engines.html">FAIL</a> +21 other tests fail</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_exec_parallel@engines.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@gem_flink_basic@bad-flink.html">FAIL</a> +97 other tests fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ivb-3770/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ivb-3770/igt@gem_flink_basic@bad-flink.html">FAIL</a> +100 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@gem_linear_blits@basic.html">FAIL</a> +97 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">FAIL</a> +97 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@gem_softpin@allocator-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_softpin@allocator-basic.html">FAIL</a> +79 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@gem_sync@basic-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_sync@basic-each.html">FAIL</a> +40 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-guc/igt@gem_tiled_blits@basic.html">FAIL</a> +94 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-kbl-2/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-kbl-2/igt@gem_tiled_pread_basic.html">FAIL</a> +93 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_wait@busy.html">FAIL</a> +9 other tests fail</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@gem_wait@busy.html">FAIL</a> +21 other tests fail</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@gem_wait@busy.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@gem_wait@wait.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_getparams_basic@basic-eu-total:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@i915_getparams_basic@basic-eu-total.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@i915_getparams_basic@basic-eu-total.html">FAIL</a> +80 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@i915_module_load@reload.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a> +98 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a> +101 other tests fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-glk-j4005/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a> +101 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_addfb_basic@bad-pitch-63.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_addfb_basic@bad-pitch-63.html">FAIL</a> +89 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-blb-e6850/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-blb-e6850/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +92 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8109u/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@kms_addfb_basic@invalid-set-prop.html">FAIL</a> +101 other tests fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">FAIL</a> +99 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html">FAIL</a> +79 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-guc/igt@kms_addfb_basic@size-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-guc/igt@kms_addfb_basic@size-max.html">FAIL</a> +102 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-6600u/igt@kms_addfb_basic@small-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@kms_addfb_basic@small-bo.html">FAIL</a> +101 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8700k/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@kms_addfb_basic@too-high.html">FAIL</a> +101 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ivb-3770/igt@kms_busy@basic.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-1/igt@kms_flip@basic-flip-vs-modeset.html">FAIL</a> +131 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +21 other tests fail</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-blb-e6850/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +21 other tests fail</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +21 other tests fail</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-llseek-bad:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ilk-650/igt@prime_self_import@basic-llseek-bad.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ilk-650/igt@prime_self_import@basic-llseek-bad.html">FAIL</a> +100 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@prime_self_import@basic-llseek-bad.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@prime_self_import@basic-llseek-bad.html">FAIL</a> +93 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-pnv-d510/igt@prime_vgem@basic-fence-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-pnv-d510/igt@prime_vgem@basic-fence-mmap.html">FAIL</a> +89 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-guc/igt@prime_vgem@basic-read.html">FAIL</a> +102 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3826">i915#3826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ivb-3770/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ivb-3770/igt@gem_huc_copy@huc-copy.html">FAIL</a> +8 other tests fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html">FAIL</a> +10 other tests fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-nick/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-nick/igt@gem_huc_copy@huc-copy.html">FAIL</a> +10 other tests fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ilk-650/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ilk-650/igt@gem_huc_copy@huc-copy.html">FAIL</a> +8 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_mmap@basic.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@gem_mmap@basic.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@gem_mmap@basic.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_mmap@basic.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_mmap@basic.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_mmap@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@gem_mmap_gtt@basic.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_mmap_gtt@basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@gem_render_tiled_blits@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-n3050/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-n3050/igt@gem_tiled_blits@basic.html">FAIL</a> +10 other tests fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_tiled_blits@basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">FAIL</a> +7 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_addfb_basic@size-max.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4303">i915#4303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_busy@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +6 other tests fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +6 other tests fail</li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9875">i915#9875</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +16 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10158">i915#10158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-guc/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-guc/igt@kms_dsc@dsc-basic.html">FAIL</a> +6 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_flip@basic-plain-flip.html">FAIL</a> +3 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_flip@basic-plain-flip.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a> +6 other tests fail</li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a> +6 other tests fail</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6093">i915#6093</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a> +4 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> +10 other tests fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-pnv-d510/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-pnv-d510/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> +19 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html">FAIL</a> +16 other tests fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html">FAIL</a> +27 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">FAIL</a> +6 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7357">i915#7357</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_prop_blob@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6094">i915#6094</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html">FAIL</a> +1 other test fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@prime_vgem@basic-fence-read.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@prime_vgem@basic-fence-read.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@prime_vgem@basic-read.html">FAIL</a> +2 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@prime_vgem@basic-read.html">FAIL</a> +2 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@prime_vgem@basic-read.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@prime_vgem@basic-write.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@prime_vgem@basic-write.html">FAIL</a> +2 other tests fail</li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adln-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@prime_vgem@basic-write.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@prime_vgem@basic-write.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@prime_vgem@basic-write.html">FAIL</a> +2 other tests fail</li>
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
<li>{bat-arls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@debugfs_test@basic-hwmon.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy:</p>
<ul>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@gem_busy@busy.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>{bat-arls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@gem_mmap@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@gem_render_tiled_blits@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@gem_tiled_pread_basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@i915_pm_rps@basic-api.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>{bat-arls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-2/igt@i915_selftest@live@gt_timelines.html">DMESG-WARN</a> +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>{bat-arls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-1/igt@i915_selftest@live@objects.html">DMESG-FAIL</a> +38 other tests dmesg-fail</li>
<li>{bat-arls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-2/igt@i915_selftest@live@objects.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>{bat-arls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-arls-2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">FAIL</a> +135 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_addfb_basic@unused-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_addfb_basic@unused-offsets.html">FAIL</a> +79 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-13/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4550">i915#4550</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +98 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr-cursor-plane-move}:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-6600u/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-blb-e6850/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-blb-e6850/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-6/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-apl-guc/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-apl-guc/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr-primary-mmap-gtt}:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +3 other tests fail</li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr-primary-page-flip}:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr-sprite-plane-onoff}:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-skl-guc/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-skl-guc/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-kbl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-kbl-2/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-atsm-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-atsm-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-3/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-x1275/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-x1275/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-cfl-8109u/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-cfl-8109u/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adln-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ivb-3770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ivb-3770/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-elk-e7500/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-elk-e7500/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-guc/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-guc/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-ilk-650/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-ilk-650/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-adls-6/igt@prime_vgem@basic-fence-read.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-dg2-14/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-dg2-14/igt@prime_vgem@basic-read.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10617 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) +36 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7699 -&gt; IGTPW_10617</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14193: c655e0fd280</p>

</body>
</html>

--===============6662686128351312621==--
