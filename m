Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C84C71135
	for <igt-dev@archiver.kernel.org>; Sat, 14 Jun 2025 02:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFA010E1EE;
	Sat, 14 Jun 2025 02:07:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F7610E1EE;
 Sat, 14 Jun 2025 02:07:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7127546180796454645=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Xe-perf_tools_update_for_?=
 =?utf-8?q?OAM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 14 Jun 2025 02:07:07 -0000
Message-ID: <174986682766.79414.13135965075677155140@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
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

--===============7127546180796454645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe-perf tools update for OAM
URL   : https://patchwork.freedesktop.org/series/150274/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8411 -> IGTPW_13296
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13296 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13296, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13296:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-jsl-1:          NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-jsl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_hang:
    - bat-twl-2:          NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@i915_selftest@live@guc_hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_13296 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][3] ([i915#12904]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-pnv-d510/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@basic:
    - bat-twl-2:          NOTRUN -> [SKIP][4] ([i915#10213] / [i915#11671]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@gem_lmem_swapping@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][6] +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-ivb-3770/igt@gem_lmem_swapping@basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][7] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-elk-e7500/igt@gem_lmem_swapping@basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][8] ([i915#4613]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-guc/igt@gem_lmem_swapping@basic.html
    - bat-arls-5:         NOTRUN -> [SKIP][9] ([i915#10213] / [i915#11671]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@gem_lmem_swapping@basic.html
    - bat-arlh-2:         NOTRUN -> [SKIP][10] ([i915#10213] / [i915#11346] / [i915#11671]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@gem_lmem_swapping@basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][11] ([i915#4613]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-rkl-11600/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][12] +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-kbl-2:          NOTRUN -> [SKIP][13] +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][14] ([i915#4613]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-arls-6:         NOTRUN -> [SKIP][15] ([i915#10213] / [i915#11671]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-hsw-4770/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][17] ([i915#4613]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-adls-6:         NOTRUN -> [SKIP][18] ([i915#4613]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-jsl-1:          NOTRUN -> [SKIP][19] ([i915#4613]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-arlh-3:         NOTRUN -> [SKIP][20] ([i915#11671]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][21] +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-pnv-d510/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-adlp-9:         NOTRUN -> [SKIP][22] ([i915#4613]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-rpls-4:         NOTRUN -> [SKIP][23] ([i915#4613]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][24] ([i915#4613]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-twl-1:          NOTRUN -> [SKIP][25] ([i915#10213] / [i915#11671]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][26] ([i915#4613]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-rplp-1:         NOTRUN -> [SKIP][27] ([i915#4613]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][28] ([i915#4613]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - bat-adlp-6:         NOTRUN -> [SKIP][29] ([i915#4613]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][30] ([i915#4613]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-guc:         NOTRUN -> [SKIP][31] ([i915#4613]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][32] ([i915#4613]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html
    - bat-adlp-11:        NOTRUN -> [SKIP][33] ([i915#4613]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][34] ([i915#4613]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html
    - fi-ilk-650:         NOTRUN -> [SKIP][35] +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-ilk-650/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][36] ([i915#4083])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][37] ([i915#4079]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][38] ([i915#4077]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       NOTRUN -> [SKIP][39] +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-9:         NOTRUN -> [SKIP][40] ([i915#11681] / [i915#6621])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live:
    - bat-arlh-3:         NOTRUN -> [DMESG-FAIL][41] ([i915#14243]) +1 other test dmesg-fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@i915_selftest@live.html
    - bat-twl-2:          NOTRUN -> [ABORT][42] ([i915#14357])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][43] ([i915#13929])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@reset:
    - bat-atsm-1:         NOTRUN -> [ABORT][44] ([i915#14201]) +1 other test abort
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          NOTRUN -> [DMESG-FAIL][45] ([i915#12061]) +1 other test dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@i915_selftest@live@workarounds.html
    - bat-dg2-11:         NOTRUN -> [DMESG-FAIL][46] ([i915#12061]) +1 other test dmesg-fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@i915_selftest@live@workarounds.html
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][47] ([i915#12061])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         NOTRUN -> [DMESG-FAIL][48] ([i915#12061]) +1 other test dmesg-fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@intel_hwmon@hwmon-read:
    - bat-mtlp-9:         NOTRUN -> [SKIP][49] ([i915#7707]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-9:         NOTRUN -> [SKIP][50] ([i915#5190])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-9:         NOTRUN -> [SKIP][51] ([i915#4212]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-mtlp-9:         NOTRUN -> [SKIP][52] ([i915#4213]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][53] ([i915#3555] / [i915#3840] / [i915#9159])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-mtlp-9:         NOTRUN -> [SKIP][54]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-mtlp-9:         NOTRUN -> [SKIP][55] ([i915#4077] / [i915#9688]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-mtlp-9:         NOTRUN -> [SKIP][56] ([i915#3555] / [i915#8809])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-atsm-1:         NOTRUN -> [SKIP][57] ([i915#6078])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-11:         NOTRUN -> [SKIP][58] ([i915#3708])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-14:         NOTRUN -> [SKIP][59] ([i915#3708])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-8:          NOTRUN -> [SKIP][60] ([i915#3708])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][61]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][62] +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-bsw-n3050/igt@prime_vgem@basic-fence-flip.html
    - bat-arlh-2:         NOTRUN -> [SKIP][63] ([i915#11346])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-9:          NOTRUN -> [SKIP][64] ([i915#3708])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][65]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][66]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html
    - bat-adlp-11:        NOTRUN -> [SKIP][67] ([i915#10470] / [i915#3708])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-arlh-3:         NOTRUN -> [SKIP][68] ([i915#12637]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg1-7:          NOTRUN -> [SKIP][69] ([i915#3708] / [i915#4077]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg2-9:          NOTRUN -> [SKIP][70] ([i915#3708] / [i915#4077]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg1-6:          NOTRUN -> [SKIP][71] ([i915#3708] / [i915#4077]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][72] ([i915#3708]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
    - bat-adlp-9:         NOTRUN -> [SKIP][73] ([i915#3291] / [i915#3708]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-9/igt@prime_vgem@basic-fence-read.html
    - bat-adls-6:         NOTRUN -> [SKIP][74] ([i915#3291]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adls-6/igt@prime_vgem@basic-fence-read.html
    - bat-arls-5:         NOTRUN -> [SKIP][75] ([i915#10212] / [i915#3708])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_vgem@basic-fence-read.html
    - bat-arlh-2:         NOTRUN -> [SKIP][76] ([i915#10212] / [i915#11346] / [i915#11726])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-fence-read.html
    - bat-arlh-3:         NOTRUN -> [SKIP][77] ([i915#11726]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@prime_vgem@basic-fence-read.html
    - bat-dg1-7:          NOTRUN -> [SKIP][78] ([i915#3708]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-7/igt@prime_vgem@basic-fence-read.html
    - bat-twl-1:          NOTRUN -> [SKIP][79] ([i915#10212] / [i915#3708])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@prime_vgem@basic-fence-read.html
    - bat-twl-2:          NOTRUN -> [SKIP][80] ([i915#10212] / [i915#3708])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@prime_vgem@basic-fence-read.html
    - bat-arls-6:         NOTRUN -> [SKIP][81] ([i915#10212] / [i915#3708])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg2-11:         NOTRUN -> [SKIP][82] ([i915#3708] / [i915#4077]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@prime_vgem@basic-gtt.html
    - bat-dg2-14:         NOTRUN -> [SKIP][83] ([i915#3708] / [i915#4077]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-14/igt@prime_vgem@basic-gtt.html
    - bat-atsm-1:         NOTRUN -> [SKIP][84] ([i915#4077]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@prime_vgem@basic-gtt.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][85] ([i915#3708] / [i915#4077]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@prime_vgem@basic-gtt.html
    - bat-arls-6:         NOTRUN -> [SKIP][86] ([i915#12637] / [i915#3708] / [i915#4077]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_vgem@basic-gtt.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][87] ([i915#3708] / [i915#4077]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@prime_vgem@basic-gtt.html
    - bat-dg2-8:          NOTRUN -> [SKIP][88] ([i915#3708] / [i915#4077]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-8/igt@prime_vgem@basic-gtt.html
    - bat-arls-5:         NOTRUN -> [SKIP][89] ([i915#12637] / [i915#3708] / [i915#4077]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_vgem@basic-gtt.html
    - bat-arlh-2:         NOTRUN -> [SKIP][90] ([i915#11346] / [i915#12637]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-rpls-4:         NOTRUN -> [SKIP][91] ([i915#3708]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rpls-4/igt@prime_vgem@basic-read.html
    - bat-twl-1:          NOTRUN -> [SKIP][92] ([i915#10214] / [i915#3708])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@prime_vgem@basic-read.html
    - bat-arls-5:         NOTRUN -> [SKIP][93] ([i915#10214] / [i915#3708])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_vgem@basic-read.html
    - bat-rplp-1:         NOTRUN -> [SKIP][94] ([i915#3708]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rplp-1/igt@prime_vgem@basic-read.html
    - bat-arlh-2:         NOTRUN -> [SKIP][95] ([i915#10214] / [i915#11346] / [i915#11726])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-read.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][96] ([i915#3291] / [i915#3708]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-rkl-11600/igt@prime_vgem@basic-read.html
    - bat-dg1-6:          NOTRUN -> [SKIP][97] ([i915#3708]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-6/igt@prime_vgem@basic-read.html
    - bat-twl-2:          NOTRUN -> [SKIP][98] ([i915#10214] / [i915#3708])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@prime_vgem@basic-read.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][99] ([i915#3708]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@prime_vgem@basic-read.html
    - bat-arls-6:         NOTRUN -> [SKIP][100] ([i915#10214] / [i915#3708])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-9:          NOTRUN -> [SKIP][101] ([i915#3291] / [i915#3708]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@prime_vgem@basic-write.html
    - bat-adlp-11:        NOTRUN -> [SKIP][102] ([i915#3291] / [i915#3708]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-11/igt@prime_vgem@basic-write.html
    - bat-dg1-6:          NOTRUN -> [SKIP][103] ([i915#11723] / [i915#3708])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-6/igt@prime_vgem@basic-write.html
    - bat-adlp-6:         NOTRUN -> [SKIP][104] ([i915#3291] / [i915#3708]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-6/igt@prime_vgem@basic-write.html
    - bat-twl-2:          NOTRUN -> [SKIP][105] ([i915#10216] / [i915#3708])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@prime_vgem@basic-write.html
    - bat-dg2-11:         NOTRUN -> [SKIP][106] ([i915#3291] / [i915#3708]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@prime_vgem@basic-write.html
    - bat-dg2-14:         NOTRUN -> [SKIP][107] ([i915#3291] / [i915#3708]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-14/igt@prime_vgem@basic-write.html
    - bat-atsm-1:         NOTRUN -> [SKIP][108] +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@prime_vgem@basic-write.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][109] ([i915#10216] / [i915#3708])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@prime_vgem@basic-write.html
    - bat-arls-6:         NOTRUN -> [SKIP][110] ([i915#10216] / [i915#3708])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_vgem@basic-write.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][111] ([i915#10216] / [i915#3708])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@prime_vgem@basic-write.html
    - bat-dg2-8:          NOTRUN -> [SKIP][112] ([i915#3291] / [i915#3708]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-8/igt@prime_vgem@basic-write.html
    - bat-arlh-3:         NOTRUN -> [SKIP][113] ([i915#11723])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@prime_vgem@basic-write.html
    - bat-twl-1:          NOTRUN -> [SKIP][114] ([i915#10216] / [i915#3708])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@prime_vgem@basic-write.html
    - bat-arls-5:         NOTRUN -> [SKIP][115] ([i915#10216] / [i915#3708])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_vgem@basic-write.html
    - bat-arlh-2:         NOTRUN -> [SKIP][116] ([i915#10216] / [i915#11346] / [i915#11723])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [ABORT][117] ([i915#13494]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-mtlp-9/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@prime_self_import@basic-with_one_bo:
    - bat-twl-2:          [ABORT][119] ([i915#14463]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg2-11:         [ABORT][121] ([i915#14463]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html
    - fi-cfl-8700k:       [ABORT][123] ([i915#14463]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-8700k/igt@prime_self_import@basic-with_one_bo.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-8700k/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg2-14:         [ABORT][125] ([i915#14463]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-14/igt@prime_self_import@basic-with_one_bo.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-14/igt@prime_self_import@basic-with_one_bo.html
    - fi-elk-e7500:       [ABORT][127] ([i915#14463]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-elk-e7500/igt@prime_self_import@basic-with_one_bo.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-elk-e7500/igt@prime_self_import@basic-with_one_bo.html
    - fi-bsw-nick:        [ABORT][129] ([i915#14463]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-bsw-nick/igt@prime_self_import@basic-with_one_bo.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-bsw-nick/igt@prime_self_import@basic-with_one_bo.html
    - bat-kbl-2:          [ABORT][131] ([i915#14463]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-kbl-2/igt@prime_self_import@basic-with_one_bo.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-kbl-2/igt@prime_self_import@basic-with_one_bo.html
    - bat-atsm-1:         [ABORT][133] ([i915#14463]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-atsm-1/igt@prime_self_import@basic-with_one_bo.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@prime_self_import@basic-with_one_bo.html
    - bat-arls-6:         [ABORT][135] ([i915#14463]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arls-6/igt@prime_self_import@basic-with_one_bo.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_self_import@basic-with_one_bo.html
    - fi-hsw-4770:        [ABORT][137] ([i915#14463]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-hsw-4770/igt@prime_self_import@basic-with_one_bo.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-hsw-4770/igt@prime_self_import@basic-with_one_bo.html
    - fi-ivb-3770:        [ABORT][139] ([i915#14463]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-ivb-3770/igt@prime_self_import@basic-with_one_bo.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-ivb-3770/igt@prime_self_import@basic-with_one_bo.html
    - bat-mtlp-8:         [ABORT][141] ([i915#14463]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-mtlp-8/igt@prime_self_import@basic-with_one_bo.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg2-8:          [ABORT][143] ([i915#14463]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-8/igt@prime_self_import@basic-with_one_bo.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-8/igt@prime_self_import@basic-with_one_bo.html
    - fi-kbl-guc:         [ABORT][145] ([i915#14463]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-guc/igt@prime_self_import@basic-with_one_bo.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-guc/igt@prime_self_import@basic-with_one_bo.html
    - bat-adls-6:         [ABORT][147] ([i915#14463]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adls-6/igt@prime_self_import@basic-with_one_bo.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adls-6/igt@prime_self_import@basic-with_one_bo.html
    - bat-jsl-1:          [ABORT][149] -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-jsl-1/igt@prime_self_import@basic-with_one_bo.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-jsl-1/igt@prime_self_import@basic-with_one_bo.html
    - fi-bsw-n3050:       [ABORT][151] ([i915#14463]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-bsw-n3050/igt@prime_self_import@basic-with_one_bo.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-bsw-n3050/igt@prime_self_import@basic-with_one_bo.html
    - bat-arlh-3:         [ABORT][153] ([i915#14463]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arlh-3/igt@prime_self_import@basic-with_one_bo.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@prime_self_import@basic-with_one_bo.html
    - fi-pnv-d510:        [ABORT][155] ([i915#14463]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-pnv-d510/igt@prime_self_import@basic-with_one_bo.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-pnv-d510/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg1-7:          [ABORT][157] ([i915#14463]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg1-7/igt@prime_self_import@basic-with_one_bo.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-7/igt@prime_self_import@basic-with_one_bo.html
    - bat-adlp-9:         [ABORT][159] ([i915#14463]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-9/igt@prime_self_import@basic-with_one_bo.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-9/igt@prime_self_import@basic-with_one_bo.html
    - bat-rpls-4:         [ABORT][161] ([i915#14463]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-rpls-4/igt@prime_self_import@basic-with_one_bo.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rpls-4/igt@prime_self_import@basic-with_one_bo.html
    - fi-kbl-7567u:       [ABORT][163] ([i915#14463]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-7567u/igt@prime_self_import@basic-with_one_bo.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-7567u/igt@prime_self_import@basic-with_one_bo.html
    - bat-twl-1:          [ABORT][165] ([i915#14463]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html
    - fi-kbl-8809g:       [ABORT][167] ([i915#14463]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-8809g/igt@prime_self_import@basic-with_one_bo.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-8809g/igt@prime_self_import@basic-with_one_bo.html
    - bat-arls-5:         [ABORT][169] ([i915#14463]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arls-5/igt@prime_self_import@basic-with_one_bo.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_self_import@basic-with_one_bo.html
    - bat-rplp-1:         [ABORT][171] ([i915#14463]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-rplp-1/igt@prime_self_import@basic-with_one_bo.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rplp-1/igt@prime_self_import@basic-with_one_bo.html
    - bat-arlh-2:         [ABORT][173] ([i915#14463]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arlh-2/igt@prime_self_import@basic-with_one_bo.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_self_import@basic-with_one_bo.html
    - fi-rkl-11600:       [ABORT][175] ([i915#14463]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-rkl-11600/igt@prime_self_import@basic-with_one_bo.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-rkl-11600/igt@prime_self_import@basic-with_one_bo.html
    - fi-tgl-1115g4:      [ABORT][177] ([i915#14463]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html
    - fi-cfl-guc:         [ABORT][179] ([i915#14463]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-guc/igt@prime_self_import@basic-with_one_bo.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-guc/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg2-9:          [ABORT][181] ([i915#14463]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-9/igt@prime_self_import@basic-with_one_bo.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@prime_self_import@basic-with_one_bo.html
    - fi-kbl-x1275:       [ABORT][183] ([i915#14463]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-x1275/igt@prime_self_import@basic-with_one_bo.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-x1275/igt@prime_self_import@basic-with_one_bo.html
    - bat-adlp-11:        [ABORT][185] ([i915#14463]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-11/igt@prime_self_import@basic-with_one_bo.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-11/igt@prime_self_import@basic-with_one_bo.html
    - fi-cfl-8109u:       [ABORT][187] ([i915#14463]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-8109u/igt@prime_self_import@basic-with_one_bo.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-8109u/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg1-6:          [ABORT][189] ([i915#14463]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg1-6/igt@prime_self_import@basic-with_one_bo.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-6/igt@prime_self_import@basic-with_one_bo.html
    - fi-ilk-650:         [ABORT][191] ([i915#14463]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-ilk-650/igt@prime_self_import@basic-with_one_bo.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-ilk-650/igt@prime_self_import@basic-with_one_bo.html
    - fi-blb-e6850:       [ABORT][193] ([i915#14463]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-blb-e6850/igt@prime_self_import@basic-with_one_bo.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-blb-e6850/igt@prime_self_import@basic-with_one_bo.html
    - bat-adlp-6:         [ABORT][195] ([i915#14463]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-6/igt@prime_self_import@basic-with_one_bo.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-6/igt@prime_self_import@basic-with_one_bo.html
    - fi-skl-6600u:       [ABORT][197] ([i915#14463]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-skl-6600u/igt@prime_self_import@basic-with_one_bo.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-skl-6600u/igt@prime_self_import@basic-with_one_bo.html

  
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243
  [i915#14357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14357
  [i915#14463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8411 -> IGTPW_13296
  * Linux: CI_DRM_16700 -> CI_DRM_16703

  CI-20190529: 20190529
  CI_DRM_16700: cce8a9af1c6cf1776511aa69e5f4b5bef7bf5938 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16703: 4d016d6e602638e0ebc3895331224e057508c07a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13296: 13296
  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/index.html

--===============7127546180796454645==
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
<tr><td><b>Series:</b></td><td>Xe-perf tools update for OAM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150274/">https://patchwork.freedesktop.org/series/150274/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8411 -&gt; IGTPW_13296</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13296 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13296, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13296:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-jsl-1/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_hang:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@i915_selftest@live@guc_hang.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13296 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-pnv-d510/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-ivb-3770/igt@gem_lmem_swapping@basic.html">SKIP</a> +4 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-elk-e7500/igt@gem_lmem_swapping@basic.html">SKIP</a> +4 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-rkl-11600/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-hsw-4770/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-pnv-d510/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-guc/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-ilk-650/igt@gem_lmem_swapping@verify-random.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) +1 other test dmesg-fail</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14357">i915#14357</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-bsw-n3050/igt@prime_vgem@basic-fence-flip.html">SKIP</a> +4 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-9/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +3 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-14/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rpls-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rplp-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-11/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-14/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> +2 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-mtlp-9/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-8700k/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-8700k/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-14/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-14/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-elk-e7500/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-elk-e7500/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-bsw-nick/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-bsw-nick/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-kbl-2/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-kbl-2/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-atsm-1/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-atsm-1/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arls-6/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-6/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-hsw-4770/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-hsw-4770/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-ivb-3770/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-ivb-3770/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-mtlp-8/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-mtlp-8/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-8/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-8/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-guc/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-guc/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adls-6/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adls-6/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-jsl-1/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-jsl-1/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-bsw-n3050/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-bsw-n3050/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arlh-3/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-3/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-pnv-d510/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-pnv-d510/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg1-7/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-7/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-9/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-9/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-rpls-4/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rpls-4/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-7567u/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-7567u/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-8809g/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-8809g/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arls-5/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arls-5/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-rplp-1/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-rplp-1/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arlh-2/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-arlh-2/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-rkl-11600/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-rkl-11600/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-guc/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-guc/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-9/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg2-9/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-x1275/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-kbl-x1275/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-11/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-11/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-8109u/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-cfl-8109u/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg1-6/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-dg1-6/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-ilk-650/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-ilk-650/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-blb-e6850/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-blb-e6850/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-6/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/bat-adlp-6/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-skl-6600u/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13296/fi-skl-6600u/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8411 -&gt; IGTPW_13296</li>
<li>Linux: CI_DRM_16700 -&gt; CI_DRM_16703</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16700: cce8a9af1c6cf1776511aa69e5f4b5bef7bf5938 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16703: 4d016d6e602638e0ebc3895331224e057508c07a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13296: 13296<br />
  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7127546180796454645==--
