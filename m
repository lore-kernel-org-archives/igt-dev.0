Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7557E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 20:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6682A10E7A8;
	Mon, 16 Dec 2024 20:41:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CA710E7A8;
 Mon, 16 Dec 2024 20:41:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Feudebug?=
 =?utf-8?q?=3A_Introduce_additional_ufence_testcases_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Dec 2024 20:41:46 -0000
Message-ID: <173438170656.3416030.5554516448849186349@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216134937.6136-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241216134937.6136-1-dominik.karol.piatkowski@intel.com>
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

Series: tests/intel/xe_eudebug: Introduce additional ufence testcases (rev3)
URL   : https://patchwork.freedesktop.org/series/142301/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8157 -> IGTPW_12323
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12323 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12323, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12323:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-arls-5:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arls-5/igt@kms_addfb_basic@bad-pitch-128.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/bat-arls-5/igt@kms_addfb_basic@bad-pitch-128.html

  
Known issues
------------

  Here are the changes found in IGTPW_12323 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - bat-arls-5:         [PASS][3] -> [DMESG-WARN][4] ([i915#4423]) +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arls-5/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/bat-arls-5/igt@i915_module_load@reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][5] -> [ABORT][6] ([i915#12061]) +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-mtlp-8/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-arls-5:         NOTRUN -> [ABORT][7] ([i915#12061])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][8] -> [ABORT][9] ([i915#12061])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-arlh-2:         [PASS][10] -> [ABORT][11] ([i915#12061]) +1 other test abort
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [ABORT][12] ([i915#12919]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [ABORT][14] ([i915#12061]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8157 -> IGTPW_12323
  * Linux: CI_DRM_15848 -> CI_DRM_15854

  CI-20190529: 20190529
  CI_DRM_15848: 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15854: 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12323: 366675c464b44cf0831b210c82ac0a82e28fc4fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12323/index.html
