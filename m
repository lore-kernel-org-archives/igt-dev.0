Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A61AD6EBE2
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 08:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD7E10E125;
	Fri, 29 Nov 2024 08:07:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E739910E125;
 Fri, 29 Nov 2024 08:07:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_igt-runner_fact_checking_?=
 =?utf-8?q?=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Nov 2024 08:07:22 -0000
Message-ID: <173286764294.213798.1042774316885389138@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
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

Series: igt-runner fact checking (rev9)
URL   : https://patchwork.freedesktop.org/series/140841/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8130 -> IGTPW_12219
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12219 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12219, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12219:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-plain-flip@b-dp1:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@b-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@b-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12219 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arls-5:         NOTRUN -> [ABORT][5] ([i915#12061])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][6] -> [ABORT][7] ([i915#12061])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-adlp-6:         [PASS][8] -> [INCOMPLETE][9] ([i915#9413]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-adlp-6/igt@i915_selftest@live@workarounds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/bat-adlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-plain-flip:
    - fi-cfl-8109u:       [PASS][10] -> [DMESG-WARN][11] ([i915#12914]) +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/fi-cfl-8109u/igt@kms_flip@basic-plain-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/fi-cfl-8109u/igt@kms_flip@basic-plain-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [ABORT][12] ([i915#12919]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - bat-apl-1:          [DMESG-WARN][14] ([i915#12918]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-apl-1/igt@kms_flip@basic-plain-flip@a-dp1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/bat-apl-1/igt@kms_flip@basic-plain-flip@a-dp1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][16] ([i915#9197]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:
    - fi-cfl-8109u:       [DMESG-WARN][18] ([i915#12914]) -> [PASS][19] +2 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12914
  [i915#12918]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12918
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13119
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8130 -> IGTPW_12219
  * Linux: CI_DRM_15759 -> CI_DRM_15761

  CI-20190529: 20190529
  CI_DRM_15759: 5379d0a88558b73308ad82f163e80b863626e90b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15761: 709349e154b56980b3957b3f72af3f67cfdd7aee @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12219: 12219
  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/index.html
