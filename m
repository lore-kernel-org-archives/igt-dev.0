Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952C9C27C79
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 19:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E5F10EDA3;
	Wed, 19 Jun 2024 19:30:16 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02010EDA3;
 Wed, 19 Jun 2024 19:30:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3702685583466694157=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_add_subtest_in_kms=5Fbw_for?=
 =?utf-8?q?_connected_outputs_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jun 2024 19:30:14 -0000
Message-ID: <171882541436.124989.3201317140678649084@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619080408.1161329-1-kunal1.joshi@intel.com>
In-Reply-To: <20240619080408.1161329-1-kunal1.joshi@intel.com>
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

--===============3702685583466694157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add subtest in kms_bw for connected outputs only
URL   : https://patchwork.freedesktop.org/series/135049/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7893 -> IGTPW_11280
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11280 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11280, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (3): fi-cfl-8109u bat-mtlp-8 fi-elk-e7500 
  Missing    (3): bat-mtlp-6 fi-snb-2520m bat-jsl-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11280:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][1] +63 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-dg2-14/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p} (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][2] +59 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arls-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][3] +55 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-dg2-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - bat-adls-6:         NOTRUN -> [SKIP][4] +48 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adls-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] +57 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-tgl-1115g4/igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p} (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][6] +63 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arlh-2/igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p} (NEW):
    - bat-adln-1:         NOTRUN -> [SKIP][7] +52 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adln-1/igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - bat-adlp-6:         NOTRUN -> [SKIP][8] +48 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - bat-arls-1:         NOTRUN -> [SKIP][9] +59 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arls-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * {igt@kms_bw@linear-tiling-5-displays-2160x1440p} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][10] +63 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_bw@linear-tiling-5-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-6-displays-1920x1080p (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][11] +57 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-rkl-11600/igt@kms_bw@linear-tiling-6-displays-1920x1080p.html

  * {igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):
    - {bat-rpls-4}:       NOTRUN -> [SKIP][12] +44 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-rpls-4/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][13] +43 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-twl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - bat-rplp-1:         NOTRUN -> [SKIP][14] +55 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-rplp-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-1920x1080p} (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][15] +55 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arls-2/igt@kms_bw@linear-tiling-7-displays-1920x1080p.html

  * {igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][16] +60 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-dg1-7/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html
    - bat-adlp-9:         NOTRUN -> [SKIP][17] +55 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adlp-9/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):
    - bat-arlh-1:         NOTRUN -> [SKIP][18] +55 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arlh-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][19] +39 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - {bat-rpls-4}:       NOTRUN -> [SKIP][20] +15 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-rpls-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][21] +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-twl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][22] +15 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  
New tests
---------

  New tests have been introduced between IGT_7893 and IGTPW_11280:

