Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46266E6C610
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 07:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2B910E24B;
	Tue,  3 Dec 2024 07:47:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D20B10E5F5;
 Tue,  3 Dec 2024 07:47:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Add_ultra_joiner_to_kms?=
 =?utf-8?q?=5Finvalid=5Fmode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Dec 2024 07:47:37 -0000
Message-ID: <173321205743.1927314.5372617366911618410@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203064401.366661-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241203064401.366661-1-santhosh.reddy.guddati@intel.com>
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

Series: Add ultra joiner to kms_invalid_mode
URL   : https://patchwork.freedesktop.org/series/142027/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8134 -> IGTPW_12232
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12232 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12232, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12232:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8134/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/bat-arlh-3/igt@i915_selftest@live.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7:
    - {bat-mtlp-9}:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7.html

  
Known issues
------------

  Here are the changes found in IGTPW_12232 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [PASS][4] -> [FAIL][5] ([i915#12903])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8134/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          NOTRUN -> [ABORT][6] ([i915#12919]) +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@gt_pm:
    - bat-jsl-3:          [PASS][7] -> [DMESG-FAIL][8] ([i915#13132]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8134/bat-jsl-3/igt@i915_selftest@live@gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/bat-jsl-3/igt@i915_selftest@live@gt_pm.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [INCOMPLETE][9] ([i915#12904]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8134/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      [FAIL][11] ([i915#12903]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8134/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-9:         [FAIL][13] ([i915#11989]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8134/bat-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/bat-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - bat-adlp-9:         [FAIL][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8134/bat-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/bat-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13132


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8134 -> IGTPW_12232
  * Linux: CI_DRM_15774 -> CI_DRM_15775

  CI-20190529: 20190529
  CI_DRM_15774: 83cfa47b496201ff05d4a369f6fe3f75665a2acf @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15775: 4de82d50b8de6a278c1483a7f76ae830c89d1824 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12232: 12232
  IGT_8134: 027fbf68a00630d7bb8ae200c620296e2bad971d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12232/index.html
