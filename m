Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F77E7718A
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 00:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B5C10E4C9;
	Fri, 20 Dec 2024 00:49:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272310E4BC;
 Fri, 20 Dec 2024 00:49:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2Cv2=2C1/3=5D_lib/igt=5Fkmod=3A_fix_check_to_confirm_correct?=
 =?utf-8?q?_driver_unload?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Dec 2024 00:49:38 -0000
Message-ID: <173465577879.605245.9850681684590166317@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
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

Series: series starting with [i-g-t,v2,1/3] lib/igt_kmod: fix check to confirm correct driver unload
URL   : https://patchwork.freedesktop.org/series/142858/
State : success

== Summary ==

CI Bug Log - changes from IGT_8167 -> IGTPW_12358
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12358/index.html

Participating hosts (45 -> 42)
------------------------------

  Missing    (3): fi-glk-j4005 bat-arlh-3 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12358 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arls-5:         NOTRUN -> [ABORT][1] ([i915#12061])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12358/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][2] -> [ABORT][3] ([i915#12061])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12358/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [DMESG-WARN][4] ([i915#11621] / [i915#1982]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/fi-cfl-8109u/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12358/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][6] ([i915#11621]) -> [PASS][7] +131 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12358/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - {bat-arls-6}:       [ABORT][8] ([i915#12061]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12358/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8167 -> IGTPW_12358

  CI-20190529: 20190529
  CI_DRM_15873: a5b4c40929f3263a92e34e3f6b3c3c0de57e0e58 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12358: 3e2708c1f488e47d8255ea03d057d6a3ce956c03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8167: 6e93c2e807b398f24673d010f3f71986a09fef8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12358/index.html
