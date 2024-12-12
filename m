Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E390CE7717D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 01:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6824410E24A;
	Thu, 12 Dec 2024 01:11:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C147410E24A;
 Thu, 12 Dec 2024 01:11:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Xe=3A_Add_tests_for_PXP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 01:11:49 -0000
Message-ID: <173396590977.1391498.8746224931648986340@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
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

Series: Xe: Add tests for PXP
URL   : https://patchwork.freedesktop.org/series/142450/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8150 -> IGTPW_12301
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12301 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12301, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12301:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@b-dp2:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-kbl-7567u:       [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
Known issues
------------

  Here are the changes found in IGTPW_12301 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [PASS][5] -> [FAIL][6] ([i915#12903])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_pm:
    - bat-twl-2:          NOTRUN -> [ABORT][7] ([i915#12919]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/bat-twl-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][8] -> [ABORT][9] ([i915#12061]) +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - fi-cfl-8109u:       [PASS][10] -> [DMESG-WARN][11] ([i915#12914]) +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html

  * igt@kms_flip@basic-plain-flip:
    - fi-kbl-7567u:       [PASS][12] -> [DMESG-WARN][13] ([i915#12920])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/fi-kbl-7567u/igt@kms_flip@basic-plain-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/fi-kbl-7567u/igt@kms_flip@basic-plain-flip.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [FAIL][14] ([i915#12903]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-twl-1:          [ABORT][16] ([i915#12919] / [i915#9413]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-twl-1/igt@i915_selftest@live.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/bat-twl-1/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12914
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#12920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12920
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8150 -> IGTPW_12301

  CI-20190529: 20190529
  CI_DRM_15827: 9b5dff950301bf05d2e76745cacb457a0a82b50f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12301: 7f64f6fea842f848e5f7528733280f5853e2f49a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12301/index.html
