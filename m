Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB47E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 13:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B733510E348;
	Fri,  3 Jan 2025 13:45:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B5F10E8BD;
 Fri,  3 Jan 2025 13:45:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Ffbcon?=
 =?utf-8?q?=5Ffbt=3A_Add_skip_condition_for_bmg_platform_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jan 2025 13:45:54 -0000
Message-ID: <173591195443.2642194.12227791852744368529@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241113110104.125403-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113110104.125403-1-mohammed.thasleem@intel.com>
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

Series: tests/intel/kms_fbcon_fbt: Add skip condition for bmg platform (rev4)
URL   : https://patchwork.freedesktop.org/series/141281/
State : success

== Summary ==

CI Bug Log - changes from IGT_8174 -> IGTPW_12382
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12382/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12382 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-adlp-9:         [PASS][1] -> [INCOMPLETE][2] ([i915#9413]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-adlp-9/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12382/bat-adlp-9/igt@i915_selftest@live.html
    - bat-adlp-11:        [PASS][3] -> [INCOMPLETE][4] ([i915#9413]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-adlp-11/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12382/bat-adlp-11/igt@i915_selftest@live.html
    - bat-twl-2:          [PASS][5] -> [ABORT][6] ([i915#12919] / [i915#13397])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-twl-2/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12382/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [PASS][7] -> [ABORT][8] ([i915#12919])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12382/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13397]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13397
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8174 -> IGTPW_12382
  * Linux: CI_DRM_15892 -> CI_DRM_15898

  CI-20190529: 20190529
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15898: 901262fb6987b4fa0dbb26979a6c4e25f0ba8fd2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12382: 4f353044f9202b40007c2d4014135bc818bff1c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12382/index.html
