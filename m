Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EFCD6ED2A
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 13:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D7110E93B;
	Thu, 21 Nov 2024 13:20:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0710E93B;
 Thu, 21 Nov 2024 13:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/gem=5Fmmap=5Foffset?=
 =?utf-8?q?=3A_Fix_OOM_hits?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 13:20:27 -0000
Message-ID: <173219522760.1157697.16056507309729373049@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121104039.314188-4-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20241121104039.314188-4-janusz.krzysztofik@linux.intel.com>
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

Series: tests/gem_mmap_offset: Fix OOM hits
URL   : https://patchwork.freedesktop.org/series/141643/
State : success

== Summary ==

CI Bug Log - changes from IGT_8118 -> IGTPW_12156
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12156:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live:
    - {bat-mtlp-9}:       NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-mtlp-9/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_12156 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-kbl-8809g:       [PASS][2] -> [SKIP][3] ([i915#1849])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@fbdev@info.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/fi-kbl-8809g/igt@fbdev@info.html

  * igt@kms_flip@basic-plain-flip:
    - fi-kbl-8809g:       [PASS][4] -> [SKIP][5] +6 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-twl-2:          [DMESG-WARN][6] ([i915#1982]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-twl-2/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][8] ([i915#12903]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-adls-6:         [FAIL][10] ([i915#12903]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-adls-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][12] ([i915#12829]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [ABORT][14] ([i915#12919]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-8:         [ABORT][16] ([i915#12061]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@too-high:
    - fi-kbl-8809g:       [FAIL][18] ([i915#12900]) -> [PASS][19] +37 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-kbl-8809g:       [SKIP][20] -> [PASS][21] +4 other tests pass
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-apl-1:          [DMESG-WARN][22] ([i915#12918]) -> [PASS][23] +2 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          [SKIP][24] ([i915#4212] / [i915#5190]) -> [SKIP][25] ([i915#5190])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-6:         [SKIP][26] ([i915#4212] / [i915#5190] / [i915#9792]) -> [SKIP][27] ([i915#5190] / [i915#9792])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-11:         [SKIP][28] ([i915#4212] / [i915#5190]) -> [SKIP][29] ([i915#5190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-14:         [SKIP][30] ([i915#4212] / [i915#5190]) -> [SKIP][31] ([i915#5190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-8:         [SKIP][32] ([i915#4212] / [i915#5190]) -> [SKIP][33] ([i915#5190])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-8:          [SKIP][34] ([i915#4212] / [i915#5190]) -> [SKIP][35] ([i915#5190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          [SKIP][36] ([i915#4212] / [i915#4215] / [i915#5190]) -> [SKIP][37] ([i915#4215] / [i915#5190])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-7:          [SKIP][38] ([i915#4212] / [i915#4215]) -> [SKIP][39] ([i915#4215])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-9:          [SKIP][40] ([i915#4212] / [i915#4215] / [i915#5190]) -> [SKIP][41] ([i915#4215] / [i915#5190])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-6:          [SKIP][42] ([i915#12311] / [i915#4212] / [i915#4215]) -> [SKIP][43] ([i915#12311] / [i915#4215])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-11:         [SKIP][44] ([i915#4212] / [i915#4215] / [i915#5190]) -> [SKIP][45] ([i915#4215] / [i915#5190])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-14:         [SKIP][46] ([i915#4212] / [i915#4215] / [i915#5190]) -> [SKIP][47] ([i915#4215] / [i915#5190])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-kbl-8809g:       [FAIL][48] ([i915#12902]) -> [SKIP][49] +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
  [i915#12900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12900
  [i915#12902]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12902
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12915]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12915
  [i915#12918]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12918
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8118 -> IGTPW_12156
  * Linux: CI_DRM_15720 -> CI_DRM_15725

  CI-20190529: 20190529
  CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15725: e46649e7764a9f6868ccbcba7b8b23b413303380 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12156: d56f06a265c56082a85ca4223b4cab1748b82ed1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/index.html
