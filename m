Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F0EE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAABC10E24C;
	Wed, 18 Dec 2024 21:50:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318F010E24C;
 Wed, 18 Dec 2024 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_test/kms=5Fcontent=5Fprot?=
 =?utf-8?q?ection=3A_Add_HDCP_retry_after_LIC_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Dec 2024 21:50:09 -0000
Message-ID: <173455860919.164096.7394025107018525956@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218091826.3014999-1-suraj.kandpal@intel.com>
In-Reply-To: <20241218091826.3014999-1-suraj.kandpal@intel.com>
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

Series: test/kms_content_protection: Add HDCP retry after LIC failure
URL   : https://patchwork.freedesktop.org/series/142776/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8164 -> IGTPW_12343
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12343 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12343, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12343/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12343:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-adlm-1:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-adlm-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12343/bat-adlm-1/igt@i915_selftest@live.html

  * igt@runner@aborted:
    - bat-twl-1:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12343/bat-twl-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_12343 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][4] -> [INCOMPLETE][5] ([i915#12904]) +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-apl-1/igt@dmabuf@all-tests.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12343/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@workarounds:
    - bat-adlp-9:         [PASS][6] -> [ABORT][7] ([i915#9413]) +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-adlp-9/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12343/bat-adlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][8] ([i915#11621]) -> [PASS][9] +132 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12343/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][10] ([i915#12061]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12343/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8164 -> IGTPW_12343
  * Linux: CI_DRM_15864 -> CI_DRM_15865

  CI-20190529: 20190529
  CI_DRM_15864: e9a5d74b7f60fe6f7d55ebe636ff871214b6caec @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15865: d8f0c44e2ed948dcc45d04a0dfa83612995a702b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12343: d3d7581d47a9f09c7fe740e48d5f941f8734cf60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8164: e9d9934c7c6dc6878792d82424fc928e7f6996cb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12343/index.html
