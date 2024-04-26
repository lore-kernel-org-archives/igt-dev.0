Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAFEC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 22:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF6F10EA67;
	Fri, 26 Apr 2024 22:03:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BC110EA67;
 Fri, 26 Apr 2024 22:03:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5286018850774429021=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_tests/kms=5Fasync=5Fflips=3A_Extend_the_=22async_flip_n?=
 =?utf-8?q?eeds_an_extra_frame=22_logic_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 26 Apr 2024 22:03:34 -0000
Message-ID: <171416901486.1698277.15616088924286016462@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322203726.16637-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240322203726.16637-1-ville.syrjala@linux.intel.com>
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

--===============5286018850774429021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_async_flips: Extend the "async flip needs an extra frame" logic (rev2)
URL   : https://patchwork.freedesktop.org/series/131518/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7825_full -> XEIGTPW_11076_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11076_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11076_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11076_full prevented too many machines from booting.

  Missing    (2): shard-adlp shard-lnl 

Known issues
------------

  Here are the changes found in XEIGTPW_11076_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] ([Intel XE#1388]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][4] ([Intel XE#650]) +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][5] ([Intel XE#616]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][8] ([Intel XE#1188])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][9] -> [DMESG-WARN][10] ([Intel XE#1214] / [Intel XE#282]) +8 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#1201] / [Intel XE#829])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@kms_fb_coherency@memset-crc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][13] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1162] / [Intel XE#1214]) +3 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][17] -> [FAIL][18] ([Intel XE#616]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     [PASS][19] -> [SKIP][20] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_pm_rpm@legacy-planes-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][21] -> [FAIL][22] ([Intel XE#771] / [Intel XE#899])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][23] -> [FAIL][24] ([Intel XE#899])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#1201]) +10 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html

  
#### Possible fixes ####

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][31] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][32] +2 other tests pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg2-set2:     [DMESG-WARN][33] ([Intel XE#1214] / [Intel XE#1602]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][35] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][36] +2 other tests pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_feature_discovery@display:
    - shard-dg2-set2:     [SKIP][37] ([Intel XE#1201]) -> [PASS][38] +5 other tests pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_feature_discovery@display.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_feature_discovery@display.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][39] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][40] +7 other tests pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][41] ([Intel XE#361]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [SKIP][43] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [FAIL][45] ([Intel XE#1174]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_sysfs_edid_timing.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_sysfs_edid_timing.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][47] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][49] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-dg2-set2:     [DMESG-FAIL][51] ([Intel XE#1069] / [Intel XE#1088]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     [DMESG-WARN][53] ([Intel XE#1214]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@xe_gt_freq@freq_suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][55] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][57] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][58] ([Intel XE#1201] / [Intel XE#829])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [FAIL][59] ([Intel XE#650]) -> [SKIP][60] ([Intel XE#1201] / [Intel XE#829])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#1201]) -> [SKIP][62] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][63] ([Intel XE#1178]) -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@kms_content_protection@atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201]) -> [SKIP][66] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_content_protection@mei-interface.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][68] ([Intel XE#1188])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_content_protection@uevent.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-433/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#1201]) -> [SKIP][70] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][72] ([Intel XE#1201])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][73] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][74] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#1201]) -> [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#282])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201]) -> [SKIP][78] ([Intel XE#1201] / [Intel XE#651])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][80] ([Intel XE#1201]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#1201]) -> [SKIP][82] ([Intel XE#1201] / [Intel XE#653])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][83] ([Intel XE#616]) -> [DMESG-FAIL][84] ([Intel XE#1162]) +1 other test dmesg-fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][85] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][86] ([Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][87] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][88] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#1201]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#929])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_psr@psr2-primary-render.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-433/igt@kms_psr@psr2-primary-render.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201]) -> [SKIP][92] ([Intel XE#1201] / [Intel XE#362])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][93] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][94] ([Intel XE#1473] / [Intel XE#392])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][96] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][97] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][98] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html

  
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * IGT: IGT_7825 -> IGTPW_11076
  * Linux: xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f -> xe-1192-098a032be5e189eb306b909c73ae79ca6645844f

  IGTPW_11076: e11f9f4f1c7534449c1644412507a981ee15e4e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f: f39ba481e5873b7617afc2e8cf618ac9dc85123f
  xe-1192-098a032be5e189eb306b909c73ae79ca6645844f: 098a032be5e189eb306b909c73ae79ca6645844f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131518v2/index.html

--===============5286018850774429021==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_async_flips: Extend the &quot;async flip needs an extra frame&quot; logic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131518/">https://patchwork.freedesktop.org/series/131518/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131518v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131518v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7825_full -&gt; XEIGTPW_11076_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11076_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11076_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11076_full prevented too many machines from booting.</p>
<p>Missing    (2): shard-adlp shard-lnl </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11076_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388">Intel XE#1388</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@kms_fb_coherency@memset-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_feature_discovery@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_feature_discovery@display.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-435/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-433/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-463/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-433/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11076/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7825 -&gt; IGTPW_11076</li>
<li>Linux: xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f -&gt; xe-1192-098a032be5e189eb306b909c73ae79ca6645844f</li>
</ul>
<p>IGTPW_11076: e11f9f4f1c7534449c1644412507a981ee15e4e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f: f39ba481e5873b7617afc2e8cf618ac9dc85123f<br />
  xe-1192-098a032be5e189eb306b909c73ae79ca6645844f: 098a032be5e189eb306b909c73ae79ca6645844f</p>

</body>
</html>

--===============5286018850774429021==--
