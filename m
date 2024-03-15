Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBC2C54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 20:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C291F1124DF;
	Fri, 15 Mar 2024 20:11:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6641124DF;
 Fri, 15 Mar 2024 20:11:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9084116633484915278=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fcursor=5Fcrc=3A?=
 =?utf-8?q?_Test_SIZE=5FHINTS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 15 Mar 2024 20:11:53 -0000
Message-ID: <171053351358.812644.2900812441812459065@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
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

--===============9084116633484915278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Test SIZE_HINTS
URL   : https://patchwork.freedesktop.org/series/131199/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14440 -> IGTPW_10848
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html

Participating hosts (35 -> 34)
------------------------------

  Additional (2): bat-dg1-7 bat-mtlp-8 
  Missing    (3): bat-jsl-1 bat-atsm-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10848:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adlp-9/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-6} (NEW):
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-9/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-6.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-a-edp-1} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-rplp-1/igt@kms_cursor_crc@cursor-size-hints@pipe-a-edp-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adls-6/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-tgl-1115g4/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2.html
    - bat-dg2-14:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg2-14/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-jsl-3/igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1.html
    - bat-adln-1:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adln-1/igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-rkl-11600/igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2} (NEW):
    - bat-rpls-3:         NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-rpls-3/igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3} (NEW):
    - {bat-arls-4}:       NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-arls-4/igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3.html
    - bat-arls-3:         NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-arls-3/igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1.html
    - bat-adlp-6:         NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adlp-6/igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-2} (NEW):
    - bat-arls-1:         NOTRUN -> [SKIP][16] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-arls-1/igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-2.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@hangcheck:
    - {bat-mtlp-9}:       [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14440 and IGTPW_10848:

### New IGT tests (23) ###

  * igt@kms_cursor_crc@cursor-size-hints:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.25, 0.37] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.27] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.34] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-6:
    - Statuses : 1 skip(s)
    - Exec time: [1.13] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-edp-1:
    - Statuses : 5 skip(s)
    - Exec time: [0.20, 0.32] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1:
    - Statuses : 6 skip(s)
    - Exec time: [0.17, 0.51] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2:
    - Statuses : 3 skip(s)
    - Exec time: [0.31, 0.46] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.18, 0.37] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-b-hdmi-a-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.28] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-b-vga-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.24, 0.25] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.48, 0.52] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1:
    - Statuses : 2 skip(s)
    - Exec time: [1.38, 1.44] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.21, 0.34] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.46] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.21] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.37] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.42] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.48, 0.50] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.79] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1:
    - Statuses : 3 skip(s)
    - Exec time: [1.33, 1.36] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.20, 0.35] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-2:
    - Statuses : 3 skip(s)
    - Exec time: [0.34, 0.65] s

  

