Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA430E77180
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 20:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6950310E556;
	Mon,  9 Dec 2024 20:36:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95C910E556;
 Mon,  9 Dec 2024 20:36:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/xe=3A_set_hwconfig_NU?=
 =?utf-8?q?LL_for_unsupported_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Dec 2024 20:36:06 -0000
Message-ID: <173377656668.588428.747856020990894472@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
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

Series: lib/xe: set hwconfig NULL for unsupported platforms
URL   : https://patchwork.freedesktop.org/series/142282/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8145 -> IGTPW_12275
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12275 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12275, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12275:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-cfl-8109u/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/fi-cfl-8109u/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1:
    - {bat-mtlp-9}:       [FAIL][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - {bat-mtlp-9}:       [DMESG-WARN][7] ([i915#12695]) -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:
    - {bat-mtlp-9}:       [PASS][9] -> [FAIL][10] +4 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12275 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [PASS][11] -> [FAIL][12] ([i915#12903])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-dg2-11/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-arls-5:         NOTRUN -> [ABORT][13] ([i915#12061])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][14] -> [ABORT][15] ([i915#12061])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp2:
    - fi-cfl-8109u:       [PASS][16] -> [DMESG-WARN][17] ([i915#12914]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-apl-1:          [PASS][18] -> [DMESG-WARN][19] ([i915#12921])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-apl-1:          [PASS][20] -> [DMESG-WARN][21] ([i915#12918]) +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-mtlp-9}:       [DMESG-WARN][22] ([i915#12695]) -> [PASS][23] +5 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@fbdev@read.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-mtlp-9/igt@fbdev@read.html

  * igt@i915_module_load@load:
    - bat-twl-1:          [DMESG-WARN][24] ([i915#1982]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-twl-1/igt@i915_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-twl-1/igt@i915_module_load@load.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - {bat-mtlp-9}:       [DMESG-WARN][26] -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-7567u:       [DMESG-WARN][28] ([i915#12926]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][30] -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1:
    - {bat-mtlp-9}:       [FAIL][32] -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12914
  [i915#12918]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12918
  [i915#12921]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12921
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8145 -> IGTPW_12275

  CI-20190529: 20190529
  CI_DRM_15808: 9d12021e081c72b18c31bda175fb9a43f1d005fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12275: 12275
  IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12275/index.html
