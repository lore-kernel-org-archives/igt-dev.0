Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8BEE7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 21:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCB410E2CE;
	Mon,  9 Dec 2024 21:02:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E3810E2CE;
 Mon,  9 Dec 2024 21:02:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/xe=5Fspin=5Fbatch?=
 =?utf-8?q?=3A_Add_spin-timestamp-check_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Dec 2024 21:02:18 -0000
Message-ID: <173377813836.594686.13323370002682292000@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206111032.572276-1-pravalika.gurram@intel.com>
In-Reply-To: <20241206111032.572276-1-pravalika.gurram@intel.com>
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

Series: tests/xe_spin_batch: Add spin-timestamp-check (rev6)
URL   : https://patchwork.freedesktop.org/series/140933/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8145 -> IGTPW_12276
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12276 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12276, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12276:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-1:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_close_race@basic-process:
    - {bat-mtlp-9}:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@gem_close_race@basic-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-mtlp-9/igt@gem_close_race@basic-process.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - {bat-mtlp-9}:       [PASS][5] -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
Known issues
------------

  Here are the changes found in IGTPW_12276 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-jsl-1:          [PASS][7] -> [DMESG-FAIL][8] ([i915#13132]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-jsl-1/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-jsl-1/igt@i915_selftest@live.html
    - bat-arls-5:         NOTRUN -> [ABORT][9] ([i915#12061])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][10] -> [ABORT][11] ([i915#12061])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-apl-1:          [PASS][12] -> [DMESG-WARN][13] ([i915#12921])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         [PASS][14] -> [SKIP][15] ([i915#9197])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-twl-1:          [DMESG-WARN][16] ([i915#1982]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-twl-1/igt@i915_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-twl-1/igt@i915_module_load@load.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][18] ([i915#12061]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - {bat-mtlp-9}:       [DMESG-WARN][20] -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-7567u:       [DMESG-WARN][22] ([i915#12926]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1:
    - {bat-mtlp-9}:       [FAIL][26] -> [PASS][27] +3 other tests pass
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - {bat-mtlp-9}:       [DMESG-WARN][28] ([i915#12695]) -> [PASS][29] +8 other tests pass
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12921]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12921
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926
  [i915#13132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13132
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8145 -> IGTPW_12276

  CI-20190529: 20190529
  CI_DRM_15808: 9d12021e081c72b18c31bda175fb9a43f1d005fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12276: 12276
  IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12276/index.html
