Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54085E7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 07:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0775810EC1B;
	Wed,  4 Dec 2024 07:40:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C48310EC1B;
 Wed,  4 Dec 2024 07:40:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Skip_test_if_joiner_displ?=
 =?utf-8?q?ay_is_connected_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Dec 2024 07:40:47 -0000
Message-ID: <173329804716.2333621.3957034994737510864@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204060924.1155970-1-jeevan.b@intel.com>
In-Reply-To: <20241204060924.1155970-1-jeevan.b@intel.com>
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

Series: Skip test if joiner display is connected (rev6)
URL   : https://patchwork.freedesktop.org/series/141614/
State : success

== Summary ==

CI Bug Log - changes from IGT_8136 -> IGTPW_12240
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_12240 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12240, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12240:

### IGT changes ###

#### Warnings ####

  * igt@i915_module_load@load:
    - fi-pnv-d510:        [ABORT][1] ([i915#13203]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/fi-pnv-d510/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/fi-pnv-d510/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in IGTPW_12240 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-arls-5:         NOTRUN -> [SKIP][3] ([i915#9318])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@eof:
    - bat-arls-5:         NOTRUN -> [SKIP][4] ([i915#11191] / [i915#11345]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-arls-5:         NOTRUN -> [SKIP][5] ([i915#1849])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@fbdev@info.html

  * igt@gem_lmem_swapping@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][6] ([i915#10213] / [i915#11671]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@gem_lmem_swapping@basic.html

  * igt@gem_mmap@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][7] ([i915#11343] / [i915#4083])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][8] ([i915#10197] / [i915#10211] / [i915#4079])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][9] ([i915#12637] / [i915#4077]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arls-5:         NOTRUN -> [SKIP][10] ([i915#10206] / [i915#4079])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [PASS][11] -> [FAIL][12] ([i915#12903])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-arls-5:         NOTRUN -> [SKIP][13] ([i915#10209] / [i915#11681])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-arls-5:         NOTRUN -> [SKIP][14] ([i915#10200] / [i915#12203])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - bat-arls-5:         NOTRUN -> [SKIP][15] ([i915#10200]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-5:         NOTRUN -> [SKIP][16] ([i915#12732]) +16 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-arls-5:         NOTRUN -> [SKIP][17] ([i915#3637]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-arls-5:         NOTRUN -> [SKIP][18] ([i915#10207])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][19] ([i915#4342] / [i915#5354])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [PASS][20] -> [SKIP][21] ([i915#9197]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-arls-5:         NOTRUN -> [SKIP][22] ([i915#9812])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-arls-5:         NOTRUN -> [SKIP][23] ([i915#9732]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arls-5:         NOTRUN -> [SKIP][24] ([i915#10208] / [i915#8809])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-arls-5:         NOTRUN -> [SKIP][25] ([i915#12732] / [i915#3708])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arls-5:         NOTRUN -> [SKIP][26] ([i915#10212] / [i915#3708])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-arls-5:         NOTRUN -> [SKIP][27] ([i915#12637] / [i915#3708] / [i915#4077]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-arls-5:         NOTRUN -> [SKIP][28] ([i915#10214] / [i915#3708])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-arls-5:         NOTRUN -> [SKIP][29] ([i915#10216] / [i915#3708])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-arls-5/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][30] ([i915#12061]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/bat-mtlp-8/igt@i915_selftest@live.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/bat-mtlp-8/igt@i915_selftest@live.html

  
  [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
  [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#11191]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#12732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#13203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13203
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8136 -> IGTPW_12240
  * Linux: CI_DRM_15778 -> CI_DRM_15783

  CI-20190529: 20190529
  CI_DRM_15778: 5779fb3c12faf12589054127d60b1d36d56ba219 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15783: 40be916657d26be563dbbd2b618cc398ea9aeb33 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12240: 29060abd6f510f1605c9e6bf366d17d4894efc92 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12240/index.html
