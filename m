Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21BEC71148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 18:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25A10E43D;
	Fri, 13 Jun 2025 18:22:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D727010E43D;
 Fri, 13 Jun 2025 18:22:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8258112491230002857=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_runner/executor=3A_Abort_?=
 =?utf-8?q?if_dmesg_is_flooded?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jun 2025 18:22:41 -0000
Message-ID: <174983896187.78228.10176676452917222262@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613162013.103165-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250613162013.103165-1-kamil.konieczny@linux.intel.com>
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

--===============8258112491230002857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner/executor: Abort if dmesg is flooded
URL   : https://patchwork.freedesktop.org/series/150246/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8411 -> IGTPW_13295
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13295 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13295, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13295:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-blb-e6850:       NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-blb-e6850/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_module_load@reload:
    - fi-cfl-guc:         NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-guc/igt@i915_module_load@reload.html

  * igt@i915_selftest@live:
    - bat-jsl-1:          NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-jsl-1/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-kbl-7567u:       [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-kbl-2:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@vgem_basic@dmabuf-fence:
    - fi-skl-6600u:       NOTRUN -> [ABORT][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-skl-6600u/igt@vgem_basic@dmabuf-fence.html

  
#### Warnings ####

  * igt@prime_self_import@basic-with_one_bo:
    - bat-twl-2:          [ABORT][9] ([i915#14463]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html

  
Known issues
------------

  Here are the changes found in IGTPW_13295 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][11] ([i915#12904]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-pnv-d510/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@basic:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][12] ([i915#4613]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][13] +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-ivb-3770/igt@gem_lmem_swapping@basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][14] +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-elk-e7500/igt@gem_lmem_swapping@basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][15] ([i915#4613]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-guc/igt@gem_lmem_swapping@basic.html
    - bat-arlh-2:         NOTRUN -> [SKIP][16] ([i915#10213] / [i915#11346] / [i915#11671]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@gem_lmem_swapping@basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] ([i915#4613]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-rkl-11600/igt@gem_lmem_swapping@basic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-blb-e6850/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][19] +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-arls-6:         NOTRUN -> [SKIP][20] ([i915#10213] / [i915#11671]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][21] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-hsw-4770/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][22] ([i915#4613]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-adls-6:         NOTRUN -> [SKIP][23] ([i915#4613]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-jsl-1:          NOTRUN -> [SKIP][24] ([i915#4613]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-arlh-3:         NOTRUN -> [SKIP][25] ([i915#11671]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][26] +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-pnv-d510/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-adlp-9:         NOTRUN -> [SKIP][27] ([i915#4613]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-rpls-4:         NOTRUN -> [SKIP][28] ([i915#4613]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][29] ([i915#4613]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-twl-1:          NOTRUN -> [SKIP][30] ([i915#10213] / [i915#11671]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html
    - bat-rplp-1:         NOTRUN -> [SKIP][31] ([i915#4613]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - bat-adlp-6:         NOTRUN -> [SKIP][32] ([i915#4613]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][33] ([i915#4613]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html
    - bat-adlp-11:        NOTRUN -> [SKIP][34] ([i915#4613]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html
    - fi-ilk-650:         NOTRUN -> [SKIP][35] +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-ilk-650/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][36] ([i915#4083])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][37] ([i915#4079]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][38] ([i915#4077]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][39] ([i915#12061] / [i915#13929])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][40] ([i915#13929])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         NOTRUN -> [DMESG-FAIL][41] ([i915#12061]) +1 other test dmesg-fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@i915_selftest@live@workarounds.html
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][42] ([i915#12061])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@i915_selftest@live@workarounds.html

  * igt@intel_hwmon@hwmon-read:
    - bat-mtlp-9:         NOTRUN -> [SKIP][43] ([i915#7707]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-9:         NOTRUN -> [SKIP][44] ([i915#5190])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-9:         NOTRUN -> [SKIP][45] ([i915#4212]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-mtlp-9:         NOTRUN -> [SKIP][46] ([i915#4213]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-mtlp-9:         NOTRUN -> [SKIP][47] ([i915#3555] / [i915#3840] / [i915#9159])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@kms_dsc@dsc-basic.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-atsm-1:         NOTRUN -> [SKIP][48] ([i915#6078])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-11:         NOTRUN -> [SKIP][49] ([i915#3708])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-14:         NOTRUN -> [SKIP][50] ([i915#3708])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-8:          NOTRUN -> [SKIP][51] ([i915#3708])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][53] +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-bsw-n3050/igt@prime_vgem@basic-fence-flip.html
    - bat-arlh-2:         NOTRUN -> [SKIP][54] ([i915#11346])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-fence-flip.html
    - bat-dg2-9:          NOTRUN -> [SKIP][55] ([i915#3708])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html
    - bat-adlp-11:        NOTRUN -> [SKIP][57] ([i915#10470] / [i915#3708])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-arlh-3:         NOTRUN -> [SKIP][58] ([i915#12637]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg1-7:          NOTRUN -> [SKIP][59] ([i915#3708] / [i915#4077]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
    - bat-dg2-9:          NOTRUN -> [SKIP][60] ([i915#3708] / [i915#4077]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][61] ([i915#3708]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
    - bat-adlp-9:         NOTRUN -> [SKIP][62] ([i915#3291] / [i915#3708]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-9/igt@prime_vgem@basic-fence-read.html
    - bat-adls-6:         NOTRUN -> [SKIP][63] ([i915#3291]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adls-6/igt@prime_vgem@basic-fence-read.html
    - bat-arlh-2:         NOTRUN -> [SKIP][64] ([i915#10212] / [i915#11346] / [i915#11726])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-fence-read.html
    - bat-arlh-3:         NOTRUN -> [SKIP][65] ([i915#11726]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@prime_vgem@basic-fence-read.html
    - bat-dg1-7:          NOTRUN -> [SKIP][66] ([i915#3708]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg1-7/igt@prime_vgem@basic-fence-read.html
    - bat-twl-1:          NOTRUN -> [SKIP][67] ([i915#10212] / [i915#3708])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@prime_vgem@basic-fence-read.html
    - bat-arls-6:         NOTRUN -> [SKIP][68] ([i915#10212] / [i915#3708])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg2-11:         NOTRUN -> [SKIP][69] ([i915#3708] / [i915#4077]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@prime_vgem@basic-gtt.html
    - bat-dg2-14:         NOTRUN -> [SKIP][70] ([i915#3708] / [i915#4077]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-14/igt@prime_vgem@basic-gtt.html
    - bat-atsm-1:         NOTRUN -> [SKIP][71] ([i915#4077]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@prime_vgem@basic-gtt.html
    - bat-arls-6:         NOTRUN -> [SKIP][72] ([i915#12637] / [i915#3708] / [i915#4077]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_vgem@basic-gtt.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][73] ([i915#3708] / [i915#4077]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@prime_vgem@basic-gtt.html
    - bat-dg2-8:          NOTRUN -> [SKIP][74] ([i915#3708] / [i915#4077]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-8/igt@prime_vgem@basic-gtt.html
    - bat-arlh-2:         NOTRUN -> [SKIP][75] ([i915#11346] / [i915#12637]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-rpls-4:         NOTRUN -> [SKIP][76] ([i915#3708]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rpls-4/igt@prime_vgem@basic-read.html
    - bat-twl-1:          NOTRUN -> [SKIP][77] ([i915#10214] / [i915#3708])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@prime_vgem@basic-read.html
    - bat-rplp-1:         NOTRUN -> [SKIP][78] ([i915#3708]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rplp-1/igt@prime_vgem@basic-read.html
    - bat-arlh-2:         NOTRUN -> [SKIP][79] ([i915#10214] / [i915#11346] / [i915#11726])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-read.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][80] ([i915#3291] / [i915#3708]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-rkl-11600/igt@prime_vgem@basic-read.html
    - bat-arls-6:         NOTRUN -> [SKIP][81] ([i915#10214] / [i915#3708])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-9:          NOTRUN -> [SKIP][82] ([i915#3291] / [i915#3708]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-9/igt@prime_vgem@basic-write.html
    - bat-adlp-11:        NOTRUN -> [SKIP][83] ([i915#3291] / [i915#3708]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-11/igt@prime_vgem@basic-write.html
    - bat-adlp-6:         NOTRUN -> [SKIP][84] ([i915#3291] / [i915#3708]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-6/igt@prime_vgem@basic-write.html
    - bat-dg2-11:         NOTRUN -> [SKIP][85] ([i915#3291] / [i915#3708]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@prime_vgem@basic-write.html
    - bat-dg2-14:         NOTRUN -> [SKIP][86] ([i915#3291] / [i915#3708]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-14/igt@prime_vgem@basic-write.html
    - bat-atsm-1:         NOTRUN -> [SKIP][87] +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@prime_vgem@basic-write.html
    - bat-arls-6:         NOTRUN -> [SKIP][88] ([i915#10216] / [i915#3708])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_vgem@basic-write.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][89] ([i915#10216] / [i915#3708])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@prime_vgem@basic-write.html
    - bat-dg2-8:          NOTRUN -> [SKIP][90] ([i915#3291] / [i915#3708]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-8/igt@prime_vgem@basic-write.html
    - bat-arlh-3:         NOTRUN -> [SKIP][91] ([i915#11723])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@prime_vgem@basic-write.html
    - bat-twl-1:          NOTRUN -> [SKIP][92] ([i915#10216] / [i915#3708])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@prime_vgem@basic-write.html
    - bat-arlh-2:         NOTRUN -> [SKIP][93] ([i915#10216] / [i915#11346] / [i915#11723])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [ABORT][94] ([i915#13494]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-mtlp-9/igt@i915_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@prime_self_import@basic-with_one_bo:
    - bat-dg2-11:         [ABORT][96] ([i915#14463]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html
    - fi-cfl-8700k:       [ABORT][98] ([i915#14463]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-8700k/igt@prime_self_import@basic-with_one_bo.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-8700k/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg2-14:         [ABORT][100] ([i915#14463]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-14/igt@prime_self_import@basic-with_one_bo.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-14/igt@prime_self_import@basic-with_one_bo.html
    - fi-elk-e7500:       [ABORT][102] ([i915#14463]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-elk-e7500/igt@prime_self_import@basic-with_one_bo.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-elk-e7500/igt@prime_self_import@basic-with_one_bo.html
    - fi-bsw-nick:        [ABORT][104] ([i915#14463]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-bsw-nick/igt@prime_self_import@basic-with_one_bo.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-bsw-nick/igt@prime_self_import@basic-with_one_bo.html
    - bat-atsm-1:         [ABORT][106] ([i915#14463]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-atsm-1/igt@prime_self_import@basic-with_one_bo.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@prime_self_import@basic-with_one_bo.html
    - bat-arls-6:         [ABORT][108] ([i915#14463]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arls-6/igt@prime_self_import@basic-with_one_bo.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_self_import@basic-with_one_bo.html
    - fi-hsw-4770:        [ABORT][110] ([i915#14463]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-hsw-4770/igt@prime_self_import@basic-with_one_bo.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-hsw-4770/igt@prime_self_import@basic-with_one_bo.html
    - fi-ivb-3770:        [ABORT][112] ([i915#14463]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-ivb-3770/igt@prime_self_import@basic-with_one_bo.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-ivb-3770/igt@prime_self_import@basic-with_one_bo.html
    - bat-mtlp-8:         [ABORT][114] ([i915#14463]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-mtlp-8/igt@prime_self_import@basic-with_one_bo.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg2-8:          [ABORT][116] ([i915#14463]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-8/igt@prime_self_import@basic-with_one_bo.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-8/igt@prime_self_import@basic-with_one_bo.html
    - fi-kbl-guc:         [ABORT][118] ([i915#14463]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-guc/igt@prime_self_import@basic-with_one_bo.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-guc/igt@prime_self_import@basic-with_one_bo.html
    - bat-adls-6:         [ABORT][120] ([i915#14463]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adls-6/igt@prime_self_import@basic-with_one_bo.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adls-6/igt@prime_self_import@basic-with_one_bo.html
    - bat-jsl-1:          [ABORT][122] -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-jsl-1/igt@prime_self_import@basic-with_one_bo.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-jsl-1/igt@prime_self_import@basic-with_one_bo.html
    - fi-bsw-n3050:       [ABORT][124] ([i915#14463]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-bsw-n3050/igt@prime_self_import@basic-with_one_bo.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-bsw-n3050/igt@prime_self_import@basic-with_one_bo.html
    - bat-arlh-3:         [ABORT][126] ([i915#14463]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arlh-3/igt@prime_self_import@basic-with_one_bo.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@prime_self_import@basic-with_one_bo.html
    - fi-pnv-d510:        [ABORT][128] ([i915#14463]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-pnv-d510/igt@prime_self_import@basic-with_one_bo.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-pnv-d510/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg1-7:          [ABORT][130] ([i915#14463]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg1-7/igt@prime_self_import@basic-with_one_bo.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg1-7/igt@prime_self_import@basic-with_one_bo.html
    - bat-adlp-9:         [ABORT][132] ([i915#14463]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-9/igt@prime_self_import@basic-with_one_bo.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-9/igt@prime_self_import@basic-with_one_bo.html
    - bat-rpls-4:         [ABORT][134] ([i915#14463]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-rpls-4/igt@prime_self_import@basic-with_one_bo.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rpls-4/igt@prime_self_import@basic-with_one_bo.html
    - fi-kbl-7567u:       [ABORT][136] ([i915#14463]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-7567u/igt@prime_self_import@basic-with_one_bo.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-7567u/igt@prime_self_import@basic-with_one_bo.html
    - bat-twl-1:          [ABORT][138] ([i915#14463]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html
    - bat-rplp-1:         [ABORT][140] ([i915#14463]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-rplp-1/igt@prime_self_import@basic-with_one_bo.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rplp-1/igt@prime_self_import@basic-with_one_bo.html
    - bat-arlh-2:         [ABORT][142] ([i915#14463]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arlh-2/igt@prime_self_import@basic-with_one_bo.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_self_import@basic-with_one_bo.html
    - fi-rkl-11600:       [ABORT][144] ([i915#14463]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-rkl-11600/igt@prime_self_import@basic-with_one_bo.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-rkl-11600/igt@prime_self_import@basic-with_one_bo.html
    - fi-tgl-1115g4:      [ABORT][146] ([i915#14463]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html
    - fi-cfl-guc:         [ABORT][148] ([i915#14463]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-guc/igt@prime_self_import@basic-with_one_bo.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-guc/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg2-9:          [ABORT][150] ([i915#14463]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-9/igt@prime_self_import@basic-with_one_bo.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-9/igt@prime_self_import@basic-with_one_bo.html
    - fi-kbl-x1275:       [ABORT][152] ([i915#14463]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-x1275/igt@prime_self_import@basic-with_one_bo.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-x1275/igt@prime_self_import@basic-with_one_bo.html
    - bat-adlp-11:        [ABORT][154] ([i915#14463]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-11/igt@prime_self_import@basic-with_one_bo.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-11/igt@prime_self_import@basic-with_one_bo.html
    - fi-cfl-8109u:       [ABORT][156] ([i915#14463]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-8109u/igt@prime_self_import@basic-with_one_bo.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-8109u/igt@prime_self_import@basic-with_one_bo.html
    - fi-ilk-650:         [ABORT][158] ([i915#14463]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-ilk-650/igt@prime_self_import@basic-with_one_bo.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-ilk-650/igt@prime_self_import@basic-with_one_bo.html
    - fi-blb-e6850:       [ABORT][160] ([i915#14463]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-blb-e6850/igt@prime_self_import@basic-with_one_bo.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-blb-e6850/igt@prime_self_import@basic-with_one_bo.html
    - bat-adlp-6:         [ABORT][162] ([i915#14463]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-6/igt@prime_self_import@basic-with_one_bo.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-6/igt@prime_self_import@basic-with_one_bo.html
    - fi-skl-6600u:       [ABORT][164] ([i915#14463]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-skl-6600u/igt@prime_self_import@basic-with_one_bo.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-skl-6600u/igt@prime_self_import@basic-with_one_bo.html

  
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
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
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8411 -> IGTPW_13295
  * Linux: CI_DRM_16700 -> CI_DRM_16703

  CI-20190529: 20190529
  CI_DRM_16700: cce8a9af1c6cf1776511aa69e5f4b5bef7bf5938 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16703: 4d016d6e602638e0ebc3895331224e057508c07a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13295: bdc2a2150836a4f130aa2265577e8544f7b10f2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/index.html

--===============8258112491230002857==
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
<tr><td><b>Series:</b></td><td>runner/executor: Abort if dmesg is flooded</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150246/">https://patchwork.freedesktop.org/series/150246/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8411 -&gt; IGTPW_13295</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13295 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13295, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13295:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-blb-e6850/igt@gem_lmem_swapping@parallel-random-engines.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-guc/igt@i915_module_load@reload.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-jsl-1/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@dmabuf-fence:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-skl-6600u/igt@vgem_basic@dmabuf-fence.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@prime_self_import@basic-with_one_bo:<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13295 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-pnv-d510/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-ivb-3770/igt@gem_lmem_swapping@basic.html">SKIP</a> +4 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-elk-e7500/igt@gem_lmem_swapping@basic.html">SKIP</a> +4 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-rkl-11600/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-blb-e6850/igt@gem_lmem_swapping@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-hsw-4770/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-pnv-d510/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rpls-4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-ilk-650/igt@gem_lmem_swapping@verify-random.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-bsw-n3050/igt@prime_vgem@basic-fence-flip.html">SKIP</a> +4 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-9/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg1-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +3 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-14/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rpls-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rplp-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-11/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-14/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> +2 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-mtlp-9/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-8700k/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-8700k/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-14/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-14/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-elk-e7500/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-elk-e7500/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-bsw-nick/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-bsw-nick/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-atsm-1/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-atsm-1/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arls-6/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arls-6/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-hsw-4770/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-hsw-4770/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-ivb-3770/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-ivb-3770/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-mtlp-8/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-mtlp-8/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-8/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-8/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-guc/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-guc/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adls-6/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adls-6/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-jsl-1/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-jsl-1/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-bsw-n3050/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-bsw-n3050/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arlh-3/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-3/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-pnv-d510/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-pnv-d510/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg1-7/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg1-7/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-9/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-9/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-rpls-4/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rpls-4/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-7567u/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-7567u/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-rplp-1/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-rplp-1/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-arlh-2/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-arlh-2/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-rkl-11600/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-rkl-11600/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-guc/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-guc/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-dg2-9/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-dg2-9/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-x1275/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-x1275/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-11/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-11/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-cfl-8109u/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-8109u/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-ilk-650/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-ilk-650/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-blb-e6850/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-blb-e6850/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-adlp-6/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-adlp-6/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-skl-6600u/igt@prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463">i915#14463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-skl-6600u/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8411 -&gt; IGTPW_13295</li>
<li>Linux: CI_DRM_16700 -&gt; CI_DRM_16703</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16700: cce8a9af1c6cf1776511aa69e5f4b5bef7bf5938 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16703: 4d016d6e602638e0ebc3895331224e057508c07a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13295: bdc2a2150836a4f130aa2265577e8544f7b10f2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8258112491230002857==--