Known issues
------------

  Here are the changes found in IGTPW_10848 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-mtlp-8:         NOTRUN -> [SKIP][19] ([i915#9318])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-mtlp-8:         NOTRUN -> [SKIP][20] ([i915#4613]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][21] ([i915#4083])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@gem_mmap@basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][22] ([i915#4083])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][23] ([i915#4077]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][24] ([i915#4079]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#4077]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][26] ([i915#4079]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-7:          NOTRUN -> [SKIP][27] ([i915#6621])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][28] ([i915#6621])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg1-7:          NOTRUN -> [SKIP][29] ([i915#4212]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][30] ([i915#5190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][31] ([i915#4212]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-7:          NOTRUN -> [SKIP][32] ([i915#4215])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * {igt@kms_cursor_crc@cursor-size-hints} (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][33] ([i915#9197])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg2-9/igt@kms_cursor_crc@cursor-size-hints.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-kbl-x1275/igt@kms_cursor_crc@cursor-size-hints.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-kbl-8809g/igt@kms_cursor_crc@cursor-size-hints.html
    - bat-dg2-8:          NOTRUN -> [SKIP][36] ([i915#9197])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg2-8/igt@kms_cursor_crc@cursor-size-hints.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-kbl-guc/igt@kms_cursor_crc@cursor-size-hints.html
    - bat-adlm-1:         NOTRUN -> [SKIP][38] ([i915#9900])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adlm-1/igt@kms_cursor_crc@cursor-size-hints.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][39] ([i915#9792])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-6/igt@kms_cursor_crc@cursor-size-hints.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][40] +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-kbl-7567u/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][41] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-elk-e7500/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][42] +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-cfl-guc/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][43] +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-pnv-d510/igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][44] +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-ivb-3770/igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-b-vga-1} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][45] +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-ilk-650/igt@kms_cursor_crc@cursor-size-hints@pipe-b-vga-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][46] +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-apl-guc/igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][47] +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-cfl-8109u/igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][48] +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-cfl-8700k/igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1.html

  * {igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-2} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][49]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-bsw-nick/igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][50] ([i915#4213]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg1-7:          NOTRUN -> [SKIP][51] ([i915#4103] / [i915#4213]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][52] ([i915#3555] / [i915#3840] / [i915#9159])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][53] ([i915#3555] / [i915#3840])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-mtlp-8:         NOTRUN -> [SKIP][54]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg1-7:          NOTRUN -> [SKIP][55]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-8:         NOTRUN -> [SKIP][56] ([i915#5274])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-dg1-7:          NOTRUN -> [SKIP][57] ([i915#433])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg1-7:          NOTRUN -> [SKIP][58] ([i915#5354])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][59] ([i915#4077] / [i915#9688])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg1-7:          NOTRUN -> [SKIP][60] ([i915#9732]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-mtlp-8:         NOTRUN -> [SKIP][61] ([i915#3555] / [i915#8809])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-7:          NOTRUN -> [SKIP][62] ([i915#3555])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg1-7:          NOTRUN -> [SKIP][63] ([i915#3708]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg1-7:          NOTRUN -> [SKIP][64] ([i915#3708] / [i915#4077]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][65] ([i915#3708] / [i915#4077]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][66] ([i915#3708]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-8:         NOTRUN -> [SKIP][67] ([i915#10216] / [i915#3708])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [CRASH][68] -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-rpls-3:         [DMESG-WARN][70] ([i915#5591]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7768 -> IGTPW_10848

  CI-20190529: 20190529
  CI_DRM_14440: 22ba12a6eded33d40fba58b4dac24a1e2bdc4b25 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10848: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html
  IGT_7768: 7768


Testlist changes
----------------

+igt@drm_buddy@drm_buddy
+igt@kms_cursor_crc@cursor-size-hints
-igt@drm_buddy@buddy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html

--===============9084116633484915278==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Test SIZE_HINTS</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131199/">https://patchwork.freedesktop.org/series/131199/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14440 -&gt; IGTPW_10848</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html</p>
<h2>Participating hosts (35 -&gt; 34)</h2>
<p>Additional (2): bat-dg1-7 bat-mtlp-8 <br />
  Missing    (3): bat-jsl-1 bat-atsm-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10848:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adlp-9/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-6} (NEW):</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-9/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-6.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-a-edp-1} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-rplp-1/igt@kms_cursor_crc@cursor-size-hints@pipe-a-edp-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adls-6/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1.html">SKIP</a> +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-tgl-1115g4/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg2-14/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-jsl-3/igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1.html">SKIP</a> +1 other test skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adln-1/igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-rkl-11600/igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2} (NEW):</p>
<ul>
<li>bat-rpls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-rpls-3/igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3} (NEW):</p>
<ul>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-arls-4/igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-arls-3/igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adlp-6/igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-2} (NEW):</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-arls-1/igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-2.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14440 and IGTPW_10848:</p>
<h3>New IGT tests (23)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.25, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.20, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.17, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.31, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.18, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.24, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.48, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.38, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.21, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.48, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [1.33, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.20, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.34, 0.65] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10848 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +8 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg2-9/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-kbl-x1275/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-kbl-8809g/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg2-8/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-kbl-guc/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-adlm-1/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-6/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-kbl-7567u/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-elk-e7500/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1.html">SKIP</a> +1 other test skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-cfl-guc/igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-pnv-d510/igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1.html">SKIP</a> +1 other test skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-ivb-3770/igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-b-vga-1} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-ilk-650/igt@kms_cursor_crc@cursor-size-hints@pipe-b-vga-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1} (NEW):</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-apl-guc/igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1.html">SKIP</a> +1 other test skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-cfl-8109u/igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-cfl-8700k/igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-2} (NEW):</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/fi-bsw-nick/igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9159">i915#9159</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7768 -&gt; IGTPW_10848</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14440: 22ba12a6eded33d40fba58b4dac24a1e2bdc4b25 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10848: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html<br />
  IGT_7768: 7768</p>
<h2>Testlist changes</h2>
<p>+igt@drm_buddy@drm_buddy<br />
+igt@kms_cursor_crc@cursor-size-hints<br />
-igt@drm_buddy@buddy</p>

</body>
</html>

--===============9084116633484915278==--
