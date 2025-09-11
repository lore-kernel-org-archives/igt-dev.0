Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459C7CAC587
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 21:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E564610E0A0;
	Thu, 11 Sep 2025 21:03:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3A310E0A0;
 Thu, 11 Sep 2025 21:03:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8902406000945177466=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_DONT=5FMERGE=3A_tests/xe?=
 =?utf-8?q?=5Fintel=5Fbb=3A_repro_for_pthread=5Fkill=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Sep 2025 21:03:34 -0000
Message-ID: <175762461431.328030.4058813004130998369@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911114554.2380485-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250911114554.2380485-2-zbigniew.kempczynski@intel.com>
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

--===============8902406000945177466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DONT_MERGE: tests/xe_intel_bb: repro for pthread_kill()
URL   : https://patchwork.freedesktop.org/series/154383/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8535_FULL -> XEIGTPW_13732_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13732_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13732_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13732_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_dc@dc9-dpms:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +14 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/igt@kms_pm_dc@dc9-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@legacy-planes@plane-43:
    - shard-bmg:          [PASS][4] -> [ABORT][5] +15 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-8/igt@kms_pm_rpm@legacy-planes@plane-43.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@kms_pm_rpm@legacy-planes@plane-43.html

  * igt@runner@aborted:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-464/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-464/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-466/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-436/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-464/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-466/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-466/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-436/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-436/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@runner@aborted.html

  * {igt@xe_intel_bb@tf} (NEW):
    - shard-bmg:          NOTRUN -> [TIMEOUT][29]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_intel_bb@tf.html

  
