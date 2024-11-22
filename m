Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC390E6917E
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 16:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8B810EC07;
	Fri, 22 Nov 2024 16:25:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B370710EC07;
 Fri, 22 Nov 2024 16:25:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_intel=5Fcompute=3A_Use_va?=
 =?utf-8?q?lid_number_of_array_size_for_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 16:25:48 -0000
Message-ID: <173229274875.1756018.1462289598370212118@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
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

Series: intel_compute: Use valid number of array size for unbind
URL   : https://patchwork.freedesktop.org/series/141693/
State : success

== Summary ==

CI Bug Log - changes from IGT_8123 -> IGTPW_12175
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12175 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-dg2-13:         [PASS][1] -> [FAIL][2] ([i915#12986])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-13/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/bat-dg2-13/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [PASS][3] -> [SKIP][4] ([i915#9197]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@gem_tiled_blits@basic:
    - fi-pnv-d510:        [SKIP][5] -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-pnv-d510/igt@gem_tiled_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/fi-pnv-d510/igt@gem_tiled_blits@basic.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][7] ([i915#12903]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-4:         [FAIL][9] ([i915#12903]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-mtlp-8/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][13] -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [DMESG-WARN][15] ([i915#11621] / [i915#1982]) -> [DMESG-WARN][16] ([i915#11621])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-cfl-8109u/igt@i915_module_load@reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/fi-cfl-8109u/igt@i915_module_load@reload.html

  
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12986]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12986
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8123 -> IGTPW_12175

  CI-20190529: 20190529
  CI_DRM_15731: a381faddbfc974e7bd57efe953a738415afccd6a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12175: 12175
  IGT_8123: fb343db7fc59c760ef0a0c19303e7bcec177dbd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/index.html
