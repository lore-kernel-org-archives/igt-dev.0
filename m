Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4000CE69185
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 18:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5E910E13D;
	Fri, 22 Nov 2024 18:07:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D49810E13D;
 Fri, 22 Nov 2024 18:07:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Feudebug?=
 =?utf-8?q?=5Fonline=3A_Introduce_read/write_pagefault_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 18:07:03 -0000
Message-ID: <173229882346.1794094.8861020354800088973@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
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

Series: tests/intel/xe_eudebug_online: Introduce read/write pagefault tests (rev3)
URL   : https://patchwork.freedesktop.org/series/141401/
State : success

== Summary ==

CI Bug Log - changes from IGT_8123 -> IGTPW_12177
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12177 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          NOTRUN -> [ABORT][1] ([i915#12919]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-adlp-9:         [PASS][2] -> [ABORT][3] ([i915#9413]) +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-adlp-9/igt@i915_selftest@live@workarounds.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/bat-adlp-9/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [PASS][4] -> [ABORT][5] ([i915#12061]) +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-adlp-6:         [PASS][6] -> [INCOMPLETE][7] ([i915#9413]) +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-adlp-6/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/bat-adlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [PASS][8] -> [SKIP][9] ([i915#9197]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@gem_tiled_blits@basic:
    - fi-pnv-d510:        [SKIP][10] -> [PASS][11] +2 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-pnv-d510/igt@gem_tiled_blits@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/fi-pnv-d510/igt@gem_tiled_blits@basic.html

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [FAIL][12] ([i915#12903]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][14] ([i915#12061]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-mtlp-8/igt@i915_selftest@live.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][16] -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [DMESG-WARN][18] ([i915#11621] / [i915#1982]) -> [DMESG-WARN][19] ([i915#11621])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-cfl-8109u/igt@i915_module_load@reload.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/fi-cfl-8109u/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8123 -> IGTPW_12177
  * Linux: CI_DRM_15731 -> CI_DRM_15732

  CI-20190529: 20190529
  CI_DRM_15731: a381faddbfc974e7bd57efe953a738415afccd6a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15732: 2d0d734c211b36125b27eceb42aceac394d4f377 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12177: 6b25633bd4fcbb5dd0149637379a34b25bfec969 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8123: fb343db7fc59c760ef0a0c19303e7bcec177dbd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/index.html
