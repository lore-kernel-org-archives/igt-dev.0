Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E29E77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 11:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085F510E651;
	Tue, 31 Dec 2024 11:10:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141D110E651;
 Tue, 31 Dec 2024 11:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_tests_for_EU_stall_sa?=
 =?utf-8?q?mpling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 31 Dec 2024 11:10:29 -0000
Message-ID: <173564342907.1281245.12803702050149843759@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1735637542.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1735637542.git.harish.chegondi@intel.com>
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

Series: Add tests for EU stall sampling
URL   : https://patchwork.freedesktop.org/series/143030/
State : success

== Summary ==

CI Bug Log - changes from IGT_8173 -> IGTPW_12369
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12369/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12369 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - fi-pnv-d510:        NOTRUN -> [ABORT][1] ([i915#13203])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12369/fi-pnv-d510/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-twl-2:          NOTRUN -> [ABORT][2] ([i915#12919] / [i915#13397])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12369/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - bat-twl-2:          NOTRUN -> [ABORT][3] ([i915#12919])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12369/bat-twl-2/igt@i915_selftest@live@gt_pm.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][4] ([i915#13393]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8173/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12369/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13203
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393
  [i915#13397]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13397


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8173 -> IGTPW_12369

  CI-20190529: 20190529
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12369: 17a1f65a5b444fa3ca77406499754c44219f1810 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8173: 27eea833bac15d1507eb4a864308644a60d60dc7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12369/index.html
