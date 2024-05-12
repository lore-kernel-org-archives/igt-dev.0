Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FB8C25B75
	for <igt-dev@archiver.kernel.org>; Sun, 12 May 2024 16:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1800D10E031;
	Sun, 12 May 2024 16:19:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBAC10E031;
 Sun, 12 May 2024 16:19:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5639958985049754116=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_fix_kms=5Fbe_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 12 May 2024 16:19:39 -0000
Message-ID: <171553077911.2093168.17396338302602761155@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240512160158.3328235-1-kunal1.joshi@intel.com>
In-Reply-To: <20240512160158.3328235-1-kunal1.joshi@intel.com>
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

--===============5639958985049754116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix kms_be test
URL   : https://patchwork.freedesktop.org/series/133510/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7847 -> IGTPW_11132
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11132 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11132, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/index.html

Participating hosts (36 -> 40)
------------------------------

  Additional (6): bat-kbl-2 fi-tgl-1115g4 fi-glk-j4005 fi-cfl-8109u fi-kbl-8809g bat-jsl-1 
  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11132:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@basic-await@bcs0:
    - bat-adlm-1:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-adlm-1/igt@gem_exec_fence@basic-await@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlm-1/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-14:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-dg2-14/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-14/igt@i915_pm_rpm@module-reload.html

  * {igt@kms_bw@linear-tiling-1920x1080p@2-displays} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][5] +11 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-rplp-1/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][6] +8 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-rkl-11600/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html

  * {igt@kms_bw@linear-tiling-1920x1080p@3-displays} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][7] +12 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg1-7/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][8] +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-twl-1/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html

  * {igt@kms_bw@linear-tiling-1920x1080p@4-displays} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][9] +11 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlp-9/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html
    - {bat-rpls-4}:       NOTRUN -> [SKIP][10] +8 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-rpls-4/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html

  * {igt@kms_bw@linear-tiling-2160x1440p@3-displays} (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][11] +11 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-arls-2/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html
    - bat-adln-1:         NOTRUN -> [SKIP][12] +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adln-1/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html
    - {bat-arls-4}:       NOTRUN -> [SKIP][13] +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-arls-4/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html
    - bat-jsl-1:          NOTRUN -> [SKIP][14] +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html

  * {igt@kms_bw@linear-tiling-2560x1440p@2-displays} (NEW):
    - bat-arls-1:         NOTRUN -> [SKIP][15] +11 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-arls-1/igt@kms_bw@linear-tiling-2560x1440p@2-displays.html

  * {igt@kms_bw@linear-tiling-2560x1440p@3-displays} (NEW):
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][16] +8 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-mtlp-9/igt@kms_bw@linear-tiling-2560x1440p@3-displays.html
    - bat-jsl-3:          NOTRUN -> [SKIP][17] +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-3/igt@kms_bw@linear-tiling-2560x1440p@3-displays.html

  * {igt@kms_bw@linear-tiling-2560x1440p@4-displays} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][18] +9 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adls-6/igt@kms_bw@linear-tiling-2560x1440p@4-displays.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][19] +12 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_bw@linear-tiling-2560x1440p@4-displays.html

  * {igt@kms_bw@linear-tiling-3840x2160p@1-display} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][20] +15 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-14/igt@kms_bw@linear-tiling-3840x2160p@1-display.html

  * {igt@kms_bw@linear-tiling-3840x2160p@4-displays} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][21] +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlp-6/igt@kms_bw@linear-tiling-3840x2160p@4-displays.html

  
New tests
---------

  New tests have been introduced between IGT_7847 and IGTPW_11132:

