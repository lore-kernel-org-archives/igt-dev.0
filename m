Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5B4D6D239
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 20:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8850410E420;
	Wed, 27 Nov 2024 20:45:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C83410E420;
 Wed, 27 Nov 2024 20:45:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Subject=3A_=5BPATCH_i-g-t?=
 =?utf-8?q?_0/4=5D_lib/xe=3A_Add_SR-IOV_debugfs_and_provisioning_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 20:45:48 -0000
Message-ID: <173274034817.3857378.15010656251534885254@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
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

Series: Subject: [PATCH i-g-t 0/4] lib/xe: Add SR-IOV debugfs and provisioning helpers
URL   : https://patchwork.freedesktop.org/series/141852/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8127 -> IGTPW_12210
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12210 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12210, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/index.html

Participating hosts (45 -> 43)
------------------------------

  Missing    (2): fi-snb-2520m bat-jsl-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12210:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload:
    - bat-arls-5:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-arls-5/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/bat-arls-5/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_12210 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arls-5:         NOTRUN -> [ABORT][3] ([i915#12061])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][4] -> [ABORT][5] ([i915#12061])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][6] ([i915#12903]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-dg1-7:          [FAIL][8] ([i915#12903]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - fi-kbl-7567u:       [DMESG-WARN][10] ([i915#12926]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - fi-kbl-7567u:       [DMESG-WARN][12] ([i915#12920]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12920
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8127 -> IGTPW_12210
  * Linux: CI_DRM_15749 -> CI_DRM_15754

  CI-20190529: 20190529
  CI_DRM_15749: 739a2506c44a0be22cc842d2c625a05ed21c1198 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15754: 24e36a5200d65a337d37827d4abcae11c9693f6f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12210: 12210
  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12210/index.html
