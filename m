Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D09CCCD193
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 23:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207E710E8FF;
	Wed, 15 Oct 2025 23:30:41 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63610E90C;
 Wed, 15 Oct 2025 23:30:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5854651856304901583=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_extend_link_training_test?=
 =?utf-8?q?_cases_for_eDP_connector_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 Oct 2025 23:30:40 -0000
Message-ID: <176057104029.19094.14129002550054892206@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
In-Reply-To: <20251015101759.3982477-1-kunal1.joshi@intel.com>
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

--===============5854651856304901583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend link training test cases for eDP connector (rev3)
URL   : https://patchwork.freedesktop.org/series/150748/
State : success

== Summary ==

CI Bug Log - changes from IGT_8587 -> IGTPW_13907
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/index.html

Participating hosts (39 -> 40)
------------------------------

  Additional (2): fi-bsw-nick fi-kbl-guc 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13907:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_link_training@non-uhbr-mst} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-8/igt@kms_link_training@non-uhbr-mst.html
    - bat-dg2-8:          NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg2-8/igt@kms_link_training@non-uhbr-mst.html
    - bat-adls-6:         NOTRUN -> [SKIP][3] +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-adls-6/igt@kms_link_training@non-uhbr-mst.html
    - bat-jsl-1:          NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-jsl-1/igt@kms_link_training@non-uhbr-mst.html
    - bat-arlh-3:         NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-3/igt@kms_link_training@non-uhbr-mst.html

  * {igt@kms_link_training@non-uhbr-sst} (NEW):
    - bat-mtlp-9:         NOTRUN -> [FAIL][6] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-9/igt@kms_link_training@non-uhbr-sst.html
    - bat-arls-6:         NOTRUN -> [SKIP][7] +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arls-6/igt@kms_link_training@non-uhbr-sst.html
    - bat-arlh-3:         NOTRUN -> [FAIL][8] +2 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-3/igt@kms_link_training@non-uhbr-sst.html
    - bat-twl-1:          NOTRUN -> [FAIL][9] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-twl-1/igt@kms_link_training@non-uhbr-sst.html

  * {igt@kms_link_training@uhbr-mst} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][10] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-adlp-9/igt@kms_link_training@uhbr-mst.html
    - bat-rpls-4:         NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-rpls-4/igt@kms_link_training@uhbr-mst.html
    - bat-twl-1:          NOTRUN -> [SKIP][12] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-twl-1/igt@kms_link_training@uhbr-mst.html
    - bat-arls-5:         NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arls-5/igt@kms_link_training@uhbr-mst.html
    - bat-dg1-7:          NOTRUN -> [SKIP][14] +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg1-7/igt@kms_link_training@uhbr-mst.html

  * {igt@kms_link_training@uhbr-sst} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][15] +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-rkl-11600/igt@kms_link_training@uhbr-sst.html
    - bat-dg2-9:          NOTRUN -> [SKIP][16] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg2-9/igt@kms_link_training@uhbr-sst.html
    - bat-adlp-6:         NOTRUN -> [SKIP][17] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-adlp-6/igt@kms_link_training@uhbr-sst.html

  * {igt@kms_linktrain_fallback@dsc-fallback} (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][18] +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-twl-2/igt@kms_linktrain_fallback@dsc-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][19] +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg2-11/igt@kms_linktrain_fallback@dsc-fallback.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][20] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-9/igt@kms_linktrain_fallback@dsc-fallback.html

  * {igt@kms_linktrain_fallback@lt-fallback} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][21] +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-tgl-1115g4/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-adlp-6:         NOTRUN -> [FAIL][22] +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-adlp-6/igt@kms_linktrain_fallback@lt-fallback.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][23] +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-skl-6600u/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-twl-2:          NOTRUN -> [FAIL][24] +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-twl-2/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][25] +2 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-8/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-jsl-1:          NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-jsl-1/igt@kms_linktrain_fallback@lt-fallback.html

  
New tests
---------

  New tests have been introduced between IGT_8587 and IGTPW_13907:

