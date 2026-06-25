Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AD7CDB47C
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 03:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275C410E156;
	Thu, 25 Jun 2026 03:12:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8098210E156;
 Thu, 25 Jun 2026 03:11:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3461114721534443782=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Ff?=
 =?utf-8?q?ault=5Fmode=3A_Revive_atomic_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gajendra Uttamchand" <gajendra.uttamchand@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Jun 2026 03:11:50 -0000
Message-ID: <178235711050.114826.10835578147883198581@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625021127.70430-2-gajendra.uttamchand@intel.com>
In-Reply-To: <20260625021127.70430-2-gajendra.uttamchand@intel.com>
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

--===============3461114721534443782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_fault_mode: Revive atomic tests (rev2)
URL   : https://patchwork.freedesktop.org/series/169064/
State : success

== Summary ==

CI Bug Log - changes from IGT_8985 -> IGTPW_15439
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15439 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@fds:
    - fi-pnv-d510:        NOTRUN -> [SKIP][1] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-pnv-d510/igt@gem_exec_parallel@engines@fds.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1:
    - bat-apl-1:          NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
    - fi-elk-e7500:       NOTRUN -> [SKIP][3] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - fi-ilk-650:         NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-edp-1:
    - fi-skl-6600u:       NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:
    - fi-ivb-3770:        NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-1:
    - fi-cfl-guc:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-1.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-mtlp-9:         NOTRUN -> [SKIP][13] ([i915#4077] / [i915#9688])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][14] ([i915#4077] / [i915#9688])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
    - bat-arlh-3:         NOTRUN -> [SKIP][15] ([i915#12637] / [i915#9688])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - bat-adlp-9:         [SKIP][16] ([i915#16497]) -> [PASS][17] +140 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@core_auth@basic-auth.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@core_auth@basic-auth.html

  * igt@gem_busy@busy@all-engines:
    - fi-hsw-4770:        [SKIP][18] -> [PASS][19] +142 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-hsw-4770/igt@gem_busy@busy@all-engines.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-hsw-4770/igt@gem_busy@busy@all-engines.html

  * igt@gem_ctx_exec@basic:
    - bat-kbl-2:          [SKIP][20] -> [PASS][21] +118 other tests pass
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-kbl-2/igt@gem_ctx_exec@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-kbl-2/igt@gem_ctx_exec@basic.html

  * igt@gem_exec_fence@basic-await:
    - bat-adlp-6:         [SKIP][22] ([i915#16497]) -> [PASS][23] +145 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@gem_exec_fence@basic-await.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@gem_exec_fence@basic-await.html

  * igt@gem_exec_fence@nb-await:
    - bat-adlp-11:        [SKIP][24] ([i915#16497]) -> [PASS][25] +110 other tests pass
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@gem_exec_fence@nb-await.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@gem_exec_fence@nb-await.html

  * igt@gem_flink_basic@bad-flink:
    - bat-dg1-6:          [SKIP][26] ([i915#16497]) -> [PASS][27] +68 other tests pass
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_flink_basic@bad-flink.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_flink_basic@bad-flink.html

  * igt@gem_huc_copy@huc-copy:
    - bat-rpls-4:         [SKIP][28] ([i915#16497]) -> [PASS][29] +140 other tests pass
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@gem_huc_copy@huc-copy.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_linear_blits@basic:
    - fi-rkl-11600:       [SKIP][30] ([i915#16497]) -> [PASS][31] +114 other tests pass
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@gem_render_linear_blits@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@gem_render_linear_blits@basic.html

  * igt@gem_wait@busy@all-engines:
    - fi-kbl-x1275:       [SKIP][32] -> [PASS][33] +117 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html

  * igt@gem_wait@wait@all-engines:
    - bat-arls-5:         [SKIP][34] ([i915#16497]) -> [PASS][35] +122 other tests pass
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_wait@wait@all-engines.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_wait@wait@all-engines.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg1-6:          [SKIP][36] ([i915#12311]) -> [PASS][37] +35 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - bat-dg2-8:          [SKIP][38] ([i915#5190]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-arlh-3:         [SKIP][40] ([i915#16497]) -> [PASS][41] +126 other tests pass
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-dg2-9:          [SKIP][42] ([i915#5190]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-dg2-14:         [SKIP][44] ([i915#5190]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@bad-pitch-1024:
    - bat-arls-6:         [SKIP][46] ([i915#16497]) -> [PASS][47] +122 other tests pass
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_addfb_basic@bad-pitch-1024.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_addfb_basic@bad-pitch-1024.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-mtlp-9:         [SKIP][48] ([i915#16497]) -> [PASS][49] +126 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_addfb_basic@bad-pitch-128.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - bat-dg1-7:          [SKIP][50] ([i915#16497]) -> [PASS][51] +128 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_addfb_basic@bad-pitch-999.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - fi-bsw-n3050:       [SKIP][52] -> [PASS][53] +140 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-bsw-n3050/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-n3050/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-dg2-9:          [SKIP][54] ([i915#16497]) -> [PASS][55] +126 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_addfb_basic@too-high:
    - fi-cfl-8109u:       [SKIP][56] -> [PASS][57] +143 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html

  * igt@kms_addfb_basic@unused-offsets:
    - fi-elk-e7500:       [SKIP][58] -> [PASS][59] +137 other tests pass
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-elk-e7500/igt@kms_addfb_basic@unused-offsets.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-elk-e7500/igt@kms_addfb_basic@unused-offsets.html
    - bat-dg2-8:          [SKIP][60] ([i915#16497]) -> [PASS][61] +126 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_addfb_basic@unused-offsets.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-cfl-guc:         [SKIP][62] -> [PASS][63] +144 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-cfl-8700k:       [SKIP][64] -> [PASS][65] +143 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adls-6:         [SKIP][66] ([i915#16497]) -> [PASS][67] +140 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-mtlp-8:         [SKIP][68] ([i915#16497]) -> [PASS][69] +126 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-rplp-1:         [SKIP][70] ([i915#16497]) -> [PASS][71] +136 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [SKIP][72] -> [PASS][73] +143 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-twl-1:          [SKIP][74] ([i915#16497]) -> [PASS][75] +144 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-8809g:       [SKIP][76] -> [PASS][77] +118 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-jsl-5:          [SKIP][78] ([i915#16497]) -> [PASS][79] +143 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-apl-1:          [SKIP][80] -> [PASS][81] +138 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_prop_blob@basic:
    - fi-skl-6600u:       [SKIP][82] -> [PASS][83] +147 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-skl-6600u/igt@kms_prop_blob@basic.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-skl-6600u/igt@kms_prop_blob@basic.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-ilk-650:         [SKIP][84] -> [PASS][85] +137 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-ilk-650/igt@prime_self_import@basic-llseek-bad.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-ilk-650/igt@prime_self_import@basic-llseek-bad.html
    - fi-tgl-1115g4:      [SKIP][86] ([i915#16497]) -> [PASS][87] +143 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@prime_self_import@basic-llseek-bad.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@prime_self_import@basic-llseek-bad.html

  * igt@prime_self_import@basic-with_one_bo:
    - bat-twl-2:          [SKIP][88] ([i915#16497]) -> [PASS][89] +144 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html

  * igt@prime_self_import@basic-with_two_bos:
    - bat-arlh-2:         [SKIP][90] ([i915#11346]) -> [PASS][91] +93 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@prime_self_import@basic-with_two_bos.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@prime_self_import@basic-with_two_bos.html

  * igt@prime_vgem@basic-fence-mmap:
    - fi-pnv-d510:        [SKIP][92] -> [PASS][93] +130 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-pnv-d510/igt@prime_vgem@basic-fence-mmap.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-pnv-d510/igt@prime_vgem@basic-fence-mmap.html

  * igt@vgem_basic@dmabuf-mmap:
    - bat-atsm-1:         [SKIP][94] ([i915#16497]) -> [PASS][95] +68 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@vgem_basic@dmabuf-mmap.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@vgem_basic@dmabuf-mmap.html

  * igt@vgem_basic@second-client:
    - fi-ivb-3770:        [SKIP][96] -> [PASS][97] +138 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-ivb-3770/igt@vgem_basic@second-client.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-ivb-3770/igt@vgem_basic@second-client.html

  * igt@vgem_basic@setversion:
    - bat-dg2-14:         [SKIP][98] ([i915#16497]) -> [PASS][99] +125 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@vgem_basic@setversion.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@vgem_basic@setversion.html
    - fi-bsw-nick:        [SKIP][100] -> [PASS][101] +117 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-bsw-nick/igt@vgem_basic@setversion.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-nick/igt@vgem_basic@setversion.html

  
#### Warnings ####

  * igt@dmabuf@all-tests:
    - fi-rkl-11600:       [SKIP][102] ([i915#16497]) -> [SKIP][103] ([i915#15931])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@dmabuf@all-tests.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@dmabuf@all-tests.html
    - bat-arlh-3:         [SKIP][104] ([i915#16497]) -> [SKIP][105] ([i915#15931])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@dmabuf@all-tests.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@dmabuf@all-tests.html
    - bat-dg1-7:          [SKIP][106] ([i915#16497]) -> [SKIP][107] ([i915#15931])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@dmabuf@all-tests.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@dmabuf@all-tests.html
    - bat-adlp-9:         [SKIP][108] ([i915#16497]) -> [SKIP][109] ([i915#15931])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@dmabuf@all-tests.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@dmabuf@all-tests.html
    - bat-rpls-4:         [SKIP][110] ([i915#16497]) -> [SKIP][111] ([i915#15931])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@dmabuf@all-tests.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@dmabuf@all-tests.html
    - bat-twl-1:          [SKIP][112] ([i915#16497]) -> [SKIP][113] ([i915#15931])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@dmabuf@all-tests.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@dmabuf@all-tests.html
    - bat-jsl-5:          [SKIP][114] ([i915#16497]) -> [SKIP][115] ([i915#15931])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@dmabuf@all-tests.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@dmabuf@all-tests.html
    - bat-rplp-1:         [SKIP][116] ([i915#16497]) -> [SKIP][117] ([i915#15931])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@dmabuf@all-tests.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@dmabuf@all-tests.html
    - fi-tgl-1115g4:      [SKIP][118] ([i915#16497]) -> [SKIP][119] ([i915#15931])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@dmabuf@all-tests.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@dmabuf@all-tests.html
    - bat-dg2-9:          [SKIP][120] ([i915#16497]) -> [SKIP][121] ([i915#15931])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@dmabuf@all-tests.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@dmabuf@all-tests.html
    - bat-adlp-11:        [SKIP][122] ([i915#16497]) -> [SKIP][123] ([i915#15931])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@dmabuf@all-tests.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@dmabuf@all-tests.html
    - bat-dg1-6:          [SKIP][124] ([i915#16497]) -> [SKIP][125] ([i915#15931])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@dmabuf@all-tests.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@dmabuf@all-tests.html
    - bat-adlp-6:         [SKIP][126] ([i915#16497]) -> [SKIP][127] ([i915#15931])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@dmabuf@all-tests.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@dmabuf@all-tests.html
    - bat-atsm-1:         [SKIP][128] ([i915#16497]) -> [SKIP][129] ([i915#15931])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@dmabuf@all-tests.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@dmabuf@all-tests.html
    - bat-twl-2:          [SKIP][130] ([i915#16497]) -> [SKIP][131] ([i915#15931])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@dmabuf@all-tests.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@dmabuf@all-tests.html
    - bat-dg2-14:         [SKIP][132] ([i915#16497]) -> [SKIP][133] ([i915#15931])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@dmabuf@all-tests.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@dmabuf@all-tests.html
    - bat-dg2-8:          [SKIP][134] ([i915#16497]) -> [SKIP][135] ([i915#15931])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@dmabuf@all-tests.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@dmabuf@all-tests.html
    - bat-mtlp-9:         [SKIP][136] ([i915#16497]) -> [SKIP][137] ([i915#15931])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@dmabuf@all-tests.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@dmabuf@all-tests.html
    - bat-arls-6:         [SKIP][138] ([i915#16497]) -> [SKIP][139] ([i915#15931])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@dmabuf@all-tests.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@dmabuf@all-tests.html
    - bat-mtlp-8:         [SKIP][140] ([i915#16497]) -> [SKIP][141] ([i915#15931])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@dmabuf@all-tests.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@dmabuf@all-tests.html
    - bat-adls-6:         [SKIP][142] ([i915#16497]) -> [SKIP][143] ([i915#15931])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@dmabuf@all-tests.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@dmabuf@all-tests.html
    - bat-arls-5:         [SKIP][144] ([i915#16497]) -> [SKIP][145] ([i915#15931])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@dmabuf@all-tests.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@dmabuf@all-tests.html
    - bat-arlh-2:         [SKIP][146] ([i915#11346]) -> [SKIP][147] ([i915#11346] / [i915#15931])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@dmabuf@all-tests.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@dmabuf@all-tests.html

  * igt@fbdev@eof:
    - bat-arlh-2:         [SKIP][148] ([i915#11346]) -> [SKIP][149] ([i915#11345] / [i915#11346]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@fbdev@eof.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@fbdev@eof.html
    - fi-rkl-11600:       [SKIP][150] ([i915#16497]) -> [SKIP][151] ([i915#2582]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@fbdev@eof.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@fbdev@eof.html
    - bat-adlp-11:        [SKIP][152] ([i915#16497]) -> [SKIP][153] ([i915#2582]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@fbdev@eof.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@fbdev@eof.html
    - bat-dg1-6:          [SKIP][154] ([i915#16497]) -> [SKIP][155] ([i915#2582]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@fbdev@eof.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@fbdev@eof.html

  * igt@fbdev@info:
    - fi-kbl-x1275:       [SKIP][156] -> [SKIP][157] ([i915#1849])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@fbdev@info.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@fbdev@info.html
    - bat-adlp-11:        [SKIP][158] ([i915#16497]) -> [SKIP][159] ([i915#1849] / [i915#2582])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@fbdev@info.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@fbdev@info.html
    - bat-dg1-6:          [SKIP][160] ([i915#16497]) -> [SKIP][161] ([i915#1849] / [i915#2582])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@fbdev@info.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@fbdev@info.html
    - fi-bsw-nick:        [SKIP][162] -> [SKIP][163] ([i915#1849])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-bsw-nick/igt@fbdev@info.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-nick/igt@fbdev@info.html
    - bat-kbl-2:          [SKIP][164] -> [SKIP][165] ([i915#1849])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-kbl-2/igt@fbdev@info.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-kbl-2/igt@fbdev@info.html
    - bat-atsm-1:         [SKIP][166] ([i915#16497]) -> [SKIP][167] ([i915#1849] / [i915#2582])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@fbdev@info.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@fbdev@info.html
    - bat-arlh-2:         [SKIP][168] ([i915#11346]) -> [SKIP][169] ([i915#11346] / [i915#1849])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@fbdev@info.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@fbdev@info.html
    - fi-rkl-11600:       [SKIP][170] ([i915#16497]) -> [SKIP][171] ([i915#1849] / [i915#2582])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@fbdev@info.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@fbdev@info.html
    - fi-kbl-8809g:       [SKIP][172] -> [SKIP][173] ([i915#1849])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@fbdev@info.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@fbdev@info.html

  * igt@fbdev@read:
    - bat-atsm-1:         [SKIP][174] ([i915#16497]) -> [SKIP][175] ([i915#2582]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@fbdev@read.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@fbdev@read.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       [SKIP][176] -> [SKIP][177] ([i915#2190])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-7567u:       [SKIP][178] -> [SKIP][179] ([i915#2190])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       [SKIP][180] -> [SKIP][181] ([i915#2190])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-5:          [SKIP][182] ([i915#16497]) -> [SKIP][183] ([i915#2190])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@gem_huc_copy@huc-copy.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@gem_huc_copy@huc-copy.html
    - fi-tgl-1115g4:      [SKIP][184] ([i915#16497]) -> [SKIP][185] ([i915#2190])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html
    - fi-cfl-8700k:       [SKIP][186] -> [SKIP][187] ([i915#2190])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html
    - fi-skl-6600u:       [SKIP][188] -> [SKIP][189] ([i915#2190])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
    - fi-rkl-11600:       [SKIP][190] ([i915#16497]) -> [SKIP][191] ([i915#2190])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-x1275:       [SKIP][192] -> [SKIP][193] ([i915#2190])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - bat-twl-2:          [SKIP][194] ([i915#16497]) -> [SKIP][195] ([i915#10213] / [i915#11671]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@gem_lmem_swapping@basic.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@gem_lmem_swapping@basic.html
    - fi-cfl-8700k:       [SKIP][196] -> [SKIP][197] ([i915#4613]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html
    - bat-arls-5:         [SKIP][198] ([i915#16497]) -> [SKIP][199] ([i915#10213] / [i915#11671]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_lmem_swapping@basic.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_lmem_swapping@basic.html
    - bat-arlh-2:         [SKIP][200] ([i915#11346]) -> [SKIP][201] ([i915#10213] / [i915#11346] / [i915#11671]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_lmem_swapping@basic.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_lmem_swapping@basic.html
    - fi-rkl-11600:       [SKIP][202] ([i915#16497]) -> [SKIP][203] ([i915#4613]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@gem_lmem_swapping@basic.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-mtlp-9:         [SKIP][204] ([i915#16497]) -> [SKIP][205] ([i915#4613]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_lmem_swapping@parallel-random-engines.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-arls-6:         [SKIP][206] ([i915#16497]) -> [SKIP][207] ([i915#10213] / [i915#11671]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-mtlp-8:         [SKIP][208] ([i915#16497]) -> [SKIP][209] ([i915#4613]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-adls-6:         [SKIP][210] ([i915#16497]) -> [SKIP][211] ([i915#4613]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-arlh-3:         [SKIP][212] ([i915#16497]) -> [SKIP][213] ([i915#11671]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-adlp-9:         [SKIP][214] ([i915#16497]) -> [SKIP][215] ([i915#4613]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-rpls-4:         [SKIP][216] ([i915#16497]) -> [SKIP][217] ([i915#4613]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-7567u:       [SKIP][218] -> [SKIP][219] ([i915#4613]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-twl-1:          [SKIP][220] ([i915#16497]) -> [SKIP][221] ([i915#10213] / [i915#11671]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-8809g:       [SKIP][222] -> [SKIP][223] ([i915#4613]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-jsl-5:          [SKIP][224] ([i915#16497]) -> [SKIP][225] ([i915#4613]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@gem_lmem_swapping@parallel-random-engines.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-rplp-1:         [SKIP][226] ([i915#16497]) -> [SKIP][227] ([i915#4613]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-tgl-1115g4:      [SKIP][228] ([i915#16497]) -> [SKIP][229] ([i915#4613]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - bat-adlp-6:         [SKIP][230] ([i915#16497]) -> [SKIP][231] ([i915#4613]) +3 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html
    - fi-skl-6600u:       [SKIP][232] -> [SKIP][233] ([i915#4613]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-guc:         [SKIP][234] -> [SKIP][235] ([i915#4613]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html
    - fi-kbl-x1275:       [SKIP][236] -> [SKIP][237] ([i915#4613]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html
    - bat-adlp-11:        [SKIP][238] ([i915#16497]) -> [SKIP][239] ([i915#4613]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html
    - fi-cfl-8109u:       [SKIP][240] -> [SKIP][241] ([i915#4613]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-atsm-1:         [SKIP][242] ([i915#16497]) -> [SKIP][243] ([i915#4083])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@gem_mmap@basic.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@gem_mmap@basic.html
    - bat-mtlp-9:         [SKIP][244] ([i915#16497]) -> [SKIP][245] ([i915#4083])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_mmap@basic.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_mmap@basic.html
    - bat-mtlp-8:         [SKIP][246] ([i915#16497]) -> [SKIP][247] ([i915#4083])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_mmap@basic.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_mmap@basic.html
    - bat-dg2-8:          [SKIP][248] ([i915#16497]) -> [SKIP][249] ([i915#4083])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@gem_mmap@basic.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@gem_mmap@basic.html
    - bat-arls-6:         [SKIP][250] ([i915#16497]) -> [SKIP][251] ([i915#4083])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_mmap@basic.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_mmap@basic.html
    - bat-arlh-3:         [SKIP][252] ([i915#16497]) -> [SKIP][253] ([i915#11343])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@gem_mmap@basic.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@gem_mmap@basic.html
    - bat-arls-5:         [SKIP][254] ([i915#16497]) -> [SKIP][255] ([i915#4083])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_mmap@basic.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_mmap@basic.html
    - bat-arlh-2:         [SKIP][256] ([i915#11346]) -> [SKIP][257] ([i915#11343] / [i915#11346])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_mmap@basic.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_mmap@basic.html
    - bat-dg1-7:          [SKIP][258] ([i915#16497]) -> [SKIP][259] ([i915#4083])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@gem_mmap@basic.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@gem_mmap@basic.html
    - bat-dg2-9:          [SKIP][260] ([i915#16497]) -> [SKIP][261] ([i915#4083])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@gem_mmap@basic.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@gem_mmap@basic.html
    - bat-dg1-6:          [SKIP][262] ([i915#16497]) -> [SKIP][263] ([i915#4083])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_mmap@basic.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_mmap@basic.html
    - bat-dg2-14:         [SKIP][264] ([i915#16497]) -> [SKIP][265] ([i915#4083])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@gem_mmap@basic.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-9:          [SKIP][266] ([i915#16497]) -> [SKIP][267] ([i915#4077]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@gem_mmap_gtt@basic.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@gem_mmap_gtt@basic.html
    - bat-dg1-6:          [SKIP][268] ([i915#16497]) -> [SKIP][269] ([i915#4077]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_mmap_gtt@basic.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg1-6:          [SKIP][270] ([i915#16497]) -> [SKIP][271] ([i915#4079])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_render_tiled_blits@basic.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_render_tiled_blits@basic.html
    - bat-dg2-14:         [SKIP][272] ([i915#16497]) -> [SKIP][273] ([i915#4079])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@gem_render_tiled_blits@basic.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@gem_render_tiled_blits@basic.html
    - bat-atsm-1:         [SKIP][274] ([i915#16497]) -> [SKIP][275] ([i915#4079])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@gem_render_tiled_blits@basic.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@gem_render_tiled_blits@basic.html
    - bat-mtlp-8:         [SKIP][276] ([i915#16497]) -> [SKIP][277] ([i915#4079])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html
    - bat-dg2-8:          [SKIP][278] ([i915#16497]) -> [SKIP][279] ([i915#4079])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@gem_render_tiled_blits@basic.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@gem_render_tiled_blits@basic.html
    - bat-mtlp-9:         [SKIP][280] ([i915#16497]) -> [SKIP][281] ([i915#4079])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html
    - bat-arls-6:         [SKIP][282] ([i915#16497]) -> [SKIP][283] ([i915#10197] / [i915#10211] / [i915#4079])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_render_tiled_blits@basic.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_render_tiled_blits@basic.html
    - bat-arls-5:         [SKIP][284] ([i915#16497]) -> [SKIP][285] ([i915#10197] / [i915#10211] / [i915#4079])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_render_tiled_blits@basic.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_render_tiled_blits@basic.html
    - bat-arlh-2:         [SKIP][286] ([i915#11346]) -> [SKIP][287] ([i915#10197] / [i915#10211] / [i915#11346] / [i915#11725] / [i915#4079])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_render_tiled_blits@basic.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_render_tiled_blits@basic.html
    - bat-arlh-3:         [SKIP][288] ([i915#16497]) -> [SKIP][289] ([i915#10211] / [i915#11725] / [i915#4079])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@gem_render_tiled_blits@basic.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@gem_render_tiled_blits@basic.html
    - bat-dg1-7:          [SKIP][290] ([i915#16497]) -> [SKIP][291] ([i915#4079])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@gem_render_tiled_blits@basic.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@gem_render_tiled_blits@basic.html
    - bat-dg2-9:          [SKIP][292] ([i915#16497]) -> [SKIP][293] ([i915#4079])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@gem_render_tiled_blits@basic.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-arls-6:         [SKIP][294] ([i915#16497]) -> [SKIP][295] ([i915#12637] / [i915#4077]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_tiled_blits@basic.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_tiled_blits@basic.html
    - bat-arls-5:         [SKIP][296] ([i915#16497]) -> [SKIP][297] ([i915#12637] / [i915#4077]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_tiled_blits@basic.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_tiled_blits@basic.html
    - bat-arlh-2:         [SKIP][298] ([i915#11346]) -> [SKIP][299] ([i915#11346] / [i915#12637]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_tiled_blits@basic.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_tiled_blits@basic.html
    - bat-dg1-7:          [SKIP][300] ([i915#16497]) -> [SKIP][301] ([i915#4077]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@gem_tiled_blits@basic.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-14:         [SKIP][302] ([i915#16497]) -> [SKIP][303] ([i915#4077]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html
    - bat-atsm-1:         [SKIP][304] ([i915#16497]) -> [SKIP][305] ([i915#4077]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
    - bat-mtlp-8:         [SKIP][306] ([i915#16497]) -> [SKIP][307] ([i915#4077]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html
    - bat-dg2-8:          [SKIP][308] ([i915#16497]) -> [SKIP][309] ([i915#4077]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@gem_tiled_fence_blits@basic.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@gem_tiled_fence_blits@basic.html
    - bat-mtlp-9:         [SKIP][310] ([i915#16497]) -> [SKIP][311] ([i915#4077]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-arlh-2:         [SKIP][312] ([i915#11346]) -> [SKIP][313] ([i915#11346] / [i915#15657])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_tiled_pread_basic@basic.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_tiled_pread_basic@basic.html
    - fi-rkl-11600:       [SKIP][314] ([i915#16497]) -> [SKIP][315] ([i915#15656])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@gem_tiled_pread_basic@basic.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@gem_tiled_pread_basic@basic.html
    - bat-arlh-3:         [SKIP][316] ([i915#16497]) -> [SKIP][317] ([i915#15657])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@gem_tiled_pread_basic@basic.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@gem_tiled_pread_basic@basic.html
    - bat-dg1-7:          [SKIP][318] ([i915#16497]) -> [SKIP][319] ([i915#15657])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@gem_tiled_pread_basic@basic.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@gem_tiled_pread_basic@basic.html
    - bat-dg2-9:          [SKIP][320] ([i915#16497]) -> [SKIP][321] ([i915#15657])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@gem_tiled_pread_basic@basic.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@gem_tiled_pread_basic@basic.html
    - bat-rpls-4:         [SKIP][322] ([i915#16497]) -> [SKIP][323] ([i915#15656])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@gem_tiled_pread_basic@basic.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@gem_tiled_pread_basic@basic.html
    - bat-twl-1:          [SKIP][324] ([i915#16497]) -> [SKIP][325] ([i915#15656])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@gem_tiled_pread_basic@basic.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@gem_tiled_pread_basic@basic.html
    - bat-rplp-1:         [SKIP][326] ([i915#16497]) -> [SKIP][327] ([i915#15656])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@gem_tiled_pread_basic@basic.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@gem_tiled_pread_basic@basic.html
    - bat-adlp-11:        [SKIP][328] ([i915#16497]) -> [SKIP][329] ([i915#15656])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@gem_tiled_pread_basic@basic.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@gem_tiled_pread_basic@basic.html
    - bat-dg1-6:          [SKIP][330] ([i915#16497]) -> [SKIP][331] ([i915#15657])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_tiled_pread_basic@basic.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_tiled_pread_basic@basic.html
    - bat-adlp-6:         [SKIP][332] ([i915#16497]) -> [SKIP][333] ([i915#15656])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@gem_tiled_pread_basic@basic.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@gem_tiled_pread_basic@basic.html
    - bat-atsm-1:         [SKIP][334] ([i915#16497]) -> [SKIP][335] ([i915#15657])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@gem_tiled_pread_basic@basic.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@gem_tiled_pread_basic@basic.html
    - bat-twl-2:          [SKIP][336] ([i915#16497]) -> [SKIP][337] ([i915#15656])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@gem_tiled_pread_basic@basic.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@gem_tiled_pread_basic@basic.html
    - bat-dg2-14:         [SKIP][338] ([i915#16497]) -> [SKIP][339] ([i915#15657])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@gem_tiled_pread_basic@basic.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@gem_tiled_pread_basic@basic.html
    - bat-dg2-8:          [SKIP][340] ([i915#16497]) -> [SKIP][341] ([i915#15657])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@gem_tiled_pread_basic@basic.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@gem_tiled_pread_basic@basic.html
    - bat-mtlp-9:         [SKIP][342] ([i915#16497]) -> [SKIP][343] ([i915#15657])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_tiled_pread_basic@basic.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_tiled_pread_basic@basic.html
    - bat-arls-6:         [SKIP][344] ([i915#16497]) -> [SKIP][345] ([i915#15657])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_tiled_pread_basic@basic.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_tiled_pread_basic@basic.html
    - bat-mtlp-8:         [SKIP][346] ([i915#16497]) -> [SKIP][347] ([i915#15657])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_tiled_pread_basic@basic.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_tiled_pread_basic@basic.html
    - bat-adlp-9:         [SKIP][348] ([i915#16497]) -> [SKIP][349] ([i915#15656])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@gem_tiled_pread_basic@basic.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@gem_tiled_pread_basic@basic.html
    - bat-adls-6:         [SKIP][350] ([i915#16497]) -> [SKIP][351] ([i915#15656])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@gem_tiled_pread_basic@basic.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@gem_tiled_pread_basic@basic.html
    - bat-arls-5:         [SKIP][352] ([i915#16497]) -> [SKIP][353] ([i915#15657])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_tiled_pread_basic@basic.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-twl-2:          [SKIP][354] ([i915#16497]) -> [SKIP][355] ([i915#10209] / [i915#11681])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@i915_pm_rps@basic-api.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@i915_pm_rps@basic-api.html
    - bat-dg2-14:         [SKIP][356] ([i915#16497]) -> [SKIP][357] ([i915#11681] / [i915#6621])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@i915_pm_rps@basic-api.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@i915_pm_rps@basic-api.html
    - bat-adlp-6:         [SKIP][358] ([i915#16497]) -> [SKIP][359] ([i915#6621])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@i915_pm_rps@basic-api.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@i915_pm_rps@basic-api.html
    - bat-atsm-1:         [SKIP][360] ([i915#16497]) -> [SKIP][361] ([i915#6621])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@i915_pm_rps@basic-api.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-9:         [SKIP][362] ([i915#16497]) -> [SKIP][363] ([i915#11681] / [i915#6621])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@i915_pm_rps@basic-api.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-8:         [SKIP][364] ([i915#16497]) -> [SKIP][365] ([i915#11681] / [i915#6621])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
    - bat-dg2-8:          [SKIP][366] ([i915#16497]) -> [SKIP][367] ([i915#11681] / [i915#6621])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@i915_pm_rps@basic-api.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@i915_pm_rps@basic-api.html
    - bat-arls-6:         [SKIP][368] ([i915#16497]) -> [SKIP][369] ([i915#10209] / [i915#11681])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@i915_pm_rps@basic-api.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@i915_pm_rps@basic-api.html
    - bat-arlh-3:         [SKIP][370] ([i915#16497]) -> [SKIP][371] ([i915#11681])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@i915_pm_rps@basic-api.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@i915_pm_rps@basic-api.html
    - bat-dg1-7:          [SKIP][372] ([i915#16497]) -> [SKIP][373] ([i915#11681] / [i915#6621])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@i915_pm_rps@basic-api.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@i915_pm_rps@basic-api.html
    - bat-adlp-9:         [SKIP][374] ([i915#16497]) -> [SKIP][375] ([i915#6621])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@i915_pm_rps@basic-api.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@i915_pm_rps@basic-api.html
    - bat-twl-1:          [SKIP][376] ([i915#16497]) -> [SKIP][377] ([i915#10209] / [i915#11681])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@i915_pm_rps@basic-api.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@i915_pm_rps@basic-api.html
    - bat-arls-5:         [SKIP][378] ([i915#16497]) -> [SKIP][379] ([i915#10209] / [i915#11681])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@i915_pm_rps@basic-api.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@i915_pm_rps@basic-api.html
    - bat-rplp-1:         [SKIP][380] ([i915#16497]) -> [SKIP][381] ([i915#6621])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@i915_pm_rps@basic-api.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@i915_pm_rps@basic-api.html
    - bat-arlh-2:         [SKIP][382] ([i915#11346]) -> [SKIP][383] ([i915#10209] / [i915#11346] / [i915#11681])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@i915_pm_rps@basic-api.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@i915_pm_rps@basic-api.html
    - bat-dg2-9:          [SKIP][384] ([i915#16497]) -> [SKIP][385] ([i915#11681] / [i915#6621])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@i915_pm_rps@basic-api.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@i915_pm_rps@basic-api.html
    - bat-adlp-11:        [SKIP][386] ([i915#16497]) -> [SKIP][387] ([i915#6621])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@i915_pm_rps@basic-api.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@i915_pm_rps@basic-api.html
    - bat-dg1-6:          [SKIP][388] ([i915#16497]) -> [SKIP][389] ([i915#11681] / [i915#6621])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@i915_pm_rps@basic-api.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@i915_pm_rps@basic-api.html

  * igt@intel_hwmon@hwmon-read:
    - bat-mtlp-9:         [SKIP][390] ([i915#16497]) -> [SKIP][391] ([i915#7707]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html
    - bat-arls-6:         [SKIP][392] ([i915#16497]) -> [SKIP][393] ([i915#7707]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@intel_hwmon@hwmon-read.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@intel_hwmon@hwmon-read.html
    - bat-mtlp-8:         [SKIP][394] ([i915#16497]) -> [SKIP][395] ([i915#7707]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@intel_hwmon@hwmon-read.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@intel_hwmon@hwmon-read.html
    - bat-adls-6:         [SKIP][396] ([i915#16497]) -> [SKIP][397] ([i915#7707]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@intel_hwmon@hwmon-read.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@intel_hwmon@hwmon-read.html
    - bat-arlh-3:         [SKIP][398] ([i915#16497]) -> [SKIP][399] ([i915#11680]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@intel_hwmon@hwmon-read.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@intel_hwmon@hwmon-read.html
    - bat-adlp-9:         [SKIP][400] ([i915#16497]) -> [SKIP][401] ([i915#7707]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@intel_hwmon@hwmon-read.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@intel_hwmon@hwmon-read.html
    - bat-rpls-4:         [SKIP][402] ([i915#16497]) -> [SKIP][403] ([i915#7707]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@intel_hwmon@hwmon-read.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@intel_hwmon@hwmon-read.html
    - bat-twl-1:          [SKIP][404] ([i915#16497]) -> [SKIP][405] ([i915#7707]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@intel_hwmon@hwmon-read.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@intel_hwmon@hwmon-read.html
    - bat-jsl-5:          [SKIP][406] ([i915#16497]) -> [SKIP][407] ([i915#7707]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@intel_hwmon@hwmon-read.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@intel_hwmon@hwmon-read.html
    - bat-arls-5:         [SKIP][408] ([i915#16497]) -> [SKIP][409] ([i915#7707]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@intel_hwmon@hwmon-read.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@intel_hwmon@hwmon-read.html
    - bat-rplp-1:         [SKIP][410] ([i915#16497]) -> [SKIP][411] ([i915#7707]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@intel_hwmon@hwmon-read.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@intel_hwmon@hwmon-read.html
    - bat-arlh-2:         [SKIP][412] ([i915#11346]) -> [SKIP][413] ([i915#11346] / [i915#11680] / [i915#7707]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@intel_hwmon@hwmon-read.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@intel_hwmon@hwmon-read.html
    - fi-rkl-11600:       [SKIP][414] ([i915#16497]) -> [SKIP][415] ([i915#7707]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@intel_hwmon@hwmon-read.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@intel_hwmon@hwmon-read.html
    - bat-adlp-11:        [SKIP][416] ([i915#16497]) -> [SKIP][417] ([i915#7707]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@intel_hwmon@hwmon-read.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@intel_hwmon@hwmon-read.html
    - fi-tgl-1115g4:      [SKIP][418] ([i915#16497]) -> [SKIP][419] ([i915#7707]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@intel_hwmon@hwmon-read.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@intel_hwmon@hwmon-read.html
    - bat-adlp-6:         [SKIP][420] ([i915#16497]) -> [SKIP][421] ([i915#7707]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@intel_hwmon@hwmon-read.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - bat-twl-2:          [SKIP][422] ([i915#16497]) -> [SKIP][423] ([i915#7707]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@intel_hwmon@hwmon-write.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - bat-dg1-6:          [SKIP][424] ([i915#12311]) -> [SKIP][425] ([i915#12311] / [i915#4212]) +7 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-9:         [SKIP][426] ([i915#16497]) -> [SKIP][427] ([i915#5190])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-hsw-4770:        [SKIP][428] -> [SKIP][429] ([i915#5190])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-8:         [SKIP][430] ([i915#16497]) -> [SKIP][431] ([i915#5190])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-6:         [SKIP][432] ([i915#16497]) -> [SKIP][433] ([i915#10200] / [i915#12203])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arlh-3:         [SKIP][434] ([i915#16497]) -> [SKIP][435] ([i915#11666] / [i915#12203])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-5:         [SKIP][436] ([i915#16497]) -> [SKIP][437] ([i915#10200] / [i915#12203])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arlh-2:         [SKIP][438] ([i915#11346]) -> [SKIP][439] ([i915#10200] / [i915#11346] / [i915#11666] / [i915#12203])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-arlh-2:         [SKIP][440] ([i915#11346]) -> [SKIP][441] ([i915#10200] / [i915#11346] / [i915#11666]) +8 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-9:         [SKIP][442] ([i915#16497]) -> [SKIP][443] ([i915#4212]) +8 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-arls-6:         [SKIP][444] ([i915#16497]) -> [SKIP][445] ([i915#10200]) +8 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-mtlp-8:         [SKIP][446] ([i915#16497]) -> [SKIP][447] ([i915#4212]) +8 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-8:          [SKIP][448] ([i915#5190]) -> [SKIP][449] ([i915#4215] / [i915#5190])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-7:          [SKIP][450] ([i915#16497]) -> [SKIP][451] ([i915#4215])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-9:          [SKIP][452] ([i915#5190]) -> [SKIP][453] ([i915#4215] / [i915#5190])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg1-6:          [SKIP][454] ([i915#12311]) -> [SKIP][455] ([i915#12311] / [i915#4215])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-14:         [SKIP][456] ([i915#5190]) -> [SKIP][457] ([i915#4215] / [i915#5190])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - bat-arlh-3:         [SKIP][458] ([i915#16497]) -> [SKIP][459] ([i915#11666]) +8 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - bat-dg1-7:          [SKIP][460] ([i915#16497]) -> [SKIP][461] ([i915#4212]) +7 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - bat-arls-5:         [SKIP][462] ([i915#16497]) -> [SKIP][463] ([i915#10200]) +8 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-9:          [SKIP][464] ([i915#16497]) -> [SKIP][465] ([i915#4212]) +7 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@size-max:
    - bat-atsm-1:         [SKIP][466] ([i915#16497]) -> [SKIP][467] ([i915#6077]) +37 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_addfb_basic@size-max.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-14:         [SKIP][468] ([i915#16497]) -> [SKIP][469] ([i915#4212]) +7 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - bat-dg2-8:          [SKIP][470] ([i915#16497]) -> [SKIP][471] ([i915#4212]) +7 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_busy@basic:
    - bat-dg1-6:          [SKIP][472] ([i915#12311]) -> [SKIP][473] ([i915#11190] / [i915#12311] / [i915#4303])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_busy@basic.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-twl-2:          [SKIP][474] ([i915#16497]) -> [SKIP][475] ([i915#11030] / [i915#11731]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - bat-arls-6:         [SKIP][476] ([i915#16497]) -> [SKIP][477] ([i915#10202]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [SKIP][478] ([i915#16497]) -> [SKIP][479] ([i915#4103]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-14:         [SKIP][480] ([i915#16497]) -> [SKIP][481] ([i915#4103]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-9:         [SKIP][482] ([i915#16497]) -> [SKIP][483] ([i915#16119] / [i915#4213]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-8:         [SKIP][484] ([i915#16497]) -> [SKIP][485] ([i915#16119] / [i915#4213]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-8:          [SKIP][486] ([i915#16497]) -> [SKIP][487] ([i915#4103]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adls-6:         [SKIP][488] ([i915#16497]) -> [SKIP][489] ([i915#4103]) +1 other test skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arlh-3:         [SKIP][490] ([i915#16497]) -> [SKIP][491] ([i915#11731]) +1 other test skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg1-7:          [SKIP][492] ([i915#16497]) -> [SKIP][493] ([i915#4103]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-9:         [SKIP][494] ([i915#16497]) -> [SKIP][495] ([i915#4103]) +1 other test skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-rpls-4:         [SKIP][496] ([i915#16497]) -> [SKIP][497] ([i915#4103]) +1 other test skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-twl-1:          [SKIP][498] ([i915#16497]) -> [SKIP][499] ([i915#11030] / [i915#11731]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-5:          [SKIP][500] ([i915#16497]) -> [SKIP][501] ([i915#4103]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-arls-5:         [SKIP][502] ([i915#16497]) -> [SKIP][503] ([i915#10202]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-rplp-1:         [SKIP][504] ([i915#16497]) -> [SKIP][505] ([i915#4103]) +1 other test skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-dg2-9:          [SKIP][506] ([i915#16497]) -> [SKIP][507] ([i915#4103]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-adlp-6:         [SKIP][508] ([i915#16497]) -> [SKIP][509] ([i915#4103]) +1 other test skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         [SKIP][510] ([i915#16497]) -> [SKIP][511] ([i915#6078]) +22 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-dg1-6:          [SKIP][512] ([i915#12311]) -> [SKIP][513] ([i915#11190] / [i915#12311]) +15 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-4:         [SKIP][514] ([i915#16497]) -> [SKIP][515] ([i915#16361])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_dsc@dsc-basic.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_dsc@dsc-basic.html
    - bat-twl-1:          [SKIP][516] ([i915#16497]) -> [SKIP][517] ([i915#16361])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_dsc@dsc-basic.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_dsc@dsc-basic.html
    - fi-kbl-8809g:       [SKIP][518] -> [SKIP][519] ([i915#11190]) +16 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
    - bat-jsl-5:          [SKIP][520] ([i915#16497]) -> [SKIP][521] ([i915#16361])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_dsc@dsc-basic.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_dsc@dsc-basic.html
    - bat-arls-5:         [SKIP][522] ([i915#16497]) -> [SKIP][523] ([i915#16361])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_dsc@dsc-basic.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][524] ([i915#16497]) -> [SKIP][525] ([i915#16361])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-tgl-1115g4:      [SKIP][526] ([i915#16497]) -> [SKIP][527] ([i915#16361])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - bat-twl-2:          [SKIP][528] ([i915#16497]) -> [SKIP][529] ([i915#16361])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@kms_dsc@dsc-basic.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         [SKIP][530] ([i915#16497]) -> [SKIP][531] ([i915#16361])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-9:         [SKIP][532] ([i915#16497]) -> [SKIP][533] ([i915#16361])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
    - bat-arls-6:         [SKIP][534] ([i915#16497]) -> [SKIP][535] ([i915#16361])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_dsc@dsc-basic.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         [SKIP][536] ([i915#16497]) -> [SKIP][537] ([i915#16361])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         [SKIP][538] ([i915#16497]) -> [SKIP][539] ([i915#16361])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-arlh-3:         [SKIP][540] ([i915#16497]) -> [SKIP][541] ([i915#16361])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_dsc@dsc-basic.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][542] ([i915#16497]) -> [SKIP][543] ([i915#16361])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-11:        [SKIP][544] ([i915#16497]) -> [SKIP][545] ([i915#3637]) +3 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-dg1-6:          [SKIP][546] ([i915#12311]) -> [SKIP][547] ([i915#12311] / [i915#3637]) +2 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-rkl-11600:       [SKIP][548] ([i915#16497]) -> [SKIP][549] ([i915#3637]) +3 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-rplp-1:         [SKIP][550] ([i915#16497]) -> [SKIP][551] ([i915#4093]) +3 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-14:         [SKIP][552] ([i915#16497]) -> [SKIP][553]
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
    - bat-atsm-1:         [SKIP][554] ([i915#16497]) -> [SKIP][555] ([i915#6093]) +4 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-9:         [SKIP][556] ([i915#16497]) -> [SKIP][557]
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_force_connector_basic@force-load-detect.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-arls-6:         [SKIP][558] ([i915#16497]) -> [SKIP][559] ([i915#10207])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_force_connector_basic@force-load-detect.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-8:         [SKIP][560] ([i915#16497]) -> [SKIP][561]
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-8:          [SKIP][562] ([i915#16497]) -> [SKIP][563]
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adls-6:         [SKIP][564] ([i915#16497]) -> [SKIP][565]
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-arlh-3:         [SKIP][566] ([i915#16497]) -> [SKIP][567] ([i915#10207])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_force_connector_basic@force-load-detect.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg1-7:          [SKIP][568] ([i915#16497]) -> [SKIP][569]
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-9:         [SKIP][570] ([i915#16497]) -> [SKIP][571]
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-rpls-4:         [SKIP][572] ([i915#16497]) -> [SKIP][573]
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_force_connector_basic@force-load-detect.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_force_connector_basic@force-load-detect.html
    - bat-twl-1:          [SKIP][574] ([i915#16497]) -> [SKIP][575] ([i915#11032])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_force_connector_basic@force-load-detect.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-5:          [SKIP][576] ([i915#16497]) -> [SKIP][577]
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_force_connector_basic@force-load-detect.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_force_connector_basic@force-load-detect.html
    - bat-arls-5:         [SKIP][578] ([i915#16497]) -> [SKIP][579] ([i915#10207])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_force_connector_basic@force-load-detect.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_force_connector_basic@force-load-detect.html
    - fi-rkl-11600:       [SKIP][580] ([i915#16497]) -> [SKIP][581]
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
    - fi-tgl-1115g4:      [SKIP][582] ([i915#16497]) -> [SKIP][583]
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-9:          [SKIP][584] ([i915#16497]) -> [SKIP][585]
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-6:         [SKIP][586] ([i915#16497]) -> [SKIP][587]
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-twl-2:          [SKIP][588] ([i915#16497]) -> [SKIP][589] ([i915#11032])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@kms_force_connector_basic@force-load-detect.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-11:        [SKIP][590] ([i915#16497]) -> [SKIP][591] ([i915#4093]) +3 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-11:        [SKIP][592] ([i915#16497]) -> [SKIP][593] ([i915#4342] / [i915#5354])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg1-6:          [SKIP][594] ([i915#12311]) -> [SKIP][595] ([i915#12311] / [i915#4342])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html
    - fi-rkl-11600:       [SKIP][596] ([i915#16497]) -> [SKIP][597] ([i915#1849] / [i915#5354])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-rplp-1:         [SKIP][598] ([i915#16497]) -> [SKIP][599] ([i915#4369])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html
    - bat-adlp-11:        [SKIP][600] ([i915#16497]) -> [SKIP][601] ([i915#4369])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-rkl-11600:       [SKIP][602] ([i915#16497]) -> [SKIP][603] ([i915#11190]) +16 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arlh-2:         [SKIP][604] ([i915#11346]) -> [SKIP][605] ([i915#11190] / [i915#11346]) +16 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-kbl-x1275:       [SKIP][606] -> [SKIP][607] ([i915#11190]) +16 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html
    - bat-adlp-11:        [SKIP][608] ([i915#16497]) -> [SKIP][609] ([i915#11190]) +16 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        [SKIP][610] -> [SKIP][611] ([i915#11190]) +16 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
    - bat-kbl-2:          [SKIP][612] -> [SKIP][613] ([i915#11190]) +16 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
    - bat-atsm-1:         [SKIP][614] ([i915#16497]) -> [SKIP][615] ([i915#1836]) +6 other tests skip
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-14:         [SKIP][616] ([i915#16497]) -> [SKIP][617] ([i915#12343] / [i915#5354])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-8:          [SKIP][618] ([i915#16497]) -> [SKIP][619] ([i915#12343] / [i915#5354])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html
    - bat-arls-6:         [SKIP][620] ([i915#16497]) -> [SKIP][621] ([i915#9812])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlp-9:         [SKIP][622] ([i915#16497]) -> [SKIP][623] ([i915#9812])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
    - bat-adls-6:         [SKIP][624] ([i915#16497]) -> [SKIP][625] ([i915#5354])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
    - bat-arls-5:         [SKIP][626] ([i915#16497]) -> [SKIP][627] ([i915#9812])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][628] ([i915#16497]) -> [SKIP][629] ([i915#12343] / [i915#5354])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-7:          [SKIP][630] ([i915#16497]) -> [SKIP][631] ([i915#12343] / [i915#5354])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
    - bat-rpls-4:         [SKIP][632] ([i915#16497]) -> [SKIP][633] ([i915#5354])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html
    - bat-jsl-5:          [SKIP][634] ([i915#16497]) -> [SKIP][635] ([i915#15205])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html
    - fi-tgl-1115g4:      [SKIP][636] ([i915#16497]) -> [SKIP][637] ([i915#12343] / [i915#9812])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg2-9:          [SKIP][638] ([i915#16497]) -> [SKIP][639] ([i915#12343] / [i915#5354])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html
    - bat-adlp-11:        [SKIP][640] ([i915#16497]) -> [SKIP][641] ([i915#9812])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html
    - bat-dg1-6:          [SKIP][642] ([i915#12311]) -> [SKIP][643] ([i915#12311] / [i915#12343] / [i915#5354])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-1:         [SKIP][644] ([i915#16497]) -> [SKIP][645] ([i915#7357])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_prop_blob@basic.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-mtlp-9:         [SKIP][646] ([i915#16497]) -> [SKIP][647] ([i915#4077] / [i915#9688])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-arls-6:         [SKIP][648] ([i915#16497]) -> [SKIP][649] ([i915#9732]) +3 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-mtlp-8:         [SKIP][650] ([i915#16497]) -> [SKIP][651] ([i915#4077] / [i915#9688])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-adls-6:         [SKIP][652] ([i915#16497]) -> [SKIP][653] ([i915#1072] / [i915#9732]) +3 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-arlh-3:         [SKIP][654] ([i915#16497]) -> [SKIP][655] ([i915#12637] / [i915#9688])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg1-7:          [SKIP][656] ([i915#16497]) -> [SKIP][657] ([i915#1072] / [i915#9732]) +3 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
    - bat-adlp-9:         [SKIP][658] ([i915#16497]) -> [SKIP][659] ([i915#1072] / [i915#9732]) +3 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html
    - bat-rpls-4:         [SKIP][660] ([i915#16497]) -> [SKIP][661] ([i915#1072] / [i915#9732]) +3 other tests skip
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html
    - bat-jsl-5:          [SKIP][662] ([i915#16497]) -> [SKIP][663] ([i915#1072]) +3 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html
    - bat-arls-5:         [SKIP][664] ([i915#16497]) -> [SKIP][665] ([i915#9732]) +3 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html
    - bat-rplp-1:         [SKIP][666] ([i915#16497]) -> [SKIP][667] ([i915#1072] / [i915#9732]) +3 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html
    - bat-arlh-2:         [SKIP][668] ([i915#11346]) -> [SKIP][669] ([i915#11346] / [i915#15855]) +9 other tests skip
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html
    - fi-rkl-11600:       [SKIP][670] ([i915#16497]) -> [SKIP][671] ([i915#1072] / [i915#9732]) +3 other tests skip
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html
    - bat-dg2-9:          [SKIP][672] ([i915#16497]) -> [SKIP][673] ([i915#1072] / [i915#9732]) +3 other tests skip
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html
    - bat-adlp-11:        [SKIP][674] ([i915#16497]) -> [SKIP][675] ([i915#1072] / [i915#9732]) +3 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html
    - bat-dg1-6:          [SKIP][676] ([i915#12311]) -> [SKIP][677] ([i915#1072] / [i915#12311] / [i915#9732]) +3 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html
    - fi-tgl-1115g4:      [SKIP][678] ([i915#16497]) -> [SKIP][679] ([i915#9732]) +3 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-14:         [SKIP][680] ([i915#16497]) -> [SKIP][681] ([i915#1072] / [i915#9732]) +3 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-hsw-4770:        [SKIP][682] -> [SKIP][683] ([i915#1072]) +3 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-8:          [SKIP][684] ([i915#16497]) -> [SKIP][685] ([i915#1072] / [i915#9732]) +3 other tests skip
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adlp-9:         [SKIP][686] ([i915#16497]) -> [SKIP][687] ([i915#3555])
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-rpls-4:         [SKIP][688] ([i915#16497]) -> [SKIP][689] ([i915#3555])
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_setmode@basic-clone-single-crtc.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-twl-1:          [SKIP][690] ([i915#16497]) -> [SKIP][691] ([i915#8809])
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_setmode@basic-clone-single-crtc.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-arls-5:         [SKIP][692] ([i915#16497]) -> [SKIP][693] ([i915#10208] / [i915#8809])
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_setmode@basic-clone-single-crtc.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-rplp-1:         [SKIP][694] ([i915#16497]) -> [SKIP][695] ([i915#3555])
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-arlh-2:         [SKIP][696] ([i915#11346]) -> [SKIP][697] ([i915#10208] / [i915#11346] / [i915#8809])
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-rkl-11600:       [SKIP][698] ([i915#16497]) -> [SKIP][699] ([i915#3555])
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-9:          [SKIP][700] ([i915#16497]) -> [SKIP][701] ([i915#3555])
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlp-11:        [SKIP][702] ([i915#16497]) -> [SKIP][703] ([i915#3555])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_setmode@basic-clone-single-crtc.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-jsl-5:          [SKIP][704] ([i915#16497]) -> [SKIP][705] ([i915#3555])
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_setmode@basic-clone-single-crtc.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-6:          [SKIP][706] ([i915#12311]) -> [SKIP][707] ([i915#12311] / [i915#3555])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-tgl-1115g4:      [SKIP][708] ([i915#16497]) -> [SKIP][709] ([i915#3555])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-twl-2:          [SKIP][710] ([i915#16497]) -> [SKIP][711] ([i915#8809])
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@kms_setmode@basic-clone-single-crtc.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-14:         [SKIP][712] ([i915#16497]) -> [SKIP][713] ([i915#3555])
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlp-6:         [SKIP][714] ([i915#16497]) -> [SKIP][715] ([i915#3555])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-atsm-1:         [SKIP][716] ([i915#16497]) -> [SKIP][717] ([i915#6094])
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-9:         [SKIP][718] ([i915#16497]) -> [SKIP][719] ([i915#3555] / [i915#8809])
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_setmode@basic-clone-single-crtc.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-8:         [SKIP][720] ([i915#16497]) -> [SKIP][721] ([i915#3555] / [i915#8809])
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg2-8:          [SKIP][722] ([i915#16497]) -> [SKIP][723] ([i915#3555])
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adls-6:         [SKIP][724] ([i915#16497]) -> [SKIP][725] ([i915#3555])
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-arls-6:         [SKIP][726] ([i915#16497]) -> [SKIP][727] ([i915#10208] / [i915#8809])
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_setmode@basic-clone-single-crtc.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-arlh-3:         [SKIP][728] ([i915#16497]) -> [SKIP][729] ([i915#8809])
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_setmode@basic-clone-single-crtc.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-7:          [SKIP][730] ([i915#16497]) -> [SKIP][731] ([i915#3555])
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-14:         [SKIP][732] ([i915#16497]) -> [SKIP][733] ([i915#3708])
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-8:          [SKIP][734] ([i915#16497]) -> [SKIP][735] ([i915#3708])
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
    - fi-rkl-11600:       [SKIP][736] ([i915#16497]) -> [SKIP][737] ([i915#3708])
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-9:          [SKIP][738] ([i915#16497]) -> [SKIP][739] ([i915#3708])
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
    - bat-adlp-11:        [SKIP][740] ([i915#16497]) -> [SKIP][741] ([i915#3708])
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-arlh-3:         [SKIP][742] ([i915#16497]) -> [SKIP][743] ([i915#12637]) +4 other tests skip
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg1-7:          [SKIP][744] ([i915#16497]) -> [SKIP][745] ([i915#3708] / [i915#4077]) +1 other test skip
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg2-9:          [SKIP][746] ([i915#16497]) -> [SKIP][747] ([i915#3708] / [i915#4077]) +1 other test skip
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg1-6:          [SKIP][748] ([i915#16497]) -> [SKIP][749] ([i915#3708] / [i915#4077]) +1 other test skip
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@prime_vgem@basic-fence-mmap.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         [SKIP][750] ([i915#16497]) -> [SKIP][751] ([i915#3708]) +1 other test skip
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
    - bat-adlp-9:         [SKIP][752] ([i915#16497]) -> [SKIP][753] ([i915#3291] / [i915#3708]) +2 other tests skip
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@prime_vgem@basic-fence-read.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@prime_vgem@basic-fence-read.html
    - bat-adls-6:         [SKIP][754] ([i915#16497]) -> [SKIP][755] ([i915#3291]) +2 other tests skip
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@prime_vgem@basic-fence-read.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@prime_vgem@basic-fence-read.html
    - bat-arls-5:         [SKIP][756] ([i915#16497]) -> [SKIP][757] ([i915#10212] / [i915#3708])
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@prime_vgem@basic-fence-read.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@prime_vgem@basic-fence-read.html
    - bat-arlh-2:         [SKIP][758] ([i915#11346]) -> [SKIP][759] ([i915#10212] / [i915#11346] / [i915#11726])
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@prime_vgem@basic-fence-read.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@prime_vgem@basic-fence-read.html
    - bat-arlh-3:         [SKIP][760] ([i915#16497]) -> [SKIP][761] ([i915#11726]) +1 other test skip
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@prime_vgem@basic-fence-read.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@prime_vgem@basic-fence-read.html
    - bat-dg1-7:          [SKIP][762] ([i915#16497]) -> [SKIP][763] ([i915#3708]) +3 other tests skip
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@prime_vgem@basic-fence-read.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@prime_vgem@basic-fence-read.html
    - bat-twl-1:          [SKIP][764] ([i915#16497]) -> [SKIP][765] ([i915#10212] / [i915#3708])
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@prime_vgem@basic-fence-read.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@prime_vgem@basic-fence-read.html
    - bat-twl-2:          [SKIP][766] ([i915#16497]) -> [SKIP][767] ([i915#10212] / [i915#3708])
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@prime_vgem@basic-fence-read.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@prime_vgem@basic-fence-read.html
    - bat-arls-6:         [SKIP][768] ([i915#16497]) -> [SKIP][769] ([i915#10212] / [i915#3708])
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@prime_vgem@basic-fence-read.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg2-14:         [SKIP][770] ([i915#16497]) -> [SKIP][771] ([i915#3708] / [i915#4077]) +1 other test skip
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@prime_vgem@basic-gtt.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@prime_vgem@basic-gtt.html
    - bat-mtlp-9:         [SKIP][772] ([i915#16497]) -> [SKIP][773] ([i915#3708] / [i915#4077]) +1 other test skip
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@prime_vgem@basic-gtt.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@prime_vgem@basic-gtt.html
    - bat-arls-6:         [SKIP][774] ([i915#16497]) -> [SKIP][775] ([i915#12637] / [i915#3708] / [i915#4077]) +1 other test skip
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@prime_vgem@basic-gtt.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@prime_vgem@basic-gtt.html
    - bat-mtlp-8:         [SKIP][776] ([i915#16497]) -> [SKIP][777] ([i915#3708] / [i915#4077]) +1 other test skip
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@prime_vgem@basic-gtt.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@prime_vgem@basic-gtt.html
    - bat-dg2-8:          [SKIP][778] ([i915#16497]) -> [SKIP][779] ([i915#3708] / [i915#4077]) +1 other test skip
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@prime_vgem@basic-gtt.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@prime_vgem@basic-gtt.html
    - bat-arls-5:         [SKIP][780] ([i915#16497]) -> [SKIP][781] ([i915#12637] / [i915#3708] / [i915#4077]) +1 other test skip
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@prime_vgem@basic-gtt.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-rpls-4:         [SKIP][782] ([i915#16497]) -> [SKIP][783] ([i915#3708]) +2 other tests skip
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@prime_vgem@basic-read.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@prime_vgem@basic-read.html
    - bat-twl-1:          [SKIP][784] ([i915#16497]) -> [SKIP][785] ([i915#10214] / [i915#3708])
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@prime_vgem@basic-read.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@prime_vgem@basic-read.html
    - bat-arls-5:         [SKIP][786] ([i915#16497]) -> [SKIP][787] ([i915#10214] / [i915#3708])
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@prime_vgem@basic-read.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@prime_vgem@basic-read.html
    - bat-rplp-1:         [SKIP][788] ([i915#16497]) -> [SKIP][789] ([i915#3708]) +2 other tests skip
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@prime_vgem@basic-read.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@prime_vgem@basic-read.html
    - bat-arlh-2:         [SKIP][790] ([i915#11346]) -> [SKIP][791] ([i915#10214] / [i915#11346] / [i915#11726])
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@prime_vgem@basic-read.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@prime_vgem@basic-read.html
    - fi-rkl-11600:       [SKIP][792] ([i915#16497]) -> [SKIP][793] ([i915#3291] / [i915#3708]) +2 other tests skip
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@prime_vgem@basic-read.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@prime_vgem@basic-read.html
    - bat-dg1-6:          [SKIP][794] ([i915#16497]) -> [SKIP][795] ([i915#3708]) +2 other tests skip
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@prime_vgem@basic-read.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@prime_vgem@basic-read.html
    - bat-twl-2:          [SKIP][796] ([i915#16497]) -> [SKIP][797] ([i915#10214] / [i915#3708])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@prime_vgem@basic-read.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@prime_vgem@basic-read.html
    - bat-mtlp-9:         [SKIP][798] ([i915#16497]) -> [SKIP][799] ([i915#3708]) +1 other test skip
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@prime_vgem@basic-read.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@prime_vgem@basic-read.html
    - bat-arls-6:         [SKIP][800] ([i915#16497]) -> [SKIP][801] ([i915#10214] / [i915#3708])
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@prime_vgem@basic-read.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-9:          [SKIP][802] ([i915#16497]) -> [SKIP][803] ([i915#3291] / [i915#3708]) +2 other tests skip
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@prime_vgem@basic-write.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@prime_vgem@basic-write.html
    - bat-adlp-11:        [SKIP][804] ([i915#16497]) -> [SKIP][805] ([i915#3291] / [i915#3708]) +2 other tests skip
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@prime_vgem@basic-write.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@prime_vgem@basic-write.html
    - bat-dg1-6:          [SKIP][806] ([i915#16497]) -> [SKIP][807] ([i915#11723] / [i915#3708])
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@prime_vgem@basic-write.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@prime_vgem@basic-write.html
    - bat-adlp-6:         [SKIP][808] ([i915#16497]) -> [SKIP][809] ([i915#3291] / [i915#3708]) +2 other tests skip
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@prime_vgem@basic-write.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@prime_vgem@basic-write.html
    - bat-twl-2:          [SKIP][810] ([i915#16497]) -> [SKIP][811] ([i915#10216] / [i915#3708])
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@prime_vgem@basic-write.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@prime_vgem@basic-write.html
    - bat-dg2-14:         [SKIP][812] ([i915#16497]) -> [SKIP][813] ([i915#3291] / [i915#3708]) +2 other tests skip
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@prime_vgem@basic-write.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@prime_vgem@basic-write.html
    - bat-atsm-1:         [SKIP][814] ([i915#16497]) -> [SKIP][815] +2 other tests skip
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@prime_vgem@basic-write.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@prime_vgem@basic-write.html
    - bat-mtlp-9:         [SKIP][816] ([i915#16497]) -> [SKIP][817] ([i915#10216] / [i915#3708])
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@prime_vgem@basic-write.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@prime_vgem@basic-write.html
    - bat-arls-6:         [SKIP][818] ([i915#16497]) -> [SKIP][819] ([i915#10216] / [i915#3708])
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@prime_vgem@basic-write.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@prime_vgem@basic-write.html
    - bat-mtlp-8:         [SKIP][820] ([i915#16497]) -> [SKIP][821] ([i915#10216] / [i915#3708])
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@prime_vgem@basic-write.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@prime_vgem@basic-write.html
    - bat-dg2-8:          [SKIP][822] ([i915#16497]) -> [SKIP][823] ([i915#3291] / [i915#3708]) +2 other tests skip
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@prime_vgem@basic-write.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@prime_vgem@basic-write.html
    - bat-arlh-3:         [SKIP][824] ([i915#16497]) -> [SKIP][825] ([i915#11723])
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@prime_vgem@basic-write.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@prime_vgem@basic-write.html
    - bat-twl-1:          [SKIP][826] ([i915#16497]) -> [SKIP][827] ([i915#10216] / [i915#3708])
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@prime_vgem@basic-write.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@prime_vgem@basic-write.html
    - bat-arls-5:         [SKIP][828] ([i915#16497]) -> [SKIP][829] ([i915#10216] / [i915#3708])
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@prime_vgem@basic-write.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@prime_vgem@basic-write.html
    - bat-arlh-2:         [SKIP][830] ([i915#11346]) -> [SKIP][831] ([i915#10216] / [i915#11346] / [i915#11723])
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@prime_vgem@basic-write.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@prime_vgem@basic-write.html

  
  [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030
  [i915#11032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11032
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#11731]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#15205]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15205
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15855]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15855
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4303]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4303
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#4369]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6094
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7357
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8985 -> IGTPW_15439
  * Linux: CI_DRM_18715 -> CI_DRM_18719

  CI-20190529: 20190529
  CI_DRM_18715: f597918e1cbc24ac9896e8082e1621c1af4d5a94 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18719: adbc617250e16fb2db4a4c777b89440927cb8973 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15439: 15439
  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/index.html

--===============3461114721534443782==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_fault_mode: Revive atomic tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169064/">https://patchwork.freedesktop.org/series/169064/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8985 -&gt; IGTPW_15439</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15439 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-pnv-d510/igt@gem_exec_parallel@engines@fds.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-edp-1:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-edp-1.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html">SKIP</a> +2 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">SKIP</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-1:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-1.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@core_auth@basic-auth.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@core_auth@basic-auth.html">PASS</a> +140 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy@all-engines:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-hsw-4770/igt@gem_busy@busy@all-engines.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-hsw-4770/igt@gem_busy@busy@all-engines.html">PASS</a> +142 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic:</p>
<ul>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-kbl-2/igt@gem_ctx_exec@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-kbl-2/igt@gem_ctx_exec@basic.html">PASS</a> +118 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@gem_exec_fence@basic-await.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@gem_exec_fence@basic-await.html">PASS</a> +145 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@gem_exec_fence@nb-await.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@gem_exec_fence@nb-await.html">PASS</a> +110 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_flink_basic@bad-flink.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_flink_basic@bad-flink.html">PASS</a> +68 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@gem_huc_copy@huc-copy.html">PASS</a> +140 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">PASS</a> +114 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all-engines:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html">PASS</a> +117 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all-engines:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_wait@wait@all-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_wait@wait@all-engines.html">PASS</a> +122 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> +126 other tests pass</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-1024:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_addfb_basic@bad-pitch-1024.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_addfb_basic@bad-pitch-1024.html">PASS</a> +122 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> +126 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> +128 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-bsw-n3050/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-n3050/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">PASS</a> +140 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html">PASS</a> +126 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html">PASS</a> +143 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-elk-e7500/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-elk-e7500/igt@kms_addfb_basic@unused-offsets.html">PASS</a> +137 other tests pass</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_addfb_basic@unused-offsets.html">PASS</a> +126 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +144 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +143 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> +140 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html">PASS</a> +126 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +136 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +143 other tests pass</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +144 other tests pass</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +118 other tests pass</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +143 other tests pass</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +138 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-skl-6600u/igt@kms_prop_blob@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-skl-6600u/igt@kms_prop_blob@basic.html">PASS</a> +147 other tests pass</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-llseek-bad:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-ilk-650/igt@prime_self_import@basic-llseek-bad.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-ilk-650/igt@prime_self_import@basic-llseek-bad.html">PASS</a> +137 other tests pass</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@prime_self_import@basic-llseek-bad.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@prime_self_import@basic-llseek-bad.html">PASS</a> +143 other tests pass</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html">PASS</a> +144 other tests pass</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_two_bos:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@prime_self_import@basic-with_two_bos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@prime_self_import@basic-with_two_bos.html">PASS</a> +93 other tests pass</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-pnv-d510/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-pnv-d510/igt@prime_vgem@basic-fence-mmap.html">PASS</a> +130 other tests pass</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@dmabuf-mmap:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@vgem_basic@dmabuf-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@vgem_basic@dmabuf-mmap.html">PASS</a> +68 other tests pass</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@second-client:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-ivb-3770/igt@vgem_basic@second-client.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-ivb-3770/igt@vgem_basic@second-client.html">PASS</a> +138 other tests pass</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@setversion:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@vgem_basic@setversion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@vgem_basic@setversion.html">PASS</a> +125 other tests pass</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-bsw-nick/igt@vgem_basic@setversion.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-nick/igt@vgem_basic@setversion.html">PASS</a> +117 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345">i915#11345</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +3 other tests skip</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@fbdev@info.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-bsw-nick/igt@fbdev@info.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-nick/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-kbl-2/igt@fbdev@info.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@fbdev@info.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343">i915#11343</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343">i915#11343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725">i915#11725</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725">i915#11725</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +4 other tests skip</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>) +1 other test skip</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +8 other tests skip</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) +8 other tests skip</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +8 other tests skip</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) +8 other tests skip</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4303">i915#4303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030">i915#11030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) +1 other test skip</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) +1 other test skip</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030">i915#11030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) +1 other test skip</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) +1 other test skip</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4093">i915#4093</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093">i915#6093</a>) +4 other tests skip</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11032">i915#11032</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11032">i915#11032</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4093">i915#4093</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369">i915#4369</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369">i915#4369</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15205">i915#15205</a>)</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7357">i915#7357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) +3 other tests skip</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15855">i915#15855</a>) +9 other tests skip</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) +3 other tests skip</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-jsl-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-jsl-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6094">i915#6094</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +4 other tests skip</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-9/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-9/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>) +1 other test skip</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +3 other tests skip</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rpls-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rpls-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-rplp-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-rplp-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-11/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-11/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg1-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg1-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-adlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-adlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-14/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-14/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> +2 other tests skip</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-twl-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-twl-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arls-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16497">i915#16497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arls-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8985/bat-arlh-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15439/bat-arlh-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8985 -&gt; IGTPW_15439</li>
<li>Linux: CI_DRM_18715 -&gt; CI_DRM_18719</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18715: f597918e1cbc24ac9896e8082e1621c1af4d5a94 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18719: adbc617250e16fb2db4a4c777b89440927cb8973 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15439: 15439<br />
  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3461114721534443782==--
