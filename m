Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CA3E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 14:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A89210E976;
	Tue, 17 Dec 2024 14:06:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C98410E976;
 Tue, 17 Dec 2024 14:06:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Fcore=3A_Use_suf?=
 =?utf-8?q?fix_for_casting_to_long_to_avoid_overflow?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Dec 2024 14:06:22 -0000
Message-ID: <173444438237.3847390.4981450874904100559@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
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

Series: lib/igt_core: Use suffix for casting to long to avoid overflow
URL   : https://patchwork.freedesktop.org/series/142712/
State : success

== Summary ==

CI Bug Log - changes from IGT_8160 -> IGTPW_12332
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/index.html

Participating hosts (45 -> 42)
------------------------------

  Missing    (3): fi-hsw-4770 fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12332:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1:
    - {bat-mtlp-9}:       NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12332 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][2] -> [INCOMPLETE][3] ([i915#12904]) +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8160/bat-apl-1/igt@dmabuf@all-tests.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][4] -> [ABORT][5] ([i915#12061]) +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8160/bat-mtlp-8/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-arls-5:         NOTRUN -> [ABORT][6] ([i915#12061])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][7] -> [ABORT][8] ([i915#12061])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8160/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [PASS][9] -> [ABORT][10] ([i915#12061]) +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8160/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - {bat-mtlp-9}:       [ABORT][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8160/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8160 -> IGTPW_12332

  CI-20190529: 20190529
  CI_DRM_15858: ff2d4c1b285a836d28341cdf04adbc811757d4c8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12332: 1678524f3fdb72edcc7d20562c9d535886d89485 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8160: 4f10d98c56498ab29445ae0b06aab6f5a8ec2eca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12332/index.html
