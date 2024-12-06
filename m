Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DE3E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 13:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9931F10E3EF;
	Fri,  6 Dec 2024 13:39:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D1C10E3EF;
 Fri,  6 Dec 2024 13:39:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/gem=5Fexec=5F?=
 =?utf-8?q?balancer=3A_Decrease_expected_load_value_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 13:39:51 -0000
Message-ID: <173349239129.3338345.11394918465392245789@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <3w2z25pzkowhe7phqdyjdmtjxvl6osxrwal7klnsqk2b2fvhlm@ouaenirljtfi>
In-Reply-To: <3w2z25pzkowhe7phqdyjdmtjxvl6osxrwal7klnsqk2b2fvhlm@ouaenirljtfi>
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

Series: tests/intel/gem_exec_balancer: Decrease expected load value (rev3)
URL   : https://patchwork.freedesktop.org/series/142150/
State : success

== Summary ==

CI Bug Log - changes from IGT_8141 -> IGTPW_12267
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/index.html

Participating hosts (44 -> 40)
------------------------------

  Missing    (4): fi-elk-e7500 fi-ivb-3770 fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_12267 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [PASS][1] -> [ABORT][2] ([i915#12919])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8141/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][3] -> [ABORT][4] ([i915#12061]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8141/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [PASS][5] -> [DMESG-WARN][6] ([i915#12253])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8141/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         [PASS][7] -> [SKIP][8] ([i915#9197])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8141/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][9] ([i915#12903]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8141/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-dg1-7:          [FAIL][11] ([i915#12903]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8141/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][13] ([i915#12061]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8141/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - {bat-mtlp-9}:       [ABORT][15] ([i915#12061]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8141/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8141 -> IGTPW_12267
  * Linux: CI_DRM_15799 -> CI_DRM_15800

  CI-20190529: 20190529
  CI_DRM_15799: e57b4b7cd137e0ae00d2601b4b55ab7f504da422 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15800: 2e90353f058f2487798ad9236f0926df4ea54f02 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12267: 12267
  IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12267/index.html
