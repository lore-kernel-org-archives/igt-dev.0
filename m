Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC170FCC9C4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 05:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F31010E651;
	Tue, 10 Mar 2026 05:51:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BC810E651;
 Tue, 10 Mar 2026 05:51:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0968668516238715911=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/intel=3A_switch_graph?=
 =?utf-8?q?ics/IP_version_queries_to_fd-based_APIs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Mar 2026 05:51:28 -0000
Message-ID: <177312188855.336878.1587062035637902765@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310044616.1466628-1-x.wang@intel.com>
In-Reply-To: <20260310044616.1466628-1-x.wang@intel.com>
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

--===============0968668516238715911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel: switch graphics/IP version queries to fd-based APIs (rev3)
URL   : https://patchwork.freedesktop.org/series/160271/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8787 -> IGTPW_14709
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14709 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14709, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/index.html

Participating hosts (40 -> 38)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14709:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@busy:
    - fi-elk-e7500:       [PASS][1] -> [FAIL][2] +40 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-elk-e7500/igt@gem_busy@busy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-elk-e7500/igt@gem_busy@busy.html
    - bat-dg2-8:          NOTRUN -> [FAIL][3] +42 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_busy@busy.html

  * igt@gem_busy@busy@all-engines:
    - fi-hsw-4770:        [PASS][4] -> [FAIL][5] +39 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-hsw-4770/igt@gem_busy@busy@all-engines.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-hsw-4770/igt@gem_busy@busy@all-engines.html
    - bat-dg1-6:          [PASS][6] -> [FAIL][7] +28 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@gem_busy@busy@all-engines.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@gem_busy@busy@all-engines.html

  * igt@gem_close_race@basic-process:
    - bat-apl-1:          [PASS][8] -> [FAIL][9] +39 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-apl-1/igt@gem_close_race@basic-process.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-apl-1/igt@gem_close_race@basic-process.html
    - bat-dg2-14:         [PASS][10] -> [FAIL][11] +36 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-14/igt@gem_close_race@basic-process.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-14/igt@gem_close_race@basic-process.html
    - fi-bsw-nick:        [PASS][12] -> [FAIL][13] +31 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-bsw-nick/igt@gem_close_race@basic-process.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-bsw-nick/igt@gem_close_race@basic-process.html

  * igt@gem_exec_fence@basic-busy:
    - bat-dg2-9:          [PASS][14] -> [FAIL][15] +36 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-9/igt@gem_exec_fence@basic-busy.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-9/igt@gem_exec_fence@basic-busy.html

  * igt@gem_exec_fence@nb-await:
    - bat-adlp-11:        [PASS][16] -> [FAIL][17] +31 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-11/igt@gem_exec_fence@nb-await.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-11/igt@gem_exec_fence@nb-await.html

  * igt@gem_exec_parallel@engines@basic:
    - fi-kbl-7567u:       [PASS][18] -> [FAIL][19] +39 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-7567u/igt@gem_exec_parallel@engines@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-7567u/igt@gem_exec_parallel@engines@basic.html
    - bat-twl-1:          [PASS][20] -> [FAIL][21] +43 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-twl-1/igt@gem_exec_parallel@engines@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-twl-1/igt@gem_exec_parallel@engines@basic.html
    - fi-kbl-8809g:       [PASS][22] -> [FAIL][23] +31 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-8809g/igt@gem_exec_parallel@engines@basic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-8809g/igt@gem_exec_parallel@engines@basic.html
    - bat-jsl-5:          [PASS][24] -> [FAIL][25] +39 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-jsl-5/igt@gem_exec_parallel@engines@basic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-jsl-5/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_parallel@engines@fds:
    - fi-bsw-n3050:       [PASS][26] -> [FAIL][27] +38 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-bsw-n3050/igt@gem_exec_parallel@engines@fds.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-bsw-n3050/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_exec_parallel@engines@userptr:
    - bat-arlh-3:         [PASS][28] -> [FAIL][29] +39 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-3/igt@gem_exec_parallel@engines@userptr.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-3/igt@gem_exec_parallel@engines@userptr.html
    - fi-pnv-d510:        [PASS][30] -> [FAIL][31] +36 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html

  * igt@gem_linear_blits@basic:
    - bat-rplp-1:         [PASS][32] -> [FAIL][33] +39 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-rplp-1/igt@gem_linear_blits@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-rplp-1/igt@gem_linear_blits@basic.html
    - bat-arlh-2:         [PASS][34] -> [FAIL][35] +28 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-2/igt@gem_linear_blits@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-2/igt@gem_linear_blits@basic.html

  * igt@gem_render_linear_blits@basic:
    - fi-skl-6600u:       [PASS][36] -> [FAIL][37] +43 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-skl-6600u/igt@gem_render_linear_blits@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-skl-6600u/igt@gem_render_linear_blits@basic.html

  * igt@gem_sync@basic-all:
    - bat-adlp-9:         [PASS][38] -> [FAIL][39] +39 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-9/igt@gem_sync@basic-all.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-9/igt@gem_sync@basic-all.html
    - bat-twl-2:          [PASS][40] -> [FAIL][41] +43 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-twl-2/igt@gem_sync@basic-all.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-twl-2/igt@gem_sync@basic-all.html

  * igt@gem_sync@basic-each:
    - bat-atsm-1:         [PASS][42] -> [FAIL][43] +28 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-atsm-1/igt@gem_sync@basic-each.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-atsm-1/igt@gem_sync@basic-each.html
    - bat-dg1-7:          [PASS][44] -> [FAIL][45] +36 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-7/igt@gem_sync@basic-each.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-7/igt@gem_sync@basic-each.html

  * igt@gem_tiled_blits@basic:
    - bat-adls-6:         [PASS][46] -> [FAIL][47] +39 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adls-6/igt@gem_tiled_blits@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adls-6/igt@gem_tiled_blits@basic.html
    - fi-tgl-1115g4:      [PASS][48] -> [FAIL][49] +39 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html

  * igt@gem_wait@busy@all-engines:
    - fi-kbl-x1275:       [PASS][50] -> [FAIL][51] +31 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html
    - bat-rpls-4:         [PASS][52] -> [FAIL][53] +39 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-rpls-4/igt@gem_wait@busy@all-engines.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-rpls-4/igt@gem_wait@busy@all-engines.html
    - fi-cfl-8109u:       [PASS][54] -> [FAIL][55] +33 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8109u/igt@gem_wait@busy@all-engines.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8109u/igt@gem_wait@busy@all-engines.html

  * igt@gem_wait@wait:
    - fi-rkl-11600:       [PASS][56] -> [FAIL][57] +31 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-rkl-11600/igt@gem_wait@wait.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-rkl-11600/igt@gem_wait@wait.html

  * igt@gem_wait@wait@all-engines:
    - bat-kbl-2:          [PASS][58] -> [FAIL][59] +31 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-kbl-2/igt@gem_wait@wait@all-engines.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-kbl-2/igt@gem_wait@wait@all-engines.html
    - bat-adlp-6:         [PASS][60] -> [FAIL][61] +42 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-6/igt@gem_wait@wait@all-engines.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-6/igt@gem_wait@wait@all-engines.html

  * igt@i915_module_load@load:
    - fi-ilk-650:         [PASS][62] -> [FAIL][63] +40 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-ilk-650/igt@i915_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-ilk-650/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - bat-arls-6:         [PASS][64] -> [FAIL][65] +36 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arls-6/igt@i915_module_load@reload.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arls-6/igt@i915_module_load@reload.html

  * igt@kms_busy@basic:
    - fi-ivb-3770:        [PASS][66] -> [FAIL][67] +41 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-ivb-3770/igt@kms_busy@basic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-ivb-3770/igt@kms_busy@basic.html
    - bat-mtlp-8:         [PASS][68] -> [FAIL][69] +39 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-8/igt@kms_busy@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-8/igt@kms_busy@basic.html

  * igt@kms_busy@basic@flip:
    - fi-cfl-8700k:       [PASS][70] -> [FAIL][71] +39 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8700k/igt@kms_busy@basic@flip.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8700k/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-cfl-guc:         [PASS][72] -> [FAIL][73] +39 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-mtlp-9:         [PASS][74] -> [FAIL][75] +39 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move.html

  