#### Warnings ####

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][30] ([Intel XE#2029]) -> [ABORT][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][32] ([Intel XE#1439] / [Intel XE#836]) -> [ABORT][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          [SKIP][34] ([Intel XE#1439] / [Intel XE#836]) -> [ABORT][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][36] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [ABORT][37] +2 other tests abort
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][38] ([Intel XE#4208]) -> [ABORT][39] +1 other test abort
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-lnl:          [SKIP][40] ([Intel XE#1439] / [Intel XE#3141]) -> [ABORT][41] +1 other test abort
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][42] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][43] +3 other tests abort
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-5/igt@xe_pm@d3cold-basic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          [SKIP][44] ([Intel XE#5742]) -> [ABORT][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-3/igt@xe_pm@d3hot-i2c.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          [SKIP][46] ([Intel XE#5742]) -> [ABORT][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-4/igt@xe_pm@d3hot-i2c.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          [SKIP][48] ([Intel XE#1948]) -> [ABORT][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][50] ([Intel XE#2284]) -> [ABORT][51] +3 other tests abort
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          [SKIP][52] ([Intel XE#584]) -> [ABORT][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@async-flip-dpms}:
    - shard-lnl:          [PASS][54] -> [ABORT][55] +1 other test abort
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/igt@kms_async_flips@async-flip-dpms.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@kms_async_flips@async-flip-dpms.html

  * {igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2}:
    - shard-bmg:          [PASS][56] -> [ABORT][57] +1 other test abort
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-3/igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2.html

  
New tests
---------

  New tests have been introduced between XEIGT_8535_FULL and XEIGTPW_13732_FULL:

### New IGT tests (1) ###

  * igt@xe_intel_bb@tf:
    - Statuses : 1 timeout(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13732_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1407])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2327])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1124])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1124])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2887]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2887]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2724])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#373]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2252]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2291])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1421])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2316]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#301])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2311]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#5390])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2312]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#656]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#599]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#4596])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#4837]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4837]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#1392])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#288])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch.html

  * igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#4915]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@twice-large-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#4943]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4943]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-huge.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#5100])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_mmap@pci-membarrier-parallel.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][93] ([Intel XE#2291]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][95] ([Intel XE#5299]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][97] ([Intel XE#2373]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][99] ([Intel XE#2316]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][101] ([Intel XE#301]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][103] ([Intel XE#1503]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][105] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#4208]) -> [PASS][108] +12 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [SKIP][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134]) ([Intel XE#378]) -> ([PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-3/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-3/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-7/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-7/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-4/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-8/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-3/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-5/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-5/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-4/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-5/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-8/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-3/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-8/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-7/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-3/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-7/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-3/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-1/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-1/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [SKIP][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185]) ([Intel XE#2457]) -> ([PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-8/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-3/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-3/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-2/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-4/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-1/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-7/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-3/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-8/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-1/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-1/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-1/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-1/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [SKIP][235], [PASS][236]) ([Intel XE#378]) -> ([PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-466/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-435/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-464/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-464/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-435/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-464/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-433/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-463/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-463/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-464/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-436/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-433/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-432/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-432/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-433/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-436/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-436/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-433/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-463/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-464/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-464/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-466/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-466/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-464/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-466/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-436/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-436/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-436/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#4208]) -> [SKIP][263] ([Intel XE#308])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#4208]) -> [SKIP][265] ([Intel XE#323])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][266] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][267] ([Intel XE#301])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][268] ([Intel XE#2311]) -> [SKIP][269] ([Intel XE#2312]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][270] ([Intel XE#2312]) -> [SKIP][271] ([Intel XE#2311]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][272] ([Intel XE#2312]) -> [SKIP][273] ([Intel XE#5390]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][274] ([Intel XE#5390]) -> [SKIP][275] ([Intel XE#2312]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][276] ([Intel XE#2312]) -> [SKIP][277] ([Intel XE#2313]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][279] ([Intel XE#653])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][280] ([Intel XE#2313]) -> [SKIP][281] ([Intel XE#2312]) +8 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#4208]) -> [SKIP][283] ([Intel XE#653])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#4208]) -> [SKIP][285] ([Intel XE#5626])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_eu_stall@non-blocking-read.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#4208]) -> [SKIP][287] ([Intel XE#4837]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_exec_system_allocator@once-new-nomemset:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#4208]) -> [SKIP][289] ([Intel XE#4915]) +8 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_exec_system_allocator@once-new-nomemset.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_system_allocator@once-new-nomemset.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#4208]) -> [SKIP][291] ([Intel XE#3573])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#4208]) -> [SKIP][293] ([Intel XE#3342])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * IGT: IGT_8535 -> IGTPW_13732
  * Linux: xe-3724-f251150579f93807f196c33b8716f14c1fd136e6 -> xe-3725-a76438ef96a214378c040a10b853f9b52b4ded60

  IGTPW_13732: 13732
  IGT_8535: 8535
  xe-3724-f251150579f93807f196c33b8716f14c1fd136e6: f251150579f93807f196c33b8716f14c1fd136e6
  xe-3725-a76438ef96a214378c040a10b853f9b52b4ded60: a76438ef96a214378c040a10b853f9b52b4ded60

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/index.html

