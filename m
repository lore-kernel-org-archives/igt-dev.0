Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6108D59D64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 22:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D35710E120;
	Mon, 25 Nov 2024 22:51:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5FD10E17A;
 Mon, 25 Nov 2024 22:51:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/i915/pm=5Frc6=5Fres?=
 =?utf-8?q?idency=3A_Replace_waitboost_with?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 22:51:47 -0000
Message-ID: <173257510798.3028787.9305949287254953758@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125155857.2561292-1-sk.anirban@intel.com>
In-Reply-To: <20241125155857.2561292-1-sk.anirban@intel.com>
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

== Series Details ==

Series: tests/i915/pm_rc6_residency: Replace waitboost with
URL   : https://patchwork.freedesktop.org/series/141759/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8125 -> IGTPW_12192
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12192 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12192, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12192:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_lmem_swapping@parallel-random-engines@lmem0:
    - bat-dg2-14:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-dg2-14/igt@gem_lmem_swapping@parallel-random-engines@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg2-14/igt@gem_lmem_swapping@parallel-random-engines@lmem0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - bat-mtlp-8:         NOTRUN -> [FAIL][3] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-mtlp-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0:
    - bat-mtlp-6:         NOTRUN -> [FAIL][4] +5 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-mtlp-6/igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt1-vecs0:
    - bat-arlh-2:         NOTRUN -> [FAIL][5] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-arlh-2/igt@i915_pm_rc6_residency@rc6-idle@gt1-vecs0.html
    - bat-arlh-3:         NOTRUN -> [FAIL][6] +5 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-arlh-3/igt@i915_pm_rc6_residency@rc6-idle@gt1-vecs0.html
    - bat-arls-5:         NOTRUN -> [FAIL][7] +5 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-arls-5/igt@i915_pm_rc6_residency@rc6-idle@gt1-vecs0.html

  * igt@i915_selftest@live@guc_hang:
    - bat-adlp-9:         [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-adlp-9/igt@i915_selftest@live@guc_hang.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-adlp-9/igt@i915_selftest@live@guc_hang.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - {bat-mtlp-9}:       NOTRUN -> [FAIL][10] +5 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-mtlp-9/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - {bat-arls-6}:       NOTRUN -> [FAIL][11] +5 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-arls-6/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_12192 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_tiled_blits@basic:
    - fi-pnv-d510:        [PASS][12] -> [SKIP][13] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/fi-pnv-d510/igt@gem_tiled_blits@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/fi-pnv-d510/igt@gem_tiled_blits@basic.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - fi-tgl-1115g4:      NOTRUN -> [WARN][14] ([i915#2681]) +4 other tests warn
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-dg2-9:          NOTRUN -> [FAIL][15] ([i915#12548] / [i915#3591]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg2-9/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-dg1-6:          NOTRUN -> [FAIL][16] ([i915#12548] / [i915#3591]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg1-6/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-dg2-14:         NOTRUN -> [FAIL][17] ([i915#12548] / [i915#3591])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg2-14/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-dg2-8:          NOTRUN -> [FAIL][18] ([i915#12548] / [i915#3591])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg2-8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - fi-ilk-650:         NOTRUN -> [SKIP][19] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][20] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - fi-bsw-nick:        NOTRUN -> [ABORT][21] ([i915#12957]) +1 other test abort
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][22] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - fi-elk-e7500:       NOTRUN -> [SKIP][23] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
    - fi-hsw-4770:        NOTRUN -> [WARN][24] ([i915#2681]) +1 other test warn
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/fi-hsw-4770/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - bat-dg2-8:          NOTRUN -> [FAIL][25] ([i915#12739] / [i915#3591])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg2-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
    - bat-dg2-9:          NOTRUN -> [FAIL][26] ([i915#12739] / [i915#3591])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg2-9/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
    - bat-dg2-14:         NOTRUN -> [FAIL][27] ([i915#12739] / [i915#3591])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg2-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_selftest@live:
    - bat-adlp-9:         [PASS][28] -> [ABORT][29] ([i915#12435])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-adlp-9/igt@i915_selftest@live.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-adlp-9/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [FAIL][30] ([i915#12903]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - {bat-arls-6}:       [ABORT][32] ([i915#12061]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12548
  [i915#12739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12739
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12957]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12957
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8125 -> IGTPW_12192

  CI-20190529: 20190529
  CI_DRM_15743: 6510562075d8541c218e72188f9ef339f8ba371f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12192: 12192
  IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12192/index.html
