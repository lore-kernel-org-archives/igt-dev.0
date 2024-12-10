Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F100E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 17:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D2510E3C8;
	Tue, 10 Dec 2024 17:03:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFAC10E3C8;
 Tue, 10 Dec 2024 17:03:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_helpers_to_set_CPU_go?=
 =?utf-8?q?vernor_and_GPU_frequency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Dec 2024 17:03:11 -0000
Message-ID: <173385019164.905409.8317930269935167031@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210092119.1556652-1-francois.dugast@intel.com>
In-Reply-To: <20241210092119.1556652-1-francois.dugast@intel.com>
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

Series: Add helpers to set CPU governor and GPU frequency
URL   : https://patchwork.freedesktop.org/series/142341/
State : success

== Summary ==

CI Bug Log - changes from IGT_8147 -> IGTPW_12282
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12282 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adls-6:         [PASS][1] -> [FAIL][2] ([i915#12903])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/bat-adls-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-2:          [PASS][3] -> [ABORT][4] ([i915#12919] / [i915#9413]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/bat-twl-2/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][5] -> [ABORT][6] ([i915#12061]) +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][7] ([i915#12904]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-apl-1/igt@dmabuf@all-tests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live:
    - bat-twl-1:          [ABORT][9] ([i915#12435] / [i915#12919]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-twl-1/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/bat-twl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@requests:
    - bat-twl-1:          [ABORT][11] ([i915#12919]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-twl-1/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/bat-twl-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - bat-dg2-13:         [FAIL][15] ([i915#12505]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [DMESG-WARN][17] ([i915#11621] / [i915#1982]) -> [DMESG-WARN][18] ([i915#11621])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-cfl-8109u/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/fi-cfl-8109u/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12505
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8147 -> IGTPW_12282

  CI-20190529: 20190529
  CI_DRM_15814: 6966a52cb5531bf6cc785fadba160a71cd31e7aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12282: b75d66b6b55ff982d4cbdca03f41d9288b78de6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/index.html
