Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DABFC02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 15:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ADA10E9AC;
	Thu, 16 Jan 2025 15:18:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74FB10E9A8;
 Thu, 16 Jan 2025 15:18:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5421087281614100835=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/xe=3A_Add_xe=5Fcg=5F?=
 =?utf-8?q?dmem_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jan 2025 15:18:38 -0000
Message-ID: <173704071871.304946.8483521205721552703@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250115115512.84520-1-dev@lankhorst.se>
In-Reply-To: <20250115115512.84520-1-dev@lankhorst.se>
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

--===============5421087281614100835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add xe_cg_dmem test
URL   : https://patchwork.freedesktop.org/series/143593/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8193_full -> XEIGTPW_12447_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12447_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12447_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12447_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][5], [PASS][6])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1:
    - shard-lnl:          [PASS][7] -> ([INCOMPLETE][8], [PASS][9]) +3 other tests ( 1 incomplete, 1 pass )
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [PASS][10] -> ([SKIP][11], [INCOMPLETE][12]) ([Intel XE#2136])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html

  * {igt@xe_cg_dmem@functional} (NEW):
    - shard-bmg:          NOTRUN -> ([SKIP][13], [SKIP][14])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_cg_dmem@functional.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@xe_cg_dmem@functional.html
    - shard-lnl:          NOTRUN -> ([SKIP][15], [SKIP][16])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@xe_cg_dmem@functional.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@xe_cg_dmem@functional.html

  * {igt@xe_cg_dmem@test-simple-min} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@xe_cg_dmem@test-simple-min.html
    - shard-lnl:          NOTRUN -> [SKIP][18] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@xe_cg_dmem@test-simple-min.html

  * igt@xe_exec_threads@threads-cm-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> ([FAIL][19], [SKIP][20]) ([Intel XE#1130])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][22] ([Intel XE#2882]) -> ([FAIL][23], [SKIP][24]) ([Intel XE#2423])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][25] ([Intel XE#2882]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  
New tests
---------

  New tests have been introduced between XEIGT_8193_full and XEIGTPW_12447_full:

### New IGT tests (3) ###

  * igt@xe_cg_dmem@functional:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_cg_dmem@test-simple-max:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_cg_dmem@test-simple-min:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12447_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#1885]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@core_hotunplug@hotrebind.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][29] -> ([SKIP][30], [SKIP][31]) ([Intel XE#1885])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][32] -> ([PASS][33], [SKIP][34]) ([Intel XE#1885])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@core_hotunplug@hotreplug.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@core_hotunplug@hotreplug.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][35] -> ([FAIL][36], [PASS][37]) ([Intel XE#3249]) +2 other tests ( 1 fail, 1 pass )
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][38] -> ([SKIP][39], [PASS][40]) ([Intel XE#2134]) +2 other tests ( 1 pass, 1 skip )
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@fbdev@eof.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@fbdev@eof.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@fbdev@eof.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - shard-bmg:          NOTRUN -> ([PASS][41], [SKIP][42]) ([Intel XE#2423]) +1 other test ( 1 pass, 1 skip )
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-63.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#873])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#1407])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][46] -> ([PASS][47], [SKIP][48]) ([Intel XE#2136]) +28 other tests ( 1 pass, 1 skip )
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][49] -> ([SKIP][50], [SKIP][51]) ([Intel XE#2136]) +8 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2136]) +24 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#2136]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#2136] / [Intel XE#2327])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#316]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#1467])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#610])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1124]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1124]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#619])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][67], [SKIP][68]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#367]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][70], [SKIP][71]) ([Intel XE#367]) +1 other test ( 2 skip )
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2191]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#2423] / [Intel XE#367])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#455] / [Intel XE#787]) +44 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2907]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][77], [SKIP][78]) ([Intel XE#2136] / [Intel XE#2887])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2136]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][80], [PASS][81]) ([Intel XE#2136])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2887]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#2136]) +1 other test ( 2 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#787]) +195 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][86], [SKIP][87]) ([Intel XE#787]) +27 other tests ( 2 skip )
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][89], [SKIP][90]) ([Intel XE#455] / [Intel XE#787]) +7 other tests ( 2 skip )
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2887])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][92] -> ([PASS][93], [INCOMPLETE][94]) ([Intel XE#1727] / [Intel XE#3124])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][95] -> ([PASS][96], [INCOMPLETE][97]) ([Intel XE#3124])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][98] -> ([PASS][99], [DMESG-WARN][100]) ([Intel XE#1727] / [Intel XE#3113])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#306])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#306]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#373]) +10 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#373]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][106], [SKIP][107]) ([Intel XE#373])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][108] ([Intel XE#1178]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2390])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#3278])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][111] ([Intel XE#1188])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#455]) +3 other tests ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x10.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#2321])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([Intel XE#2320] / [Intel XE#2423])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#309])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][120] -> ([SKIP][121], [PASS][122]) ([Intel XE#2291])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#2291])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#309]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][126] -> ([SKIP][127], [SKIP][128]) ([Intel XE#2291] / [Intel XE#2423])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1508])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][130] -> ([SKIP][131], [SKIP][132]) ([Intel XE#1340] / [Intel XE#2423])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#2372])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_feature_discovery@chamelium.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_feature_discovery@chamelium.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][135], [SKIP][136]) ([Intel XE#701])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_feature_discovery@chamelium.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1138])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][138], [SKIP][139]) ([Intel XE#1135])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_feature_discovery@psr2.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [PASS][140] -> ([SKIP][141], [SKIP][142]) ([Intel XE#2316] / [Intel XE#2423])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1421]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][144] -> ([SKIP][145], [PASS][146]) ([Intel XE#2316])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][147] -> ([PASS][148], [FAIL][149]) ([Intel XE#301])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][150] -> [FAIL][151] ([Intel XE#3321])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     NOTRUN -> ([ABORT][152], [PASS][153]) ([Intel XE#2625])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][154] ([Intel XE#2625])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a2-dp2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][155] -> [SKIP][156] ([Intel XE#2423]) +107 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][157] -> [SKIP][158] ([Intel XE#2316]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@2x-plain-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#1421])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][161] -> ([SKIP][162], [FAIL][163]) ([Intel XE#2423] / [Intel XE#2882])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][164] ([Intel XE#2882]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][165] -> [FAIL][166] ([Intel XE#301]) +8 other tests fail
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][167] ([Intel XE#301])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][168] ([Intel XE#301] / [Intel XE#3321])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     NOTRUN -> ([PASS][169], [INCOMPLETE][170]) ([Intel XE#2597])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][171] -> [INCOMPLETE][172] ([Intel XE#2597])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@nonexisting-fb:
    - shard-dg2-set2:     [PASS][173] -> [SKIP][174] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-435/igt@kms_flip@nonexisting-fb.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_flip@nonexisting-fb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][175], [SKIP][176]) ([Intel XE#1401] / [Intel XE#1745])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][177], [SKIP][178]) ([Intel XE#1401])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#455]) +12 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#1401] / [Intel XE#1745])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#1401])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][182], [SKIP][183]) ([Intel XE#1397] / [Intel XE#1745])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][184], [SKIP][185]) ([Intel XE#1397])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([i915#5274])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#651]) +30 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][188], [SKIP][189]) ([Intel XE#651]) +8 other tests ( 2 skip )
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([FAIL][190], [FAIL][191]) ([Intel XE#2333])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#656]) +6 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][193], [SKIP][194]) ([Intel XE#651]) +2 other tests ( 2 skip )
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][195], [SKIP][196]) ([Intel XE#2136] / [Intel XE#2313])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][197], [SKIP][198]) ([Intel XE#656]) +5 other tests ( 2 skip )
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#2312])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#653]) +31 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#2313])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][202], [SKIP][203]) ([Intel XE#653]) +4 other tests ( 2 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][204] ([Intel XE#2050])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@bpc-switch:
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#2423]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#1503])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#346])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][208] ([Intel XE#616]) +3 other tests fail
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [PASS][209] -> ([SKIP][210], [PASS][211]) ([Intel XE#2423]) +141 other tests ( 1 pass, 1 skip )
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][212] ([Intel XE#877])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#2763]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [PASS][215] -> ([SKIP][216], [SKIP][217]) ([Intel XE#2423]) +33 other tests ( 2 skip )
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#870]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> ([SKIP][220], [SKIP][221]) ([Intel XE#870])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_pm_backlight@fade.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][222] -> ([FAIL][223], [FAIL][224]) ([Intel XE#718])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][225], [SKIP][226]) ([Intel XE#1129])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][227] -> [SKIP][228] ([Intel XE#2446]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][229] -> ([PASS][230], [SKIP][231]) ([Intel XE#2446]) +2 other tests ( 1 pass, 1 skip )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_pm_rpm@i2c.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_pm_rpm@i2c.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [PASS][232] -> ([SKIP][233], [SKIP][234]) ([Intel XE#2446])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_pm_rpm@legacy-planes-dpms.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [PASS][235] -> [SKIP][236] ([Intel XE#2446])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#2893])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#1489])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#1489]) +9 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#1489] / [Intel XE#2136])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][242], [SKIP][243]) ([Intel XE#1489]) +2 other tests ( 2 skip )
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#2893]) +1 other test ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][246] ([Intel XE#1122])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][247] ([Intel XE#2234] / [Intel XE#2850])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][248], [SKIP][249]) ([Intel XE#2850] / [Intel XE#929])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_psr@pr-dpms.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#2136]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][252] ([Intel XE#3414]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#1127])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#1500] / [Intel XE#362])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][256] -> [FAIL][257] ([Intel XE#899])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][258] -> [FAIL][259] ([Intel XE#2159]) +1 other test fail
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#2168])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_vrr@lobf.html

  * {igt@xe_cg_dmem@test-simple-max} (NEW):
    - shard-bmg:          NOTRUN -> ([SKIP][261], [SKIP][262]) ([Intel XE#1130]) +1 other test ( 2 skip )
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_cg_dmem@test-simple-max.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_cg_dmem@test-simple-max.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][263] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][264] ([Intel XE#1126])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][265] ([Intel XE#1130]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#3889])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#2905]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][269], [SKIP][270]) ([Intel XE#2905]) +1 other test ( 2 skip )
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#2905]) +10 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> ([SKIP][272], [SKIP][273]) ([Intel XE#1130] / [Intel XE#2905])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_eudebug_online@single-step.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> ([SKIP][274], [SKIP][275]) ([Intel XE#688])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@xe_evict@evict-large-multi-vm.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][276] ([Intel XE#1130]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> ([SKIP][277], [SKIP][278]) ([Intel XE#1392])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#2322])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][280] -> ([SKIP][281], [PASS][282]) ([Intel XE#1392]) +3 other tests ( 1 pass, 1 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [PASS][283] -> [SKIP][284] ([Intel XE#1392]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
    - shard-lnl:          NOTRUN -> [SKIP][285] ([Intel XE#1392]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:
    - shard-bmg:          [PASS][286] -> ([SKIP][287], [SKIP][288]) ([Intel XE#1130]) +85 other tests ( 2 skip )
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][289], [SKIP][290]) ([Intel XE#288]) +4 other tests ( 2 skip )
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][291] ([Intel XE#288]) +27 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_reset@parallel-cat-error:
    - shard-dg2-set2:     [PASS][292] -> [SKIP][293] ([Intel XE#1130]) +7 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-463/igt@xe_exec_reset@parallel-cat-error.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_exec_reset@parallel-cat-error.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][294] ([Intel XE#2905])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-lnl:          NOTRUN -> ([SKIP][295], [SKIP][296]) ([Intel XE#2905]) +2 other tests ( 2 skip )
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][297] -> ([PASS][298], [SKIP][299]) ([Intel XE#1130]) +323 other tests ( 1 pass, 1 skip )
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     [PASS][300] -> ([PASS][301], [ABORT][302]) ([Intel XE#2625])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-464/igt@xe_gt_freq@freq_suspend.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_gt_freq@freq_suspend.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][303] ([Intel XE#2229]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][304] -> ([SKIP][305], [PASS][306]) ([Intel XE#1192])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][307] -> ([PASS][308], [SKIP][309]) ([Intel XE#2229])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][310] -> ([FAIL][311], [SKIP][312]) ([Intel XE#1192] / [Intel XE#1999])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][313] -> [FAIL][314] ([Intel XE#1999]) +1 other test fail
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][315] ([Intel XE#560])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][316] ([Intel XE#4045])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][317] -> ([FAIL][318], [PASS][319]) ([Intel XE#3546])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_module_load@many-reload.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_module_load@many-reload.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][320] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][321], [FAIL][322]) ([Intel XE#1173]) +1 other test ( 2 fail )
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][323] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [PASS][324] -> [ABORT][325] ([Intel XE#1358] / [Intel XE#1794]) +1 other test abort
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@xe_pm@s2idle-basic.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [PASS][326] -> ([PASS][327], [ABORT][328]) ([Intel XE#1358])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@xe_pm@s3-exec-after.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@xe_pm@s3-exec-after.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> ([SKIP][329], [SKIP][330]) ([Intel XE#2284] / [Intel XE#366])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-exec.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][331] -> [ABORT][332] ([Intel XE#1358] / [Intel XE#1794])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][333] -> ([PASS][334], [FAIL][335]) ([Intel XE#958])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][336] ([Intel XE#944])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][337] ([Intel XE#944])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> ([SKIP][338], [SKIP][339]) ([Intel XE#1130] / [Intel XE#944])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][340] -> [SKIP][341] ([Intel XE#1130]) +222 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@xe_query@query-gt-list.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_query@query-gt-list.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][342] ([Intel XE#3342])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@munmap-style-unbind-end:
    - shard-bmg:          NOTRUN -> ([SKIP][343], [PASS][344]) ([Intel XE#1130]) +4 other tests ( 1 pass, 1 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_vm@munmap-style-unbind-end.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_vm@munmap-style-unbind-end.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-bmg:          [FAIL][345] -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@core_getversion@basic.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-4/igt@core_getversion@basic.html

  * igt@fbdev@pan:
    - shard-bmg:          [SKIP][347] ([Intel XE#2134]) -> ([PASS][348], [PASS][349])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@fbdev@pan.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@fbdev@pan.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@fbdev@pan.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][350] ([Intel XE#827]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][352] ([Intel XE#3719]) -> [PASS][353] +3 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][354] ([Intel XE#3862]) -> ([PASS][355], [PASS][356]) +1 other test ( 2 pass )
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
    - shard-lnl:          [FAIL][357] ([Intel XE#4075]) -> [PASS][358] +1 other test pass
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][359] ([Intel XE#2291]) -> [PASS][360] +1 other test pass
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][361] ([Intel XE#2291]) -> ([PASS][362], [PASS][363]) +2 other tests ( 2 pass )
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][364] ([Intel XE#1475]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][366] ([Intel XE#301]) -> ([PASS][367], [PASS][368])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [SKIP][369] ([Intel XE#2316]) -> [PASS][370] +1 other test pass
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][371] ([Intel XE#2316]) -> ([PASS][372], [PASS][373]) +1 other test ( 2 pass )
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-dg2-set2:     [INCOMPLETE][374] ([Intel XE#2049]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_flip@dpms-vs-vblank-race.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][376] -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a6.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][378] ([Intel XE#886]) -> ([PASS][379], [PASS][380]) +1 other test ( 2 pass )
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][381] ([Intel XE#4072]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a6.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][383] ([Intel XE#886]) -> [PASS][384] +1 other test pass
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][385] ([Intel XE#2882] / [Intel XE#3820]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:
    - shard-bmg:          [FAIL][387] ([Intel XE#3820]) -> [PASS][388] +1 other test pass
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][389] ([Intel XE#2571]) -> ([PASS][390], [PASS][391])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][392] ([Intel XE#899]) -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#1392]) -> [PASS][395] +2 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [ABORT][396] ([Intel XE#1358]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][398] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> ([PASS][399], [PASS][400])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][401] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@bind-once:
    - shard-bmg:          [SKIP][403] ([Intel XE#1130]) -> [PASS][404] +1 other test pass
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_vm@bind-once.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_vm@bind-once.html

  * igt@xe_vm@mixed-userptr-misaligned-binds-1611661312:
    - shard-bmg:          [SKIP][405] ([Intel XE#1130]) -> ([PASS][406], [PASS][407]) +1 other test ( 2 pass )
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][408] ([Intel XE#2233]) -> ([SKIP][409], [SKIP][410]) ([Intel XE#2233] / [Intel XE#2423])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [SKIP][411] ([Intel XE#3007]) -> ([SKIP][412], [SKIP][413]) ([Intel XE#2423])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][414] ([Intel XE#827]) -> ([SKIP][415], [PASS][416]) ([Intel XE#2423])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2550]) -> ([SKIP][418], [SKIP][419]) ([Intel XE#2550] / [Intel XE#3767]) +23 other tests ( 2 skip )
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          [SKIP][420] ([Intel XE#3768]) -> ([SKIP][421], [SKIP][422]) ([Intel XE#2423] / [Intel XE#3768])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_async_flips@invalid-async-flip-atomic.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][423] ([Intel XE#2370]) -> ([SKIP][424], [SKIP][425]) ([Intel XE#2423])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][426] ([Intel XE#2327]) -> ([SKIP][427], [SKIP][428]) ([Intel XE#2136] / [Intel XE#2327]) +4 other tests ( 2 skip )
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][429] ([Intel XE#2327]) -> ([SKIP][430], [SKIP][431]) ([Intel XE#2136])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][432] ([Intel XE#2327]) -> [SKIP][433] ([Intel XE#2136]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][434] ([Intel XE#2136] / [Intel XE#2231]) -> ([SKIP][435], [SKIP][436]) ([Intel XE#1124])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][437] ([Intel XE#607]) -> ([SKIP][438], [SKIP][439]) ([Intel XE#2136] / [Intel XE#607])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][440] ([Intel XE#610]) -> [SKIP][441] ([Intel XE#2136])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][442] ([Intel XE#1124]) -> [SKIP][443] ([Intel XE#2136]) +13 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][444] ([Intel XE#1124]) -> ([SKIP][445], [SKIP][446]) ([Intel XE#2136]) +3 other tests ( 2 skip )
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][447] ([Intel XE#1124]) -> ([SKIP][448], [SKIP][449]) ([Intel XE#1124] / [Intel XE#2136]) +19 other tests ( 2 skip )
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][450] ([Intel XE#2328]) -> ([SKIP][451], [SKIP][452]) ([Intel XE#2136]) +1 other test ( 2 skip )
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][453] ([Intel XE#610]) -> ([SKIP][454], [SKIP][455]) ([Intel XE#2136] / [Intel XE#610])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][456] ([Intel XE#2314] / [Intel XE#2894]) -> ([SKIP][457], [SKIP][458]) ([Intel XE#2314] / [Intel XE#2423] / [Intel XE#2894])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][459] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][460] ([Intel XE#2423])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][461] ([Intel XE#367]) -> [SKIP][462] ([Intel XE#2423]) +3 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][463] ([Intel XE#367]) -> ([SKIP][464], [SKIP][465]) ([Intel XE#2423] / [Intel XE#367]) +5 other tests ( 2 skip )
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][466] ([Intel XE#2887]) -> ([SKIP][467], [SKIP][468]) ([Intel XE#2136]) +7 other tests ( 2 skip )
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][469] ([Intel XE#2136] / [Intel XE#2231]) -> ([SKIP][470], [SKIP][471]) ([Intel XE#2887])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][472] ([Intel XE#2887]) -> [SKIP][473] ([Intel XE#2136]) +18 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][474] ([Intel XE#2652] / [Intel XE#787]) -> ([SKIP][475], [SKIP][476]) ([Intel XE#2136])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][478] ([Intel XE#2136])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][479] ([Intel XE#3432]) -> [SKIP][480] ([Intel XE#2136]) +2 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][481] ([Intel XE#3432]) -> ([SKIP][482], [SKIP][483]) ([Intel XE#2136])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][484] ([Intel XE#3432]) -> ([SKIP][485], [SKIP][486]) ([Intel XE#2136] / [Intel XE#3432]) +2 other tests ( 2 skip )
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][487] ([Intel XE#2887]) -> ([SKIP][488], [SKIP][489]) ([Intel XE#2136] / [Intel XE#2887]) +23 other tests ( 2 skip )
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][490] ([Intel XE#2652] / [Intel XE#787]) -> ([SKIP][491], [SKIP][492]) ([Intel XE#2136] / [Intel XE#2652] / [Intel XE#787]) +1 other test ( 2 skip )
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][493] ([Intel XE#2724]) -> ([SKIP][494], [SKIP][495]) ([Intel XE#2136])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_cdclk@mode-transition.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cdclk@mode-transition.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][496] ([Intel XE#2724]) -> ([SKIP][497], [SKIP][498]) ([Intel XE#2136] / [Intel XE#2724]) +1 other test ( 2 skip )
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][499] ([Intel XE#2325]) -> ([SKIP][500], [SKIP][501]) ([Intel XE#2325] / [Intel XE#2423]) +2 other tests ( 2 skip )
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][502] ([Intel XE#2325]) -> [SKIP][503] ([Intel XE#2423]) +4 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-red.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][504] ([Intel XE#3007]) -> ([SKIP][505], [SKIP][506]) ([Intel XE#2325] / [Intel XE#2423])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#306]) -> [SKIP][508] ([Intel XE#2423] / [i915#2575])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][509] ([Intel XE#2252]) -> ([SKIP][510], [SKIP][511]) ([Intel XE#2252] / [Intel XE#2423]) +16 other tests ( 2 skip )
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#373]) -> [SKIP][513] ([Intel XE#2423] / [i915#2575])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][514] ([Intel XE#2252]) -> [SKIP][515] ([Intel XE#2423]) +10 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][516] ([Intel XE#3007]) -> ([SKIP][517], [SKIP][518]) ([Intel XE#2252] / [Intel XE#2423])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][519] ([Intel XE#2252]) -> ([SKIP][520], [SKIP][521]) ([Intel XE#2423]) +3 other tests ( 2 skip )
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][522] ([Intel XE#1178]) -> ([SKIP][523], [SKIP][524]) ([Intel XE#2341] / [Intel XE#2423])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_content_protection@atomic.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_content_protection@atomic.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][525] ([Intel XE#2341]) -> ([SKIP][526], [SKIP][527]) ([Intel XE#2423])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_content_protection@content-type-change.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_content_protection@content-type-change.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][528] ([Intel XE#2390]) -> ([SKIP][529], [SKIP][530]) ([Intel XE#2390] / [Intel XE#2423])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][531] ([Intel XE#1178]) -> [SKIP][532] ([Intel XE#2423])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_content_protection@legacy.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][533] ([Intel XE#1178]) -> ([FAIL][534], [SKIP][535]) ([Intel XE#1178] / [Intel XE#2423])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][536] ([Intel XE#2341]) -> [SKIP][537] ([Intel XE#2423])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_content_protection@lic-type-1.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][538] ([Intel XE#2341]) -> ([SKIP][539], [SKIP][540]) ([Intel XE#2341] / [Intel XE#2423])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_content_protection@mei-interface.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_content_protection@mei-interface.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][541] ([Intel XE#1188]) -> ([SKIP][542], [SKIP][543]) ([Intel XE#2423])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_content_protection@uevent.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_content_protection@uevent.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          [SKIP][544] ([Intel XE#2320]) -> ([SKIP][545], [SKIP][546]) ([Intel XE#2423]) +2 other tests ( 2 skip )
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][547] ([Intel XE#2320]) -> ([SKIP][548], [SKIP][549]) ([Intel XE#2320] / [Intel XE#2423]) +6 other tests ( 2 skip )
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][550] ([Intel XE#2321]) -> ([SKIP][551], [SKIP][552]) ([Intel XE#2321] / [Intel XE#2423]) +1 other test ( 2 skip )
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][553] ([Intel XE#2321]) -> ([SKIP][554], [SKIP][555]) ([Intel XE#2423])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][556] ([Intel XE#2320]) -> [SKIP][557] ([Intel XE#2423]) +7 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][558] ([Intel XE#2321]) -> [SKIP][559] ([Intel XE#2423])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [SKIP][560] ([Intel XE#2291]) -> ([SKIP][561], [SKIP][562]) ([Intel XE#2423])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][563] ([Intel XE#2291]) -> [SKIP][564] ([Intel XE#2423]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][565] ([Intel XE#877]) -> ([DMESG-WARN][566], [SKIP][567]) ([Intel XE#2423] / [Intel XE#877])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][568] ([Intel XE#2286]) -> [SKIP][569] ([Intel XE#2423])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][570] ([Intel XE#2141]) -> ([FAIL][571], [SKIP][572]) ([Intel XE#2136] / [Intel XE#2141])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][573] ([Intel XE#1508]) -> [SKIP][574] ([Intel XE#2136])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][575] ([Intel XE#2425]) -> ([SKIP][576], [PASS][577]) ([Intel XE#2423])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][578] ([Intel XE#2323]) -> [SKIP][579] ([Intel XE#2423])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#307]) -> [SKIP][581] ([Intel XE#2423] / [i915#2575])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][582] ([Intel XE#2244]) -> [SKIP][583] ([Intel XE#2136]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][584] ([Intel XE#2244]) -> ([SKIP][585], [SKIP][586]) ([Intel XE#2136] / [Intel XE#2244]) +2 other tests ( 2 skip )
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][587] ([Intel XE#2244]) -> ([SKIP][588], [SKIP][589]) ([Intel XE#2136])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][590] ([Intel XE#776]) -> ([SKIP][591], [SKIP][592]) ([Intel XE#2136] / [Intel XE#776]) +1 other test ( 2 skip )
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][593] ([Intel XE#2375]) -> ([SKIP][594], [SKIP][595]) ([Intel XE#2375] / [Intel XE#2423])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][596] ([Intel XE#2374]) -> ([SKIP][597], [SKIP][598]) ([Intel XE#2374] / [Intel XE#2423])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_feature_discovery@psr2.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_feature_discovery@psr2.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][599] ([Intel XE#2882]) -> ([SKIP][600], [FAIL][601]) ([Intel XE#2423] / [Intel XE#2882])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][602] ([Intel XE#301]) -> ([FAIL][603], [PASS][604]) ([Intel XE#301])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][605] ([Intel XE#2882] / [Intel XE#3820]) -> [SKIP][606] ([Intel XE#2316])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][607] ([Intel XE#2316]) -> [SKIP][608] ([Intel XE#2423]) +2 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][609] ([Intel XE#2316]) -> ([PASS][610], [SKIP][611]) ([Intel XE#2423]) +1 other test ( 1 pass, 1 skip )
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][612] ([Intel XE#2316]) -> ([SKIP][613], [SKIP][614]) ([Intel XE#2423])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][615] ([Intel XE#2882]) -> [SKIP][616] ([Intel XE#2423])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][617] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][618] ([Intel XE#2136]) +4 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-bmg:          [SKIP][619] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][620] ([Intel XE#2136])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][621] ([Intel XE#2293] / [Intel XE#2380]) -> ([SKIP][622], [SKIP][623]) ([Intel XE#2136] / [Intel XE#2293] / [Intel XE#2380]) +10 other tests ( 2 skip )
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][624] ([Intel XE#2293] / [Intel XE#2380]) -> ([SKIP][625], [SKIP][626]) ([Intel XE#2136]) +2 other tests ( 2 skip )
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][627] ([Intel XE#2311]) -> ([SKIP][628], [SKIP][629]) ([Intel XE#2136] / [Intel XE#2311]) +45 other tests ( 2 skip )
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][630] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][631] ([Intel XE#2311])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#651]) -> [SKIP][633] ([Intel XE#2136]) +1 other test skip
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][634] ([Intel XE#2311]) -> [SKIP][635] ([Intel XE#2136]) +33 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#651]) -> [SKIP][637] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][638] ([Intel XE#2311]) -> [SKIP][639] ([Intel XE#2312]) +6 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][640] ([Intel XE#2312]) -> ([SKIP][641], [SKIP][642]) ([Intel XE#2136] / [Intel XE#2311]) +6 other tests ( 2 skip )
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][643] ([Intel XE#2312]) -> ([SKIP][644], [SKIP][645]) ([Intel XE#2136]) +5 other tests ( 2 skip )
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][646] ([Intel XE#2136] / [Intel XE#2231]) -> ([SKIP][647], [SKIP][648]) ([Intel XE#2136])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][649] ([Intel XE#2333]) -> [SKIP][650] ([Intel XE#2136]) +12 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][651] ([Intel XE#2333]) -> [SKIP][652] ([Intel XE#2312]) +4 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][653] ([Intel XE#2333]) -> ([SKIP][654], [SKIP][655]) ([Intel XE#2136] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [FAIL][656] ([Intel XE#2333]) -> ([FAIL][657], [SKIP][658]) ([Intel XE#2312] / [Intel XE#2333])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][659] ([Intel XE#2312]) -> ([FAIL][660], [SKIP][661]) ([Intel XE#2136] / [Intel XE#2333]) +1 other test ( 1 fail, 1 skip )
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][662] ([Intel XE#2312]) -> ([FAIL][663], [FAIL][664]) ([Intel XE#2333]) +2 other tests ( 2 fail )
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][665] ([Intel XE#2136] / [Intel XE#2231]) -> ([SKIP][666], [FAIL][667]) ([Intel XE#2136] / [Intel XE#2333])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][668] ([Intel XE#2333]) -> ([SKIP][669], [SKIP][670]) ([Intel XE#2136]) +5 other tests ( 2 skip )
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][671] ([Intel XE#2333]) -> ([FAIL][672], [SKIP][673]) ([Intel XE#2136] / [Intel XE#2333]) +23 other tests ( 1 fail, 1 skip )
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-bmg:          [DMESG-FAIL][674] ([Intel XE#877]) -> ([FAIL][675], [FAIL][676]) ([Intel XE#2333])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][677] ([Intel XE#2312]) -> ([SKIP][678], [SKIP][679]) ([Intel XE#2311] / [Intel XE#2312])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][680] ([Intel XE#2311]) -> ([SKIP][681], [SKIP][682]) ([Intel XE#2136] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][683] ([Intel XE#2312]) -> ([SKIP][684], [SKIP][685]) ([Intel XE#2311]) +2 other tests ( 2 skip )
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][686] ([Intel XE#2312]) -> [SKIP][687] ([Intel XE#2311])
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][688] ([Intel XE#2311]) -> ([SKIP][689], [SKIP][690]) ([Intel XE#2311] / [Intel XE#2312]) +1 other test ( 2 skip )
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][691] ([Intel XE#2311]) -> ([SKIP][692], [SKIP][693]) ([Intel XE#2136]) +10 other tests ( 2 skip )
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][694] ([Intel XE#2352]) -> [SKIP][695] ([Intel XE#2136])
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][696] ([Intel XE#2313]) -> ([SKIP][697], [SKIP][698]) ([Intel XE#2136]) +12 other tests ( 2 skip )
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][699] ([Intel XE#2313]) -> ([SKIP][700], [SKIP][701]) ([Intel XE#2136] / [Intel XE#2313]) +45 other tests ( 2 skip )
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][702] ([Intel XE#2313]) -> [SKIP][703] ([Intel XE#2312]) +4 other tests skip
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][704] ([Intel XE#2313]) -> ([SKIP][705], [SKIP][706]) ([Intel XE#2136] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][707] ([Intel XE#2312]) -> ([SKIP][708], [SKIP][709]) ([Intel XE#2136] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][710] ([Intel XE#2312]) -> [SKIP][711] ([Intel XE#2136]) +10 other tests skip
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][712] ([Intel XE#2313]) -> ([SKIP][713], [SKIP][714]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][715] ([Intel XE#2312]) -> [SKIP][716] ([Intel XE#2313]) +1 other test skip
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][717] ([Intel XE#2352]) -> ([SKIP][718], [SKIP][719]) ([Intel XE#2136] / [Intel XE#2352])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][720] ([Intel XE#2350]) -> ([SKIP][721], [SKIP][722]) ([Intel XE#2136])
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][723] ([Intel XE#2313]) -> [SKIP][724] ([Intel XE#2136]) +33 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
    - shard-dg2-set2:     [SKIP][725] ([Intel XE#653]) -> [SKIP][726] ([Intel XE#2136]) +2 other tests skip
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][727] ([Intel XE#2312]) -> ([SKIP][728], [SKIP][729]) ([Intel XE#2312] / [Intel XE#2313])
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - shard-bmg:          [SKIP][730] ([Intel XE#2312]) -> ([SKIP][731], [SKIP][732]) ([Intel XE#2313]) +2 other tests ( 2 skip )
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-rte.html
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-rte.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][733] ([Intel XE#2312]) -> ([SKIP][734], [SKIP][735]) ([Intel XE#2136] / [Intel XE#2312]) +1 other test ( 2 skip )
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][736] ([Intel XE#2340]) -> ([SKIP][737], [SKIP][738]) ([Intel XE#2340] / [Intel XE#2423])
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][739] ([Intel XE#1503]) -> ([PASS][740], [SKIP][741]) ([Intel XE#2423])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][742] ([Intel XE#346]) -> ([SKIP][743], [SKIP][744]) ([Intel XE#2136] / [Intel XE#346])
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][745] ([Intel XE#2927]) -> ([SKIP][746], [SKIP][747]) ([Intel XE#2136] / [Intel XE#2927])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][748] ([Intel XE#2501]) -> ([SKIP][749], [SKIP][750]) ([Intel XE#2423] / [Intel XE#2501])
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][751] ([Intel XE#2486]) -> ([SKIP][752], [SKIP][753]) ([Intel XE#2423] / [Intel XE#2486])
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-bmg:          [SKIP][754] ([Intel XE#3007]) -> [SKIP][755] ([Intel XE#2423]) +1 other test skip
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][756] ([Intel XE#2393]) -> [SKIP][757] ([Intel XE#2423])
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][758] ([Intel XE#2393]) -> ([SKIP][759], [SKIP][760]) ([Intel XE#2423])
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][761] ([Intel XE#2493]) -> ([SKIP][762], [SKIP][763]) ([Intel XE#2423] / [Intel XE#2493]) +1 other test ( 2 skip )
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-bmg:          [SKIP][764] ([Intel XE#3007]) -> [DMESG-WARN][765] ([Intel XE#877])
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][766] ([Intel XE#2763]) -> ([SKIP][767], [SKIP][768]) ([Intel XE#2423])
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][769] ([Intel XE#2763]) -> [SKIP][770] ([Intel XE#2423]) +2 other tests skip
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][771] ([Intel XE#2763]) -> ([SKIP][772], [SKIP][773]) ([Intel XE#2423] / [Intel XE#2763]) +7 other tests ( 2 skip )
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][774] ([Intel XE#2938]) -> ([SKIP][775], [SKIP][776]) ([Intel XE#2136])
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][777] ([Intel XE#2392]) -> [SKIP][778] ([Intel XE#2136])
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][779] ([Intel XE#3309]) -> ([SKIP][780], [SKIP][781]) ([Intel XE#2136] / [Intel XE#3309])
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][782] ([Intel XE#2392]) -> ([SKIP][783], [SKIP][784]) ([Intel XE#2136] / [Intel XE#2392])
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [FAIL][785] -> ([SKIP][786], [SKIP][787]) ([Intel XE#2446])
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_pm_rpm@basic-pci-d3-state.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][788] ([Intel XE#1439] / [Intel XE#836]) -> ([SKIP][789], [SKIP][790]) ([Intel XE#1439] / [Intel XE#2446] / [Intel XE#836])
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][791] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> ([SKIP][792], [SKIP][793]) ([Intel XE#1439] / [Intel XE#2446] / [Intel XE#3141] / [Intel XE#836]) +1 other test ( 2 skip )
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][794] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][795] ([Intel XE#2446])
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][796] ([Intel XE#1489]) -> ([SKIP][797], [SKIP][798]) ([Intel XE#2136]) +4 other tests ( 2 skip )
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][799] ([Intel XE#1489]) -> [SKIP][800] ([Intel XE#2136]) +10 other tests skip
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][801] ([Intel XE#1489]) -> ([SKIP][802], [SKIP][803]) ([Intel XE#1489] / [Intel XE#2136]) +15 other tests ( 2 skip )
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][804] ([Intel XE#1489]) -> [SKIP][805] ([Intel XE#2136])
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-435/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][806] ([Intel XE#2387]) -> ([SKIP][807], [SKIP][808]) ([Intel XE#2136] / [Intel XE#2387])
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][809] ([Intel XE#2387]) -> ([SKIP][810], [SKIP][811]) ([Intel XE#2136])
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][812] ([Intel XE#2234] / [Intel XE#2850]) -> ([SKIP][813], [SKIP][814]) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850]) +26 other tests ( 2 skip )
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][815] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][816] ([Intel XE#2136] / [Intel XE#2351])
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][817] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][818] ([Intel XE#2136]) +15 other tests skip
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][819] ([Intel XE#2234] / [Intel XE#2850]) -> ([SKIP][820], [SKIP][821]) ([Intel XE#2136]) +6 other tests ( 2 skip )
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_psr@psr2-suspend.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr@psr2-suspend.html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][822] ([Intel XE#2414]) -> ([SKIP][823], [SKIP][824]) ([Intel XE#2136])
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][825] ([Intel XE#2414]) -> ([SKIP][826], [SKIP][827]) ([Intel XE#2136] / [Intel XE#2414])
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][828] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][829] ([Intel XE#2423])
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][830] ([Intel XE#3414] / [Intel XE#3904]) -> ([SKIP][831], [SKIP][832]) ([Intel XE#2423] / [Intel XE#3414] / [Intel XE#3904]) +1 other test ( 2 skip )
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][833] ([Intel XE#2330]) -> [SKIP][834] ([Intel XE#2423]) +1 other test skip
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][835] ([Intel XE#2330]) -> ([SKIP][836], [SKIP][837]) ([Intel XE#2330] / [Intel XE#2423]) +1 other test ( 2 skip )
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][838] ([Intel XE#1127]) -> [SKIP][839] ([Intel XE#2423] / [i915#2575])
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][840] ([Intel XE#2413]) -> ([SKIP][841], [SKIP][842]) ([Intel XE#2413] / [Intel XE#2423]) +2 other tests ( 2 skip )
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][843] ([Intel XE#2413]) -> [SKIP][844] ([Intel XE#2423])
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][845] ([Intel XE#1435]) -> ([SKIP][846], [SKIP][847]) ([Intel XE#2423])
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][848] ([Intel XE#2426]) -> ([SKIP][849], [SKIP][850]) ([Intel XE#2423] / [Intel XE#2426]) +1 other test ( 2 skip )
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][851] ([Intel XE#362]) -> ([FAIL][852], [SKIP][853]) ([Intel XE#1729] / [Intel XE#362])
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][854] ([Intel XE#2450]) -> ([SKIP][855], [SKIP][856]) ([Intel XE#2423] / [Intel XE#2450])
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][857] ([Intel XE#1499]) -> ([SKIP][858], [SKIP][859]) ([Intel XE#1499] / [Intel XE#2423]) +1 other test ( 2 skip )
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_vrr@flip-dpms.html
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_vrr@flip-dpms.html
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][860] ([Intel XE#1499]) -> [SKIP][861] ([Intel XE#2423]) +1 other test skip
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_vrr@flip-suspend.html
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][862] ([Intel XE#2168]) -> [SKIP][863] ([Intel XE#2423])
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_vrr@lobf.html
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][864] ([Intel XE#1499]) -> ([SKIP][865], [SKIP][866]) ([Intel XE#2423])
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@kms_vrr@max-min.html
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_vrr@max-min.html
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][867] ([Intel XE#3007]) -> ([SKIP][868], [SKIP][869]) ([Intel XE#1499] / [Intel XE#2423])
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          [SKIP][870] ([Intel XE#756]) -> ([SKIP][871], [SKIP][872]) ([Intel XE#2423] / [Intel XE#756])
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][873] ([Intel XE#756]) -> ([SKIP][874], [SKIP][875]) ([Intel XE#2423])
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@kms_writeback@writeback-fb-id.html
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][876] ([Intel XE#756]) -> [SKIP][877] ([Intel XE#2423])
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][878] ([Intel XE#1091] / [Intel XE#2849]) -> ([SKIP][879], [SKIP][880]) ([Intel XE#2423])
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          [SKIP][881] ([Intel XE#3889]) -> [SKIP][882] ([Intel XE#1130])
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][883] ([Intel XE#2905]) -> [SKIP][884] ([Intel XE#1130]) +15 other tests skip
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][885] ([Intel XE#3889]) -> ([SKIP][886], [SKIP][887]) ([Intel XE#1130] / [Intel XE#3889])
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [886]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [887]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     [SKIP][888] ([Intel XE#2905]) -> [SKIP][889] ([Intel XE#1130])
   [888]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html
   [889]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          [SKIP][890] ([Intel XE#2905]) -> ([SKIP][891], [SKIP][892]) ([Intel XE#1130]) +3 other tests ( 2 skip )
   [890]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint.html
   [891]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_eudebug_online@set-breakpoint.html
   [892]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][893] ([Intel XE#2905]) -> ([SKIP][894], [SKIP][895]) ([Intel XE#1130] / [Intel XE#2905]) +17 other tests ( 2 skip )
   [893]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html
   [894]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html
   [895]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_balancer@once-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][896] ([Intel XE#1130]) -> ([SKIP][897], [PASS][898]) ([Intel XE#1130]) +4 other tests ( 1 pass, 1 skip )
   [896]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
   [897]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
   [898]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][899] ([Intel XE#2322]) -> ([SKIP][900], [SKIP][901]) ([Intel XE#1130] / [Intel XE#2322]) +15 other tests ( 2 skip )
   [899]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [900]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [901]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][902] ([Intel XE#2322]) -> [SKIP][903] ([Intel XE#1130]) +8 other tests skip
   [902]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [903]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][904] ([Intel XE#2322]) -> ([SKIP][905], [SKIP][906]) ([Intel XE#1130]) +3 other tests ( 2 skip )
   [904]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [905]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [906]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][907] ([Intel XE#1192]) -> [SKIP][908] ([Intel XE#2229])
   [907]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [908]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@pci-membarrier:
    - shard-bmg:          [SKIP][909] ([Intel XE#4045]) -> ([SKIP][910], [SKIP][911]) ([Intel XE#1130] / [Intel XE#4045])
   [909]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@xe_mmap@pci-membarrier.html
   [910]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_mmap@pci-membarrier.html
   [911]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-bmg:          [SKIP][912] ([Intel XE#4045]) -> [SKIP][913] ([Intel XE#1130])
   [912]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_mmap@pci-membarrier-parallel.html
   [913]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][914] ([Intel XE#586]) -> ([SKIP][915], [SKIP][916]) ([Intel XE#1130] / [Intel XE#586])
   [914]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@xe_mmap@small-bar.html
   [915]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@xe_mmap@small-bar.html
   [916]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][917] ([Intel XE#2248]) -> ([SKIP][918], [SKIP][919]) ([Intel XE#1130] / [Intel XE#2248])
   [917]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html
   [918]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [919]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     [SKIP][920] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][921] ([Intel XE#1130])
   [920]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait.html
   [921]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][922] ([Intel XE#2248]) -> [SKIP][923] ([Intel XE#1130])
   [922]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html
   [923]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][924] ([Intel XE#1420]) -> [SKIP][925] ([Intel XE#1130])
   [924]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [925]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][926] ([Intel XE#2245]) -> ([SKIP][927], [SKIP][928]) ([Intel XE#1130] / [Intel XE#2245])
   [926]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
   [927]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_pat@pat-index-xelp.html
   [928]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][929] ([Intel XE#2284]) -> ([SKIP][930], [SKIP][931]) ([Intel XE#1130])
   [929]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_pm@d3cold-mocs.html
   [930]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
   [931]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][932] ([Intel XE#2284]) -> ([SKIP][933], [SKIP][934]) ([Intel XE#1130] / [Intel XE#2284]) +4 other tests ( 2 skip )
   [932]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html
   [933]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html
   [934]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][935] ([Intel XE#579]) -> ([SKIP][936], [SKIP][937]) ([Intel XE#1130] / [Intel XE#579])
   [935]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html
   [936]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
   [937]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][938] ([Intel XE#944]) -> ([SKIP][939], [SKIP][940]) ([Intel XE#1130]) +1 other test ( 2 skip )
   [938]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html
   [939]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html
   [940]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][941] ([Intel XE#944]) -> [SKIP][942] ([Intel XE#1130]) +3 other tests skip
   [941]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [942]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][943] ([Intel XE#944]) -> ([SKIP][944], [SKIP][945]) ([Intel XE#1130] / [Intel XE#944]) +3 other tests ( 2 skip )
   [943]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [944]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html
   [945]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][946] ([Intel XE#3342]) -> [SKIP][947] ([Intel XE#1130])
   [946]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html
   [947]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][948] ([Intel XE#3342]) -> ([SKIP][949], [SKIP][950]) ([Intel XE#1130] / [Intel XE#3342])
   [948]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html
   [949]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html
   [950]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4072
  [Intel XE#4075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4075
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8193 -> IGTPW_12447
  * Linux: xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c -> xe-2496-4840e56bcc47f3af6bbc58bcc83b094540e5efa0

  IGTPW_12447: 4593317dedb4854dc0f4d7beed6cf9c68f3adeb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8193: 84511e278c1c6e598ccc21287a733cfc83d13e8a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c: 4cea1f90028925afcf1a0f8a0ef301f90349688c
  xe-2496-4840e56bcc47f3af6bbc58bcc83b094540e5efa0: 4840e56bcc47f3af6bbc58bcc83b094540e5efa0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/index.html

--===============5421087281614100835==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add xe_cg_dmem test</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143593/">https://patchwork.freedesktop.org/series/143593/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12447/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8193_full -&gt; XEIGTPW_12447_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12447_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12447_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
447_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi=
-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12447/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp=
4.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12447/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modes=
et@b-edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip@single-buffer-flip-vs-dpms-o=
ff-vs-modeset@b-edp1.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_flip@single-buffer-fli=
p-vs-dpms-off-vs-modeset@b-edp1.html">PASS</a>) +3 other tests ( 1 incomple=
te, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/s=
hard-bmg-1/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@k=
ms_flip_tiling@flip-change-tiling.html">INCOMPLETE</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_cg_dmem@functional} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_cg_dmem@functional.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sha=
rd-bmg-5/igt@xe_cg_dmem@functional.html">SKIP</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@xe_cg_dmem@functional.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sha=
rd-lnl-6/igt@xe_cg_dmem@functional.html">SKIP</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_cg_dmem@test-simple-min} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@xe_cg_dmem@test-simple-min.htm=
l">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@xe_cg_dmem@test-simple-min.html"=
>SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@xe_exec_threads@threads-cm-shar=
ed-vm-rebind.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-7/igt@xe_exec_threads@threads-cm-shared-vm-reb=
ind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_exec_threads@threads-cm-sha=
red-vm-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Int=
el XE#2882</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8193_full and XEIGTPW_12447=
_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_cg_dmem@functional:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_cg_dmem@test-simple-max:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_cg_dmem@test-simple-min:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12447_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/=
igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/s=
hard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@c=
ore_hotunplug@hotrebind-lateclose.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3=
/igt@core_hotunplug@hotreplug.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@core_hotunplug@hotreplu=
g.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/=
shard-bmg-7/igt@core_setmaster@master-drop-set-user.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@c=
ore_setmaster@master-drop-set-user.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) +2 other t=
ests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@fbdev@eof.html">PASS</a> -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@fbdev@eof.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12447/shard-bmg-5/igt@fbdev@eof.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other test=
s ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-63.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
447/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-63.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-async-flip.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-=
stride-32bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +28 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-async-flip.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-180-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sh=
ard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447=
/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@x-tiled-64bpp-rotate=
-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12447/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_big_fb@y-tiled-16bpp-rotate=
-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/=
shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_big_fb@yf-=
tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_bw@connected-linear-tiling=
-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_bw@connected-linear-tilin=
g-2-displays-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-2-displays-3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_bw@connected-linear-tiling=
-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays=
-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12447/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled=
-dg2-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12447/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-til=
ed-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-=
ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-=
tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +195 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_ccs@crc-primary=
-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_ccs@missing-ccs-bu=
ffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12447/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html=
">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12447/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to=
-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12447/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibe=
rnate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_content_protection@atomic@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_content_protection@uevent@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_cursor_crc@cursor-random-=
32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12447/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_cursor_crc@cursor-random-51=
2x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12447/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-m=
ax-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-max-size.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
320">Intel XE#2320</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-atomic-transitions.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-f=
lipb-atomic-transitions.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12447/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12447/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2291">Intel XE#2291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sha=
rd-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_dit=
her@fb-8bpc-vs-panel-6bpc.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_feature_discovery@chamelium=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-6/igt@kms_feature_discovery@chamelium.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#=
2372</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_feature_discovery@chameli=
um.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel =
XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
447/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-7/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_flip@2x=
-absolute-wf_vblank.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316">Intel XE#2316</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_flip@2x-blocking-absolute-wf=
_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12447/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdm=
i-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.h=
tml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12447/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#262=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd=
-hdmi-a2-dp2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-=
7/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +107 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/ig=
t@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check=
-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check-interr=
uptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/=
shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@k=
ms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vbl=
ank@c-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
d-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interrup=
tible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblan=
k@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblan=
k@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1244=
7/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
447/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597=
">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-435/igt@kms_flip@nonexisting-fb.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-4=
34/igt@kms_flip@nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-=
yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_flip_scaled=
_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
45">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-=
yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7=
/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@p=
ipe-a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-=
xtile-to-16bpp-xtile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_flip_scaled_crc@=
flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-=
xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@=
kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-defa=
ult-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_force_connector_basic@prun=
e-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +30 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@kms_frontbuffer_t=
racking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +31 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-=
slowdraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/653">Intel XE#653</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-sus=
pend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_hdr@bpc-switch.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_hdr@static-toggle-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_joiner@basic-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-wit=
h-pixel-format.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_plane_scaling@plan=
e-downscale-factor-0-5-with-pixel-format.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +141=
 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_plane_scaling@plane-downscal=
e-factor-0-75-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_plane_scaling@plane-upscal=
e-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-u=
pscale-factor-0-25.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-75-upscale-factor-0-25.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_scal=
ing@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>) +33 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_plane_scaling@planes-upsca=
le-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_pm_backlight@bad-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sha=
rd-bmg-3/igt@kms_pm_backlight@fade.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@=
kms_pm_rpm@basic-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_p=
m_rpm@i2c.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@i2c.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>=
) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-=
bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@le=
gacy-planes-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sh=
ard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move=
-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-a=
rea.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-u=
pdate-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1489">Intel XE#1489</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12447/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-=
sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_psr@pr-dpms.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-d=
g2-434/igt@kms_psr@pr-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr@psr-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@kms_rotation_crc@primary-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-3=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel X=
E#2168</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_cg_dmem@test-simple-max} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_cg_dmem@test-simple-max.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1244=
7/shard-bmg-7/igt@xe_cg_dmem@test-simple-max.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) =
+1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_compute_preempt@compute-pre=
empt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_eudebug@basic-vm-access-par=
ameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufence=
-delay-ack.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_eudebug@discovery-race-vmbind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_eudebug_online@breakpoint-=
many-sessions-tiles.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@xe_eudebug_online@breakpoint-ma=
ny-sessions-tiles.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_eudebug_online@interrupt-ot=
her-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_eudebug_online@single-step.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-8/igt@xe_eudebug_online@single-step.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"=
>Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-4/igt@xe_evict@evict-large-multi-vm.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-lnl-7/igt@xe_evict@evict-large-multi-vm.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_exec_balancer@many-execqueues=
-cm-parallel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel =
XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bi=
nd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1392">Intel XE#1392</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sh=
ard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12447/shard-bmg-1/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-7/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1130">Intel XE#1130</a>) +85 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@xe_exec_fault_mode@twice-user=
ptr-invalidate-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@xe_exec_fault_mode@twice-userpt=
r-invalidate-race.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-433/igt@xe_exec_fault_mode@twice-userp=
tr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-cat-error:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-463/igt@xe_exec_reset@parallel-cat-error.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sh=
ard-dg2-434/igt@xe_exec_reset@parallel-cat-error.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-w=
ritesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-=
writesip-twice.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesi=
p-twice.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_fault_injecti=
on@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) +323 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-464/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-=
464/igt@xe_gt_freq@freq_suspend.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@xe_gt_freq@freq_sus=
pend.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migra=
te_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2=
/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@xe_live_ktest@xe_dma_bu=
f.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
29">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/ig=
t@xe_live_ktest@xe_mocs.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
92">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1999">Intel XE#1999</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-435/igt@xe_media_fill@media-fill.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
60">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_mmap@pci-membarrier-parallel.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_module_load@many-reload.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg=
-7/igt@xe_module_load@many-reload.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_module_load@many=
-reload.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream=
-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@xe_peer2peer@write@write-gpua=
-vram01-gpub-system-p2p.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test ( 2 f=
ail )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-432/ig=
t@xe_pm@s2idle-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other t=
est abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-435/=
igt@xe_pm@s3-exec-after.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-dg2-432/igt@xe_pm@s3-exec-after.html">A=
BORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-exec.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1244=
7/shard-lnl-4/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel =
XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-2/=
igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-l=
nl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_pm_residency=
@toggle-gt-c6.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-3/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_query@multigpu-query-mem-us=
age.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-v=
ersion-huc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@xe_query@query-gt-list.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/ig=
t@xe_query@query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +222 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_vm@munmap-style-unbind-end.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-2/igt@xe_vm@munmap-style-unbind-end.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@core_getversion@basic.html">FAIL</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-4/igt=
@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/=
igt@fbdev@pan.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12447/shard-bmg-2/igt@fbdev@pan.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a=
-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/827">Intel XE#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_async_flips@alternate-sync=
-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3719">Intel XE#3719</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@crc-=
primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_=
ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a>) +1 o=
ther test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe=
-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4075">Intel XE#4075</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-8/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-lnl-ccs@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12447/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-leg=
acy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PA=
SS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475=
">Intel XE#1475</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-v=
blank@ac-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ac-hdmi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) +1 other test=
 ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@kms_flip@dpms-vs-vblank-race.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">I=
ntel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12447/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-436/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a6.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12447/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a6.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Int=
el XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12447/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>) +1 other tes=
t ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a6.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4072">Intel XE#4072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_flip@flip-vs-blocking-wf-vbl=
ank@a-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12447/shard-dg2-433/igt@kms_flip@flip-vs-blocking-wf-vblan=
k@b-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3820">Intel XE#3820</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_flip@flip-vs-expir=
ed-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3820">Intel XE#3820</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_flip@flip-vs-expired-v=
blank-interruptible@b-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12447/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexec=
queue.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#13=
58</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
447/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Int=
el XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-lnl-5/igt@xe_pm@s4-basic-exec.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-=
lnl-6/igt@xe_pm@s4-basic-exec.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#=
1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12447/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_vm@bind-once.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-b=
mg-6/igt@xe_vm@bind-once.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-misaligned-binds-1611661312:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_vm@mixed-userptr-misaligned-bi=
nds-1611661312.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-bmg-3/igt@xe_vm@mixed-userptr-misaligned-binds-1=
611661312.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2233">Intel XE#2233</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-smal=
l-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2233">Intel XE#2233</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE=
#3007</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12447/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt=
@kms_addfb_basic@bad-pitch-999.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/82=
7">Intel XE#827</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12447/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-even=
ts@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms=
_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1244=
7/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b=
-hdmi-a-6-4-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +23 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_async_flips@invalid-async-flip-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
68">Intel XE#3768</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12447/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atom=
ic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_at=
omic_transition@plane-all-modeset-transition-fencing-internal-panels.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/=
shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-=
internal-panels.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Inte=
l XE#2327</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Inte=
l XE#2327</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12447/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-b=
mg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2231">Intel XE#2231</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate=
-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/607">Intel XE#607</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-=
overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflo=
w.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">=
Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-=
hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@y-tile=
d-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-18=
0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@y-tiled-m=
ax-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big_fb@y=
-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#232=
8</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
447/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_big=
_fb@yf-tiled-addfb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"=
>Intel XE#610</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_bw@connect=
ed-linear-tiling-3-displays-1920x1080p.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_bw@connect=
ed-linear-tiling-3-displays-1920x1080p.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/289=
4">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_bw@connecte=
d-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12447/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-1920x108=
0p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/367">Intel XE#367</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2887">Intel XE#2887</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-=
mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_ccs@ccs-on-an=
other-bo-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_ccs@ccs-on-anoth=
er-bo-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-primary-=
rotation-180-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-rota=
tion-180-4-tiled-lnl-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-r=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_ccs@crc-prim=
ary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled=
-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tile=
d-dg2-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-=
rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/343=
2">Intel XE#3432</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3432">Intel XE#3432</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-c=
cs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +23=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652=
">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#272=
4</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
447/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cdc=
lk@mode-transition.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">=
Intel XE#2724</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447=
/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#=
2325</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@k=
ms_chamelium_color@ctm-0-50.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">In=
tel XE#2325</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">I=
ntel XE#3007</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/s=
hard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#232=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#=
306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
252">Intel XE#2252</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-=
list.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2252">Intel XE#2252</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2423">Intel XE#2423</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-n=
on-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-s=
tress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"=
>Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007"=
>Intel XE#3007</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel =
XE#2252</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"=
>Intel XE#2252</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm-disable.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12447/shard-bmg-7/igt@kms_content_protection@atomic.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt=
@kms_content_protection@atomic.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
341">Intel XE#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_content_protection@content-type-ch=
ange.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-7/igt@kms_content_protection@content-type-change.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">I=
ntel XE#2390</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/s=
hard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#239=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12447/shard-bmg-8/igt@kms_content_protection@lic-type-0.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-b=
mg-1/igt@kms_content_protection@lic-type-0.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_content_protection@lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-7/igt@kms_content_protection@lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">I=
ntel XE#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-2/igt@kms_content_protection@mei-interface.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/s=
hard-bmg-7/igt@kms_content_protection@mei-interface.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12447/shard-bmg-7/igt@kms_content_protection@uevent.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt=
@kms_content_protection@uevent.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">=
Intel XE#2320</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447=
/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">I=
ntel XE#2321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/s=
hard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#232=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">I=
ntel XE#2321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/s=
hard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12447/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">=
Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-at=
omic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/877">Intel XE#877</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-=
toggle.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggl=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@k=
ms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE=
#2141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12447/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt=
@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE=
#1508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">=
Intel XE#2425</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447=
/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2323">Intel XE#2323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-n=
egative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/307">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_display_modes@mst-extended-mode=
-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">In=
tel XE#2244</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel =
XE#2244</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12447/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7=
/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4">Intel XE#2244</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776<=
/a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1244=
7/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_fbcon=
_fbt@psr-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) +1 other test ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#=
2375</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@k=
ms_feature_discovery@dp-mst.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#23=
74</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_f=
eature_discovery@psr2.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2882">Intel XE#2882</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank-interruptible.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">In=
tel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sha=
rd-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3820">Intel XE#3820</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_flip@2x-flip-vs=
-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_flip@2x-single-buffer-f=
lip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@2x-single-buffer-=
flip-vs-dpms-off-vs-modeset.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-inter=
ruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel =
XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-y=
ftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@k=
ms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_=
flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@k=
ms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shar=
d-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscali=
ng.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +10 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@k=
ms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-=
bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_trac=
king@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuf=
fer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"=
>Intel XE#2311</a>) +45 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-sh=
rfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_frontbuffer=
_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2311">Intel XE#2311</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@=
kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
gflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-p=
gflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-move.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2333">Intel XE#2333</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-cur-indfb-move.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_frontbuffer_t=
racking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2333">Intel XE#2333</a>) +1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-msflip-blt.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-msflip-blt.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 ot=
her tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_front=
buffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_=
frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
33">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_t=
racking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2333">Intel XE#2333</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) +23 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.htm=
l">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/877">Intel XE#877</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb=
565-draw-blt.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw=
-blt.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)=
 +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shr=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
1">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
52">Intel XE#2352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffe=
r_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
6">Intel XE#2136</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffe=
r_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Inte=
l XE#2313</a>) +45 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
312">Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/235=
2">Intel XE#2352</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350"=
>Intel XE#2350</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other te=
sts skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">In=
tel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12447/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sha=
rd-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2=
340</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12447/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@k=
ms_getfb@getfb2-accept-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sh=
ard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_hdr@invalid-hdr=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#34=
6</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
447/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_j=
oiner@basic-big-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE=
#2927</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12447/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt=
@kms_joiner@basic-ultra-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2501">Intel XE#2501</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pi=
pe-crc-check.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc=
-check.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel=
 XE#2486</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg=
-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2=
486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_plane_alpha_blend@constant-alpha-max.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/300=
7">Intel XE#3007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-max.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#239=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#23=
93</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_p=
lane_lowres@tiling-yf.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#=
2493</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12447/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@k=
ms_plane_multiple@tiling-yf.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-wi=
th-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_plane_scaling@=
plane-downscale-factor-0-75-with-pixel-format.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2763">Intel XE#2763</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_plane_scaling@pla=
nes-upscale-20x20-downscale-factor-0-5.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_scal=
ing@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_scaling@pla=
nes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_plane_scali=
ng@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@k=
ms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2763">Intel XE#2763</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">=
Intel XE#2938</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447=
/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE=
#3309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12447/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt=
@kms_pm_dc@dc5-retention-flops.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shar=
d-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-=
bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_pm_rpm@ba=
sic-pci-d3-state.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel =
XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/836">Intel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447=
/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446"=
>Intel XE#2446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141"=
>Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/836">Intel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/=
shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2=
446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
41">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/836">Intel XE#836</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439"=
>Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_pm_rpm@modese=
t-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489">Intel XE#1489</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf=
-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-e=
xceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr2_sf@psr2-ov=
erlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1489">Intel XE#1489</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-mov=
e-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-435/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-a=
rea-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_psr2_sf@psr2-prim=
ary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#23=
87</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_p=
sr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel X=
E#2387</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/i=
gt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#223=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12447/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg=
-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a>) +26 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE=
#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-7/igt@kms_psr@psr2-suspend.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@k=
ms_psr@psr2-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2414">Intel XE#2414</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2414">Intel XE#2414</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-bmg-5/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Inte=
l XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_rotation_crc@primary-rotat=
ion-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2330">Intel XE#2330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-refl=
ect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2330">Intel XE#2330</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12447/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect=
-x-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">=
Intel XE#2413</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447=
/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#=
2413</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
413">Intel XE#2413</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12447/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-asp=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">In=
tel XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12447/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sha=
rd-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/s=
hard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426=
">Intel XE#2426</a>) +1 other test ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12447/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447=
/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE=
#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel X=
E#2450</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/i=
gt@kms_tv_load_detect@load-detect.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shar=
d-bmg-7/igt@kms_vrr@flip-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@kms_vrr@flip-dpms.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2423">Intel XE#2423</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sh=
ard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-=
1/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-=
bmg-1/igt@kms_vrr@max-min.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Int=
el XE#3007</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard=
-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-1/igt@kms_writeback@writeback-check-outp=
ut-xrgb2101010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-bmg-3/igt@kms_writeback@writeback-check-output-x=
rgb2101010.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#=
756</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12447/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@k=
ms_writeback@writeback-fb-id.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">I=
ntel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">I=
ntel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2849">Intel XE#2849</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12447/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@xe_eudebug@basic-vm-access-parameters-userptr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3889">Intel XE#3889</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_eudebug@basic-vm-access-parameter=
s-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/38=
89">Intel XE#3889</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12447/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconne=
ct.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">I=
ntel XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12447/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel=
 XE#2905</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-7/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg=
-1/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel=
 XE#2905</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12447/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg=
-5/igt@xe_eudebug_online@stopped-thread.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2=
905</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_exec_balancer@once-parallel-userptr-invalidat=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_exec_balancer@once-parallel-=
userptr-invalidate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_exec_balancer@once-parallel-use=
rptr-invalidate.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userpt=
r-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_exec_basic@multig=
pu-once-bindexecqueue-userptr-invalidate.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-6/igt@xe_exec_basi=
c@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322"=
>Intel XE#2322</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userpt=
r-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_exec_basic@multigpu-on=
ce-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322=
">Intel XE#2322</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12447/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Int=
el XE#1130</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/sha=
rd-bmg-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-2/igt@xe_mmap@pci-membarrier.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_mmap@pci=
-membarrier.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel =
XE#4045</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-bmg-1/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-=
bmg-5/igt@xe_mmap@small-bar.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-1/igt@xe_mmap@small-bar.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
47/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-8/igt@xe_oa@oa-t=
lb-invalidate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12447/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248"=
>Intel XE#2248</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12447/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1244=
7/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/=
shard-bmg-6/igt@xe_pat@pat-index-xelp.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_pat@pat-inde=
x-xelp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shar=
d-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_pm@d3cold-mocs.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#22=
84</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_pm=
@s3-d3cold-basic-exec.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +4 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#57=
9</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
447/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-2/igt@xe_pm=
@vram-d3cold-threshold.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12447/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg=
-1/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 o=
ther test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/94=
4">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12447/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12447/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg=
-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#9=
44</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel =
XE#3342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12447/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8193/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#33=
42</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2447/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12447/shard-bmg-7/igt@xe_sr=
iov_flr@flr-vf1-clear.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8193 -&gt; IGTPW_12447</li>
<li>Linux: xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c -&gt; xe-2496-4=
840e56bcc47f3af6bbc58bcc83b094540e5efa0</li>
</ul>
<p>IGTPW_12447: 4593317dedb4854dc0f4d7beed6cf9c68f3adeb8 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8193: 84511e278c1c6e598ccc21287a733cfc83d13e8a @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c: 4cea1f90028925afcf1a0f8=
a0ef301f90349688c<br />
  xe-2496-4840e56bcc47f3af6bbc58bcc83b094540e5efa0: 4840e56bcc47f3af6bbc58b=
cc83b094540e5efa0</p>

</body>
</html>

--===============5421087281614100835==--
