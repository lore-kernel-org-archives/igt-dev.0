Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495D6E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 17:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067E410E947;
	Tue, 10 Dec 2024 17:55:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A519410E947;
 Tue, 10 Dec 2024 17:55:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_sink_max_dsc_slice_co?=
 =?utf-8?q?unt_lib_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Dec 2024 17:55:37 -0000
Message-ID: <173385333766.905409.5196229131505997050@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210135322.2117541-1-swati2.sharma@intel.com>
In-Reply-To: <20241210135322.2117541-1-swati2.sharma@intel.com>
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

Series: Add sink max dsc slice count lib helper
URL   : https://patchwork.freedesktop.org/series/142353/
State : success

== Summary ==

CI Bug Log - changes from IGT_8147 -> IGTPW_12284
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12284 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-twl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-twl-1/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/bat-twl-1/igt@core_auth@basic-auth.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [PASS][3] -> [FAIL][4] ([i915#12903])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-dg1-7:          [PASS][5] -> [FAIL][6] ([i915#12903])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp2:
    - fi-cfl-8109u:       [PASS][7] -> [DMESG-WARN][8] ([i915#12914])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][9] ([i915#12904]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-apl-1/igt@dmabuf@all-tests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - bat-dg2-13:         [FAIL][13] ([i915#12505]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - fi-cfl-8109u:       [DMESG-WARN][15] ([i915#11621]) -> [DMESG-WARN][16] ([i915#11621] / [i915#12914]) +2 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12505
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12914
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8147 -> IGTPW_12284

  CI-20190529: 20190529
  CI_DRM_15814: 6966a52cb5531bf6cc785fadba160a71cd31e7aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12284: c34c6cfb6e5421c8492176f45effdbd59839b1e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12284/index.html