### New IGT tests (20) ###

  * igt@kms_bw@linear-tiling-1920x1080p:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-1920x1080p@1-display:
    - Statuses : 25 pass(s) 5 skip(s)
    - Exec time: [0.02, 0.69] s

  * igt@kms_bw@linear-tiling-1920x1080p@2-displays:
    - Statuses : 5 pass(s) 25 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_bw@linear-tiling-1920x1080p@3-displays:
    - Statuses : 26 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-1920x1080p@4-displays:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-2160x1440p:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-2160x1440p@1-display:
    - Statuses : 24 pass(s) 6 skip(s)
    - Exec time: [0.02, 1.59] s

  * igt@kms_bw@linear-tiling-2160x1440p@2-displays:
    - Statuses : 5 pass(s) 25 skip(s)
    - Exec time: [0.0, 1.75] s

  * igt@kms_bw@linear-tiling-2160x1440p@3-displays:
    - Statuses : 26 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-2160x1440p@4-displays:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-2560x1440p:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-2560x1440p@1-display:
    - Statuses : 22 pass(s) 8 skip(s)
    - Exec time: [0.01, 1.55] s

  * igt@kms_bw@linear-tiling-2560x1440p@2-displays:
    - Statuses : 5 pass(s) 25 skip(s)
    - Exec time: [0.0, 2.20] s

  * igt@kms_bw@linear-tiling-2560x1440p@3-displays:
    - Statuses : 26 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-2560x1440p@4-displays:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-3840x2160p:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-3840x2160p@1-display:
    - Statuses : 16 pass(s) 14 skip(s)
    - Exec time: [0.01, 1.66] s

  * igt@kms_bw@linear-tiling-3840x2160p@2-displays:
    - Statuses : 2 pass(s) 28 skip(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_bw@linear-tiling-3840x2160p@3-displays:
    - Statuses : 26 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-3840x2160p@4-displays:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_11132 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][22] ([i915#9318])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][23] ([i915#9318])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][24] ([i915#1849])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][25] ([i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][26] ([i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][27] ([i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][28] ([i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@gem_huc_copy@huc-copy.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][29] ([i915#2190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][30] ([i915#4613]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-glk-j4005/igt@gem_lmem_swapping@basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][31] ([i915#4613]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][32] +43 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][33] ([i915#4613]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][34] ([i915#4613]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html
    - bat-jsl-1:          NOTRUN -> [SKIP][35] ([i915#4613]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * {igt@kms_bw@linear-tiling-1920x1080p} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [SKIP][36] +34 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-8809g/igt@kms_bw@linear-tiling-1920x1080p.html
    - bat-dg2-8:          NOTRUN -> [SKIP][37] ([i915#9197]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-8/igt@kms_bw@linear-tiling-1920x1080p.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][38] +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-guc/igt@kms_bw@linear-tiling-1920x1080p.html
    - bat-adlm-1:         NOTRUN -> [SKIP][39] ([i915#9900]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlm-1/igt@kms_bw@linear-tiling-1920x1080p.html

  * {igt@kms_bw@linear-tiling-1920x1080p@1-display} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][40] +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-blb-e6850/igt@kms_bw@linear-tiling-1920x1080p@1-display.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][41] +11 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-bsw-n3050/igt@kms_bw@linear-tiling-1920x1080p@1-display.html

  * {igt@kms_bw@linear-tiling-1920x1080p@2-displays} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][42] +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-elk-e7500/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html
    - fi-ilk-650:         NOTRUN -> [SKIP][43] +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-ilk-650/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html

  * {igt@kms_bw@linear-tiling-1920x1080p@3-displays} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][44] +9 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-8700k/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html
    - {bat-apl-1}:        NOTRUN -> [SKIP][45] +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-apl-1/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html

  * {igt@kms_bw@linear-tiling-2160x1440p@3-displays} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][46] +15 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-8109u/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][47] +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-7567u/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][48] +8 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-ivb-3770/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html

  * {igt@kms_bw@linear-tiling-2560x1440p@1-display} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][49] +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-pnv-d510/igt@kms_bw@linear-tiling-2560x1440p@1-display.html

  * {igt@kms_bw@linear-tiling-2560x1440p@3-displays} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][50] +9 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-guc/igt@kms_bw@linear-tiling-2560x1440p@3-displays.html

  * {igt@kms_bw@linear-tiling-3840x2160p} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][51] ([i915#6078]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-atsm-1/igt@kms_bw@linear-tiling-3840x2160p.html
    - bat-dg2-9:          NOTRUN -> [SKIP][52] ([i915#9197]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-9/igt@kms_bw@linear-tiling-3840x2160p.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][53] +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-x1275/igt@kms_bw@linear-tiling-3840x2160p.html
    - bat-adlp-11:        NOTRUN -> [SKIP][54] ([i915#10470]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlp-11/igt@kms_bw@linear-tiling-3840x2160p.html

  * {igt@kms_bw@linear-tiling-3840x2160p@1-display} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][55] +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-bsw-nick/igt@kms_bw@linear-tiling-3840x2160p@1-display.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][56] +18 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][57] ([i915#4103]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][58] ([i915#4103]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][59] ([i915#3555] / [i915#3840])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][60] ([i915#3555] / [i915#9886])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][61]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          NOTRUN -> [SKIP][62]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][63] ([i915#9812])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][64] ([i915#9732]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][65] ([i915#3555])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][66] ([i915#3555])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-dg2-8:          [DMESG-WARN][67] ([i915#10014]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-dg2-8/igt@i915_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-8/igt@i915_module_load@load.html

  * igt@i915_selftest@live@active:
    - fi-bsw-nick:        [DMESG-FAIL][69] ([i915#10676]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/fi-bsw-nick/igt@i915_selftest@live@active.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-bsw-nick/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@gt_engines:
    - bat-adls-6:         [TIMEOUT][71] ([i915#10026] / [i915#10134]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-adls-6/igt@i915_selftest@live@gt_engines.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adls-6/igt@i915_selftest@live@gt_engines.html

  * igt@kms_flip@basic-plain-flip@a-dp6:
    - {bat-mtlp-9}:       [DMESG-WARN][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html

  * igt@kms_flip@basic-plain-flip@c-dp7:
    - {bat-mtlp-9}:       [FAIL][75] ([i915#6121]) -> [PASS][76] +6 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp7.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp7.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10014]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10014
  [i915#10026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10026
  [i915#10134]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10134
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10676]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10676
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7847 -> IGTPW_11132

  CI-20190529: 20190529
  CI_DRM_14750: 7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11132: fa03f16fb79a7130c3ca1fb6f1203040b0f1b380 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7847: 86712f2effc8ba6690c7e165ad63904416763b75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/index.html

--===============5639958985049754116==
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
<tr><td><b>Series:</b></td><td>fix kms_be test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133510/">https://patchwork.freedesktop.org/series/133510/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7847 -&gt; IGTPW_11132</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11132 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11132, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/index.html</p>
<h2>Participating hosts (36 -&gt; 40)</h2>
<p>Additional (6): bat-kbl-2 fi-tgl-1115g4 fi-glk-j4005 fi-cfl-8109u fi-kbl-8809g bat-jsl-1 <br />
  Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11132:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-adlm-1/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlm-1/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-dg2-14/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-14/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-1920x1080p@2-displays} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-rplp-1/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html">SKIP</a> +11 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-rkl-11600/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-1920x1080p@3-displays} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg1-7/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +12 other tests skip</li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-twl-1/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-1920x1080p@4-displays} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlp-9/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html">SKIP</a> +11 other tests skip</li>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-rpls-4/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-2160x1440p@3-displays} (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-arls-2/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +11 other tests skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adln-1/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +7 other tests skip</li>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-arls-4/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +11 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-2560x1440p@2-displays} (NEW):</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-arls-1/igt@kms_bw@linear-tiling-2560x1440p@2-displays.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-2560x1440p@3-displays} (NEW):</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-mtlp-9/igt@kms_bw@linear-tiling-2560x1440p@3-displays.html">SKIP</a> +8 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-3/igt@kms_bw@linear-tiling-2560x1440p@3-displays.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-2560x1440p@4-displays} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adls-6/igt@kms_bw@linear-tiling-2560x1440p@4-displays.html">SKIP</a> +9 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_bw@linear-tiling-2560x1440p@4-displays.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-3840x2160p@1-display} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-14/igt@kms_bw@linear-tiling-3840x2160p@1-display.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-3840x2160p@4-displays} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlp-6/igt@kms_bw@linear-tiling-3840x2160p@4-displays.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7847 and IGTPW_11132:</p>
<h3>New IGT tests (20)</h3>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@1-display:</p>
<ul>
<li>Statuses : 25 pass(s) 5 skip(s)</li>
<li>Exec time: [0.02, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@2-displays:</p>
<ul>
<li>Statuses : 5 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@3-displays:</p>
<ul>
<li>Statuses : 26 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@4-displays:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@1-display:</p>
<ul>
<li>Statuses : 24 pass(s) 6 skip(s)</li>
<li>Exec time: [0.02, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@2-displays:</p>
<ul>
<li>Statuses : 5 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@3-displays:</p>
<ul>
<li>Statuses : 26 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@4-displays:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@1-display:</p>
<ul>
<li>Statuses : 22 pass(s) 8 skip(s)</li>
<li>Exec time: [0.01, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@2-displays:</p>
<ul>
<li>Statuses : 5 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@3-displays:</p>
<ul>
<li>Statuses : 26 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@4-displays:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@1-display:</p>
<ul>
<li>Statuses : 16 pass(s) 14 skip(s)</li>
<li>Exec time: [0.01, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@2-displays:</p>
<ul>
<li>Statuses : 2 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@3-displays:</p>
<ul>
<li>Statuses : 26 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@4-displays:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11132 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-glk-j4005/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +43 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-1920x1080p} (NEW):</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-8809g/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> +34 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-8/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +3 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-guc/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlm-1/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-1920x1080p@1-display} (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-blb-e6850/igt@kms_bw@linear-tiling-1920x1080p@1-display.html">SKIP</a> +7 other tests skip</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-bsw-n3050/igt@kms_bw@linear-tiling-1920x1080p@1-display.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-1920x1080p@2-displays} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-elk-e7500/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html">SKIP</a> +6 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-ilk-650/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-1920x1080p@3-displays} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-8700k/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +9 other tests skip</li>
<li>{bat-apl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-apl-1/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-2160x1440p@3-displays} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-8109u/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +15 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-7567u/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +7 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-ivb-3770/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-2560x1440p@1-display} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-pnv-d510/igt@kms_bw@linear-tiling-2560x1440p@1-display.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-2560x1440p@3-displays} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-cfl-guc/igt@kms_bw@linear-tiling-2560x1440p@3-displays.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-3840x2160p} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-atsm-1/igt@kms_bw@linear-tiling-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +3 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-9/igt@kms_bw@linear-tiling-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-kbl-x1275/igt@kms_bw@linear-tiling-3840x2160p.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adlp-11/igt@kms_bw@linear-tiling-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-3840x2160p@1-display} (NEW):</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-bsw-nick/igt@kms_bw@linear-tiling-3840x2160p@1-display.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> +18 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-dg2-8/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10014">i915#10014</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-dg2-8/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/fi-bsw-nick/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10676">i915#10676</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/fi-bsw-nick/igt@i915_selftest@live@active.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-adls-6/igt@i915_selftest@live@gt_engines.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10026">i915#10026</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10134">i915#10134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-adls-6/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7847/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11132/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp7.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7847 -&gt; IGTPW_11132</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14750: 7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11132: fa03f16fb79a7130c3ca1fb6f1203040b0f1b380 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7847: 86712f2effc8ba6690c7e165ad63904416763b75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5639958985049754116==--
