Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27ADC4829E
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 15:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768C710EDE1;
	Mon, 12 Feb 2024 15:33:28 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435CE10EDD4;
 Mon, 12 Feb 2024 15:33:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4784222220948099971=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fccs=3A_Ad?=
 =?utf-8?q?d_Xe2_ccs_crc_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 Feb 2024 15:33:27 -0000
Message-ID: <170775200727.1182962.10010202446746916292@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240209100854.528387-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240209100854.528387-1-juhapekka.heikkila@gmail.com>
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

--===============4784222220948099971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_ccs: Add Xe2 ccs crc tests (rev3)
URL   : https://patchwork.freedesktop.org/series/129593/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14255 -> IGTPW_10661
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/index.html

Participating hosts (38 -> 36)
------------------------------

  Additional (1): bat-mtlp-8 
  Missing    (3): bat-kbl-2 fi-apl-guc fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10661 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-mtlp-8:         NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][2] ([fdo#109271]) +15 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-mtlp-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][5] ([i915#4083])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][6] ([i915#4077]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][7] ([i915#4079]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-8:         NOTRUN -> [SKIP][8] ([i915#6621])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][9] ([i915#6621])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][10] ([i915#5190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][11] ([i915#4212]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][12] ([i915#4213]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][13] ([i915#3555] / [i915#3840] / [i915#9159])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([fdo#109285] / [i915#9792])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][15] ([fdo#109285])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-8:         NOTRUN -> [SKIP][16] ([i915#5274])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][17] ([i915#5274] / [i915#9792])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-mtlp-6:         NOTRUN -> [SKIP][18] ([i915#4342] / [i915#5354] / [i915#9792])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-mtlp-6:         NOTRUN -> [SKIP][19] ([i915#9792]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-mtlp-6:         NOTRUN -> [SKIP][20] ([i915#5354] / [i915#9792])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-mtlp-8:         NOTRUN -> [SKIP][21] ([i915#3555] / [i915#8809])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][22] ([i915#3555] / [i915#8809] / [i915#9792])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-mtlp-6:         NOTRUN -> [SKIP][23] ([i915#3708] / [i915#9792])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-mtlp-6:         NOTRUN -> [SKIP][24] ([i915#3708] / [i915#4077]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][25] ([i915#3708] / [i915#4077]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][26] ([i915#3708]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][27] ([i915#3708]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@ccs0:
    - {bat-arls-1}:       [DMESG-WARN][28] ([i915#10194]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14255/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7710 -> IGTPW_10661

  CI-20190529: 20190529
  CI_DRM_14255: 46cf1a7da57fc4fd2306d52aea58a02c7eb06cce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10661: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/index.html
  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-random-ccs-data-4-tiled-xe2-ccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/index.html

--===============4784222220948099971==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_ccs: Add Xe2 ccs crc tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129593/">https://patchwork.freedesktop.org/series/129593/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14255 -&gt; IGTPW_10661</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Additional (1): bat-mtlp-8 <br />
  Missing    (3): bat-kbl-2 fi-apl-guc fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10661 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9159">i915#9159</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_fence@basic-busy@ccs0:<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14255/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7710 -&gt; IGTPW_10661</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14255: 46cf1a7da57fc4fd2306d52aea58a02c7eb06cce @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10661: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10661/index.html<br />
  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-random-ccs-data-4-tiled-xe2-ccs</p>

</body>
</html>

--===============4784222220948099971==--
