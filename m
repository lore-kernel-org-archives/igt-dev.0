Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D422C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 16:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4906E10E068;
	Sun,  6 Apr 2025 16:54:30 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AE610E068;
 Sun,  6 Apr 2025 16:54:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2286453533095840912=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_tests/intel/xe=5Ffault=5Fi?=
 =?utf-8?q?njection=3A_Do_not_treat_probe_success_as_error_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 16:54:28 -0000
Message-ID: <174395846832.41104.4896826994459593692@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327125051.621892-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250327125051.621892-1-marcin.bernatowicz@linux.intel.com>
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

--===============2286453533095840912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Do not treat probe success as error (rev2)
URL   : https://patchwork.freedesktop.org/series/146864/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8290_FULL -> XEIGTPW_12858_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12858_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> ([SKIP][2], [SKIP][3]) ([Intel XE#3768])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_async_flips@invalid-async-flip-atomic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2-set2:     [PASS][4] -> ([INCOMPLETE][5], [PASS][6]) ([Intel XE#2613])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][7] ([Intel XE#2613])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][10], [SKIP][11]) ([Intel XE#316])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][12], [SKIP][13]) ([Intel XE#2327]) +1 other test ( 2 skip )
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#1467])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#4543])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#607])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> ([SKIP][27], [SKIP][28]) ([Intel XE#1124]) +9 other tests ( 2 skip )
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][29] -> ([SKIP][30], [SKIP][31]) ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2314] / [Intel XE#2894])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#2314] / [Intel XE#2894]) +2 other tests ( 2 skip )
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1512])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][37], [SKIP][38]) ([Intel XE#367])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#367]) +2 other tests ( 2 skip )
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#367])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2887]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#2907])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#787]) +183 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2887]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#787]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][48], [SKIP][49]) ([Intel XE#2887]) +10 other tests ( 2 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][50], [SKIP][51]) ([Intel XE#2652] / [Intel XE#787]) +4 other tests ( 2 skip )
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#3432])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#3432]) +1 other test ( 2 skip )
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#2887])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][58] -> ([INCOMPLETE][59], [PASS][60]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][62], [PASS][63]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][64] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][65] ([Intel XE#3124])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#1727] / [Intel XE#3113])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455] / [Intel XE#787]) +32 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][70], [SKIP][71]) ([Intel XE#787]) +47 other tests ( 2 skip )
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][72], [SKIP][73]) ([Intel XE#455] / [Intel XE#787]) +12 other tests ( 2 skip )
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#2724]) +2 other tests ( 2 skip )
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#4416]) +3 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#306])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#2325]) +1 other test ( 2 skip )
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2325])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#306])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_chamelium_color@degamma.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-lnl:          NOTRUN -> ([SKIP][84], [SKIP][85]) ([Intel XE#373])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> ([SKIP][86], [SKIP][87]) ([Intel XE#2252]) +6 other tests ( 2 skip )
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][88], [SKIP][89]) ([Intel XE#373]) +3 other tests ( 2 skip )
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2252]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#373])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#373])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#1178])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#3278])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> ([SKIP][95], [SKIP][96]) ([Intel XE#2390])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][97], [FAIL][98]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_content_protection@legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#3278])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_content_protection@legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#2341])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_content_protection@lic-type-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> ([FAIL][103], [FAIL][104]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_content_protection@srm.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> ([SKIP][105], [FAIL][106]) ([Intel XE#1188] / [Intel XE#2341])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_content_protection@uevent.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][107] ([Intel XE#1188])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#2320]) +4 other tests ( 2 skip )
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#308])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> ([SKIP][111], [SKIP][112]) ([Intel XE#1424])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> ([SKIP][113], [SKIP][114]) ([Intel XE#2321])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][115] -> [SKIP][116] ([Intel XE#2291])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#309])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#309])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][120], [PASS][121]) ([Intel XE#309])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][122] -> ([SKIP][123], [SKIP][124]) ([Intel XE#2291]) +1 other test ( 2 skip )
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2291])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          NOTRUN -> ([SKIP][126], [SKIP][127]) ([Intel XE#2291])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> ([SKIP][128], [SKIP][129]) ([Intel XE#309])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][130] -> ([PASS][131], [SKIP][132]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
    - shard-dg2-set2:     [PASS][133] -> ([SKIP][134], [PASS][135]) ([Intel XE#309]) +2 other tests ( 1 pass, 1 skip )
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> ([PASS][136], [SKIP][137]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#323])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2286])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#455]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#1508])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][142] -> ([SKIP][143], [PASS][144]) ([Intel XE#4302])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][145], [SKIP][146]) ([i915#3804])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#4331])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          NOTRUN -> ([SKIP][148], [SKIP][149]) ([Intel XE#2244])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_dsc@dsc-with-formats.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#455]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-lnl:          NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#2244])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#4422])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#776])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_fbcon_fbt@psr.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#776])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> ([SKIP][158], [SKIP][159]) ([Intel XE#2372])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_feature_discovery@chamelium.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][160] -> ([PASS][161], [SKIP][162]) ([Intel XE#2373])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][163], [SKIP][164]) ([Intel XE#703])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> ([SKIP][165], [SKIP][166]) ([Intel XE#1421]) +1 other test ( 2 skip )
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][167] -> [SKIP][168] ([Intel XE#2316]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> ([PASS][169], [SKIP][170]) ([Intel XE#2316])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][171], [FAIL][172]) ([Intel XE#301] / [Intel XE#310])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][173] -> ([PASS][174], [FAIL][175]) ([Intel XE#301] / [Intel XE#3321])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][176] -> ([FAIL][177], [FAIL][178]) ([Intel XE#301]) +1 other test ( 2 fail )
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][179] -> [FAIL][180] ([Intel XE#3321]) +3 other tests fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][181] -> ([PASS][182], [FAIL][183]) ([Intel XE#301]) +6 other tests ( 1 fail, 1 pass )
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#310])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2-set2:     [PASS][185] -> ([SKIP][186], [SKIP][187]) ([Intel XE#310])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][188] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [PASS][189] -> ([SKIP][190], [PASS][191]) ([Intel XE#310]) +3 other tests ( 1 pass, 1 skip )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][192] -> ([SKIP][193], [PASS][194]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][195] -> ([SKIP][196], [SKIP][197]) ([Intel XE#2316]) +1 other test ( 2 skip )
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-7/igt@kms_flip@2x-plain-flip.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#310])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-dg2-set2:     [PASS][199] -> [SKIP][200] ([Intel XE#310]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_flip@2x-plain-flip-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#2316]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][202], [PASS][203]) ([Intel XE#310])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][204], [INCOMPLETE][205]) ([Intel XE#2049])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][206] -> ([PASS][207], [INCOMPLETE][208]) ([Intel XE#2049]) +1 other test ( 1 incomplete, 1 pass )
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][209] -> ([FAIL][210], [PASS][211]) ([Intel XE#3321])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][212] ([Intel XE#301]) +6 other tests fail
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][213] -> [FAIL][214] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][215] -> ([FAIL][216], [PASS][217]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][218] -> ([FAIL][219], [FAIL][220]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 2 fail )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][221] -> [DMESG-WARN][222] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][223], [SKIP][224]) ([Intel XE#1401] / [Intel XE#1745])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][225], [SKIP][226]) ([Intel XE#1401])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#2293]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#2380]) +1 other test ( 2 skip )
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][230] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#2293] / [Intel XE#2380]) +1 other test ( 2 skip )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][233], [SKIP][234]) ([Intel XE#2293]) +1 other test ( 2 skip )
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][235], [SKIP][236]) ([Intel XE#455]) +5 other tests ( 2 skip )
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#651])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> ([SKIP][238], [SKIP][239]) ([Intel XE#2311] / [Intel XE#2312]) +6 other tests ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#656]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#2312]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2311]) +10 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][243], [SKIP][244]) ([Intel XE#2311]) +17 other tests ( 2 skip )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#651]) +6 other tests ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#4141]) +9 other tests ( 2 skip )
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#2312] / [Intel XE#4141]) +2 other tests ( 2 skip )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [PASS][251] -> [SKIP][252] ([Intel XE#656])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [PASS][253] -> ([SKIP][254], [SKIP][255]) ([Intel XE#656])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][256] -> ([SKIP][257], [PASS][258]) ([Intel XE#656]) +7 other tests ( 1 pass, 1 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][259] ([Intel XE#4141]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-dg2-set2:     NOTRUN -> ([PASS][260], [SKIP][261]) ([Intel XE#656])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#651]) +3 other tests ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#651] / [Intel XE#656]) +5 other tests ( 2 skip )
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#656]) +3 other tests ( 2 skip )
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][268] ([Intel XE#651]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][269], [SKIP][270]) ([Intel XE#653]) +2 other tests ( 2 skip )
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#653]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][272], [SKIP][273]) ([Intel XE#653] / [Intel XE#656]) +1 other test ( 2 skip )
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][274], [SKIP][275]) ([Intel XE#2312] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][276] ([Intel XE#656]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][277] ([Intel XE#2313]) +11 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][278], [SKIP][279]) ([Intel XE#2352])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][280] ([Intel XE#653])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][281], [SKIP][282]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][283] ([Intel XE#656]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> ([SKIP][284], [SKIP][285]) ([Intel XE#2313]) +20 other tests ( 2 skip )
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][286], [SKIP][287]) ([Intel XE#656]) +1 other test ( 2 skip )
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][288], [SKIP][289]) ([Intel XE#2502])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#2340])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#3374] / [Intel XE#3544])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> ([SKIP][294], [PASS][295]) ([Intel XE#1503])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][296] ([Intel XE#1503])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][297], [SKIP][298]) ([Intel XE#2927])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][299] ([Intel XE#616]) +2 other tests fail
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][300] ([Intel XE#2393])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][301] -> ([PASS][302], [SKIP][303]) ([Intel XE#4596])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][304] ([Intel XE#4596])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][305] ([Intel XE#2493])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][306], [SKIP][307]) ([Intel XE#455] / [Intel XE#4596])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-adlp:         [PASS][308] -> [DMESG-WARN][309] ([Intel XE#4173]) +5 other tests dmesg-warn
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          NOTRUN -> ([SKIP][310], [SKIP][311]) ([Intel XE#2763]) +19 other tests ( 2 skip )
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][312] ([Intel XE#2391])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][313] -> ([PASS][314], [FAIL][315]) ([Intel XE#718])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][316] ([Intel XE#3309])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> ([FAIL][317], [FAIL][318]) ([Intel XE#1430])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][319] -> [SKIP][320] ([Intel XE#836])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][321] ([Intel XE#836])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> ([SKIP][322], [SKIP][323]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][324] ([Intel XE#1489]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][325] ([Intel XE#4570]) +2 other tests fail
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][326] ([Intel XE#2893])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][327] ([Intel XE#1489]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][328], [SKIP][329]) ([Intel XE#1489]) +7 other tests ( 2 skip )
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][330] ([Intel XE#1489])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][331], [SKIP][332]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][333], [SKIP][334]) ([Intel XE#1122])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> ([SKIP][335], [SKIP][336]) ([Intel XE#2387]) +1 other test ( 2 skip )
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][337], [SKIP][338]) ([Intel XE#1406])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-1/igt@kms_psr@fbc-pr-primary-blt.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][339], [SKIP][340]) ([Intel XE#2850] / [Intel XE#929]) +2 other tests ( 2 skip )
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html
    - shard-adlp:         NOTRUN -> [SKIP][341] ([Intel XE#2850] / [Intel XE#929])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> ([SKIP][342], [SKIP][343]) ([Intel XE#2234] / [Intel XE#2850]) +11 other tests ( 2 skip )
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][344] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][345] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][346], [SKIP][347]) ([Intel XE#2939])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][348] ([Intel XE#3414] / [Intel XE#3904])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][349] ([Intel XE#2330])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][350], [SKIP][351]) ([Intel XE#1127])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][352], [SKIP][353]) ([Intel XE#3414])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
    - shard-lnl:          NOTRUN -> ([SKIP][354], [SKIP][355]) ([Intel XE#3414] / [Intel XE#3904])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][356] ([Intel XE#1127])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> ([SKIP][357], [SKIP][358]) ([Intel XE#3414] / [Intel XE#3904]) +1 other test ( 2 skip )
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][359] -> ([FAIL][360], [PASS][361]) ([Intel XE#2883])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_setmode@basic.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_setmode@basic.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([PASS][362], [FAIL][363]) ([Intel XE#2883])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_setmode@basic@pipe-a-dp-2.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_setmode@basic@pipe-a-dp-2.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [PASS][364] -> ([SKIP][365], [PASS][366]) ([Intel XE#455])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> ([SKIP][367], [SKIP][368]) ([Intel XE#1435])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#1435])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-bmg:          [PASS][371] -> ([SKIP][372], [PASS][373]) ([Intel XE#1435])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> ([SKIP][374], [FAIL][375]) ([Intel XE#1729] / [Intel XE#2426])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][376] ([Intel XE#2426])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][377] ([Intel XE#362])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][378] -> ([PASS][379], [FAIL][380]) ([Intel XE#771] / [Intel XE#899])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][381] ([Intel XE#899])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][382] -> [FAIL][383] ([Intel XE#899])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][384] ([Intel XE#4415])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-2.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][385] ([Intel XE#2168])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          NOTRUN -> ([PASS][386], [SKIP][387]) ([Intel XE#1499])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          NOTRUN -> ([SKIP][388], [SKIP][389]) ([Intel XE#756])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][390] ([Intel XE#1091] / [Intel XE#2849])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][391] ([Intel XE#455] / [Intel XE#488])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> ([SKIP][392], [SKIP][393]) ([Intel XE#2905])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> ([SKIP][394], [SKIP][395]) ([Intel XE#2905] / [Intel XE#3889])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][396], [SKIP][397]) ([Intel XE#2905] / [Intel XE#4259])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@xe_eudebug@discovery-race-sigint.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][398] ([Intel XE#2905]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][399], [SKIP][400]) ([Intel XE#2905]) +3 other tests ( 2 skip )
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-adlp:         NOTRUN -> [SKIP][401] ([Intel XE#2905])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][402] ([Intel XE#2905]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> ([SKIP][403], [SKIP][404]) ([Intel XE#2905]) +8 other tests ( 2 skip )
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> ([SKIP][405], [SKIP][406]) ([Intel XE#4518])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][407] ([Intel XE#4518])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][408] ([Intel XE#688]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][409] ([Intel XE#261] / [Intel XE#688])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][410], [PASS][411]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
    - shard-adlp:         NOTRUN -> [SKIP][412] ([Intel XE#1392])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][413] ([Intel XE#2322]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> ([SKIP][414], [SKIP][415]) ([Intel XE#1392])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][416] -> ([SKIP][417], [PASS][418]) ([Intel XE#1392]) +8 other tests ( 1 pass, 1 skip )
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> ([SKIP][419], [SKIP][420]) ([Intel XE#2322]) +8 other tests ( 2 skip )
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-dg2-set2:     [PASS][421] -> ([SKIP][422], [SKIP][423]) ([Intel XE#1392])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][424] -> [SKIP][425] ([Intel XE#1392]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-basic-imm:
    - shard-adlp:         NOTRUN -> [SKIP][426] ([Intel XE#288]) +4 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@xe_exec_fault_mode@many-basic-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][427] ([Intel XE#288]) +9 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-rebind:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][428], [SKIP][429]) ([Intel XE#288]) +6 other tests ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][430], [SKIP][431]) ([Intel XE#2360])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][432] ([Intel XE#2833])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> ([SKIP][433], [SKIP][434]) ([Intel XE#2459] / [Intel XE#2596])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_media_fill@media-fill.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> ([SKIP][435], [SKIP][436]) ([Intel XE#2457])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_module_load@force-load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_module_load@force-load.html

  * igt@xe_oa@buffer-size@ccs-0-256k:
    - shard-lnl:          NOTRUN -> [FAIL][437] ([Intel XE#4541])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@xe_oa@buffer-size@ccs-0-256k.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][438], [SKIP][439]) ([Intel XE#2541] / [Intel XE#3573]) +2 other tests ( 2 skip )
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][440] ([Intel XE#2541] / [Intel XE#3573])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][441], [SKIP][442]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test ( 2 skip )
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][443] ([Intel XE#1420])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][444] ([Intel XE#2245])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][445] ([Intel XE#1173]) +3 other tests fail
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> ([SKIP][446], [SKIP][447]) ([Intel XE#2427])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@xe_peer2peer@write.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> ([SKIP][448], [SKIP][449]) ([Intel XE#2284]) +1 other test ( 2 skip )
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          NOTRUN -> ([ABORT][450], [PASS][451]) ([Intel XE#1794])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@xe_pm@s4-basic.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][452] -> ([ABORT][453], [PASS][454]) ([Intel XE#1794]) +1 other test ( 1 abort, 1 pass )
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][455] ([Intel XE#944]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][456] ([Intel XE#944]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> ([SKIP][457], [SKIP][458]) ([Intel XE#944]) +2 other tests ( 2 skip )
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> ([SKIP][459], [SKIP][460]) ([Intel XE#4130])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [SKIP][461] ([Intel XE#3342])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][462], [SKIP][463]) ([Intel XE#4351])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][464] ([Intel XE#4173])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [INCOMPLETE][465] ([Intel XE#3225]) -> [PASS][466]
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][467] ([Intel XE#4543]) -> [PASS][468]
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][469] -> ([PASS][470], [PASS][471])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][472] -> [PASS][473]
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][474] ([Intel XE#3862]) -> ([PASS][475], [PASS][476])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#309]) -> ([PASS][478], [PASS][479]) +2 other tests ( 2 pass )
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][480] ([Intel XE#2291]) -> ([PASS][481], [PASS][482]) +1 other test ( 2 pass )
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-adlp:         [INCOMPLETE][483] -> [PASS][484]
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#309]) -> [PASS][486] +1 other test pass
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][487] ([Intel XE#2291]) -> [PASS][488] +1 other test pass
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#3009]) -> [PASS][490]
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_dp_aux_dev.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#310]) -> ([PASS][492], [PASS][493]) +3 other tests ( 2 pass )
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][494] ([Intel XE#2316]) -> ([PASS][495], [PASS][496]) +2 other tests ( 2 pass )
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#310]) -> [PASS][498]
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][499] ([Intel XE#3321]) -> [PASS][500] +1 other test pass
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][501] ([Intel XE#301] / [Intel XE#3321]) -> ([PASS][502], [PASS][503])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][504] ([Intel XE#2316]) -> [PASS][505] +2 other tests pass
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][506] ([Intel XE#2049]) -> ([PASS][507], [PASS][508]) +1 other test ( 2 pass )
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a6-dp4.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a6-dp4.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-dg2-set2:     [FAIL][509] ([Intel XE#301]) -> [PASS][510] +2 other tests pass
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-dg2-set2:     [FAIL][511] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][512]
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#656]) -> [PASS][514] +4 other tests pass
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#656]) -> ([PASS][516], [PASS][517]) +1 other test ( 2 pass )
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [INCOMPLETE][518] ([Intel XE#1035]) -> ([PASS][519], [PASS][520]) +1 other test ( 2 pass )
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][521] ([Intel XE#4596]) -> ([PASS][522], [PASS][523])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#4596]) -> ([PASS][525], [PASS][526])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-none.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#836]) -> ([PASS][528], [PASS][529])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][530] ([Intel XE#1435]) -> [PASS][531]
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#455]) -> ([PASS][533], [PASS][534])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_vrr@negative-basic.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#1392]) -> ([PASS][536], [PASS][537]) +4 other tests ( 2 pass )
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [DMESG-WARN][538] ([Intel XE#4173]) -> [PASS][539] +2 other tests pass
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][540] ([Intel XE#3719] / [Intel XE#911]) -> ([PASS][541], [FAIL][542]) ([Intel XE#3719] / [Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][543] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][544], [SKIP][545]) ([Intel XE#2314] / [Intel XE#2894])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][547], [SKIP][548]) ([Intel XE#787]) +4 other tests ( 2 skip )
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#787]) -> ([SKIP][550], [SKIP][551]) ([Intel XE#455] / [Intel XE#787]) +12 other tests ( 2 skip )
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][553] ([Intel XE#787]) +4 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#787]) -> [SKIP][555] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#4418]) -> [SKIP][557] ([Intel XE#4440])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][558] ([Intel XE#1178]) -> ([FAIL][559], [SKIP][560]) ([Intel XE#1178] / [Intel XE#2341])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_content_protection@atomic.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_content_protection@atomic.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][561] ([Intel XE#1178]) -> ([SKIP][562], [FAIL][563]) ([Intel XE#1178] / [Intel XE#455]) +1 other test ( 1 fail, 1 skip )
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][564] ([Intel XE#2291]) -> ([PASS][565], [SKIP][566]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2-set2:     [INCOMPLETE][567] ([Intel XE#3226]) -> ([PASS][568], [SKIP][569]) ([Intel XE#309])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][570] ([Intel XE#2316]) -> ([SKIP][571], [PASS][572]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#310]) -> ([PASS][574], [INCOMPLETE][575]) ([Intel XE#2049])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][576] ([Intel XE#301]) -> ([FAIL][577], [PASS][578]) ([Intel XE#301])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          [ABORT][579] -> [SKIP][580] ([Intel XE#1397] / [Intel XE#1745])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][581] -> [SKIP][582] ([Intel XE#1397])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][583] ([Intel XE#4543]) -> [DMESG-FAIL][584] ([Intel XE#324] / [Intel XE#4543]) +1 other test dmesg-fail
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#656]) -> [SKIP][586] ([Intel XE#651]) +2 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][587] ([Intel XE#2311]) -> ([SKIP][588], [SKIP][589]) ([Intel XE#2312]) +3 other tests ( 2 skip )
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][590] ([Intel XE#2312]) -> ([SKIP][591], [SKIP][592]) ([Intel XE#2311]) +7 other tests ( 2 skip )
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][593] ([Intel XE#2311]) -> [SKIP][594] ([Intel XE#2312]) +4 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][595] ([Intel XE#2311]) -> ([SKIP][596], [SKIP][597]) ([Intel XE#2311] / [Intel XE#2312]) +15 other tests ( 2 skip )
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][598] ([Intel XE#2312]) -> ([SKIP][599], [SKIP][600]) ([Intel XE#2311] / [Intel XE#2312]) +4 other tests ( 2 skip )
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#651]) -> [SKIP][602] ([Intel XE#656]) +1 other test skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#656]) -> ([SKIP][604], [SKIP][605]) ([Intel XE#651]) +10 other tests ( 2 skip )
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#651]) -> ([SKIP][607], [SKIP][608]) ([Intel XE#651] / [Intel XE#656]) +18 other tests ( 2 skip )
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][609] ([Intel XE#4141]) -> ([SKIP][610], [SKIP][611]) ([Intel XE#2312] / [Intel XE#4141]) +5 other tests ( 2 skip )
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][612] ([Intel XE#2312]) -> ([SKIP][613], [SKIP][614]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][615] ([Intel XE#4141]) -> ([SKIP][616], [SKIP][617]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][618] ([Intel XE#4141]) -> [SKIP][619] ([Intel XE#2312])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#656]) -> ([PASS][621], [SKIP][622]) ([Intel XE#656])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][623] ([Intel XE#2312]) -> [SKIP][624] ([Intel XE#4141]) +4 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][625] ([Intel XE#2312]) -> ([SKIP][626], [SKIP][627]) ([Intel XE#2312] / [Intel XE#4141])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][628] ([Intel XE#2312]) -> [SKIP][629] ([Intel XE#2311]) +7 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#656]) -> ([SKIP][631], [SKIP][632]) ([Intel XE#651] / [Intel XE#656])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][633] ([Intel XE#2313]) -> ([SKIP][634], [SKIP][635]) ([Intel XE#2312]) +6 other tests ( 2 skip )
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][636] ([Intel XE#2312]) -> ([SKIP][637], [SKIP][638]) ([Intel XE#2313]) +4 other tests ( 2 skip )
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#653]) -> ([SKIP][640], [SKIP][641]) ([Intel XE#653] / [Intel XE#656]) +18 other tests ( 2 skip )
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][642] ([Intel XE#2313]) -> ([SKIP][643], [SKIP][644]) ([Intel XE#2312] / [Intel XE#2313]) +15 other tests ( 2 skip )
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][645] ([Intel XE#2312]) -> ([SKIP][646], [SKIP][647]) ([Intel XE#2312] / [Intel XE#2313]) +4 other tests ( 2 skip )
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][648] ([Intel XE#656]) -> ([SKIP][649], [SKIP][650]) ([Intel XE#653]) +9 other tests ( 2 skip )
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#653]) -> ([SKIP][652], [SKIP][653]) ([Intel XE#656]) +1 other test ( 2 skip )
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][654] ([Intel XE#2312]) -> [SKIP][655] ([Intel XE#2313]) +4 other tests skip
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][656] ([Intel XE#656]) -> [SKIP][657] ([Intel XE#653]) +4 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][658] ([Intel XE#2313]) -> [SKIP][659] ([Intel XE#2312]) +3 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][660] ([Intel XE#616]) -> ([FAIL][661], [PASS][662]) ([Intel XE#616]) +1 other test ( 1 fail, 1 pass )
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-436/igt@kms_plane_cursor@viewport.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][663] ([Intel XE#4596]) -> ([SKIP][664], [PASS][665]) ([Intel XE#4596])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#836]) -> ([SKIP][667], [PASS][668]) ([Intel XE#836])
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][669] ([Intel XE#2883]) -> ([PASS][670], [FAIL][671]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][672] ([Intel XE#1435]) -> ([PASS][673], [SKIP][674]) ([Intel XE#1435])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][675] ([Intel XE#771]) -> [FAIL][676] ([Intel XE#899]) +2 other tests fail
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][677] ([Intel XE#4459]) -> ([PASS][678], [FAIL][679]) ([Intel XE#4459]) +1 other test ( 1 fail, 1 pass )
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#1392]) -> ([PASS][681], [SKIP][682]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][683] ([Intel XE#4541]) -> ([FAIL][684], [PASS][685]) ([Intel XE#4541])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-6/igt@xe_oa@buffer-size.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@xe_oa@buffer-size.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_oa@buffer-size.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4415
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4570]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8290 -> IGTPW_12858
  * Linux: xe-2860-a538fdef11bc12778532b0365d7a9e4c52bd366a -> xe-2861-6b12f0606e27042adf3ad16f57a837682d081158

  IGTPW_12858: 12858
  IGT_8290: 8290
  xe-2860-a538fdef11bc12778532b0365d7a9e4c52bd366a: a538fdef11bc12778532b0365d7a9e4c52bd366a
  xe-2861-6b12f0606e27042adf3ad16f57a837682d081158: 6b12f0606e27042adf3ad16f57a837682d081158

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/index.html

--===============2286453533095840912==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Do not treat probe success as error (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146864/">https://patchwork.freedesktop.org/series/146864/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8290_FULL -&gt; XEIGTPW_12858_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12858_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_chamelium_color@degamma.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_content_protection@legacy.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_content_protection@legacy.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 2 fail )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_content_protection@legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_content_protection@legacy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_content_protection@lic-type-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_content_protection@lic-type-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_content_protection@srm.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests ( 1 pass, 1 skip )</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_fbcon_fbt@psr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_feature_discovery@chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_feature_discovery@chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_feature_discovery@display-2x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_feature_discovery@display-3x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_feature_discovery@display-3x.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-7/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-1/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests ( 2 skip )</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_setmode@basic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_setmode@basic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_setmode@basic@pipe-a-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_setmode@basic@pipe-a-dp-2.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4415">Intel XE#4415</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_vrr@negative-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@xe_eudebug@discovery-race-sigint.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_eudebug@discovery-race-sigint.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@xe_exec_fault_mode@many-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_media_fill@media-fill.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@xe_media_fill@media-fill.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_module_load@force-load.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_module_load@force-load.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@ccs-0-256k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@xe_oa@buffer-size@ccs-0-256k.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@xe_peer2peer@write.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-8/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">INCOMPLETE</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-dp-2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a6-dp4.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_vrr@negative-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_vrr@negative-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-436/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_plane_cursor@viewport.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-463/igt@kms_plane_cursor@viewport.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/shard-lnl-6/igt@xe_oa@buffer-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-8/igt@xe_oa@buffer-size.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12858/shard-lnl-4/igt@xe_oa@buffer-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8290 -&gt; IGTPW_12858</li>
<li>Linux: xe-2860-a538fdef11bc12778532b0365d7a9e4c52bd366a -&gt; xe-2861-6b12f0606e27042adf3ad16f57a837682d081158</li>
</ul>
<p>IGTPW_12858: 12858<br />
  IGT_8290: 8290<br />
  xe-2860-a538fdef11bc12778532b0365d7a9e4c52bd366a: a538fdef11bc12778532b0365d7a9e4c52bd366a<br />
  xe-2861-6b12f0606e27042adf3ad16f57a837682d081158: 6b12f0606e27042adf3ad16f57a837682d081158</p>

</body>
</html>

--===============2286453533095840912==--