#### Warnings ####

  * igt@gem_exec_fence@basic-await:
    - bat-adlp-6:         [FAIL][76] ([i915#15263]) -> [FAIL][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-6/igt@gem_exec_fence@basic-await.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-6/igt@gem_exec_fence@basic-await.html

  * igt@gem_softpin@allocator-basic:
    - fi-elk-e7500:       [SKIP][78] -> [FAIL][79] +6 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-elk-e7500/igt@gem_softpin@allocator-basic.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-elk-e7500/igt@gem_softpin@allocator-basic.html

  * igt@gem_softpin@allocator-basic-reserve:
    - fi-hsw-4770:        [SKIP][80] -> [FAIL][81] +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html
    - fi-ivb-3770:        [SKIP][82] -> [FAIL][83] +5 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-ivb-3770/igt@gem_softpin@allocator-basic-reserve.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-ivb-3770/igt@gem_softpin@allocator-basic-reserve.html
    - fi-ilk-650:         [SKIP][84] -> [FAIL][85] +6 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html

  * igt@gem_tiled_blits@basic:
    - bat-arls-6:         [SKIP][86] ([i915#12637] / [i915#4077]) -> [FAIL][87] +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arls-6/igt@gem_tiled_blits@basic.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arls-6/igt@gem_tiled_blits@basic.html
    - bat-arlh-3:         [SKIP][88] ([i915#12637]) -> [FAIL][89] +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-3/igt@gem_tiled_blits@basic.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-3/igt@gem_tiled_blits@basic.html
    - bat-mtlp-9:         [SKIP][90] ([i915#4077]) -> [FAIL][91] +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-9/igt@gem_tiled_blits@basic.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-9/igt@gem_tiled_blits@basic.html
    - bat-dg1-6:          [SKIP][92] ([i915#4077]) -> [FAIL][93] +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@gem_tiled_blits@basic.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-14:         [SKIP][94] ([i915#4077]) -> [FAIL][95] +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html
    - bat-arlh-2:         [SKIP][96] ([i915#11346] / [i915#12637]) -> [FAIL][97] +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-2/igt@gem_tiled_fence_blits@basic.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-2/igt@gem_tiled_fence_blits@basic.html
    - bat-atsm-1:         [SKIP][98] ([i915#4077]) -> [FAIL][99] +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
    - bat-dg1-7:          [SKIP][100] ([i915#4077]) -> [FAIL][101] +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html
    - bat-dg2-9:          [SKIP][102] ([i915#4077]) -> [FAIL][103] +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-9/igt@gem_tiled_fence_blits@basic.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-9/igt@gem_tiled_fence_blits@basic.html
    - bat-mtlp-8:         [SKIP][104] ([i915#4077]) -> [FAIL][105] +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-11:        [SKIP][106] ([i915#3637]) -> [FAIL][107] +3 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-dg1-6:          [SKIP][108] ([i915#12311] / [i915#3637]) -> [FAIL][109] +2 other tests fail
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-nick:        [SKIP][110] -> [FAIL][111] +8 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-kbl-2:          [SKIP][112] -> [FAIL][113] +8 other tests fail
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-kbl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-kbl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-arlh-2:         [SKIP][114] ([i915#11346]) -> [FAIL][115] +8 other tests fail
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-rkl-11600:       [SKIP][116] ([i915#3637]) -> [FAIL][117] +3 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - fi-cfl-8109u:       [DMESG-WARN][118] ([i915#15673]) -> [FAIL][119] +5 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8109u/igt@kms_flip@basic-plain-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8109u/igt@kms_flip@basic-plain-flip.html
    - bat-dg1-6:          [SKIP][120] ([i915#12311]) -> [FAIL][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@kms_flip@basic-plain-flip.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@kms_flip@basic-plain-flip.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-x1275:       [SKIP][122] -> [FAIL][123] +8 other tests fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-11:        [SKIP][124] ([i915#4342] / [i915#5354]) -> [FAIL][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
    - fi-kbl-8809g:       [SKIP][126] -> [FAIL][127] +8 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg1-6:          [SKIP][128] ([i915#12311] / [i915#4342]) -> [FAIL][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html
    - fi-rkl-11600:       [SKIP][130] ([i915#1849] / [i915#5354]) -> [FAIL][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-cfl-guc:         [SKIP][132] -> [FAIL][133] +3 other tests fail
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
    - bat-arls-6:         [SKIP][134] ([i915#9732]) -> [FAIL][135] +3 other tests fail
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arls-6/igt@kms_psr@psr-cursor-plane-move.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arls-6/igt@kms_psr@psr-cursor-plane-move.html
    - fi-pnv-d510:        [SKIP][136] -> [FAIL][137] +8 other tests fail
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-bsw-n3050:       [SKIP][138] -> [FAIL][139] +6 other tests fail
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-mtlp-9:         [SKIP][140] ([i915#4077] / [i915#9688]) -> [FAIL][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-mtlp-8:         [SKIP][142] ([i915#4077] / [i915#9688]) -> [FAIL][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-dg1-6:          [SKIP][144] ([i915#1072] / [i915#12311] / [i915#9732]) -> [FAIL][145] +3 other tests fail
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-adls-6:         [SKIP][146] ([i915#1072] / [i915#9732]) -> [FAIL][147] +3 other tests fail
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-arlh-3:         [SKIP][148] ([i915#12637] / [i915#9688]) -> [FAIL][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-dg1-7:          [SKIP][150] ([i915#1072] / [i915#9732]) -> [FAIL][151] +3 other tests fail
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-9:         [SKIP][152] ([i915#1072] / [i915#9732]) -> [FAIL][153] +3 other tests fail
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-rpls-4:         [SKIP][154] ([i915#1072] / [i915#9732]) -> [FAIL][155] +3 other tests fail
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-rpls-4/igt@kms_psr@psr-sprite-plane-onoff.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-rpls-4/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-kbl-7567u:       [SKIP][156] -> [FAIL][157] +3 other tests fail
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-7567u/igt@kms_psr@psr-sprite-plane-onoff.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-7567u/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-cfl-8700k:       [SKIP][158] -> [FAIL][159] +3 other tests fail
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-jsl-5:          [SKIP][160] ([i915#1072]) -> [FAIL][161] +3 other tests fail
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-jsl-5/igt@kms_psr@psr-sprite-plane-onoff.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-jsl-5/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-apl-1:          [SKIP][162] -> [FAIL][163] +3 other tests fail
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-apl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-apl-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-14:         [SKIP][164] ([i915#1072] / [i915#9732]) -> [FAIL][165] +3 other tests fail
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-rplp-1:         [SKIP][166] ([i915#1072] / [i915#9732]) -> [FAIL][167] +3 other tests fail
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-rkl-11600:       [SKIP][168] ([i915#1072] / [i915#9732]) -> [FAIL][169] +3 other tests fail
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-atsm-1:         [SKIP][170] ([i915#6078]) -> [FAIL][171] +3 other tests fail
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-atsm-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-atsm-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-9:          [SKIP][172] ([i915#1072] / [i915#9732]) -> [FAIL][173] +3 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-adlp-11:        [SKIP][174] ([i915#1072] / [i915#9732]) -> [FAIL][175] +3 other tests fail
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-11/igt@kms_psr@psr-sprite-plane-onoff.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-11/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-hsw-4770:        [SKIP][176] ([i915#1072]) -> [FAIL][177] +3 other tests fail
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-cfl-8109u:       [SKIP][178] -> [FAIL][179] +3 other tests fail
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8109u/igt@kms_psr@psr-sprite-plane-onoff.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8109u/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-tgl-1115g4:      [SKIP][180] ([i915#9732]) -> [FAIL][181] +3 other tests fail
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html

  
Known issues
------------

  Here are the changes found in IGTPW_14709 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][182] ([i915#4083])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][183] ([i915#4077])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][184] ([i915#4079])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][185] ([i915#15657])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-8:          NOTRUN -> [SKIP][186] ([i915#11681] / [i915#6621])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][187] -> [DMESG-FAIL][188] ([i915#12061]) +1 other test dmesg-fail
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-dg2-9:          [PASS][189] -> [DMESG-FAIL][190] ([i915#12061]) +1 other test dmesg-fail
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][191] ([i915#5190])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][192] ([i915#4215] / [i915#5190])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-8:          NOTRUN -> [SKIP][193] ([i915#4212]) +7 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][194] ([i915#4103] / [i915#4213]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-8:          NOTRUN -> [SKIP][195]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-8:          NOTRUN -> [SKIP][196] ([i915#5354])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-8:          NOTRUN -> [SKIP][197] ([i915#3555])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-8:          NOTRUN -> [SKIP][198] ([i915#3708])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-8:          NOTRUN -> [SKIP][199] ([i915#3708] / [i915#4077]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-8:          NOTRUN -> [SKIP][200] ([i915#3291] / [i915#3708]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [DMESG-FAIL][201] ([i915#12061]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [DMESG-WARN][203] ([i915#15673]) -> [PASS][204] +26 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#15263]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15263
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8787 -> IGTPW_14709
  * Linux: CI_DRM_18111 -> CI_DRM_18115

  CI-20190529: 20190529
  CI_DRM_18111: 5bb4c677496179faf77e5c4f6fa0c2a44c4ee75d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18115: 71b3cc58bba99c872dec0669999a487f66873f5c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14709: f9ac8693097fdc79e70a3b66e9da177ae540b904 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8787: 8787

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/index.html

--===============0968668516238715911==
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
<tr><td><b>Series:</b></td><td>lib/intel: switch graphics/IP version queries to fd-based APIs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160271/">https://patchwork.freedesktop.org/series/160271/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8787 -&gt; IGTPW_14709</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14709 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14709, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14709:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_busy@busy:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-elk-e7500/igt@gem_busy@busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-elk-e7500/igt@gem_busy@busy.html">FAIL</a> +40 other tests fail</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_busy@busy.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy@all-engines:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-hsw-4770/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-hsw-4770/igt@gem_busy@busy@all-engines.html">FAIL</a> +39 other tests fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@gem_busy@busy@all-engines.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-apl-1/igt@gem_close_race@basic-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-apl-1/igt@gem_close_race@basic-process.html">FAIL</a> +39 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-14/igt@gem_close_race@basic-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-14/igt@gem_close_race@basic-process.html">FAIL</a> +36 other tests fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-bsw-nick/igt@gem_close_race@basic-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-bsw-nick/igt@gem_close_race@basic-process.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-9/igt@gem_exec_fence@basic-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-9/igt@gem_exec_fence@basic-busy.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-11/igt@gem_exec_fence@nb-await.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-11/igt@gem_exec_fence@nb-await.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-7567u/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-7567u/igt@gem_exec_parallel@engines@basic.html">FAIL</a> +39 other tests fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-twl-1/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-twl-1/igt@gem_exec_parallel@engines@basic.html">FAIL</a> +43 other tests fail</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-8809g/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-8809g/igt@gem_exec_parallel@engines@basic.html">FAIL</a> +31 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-jsl-5/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-jsl-5/igt@gem_exec_parallel@engines@basic.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-bsw-n3050/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-bsw-n3050/igt@gem_exec_parallel@engines@fds.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-3/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-3/igt@gem_exec_parallel@engines@userptr.html">FAIL</a> +39 other tests fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-rplp-1/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-rplp-1/igt@gem_linear_blits@basic.html">FAIL</a> +39 other tests fail</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-2/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-2/igt@gem_linear_blits@basic.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-skl-6600u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-skl-6600u/igt@gem_render_linear_blits@basic.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-all:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-9/igt@gem_sync@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-9/igt@gem_sync@basic-all.html">FAIL</a> +39 other tests fail</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-twl-2/igt@gem_sync@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-twl-2/igt@gem_sync@basic-all.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-atsm-1/igt@gem_sync@basic-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-atsm-1/igt@gem_sync@basic-each.html">FAIL</a> +28 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-7/igt@gem_sync@basic-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-7/igt@gem_sync@basic-each.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adls-6/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adls-6/igt@gem_tiled_blits@basic.html">FAIL</a> +39 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all-engines:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html">FAIL</a> +31 other tests fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-rpls-4/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-rpls-4/igt@gem_wait@busy@all-engines.html">FAIL</a> +39 other tests fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8109u/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8109u/igt@gem_wait@busy@all-engines.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-rkl-11600/igt@gem_wait@wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-rkl-11600/igt@gem_wait@wait.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all-engines:</p>
<ul>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-kbl-2/igt@gem_wait@wait@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-kbl-2/igt@gem_wait@wait@all-engines.html">FAIL</a> +31 other tests fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-6/igt@gem_wait@wait@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-6/igt@gem_wait@wait@all-engines.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-ilk-650/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-ilk-650/igt@i915_module_load@load.html">FAIL</a> +40 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arls-6/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arls-6/igt@i915_module_load@reload.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-ivb-3770/igt@kms_busy@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-ivb-3770/igt@kms_busy@basic.html">FAIL</a> +41 other tests fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-8/igt@kms_busy@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-8/igt@kms_busy@basic.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8700k/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8700k/igt@kms_busy@basic@flip.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-9/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-6/igt@gem_exec_fence@basic-await.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15263">i915#15263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-6/igt@gem_exec_fence@basic-await.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-elk-e7500/igt@gem_softpin@allocator-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-elk-e7500/igt@gem_softpin@allocator-basic.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">FAIL</a> +1 other test fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-ivb-3770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-ivb-3770/igt@gem_softpin@allocator-basic-reserve.html">FAIL</a> +5 other tests fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-ilk-650/igt@gem_softpin@allocator-basic-reserve.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arls-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arls-6/igt@gem_tiled_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-3/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-3/igt@gem_tiled_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-9/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-9/igt@gem_tiled_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@gem_tiled_blits@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-2/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-2/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-9/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-9/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-8/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +8 other tests fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-kbl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-kbl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +8 other tests fail</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +8 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8109u/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8109u/igt@kms_flip@basic-plain-flip.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@kms_flip@basic-plain-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +8 other tests fail</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-8809g/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +8 other tests fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arls-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arls-6/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +6 other tests fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-6/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +3 other tests fail</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a> +3 other tests fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-rpls-4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-rpls-4/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-kbl-7567u/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-kbl-7567u/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-jsl-5/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-jsl-5/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-apl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-apl-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-atsm-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-atsm-1/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-adlp-11/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-adlp-11/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8109u/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8109u/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14709 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8787/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14709/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8787 -&gt; IGTPW_14709</li>
<li>Linux: CI_DRM_18111 -&gt; CI_DRM_18115</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18111: 5bb4c677496179faf77e5c4f6fa0c2a44c4ee75d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18115: 71b3cc58bba99c872dec0669999a487f66873f5c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14709: f9ac8693097fdc79e70a3b66e9da177ae540b904 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8787: 8787</p>

</body>
</html>

--===============0968668516238715911==--
