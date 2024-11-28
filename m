Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC58D69113
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 14:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C9E10ECAE;
	Thu, 28 Nov 2024 14:35:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA6A10ECAE;
 Thu, 28 Nov 2024 14:35:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/xe=5Feudebug=5Fonli?=
 =?utf-8?q?ne=3A_update_thread_count_handling_in_query=5Fattention=5Fbitmask?=
 =?utf-8?q?=5Fsize=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 Nov 2024 14:35:26 -0000
Message-ID: <173280452636.4072800.9248153263507269738@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128130503.241328-1-jan.maslak@intel.com>
In-Reply-To: <20241128130503.241328-1-jan.maslak@intel.com>
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

Series: tests/xe_eudebug_online: update thread count handling in query_attention_bitmask_size() (rev3)
URL   : https://patchwork.freedesktop.org/series/141366/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8129 -> IGTPW_12215
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12215 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12215, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12215:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-arls-5:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/bat-arls-5/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-cfl-8109u:       [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arls-5:         [ABORT][4] ([i915#12061]) -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/bat-arls-5/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/bat-arls-5/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_12215 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [PASS][6] -> [DMESG-WARN][7] ([i915#1982])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][8] -> [ABORT][9] ([i915#12061]) +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/bat-mtlp-8/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/bat-mtlp-8/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][10] ([i915#12904]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/bat-apl-1/igt@dmabuf@all-tests.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_module_load@load:
    - bat-twl-1:          [DMESG-WARN][12] ([i915#1982]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/bat-twl-1/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/bat-twl-1/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - fi-skl-6600u:       [INCOMPLETE][14] ([i915#13050]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/fi-skl-6600u/igt@i915_selftest@live.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/fi-skl-6600u/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][16] ([i915#12061]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         [SKIP][18] ([i915#9197]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13050]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13050
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8129 -> IGTPW_12215

  CI-20190529: 20190529
  CI_DRM_15757: f3f406165a3d5f0fcb60be2060b7920ac385dc22 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12215: 12215
  IGT_8129: 363499a879fee5b9b7eda8acf7c772bce3423493 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12215/index.html