### New IGT tests (6) ###

  * igt@kms_link_training@non-uhbr-mst:
    - Statuses : 1 pass(s) 39 skip(s)
    - Exec time: [0.0, 5.35] s

  * igt@kms_link_training@non-uhbr-sst:
    - Statuses : 1 dmesg-warn(s) 7 fail(s) 8 pass(s) 24 skip(s)
    - Exec time: [0.0, 20.36] s

  * igt@kms_link_training@uhbr-mst:
    - Statuses : 40 skip(s)
    - Exec time: [0.0, 3.18] s

  * igt@kms_link_training@uhbr-sst:
    - Statuses : 3 fail(s) 37 skip(s)
    - Exec time: [0.0, 20.36] s

  * igt@kms_linktrain_fallback@dsc-fallback:
    - Statuses : 3 pass(s) 37 skip(s)
    - Exec time: [0.0, 1.90] s

  * igt@kms_linktrain_fallback@lt-fallback:
    - Statuses : 1 dmesg-warn(s) 8 fail(s) 7 pass(s) 24 skip(s)
    - Exec time: [0.0, 20.37] s

  

Known issues
------------

  Here are the changes found in IGTPW_13907 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][27] -> [ABORT][28] ([i915#12904]) +1 other test abort
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-apl-1/igt@dmabuf@all-tests.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@fbdev@info:
    - fi-bsw-nick:        NOTRUN -> [SKIP][29] ([i915#1849])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-nick/igt@fbdev@info.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][30] ([i915#1849])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-guc/igt@fbdev@info.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-guc:         NOTRUN -> [SKIP][31] ([i915#4613]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-guc/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][32] +30 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][33] -> [DMESG-FAIL][34] ([i915#12061]) +1 other test dmesg-fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [PASS][35] -> [DMESG-FAIL][36] ([i915#12061]) +1 other test dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-dg2-9:          [PASS][37] -> [DMESG-FAIL][38] ([i915#12061]) +1 other test dmesg-fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-kbl-guc:         NOTRUN -> [SKIP][39] ([i915#11190]) +16 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * {igt@kms_link_training@non-uhbr-mst} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][40] +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-8700k/igt@kms_link_training@non-uhbr-mst.html
    - bat-kbl-2:          NOTRUN -> [SKIP][41] +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-kbl-2/igt@kms_link_training@non-uhbr-mst.html
    - bat-atsm-1:         NOTRUN -> [SKIP][42] ([i915#6078]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-atsm-1/igt@kms_link_training@non-uhbr-mst.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][43] +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-hsw-4770/igt@kms_link_training@non-uhbr-mst.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][44] +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-ivb-3770/igt@kms_link_training@non-uhbr-mst.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][45] +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-elk-e7500/igt@kms_link_training@non-uhbr-mst.html

  * {igt@kms_link_training@non-uhbr-sst} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][46] +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-n3050/igt@kms_link_training@non-uhbr-sst.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][47] +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-pnv-d510/igt@kms_link_training@non-uhbr-sst.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][48] +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-glk-j4005/igt@kms_link_training@non-uhbr-sst.html

  * {igt@kms_link_training@uhbr-mst} (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][49] +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-apl-1/igt@kms_link_training@uhbr-mst.html

  * {igt@kms_link_training@uhbr-sst} (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][50] ([i915#11346]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-2/igt@kms_link_training@uhbr-sst.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][51] +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-x1275/igt@kms_link_training@uhbr-sst.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][52] +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-8109u/igt@kms_link_training@uhbr-sst.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][53] +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-7567u/igt@kms_link_training@uhbr-sst.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][54] +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-guc/igt@kms_link_training@uhbr-sst.html

  * {igt@kms_linktrain_fallback@dsc-fallback} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][55] +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-skl-6600u/igt@kms_linktrain_fallback@dsc-fallback.html

  * {igt@kms_linktrain_fallback@lt-fallback} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [DMESG-WARN][56] ([i915#13735] / [i915#13890]) +1 other test dmesg-warn
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-8109u/igt@kms_linktrain_fallback@lt-fallback.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][57] +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-8809g/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-dg1-6:          NOTRUN -> [SKIP][58] ([i915#12311]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg1-6/igt@kms_linktrain_fallback@lt-fallback.html
    - fi-ilk-650:         NOTRUN -> [SKIP][59] +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-ilk-650/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][60] ([i915#9792]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-6/igt@kms_linktrain_fallback@lt-fallback.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        NOTRUN -> [SKIP][61] ([i915#11190]) +16 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-guc:         NOTRUN -> [SKIP][62] +24 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-rpls-4:         [DMESG-WARN][63] ([i915#13400]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [ABORT][65] ([i915#12904]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][67] ([i915#12061]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_busy@basic@flip:
    - fi-cfl-8109u:       [DMESG-WARN][69] ([i915#13735]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/fi-cfl-8109u/igt@kms_busy@basic@flip.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-8109u/igt@kms_busy@basic@flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8587 -> IGTPW_13907
  * Linux: CI_DRM_17368 -> CI_DRM_17369

  CI-20190529: 20190529
  CI_DRM_17368: 69ca30df000b382e7657f300148be505083377f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17369: f019aaad58112f89234f7b68557c831846437008 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13907: 56866f37be3a76fecfedcc5a5fb093597202cec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8587: 8587

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/index.html

--===============5854651856304901583==
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
<tr><td><b>Series:</b></td><td>extend link training test cases for eDP connector (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150748/">https://patchwork.freedesktop.org/series/150748/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8587 -&gt; IGTPW_13907</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/index.html</p>
<h2>Participating hosts (39 -&gt; 40)</h2>
<p>Additional (2): fi-bsw-nick fi-kbl-guc <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13907:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_link_training@non-uhbr-mst} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-8/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg2-8/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-adls-6/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-jsl-1/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-3/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@non-uhbr-sst} (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-9/igt@kms_link_training@non-uhbr-sst.html">FAIL</a> +2 other tests fail</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arls-6/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-3/igt@kms_link_training@non-uhbr-sst.html">FAIL</a> +2 other tests fail</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-twl-1/igt@kms_link_training@non-uhbr-sst.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-mst} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-adlp-9/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-rpls-4/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-twl-1/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arls-5/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg1-7/igt@kms_link_training@uhbr-mst.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-sst} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-rkl-11600/igt@kms_link_training@uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg2-9/igt@kms_link_training@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-adlp-6/igt@kms_link_training@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@dsc-fallback} (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-twl-2/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg2-11/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> +5 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-9/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@lt-fallback} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-tgl-1115g4/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> +5 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-adlp-6/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +1 other test fail</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-skl-6600u/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +1 other test fail</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-twl-2/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-8/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +2 other tests fail</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-jsl-1/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8587 and IGTPW_13907:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_link_training@non-uhbr-mst:</p>
<ul>
<li>Statuses : 1 pass(s) 39 skip(s)</li>
<li>Exec time: [0.0, 5.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@non-uhbr-sst:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 7 fail(s) 8 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 20.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@uhbr-mst:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0, 3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@uhbr-sst:</p>
<ul>
<li>Statuses : 3 fail(s) 37 skip(s)</li>
<li>Exec time: [0.0, 20.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>Statuses : 3 pass(s) 37 skip(s)</li>
<li>Exec time: [0.0, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_linktrain_fallback@lt-fallback:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 8 fail(s) 7 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 20.37] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13907 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-apl-1/igt@dmabuf@all-tests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-nick/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-guc/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@non-uhbr-mst} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-8700k/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-kbl-2/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-atsm-1/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +5 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-hsw-4770/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-ivb-3770/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-elk-e7500/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@non-uhbr-sst} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-n3050/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-pnv-d510/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-glk-j4005/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-mst} (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-apl-1/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-sst} (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-2/igt@kms_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +5 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-x1275/igt@kms_link_training@uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-8109u/igt@kms_link_training@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-7567u/igt@kms_link_training@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-guc/igt@kms_link_training@uhbr-sst.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@dsc-fallback} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-skl-6600u/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@lt-fallback} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-8109u/igt@kms_linktrain_fallback@lt-fallback.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) +1 other test dmesg-warn</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-8809g/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-dg1-6/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +5 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-ilk-650/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> +5 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-mtlp-6/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8587/fi-cfl-8109u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13907/fi-cfl-8109u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8587 -&gt; IGTPW_13907</li>
<li>Linux: CI_DRM_17368 -&gt; CI_DRM_17369</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17368: 69ca30df000b382e7657f300148be505083377f2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17369: f019aaad58112f89234f7b68557c831846437008 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13907: 56866f37be3a76fecfedcc5a5fb093597202cec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8587: 8587</p>

</body>
</html>

--===============5854651856304901583==--
