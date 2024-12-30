Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3D7E77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 13:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A4B10E156;
	Mon, 30 Dec 2024 13:28:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4715B10E156;
 Mon, 30 Dec 2024 13:28:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_pci=5Fmembarrier_test?=
 =?utf-8?q?_in_xe=5Fmmap_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Dec 2024 13:28:54 -0000
Message-ID: <173556533428.950824.13121493370569249068@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241230125757.2581381-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241230125757.2581381-1-tejas.upadhyay@intel.com>
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

Series: Add pci_membarrier test in xe_mmap (rev7)
URL   : https://patchwork.freedesktop.org/series/141296/
State : success

== Summary ==

CI Bug Log - changes from IGT_8172 -> IGTPW_12366
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/index.html

Participating hosts (43 -> 39)
------------------------------

  Additional (1): bat-rplp-1 
  Missing    (5): bat-adlm-1 fi-snb-2520m fi-glk-j4005 bat-twl-1 fi-skl-6600u 

Known issues
------------

  Here are the changes found in IGTPW_12366 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-rplp-1:         NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-rplp-1:         NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic:
    - bat-rplp-1:         NOTRUN -> [SKIP][3] ([i915#3282])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-rplp-1:         NOTRUN -> [SKIP][4] ([i915#6621])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live:
    - bat-twl-2:          NOTRUN -> [ABORT][5] ([i915#12919] / [i915#13397])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-2:          [PASS][6] -> [ABORT][7] ([i915#12919])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8172/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-twl-2/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - bat-jsl-3:          [PASS][8] -> [DMESG-FAIL][9] ([i915#13132]) +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8172/bat-jsl-3/igt@i915_selftest@live@gt_pm.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-jsl-3/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-rplp-1:         NOTRUN -> [SKIP][10] ([i915#4103] / [i915#4213]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-rplp-1:         NOTRUN -> [SKIP][11] ([i915#3555] / [i915#3840])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-rplp-1:         NOTRUN -> [SKIP][12] ([i915#4093]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-rplp-1:         NOTRUN -> [SKIP][13] ([i915#4369])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-rplp-1:         NOTRUN -> [SKIP][14] ([i915#1072] / [i915#9732]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         NOTRUN -> [SKIP][15] ([i915#3555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - bat-rplp-1:         NOTRUN -> [SKIP][16] ([i915#3708]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-rplp-1/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][17] ([i915#12061]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8172/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - {bat-mtlp-9}:       [ABORT][19] ([i915#12061]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8172/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13132
  [i915#13397]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13397
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4369]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8172 -> IGTPW_12366
  * Linux: CI_DRM_15880 -> CI_DRM_15892

  CI-20190529: 20190529
  CI_DRM_15880: d574310669011e7ef8da6d7e17a2938cae06e077 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12366: 862b3bea2ac7e7e005b47c4f8786775b3dbd612c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12366/index.html
