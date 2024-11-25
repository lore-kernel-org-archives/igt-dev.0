Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0944BD3B7FF
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 10:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B6810E3C4;
	Mon, 25 Nov 2024 10:37:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A5D10E3C4;
 Mon, 25 Nov 2024 10:37:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fhangma?=
 =?utf-8?q?n=3A_Fix_spin_engine_hang_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mikolaj Wasiak" <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 10:37:19 -0000
Message-ID: <173253103912.2786911.14583794942519337870@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
In-Reply-To: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
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

Series: tests/intel/i915_hangman: Fix spin engine hang (rev2)
URL   : https://patchwork.freedesktop.org/series/141694/
State : success

== Summary ==

CI Bug Log - changes from IGT_8123 -> IGTPW_12187
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_12187 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12187, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12187:

### IGT changes ###

#### Warnings ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - fi-cfl-8109u:       [DMESG-WARN][1] ([i915#11621]) -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-cfl-8109u/igt@kms_pipe_crc_basic@hang-read-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/fi-cfl-8109u/igt@kms_pipe_crc_basic@hang-read-crc.html

  
Known issues
------------

  Here are the changes found in IGTPW_12187 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-arls-5:         [PASS][3] -> [SKIP][4] ([i915#11191] / [i915#11345]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-arls-5:         [PASS][5] -> [SKIP][6] ([i915#1849])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@fbdev@info.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][7] -> [ABORT][8] ([i915#12061]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [PASS][9] -> [ABORT][10] ([i915#12061]) +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-arls-5:         [PASS][11] -> [SKIP][12] ([i915#3637]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-5:         [PASS][13] -> [SKIP][14] ([i915#4342] / [i915#5354])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         [PASS][15] -> [SKIP][16] ([i915#12732]) +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [PASS][17] -> [SKIP][18] ([i915#9197]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-arls-5:         [PASS][19] -> [SKIP][20] ([i915#12732] / [i915#3708])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@prime_vgem@basic-fence-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@gem_tiled_blits@basic:
    - fi-pnv-d510:        [SKIP][21] -> [PASS][22] +2 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-pnv-d510/igt@gem_tiled_blits@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/fi-pnv-d510/igt@gem_tiled_blits@basic.html

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [DMESG-WARN][23] ([i915#11621] / [i915#1982]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-cfl-8109u/igt@i915_module_load@reload.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [FAIL][25] ([i915#12903]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][27] ([i915#11621]) -> [PASS][28] +127 other tests pass
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][29] ([i915#12920]) -> [PASS][30] +1 other test pass
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arls-5:         [SKIP][31] ([i915#10202]) -> [SKIP][32] ([i915#12732]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-5:         [SKIP][33] ([i915#9886]) -> [SKIP][34] ([i915#12732])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/bat-arls-5/igt@kms_dsc@dsc-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/bat-arls-5/igt@kms_dsc@dsc-basic.html

  
  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#11191]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191
  [i915#11345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12920
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8123 -> IGTPW_12187
  * Linux: CI_DRM_15731 -> CI_DRM_15737

  CI-20190529: 20190529
  CI_DRM_15731: a381faddbfc974e7bd57efe953a738415afccd6a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15737: 4d723d57180a3aafc1a510bc08ef42f4b03671a7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12187: 12187
  IGT_8123: fb343db7fc59c760ef0a0c19303e7bcec177dbd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/index.html
