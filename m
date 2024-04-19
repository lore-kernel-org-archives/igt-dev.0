Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B77C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 00:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9528211A0C4;
	Fri, 19 Apr 2024 00:35:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AEB113FEE;
 Fri, 19 Apr 2024 00:35:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3129734679328422316=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_cleanup_and_fixes_for_kms?=
 =?utf-8?q?=5Fbig=5Fjoiner_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Apr 2024 00:35:21 -0000
Message-ID: <171348692154.1501116.14763729008599132092@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418152817.2352850-1-kunal1.joshi@intel.com>
In-Reply-To: <20240418152817.2352850-1-kunal1.joshi@intel.com>
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

--===============3129734679328422316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: cleanup and fixes for kms_big_joiner (rev2)
URL   : https://patchwork.freedesktop.org/series/132554/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14607 -> IGTPW_11042
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11042 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11042, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/index.html

Participating hosts (37 -> 40)
------------------------------

  Additional (4): bat-kbl-2 bat-mtlp-6 bat-jsl-1 fi-elk-e7500 
  Missing    (1): bat-atsm-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11042:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_basic@create-close:
    - bat-arls-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-arls-2/igt@gem_basic@create-close.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-2/igt@gem_basic@create-close.html

  * igt@kms_big_joiner@basic-force-joiner:
    - bat-jsl-3:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-3/igt@kms_big_joiner@basic-force-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_big_joiner@basic-force-joiner@single:
    - bat-adls-6:         NOTRUN -> [FAIL][5] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adls-6/igt@kms_big_joiner@basic-force-joiner@single.html

  * igt@kms_busy@basic@modeset:
    - fi-ivb-3770:        [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-ivb-3770/igt@kms_busy@basic@modeset.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-ivb-3770/igt@kms_busy@basic@modeset.html
    - fi-ilk-650:         [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-ilk-650/igt@kms_busy@basic@modeset.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-ilk-650/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adln-1:         [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_joiner@invalid-modeset-force-joiner@big_joiner_on_last_pipe:
    - {bat-rpls-4}:       NOTRUN -> [FAIL][13] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-rpls-4/igt@kms_big_joiner@invalid-modeset-force-joiner@big_joiner_on_last_pipe.html

  
Known issues
------------

  Here are the changes found in IGTPW_11042 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][14] ([i915#9318])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] ([i915#9318])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-mtlp-6:         NOTRUN -> [SKIP][16] ([i915#1849] / [i915#2582])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@fbdev@info.html

  * igt@fbdev@write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][17] ([i915#2582]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@fbdev@write.html

  * igt@gem_close_race@basic-process:
    - bat-mtlp-6:         NOTRUN -> [DMESG-WARN][18] ([i915#10875])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@gem_close_race@basic-process.html

  * igt@gem_exec_basic@basic:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][19] ([i915#2295])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-rkl-11600/igt@gem_exec_basic@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-elk-e7500:       NOTRUN -> [SKIP][20] +9 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][21] ([i915#2190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@i915_module_load@load:
    - bat-kbl-2:          NOTRUN -> [INCOMPLETE][22] ([i915#10877])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-kbl-2/igt@i915_module_load@load.html

  * igt@kms_big_joiner@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][23] +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-apl-guc/igt@kms_big_joiner@basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][24] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-pnv-d510/igt@kms_big_joiner@basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#10656]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-dg1-7/igt@kms_big_joiner@basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][26] ([i915#10656]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adlp-9/igt@kms_big_joiner@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][27] ([i915#10656]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-dg2-11/igt@kms_big_joiner@basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][28] +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-kbl-7567u/igt@kms_big_joiner@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][29] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-8700k/igt@kms_big_joiner@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][30] ([i915#10656]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-dg2-14/igt@kms_big_joiner@basic.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][31] +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-bsw-nick/igt@kms_big_joiner@basic.html
    - bat-rplp-1:         NOTRUN -> [SKIP][32] ([i915#10656]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-rplp-1/igt@kms_big_joiner@basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][33] ([i915#10656]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-rkl-11600/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - fi-cfl-guc:         NOTRUN -> [SKIP][34] +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-guc/igt@kms_big_joiner@invalid-modeset.html
    - bat-jsl-3:          NOTRUN -> [SKIP][35] ([i915#10656]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html
    - bat-dg2-9:          NOTRUN -> [SKIP][36] ([i915#10656]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-dg2-9/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlp-11:        NOTRUN -> [SKIP][37] ([i915#10656]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adlp-11/igt@kms_big_joiner@invalid-modeset.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][38] +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-8109u/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-2:         NOTRUN -> [SKIP][39] ([i915#10656]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-2/igt@kms_big_joiner@invalid-modeset.html
    - bat-adln-1:         NOTRUN -> [SKIP][40] ([i915#10656]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adln-1/igt@kms_big_joiner@invalid-modeset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][41] +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][42] ([i915#10656]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-8/igt@kms_big_joiner@invalid-modeset.html
    - bat-adls-6:         NOTRUN -> [SKIP][43] ([i915#10656]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html
    - fi-ilk-650:         NOTRUN -> [SKIP][44] +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-ilk-650/igt@kms_big_joiner@invalid-modeset.html
    - bat-jsl-1:          NOTRUN -> [SKIP][45] ([i915#10656]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_big_joiner@invalid-modeset.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][46] ([i915#10656]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-tgl-1115g4/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-1:         NOTRUN -> [SKIP][47] ([i915#10656]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][48] +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-blb-e6850/igt@kms_big_joiner@invalid-modeset.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][49] +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-bsw-n3050/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-3:         NOTRUN -> [SKIP][50] ([i915#10656]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-3/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlp-6:         NOTRUN -> [SKIP][51] ([i915#10656]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adlp-6/igt@kms_big_joiner@invalid-modeset.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][52] ([i915#10656] / [i915#9792]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - bat-mtlp-6:         NOTRUN -> [SKIP][53] ([i915#10656]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][54] ([i915#4103]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arls-1:         NOTRUN -> [SKIP][55] ([i915#10202]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-arls-1:         NOTRUN -> [ABORT][56] ([i915#10875])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][57] ([i915#3555] / [i915#9886])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-jsl-1:          NOTRUN -> [INCOMPLETE][58] ([i915#10876])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  
#### Possible fixes ####

  * igt@kms_busy@basic@flip:
    - {bat-mtlp-9}:       [ABORT][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-mtlp-9/igt@kms_busy@basic@flip.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-9/igt@kms_busy@basic@flip.html
    - fi-apl-guc:         [INCOMPLETE][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-apl-guc/igt@kms_busy@basic@flip.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-apl-guc/igt@kms_busy@basic@flip.html
    - fi-pnv-d510:        [ABORT][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-pnv-d510/igt@kms_busy@basic@flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-pnv-d510/igt@kms_busy@basic@flip.html
    - {bat-rpls-4}:       [ABORT][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-rpls-4/igt@kms_busy@basic@flip.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-rpls-4/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - bat-arls-1:         [ABORT][67] ([i915#10875]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-arls-1/igt@kms_busy@basic@modeset.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-1/igt@kms_busy@basic@modeset.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - fi-cfl-8109u:       [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html

  
#### Warnings ####

  * igt@kms_busy@basic@modeset:
    - fi-pnv-d510:        [SKIP][71] -> [ABORT][72] ([i915#10875])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-pnv-d510/igt@kms_busy@basic@modeset.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-pnv-d510/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10656]: https://gitlab.freedesktop.org/drm/intel/issues/10656
  [i915#10875]: https://gitlab.freedesktop.org/drm/intel/issues/10875
  [i915#10876]: https://gitlab.freedesktop.org/drm/intel/issues/10876
  [i915#10877]: https://gitlab.freedesktop.org/drm/intel/issues/10877
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7813 -> IGTPW_11042

  CI-20190529: 20190529
  CI_DRM_14607: cabe88f47c1f688f4493de88acc532bf584efe3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11042: 7ef2322011f4c3919ba5cd773cf332b4e7498f10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/index.html

--===============3129734679328422316==
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
<tr><td><b>Series:</b></td><td>cleanup and fixes for kms_big_joiner (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132554/">https://patchwork.freedesktop.org/series/132554/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14607 -&gt; IGTPW_11042</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11042 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11042, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/index.html</p>
<h2>Participating hosts (37 -&gt; 40)</h2>
<p>Additional (4): bat-kbl-2 bat-mtlp-6 bat-jsl-1 fi-elk-e7500 <br />
  Missing    (1): bat-atsm-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11042:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_basic@create-close:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-arls-2/igt@gem_basic@create-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-2/igt@gem_basic@create-close.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-3/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner@single:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adls-6/igt@kms_big_joiner@basic-force-joiner@single.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-ivb-3770/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-ivb-3770/igt@kms_busy@basic@modeset.html">INCOMPLETE</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-ilk-650/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-ilk-650/igt@kms_busy@basic@modeset.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_big_joiner@invalid-modeset-force-joiner@big_joiner_on_last_pipe:<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-rpls-4/igt@kms_big_joiner@invalid-modeset-force-joiner@big_joiner_on_last_pipe.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11042 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@gem_close_race@basic-process.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-rkl-11600/igt@gem_exec_basic@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html">SKIP</a> +9 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-kbl-2/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10877">i915#10877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-apl-guc/igt@kms_big_joiner@basic.html">SKIP</a> +6 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-pnv-d510/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-dg1-7/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adlp-9/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-dg2-11/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-kbl-7567u/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-8700k/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-dg2-14/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-bsw-nick/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-rplp-1/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-rkl-11600/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-guc/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-dg2-9/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adlp-11/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-8109u/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adln-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-ilk-650/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-tgl-1115g4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-blb-e6850/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-bsw-n3050/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-6/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10876">i915#10876</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-mtlp-9/igt@kms_busy@basic@flip.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-mtlp-9/igt@kms_busy@basic@flip.html">PASS</a></li>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-apl-guc/igt@kms_busy@basic@flip.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-apl-guc/igt@kms_busy@basic@flip.html">PASS</a></li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-pnv-d510/igt@kms_busy@basic@flip.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-pnv-d510/igt@kms_busy@basic@flip.html">PASS</a></li>
<li>{bat-rpls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-rpls-4/igt@kms_busy@basic@flip.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-rpls-4/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/bat-arls-1/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/bat-arls-1/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_busy@basic@modeset:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14607/fi-pnv-d510/igt@kms_busy@basic@modeset.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11042/fi-pnv-d510/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7813 -&gt; IGTPW_11042</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14607: cabe88f47c1f688f4493de88acc532bf584efe3c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11042: 7ef2322011f4c3919ba5cd773cf332b4e7498f10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3129734679328422316==--
