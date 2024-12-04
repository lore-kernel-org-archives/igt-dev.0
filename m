Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10135E7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 23:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BA210E5AD;
	Wed,  4 Dec 2024 23:25:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F0210E5A5;
 Wed,  4 Dec 2024 23:25:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_test/intel/xe=5Fsysfs=3A_?=
 =?utf-8?q?Restore_sysfs_params_correctly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Dec 2024 23:25:01 -0000
Message-ID: <173335470126.2746937.4294184550370078153@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204222347.108788-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241204222347.108788-1-jonathan.cavitt@intel.com>
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

Series: test/intel/xe_sysfs: Restore sysfs params correctly
URL   : https://patchwork.freedesktop.org/series/142138/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8138 -> IGTPW_12247
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12247 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12247, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12247:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
Known issues
------------

  Here are the changes found in IGTPW_12247 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#9318])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#9318])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adls-6:         NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][8] ([i915#4083])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][9] ([i915#4079]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][10] ([i915#4077]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#3282])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [PASS][12] -> [FAIL][13] ([i915#12903])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-14:         NOTRUN -> [SKIP][14] ([i915#11681] / [i915#6621])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][15] -> [ABORT][16] ([i915#12061]) +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arlh-2:         [PASS][17] -> [ABORT][18] ([i915#12061]) +1 other test abort
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [PASS][19] -> [ABORT][20] ([i915#12061]) +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][21] ([i915#5190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][22] ([i915#4215] / [i915#5190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-14:         NOTRUN -> [SKIP][23] ([i915#4212]) +7 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - bat-dg2-13:         NOTRUN -> [SKIP][24] ([Intel XE#484] / [i915#4550]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-13/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-14:         NOTRUN -> [SKIP][25] ([i915#4103] / [i915#4213]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adls-6:         NOTRUN -> [SKIP][26] ([i915#4103]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][27] ([i915#4103]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-14:         NOTRUN -> [SKIP][28] ([i915#3555] / [i915#3840])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         NOTRUN -> [SKIP][29] ([i915#3555] / [i915#3840])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][30] ([i915#3555] / [i915#9886])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-14:         NOTRUN -> [SKIP][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adls-6:         NOTRUN -> [SKIP][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          NOTRUN -> [SKIP][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-14:         NOTRUN -> [SKIP][34] ([i915#5274])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-14:         NOTRUN -> [SKIP][35] ([i915#5354])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - bat-adls-6:         NOTRUN -> [SKIP][36] ([i915#5354])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][37] ([i915#1072] / [i915#9732]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-14:         NOTRUN -> [SKIP][38] ([i915#1072] / [i915#9732]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-14:         NOTRUN -> [SKIP][39] ([i915#3555])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adls-6:         NOTRUN -> [SKIP][40] ([i915#3555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-jsl-1:          NOTRUN -> [SKIP][41] ([i915#3555])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-14:         NOTRUN -> [SKIP][42] ([i915#3708])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][43] ([i915#3291]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg2-14:         NOTRUN -> [SKIP][44] ([i915#3708] / [i915#4077]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-14:         NOTRUN -> [SKIP][45] ([i915#3291] / [i915#3708]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-dg2-14/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [FAIL][46] ([i915#12903]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][48] ([i915#12061]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-mtlp-8/igt@i915_selftest@live.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][50] ([i915#12061]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - {bat-arls-6}:       [ABORT][52] ([i915#12061]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8138/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
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
  [i915#4550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8138 -> IGTPW_12247
  * Linux: CI_DRM_15786 -> CI_DRM_15789

  CI-20190529: 20190529
  CI_DRM_15786: c8df5caf278df4f9ca0aba627047c5ee4318fc0d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15789: a8f3624ace7e2f401299e21e277614e097a55481 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12247: 3ebe7720a14eb5fbf5bf1a323ea93d990f2b85f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8138: 8138

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12247/index.html
