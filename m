Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16261E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 23:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B992F10E040;
	Wed, 18 Dec 2024 23:39:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B495C10E040;
 Wed, 18 Dec 2024 23:39:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_core=5Fgetversion=3A_Add_?=
 =?utf-8?q?raw-cards_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Dec 2024 23:39:56 -0000
Message-ID: <173456519673.214883.10239446957920625708@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
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

Series: core_getversion: Add raw-cards subtest
URL   : https://patchwork.freedesktop.org/series/142804/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8164 -> IGTPW_12347
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12347 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12347, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12347:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - bat-jsl-3:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-jsl-3/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/bat-jsl-3/igt@i915_selftest@live@gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_12347 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/fi-pnv-d510/igt@debugfs_test@basic-hwmon.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [PASS][4] -> [INCOMPLETE][5] ([i915#12904]) +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        NOTRUN -> [ABORT][6] ([i915#13169])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][7] -> [ABORT][8] ([i915#12061]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-mtlp-8/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-jsl-3:          [PASS][9] -> [INCOMPLETE][10] ([i915#13241])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-jsl-3/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/bat-jsl-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][11] -> [ABORT][12] ([i915#12061]) +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-pnv-d510:        [ABORT][13] ([i915#13203]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/fi-pnv-d510/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/fi-pnv-d510/igt@i915_module_load@load.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][15] ([i915#11621]) -> [PASS][16] +132 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][17] ([i915#12061]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - {bat-mtlp-9}:       [ABORT][19] ([i915#12061]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13169
  [i915#13203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13203
  [i915#13241]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8164 -> IGTPW_12347
  * Linux: CI_DRM_15864 -> CI_DRM_15865

  CI-20190529: 20190529
  CI_DRM_15864: e9a5d74b7f60fe6f7d55ebe636ff871214b6caec @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15865: d8f0c44e2ed948dcc45d04a0dfa83612995a702b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12347: 79cccbe59fa7731277f13fe4a0de853f866a5c8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8164: e9d9934c7c6dc6878792d82424fc928e7f6996cb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12347/index.html
