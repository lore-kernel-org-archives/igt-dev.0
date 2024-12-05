Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3773FE77171
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 06:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA08410E383;
	Thu,  5 Dec 2024 06:35:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E92410E383;
 Thu,  5 Dec 2024 06:35:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/kms=5Fpm=5Frp?=
 =?utf-8?q?m=3A_Update_cursor=5Ffb3_framebuffer_creation_format_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Dec 2024 06:35:03 -0000
Message-ID: <173338050318.2861566.5861327093034672431@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205060049.1236277-1-jeevan.b@intel.com>
In-Reply-To: <20241205060049.1236277-1-jeevan.b@intel.com>
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

Series: tests/intel/kms_pm_rpm: Update cursor_fb3 framebuffer creation format (rev3)
URL   : https://patchwork.freedesktop.org/series/141765/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8138 -> IGTPW_12250
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12250 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12250, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12250:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-9:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-dg2-9/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-9/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_12250 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#9318])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#9318])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adls-6:         NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][8] ([i915#4083])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][9] ([i915#4079]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][10] ([i915#4077]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#3282])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@gem_tiled_pread_basic.html

  * igt@i915_module_load@load:
    - bat-twl-1:          [PASS][12] -> [DMESG-WARN][13] ([i915#1982])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-twl-1/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-twl-1/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - bat-arls-5:         [PASS][14] -> [DMESG-WARN][15] ([i915#4423]) +1 other test dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-arls-5/igt@i915_module_load@reload.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-arls-5/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [PASS][16] -> [FAIL][17] ([i915#12903])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-adls-6:         NOTRUN -> [FAIL][18] ([i915#12903])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@i915_pm_rpm@module-reload.html
    - bat-dg1-7:          [PASS][19] -> [FAIL][20] ([i915#12903])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-14:         NOTRUN -> [SKIP][21] ([i915#11681] / [i915#6621])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][22] ([i915#5190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][23] ([i915#4215] / [i915#5190])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-14:         NOTRUN -> [SKIP][24] ([i915#4212]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - bat-dg2-13:         NOTRUN -> [SKIP][25] ([Intel XE#484] / [i915#4550]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-13/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][26] ([i915#4103] / [i915#4213]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adls-6:         NOTRUN -> [SKIP][27] ([i915#4103]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][28] ([i915#4103]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][29] ([i915#3555] / [i915#3840])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         NOTRUN -> [SKIP][30] ([i915#3555] / [i915#3840])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][31] ([i915#3555] / [i915#9886])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-14:         NOTRUN -> [SKIP][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adls-6:         NOTRUN -> [SKIP][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          NOTRUN -> [SKIP][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-14:         NOTRUN -> [SKIP][35] ([i915#5274])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-14:         NOTRUN -> [SKIP][36] ([i915#5354])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - bat-adls-6:         NOTRUN -> [SKIP][37] ([i915#5354])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][38] ([i915#1072] / [i915#9732]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-14:         NOTRUN -> [SKIP][39] ([i915#1072] / [i915#9732]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-14:         NOTRUN -> [SKIP][40] ([i915#3555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adls-6:         NOTRUN -> [SKIP][41] ([i915#3555])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-jsl-1:          NOTRUN -> [SKIP][42] ([i915#3555])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-14:         NOTRUN -> [SKIP][43] ([i915#3708])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][44] ([i915#3291]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg2-14:         NOTRUN -> [SKIP][45] ([i915#3708] / [i915#4077]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-14:         NOTRUN -> [SKIP][46] ([i915#3291] / [i915#3708]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-14/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [FAIL][47] ([i915#12903]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][49] ([i915#12061]) -> [PASS][50] +1 other test pass
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-mtlp-8/igt@i915_selftest@live.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][51] ([i915#12061]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - {bat-arls-6}:       [ABORT][53] ([i915#12061]) -> [PASS][54] +1 other test pass
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][55] ([i915#9197]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
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
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8138 -> IGTPW_12250
  * Linux: CI_DRM_15786 -> CI_DRM_15791

  CI-20190529: 20190529
  CI_DRM_15786: c8df5caf278df4f9ca0aba627047c5ee4318fc0d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15791: 6d42506688c08f85240449e80658ab760d899ae2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12250: fdd8d1f27dad09c6d47aa7db3fb619490fc038cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8138: 8138

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12250/index.html
