Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FBEE7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 22:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9661810E365;
	Mon,  9 Dec 2024 22:59:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD85A10E365;
 Mon,  9 Dec 2024 22:59:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2368880865047447710=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Feudebug?=
 =?utf-8?q?=3A_Introduce_additional_ufence_testcases?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Dec 2024 22:59:23 -0000
Message-ID: <173378516376.611839.12903849816397975135@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
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

--===============2368880865047447710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_eudebug: Introduce additional ufence testcases
URL   : https://patchwork.freedesktop.org/series/142301/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8145_full -> XEIGTPW_12278_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12278_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12278_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12278_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@test-time-stamp:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@kms_async_flips@test-time-stamp.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_lease@cursor-implicit-plane:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_lease@cursor-implicit-plane.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_lease@cursor-implicit-plane.html

  * igt@kms_sysfs_edid_timing:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][5] +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_sysfs_edid_timing.html

  * {igt@xe_eudebug@basic-vm-bind-ufence-delay-ack} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-bmg:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  
New tests
---------

  New tests have been introduced between XEIGT_8145_full and XEIGTPW_12278_full:

### New IGT tests (3) ###

  * igt@xe_eudebug@basic-vm-bind-drop-debugger-before-ufence-ack:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12278_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@core_hotunplug@hotreplug.html

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1125])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1465])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_3d.html

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][12] ([Intel XE#3468]) +37 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          NOTRUN -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2370])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#3658]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1467])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2328])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#607])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1477])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#367]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#367]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1512])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +12 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2652] / [Intel XE#787]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#3432]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#3432]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_chamelium_color@degamma.html
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2325])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373]) +10 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2341]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#3278]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#307])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2320]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2321]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1424]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2321]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2291]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#323])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2286])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#309]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][52] -> [DMESG-FAIL][53] ([Intel XE#3468]) +2 other tests dmesg-fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1508])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1508]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#3009])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_dp_aux_dev.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2244])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#701])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1421]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2316]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2316]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#3468]) +69 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][66] ([Intel XE#3468]) +2 other tests dmesg-fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-bmg:          [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1401]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2293]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1397] / [Intel XE#1745])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1397])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2311]) +13 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#651]) +16 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][77] ([Intel XE#2333]) +5 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#656]) +47 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +19 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][80] ([Intel XE#1727] / [Intel XE#3468])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2312]) +23 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-lnl:          NOTRUN -> [ABORT][82] ([Intel XE#3673]) +11 other tests abort
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb-addfb-different-handles:
    - shard-bmg:          [PASS][83] -> [DMESG-WARN][84] ([Intel XE#1727]) +2 other tests dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_getfb@getfb-addfb-different-handles.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_getfb@getfb-addfb-different-handles.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2934])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#599]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2493])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2493])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#2571])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#3307])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-bmg:          [PASS][92] -> [DMESG-WARN][93] ([Intel XE#2705] / [Intel XE#3468])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2763]) +21 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2763]) +9 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#736])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#718])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][99] ([Intel XE#1430])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][100] ([Intel XE#2029])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2893]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#1489]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1406]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#3414]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1127])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2330])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#3414]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2413]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1435]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#1435])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [FAIL][113] ([Intel XE#1729])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#362])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#330])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][116] -> [DMESG-WARN][117] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][118] ([Intel XE#1727] / [Intel XE#3468])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1499])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-1/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#756]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#756])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1091] / [Intel XE#2849])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1062])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@exec-queue-placements:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2905]) +14 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@xe_eudebug@exec-queue-placements.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2905]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#688]) +9 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [FAIL][127] ([Intel XE#1000])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2322]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1392]) +10 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][130] -> [DMESG-WARN][131] ([Intel XE#3467]) +1 other test dmesg-warn
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][132] ([Intel XE#3343] / [Intel XE#3468])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [PASS][133] -> [DMESG-WARN][134] ([Intel XE#3343] / [Intel XE#3468])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][135] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2833])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2229])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#560])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@xe_media_fill@media-fill.html
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2459] / [Intel XE#2596])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2457])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165]) -> ([PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [SKIP][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191]) ([Intel XE#2457])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#379])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#2248])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#2248])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#2245])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#979])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          NOTRUN -> [ABORT][197] ([Intel XE#1616]) +1 other test abort
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-lnl:          NOTRUN -> [ABORT][198] ([Intel XE#1358] / [Intel XE#3673])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          NOTRUN -> [ABORT][199] ([Intel XE#1358] / [Intel XE#1616] / [Intel XE#3766])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [ABORT][200] ([Intel XE#1616] / [Intel XE#1694] / [Intel XE#3766])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#584]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][202] -> [DMESG-WARN][203] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [PASS][204] -> [DMESG-WARN][205] ([Intel XE#2280] / [Intel XE#3468])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_pm@s4-vm-bind-userptr.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#944])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#944]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_vm@userptr-invalid:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][208] ([Intel XE#1727]) +1 other test dmesg-warn
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_vm@userptr-invalid.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4-rc-ccs:
    - shard-bmg:          [DMESG-FAIL][209] ([Intel XE#3468]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4-rc-ccs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][211] ([Intel XE#911]) -> [PASS][212] +3 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][213] ([Intel XE#2291]) -> [PASS][214] +3 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][215] ([Intel XE#3468]) -> [PASS][216] +31 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [SKIP][217] ([Intel XE#2316]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][219] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
    - shard-bmg:          [FAIL][221] ([Intel XE#2882]) -> [PASS][222] +2 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][223] ([Intel XE#886]) -> [PASS][224] +3 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][225] ([Intel XE#1503]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][227] ([Intel XE#1435]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_balancer@once-cm-parallel-basic:
    - shard-bmg:          [DMESG-WARN][229] -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_exec_balancer@once-cm-parallel-basic.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_exec_balancer@once-cm-parallel-basic.html

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][231] ([Intel XE#1727]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [FAIL][233] -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-WARN][235] ([Intel XE#3467]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [DMESG-FAIL][237] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][238] +5 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][239] ([Intel XE#827]) -> [DMESG-FAIL][240] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-bmg:          [DMESG-WARN][241] ([Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][242] ([Intel XE#3468])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][243] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][244] ([Intel XE#3468] / [Intel XE#877])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][245] ([Intel XE#1188]) -> [SKIP][246] ([Intel XE#2341])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_content_protection@uevent.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][247] ([Intel XE#2291]) -> [DMESG-WARN][248] ([Intel XE#877])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [DMESG-WARN][249] ([Intel XE#3468]) -> [SKIP][250] ([Intel XE#2291])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][251] ([Intel XE#3468]) -> [DMESG-FAIL][252] ([Intel XE#3468])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][253] ([Intel XE#2312]) -> [SKIP][254] ([Intel XE#2311]) +10 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][255] ([Intel XE#2333]) -> [DMESG-FAIL][256] ([Intel XE#3468]) +2 other tests dmesg-fail
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][257] ([Intel XE#1727]) -> [FAIL][258] ([Intel XE#2333])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-bmg:          [FAIL][259] ([Intel XE#2333]) -> [INCOMPLETE][260] ([Intel XE#3468])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][261] ([Intel XE#3468]) -> [SKIP][262] ([Intel XE#2312]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][263] ([Intel XE#2312]) -> [FAIL][264] ([Intel XE#2333]) +5 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][265] ([Intel XE#2312]) -> [DMESG-FAIL][266] ([Intel XE#3468]) +1 other test dmesg-fail
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][267] ([Intel XE#2333]) -> [SKIP][268] ([Intel XE#2312]) +6 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][269] ([Intel XE#2311]) -> [SKIP][270] ([Intel XE#2312]) +13 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][271] ([Intel XE#2313]) -> [SKIP][272] ([Intel XE#2312]) +12 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][273] ([Intel XE#2312]) -> [SKIP][274] ([Intel XE#2313]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [FAIL][275] ([Intel XE#2333]) -> [INCOMPLETE][276] ([Intel XE#1727] / [Intel XE#2050] / [Intel XE#3468])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [DMESG-FAIL][277] ([Intel XE#3468]) -> [FAIL][278] ([Intel XE#1430])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][279] ([Intel XE#1499]) -> [DMESG-WARN][280] ([Intel XE#3468])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [DMESG-FAIL][281] ([Intel XE#3468]) -> [FAIL][282] ([Intel XE#2364])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][283] ([Intel XE#1473] / [Intel XE#2472]) -> [INCOMPLETE][284] ([Intel XE#1473] / [Intel XE#3468])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][285] ([Intel XE#1473] / [Intel XE#2472]) -> [FAIL][286] ([Intel XE#1000])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_evict@evict-threads-large.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_evict@evict-threads-large.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [DMESG-WARN][287] ([Intel XE#3467]) -> [DMESG-WARN][288] ([Intel XE#3467] / [Intel XE#3468])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_module_load@many-reload.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [ABORT][289] ([Intel XE#1616] / [Intel XE#3468]) -> [ABORT][290] ([Intel XE#1616])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][291] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [DMESG-WARN][292] ([Intel XE#3468] / [Intel XE#569])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_pm@s3-vm-bind-prefetch.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3766
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8145 -> IGTPW_12278

  IGTPW_12278: 12278
  IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2340-9d12021e081c72b18c31bda175fb9a43f1d005fc: 9d12021e081c72b18c31bda175fb9a43f1d005fc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/index.html

--===============2368880865047447710==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_eudebug: Introduce additional=
 ufence testcases</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142301/">https://patchwork.freedesktop.org/series/142301/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12278/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12278/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8145_full -&gt; XEIGTPW_12278_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12278_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12278_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
278_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-7/igt@kms_async_flips@test-time-stamp.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard=
-bmg-2/igt@kms_async_flips@test-time-stamp.html">INCOMPLETE</a> +1 other te=
st incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-5/igt@kms_lease@cursor-implicit-plane.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard=
-bmg-4/igt@kms_lease@cursor-implicit-plane.html">DMESG-WARN</a> +2 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_sysfs_edid_timing.html">DMES=
G-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_eudebug@basic-vm-bind-ufence-delay-ack} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8145_full and XEIGTPW_12278=
_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_eudebug@basic-vm-bind-drop-debugger-before-ufence-ack:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12278_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-5/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/=
igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125=
">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_3d.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_atomic_interruptible@univers=
al-setplane-cursor@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +37 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 =
other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
67">Intel XE#1467</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12278/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resol=
ution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-for-ea=
ch-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_content_protection@atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3278">Intel XE#3278</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-f=
lip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-curs=
or-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modes=
et-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_122=
78/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">=
Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1508">Intel XE#1508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-=
bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recrea=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-3/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi=
-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12278/shard-bmg-5/igt@kms_flip@absolute-wf_vblank-interruptible@a-=
hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>) +69 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vb=
lank-interruptible@a-dp2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests =
dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4t=
ile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Int=
el XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p=
-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-mo=
desetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +47 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte@pipe-b-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +23 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-sus=
pend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3673">Intel XE#3673</a>) +11 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-addfb-different-handles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@kms_getfb@getfb-addfb-different-handles.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_122=
78/shard-bmg-8/igt@kms_getfb@getfb-addfb-different-handles.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">=
Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1227=
8/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE=
#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-with-clipping-cla=
mping-pixel-formats@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_plane_scaling@pla=
ne-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +21 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Int=
el XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">In=
tel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278=
/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1=
435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_tiled_display@basic-test-pat=
tern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/sh=
ard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_vblank@ts-continuation-suspe=
nd@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-1/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@xe_create@create-big-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
62">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@exec-queue-placements:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@xe_eudebug@exec-queue-placements=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_eudebug@vm-bind-clear.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@xe_evict@evict-beng-large-extern=
al-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@xe_evict@evict-mixed-threads-lar=
ge.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@xe_exec_basic@multigpu-once-user=
ptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-w=
ait_for_lmem_ready.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_fault_injection@inject-fau=
lt-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1=
 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_fault_injection@inject-fault-=
probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-x=
e_uc_fw_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_fault_injection@inject-fault-pro=
be-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@xe_fault_injection@vm-create-fai=
l-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 =
other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
3">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_vali=
date_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
57">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8145/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard=
-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
145/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8145/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8145/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/s=
hard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12278/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12278/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1227=
8/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12278/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12278/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2278/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12278/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Int=
el XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@xe_noexec_ping_pong.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Int=
el XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-4/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">=
Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_pm@s2idle-basic-exec.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/161=
6">Intel XE#1616</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-7/igt@xe_pm@s2idle-exec-after.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/135=
8">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@xe_pm@s2idle-multiple-execs.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3766">Intel XE#3766</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-unbind-all.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1694">Intel XE#1694</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3766">Intel XE#3766</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@xe_pm@s3-vm-bind-prefetch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/=
igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Int=
el XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/=
igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-lnl-6/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@userptr-invalid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@xe_vm@userptr-invalid.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4-rc-cc=
s:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-dp-2-4-rc-ccs.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4-rc-ccs.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-lnl-2/igt@kms_async_flips=
@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2=
-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_flip@2x-flip-vs=
-panning-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +31 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2278/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_flip@flip-vs-pannin=
g-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreat=
e-interruptible@a-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12278/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate=
-interruptible@a-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE=
#1503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12278/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12278/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@xe_exec_balancer@once-cm-parallel-basic.html">DM=
ESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12278/shard-bmg-6/igt@xe_exec_balancer@once-cm-parallel-basic.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-userptr-invalid=
ate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_exec_basic@many-binde=
xecqueue-userptr-invalidate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-bindexecque=
ue-userptr-rebind.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12278/shard-lnl-5/igt@xe_exec_compute_mode@many-exec=
queues-bindexecqueue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_execute.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_fault_injection=
@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12278/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html">PASS=
</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a=
-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/827">Intel XE#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_async_flips@alternate-sync=
-async-flip@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1=
 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fenci=
ng.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_atomic_=
transition@plane-all-transition-fencing.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_big_fb@4-tiled-16bpp-r=
otate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12278/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE=
#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs=
-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank-interruptib=
le.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-8/igt@kms_flip@blocking-absolut=
e-wf_vblank-interruptible.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-m=
sflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-2/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-indfb-msflip-blt.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 oth=
er tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-draw-render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">In=
tel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuff=
er_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-1/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-spr-indfb-onoff.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other=
 test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shr=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-3/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">=
Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12278/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2050">Intel XE#2050</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1227=
8/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1227=
8/shard-bmg-2/igt@kms_vrr@negative-basic.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12278/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">=
Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2472">Intel XE#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_evict@evict-mixed-many=
-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-3/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel =
XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2472">Intel XE#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12278/shard-bmg-5/igt@xe_evict@evict-threads-large.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/100=
0">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@xe_module_load@many-reload.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel=
 XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12278/shard-bmg-6/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel =
XE#3467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel=
 XE#1616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12278/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8145/shard-bmg-7/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12278/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetc=
h.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8145 -&gt; IGTPW_12278</li>
</ul>
<p>IGTPW_12278: 12278<br />
  IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2340-9d12021e081c72b18c31bda175fb9a43f1d005fc: 9d12021e081c72b18c31bda=
175fb9a43f1d005fc</p>

</body>
</html>

--===============2368880865047447710==--
