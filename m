Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFC7CF3191
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 04:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003B110E7A1;
	Thu,  3 Oct 2024 04:37:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DE810E7A9;
 Thu,  3 Oct 2024 04:37:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5672278292301767984=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_Backlight_control_on_HDR-enab?=
 =?utf-8?q?led_eDP_panels_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Oct 2024 04:37:55 -0000
Message-ID: <172793027567.1166414.2416205044828645010@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003023429.1967339-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241003023429.1967339-1-santhosh.reddy.guddati@intel.com>
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

--===============5672278292301767984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Backlight control on HDR-enabled eDP panels (rev4)
URL   : https://patchwork.freedesktop.org/series/139050/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8050_full -> XEIGTPW_11860_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11860_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11860_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11860_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_hdr@brightness-with-hdr} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][3] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-436/igt@kms_hdr@brightness-with-hdr.html
    - shard-lnl:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html

  * {igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2} (NEW):
    - {shard-bmg}:        NOTRUN -> [FAIL][5] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@xe_ccs@suspend-resume:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][7] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@xe_ccs@suspend-resume.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +5 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][10] +1 other test timeout
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s2idle-mocs:
    - shard-lnl:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@xe_pm@s2idle-mocs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_pm@s2idle-mocs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [FAIL][13] ([Intel XE#1288]) -> [DMESG-FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-bmg-7/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - {shard-bmg}:        NOTRUN -> [SKIP][15] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  
New tests
---------

  New tests have been introduced between XEIGT_8050_full and XEIGTPW_11860_full:

### New IGT tests (9) ###

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_hdr@brightness-with-hdr:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 7.86] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.72] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.69] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11860_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#1701]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#1659]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#619])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#367]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1512])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +62 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2669]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1195]) +1 other test incomplete
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#306])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#306]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +12 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1178] / [Intel XE#1204])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1204])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#308])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#309]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#1541])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#307]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#599]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#703])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1135])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1421])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#886]) +5 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][50] ([Intel XE#886]) +5 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455]) +20 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#352])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#651]) +30 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-lnl:          [PASS][54] -> [INCOMPLETE][55] ([Intel XE#2050])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#651]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#653]) +29 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +13 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1450]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1450] / [Intel XE#599])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
    - shard-lnl:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#324]) +3 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          [PASS][64] -> [DMESG-FAIL][65] ([Intel XE#324]) +1 other test dmesg-fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#616]) +3 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#361]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2763]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2763]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#870])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#718])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          NOTRUN -> [FAIL][74] ([Intel XE#718])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#1430])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [PASS][77] -> [DMESG-FAIL][78] ([Intel XE#1620])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][79] -> [DMESG-WARN][80] ([Intel XE#1620] / [Intel XE#2042])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#2893]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1489]) +10 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1122])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1406])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2850]) +11 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#327])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][87] ([Intel XE#899]) +2 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2168])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#756]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1126])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2905]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2905])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#688]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][94] -> [TIMEOUT][95] ([Intel XE#1473])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1392]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#288]) +27 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][98] -> [TIMEOUT][99] ([Intel XE#2105])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#255])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [PASS][101] -> [SKIP][102] ([Intel XE#1192])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@xe_live_ktest@xe_bo.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][103] ([Intel XE#1999]) +2 other tests fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1416])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@xe_mmap@vram.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#2723])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@xe_oa@oa-exponents.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][107] ([Intel XE#2723])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2541]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][109] ([Intel XE#1173]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [ABORT][110] ([Intel XE#1358])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2284] / [Intel XE#366])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][112] -> [ABORT][113] ([Intel XE#1358] / [Intel XE#1607])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][114] -> [ABORT][115] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#944])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][117] ([Intel XE#1760])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#2747])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@xe_wedged@wedged-at-any-timeout.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][120] ([Intel XE#1659]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-dg2-set2:     [INCOMPLETE][122] ([Intel XE#1195]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_flip@2x-busy-flip@ad-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][124] ([Intel XE#877]) -> [PASS][125] +3 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-bmg-7/igt@kms_flip@2x-busy-flip@ad-dp2-hdmi-a3.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-6/igt@kms_flip@2x-busy-flip@ad-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][126] ([Intel XE#2049]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-4/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][128] ([Intel XE#886]) -> [PASS][129] +2 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-WARN][130] ([Intel XE#324]) -> [PASS][131] +2 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][132] ([Intel XE#324]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][134] ([Intel XE#616]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          [INCOMPLETE][136] ([Intel XE#2761]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][138] ([Intel XE#2443]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@kms_vrr@flip-basic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@kms_vrr@flip-basic.html

  * igt@xe_drm_fdinfo@utilization-single-full-load:
    - shard-lnl:          [DMESG-WARN][140] -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - {shard-bmg}:        [FAIL][142] ([Intel XE#2364]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:
    - shard-lnl:          [FAIL][144] ([Intel XE#1630]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html

  * igt@xe_exec_reset@cm-close-execqueues-close-fd:
    - shard-lnl:          [FAIL][146] -> [PASS][147] +7 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-8/igt@xe_exec_reset@cm-close-execqueues-close-fd.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@xe_exec_reset@cm-close-execqueues-close-fd.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-FAIL][148] ([Intel XE#1620]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_oa@oa-exponents:
    - {shard-bmg}:        [FAIL][150] ([Intel XE#2723]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-bmg-7/igt@xe_oa@oa-exponents.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-2/igt@xe_oa@oa-exponents.html

  * igt@xe_vm@munmap-style-unbind-front:
    - shard-lnl:          [TIMEOUT][152] -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-4/igt@xe_vm@munmap-style-unbind-front.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@xe_vm@munmap-style-unbind-front.html

  
#### Warnings ####

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          [DMESG-FAIL][154] -> [FAIL][155] ([Intel XE#886])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@kms_flip@plain-flip-ts-check.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [DMESG-WARN][156] -> [FAIL][157] ([Intel XE#886])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1500]) -> [SKIP][159] ([Intel XE#362])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2747
  [Intel XE#2761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2761
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2895]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8050 -> IGTPW_11860

  IGTPW_11860: 939e017a1d47a186d4dbccc641f611f3a9ce69b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8050: 0000bc070385689633718cbab01ab02a524f2c61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2007-789d5631453c3edad1988cd47db1643555e52ac9: 789d5631453c3edad1988cd47db1643555e52ac9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/index.html

--===============5672278292301767984==
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
<tr><td><b>Series:</b></td><td>Backlight control on HDR-enabled eDP panels (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139050/">https://patchwork.freedesktop.org/series/139050/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8050_full -&gt; XEIGTPW_11860_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11860_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11860_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11860_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-hdr} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-436/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> +2 other tests fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2} (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@xe_ccs@suspend-resume.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_pm@s2idle-mocs.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-bmg-7/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288">Intel XE#1288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8050_full and XEIGTPW_11860_full:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11860_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-435/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@xe_oa@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2747">Intel XE#2747</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-256x256.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ad-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-bmg-7/igt@kms_flip@2x-busy-flip@ad-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-6/igt@kms_flip@2x-busy-flip@ad-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-4/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-4/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2761">Intel XE#2761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-6/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-execqueues-close-fd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-8/igt@xe_exec_reset@cm-close-execqueues-close-fd.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-6/igt@xe_exec_reset@cm-close-execqueues-close-fd.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-bmg-7/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-bmg-2/igt@xe_oa@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-4/igt@xe_vm@munmap-style-unbind-front.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-8/igt@xe_vm@munmap-style-unbind-front.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@kms_flip@plain-flip-ts-check.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8050/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11860/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8050 -&gt; IGTPW_11860</li>
</ul>
<p>IGTPW_11860: 939e017a1d47a186d4dbccc641f611f3a9ce69b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8050: 0000bc070385689633718cbab01ab02a524f2c61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2007-789d5631453c3edad1988cd47db1643555e52ac9: 789d5631453c3edad1988cd47db1643555e52ac9</p>

</body>
</html>

--===============5672278292301767984==--
