Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93427E7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 08:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F81E10E86A;
	Tue, 17 Dec 2024 08:09:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9AF10E86A;
 Tue, 17 Dec 2024 08:09:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/xe=5Fspin=5Fbatch?=
 =?utf-8?q?=3A_Add_spin-timestamp-check_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Dec 2024 08:09:43 -0000
Message-ID: <173442298312.3706415.15910002776647935590@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217063029.663697-1-pravalika.gurram@intel.com>
In-Reply-To: <20241217063029.663697-1-pravalika.gurram@intel.com>
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

Series: tests/xe_spin_batch: Add spin-timestamp-check (rev11)
URL   : https://patchwork.freedesktop.org/series/140933/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8158 -> IGTPW_12330
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12330 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12330, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12330/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12330:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - bat-twl-1:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12330/bat-twl-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_12330 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][2] -> [ABORT][3] ([i915#12061]) +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8158/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12330/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][4] ([i915#12061]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8158/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12330/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-arlh-2:         [ABORT][6] ([i915#12061]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8158/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12330/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8158 -> IGTPW_12330

  CI-20190529: 20190529
  CI_DRM_15856: e7c9466eaad2e3e60e6dbd2725a648b58c717fb0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12330: 36e700bb117fffd610a7a12ca648019c8a2792b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8158: 2c1c9453ee8a2d801a080161198e357796da93a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12330/index.html