### New IGT tests (48) ###

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - Statuses : 24 pass(s) 14 skip(s)
    - Exec time: [0.0, 1.29] s

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - Statuses : 22 pass(s) 16 skip(s)
    - Exec time: [0.0, 1.59] s

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - Statuses : 21 pass(s) 17 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - Statuses : 1 dmesg-warn(s) 13 pass(s) 24 skip(s)
    - Exec time: [0.0, 5.09] s

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 2.19] s

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 1.98] s

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - Statuses : 1 dmesg-warn(s) 3 pass(s) 34 skip(s)
    - Exec time: [0.0, 5.52] s

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - Statuses : 2 pass(s) 36 skip(s)
    - Exec time: [0.0, 0.81] s

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-6-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-7-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-5-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-5-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-1920x1080p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-2160x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-2560x1440p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-3840x2160p:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11280 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-mtlp-8:         NOTRUN -> [SKIP][23] ([i915#9318])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][24] ([i915#2190])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-mtlp-8:         NOTRUN -> [SKIP][25] ([i915#4613]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][26] ([i915#4613]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][27] ([i915#4083])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][28] ([i915#4079]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][29] ([i915#4077]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-8:         NOTRUN -> [SKIP][30] ([i915#6621])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][31] ([i915#5190])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][32] ([i915#4212]) +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * {igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p} (NEW):
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][33] ([i915#10580]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * {igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][34] +83 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-elk-e7500/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
    - bat-kbl-2:          NOTRUN -> [SKIP][35] +63 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-kbl-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
    - {bat-mtlp-9}:       NOTRUN -> [DMESG-WARN][36] ([i915#11009]) +1 other test dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):
    - fi-kbl-guc:         NOTRUN -> [SKIP][37] +63 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-kbl-guc/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p} (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][38] ([i915#9197]) +63 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-dg2-9/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][39] +63 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-kbl-x1275/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html
    - bat-adlp-11:        NOTRUN -> [SKIP][40] ([i915#10470]) +63 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adlp-11/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html

  * {igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][41] +57 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-8700k/igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - fi-blb-e6850:       NOTRUN -> [SKIP][42] +63 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-blb-e6850/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - bat-adlm-1:         NOTRUN -> [SKIP][43] ([i915#9900]) +63 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adlm-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][44] +59 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-8109u/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - fi-pnv-d510:        NOTRUN -> [SKIP][45] +63 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-pnv-d510/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - fi-cfl-guc:         NOTRUN -> [SKIP][46] +57 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-guc/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][47] +63 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-bsw-n3050/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-5-displays-3840x2160p (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][48] +55 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-ivb-3770/igt@kms_bw@linear-tiling-5-displays-3840x2160p.html

  * {igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][49] +55 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-kbl-7567u/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - {bat-apl-1}:        NOTRUN -> [SKIP][50] +47 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-apl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-6-displays-2560x1440p (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][51] +55 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-ilk-650/igt@kms_bw@linear-tiling-6-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][52] +47 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-glk-j4005/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][53] ([i915#6078]) +63 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-atsm-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][54] ([i915#4213]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][55] ([i915#3555] / [i915#3840] / [i915#9159])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-mtlp-8:         NOTRUN -> [SKIP][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-8:         NOTRUN -> [SKIP][57] ([i915#5274])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-2:         [PASS][58] -> [DMESG-WARN][59] ([i915#7507])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][60] ([i915#4077] / [i915#9688])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-mtlp-8:         NOTRUN -> [SKIP][61] ([i915#3555] / [i915#8809])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][62] ([i915#3708]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-mtlp-8:         NOTRUN -> [SKIP][63] ([i915#3708] / [i915#4077]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-8:         NOTRUN -> [SKIP][64] ([i915#10216] / [i915#3708])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {bat-mtlp-9}:       [DMESG-WARN][65] ([i915#11349]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@flip:
    - {bat-apl-1}:        [DMESG-WARN][67] ([i915#180] / [i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-apl-1/igt@kms_busy@basic@flip.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-apl-1/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp6:
    - {bat-mtlp-9}:       [DMESG-FAIL][69] ([i915#11009]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@a-dp6.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@a-dp6.html

  * igt@kms_hdmi_inject@inject-audio:
    - {bat-mtlp-9}:       [DMESG-WARN][71] ([i915#11009]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-mtlp-9/igt@kms_hdmi_inject@inject-audio.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11395]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11395
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7893 -> IGTPW_11280

  CI-20190529: 20190529
  CI_DRM_14973: 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11280: 57f4b82dfe38488fca5b1c3f1fe173b46efb28d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/index.html

--===============3702685583466694157==
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
<tr><td><b>Series:</b></td><td>add subtest in kms_bw for connected outputs only</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135049/">https://patchwork.freedesktop.org/series/135049/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7893 -&gt; IGTPW_11280</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11280 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11280, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (3): fi-cfl-8109u bat-mtlp-8 fi-elk-e7500 <br />
  Missing    (3): bat-mtlp-6 fi-snb-2520m bat-jsl-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11280:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-dg2-14/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arls-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-dg2-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +55 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adls-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-tgl-1115g4/igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arlh-2/igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adln-1/igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arls-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-5-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_bw@linear-tiling-5-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-1920x1080p (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-rkl-11600/igt@kms_bw@linear-tiling-6-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-rpls-4/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +44 other tests skip</li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-twl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +43 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-rplp-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-1920x1080p} (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arls-2/igt@kms_bw@linear-tiling-7-displays-1920x1080p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-dg1-7/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html">SKIP</a> +60 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adlp-9/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-arlh-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arlh-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> +55 other tests skip</li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-rpls-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +15 other tests skip</li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-twl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7893 and IGTPW_11280:</p>
<h3>New IGT tests (48)</h3>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>Statuses : 24 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>Statuses : 22 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>Statuses : 21 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 13 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 5.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 3 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>Statuses : 2 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-1920x1080p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-2160x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-2560x1440p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-3840x2160p:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11280 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p} (NEW):</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580">i915#10580</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-elk-e7500/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +83 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-kbl-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-kbl-guc/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-dg2-9/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +63 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-kbl-x1275/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adlp-11/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-8700k/igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-blb-e6850/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-adlm-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-8109u/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-pnv-d510/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-cfl-guc/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-bsw-n3050/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-3840x2160p (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-ivb-3770/igt@kms_bw@linear-tiling-5-displays-3840x2160p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-kbl-7567u/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +55 other tests skip</li>
<li>{bat-apl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-apl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2560x1440p (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-ilk-650/igt@kms_bw@linear-tiling-6-displays-2560x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/fi-glk-j4005/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-atsm-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507">i915#7507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-apl-1/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-apl-1/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@a-dp6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@a-dp6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7893/bat-mtlp-9/igt@kms_hdmi_inject@inject-audio.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11280/bat-mtlp-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7893 -&gt; IGTPW_11280</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14973: 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11280: 57f4b82dfe38488fca5b1c3f1fe173b46efb28d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3702685583466694157==--
