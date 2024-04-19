Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C832C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 07:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBE310ECC6;
	Fri, 19 Apr 2024 07:13:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B8910ECC6;
 Fri, 19 Apr 2024 07:13:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6957854168815871760=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_cleanup_and_fixes_for_kms?=
 =?utf-8?q?=5Fbig=5Fjoiner_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Apr 2024 07:13:08 -0000
Message-ID: <171351078892.1519311.224479920605378532@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
In-Reply-To: <20240419064001.2401850-1-kunal1.joshi@intel.com>
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

--===============6957854168815871760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: cleanup and fixes for kms_big_joiner (rev3)
URL   : https://patchwork.freedesktop.org/series/132554/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7814 -> IGTPW_11043
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11043 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11043, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/index.html

Participating hosts (35 -> 35)
------------------------------

  Additional (3): bat-kbl-2 bat-dg1-7 bat-dg2-11 
  Missing    (3): fi-cfl-8109u fi-elk-e7500 bat-arls-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11043:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_joiner@basic-force-joiner:
    - bat-jsl-3:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-jsl-3/igt@kms_big_joiner@basic-force-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adls-6/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_busy@basic@flip:
    - bat-adls-6:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-adls-6/igt@kms_busy@basic@flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adls-6/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - fi-ilk-650:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-ilk-650/igt@kms_busy@basic@modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-ilk-650/igt@kms_busy@basic@modeset.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - fi-kbl-7567u:       NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html

  * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:
    - fi-tgl-1115g4:      [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_busy@basic@modeset:
    - {bat-mtlp-9}:       [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-mtlp-9/igt@kms_busy@basic@modeset.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-mtlp-9/igt@kms_busy@basic@modeset.html

  
Known issues
------------

  Here are the changes found in IGTPW_11043 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([i915#9318])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
    - bat-adlm-1:         NOTRUN -> [SKIP][13] ([i915#3826])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@eof:
    - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([i915#2582]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@fbdev@eof.html
    - bat-adlm-1:         NOTRUN -> [SKIP][15] ([i915#2582]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@fbdev@eof.html

  * igt@fbdev@info:
    - fi-rkl-11600:       NOTRUN -> [SKIP][16] ([i915#1849] / [i915#2582])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@fbdev@info.html
    - bat-adlm-1:         NOTRUN -> [SKIP][17] ([i915#1849] / [i915#2582])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@fbdev@info.html

  * igt@gem_mmap@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][18] ([i915#4083])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@gem_mmap@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][19] ([i915#4083])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@gem_mmap@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][20] ([i915#4077]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][21] ([i915#4077]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][22] ([i915#4079]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@gem_tiled_pread_basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][23] ([i915#4079]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@gem_tiled_pread_basic.html

  * igt@i915_module_load@load:
    - bat-kbl-2:          NOTRUN -> [INCOMPLETE][24] ([i915#10877])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-kbl-2/igt@i915_module_load@load.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#4212]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - bat-dg2-11:         NOTRUN -> [SKIP][26] ([i915#4212]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][27] ([i915#5190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-7:          NOTRUN -> [SKIP][28] ([i915#4215])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-11:         NOTRUN -> [SKIP][29] ([i915#4215] / [i915#5190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_big_joiner@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][30] +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-apl-guc/igt@kms_big_joiner@basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][31] +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-pnv-d510/igt@kms_big_joiner@basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][32] ([i915#10656]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@kms_big_joiner@basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][33] ([i915#10656]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlp-9/igt@kms_big_joiner@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][34] ([i915#10656]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_big_joiner@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][35] +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-cfl-8700k/igt@kms_big_joiner@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][36] ([i915#10656]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-14/igt@kms_big_joiner@basic.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][37] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-bsw-nick/igt@kms_big_joiner@basic.html
    - bat-rplp-1:         NOTRUN -> [SKIP][38] ([i915#10656]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-rplp-1/igt@kms_big_joiner@basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][39] ([i915#10656]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - fi-cfl-guc:         NOTRUN -> [SKIP][40] +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-cfl-guc/igt@kms_big_joiner@invalid-modeset.html
    - bat-jsl-3:          NOTRUN -> [SKIP][41] ([i915#10656]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html
    - bat-dg2-9:          NOTRUN -> [SKIP][42] ([i915#10656]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-9/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlp-11:        NOTRUN -> [SKIP][43] ([i915#10656]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlp-11/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-2:         NOTRUN -> [SKIP][44] ([i915#10656]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-arls-2/igt@kms_big_joiner@invalid-modeset.html
    - bat-adln-1:         NOTRUN -> [SKIP][45] ([i915#10656]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adln-1/igt@kms_big_joiner@invalid-modeset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][46] +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][47] ([i915#10656]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-mtlp-8/igt@kms_big_joiner@invalid-modeset.html
    - bat-adls-6:         NOTRUN -> [SKIP][48] ([i915#10656]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlm-1:         NOTRUN -> [SKIP][49] ([i915#10656]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@kms_big_joiner@invalid-modeset.html
    - fi-ilk-650:         NOTRUN -> [SKIP][50] +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-ilk-650/igt@kms_big_joiner@invalid-modeset.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][51] ([i915#10656]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-tgl-1115g4/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-1:         NOTRUN -> [SKIP][52] ([i915#10656]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][53] +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-blb-e6850/igt@kms_big_joiner@invalid-modeset.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][54] +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-bsw-n3050/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlp-6:         NOTRUN -> [SKIP][55] ([i915#10656]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlp-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_busy@basic@modeset:
    - bat-dg1-7:          NOTRUN -> [ABORT][56] ([i915#10875])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@kms_busy@basic@modeset.html
    - bat-dg2-11:         NOTRUN -> [ABORT][57] ([i915#10875])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_busy@basic@modeset.html
    - bat-adls-6:         [PASS][58] -> [DMESG-WARN][59] ([i915#10875])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-adls-6/igt@kms_busy@basic@modeset.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adls-6/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-adln-1:         NOTRUN -> [SKIP][60] ([i915#4213]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-rplp-1:         NOTRUN -> [SKIP][61] ([i915#4103] / [i915#4213]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adln-1:         NOTRUN -> [DMESG-WARN][62] ([i915#10875])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-rplp-1:         NOTRUN -> [DMESG-WARN][63] ([i915#10875])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][64] +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-jsl-3:          [PASS][65] -> [INCOMPLETE][66] ([i915#10876])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-jsl-3/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-jsl-3/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-process:
    - bat-dg2-9:          [DMESG-WARN][67] ([i915#10875]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-dg2-9/igt@gem_close_race@basic-process.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-9/igt@gem_close_race@basic-process.html

  * igt@i915_module_load@load:
    - fi-rkl-11600:       [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-rkl-11600/igt@i915_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@i915_module_load@load.html
    - bat-dg2-13:         [INCOMPLETE][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-dg2-13/igt@i915_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-13/igt@i915_module_load@load.html
    - bat-adlm-1:         [INCOMPLETE][73] ([i915#10875]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-adlm-1/igt@i915_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@i915_module_load@load.html

  * igt@kms_busy@basic@flip:
    - fi-bsw-nick:        [INCOMPLETE][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-bsw-nick/igt@kms_busy@basic@flip.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-bsw-nick/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - fi-kbl-7567u:       [INCOMPLETE][77] ([i915#10056] / [i915#10875]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-kbl-7567u/igt@kms_busy@basic@modeset.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-kbl-7567u/igt@kms_busy@basic@modeset.html
    - bat-adln-1:         [DMESG-WARN][79] ([i915#10875]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-adln-1/igt@kms_busy@basic@modeset.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adln-1/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {bat-arls-4}:       [ABORT][81] ([i915#10875]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-arls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-arls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - fi-apl-guc:         [INCOMPLETE][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html

  
#### Warnings ####

  * igt@kms_busy@basic@modeset:
    - bat-dg2-14:         [INCOMPLETE][85] ([i915#10056]) -> [DMESG-WARN][86] ([i915#10875])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-dg2-14/igt@kms_busy@basic@modeset.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-14/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/intel/issues/10056
  [i915#10656]: https://gitlab.freedesktop.org/drm/intel/issues/10656
  [i915#10875]: https://gitlab.freedesktop.org/drm/intel/issues/10875
  [i915#10876]: https://gitlab.freedesktop.org/drm/intel/issues/10876
  [i915#10877]: https://gitlab.freedesktop.org/drm/intel/issues/10877
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7814 -> IGTPW_11043

  CI-20190529: 20190529
  CI_DRM_14609: 1f816172a689b95011a1c1cfe952ac6ec32d3ca3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11043: 1b08c420cb17ebe1fb0f775d3e93ddd2ca008d0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7814: 7814

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/index.html

--===============6957854168815871760==
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
<tr><td><b>Series:</b></td><td>cleanup and fixes for kms_big_joiner (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132554/">https://patchwork.freedesktop.org/series/132554/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7814 -&gt; IGTPW_11043</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11043 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11043, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/index.html</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>Additional (3): bat-kbl-2 bat-dg1-7 bat-dg2-11 <br />
  Missing    (3): fi-cfl-8109u fi-elk-e7500 bat-arls-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11043:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_joiner@basic-force-joiner:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-jsl-3/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adls-6/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-adls-6/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adls-6/igt@kms_busy@basic@flip.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-ilk-650/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-ilk-650/igt@kms_busy@basic@modeset.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_busy@basic@modeset:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-mtlp-9/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-mtlp-9/igt@kms_busy@basic@modeset.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11043 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-kbl-2/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10877">i915#10877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-apl-guc/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-pnv-d510/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlp-9/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-cfl-8700k/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-14/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-bsw-nick/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-rplp-1/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-cfl-guc/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-9/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlp-11/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-arls-2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adln-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-mtlp-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-ilk-650/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-tgl-1115g4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-blb-e6850/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-bsw-n3050/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg1-7/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-11/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-adls-6/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adls-6/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adln-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-jsl-3/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-jsl-3/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10876">i915#10876</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-dg2-9/igt@gem_close_race@basic-process.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-9/igt@gem_close_race@basic-process.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-rkl-11600/igt@i915_module_load@load.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-rkl-11600/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-dg2-13/igt@i915_module_load@load.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-13/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-adlm-1/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adlm-1/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-bsw-nick/igt@kms_busy@basic@flip.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-bsw-nick/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-kbl-7567u/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-kbl-7567u/igt@kms_busy@basic@modeset.html">PASS</a></li>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-adln-1/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-adln-1/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-arls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-arls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_busy@basic@modeset:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7814/bat-dg2-14/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10056">i915#10056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11043/bat-dg2-14/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10875">i915#10875</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7814 -&gt; IGTPW_11043</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14609: 1f816172a689b95011a1c1cfe952ac6ec32d3ca3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11043: 1b08c420cb17ebe1fb0f775d3e93ddd2ca008d0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7814: 7814</p>

</body>
</html>

--===============6957854168815871760==--
