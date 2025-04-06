Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F27DC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 20:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255F410E0F0;
	Sun,  6 Apr 2025 20:30:54 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CDB10E0F0;
 Sun,  6 Apr 2025 20:30:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7548332443109756636=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fvm=3A_Fix?=
 =?utf-8?q?_typos_and_clarify_ENOBUFS_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 20:30:52 -0000
Message-ID: <174397145244.41292.2147609609009438277@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328194703.2763203-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20250328194703.2763203-1-jagmeet.randhawa@intel.com>
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

--===============7548332443109756636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Fix typos and clarify ENOBUFS error
URL   : https://patchwork.freedesktop.org/series/146983/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8292_FULL -> XEIGTPW_12883_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12883_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12883_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12883_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][2] -> ([PASS][3], [INCOMPLETE][4]) +1 other test ( 1 incomplete, 1 pass )
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_lowres@tiling-4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][5] -> ([DMESG-WARN][6], [PASS][7])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-bmg:          [INCOMPLETE][8] -> ([INCOMPLETE][9], [FAIL][10]) ([Intel XE#1178]) +1 other test ( 1 fail, 1 incomplete )
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_content_protection@srm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_content_protection@srm.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12883_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#4173]) +2 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-6/igt@core_hotunplug@hotreplug.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-1/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#3767]) +15 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([PASS][16], [INCOMPLETE][17]) ([Intel XE#3225])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#2327])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][20], [SKIP][21]) ([Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#610])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#610])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#1124]) +5 other tests ( 2 skip )
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#1124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][34] -> ([SKIP][35], [PASS][36]) ([Intel XE#2314] / [Intel XE#2894])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][37] -> ([SKIP][38], [PASS][39]) ([Intel XE#2191]) +2 other tests ( 1 pass, 1 skip )
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#2314] / [Intel XE#2894])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][42], [SKIP][43]) ([Intel XE#2191])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#2191])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2191]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#367])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][48], [SKIP][49]) ([Intel XE#787]) +22 other tests ( 2 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][50], [SKIP][51]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#787]) +222 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2887])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2887]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#3432])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455] / [Intel XE#787]) +42 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#2907])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][65] -> ([PASS][66], [INCOMPLETE][67]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][68], [SKIP][69]) ([Intel XE#2887]) +8 other tests ( 2 skip )
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [PASS][70] -> ([INCOMPLETE][71], [INCOMPLETE][72]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][73] -> ([PASS][74], [INCOMPLETE][75]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][76] -> [INCOMPLETE][77] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][78], [PASS][79]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#4417]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#4416]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2325])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#2325])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_chamelium_color@degamma.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#306])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_chamelium_color@degamma.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#373]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2252]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][89], [SKIP][90]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> ([SKIP][91], [SKIP][92]) ([Intel XE#373])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> ([SKIP][93], [SKIP][94]) ([Intel XE#2252]) +1 other test ( 2 skip )
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][95], [SKIP][96]) ([Intel XE#307])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          NOTRUN -> ([SKIP][97], [SKIP][98]) ([Intel XE#2390])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][99], [FAIL][100]) ([Intel XE#1178])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#2321]) +1 other test ( 2 skip )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#308])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-lnl:          NOTRUN -> ([SKIP][104], [SKIP][105]) ([Intel XE#2321])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> ([SKIP][106], [SKIP][107]) ([Intel XE#2320]) +3 other tests ( 2 skip )
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][108] -> ([SKIP][109], [SKIP][110]) ([Intel XE#309])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][111] -> ([SKIP][112], [PASS][113]) ([Intel XE#309]) +2 other tests ( 1 pass, 1 skip )
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#2291])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#309]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#309]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][119] -> ([SKIP][120], [PASS][121]) ([Intel XE#2291]) +3 other tests ( 1 pass, 1 skip )
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#309]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2291])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][124], [SKIP][125]) ([Intel XE#309])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][126] -> ([SKIP][127], [SKIP][128]) ([Intel XE#2291])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#323])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][130], [SKIP][131]) ([Intel XE#1508])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][132] -> ([SKIP][133], [PASS][134]) ([Intel XE#455]) +1 other test ( 1 pass, 1 skip )
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#4354])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][136] -> ([PASS][137], [SKIP][138]) ([Intel XE#4294])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#455]) +7 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          NOTRUN -> ([SKIP][140], [SKIP][141]) ([Intel XE#2244])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> ([SKIP][142], [SKIP][143]) ([Intel XE#776])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][144], [SKIP][145]) ([Intel XE#776])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][146] -> ([PASS][147], [FAIL][148]) ([Intel XE#4164])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> ([SKIP][149], [SKIP][150]) ([Intel XE#2373])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_feature_discovery@display-3x.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#2374])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_feature_discovery@psr2.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#1135])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_feature_discovery@psr2.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> ([PASS][155], [SKIP][156]) ([Intel XE#310])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-lnl:          NOTRUN -> ([SKIP][157], [SKIP][158]) ([Intel XE#1421])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][159] -> ([SKIP][160], [PASS][161]) ([Intel XE#310]) +6 other tests ( 1 pass, 1 skip )
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1421]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          NOTRUN -> ([PASS][163], [SKIP][164]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][165] -> [SKIP][166] ([Intel XE#310]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][167], [FAIL][168]) ([Intel XE#3321]) +1 other test ( 2 fail )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][169], [FAIL][170]) ([Intel XE#3321])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][171] -> ([FAIL][172], [PASS][173]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][174] ([Intel XE#3321]) +2 other tests fail
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [PASS][175] -> [SKIP][176] ([Intel XE#2316]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2316])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][178], [SKIP][179]) ([Intel XE#310]) +1 other test ( 2 skip )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][180] -> ([SKIP][181], [SKIP][182]) ([Intel XE#2316])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][183] -> ([PASS][184], [SKIP][185]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][186] -> ([FAIL][187], [PASS][188]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][189] -> ([FAIL][190], [PASS][191]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][192] -> [FAIL][193] ([Intel XE#301]) +4 other tests fail
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][194] -> ([FAIL][195], [PASS][196]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][197] -> [FAIL][198] ([Intel XE#3321]) +1 other test fail
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][199] -> ([INCOMPLETE][200], [PASS][201]) ([Intel XE#2049] / [Intel XE#2597])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][202] -> [INCOMPLETE][203] ([Intel XE#2049] / [Intel XE#2597])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][204] -> [DMESG-WARN][205] ([Intel XE#2953] / [Intel XE#4173])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [PASS][206] -> [FAIL][207] ([Intel XE#886]) +1 other test fail
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][208] -> ([PASS][209], [FAIL][210]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2293]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][213], [SKIP][214]) ([Intel XE#2293] / [Intel XE#2380])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][215], [SKIP][216]) ([Intel XE#2293])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][217], [SKIP][218]) ([Intel XE#1401] / [Intel XE#1745])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][219], [SKIP][220]) ([Intel XE#1401])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][221] -> [DMESG-FAIL][222] ([Intel XE#4543]) +1 other test dmesg-fail
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][223], [SKIP][224]) ([Intel XE#651]) +5 other tests ( 2 skip )
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][225], [SKIP][226]) ([Intel XE#2311] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#2311]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#651] / [Intel XE#656]) +3 other tests ( 2 skip )
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#2311]) +15 other tests ( 2 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][232] ([Intel XE#651]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [PASS][233] -> [SKIP][234] ([Intel XE#656])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][235] -> ([PASS][236], [SKIP][237]) ([Intel XE#656]) +10 other tests ( 1 pass, 1 skip )
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [PASS][238] -> ([SKIP][239], [SKIP][240]) ([Intel XE#656])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#4141]) +7 other tests ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][243], [PASS][244]) ([Intel XE#656]) +4 other tests ( 1 pass, 1 skip )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][245] ([Intel XE#656]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][246] ([Intel XE#656]) +7 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#2312] / [Intel XE#4141])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#4141]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#651]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][253], [SKIP][254]) ([Intel XE#651])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#653]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#2313]) +11 other tests ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#656]) +5 other tests ( 2 skip )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][260], [SKIP][261]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][262] ([Intel XE#2313]) +5 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][263], [SKIP][264]) ([Intel XE#653]) +7 other tests ( 2 skip )
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][265], [SKIP][266]) ([Intel XE#653] / [Intel XE#656]) +6 other tests ( 2 skip )
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][267] ([Intel XE#2312])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][268], [SKIP][269]) ([Intel XE#2312])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#455]) +7 other tests ( 2 skip )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_hdr@brightness-with-hdr.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> ([SKIP][272], [SKIP][273]) ([Intel XE#3374] / [Intel XE#3544])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][274] -> ([SKIP][275], [SKIP][276]) ([Intel XE#455])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][277] -> ([SKIP][278], [PASS][279]) ([Intel XE#1503]) +1 other test ( 1 pass, 1 skip )
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#1450]) +1 other test ( 2 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][282], [SKIP][283]) ([Intel XE#1450] / [Intel XE#2568]) +1 other test ( 2 skip )
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][284] -> ([PASS][285], [SKIP][286]) ([Intel XE#3012])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][287] ([Intel XE#616]) +3 other tests fail
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][288], [PASS][289]) ([Intel XE#616]) +1 other test ( 1 fail, 1 pass )
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][290] -> ([SKIP][291], [PASS][292]) ([Intel XE#4596])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][293] ([Intel XE#4212]) +1 other test dmesg-warn
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][294] ([Intel XE#4540])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][295] ([Intel XE#2763]) +5 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][296] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> ([SKIP][297], [SKIP][298]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> ([SKIP][299], [SKIP][300]) ([Intel XE#2763]) +9 other tests ( 2 skip )
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][301], [SKIP][302]) ([Intel XE#870]) +1 other test ( 2 skip )
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_pm_backlight@fade.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([Intel XE#870])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][305] ([Intel XE#1430])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#908])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][307] -> [SKIP][308] ([Intel XE#836])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][309] ([Intel XE#1439] / [Intel XE#3141])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][310] ([Intel XE#2893]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][311] ([Intel XE#1489]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][312] ([Intel XE#1489]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][313], [SKIP][314]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][315], [SKIP][316]) ([Intel XE#1489]) +4 other tests ( 2 skip )
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> ([SKIP][317], [SKIP][318]) ([Intel XE#2387])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][319] ([Intel XE#1122])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][320], [SKIP][321]) ([Intel XE#2850] / [Intel XE#929]) +2 other tests ( 2 skip )
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_psr@fbc-pr-primary-render.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][322] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][323] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([Intel XE#1406])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_psr@pr-cursor-render.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> ([SKIP][326], [SKIP][327]) ([Intel XE#2234] / [Intel XE#2850]) +3 other tests ( 2 skip )
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][328] ([Intel XE#2414])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][329] ([Intel XE#2939])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][330], [SKIP][331]) ([Intel XE#3414] / [Intel XE#3904])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][332] -> ([FAIL][333], [PASS][334]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_setmode@basic.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_setmode@basic.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][335] -> ([FAIL][336], [PASS][337]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][338] -> ([PASS][339], [SKIP][340]) ([Intel XE#1435])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][341] -> ([PASS][342], [FAIL][343]) ([Intel XE#899])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][344], [SKIP][345]) ([Intel XE#1499])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_vrr@flip-basic-fastset.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][346] -> [SKIP][347] ([Intel XE#455])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_vrr@negative-basic.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][348] ([Intel XE#1499])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> ([SKIP][349], [SKIP][350]) ([Intel XE#756])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_writeback@writeback-check-output.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][351] ([Intel XE#756])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][352], [SKIP][353]) ([Intel XE#1091] / [Intel XE#2849])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> ([SKIP][354], [SKIP][355]) ([Intel XE#1091] / [Intel XE#2849])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][356] -> ([PASS][357], [FAIL][358]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][359], [SKIP][360]) ([Intel XE#1126])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-lnl:          NOTRUN -> ([SKIP][361], [SKIP][362]) ([Intel XE#2905])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-extended.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][363], [SKIP][364]) ([Intel XE#2905] / [Intel XE#3889])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][365] ([Intel XE#2905]) +4 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> ([SKIP][366], [SKIP][367]) ([Intel XE#2905]) +8 other tests ( 2 skip )
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@xe_eudebug_online@resume-one.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_eudebug_online@resume-one.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][368] ([Intel XE#2905]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#4518])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][371], [SKIP][372]) ([Intel XE#4518])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large:
    - shard-lnl:          NOTRUN -> ([SKIP][373], [SKIP][374]) ([Intel XE#688])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@xe_evict@evict-beng-large.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_evict@evict-beng-large.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][375] ([Intel XE#688]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][376] -> [SKIP][377] ([Intel XE#1392]) +4 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][378], [SKIP][379]) ([Intel XE#1392])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][380] ([Intel XE#1392])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][381], [SKIP][382]) ([Intel XE#2322]) +4 other tests ( 2 skip )
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][383], [SKIP][384]) ([Intel XE#1392])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][385] ([Intel XE#2322]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][386] -> ([SKIP][387], [SKIP][388]) ([Intel XE#1392])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> ([PASS][389], [SKIP][390]) ([Intel XE#1392])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][391] -> ([SKIP][392], [PASS][393]) ([Intel XE#1392]) +3 other tests ( 1 pass, 1 skip )
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][394], [SKIP][395]) ([Intel XE#288]) +12 other tests ( 2 skip )
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][396] ([Intel XE#288]) +7 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][397], [SKIP][398]) ([Intel XE#2905]) +4 other tests ( 2 skip )
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][399] -> ([DMESG-WARN][400], [PASS][401]) ([Intel XE#3876])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][402], [SKIP][403]) ([Intel XE#378])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_module_load@force-load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][404] ([Intel XE#2541] / [Intel XE#3573])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][405] ([Intel XE#2248])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][406], [SKIP][407]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_oa@syncs-syncobj-none.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][408] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][409], [SKIP][410]) ([Intel XE#2541] / [Intel XE#3573]) +2 other tests ( 2 skip )
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> ([SKIP][411], [SKIP][412]) ([Intel XE#2427])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@xe_peer2peer@write.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][413], [SKIP][414]) ([Intel XE#2284] / [Intel XE#366])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> ([SKIP][415], [SKIP][416]) ([Intel XE#2284])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][417], [SKIP][418]) ([Intel XE#2284])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][419] ([Intel XE#584])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][420] -> [ABORT][421] ([Intel XE#1794])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@xe_pm@s4-basic.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][422] -> ([ABORT][423], [PASS][424]) ([Intel XE#1794])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-7/igt@xe_pm@s4-mocs.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> ([SKIP][425], [SKIP][426]) ([Intel XE#944])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> ([SKIP][427], [SKIP][428]) ([Intel XE#944]) +2 other tests ( 2 skip )
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][429], [SKIP][430]) ([Intel XE#944])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][431] ([Intel XE#944]) +2 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> ([SKIP][432], [SKIP][433]) ([Intel XE#4130])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][434], [SKIP][435]) ([Intel XE#4130])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-lnl:          NOTRUN -> [SKIP][436] ([Intel XE#4130])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> ([SKIP][437], [SKIP][438]) ([Intel XE#4273])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-lnl:          NOTRUN -> [SKIP][439] ([Intel XE#4351])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2191]) -> ([PASS][441], [PASS][442])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][443] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][445] ([Intel XE#3862]) -> ([PASS][446], [PASS][447]) +1 other test ( 2 pass )
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][448] ([Intel XE#2291]) -> ([PASS][449], [PASS][450]) +2 other tests ( 2 pass )
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#309]) -> ([PASS][452], [PASS][453])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#309]) -> [PASS][455]
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][456] ([Intel XE#2291]) -> [PASS][457]
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-bmg:          [INCOMPLETE][458] ([Intel XE#3226]) -> [PASS][459] +1 other test pass
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][460] ([Intel XE#3009]) -> ([PASS][461], [PASS][462])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_dp_aux_dev.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#702]) -> ([PASS][464], [PASS][465])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_feature_discovery@display-2x.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][466] ([Intel XE#2316]) -> ([PASS][467], [PASS][468]) +4 other tests ( 2 pass )
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][469] ([Intel XE#301]) -> ([PASS][470], [PASS][471])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#310]) -> [PASS][473] +2 other tests pass
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][474] ([Intel XE#2316]) -> [PASS][475]
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#310]) -> ([PASS][477], [PASS][478]) +3 other tests ( 2 pass )
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][479] ([Intel XE#301]) -> [PASS][480]
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][481] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][482]
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][483] ([Intel XE#4543]) -> [PASS][484]
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#656]) -> [PASS][486]
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][487] ([Intel XE#1503]) -> [PASS][488]
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][489] ([Intel XE#3012]) -> ([PASS][490], [PASS][491])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-adlp:         [DMESG-WARN][492] ([Intel XE#4173]) -> [PASS][493] +1 other test pass
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][494] ([Intel XE#1435]) -> ([PASS][495], [PASS][496])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][497] ([Intel XE#1499]) -> ([PASS][498], [PASS][499])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_vrr@negative-basic.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451:
    - shard-dg2-set2:     [INCOMPLETE][500] -> ([PASS][501], [PASS][502]) +1 other test ( 2 pass )
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1392]) -> ([PASS][504], [PASS][505])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#1392]) -> [PASS][507]
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [FAIL][508] ([Intel XE#4541]) -> ([PASS][509], [PASS][510])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@xe_oa@buffer-size.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@xe_oa@buffer-size.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@xe_oa@buffer-size.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#787]) -> ([SKIP][512], [SKIP][513]) ([Intel XE#455] / [Intel XE#787]) +11 other tests ( 2 skip )
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#787]) -> [SKIP][515] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][517] ([Intel XE#787]) +2 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [INCOMPLETE][518] ([Intel XE#4132]) -> ([SKIP][519], [FAIL][520]) ([Intel XE#1178] / [Intel XE#2341])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_content_protection@atomic.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][521] ([Intel XE#4132]) -> [FAIL][522] ([Intel XE#1178])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][523] ([Intel XE#1178]) -> ([SKIP][524], [FAIL][525]) ([Intel XE#1178] / [Intel XE#2341])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_content_protection@legacy.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_content_protection@legacy.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][526] ([Intel XE#1178]) -> ([SKIP][527], [FAIL][528]) ([Intel XE#1178] / [Intel XE#455])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [SKIP][529] ([Intel XE#2341]) -> ([FAIL][530], [FAIL][531]) ([Intel XE#1178])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [INCOMPLETE][532] ([Intel XE#4132]) -> ([SKIP][533], [FAIL][534]) ([Intel XE#1178] / [Intel XE#455])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_content_protection@srm.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][535] ([Intel XE#4132]) -> [FAIL][536] ([Intel XE#1178])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#309]) -> ([SKIP][538], [PASS][539]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][540] ([Intel XE#2291]) -> ([SKIP][541], [PASS][542]) ([Intel XE#2291])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][543] ([i915#3804]) -> ([SKIP][544], [SKIP][545]) ([Intel XE#455] / [i915#3804])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-bmg:          [SKIP][546] ([Intel XE#2316]) -> ([PASS][547], [SKIP][548]) ([Intel XE#2316])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][549] ([Intel XE#301]) -> ([PASS][550], [FAIL][551]) ([Intel XE#301])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][552] ([Intel XE#2316]) -> ([FAIL][553], [FAIL][554]) ([Intel XE#3321])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][555] ([Intel XE#301]) -> ([SKIP][556], [SKIP][557]) ([Intel XE#310])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][558] -> [TIMEOUT][559] ([Intel XE#1504]) +1 other test timeout
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][560] ([Intel XE#4543]) -> [DMESG-FAIL][561] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][562] ([Intel XE#2312]) -> ([SKIP][563], [SKIP][564]) ([Intel XE#2311] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#656]) -> ([SKIP][566], [SKIP][567]) ([Intel XE#651] / [Intel XE#656])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][568] ([Intel XE#2311]) -> ([SKIP][569], [SKIP][570]) ([Intel XE#2311] / [Intel XE#2312]) +16 other tests ( 2 skip )
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][571] ([Intel XE#2312]) -> ([SKIP][572], [SKIP][573]) ([Intel XE#2311]) +7 other tests ( 2 skip )
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#651]) -> ([SKIP][575], [SKIP][576]) ([Intel XE#651] / [Intel XE#656]) +18 other tests ( 2 skip )
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#656]) -> ([PASS][578], [SKIP][579]) ([Intel XE#656])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][580] ([Intel XE#4141]) -> ([SKIP][581], [SKIP][582]) ([Intel XE#2312])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][583] ([Intel XE#4141]) -> ([SKIP][584], [SKIP][585]) ([Intel XE#2312] / [Intel XE#4141]) +5 other tests ( 2 skip )
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][586] ([Intel XE#2312]) -> ([SKIP][587], [SKIP][588]) ([Intel XE#4141]) +7 other tests ( 2 skip )
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][589] ([Intel XE#2312]) -> [SKIP][590] ([Intel XE#2311]) +5 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#656]) -> [SKIP][592] ([Intel XE#651]) +4 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][593] ([Intel XE#2311]) -> ([SKIP][594], [SKIP][595]) ([Intel XE#2312])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#651]) -> ([SKIP][597], [SKIP][598]) ([Intel XE#656]) +3 other tests ( 2 skip )
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#651]) -> [SKIP][600] ([Intel XE#656]) +1 other test skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#656]) -> ([SKIP][602], [SKIP][603]) ([Intel XE#651]) +2 other tests ( 2 skip )
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][604] ([Intel XE#2312]) -> ([SKIP][605], [SKIP][606]) ([Intel XE#2313]) +13 other tests ( 2 skip )
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#653]) -> ([SKIP][608], [SKIP][609]) ([Intel XE#653] / [Intel XE#656]) +13 other tests ( 2 skip )
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][610] ([Intel XE#2312]) -> ([SKIP][611], [SKIP][612]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][613] ([Intel XE#2313]) -> ([SKIP][614], [SKIP][615]) ([Intel XE#2312])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][616] ([Intel XE#2313]) -> ([SKIP][617], [SKIP][618]) ([Intel XE#2312] / [Intel XE#2313]) +14 other tests ( 2 skip )
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#656]) -> [SKIP][620] ([Intel XE#653]) +2 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#653]) -> [SKIP][622] ([Intel XE#656]) +3 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#656]) -> ([SKIP][624], [SKIP][625]) ([Intel XE#653]) +2 other tests ( 2 skip )
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][626] ([Intel XE#656]) -> ([SKIP][627], [SKIP][628]) ([Intel XE#653] / [Intel XE#656]) +1 other test ( 2 skip )
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][629] ([Intel XE#2313]) -> [SKIP][630] ([Intel XE#2312]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][631] ([Intel XE#2312]) -> [SKIP][632] ([Intel XE#2313]) +3 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#653]) -> ([SKIP][634], [SKIP][635]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][636] ([Intel XE#1503]) -> ([PASS][637], [SKIP][638]) ([Intel XE#1503])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#4596]) -> ([PASS][640], [SKIP][641]) ([Intel XE#4596])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-4.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][642] ([Intel XE#455]) -> ([SKIP][643], [SKIP][644]) ([Intel XE#455] / [Intel XE#4596])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][645] ([Intel XE#4596]) -> ([SKIP][646], [SKIP][647]) ([Intel XE#2493])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][648] ([Intel XE#4596]) -> [SKIP][649] ([Intel XE#455])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][650] ([Intel XE#2705] / [Intel XE#4540]) -> ([ABORT][651], [ABORT][652]) ([Intel XE#4540])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][653] ([Intel XE#4502] / [Intel XE#4540]) -> [ABORT][654] ([Intel XE#4540])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][655] ([Intel XE#718]) -> ([FAIL][656], [PASS][657]) ([Intel XE#718])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][658] ([Intel XE#2029]) -> ([PASS][659], [FAIL][660]) ([Intel XE#2029])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#836]) -> ([SKIP][662], [PASS][663]) ([Intel XE#836])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][664] ([Intel XE#1729]) -> [SKIP][665] ([Intel XE#362])
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#1500]) -> ([SKIP][667], [SKIP][668]) ([Intel XE#362])
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][669] ([Intel XE#771]) -> ([FAIL][670], [FAIL][671]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][672] ([Intel XE#771]) -> ([PASS][673], [FAIL][674]) ([Intel XE#899])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-lnl:          [ABORT][675] ([Intel XE#4623]) -> ([PASS][676], [ABORT][677]) ([Intel XE#4623])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][678] ([Intel XE#1999]) -> ([PASS][679], [FAIL][680]) ([Intel XE#1999]) +2 other tests ( 1 fail, 1 pass )
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][681] ([Intel XE#1794]) -> ([ABORT][682], [PASS][683]) ([Intel XE#1794])
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4623
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8292 -> IGTPW_12883
  * Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -> xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda

  IGTPW_12883: 12883
  IGT_8292: 8292
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54a9f4f34d476d2f3d7
  xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda: eb7714c3b05163fd19bc811d8f3f249392c5ceda

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/index.html

--===============7548332443109756636==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Fix typos and clarify ENOBUFS error</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146983/">https://patchwork.freedesktop.org/series/146983/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8292_FULL -&gt; XEIGTPW_12883_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12883_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12883_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12883_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_lowres@tiling-4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html">INCOMPLETE</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@srm:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html">INCOMPLETE</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_content_protection@srm.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_content_protection@srm.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 1 fail, 1 incomplete )</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12883_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-6/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-1/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +222 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_chamelium_color@degamma.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_chamelium_color@degamma.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164">Intel XE#4164</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_feature_discovery@display-3x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_feature_discovery@display-3x.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_feature_discovery@psr2.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests ( 1 pass, 1 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_psr@pr-cursor-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_psr@pr-cursor-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_setmode@basic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_writeback@writeback-check-output.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_writeback@writeback-check-output.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@xe_eudebug_online@resume-one.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_eudebug_online@resume-one.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@xe_evict@evict-beng-large.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_evict@evict-beng-large.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_oa@syncs-syncobj-none.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_oa@syncs-syncobj-none.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@xe_peer2peer@write.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@xe_peer2peer@write.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-7/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-6/igt@xe_pm@s4-mocs.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_dp_aux_dev.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_feature_discovery@display-2x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_feature_discovery@display-2x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-9/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_vrr@negative-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_vrr@negative-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html">INCOMPLETE</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@xe_oa@buffer-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@xe_oa@buffer-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@xe_oa@buffer-size.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_content_protection@atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_content_protection@atomic.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_content_protection@lic-type-0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_content_protection@srm.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4623">Intel XE#4623</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4623">Intel XE#4623</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12883/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8292 -&gt; IGTPW_12883</li>
<li>Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -&gt; xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda</li>
</ul>
<p>IGTPW_12883: 12883<br />
  IGT_8292: 8292<br />
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54a9f4f34d476d2f3d7<br />
  xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda: eb7714c3b05163fd19bc811d8f3f249392c5ceda</p>

</body>
</html>

--===============7548332443109756636==--
