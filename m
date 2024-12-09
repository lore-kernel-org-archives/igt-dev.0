Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BA3E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 21:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE3610E582;
	Mon,  9 Dec 2024 21:28:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F30F10E577;
 Mon,  9 Dec 2024 21:28:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_new_test_to_validate_?=
 =?utf-8?q?adaptive_sharpness_filter_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Dec 2024 21:28:30 -0000
Message-ID: <173377971005.600769.11500459201686443979@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
In-Reply-To: <20241209114623.1843033-1-swati2.sharma@intel.com>
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

Series: Add new test to validate adaptive sharpness filter (rev10)
URL   : https://patchwork.freedesktop.org/series/130218/
State : success

== Summary ==

CI Bug Log - changes from IGT_8145 -> IGTPW_12277
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12277:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_close_race@basic-threads:
    - {bat-mtlp-9}:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-mtlp-9/igt@gem_close_race@basic-threads.html

  * igt@kms_addfb_basic@small-bo:
    - {bat-mtlp-9}:       [PASS][3] -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_addfb_basic@small-bo.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-mtlp-9/igt@kms_addfb_basic@small-bo.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - {bat-mtlp-9}:       [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
Known issues
------------

  Here are the changes found in IGTPW_12277 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-adlm-1:         [PASS][7] -> [ABORT][8] ([i915#9413]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-adlm-1/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-adlm-1/igt@i915_selftest@live.html
    - bat-arls-5:         NOTRUN -> [ABORT][9] ([i915#12061])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][10] -> [ABORT][11] ([i915#12061])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [PASS][12] -> [ABORT][13] ([i915#12061]) +1 other test abort
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-twl-1:          [DMESG-WARN][14] ([i915#1982]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-twl-1/igt@i915_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-twl-1/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [FAIL][16] ([i915#12903]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - {bat-mtlp-9}:       [ABORT][18] ([i915#12061]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - {bat-mtlp-9}:       [DMESG-WARN][20] -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-7567u:       [DMESG-WARN][22] ([i915#12926]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1:
    - {bat-mtlp-9}:       [FAIL][26] -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         [SKIP][28] ([i915#9197]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - {bat-mtlp-9}:       [DMESG-WARN][30] ([i915#12695]) -> [PASS][31] +6 other tests pass
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8145 -> IGTPW_12277

  CI-20190529: 20190529
  CI_DRM_15808: 9d12021e081c72b18c31bda175fb9a43f1d005fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12277: 12277
  IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/index.html
