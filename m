Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38DCC27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 14:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961A210E032;
	Thu, 13 Jun 2024 14:33:47 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2928810EAE6;
 Thu, 13 Jun 2024 14:33:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1719525615649004064=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_add_subtest_in_kms=5Fbw_for?=
 =?utf-8?q?_connected_outputs_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jun 2024 14:33:43 -0000
Message-ID: <171828922315.72831.17800587259702124844@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613130715.1008793-1-kunal1.joshi@intel.com>
In-Reply-To: <20240613130715.1008793-1-kunal1.joshi@intel.com>
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

--===============1719525615649004064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add subtest in kms_bw for connected outputs only
URL   : https://patchwork.freedesktop.org/series/134822/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7886 -> IGTPW_11256
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11256 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11256, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/index.html

Participating hosts (39 -> 43)
------------------------------

  Additional (6): fi-kbl-7567u bat-dg1-7 fi-kbl-8809g fi-elk-e7500 bat-jsl-3 bat-mtlp-8 
  Missing    (2): bat-arlh-2 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11256:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][1] +63 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg2-14/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p} (NEW):
    - {bat-arls-5}:       NOTRUN -> [SKIP][2] +43 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arls-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][3] +55 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg2-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - bat-adls-6:         NOTRUN -> [SKIP][4] +51 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adls-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][5] +55 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][6] +57 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-tgl-1115g4/igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p} (NEW):
    - bat-adln-1:         NOTRUN -> [SKIP][7] +52 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adln-1/igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - bat-jsl-1:          NOTRUN -> [SKIP][8] +55 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - bat-adlp-6:         NOTRUN -> [SKIP][9] +52 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - bat-arls-1:         NOTRUN -> [SKIP][10] +59 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arls-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * {igt@kms_bw@linear-tiling-5-displays-2160x1440p} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][11] +63 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_bw@linear-tiling-5-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-6-displays-1920x1080p (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][12] +57 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-rkl-11600/igt@kms_bw@linear-tiling-6-displays-1920x1080p.html

  * {igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):
    - {bat-rpls-4}:       NOTRUN -> [SKIP][13] +44 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-rpls-4/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][14] +43 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-twl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - bat-rplp-1:         NOTRUN -> [SKIP][15] +55 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-rplp-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-1920x1080p} (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][16] +55 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arls-2/igt@kms_bw@linear-tiling-7-displays-1920x1080p.html

  * {igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][17] +60 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html
    - bat-adlp-9:         NOTRUN -> [SKIP][18] +55 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adlp-9/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):
    - {bat-arlh-1}:       NOTRUN -> [SKIP][19] +43 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arlh-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][20] +43 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - {bat-rpls-4}:       NOTRUN -> [SKIP][21] +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-rpls-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][22] +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-twl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - {bat-arls-5}:       NOTRUN -> [SKIP][23] +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arls-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - {bat-arlh-1}:       NOTRUN -> [SKIP][24] +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arlh-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][25] +15 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  
New tests
---------

  New tests have been introduced between IGT_7886 and IGTPW_11256:

