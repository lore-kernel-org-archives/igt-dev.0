Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448F1E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 21:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D1B10EC2C;
	Wed, 11 Dec 2024 21:56:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A21A10EC2C;
 Wed, 11 Dec 2024 21:56:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fhistogram=3A_?=
 =?utf-8?q?Added_IGT_support_to_validate_global_histogram_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Dec 2024 21:56:24 -0000
Message-ID: <173395418403.1345208.12521556494233660056@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20240705091333.328322-1-mohammed.thasleem@intel.com>
In-Reply-To: <20240705091333.328322-1-mohammed.thasleem@intel.com>
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

Series: tests/kms_histogram: Added IGT support to validate global histogram (rev6)
URL   : https://patchwork.freedesktop.org/series/135789/
State : success

== Summary ==

CI Bug Log - changes from IGT_8149 -> IGTPW_12300
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/index.html

Participating hosts (46 -> 44)
------------------------------

  Missing    (2): fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_12300 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][1] -> [ABORT][2] ([i915#12061]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8149/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - {bat-arls-6}:       [ABORT][3] ([i915#12061]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8149/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][5] ([i915#9197]) -> [PASS][6] +3 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8149/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Warnings ####

  * igt@kms_busy@basic@flip:
    - fi-cfl-8109u:       [DMESG-WARN][7] ([i915#11621] / [i915#1982]) -> [DMESG-WARN][8] ([i915#11621]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8149/fi-cfl-8109u/igt@kms_busy@basic@flip.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/fi-cfl-8109u/igt@kms_busy@basic@flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8149 -> IGTPW_12300
  * Linux: CI_DRM_15824 -> CI_DRM_15826

  CI-20190529: 20190529
  CI_DRM_15824: b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15826: f248857cbe7f15f761dad3c61b0fc21b5124de43 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12300: 042d613cbaf4c77da980322b1164c448a0aa40cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8149: 1e3893ae48c972da2338a62477d74de0f7b26776 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/index.html