--===============8902406000945177466==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>DONT_MERGE: tests/xe_intel_bb: repro for pth=
read_kill()</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154383/">https://patchwork.freedesktop.org/series/154383/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13732/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13732/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8535_FULL -&gt; XEIGTPW_13732_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13732_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13732_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
732_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-2/igt@kms_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@k=
ms_pm_dc@dc9-dpms.html">ABORT</a> +14 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@kms_pm_rpm@drm-resources-equal.h=
tml">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-43:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-8/igt@kms_pm_rpm@legacy-planes@plane-43.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/sha=
rd-bmg-4/igt@kms_pm_rpm@legacy-planes@plane-43.html">ABORT</a> +15 other te=
sts abort</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg=
2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard=
-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/sh=
ard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732=
/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
732/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-466/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13732/shard-dg2-436/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13732/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-464/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13732/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13732/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13732/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-436/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13732/shard-dg2-436/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/=
igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_intel_bb@tf} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_intel_bb@tf.html">TIMEOUT</a>=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/sha=
rd-lnl-7/igt@kms_pm_dc@deep-pkgc.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel =
XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">=
ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">In=
tel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lps=
p.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141"=
>Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">A=
BORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-=
no-wait.html">ABORT</a> +1 other test abort</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lp=
sp-stress-no-wait.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel =
XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13732/shard-lnl-8/igt@xe_pm@d3cold-basic.html">ABORT</a> +3 other tests a=
bort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-l=
nl-5/igt@xe_pm@d3hot-i2c.html">ABORT</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-4/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-b=
mg-4/igt@xe_pm@d3hot-i2c.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/s=
hard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel X=
E#2284</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13732/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html">ABORT</a> +3 o=
ther tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732=
/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-dpms}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-2/igt@kms_async_flips@async-flip-dpms.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard=
-lnl-4/igt@kms_async_flips@async-flip-dpms.html">ABORT</a> +1 other test ab=
ort</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-3/igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13732/shard-bmg-5/igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2.html">AB=
ORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8535_FULL and XEIGTPW_13732=
_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_intel_bb@tf:<ul>
<li>Statuses : 1 timeout(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13732_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
24">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after=
-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13732/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_flip@2x-flip-vs-expired-vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-=
6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13732/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests ski=
p</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcps=
r-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@kms_plane_lowres@tiling-none@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-=
bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@kms_psr@fbc-psr-sprite-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@xe_eudebug@vma-ufence-faultable.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_eudebug_online@breakpoint-man=
y-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/s=
hard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_fault_mode@many-userpt=
r-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_system_allocator@once-=
large-malloc-busy-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_exec_system_allocator@twice-l=
arge-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@xe_exec_system_allocator@twice-m=
map-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_mmap@pci-membarrier-parallel.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_cursor_lega=
cy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299=
">Intel XE#5299</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13732/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13732/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreat=
e-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/sha=
rd-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">I=
ntel XE#2685</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3307">Intel XE#3307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@kms_plane_scaling@intel-max-src=
-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-parallel-user=
ptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_balancer@many=
-execqueues-parallel-userptr-rebind.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8535/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8535/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8535/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8535/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8535/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8535/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-ln=
l-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8535/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard=
-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
535/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-5/igt@xe_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8535/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8535/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8535/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13732/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13732/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13732/shard-lnl-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard=
-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
732/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13732/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13732/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13732/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13732/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13732/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-ln=
l-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8535/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8535/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8535/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8535/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8535/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8535/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bm=
g-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8535/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535=
/shard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
535/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8535/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8535/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8535/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_137=
32/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13732/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13732/shard-bmg-8/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13732/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13732/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13732/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13732/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13732/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13732/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard=
-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8535/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8535/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8535/shard-dg2-435/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-=
dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-433/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8535/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8535/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8535/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8535/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_853=
5/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-432/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8535/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8535/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-436/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8535/shard-dg2-433/igt@xe_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13732/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-=
432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_137=
32/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13732/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13732/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/sh=
ard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-466/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13732/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13732/shard-dg2-466/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-d=
g2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13732/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13732/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13732/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13732/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13732/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-curso=
r-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_cursor_legacy@short=
-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13732/shard-lnl-2/igt@kms_flip@flip-vs-expired=
-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-3/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13732/shard-bmg-6/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/shard-dg2-432/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@xe_eu_stall@non-blocking-read.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13732/shard-dg2-432/igt@xe_eu_stall@non-blocking-read.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE=
#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13732/shard-dg2-432/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4=
837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@xe_exec_system_allocator@once-new-nomemset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13732/shard-dg2-432/igt@xe_exec_system_allocator@once-new-n=
omemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4915">Intel XE#4915</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_137=
32/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8535/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13732/shard-dg2-432/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8535 -&gt; IGTPW_13732</li>
<li>Linux: xe-3724-f251150579f93807f196c33b8716f14c1fd136e6 -&gt; xe-3725-a=
76438ef96a214378c040a10b853f9b52b4ded60</li>
</ul>
<p>IGTPW_13732: 13732<br />
  IGT_8535: 8535<br />
  xe-3724-f251150579f93807f196c33b8716f14c1fd136e6: f251150579f93807f196c33=
b8716f14c1fd136e6<br />
  xe-3725-a76438ef96a214378c040a10b853f9b52b4ded60: a76438ef96a214378c040a1=
0b853f9b52b4ded60</p>

</body>
</html>

--===============8902406000945177466==--
