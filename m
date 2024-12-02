Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4E7D7831C
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 17:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6677510E110;
	Mon,  2 Dec 2024 17:46:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335FB10E110;
 Mon,  2 Dec 2024 17:46:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/2=5D_tests/intel/dsc=3A_Convert_debug_msg_to_info_msg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Dec 2024 17:46:35 -0000
Message-ID: <173316159520.1712299.6590034121661333572@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202085127.1785594-1-swati2.sharma@intel.com>
In-Reply-To: <20241202085127.1785594-1-swati2.sharma@intel.com>
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

Series: series starting with [i-g-t,1/2] tests/intel/dsc: Convert debug msg to info msg
URL   : https://patchwork.freedesktop.org/series/141978/
State : success

== Summary ==

CI Bug Log - changes from IGT_8133 -> IGTPW_12226
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12226/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12226 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [PASS][1] -> [FAIL][2] ([i915#12903])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8133/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12226/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-4:         [PASS][3] -> [FAIL][4] ([i915#12903])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8133/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12226/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@runner@aborted:
    - bat-twl-2:          NOTRUN -> [FAIL][5] ([i915#13173])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12226/bat-twl-2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-cfl-8109u:       [DMESG-WARN][6] ([i915#12914]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8133/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12226/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      [FAIL][8] ([i915#12903]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8133/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12226/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][10] ([i915#9197]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8133/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12226/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12914
  [i915#13173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13173
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8133 -> IGTPW_12226

  CI-20190529: 20190529
  CI_DRM_15770: 77777471ae59ce2f0d0e74d55c60014cf02bd4df @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12226: e63da63e9db5a55ea26bc66806f5ad25d284fc47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8133: 16f2bfe294cc103df8ebb208aa2e64415262f534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12226/index.html
