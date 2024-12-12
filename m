Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33868E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 05:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1E710E2F1;
	Thu, 12 Dec 2024 05:26:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E730A10E2F1;
 Thu, 12 Dec 2024 05:26:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_Update_?=
 =?utf-8?q?chamelium-only=2Etestlist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 05:26:31 -0000
Message-ID: <173398119194.1463466.17312243880735558514@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212042509.30614-1-karthik.b.s@intel.com>
In-Reply-To: <20241212042509.30614-1-karthik.b.s@intel.com>
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

Series: tests/intel-ci: Update chamelium-only.testlist
URL   : https://patchwork.freedesktop.org/series/142462/
State : success

== Summary ==

CI Bug Log - changes from IGT_8150 -> IGTPW_12302
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12302 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][1] -> [INCOMPLETE][2] ([i915#12904]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-apl-1/igt@dmabuf@all-tests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_module_load@reload:
    - bat-arls-5:         [PASS][3] -> [DMESG-WARN][4] ([i915#4423])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-arls-5/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/bat-arls-5/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [PASS][5] -> [FAIL][6] ([i915#12903])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][7] -> [ABORT][8] ([i915#12061]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-mtlp-8/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/bat-mtlp-8/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [FAIL][9] ([i915#12903]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-1:          [ABORT][11] ([i915#12919] / [i915#9413]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/bat-twl-1/igt@i915_selftest@live@gt_lrc.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8150 -> IGTPW_12302
  * Linux: CI_DRM_15827 -> CI_DRM_15828

  CI-20190529: 20190529
  CI_DRM_15827: 9b5dff950301bf05d2e76745cacb457a0a82b50f @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15828: e70dbc9b6fd6666891756ed53e0404e0b48b11de @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12302: 12302
  IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/index.html