### New IGT tests (48) ###

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - Statuses : 28 pass(s) 14 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - Statuses : 27 pass(s) 15 skip(s)
    - Exec time: [0.0, 1.67] s

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - Statuses : 25 pass(s) 17 skip(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - Statuses : 18 pass(s) 24 skip(s)
    - Exec time: [0.0, 1.69] s

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-5-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-6-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@connected-linear-tiling-8-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-8-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-5-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-6-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-7-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-7-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-1920x1080p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-2160x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-2560x1440p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-8-displays-3840x2160p:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11256 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-3:          NOTRUN -> [SKIP][26] ([i915#9318])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][27] ([i915#9318])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][28] ([i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][29] ([i915#2190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-3:          NOTRUN -> [SKIP][30] ([i915#2190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - bat-jsl-3:          NOTRUN -> [SKIP][31] ([i915#4613]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-mtlp-8:         NOTRUN -> [SKIP][32] ([i915#4613]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][33] ([i915#4613]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][34] ([i915#4613]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][35] ([i915#4083])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@gem_mmap@basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][36] ([i915#4083])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][37] ([i915#4079]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][38] ([i915#4077]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][39] ([i915#4077]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][40] ([i915#4079]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-8:         NOTRUN -> [SKIP][41] ([i915#6621])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
    - bat-dg1-7:          NOTRUN -> [SKIP][42] ([i915#6621])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][43] ([i915#5190])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][44] ([i915#4212]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-7:          NOTRUN -> [SKIP][45] ([i915#4215])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - bat-dg1-7:          NOTRUN -> [SKIP][46] ([i915#4212]) +7 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * {igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [SKIP][47] +94 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-8809g/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * {igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][48] +83 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-elk-e7500/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
    - bat-kbl-2:          NOTRUN -> [SKIP][49] +63 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-kbl-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * {igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):
    - fi-kbl-guc:         NOTRUN -> [SKIP][50] +63 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-guc/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * {igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p} (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][51] ([i915#9197]) +63 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg2-9/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][52] +63 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-x1275/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html
    - bat-adlp-11:        NOTRUN -> [SKIP][53] ([i915#10470]) +63 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adlp-11/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html

  * {igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][54] +59 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-bsw-nick/igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p.html

  * {igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][55] +57 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-cfl-8700k/igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - fi-blb-e6850:       NOTRUN -> [SKIP][56] +63 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-blb-e6850/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - bat-adlm-1:         NOTRUN -> [SKIP][57] ([i915#9900]) +63 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adlm-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][58] +51 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-cfl-8109u/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - fi-pnv-d510:        NOTRUN -> [SKIP][59] +63 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-pnv-d510/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - fi-cfl-guc:         NOTRUN -> [SKIP][60] +57 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-cfl-guc/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][61] ([i915#9792]) +63 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][62] +59 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-bsw-n3050/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-5-displays-3840x2160p (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][63] +55 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-ivb-3770/igt@kms_bw@linear-tiling-5-displays-3840x2160p.html

  * {igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][64] +67 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-7567u/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html
    - {bat-apl-1}:        NOTRUN -> [SKIP][65] +47 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-apl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-6-displays-2560x1440p (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][66] +55 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-ilk-650/igt@kms_bw@linear-tiling-6-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][67] +47 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-glk-j4005/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html

  * {igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][68] ([i915#6078]) +63 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-atsm-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-3:          NOTRUN -> [SKIP][69] ([i915#4103]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][70] ([i915#4213]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg1-7:          NOTRUN -> [SKIP][71] ([i915#4103] / [i915#4213]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-3:          NOTRUN -> [SKIP][72] ([i915#3555] / [i915#9886])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][73] ([i915#3555] / [i915#3840] / [i915#9159])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][74] ([i915#3555] / [i915#3840])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-3:          NOTRUN -> [SKIP][75]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][76]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg1-7:          NOTRUN -> [SKIP][77]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-8:         NOTRUN -> [SKIP][78] ([i915#5274])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-dg1-7:          NOTRUN -> [SKIP][79] ([i915#433])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg1-7:          NOTRUN -> [SKIP][80] ([i915#5354])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][81] ([i915#4077] / [i915#9688])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg1-7:          NOTRUN -> [SKIP][82] ([i915#1072] / [i915#9732]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-3:          NOTRUN -> [SKIP][83] ([i915#3555])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][84] ([i915#3555] / [i915#8809])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-7:          NOTRUN -> [SKIP][85] ([i915#3555])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg1-7:          NOTRUN -> [SKIP][86] ([i915#3708] / [i915#4077]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][87] ([i915#3708]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
    - bat-dg1-7:          NOTRUN -> [SKIP][88] ([i915#3708]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-mtlp-8:         NOTRUN -> [SKIP][89] ([i915#3708] / [i915#4077]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-8:         NOTRUN -> [SKIP][90] ([i915#10216] / [i915#3708])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [CRASH][91] ([i915#10911]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7886/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@kms_busy@basic@flip:
    - {bat-apl-1}:        [DMESG-WARN][93] ([i915#180] / [i915#1982]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7886/bat-apl-1/igt@kms_busy@basic@flip.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-apl-1/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-plain-flip@b-dp6:
    - {bat-mtlp-9}:       [DMESG-WARN][95] ([i915#11009]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7886/bat-mtlp-9/igt@kms_flip@basic-plain-flip@b-dp6.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@kms_flip@basic-plain-flip@b-dp6.html

  * igt@kms_flip@basic-plain-flip@c-dp7:
    - {bat-mtlp-9}:       [FAIL][97] ([i915#6121]) -> [PASS][98] +5 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7886/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp7.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp7.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11060
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7886 -> IGTPW_11256

  CI-20190529: 20190529
  CI_DRM_14933: 9f3ced27c8deae54c79db1743e37d2935558e048 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11256: 11256
  IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/index.html

--===============1719525615649004064==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134822/">https://patchwork.freedesktop.org/series/134822/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7886 -&gt; IGTPW_11256</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11256 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11256, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/index.html</p>
<h2>Participating hosts (39 -&gt; 43)</h2>
<p>Additional (6): fi-kbl-7567u bat-dg1-7 fi-kbl-8809g fi-elk-e7500 bat-jsl-3 bat-mtlp-8 <br />
  Missing    (2): bat-arlh-2 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11256:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg2-14/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p} (NEW):</p>
<ul>
<li>{bat-arls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arls-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg2-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +55 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adls-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-tgl-1115g4/igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adln-1/igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arls-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-5-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_bw@linear-tiling-5-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-1920x1080p (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-rkl-11600/igt@kms_bw@linear-tiling-6-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-rpls-4/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +44 other tests skip</li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-twl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +43 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-rplp-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-1920x1080p} (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arls-2/igt@kms_bw@linear-tiling-7-displays-1920x1080p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html">SKIP</a> +60 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adlp-9/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):</p>
<ul>
<li>{bat-arlh-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arlh-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> +43 other tests skip</li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> +43 other tests skip</li>
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
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-rpls-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +15 other tests skip</li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-twl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +8 other tests skip</li>
<li>{bat-arls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arls-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>{bat-arlh-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-arlh-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> +11 other tests skip</li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7886 and IGTPW_11256:</p>
<h3>New IGT tests (48)</h3>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>Statuses : 28 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>Statuses : 27 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>Statuses : 25 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>Statuses : 18 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-5-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-6-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-8-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-7-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-1920x1080p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-2160x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-2560x1440p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-8-displays-3840x2160p:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11256 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +8 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p} (NEW):</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-8809g/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> +94 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-elk-e7500/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +83 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-kbl-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-guc/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg2-9/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +63 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-x1275/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adlp-11/igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p} (NEW):</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-bsw-nick/igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-cfl-8700k/igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-blb-e6850/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-adlm-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-cfl-8109u/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-pnv-d510/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-cfl-guc/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> +57 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-bsw-n3050/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-5-displays-3840x2160p (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-ivb-3770/igt@kms_bw@linear-tiling-5-displays-3840x2160p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-6-displays-2160x1440p} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-kbl-7567u/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +67 other tests skip</li>
<li>{bat-apl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-apl-1/igt@kms_bw@linear-tiling-6-displays-2160x1440p.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-6-displays-2560x1440p (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-ilk-650/igt@kms_bw@linear-tiling-6-displays-2560x1440p.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-2560x1440p} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/fi-glk-j4005/igt@kms_bw@linear-tiling-7-displays-2560x1440p.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-7-displays-3840x2160p} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-atsm-1/igt@kms_bw@linear-tiling-7-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-dg1-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7886/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911">i915#10911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7886/bat-apl-1/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-apl-1/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7886/bat-mtlp-9/igt@kms_flip@basic-plain-flip@b-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@kms_flip@basic-plain-flip@b-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7886/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11256/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp7.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7886 -&gt; IGTPW_11256</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14933: 9f3ced27c8deae54c79db1743e37d2935558e048 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11256: 11256<br />
  IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1719525615649004064==--
