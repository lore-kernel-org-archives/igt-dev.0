Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553DCE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 11:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E457910E04C;
	Fri, 20 Dec 2024 11:49:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB7410E04C;
 Fri, 20 Dec 2024 11:49:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel=3A_Remove_TES?=
 =?utf-8?q?T_field_from_test_documentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Dec 2024 11:49:00 -0000
Message-ID: <173469534077.775560.1888277726517008538@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220093914.706003-1-pravalika.gurram@intel.com>
In-Reply-To: <20241220093914.706003-1-pravalika.gurram@intel.com>
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

Series: tests/intel: Remove TEST field from test documentation
URL   : https://patchwork.freedesktop.org/series/142877/
State : success

== Summary ==

CI Bug Log - changes from IGT_8168 -> IGTPW_12361
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/index.html

Participating hosts (45 -> 43)
------------------------------

  Missing    (2): bat-apl-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12361 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2] ([i915#12061]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          NOTRUN -> [ABORT][3] ([i915#12919]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-adlm-1:         [INCOMPLETE][4] ([i915#9413]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/bat-adlm-1/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/bat-adlm-1/igt@i915_selftest@live.html
    - fi-skl-6600u:       [INCOMPLETE][6] ([i915#13050]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/fi-skl-6600u/igt@i915_selftest@live.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/fi-skl-6600u/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13050]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13050
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8168 -> IGTPW_12361

  CI-20190529: 20190529
  CI_DRM_15879: 187726fb12b41cc501b62ee8e42946403083076c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12361: 31b442eb6e3b5f5e9243cc3dd2946df9b0687a14 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8168: ecb4351581b3ca4be76ee3c8842603be69931401 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/index.html
