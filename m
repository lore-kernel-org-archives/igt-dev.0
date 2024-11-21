Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7575D78764
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 14:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9553B10E970;
	Thu, 21 Nov 2024 14:17:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FA310E970;
 Thu, 21 Nov 2024 14:17:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Async_flip_with_atomic_co?=
 =?utf-8?q?mmit_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 14:17:40 -0000
Message-ID: <173219866088.1178697.597893255147942339@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
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

Series: Async flip with atomic commit (rev4)
URL   : https://patchwork.freedesktop.org/series/139163/
State : success

== Summary ==

CI Bug Log - changes from IGT_8118 -> IGTPW_12157
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/index.html

Participating hosts (46 -> 44)
------------------------------

  Missing    (2): bat-adlp-6 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12157 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-kbl-8809g:       [PASS][1] -> [SKIP][2] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@fbdev@info.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/fi-kbl-8809g/igt@fbdev@info.html

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [PASS][3] -> [FAIL][4] ([i915#12903])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-plain-flip:
    - fi-kbl-8809g:       [PASS][5] -> [SKIP][6] +6 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:
    - fi-kbl-7567u:       [PASS][7] -> [DMESG-WARN][8] ([i915#12926]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-7567u/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/fi-kbl-7567u/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-twl-2:          [DMESG-WARN][9] ([i915#1982]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-twl-2/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adls-6:         [FAIL][11] ([i915#12903]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-adls-6/igt@i915_pm_rpm@module-reload.html
    - bat-dg1-7:          [FAIL][13] ([i915#12903]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][15] ([i915#12829]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [ABORT][17] ([i915#12919]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-8:         [ABORT][19] ([i915#12061]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@too-high:
    - fi-kbl-8809g:       [FAIL][21] ([i915#12900]) -> [PASS][22] +37 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-kbl-8809g:       [SKIP][23] -> [PASS][24] +4 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-apl-1:          [DMESG-WARN][25] ([i915#12918]) -> [PASS][26] +2 other tests pass
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          [SKIP][27] ([i915#4212] / [i915#5190]) -> [SKIP][28] ([i915#5190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-6:         [SKIP][29] ([i915#4212] / [i915#5190] / [i915#9792]) -> [SKIP][30] ([i915#5190] / [i915#9792])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-11:         [SKIP][31] ([i915#4212] / [i915#5190]) -> [SKIP][32] ([i915#5190])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-14:         [SKIP][33] ([i915#4212] / [i915#5190]) -> [SKIP][34] ([i915#5190])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-8:         [SKIP][35] ([i915#4212] / [i915#5190]) -> [SKIP][36] ([i915#5190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-8:          [SKIP][37] ([i915#4212] / [i915#5190]) -> [SKIP][38] ([i915#5190])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          [SKIP][39] ([i915#4212] / [i915#4215] / [i915#5190]) -> [SKIP][40] ([i915#4215] / [i915#5190])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-7:          [SKIP][41] ([i915#4212] / [i915#4215]) -> [SKIP][42] ([i915#4215])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-9:          [SKIP][43] ([i915#4212] / [i915#4215] / [i915#5190]) -> [SKIP][44] ([i915#4215] / [i915#5190])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-6:          [SKIP][45] ([i915#12311] / [i915#4212] / [i915#4215]) -> [SKIP][46] ([i915#12311] / [i915#4215])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-11:         [SKIP][47] ([i915#4212] / [i915#4215] / [i915#5190]) -> [SKIP][48] ([i915#4215] / [i915#5190])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-14:         [SKIP][49] ([i915#4212] / [i915#4215] / [i915#5190]) -> [SKIP][50] ([i915#4215] / [i915#5190])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-kbl-8809g:       [FAIL][51] ([i915#12902]) -> [SKIP][52] +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
  [i915#12900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12900
  [i915#12902]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12902
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12918]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12918
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8118 -> IGTPW_12157
  * Linux: CI_DRM_15720 -> CI_DRM_15725

  CI-20190529: 20190529
  CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15725: e46649e7764a9f6868ccbcba7b8b23b413303380 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12157: 12157
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/index.html
