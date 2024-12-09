Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF321E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 22:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759D810E034;
	Mon,  9 Dec 2024 22:22:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFC610E034;
 Mon,  9 Dec 2024 22:22:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_vmtb=3A_Introduce_SR-IOV_?=
 =?utf-8?q?VM-level_testing_tool_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Adam Miszczak" <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Dec 2024 22:22:54 -0000
Message-ID: <173378297431.611839.13058512820451247419@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209142423.2718734-1-adam.miszczak@linux.intel.com>
In-Reply-To: <20241209142423.2718734-1-adam.miszczak@linux.intel.com>
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

Series: vmtb: Introduce SR-IOV VM-level testing tool (rev4)
URL   : https://patchwork.freedesktop.org/series/141049/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8145 -> IGTPW_12279
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12279 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12279, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12279:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-apl-1/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-apl-1/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12279 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][3] -> [INCOMPLETE][4] ([i915#12904]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-apl-1/igt@dmabuf@all-tests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [PASS][5] -> [FAIL][6] ([i915#12903])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-dg2-11/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - bat-apl-1:          [PASS][7] -> [DMESG-WARN][8] ([i915#12921]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-apl-1/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-apl-1/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         [PASS][9] -> [SKIP][10] ([i915#9197])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-twl-1:          [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-twl-1/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-twl-1/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [FAIL][13] ([i915#12903]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - {bat-mtlp-9}:       [ABORT][15] ([i915#12061]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - {bat-mtlp-9}:       [DMESG-WARN][17] -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-7567u:       [DMESG-WARN][19] ([i915#12926]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html

  * igt@kms_pipe_crc_basic@read-crc:
    - {bat-mtlp-9}:       [FAIL][23] -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - {bat-mtlp-9}:       [DMESG-WARN][25] ([i915#12695]) -> [PASS][26] +14 other tests pass
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12921]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12921
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8145 -> IGTPW_12279

  CI-20190529: 20190529
  CI_DRM_15808: 9d12021e081c72b18c31bda175fb9a43f1d005fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12279: 12279
  IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12279/index.html
