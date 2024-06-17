Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FF3C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 17:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF83010E1B7;
	Mon, 17 Jun 2024 17:42:03 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D463010E1B7;
 Mon, 17 Jun 2024 17:42:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4790302301666677870=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_add_subtest_in_kms=5Fbw_for?=
 =?utf-8?q?_connected_outputs_only_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Jun 2024 17:42:02 -0000
Message-ID: <171864612285.99140.4778850061962736822@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617161052.1113250-1-kunal1.joshi@intel.com>
In-Reply-To: <20240617161052.1113250-1-kunal1.joshi@intel.com>
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

--===============4790302301666677870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add subtest in kms_bw for connected outputs only (rev2)
URL   : https://patchwork.freedesktop.org/series/134822/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14957 -> IGTPW_11266
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11266 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11266, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/index.html

Participating hosts (41 -> 41)
------------------------------

  Additional (3): fi-kbl-7567u bat-kbl-2 fi-elk-e7500 
  Missing    (3): bat-adlp-9 bat-dg2-11 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11266:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][1] +63 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-dg2-14/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p} (NEW):
    - {bat-arls-5}:       NOTRUN -> [SKIP][2] +43 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][3] +55 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-dg2-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - bat-adls-6:         NOTRUN -> [SKIP][4] +51 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adls-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][5] +55 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-jsl-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][6] +57 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-tgl-1115g4/igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p} (NEW):
    - {bat-arlh-2}:       NOTRUN -> [SKIP][7] +47 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-2/igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p} (NEW):
    - bat-adln-1:         NOTRUN -> [SKIP][8] +52 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adln-1/igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - bat-jsl-1:          NOTRUN -> [SKIP][9] +55 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-jsl-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - bat-adlp-6:         NOTRUN -> [SKIP][10] +52 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - bat-arls-1:         NOTRUN -> [SKIP][11] +59 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * {igt@kms_bw@linear-tiling-5-displays-2160x1440p} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][12] +63 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-8/igt@kms_bw@linear-tiling-5-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-6-displays-1920x1080p (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] +57 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-rkl-11600/igt@kms_bw@linear-tiling-6-displays-1920x1080p.html

  * {igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):
    - {bat-rpls-4}:       NOTRUN -> [SKIP][14] +44 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-rpls-4/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][15] +43 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-twl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - bat-rplp-1:         NOTRUN -> [SKIP][16] +55 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-rplp-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-1920x1080p} (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][17] +55 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-2/igt@kms_bw@linear-tiling-7-displays-1920x1080p.html

  * {igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][18] +60 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-dg1-7/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):
    - {bat-arlh-1}:       NOTRUN -> [SKIP][19] +43 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][20] +43 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_engines:
    - {bat-arlh-1}:       [PASS][23] -> [INCOMPLETE][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-arlh-1/igt@i915_selftest@live@gt_engines.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-1/igt@i915_selftest@live@gt_engines.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - {bat-rpls-4}:       NOTRUN -> [SKIP][25] +15 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-rpls-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][26] +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-twl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - {bat-arls-5}:       NOTRUN -> [SKIP][27] +15 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - {bat-arlh-2}:       NOTRUN -> [SKIP][28] +15 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - {bat-arlh-1}:       NOTRUN -> [SKIP][29] +11 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][30] +16 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14957 and IGTPW_11266:

### New IGT tests (48) ###

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - Statuses : 27 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - Statuses : 26 pass(s) 14 skip(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - Statuses : 24 pass(s) 16 skip(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - Statuses : 17 pass(s) 23 skip(s)
    - Exec time: [0.0, 1.69] s

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-5-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-6-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-1920x1080p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-2160x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-2560x1440p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-3840x2160p:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11266 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][31] ([i915#1849])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][32] ([i915#2190])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][33] +103 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][34] ([i915#4613]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html

  * {igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][35] +83 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-elk-e7500/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):
    - fi-kbl-guc:         NOTRUN -> [SKIP][36] +63 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-guc/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p} (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][37] ([i915#9197]) +63 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-dg2-9/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][38] +63 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-x1275/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html
    - bat-adlp-11:        NOTRUN -> [SKIP][39] ([i915#10470]) +63 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adlp-11/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html

  * {igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][40] +59 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-bsw-nick/igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p.html

  * {igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][41] +57 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-cfl-8700k/igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - fi-blb-e6850:       NOTRUN -> [SKIP][42] +63 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-blb-e6850/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - bat-adlm-1:         NOTRUN -> [SKIP][43] ([i915#9900]) +63 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adlm-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - fi-pnv-d510:        NOTRUN -> [SKIP][44] +63 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-pnv-d510/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - fi-cfl-guc:         NOTRUN -> [SKIP][45] +57 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-cfl-guc/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][46] ([i915#9792]) +63 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][47] +59 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-bsw-n3050/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-5-displays-3840x2160p (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][48] +55 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-ivb-3770/igt@kms_bw@linear-tiling-5-displays-3840x2160p.html

  * {igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][49] +67 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-7567u/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - {bat-apl-1}:        NOTRUN -> [SKIP][50] +43 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-apl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-6-displays-2560x1440p (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][51] +55 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-ilk-650/igt@kms_bw@linear-tiling-6-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][52] +47 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-glk-j4005/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][53] ([i915#6078]) +63 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-atsm-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {bat-mtlp-9}:       [DMESG-WARN][54] ([i915#11009]) -> [PASS][55] +4 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - {bat-mtlp-9}:       [SKIP][56] ([i915#10580]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp7:
    - {bat-mtlp-9}:       [FAIL][58] ([i915#6121]) -> [PASS][59] +3 other tests pass
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-2:         [DMESG-WARN][60] ([i915#7507]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11060
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9224]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9224
  [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7890 -> IGTPW_11266

  CI-20190529: 20190529
  CI_DRM_14957: 3b4eab7e82c7a1429e257890553ad571f320b8a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11266: 11266
  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/index.html

--===============4790302301666677870==
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
<tr><td><b>Series:</b></td><td>add subtest in kms_bw for connected outputs only (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134822/">https://patchwork.freedesktop.org/series/134822/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14957 -&gt; IGTPW_11266</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11266 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11266, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/index.html</p>
<h2>Participating hosts (41 -&gt; 41)</h2>
<p>Additional (3): fi-kbl-7567u bat-kbl-2 fi-elk-e7500 <br />
  Missing    (3): bat-adlp-9 bat-dg2-11 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11266:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-dg2-14/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p} (NEW):</p>
<ul>
<li>{bat-arls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-dg2-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +55 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adls-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-jsl-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-tgl-1115g4/igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p} (NEW):</p>
<ul>
<li>{bat-arlh-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-2/igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adln-1/igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-jsl-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-5-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-8/igt@kms_bw@linear-tiling-5-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-1920x1080p (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-rkl-11600/igt@kms_bw@linear-tiling-6-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-rpls-4/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +44 other tests skip</li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-twl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +43 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-rplp-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-1920x1080p} (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-2/igt@kms_bw@linear-tiling-7-displays-1920x1080p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-dg1-7/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):</p>
<ul>
<li>{bat-arlh-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> +43 other tests skip</li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>{bat-arlh-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-arlh-1/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-1/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-rpls-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +15 other tests skip</li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-twl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +8 other tests skip</li>
<li>{bat-arls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>{bat-arlh-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>{bat-arlh-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arlh-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> +11 other tests skip</li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14957 and IGTPW_11266:</p>
<h3>New IGT tests (48)</h3>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>Statuses : 27 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>Statuses : 26 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>Statuses : 24 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>Statuses : 17 pass(s) 23 skip(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-1920x1080p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-2160x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-2560x1440p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-3840x2160p:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11266 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +103 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-elk-e7500/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +83 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-guc/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-dg2-9/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +63 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-x1275/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adlp-11/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p} (NEW):</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-bsw-nick/igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-cfl-8700k/igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-blb-e6850/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-adlm-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-pnv-d510/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-cfl-guc/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-bsw-n3050/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-3840x2160p (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-ivb-3770/igt@kms_bw@linear-tiling-5-displays-3840x2160p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-kbl-7567u/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +67 other tests skip</li>
<li>{bat-apl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-apl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2560x1440p (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-ilk-650/igt@kms_bw@linear-tiling-6-displays-2560x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/fi-glk-j4005/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-atsm-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +63 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580">i915#10580</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14957/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507">i915#7507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11266/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7890 -&gt; IGTPW_11266</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14957: 3b4eab7e82c7a1429e257890553ad571f320b8a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11266: 11266<br />
  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4790302301666677870==--
