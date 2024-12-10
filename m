Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792C5E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 18:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4EE10E956;
	Tue, 10 Dec 2024 18:23:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E7A10E953;
 Tue, 10 Dec 2024 18:23:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/intel=5Fbufops=3A_Set?=
 =?utf-8?q?_NEEDS=5FVISIBLE=5FVRAM_for_each_buf_by_default_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Dec 2024 18:23:51 -0000
Message-ID: <173385503160.905409.3185653503143061949@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205104134.22790-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20241205104134.22790-1-dominik.grzegorzek@intel.com>
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

Series: lib/intel_bufops: Set NEEDS_VISIBLE_VRAM for each buf by default (rev2)
URL   : https://patchwork.freedesktop.org/series/142167/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8147 -> IGTPW_12285
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12285 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12285, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12285:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12285 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][3] -> [ABORT][4] ([i915#12061]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-mtlp-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-7567u:       [PASS][5] -> [DMESG-WARN][6] ([i915#12926])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-kbl-7567u:       [PASS][7] -> [DMESG-WARN][8] ([i915#12920])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-twl-1:          [ABORT][9] ([i915#12435] / [i915#12919]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-twl-1/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/bat-twl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@requests:
    - bat-twl-1:          [ABORT][11] ([i915#12919]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-twl-1/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/bat-twl-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - bat-dg2-13:         [FAIL][15] ([i915#12505]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [DMESG-WARN][17] ([i915#11621] / [i915#1982]) -> [DMESG-WARN][18] ([i915#11621])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-cfl-8109u/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/fi-cfl-8109u/igt@i915_module_load@reload.html

  
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12505
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#12920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12920
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8147 -> IGTPW_12285

  CI-20190529: 20190529
  CI_DRM_15814: 6966a52cb5531bf6cc785fadba160a71cd31e7aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12285: 87df147a66c6b32674f97a008a6238915a7b0849 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12285/index.html
