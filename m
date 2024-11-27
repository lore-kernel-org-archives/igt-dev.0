Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0E5D609C1
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 10:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6175110E225;
	Wed, 27 Nov 2024 10:10:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B38910E225;
 Wed, 27 Nov 2024 10:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Skip_test_if_joiner_displ?=
 =?utf-8?q?ay_is_connected_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 10:10:22 -0000
Message-ID: <173270222236.3676557.4210116339278622542@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127081357.569876-1-jeevan.b@intel.com>
In-Reply-To: <20241127081357.569876-1-jeevan.b@intel.com>
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

Series: Skip test if joiner display is connected (rev4)
URL   : https://patchwork.freedesktop.org/series/141614/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8127 -> IGTPW_12204
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12204 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12204, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12204:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-glk-j4005:       [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/fi-glk-j4005/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/fi-glk-j4005/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_12204 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][3] -> [INCOMPLETE][4] ([i915#12904]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-apl-1/igt@dmabuf@all-tests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          NOTRUN -> [ABORT][5] ([i915#12919]) +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][6] -> [ABORT][7] ([i915#12061]) +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][8] ([i915#12903]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-4:         [FAIL][10] ([i915#12903]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][12] ([i915#12061]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-mtlp-8/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - fi-kbl-7567u:       [DMESG-WARN][14] ([i915#12926]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - fi-kbl-7567u:       [DMESG-WARN][16] ([i915#12920]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#12920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12920
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8127 -> IGTPW_12204
  * Linux: CI_DRM_15749 -> CI_DRM_15751

  CI-20190529: 20190529
  CI_DRM_15749: 739a2506c44a0be22cc842d2c625a05ed21c1198 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15751: 441e225c838a29660f3f1c29cc2a617572e63099 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12204: 9966add27274a5e871cc23031a6ea7aebff48777 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12204/index.html
