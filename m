Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCEFC3601A
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 15:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED1F10E0AD;
	Sun,  6 Apr 2025 15:49:54 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E6E10E0AD;
 Sun,  6 Apr 2025 15:49:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6472593722946448666=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/kms=5Fcursor=5Fcrc?=
 =?utf-8?q?=3A_Test_async_changes_midframe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 15:49:52 -0000
Message-ID: <174395459285.41054.16944132898296859596@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326102953.329857-1-shekhar.chauhan@intel.com>
In-Reply-To: <20250326102953.329857-1-shekhar.chauhan@intel.com>
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

--===============6472593722946448666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Test async changes midframe
URL   : https://patchwork.freedesktop.org/series/146795/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8285_FULL -> XEIGTPW_12840_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12840_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12840_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12840_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][1] -> ([PASS][2], [INCOMPLETE][3]) +1 other test ( 1 incomplete, 1 pass )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          NOTRUN -> ([ABORT][4], [PASS][5])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  
New tests
---------

  New tests have been introduced between XEIGT_8285_FULL and XEIGTPW_12840_FULL:

### New IGT tests (10) ###

  * igt@kms_cursor_crc@async-cursor-crc-framebuffer-change:
    - Statuses : 2 pass(s)
    - Exec time: [0.92, 2.09] s

  * igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_cursor_crc@async-cursor-crc-position-change:
    - Statuses : 2 pass(s)
    - Exec time: [0.88, 2.07] s

  * igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12840_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1465])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2233])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3767]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> ([SKIP][10], [SKIP][11]) ([Intel XE#664])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_async_flips@test-cursor.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          NOTRUN -> ([SKIP][12], [SKIP][13]) ([Intel XE#2385])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][14], [SKIP][15]) ([Intel XE#2327]) +1 other test ( 2 skip )
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#619])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#607])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#3658])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][20], [SKIP][21]) ([Intel XE#316]) +1 other test ( 2 skip )
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#316]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#316])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#4543]) +8 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> ([SKIP][27], [SKIP][28]) ([Intel XE#1407]) +3 other tests ( 2 skip )
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> ([SKIP][30], [SKIP][31]) ([Intel XE#2328])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][32] ([Intel XE#4543]) +4 other tests dmesg-fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1124]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][35], [SKIP][36]) ([Intel XE#607])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> ([SKIP][37], [SKIP][38]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1124])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> ([SKIP][42], [SKIP][43]) ([Intel XE#1124]) +7 other tests ( 2 skip )
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#2191]) +1 other test ( 2 skip )
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][46] -> ([SKIP][47], [PASS][48]) ([Intel XE#2314] / [Intel XE#2894])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#2314] / [Intel XE#2894])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#2191]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#1512])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#367]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
    - shard-bmg:          NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#367]) +2 other tests ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][57], [SKIP][58]) ([Intel XE#367]) +1 other test ( 2 skip )
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#367])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#367]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#367])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#2887]) +8 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#2887]) +10 other tests ( 2 skip )
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][67], [SKIP][68]) ([Intel XE#787]) +64 other tests ( 2 skip )
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#455] / [Intel XE#787]) +13 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#787]) +171 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][72], [SKIP][73]) ([Intel XE#2907])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2887]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#2907]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2887]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#787]) +44 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#3432]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#3432]) +1 other test ( 2 skip )
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][82] -> [INCOMPLETE][83] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][84] -> ([PASS][85], [INCOMPLETE][86]) ([Intel XE#2705]) +1 other test ( 1 incomplete, 1 pass )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][87] -> [INCOMPLETE][88] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#4417]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> ([SKIP][92], [SKIP][93]) ([Intel XE#306]) +1 other test ( 2 skip )
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_chamelium_color@ctm-blue-to-red.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#306]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> ([SKIP][95], [SKIP][96]) ([Intel XE#2325])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#373]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#373]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#373]) +7 other tests ( 2 skip )
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2252]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#373]) +9 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#2252]) +5 other tests ( 2 skip )
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][107], [FAIL][108]) ([Intel XE#1178])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2341])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_content_protection@content-type-change.html
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#3278])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#307])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#307])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#307])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#307])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][116] ([Intel XE#1178]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][117] ([Intel XE#1178])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [PASS][118] -> [DMESG-WARN][119] ([Intel XE#4173]) +8 other tests dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2320]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#308]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-lnl:          NOTRUN -> ([SKIP][122], [SKIP][123]) ([Intel XE#2321])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#308]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-bmg:          NOTRUN -> ([SKIP][125], [SKIP][126]) ([Intel XE#2321])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2321])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> ([SKIP][128], [SKIP][129]) ([Intel XE#1424]) +1 other test ( 2 skip )
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x10.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#455]) +23 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-bmg:          NOTRUN -> ([SKIP][131], [SKIP][132]) ([Intel XE#2320]) +5 other tests ( 2 skip )
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#308])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][135] ([Intel XE#4173]) +2 other tests dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][136] -> [SKIP][137] ([Intel XE#2291]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#309]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
    - shard-lnl:          NOTRUN -> ([SKIP][139], [SKIP][140]) ([Intel XE#309]) +1 other test ( 2 skip )
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][141] -> ([SKIP][142], [PASS][143]) ([Intel XE#2291])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][144], [PASS][145]) ([Intel XE#309])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-lnl:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([Intel XE#323])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#323]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#323])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2291])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-dg2-set2:     [PASS][151] -> ([PASS][152], [INCOMPLETE][153]) ([Intel XE#3226]) +1 other test ( 1 incomplete, 1 pass )
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_cursor_legacy@forked-move.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_cursor_legacy@forked-move.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2286])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#323])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][156], [SKIP][157]) ([Intel XE#1508])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#4302])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_display_modes@extended-mode-basic.html
    - shard-lnl:          NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#4302])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> ([PASS][161], [SKIP][162]) ([Intel XE#1340])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][163], [SKIP][164]) ([Intel XE#1340])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4356])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][166] -> ([SKIP][167], [PASS][168]) ([Intel XE#4331])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-436/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#4331])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-lnl:          NOTRUN -> ([SKIP][170], [SKIP][171]) ([Intel XE#4331])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> ([SKIP][172], [SKIP][173]) ([Intel XE#2244]) +1 other test ( 2 skip )
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][174], [SKIP][175]) ([Intel XE#455]) +5 other tests ( 2 skip )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> ([SKIP][176], [SKIP][177]) ([Intel XE#2244])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][178], [SKIP][179]) ([Intel XE#4156])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#1138])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> ([SKIP][181], [SKIP][182]) ([Intel XE#1138])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_feature_discovery@display-4x.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2374]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> ([SKIP][184], [SKIP][185]) ([Intel XE#1421]) +6 other tests ( 2 skip )
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][186] -> ([SKIP][187], [PASS][188]) ([Intel XE#310]) +6 other tests ( 1 pass, 1 skip )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-436/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][189] -> [SKIP][190] ([Intel XE#2316]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][191] -> ([FAIL][192], [PASS][193]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][194] ([Intel XE#3321]) +3 other tests fail
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][195], [FAIL][196]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#1421])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2316]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#310]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg2-set2:     [PASS][200] -> [SKIP][201] ([Intel XE#310]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][202] -> ([PASS][203], [SKIP][204]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][205] -> [FAIL][206] ([Intel XE#2882]) +1 other test fail
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][207] -> ([FAIL][208], [PASS][209]) ([Intel XE#2882]) +3 other tests ( 1 fail, 1 pass )
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][210] ([Intel XE#2049])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [PASS][211] -> ([FAIL][212], [PASS][213]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][214] -> ([PASS][215], [INCOMPLETE][216]) ([Intel XE#2049])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][217] ([Intel XE#301] / [Intel XE#3321])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> ([FAIL][218], [FAIL][219]) ([Intel XE#301]) +3 other tests ( 2 fail )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][220] ([Intel XE#301]) +3 other tests fail
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][221] -> [INCOMPLETE][222] ([Intel XE#2049])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][223] -> ([PASS][224], [FAIL][225]) ([Intel XE#2882]) +1 other test ( 1 fail, 1 pass )
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][226] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#1401]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#2293]) +1 other test ( 2 skip )
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#2293] / [Intel XE#2380]) +1 other test ( 2 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][232] -> [DMESG-FAIL][233] ([Intel XE#324] / [Intel XE#4543]) +1 other test dmesg-fail
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#455]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][235], [SKIP][236]) ([Intel XE#1401] / [Intel XE#1745]) +4 other tests ( 2 skip )
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][237], [SKIP][238]) ([Intel XE#1401]) +4 other tests ( 2 skip )
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#2311]) +17 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#651]) +11 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#651]) +9 other tests ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][243], [SKIP][244]) ([Intel XE#2311]) +9 other tests ( 2 skip )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#2311] / [Intel XE#2312]) +1 other test ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#656]) +8 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#656]) +40 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][251] -> [SKIP][252] ([Intel XE#656]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#656]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#4141]) +6 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][255] -> ([SKIP][256], [PASS][257]) ([Intel XE#656]) +3 other tests ( 1 pass, 1 skip )
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#2312]) +5 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][259] -> ([SKIP][260], [SKIP][261]) ([Intel XE#656])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#2312] / [Intel XE#4141])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][266] ([Intel XE#651]) +6 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#651]) +7 other tests ( 2 skip )
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][269] ([Intel XE#651]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][270] ([Intel XE#1151])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][271], [SKIP][272]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][273], [SKIP][274]) ([Intel XE#653] / [Intel XE#656])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][275] ([Intel XE#653]) +6 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][276] ([Intel XE#4439])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][277], [SKIP][278]) ([Intel XE#653]) +10 other tests ( 2 skip )
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][279] ([Intel XE#653]) +13 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#2313]) +13 other tests ( 2 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][282], [SKIP][283]) ([Intel XE#656]) +26 other tests ( 2 skip )
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][284] ([Intel XE#2313]) +13 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][285], [SKIP][286]) ([Intel XE#2502])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][287] -> ([PASS][288], [SKIP][289]) ([Intel XE#1503])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#1503])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_hdr@static-toggle-suspend.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#4298])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_joiner@basic-max-non-joiner.html
    - shard-adlp:         NOTRUN -> [SKIP][294] ([Intel XE#4298])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][295] ([Intel XE#2927])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][296] ([Intel XE#2927])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][297], [SKIP][298]) ([Intel XE#346])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][299] ([Intel XE#2934])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> ([SKIP][300], [SKIP][301]) ([Intel XE#2934])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][302] ([Intel XE#1035])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][303] ([Intel XE#2078]) +1 other test warn
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [PASS][304] -> ([PASS][305], [FAIL][306]) ([Intel XE#616])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-466/igt@kms_plane_cursor@overlay.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_plane_cursor@overlay.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - shard-adlp:         [PASS][307] -> [FAIL][308] ([Intel XE#1471]) +1 other test fail
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-9/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][309] -> [FAIL][310] ([Intel XE#616])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][311] ([Intel XE#599])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          NOTRUN -> [SKIP][312] ([Intel XE#4596])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> ([SKIP][313], [SKIP][314]) ([Intel XE#2493])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][315] ([Intel XE#2493]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][316] -> ([SKIP][317], [SKIP][318]) ([Intel XE#2571])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-dg2-set2:     [PASS][319] -> ([SKIP][320], [PASS][321]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][322] ([Intel XE#2763]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> ([SKIP][323], [SKIP][324]) ([Intel XE#2763]) +19 other tests ( 2 skip )
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][325], [SKIP][326]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][327], [SKIP][328]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][329] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][330] ([Intel XE#2763]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][331] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][332] ([Intel XE#2763]) +4 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> ([SKIP][333], [SKIP][334]) ([Intel XE#870])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> ([SKIP][335], [SKIP][336]) ([Intel XE#2391])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> ([FAIL][337], [FAIL][338]) ([Intel XE#1430])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         NOTRUN -> [FAIL][339] ([Intel XE#718])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][340] ([Intel XE#908])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][341] ([Intel XE#1439] / [Intel XE#3141])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-adlp:         NOTRUN -> [SKIP][342] ([Intel XE#836])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> ([SKIP][343], [SKIP][344]) ([Intel XE#2893]) +2 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][345], [SKIP][346]) ([Intel XE#1489]) +5 other tests ( 2 skip )
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][347] ([Intel XE#4570]) +2 other tests fail
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([FAIL][348], [FAIL][349]) ([Intel XE#4570]) +2 other tests ( 2 fail )
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][350] ([Intel XE#1489]) +2 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          NOTRUN -> [SKIP][351] ([Intel XE#2893])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][352], [SKIP][353]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][354] ([Intel XE#1489]) +9 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][355] ([Intel XE#1122])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> ([SKIP][356], [SKIP][357]) ([Intel XE#1128])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][358] ([Intel XE#1406]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][359] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> ([FAIL][360], [FAIL][361]) ([Intel XE#4568]) +3 other tests ( 2 fail )
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> ([SKIP][362], [SKIP][363]) ([Intel XE#1406]) +1 other test ( 2 skip )
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_psr@pr-dpms.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][364], [SKIP][365]) ([Intel XE#2234] / [Intel XE#2850]) +6 other tests ( 2 skip )
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][366] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][367] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][368], [SKIP][369]) ([Intel XE#2850] / [Intel XE#929]) +6 other tests ( 2 skip )
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_psr@psr2-dpms.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][370] ([Intel XE#2939])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][371] ([Intel XE#1127])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-lnl:          NOTRUN -> ([SKIP][372], [SKIP][373]) ([Intel XE#3414] / [Intel XE#3904])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][374], [SKIP][375]) ([Intel XE#3414])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][376] ([Intel XE#2330])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> ([SKIP][377], [SKIP][378]) ([Intel XE#2330])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> ([SKIP][379], [SKIP][380]) ([Intel XE#3414] / [Intel XE#3904]) +3 other tests ( 2 skip )
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> ([SKIP][381], [SKIP][382]) ([Intel XE#2413]) +1 other test ( 2 skip )
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][383] ([Intel XE#2413])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> ([SKIP][384], [SKIP][385]) ([Intel XE#1435])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          NOTRUN -> ([SKIP][386], [PASS][387]) ([Intel XE#1435])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-dg2-set2:     [PASS][388] -> ([SKIP][389], [PASS][390]) ([Intel XE#455])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-434/igt@kms_setmode@invalid-clone-single-crtc.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][391] -> [SKIP][392] ([Intel XE#1435])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-dg2-set2:     [PASS][393] -> [SKIP][394] ([Intel XE#455])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][395] ([Intel XE#1729])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][396], [SKIP][397]) ([Intel XE#330])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][398] -> [FAIL][399] ([Intel XE#771] / [Intel XE#899])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][400] -> [FAIL][401] ([Intel XE#899])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][402] -> [FAIL][403] ([Intel XE#899])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][404] ([Intel XE#2168])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][405] ([Intel XE#4459]) +1 other test fail
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][406] ([Intel XE#1499])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][407] ([Intel XE#2168])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][408], [SKIP][409]) ([Intel XE#1499])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_vrr@negative-basic.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          NOTRUN -> ([SKIP][410], [SKIP][411]) ([Intel XE#756])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-lnl:          NOTRUN -> ([SKIP][412], [SKIP][413]) ([Intel XE#756])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][414], [SKIP][415]) ([Intel XE#756])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][416] ([Intel XE#1091] / [Intel XE#2849])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [ABORT][417] ([Intel XE#2705] / [Intel XE#4540])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][418], [SKIP][419]) ([Intel XE#1123])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][420] ([Intel XE#1123]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][421], [SKIP][422]) ([Intel XE#1126])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         NOTRUN -> [SKIP][423] ([Intel XE#944]) +3 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-adlp:         NOTRUN -> [SKIP][424] ([Intel XE#2905]) +10 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][425] ([Intel XE#2905]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][426] ([Intel XE#2905] / [Intel XE#3889])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
    - shard-lnl:          NOTRUN -> ([SKIP][427], [SKIP][428]) ([Intel XE#2905] / [Intel XE#3889])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][429], [SKIP][430]) ([Intel XE#2905] / [Intel XE#3889])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@read-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][431] ([Intel XE#2905]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][432] ([Intel XE#2905]) +4 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> ([SKIP][433], [SKIP][434]) ([Intel XE#2905]) +6 other tests ( 2 skip )
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@xe_eudebug_online@interrupt-other.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-lnl:          NOTRUN -> ([SKIP][435], [SKIP][436]) ([Intel XE#2905]) +5 other tests ( 2 skip )
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_eudebug_online@resume-dss.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][437] ([Intel XE#4577])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-lnl:          NOTRUN -> ([SKIP][438], [SKIP][439]) ([Intel XE#4577])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][440], [SKIP][441]) ([Intel XE#2905]) +1 other test ( 2 skip )
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][442] ([Intel XE#4518])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][443] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][444] ([Intel XE#688]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> ([SKIP][445], [SKIP][446]) ([Intel XE#688]) +2 other tests ( 2 skip )
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][447] -> ([SKIP][448], [SKIP][449]) ([Intel XE#1392])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][450] ([Intel XE#1392]) +9 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          NOTRUN -> ([SKIP][451], [SKIP][452]) ([Intel XE#2322]) +3 other tests ( 2 skip )
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][453], [SKIP][454]) ([Intel XE#1392])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> ([SKIP][455], [SKIP][456]) ([Intel XE#1392]) +7 other tests ( 2 skip )
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][457] -> ([SKIP][458], [PASS][459]) ([Intel XE#1392]) +5 other tests ( 1 pass, 1 skip )
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][460] -> [SKIP][461] ([Intel XE#1392]) +2 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][462] ([Intel XE#2322]) +2 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][463], [SKIP][464]) ([Intel XE#288]) +9 other tests ( 2 skip )
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][465] ([Intel XE#288]) +4 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][466] ([Intel XE#288]) +26 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][467] ([Intel XE#255])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-adlp:         NOTRUN -> [SKIP][468] ([Intel XE#4045])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][469] ([Intel XE#512])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> ([SKIP][470], [SKIP][471]) ([Intel XE#512])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_mmap@small-bar.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][472] -> [DMESG-WARN][473] ([Intel XE#2953] / [Intel XE#4173])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-8/igt@xe_module_load@many-reload.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [PASS][474] -> ([PASS][475], [FAIL][476]) ([Intel XE#4541])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-4/igt@xe_oa@buffer-size.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_oa@buffer-size.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-lnl:          NOTRUN -> [FAIL][477] ([Intel XE#4541])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@non-zero-reason:
    - shard-dg2-set2:     NOTRUN -> [SKIP][478] ([Intel XE#2541] / [Intel XE#3573])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_oa@non-zero-reason.html

  * igt@xe_oa@oa-exponents:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][479], [SKIP][480]) ([Intel XE#2541] / [Intel XE#3573])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_oa@oa-exponents.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][481] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-adlp:         NOTRUN -> [SKIP][482] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][483], [SKIP][484]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test ( 2 skip )
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][485] ([Intel XE#2284])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@xe_pm@d3cold-mocs.html
    - shard-lnl:          NOTRUN -> ([SKIP][486], [SKIP][487]) ([Intel XE#2284])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@xe_pm@d3cold-mocs.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][488] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> ([SKIP][489], [SKIP][490]) ([Intel XE#2284] / [Intel XE#366]) +1 other test ( 2 skip )
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> ([SKIP][491], [SKIP][492]) ([Intel XE#584]) +1 other test ( 2 skip )
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][493] -> [ABORT][494] ([Intel XE#1794])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> ([SKIP][495], [SKIP][496]) ([Intel XE#944])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-lnl:          NOTRUN -> ([SKIP][497], [SKIP][498]) ([Intel XE#944]) +1 other test ( 2 skip )
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][499] ([Intel XE#944]) +2 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][500] ([Intel XE#944])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][501], [SKIP][502]) ([Intel XE#944]) +1 other test ( 2 skip )
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-lnl:          NOTRUN -> ([SKIP][503], [SKIP][504]) ([Intel XE#4130])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> ([SKIP][505], [SKIP][506]) ([Intel XE#4273])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][507] -> ([ABORT][508], [PASS][509]) ([Intel XE#3084])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][510] ([Intel XE#4543]) -> [PASS][511] +2 other tests pass
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][512] ([Intel XE#911]) -> ([PASS][513], [PASS][514]) +3 other tests ( 2 pass )
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [INCOMPLETE][515] ([Intel XE#3225]) -> ([PASS][516], [PASS][517])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][518] ([Intel XE#2291]) -> [PASS][519] +3 other tests pass
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][520] ([Intel XE#2291]) -> ([PASS][521], [PASS][522]) +2 other tests ( 2 pass )
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#309]) -> ([PASS][524], [PASS][525]) +2 other tests ( 2 pass )
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][526] ([Intel XE#4302]) -> ([PASS][527], [PASS][528])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#310]) -> ([PASS][530], [PASS][531])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_flip@2x-blocking-wf_vblank.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][532] ([Intel XE#2316]) -> ([PASS][533], [PASS][534]) +4 other tests ( 2 pass )
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#310]) -> [PASS][536] +1 other test pass
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][537] ([Intel XE#301]) -> [PASS][538]
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][539] ([Intel XE#3321]) -> ([PASS][540], [PASS][541])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][542] ([Intel XE#2316]) -> [PASS][543]
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][544] ([Intel XE#2882]) -> [PASS][545] +2 other tests pass
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][546] ([Intel XE#3321]) -> [PASS][547] +1 other test pass
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][548] ([Intel XE#301]) -> ([PASS][549], [PASS][550]) +1 other test ( 2 pass )
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][551] ([Intel XE#301] / [Intel XE#3149]) -> ([PASS][552], [PASS][553]) +1 other test ( 2 pass )
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][554] ([Intel XE#301]) -> ([PASS][555], [PASS][556]) +1 other test ( 2 pass )
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][557] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][558], [PASS][559]) +1 other test ( 2 pass )
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][560] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][561] +1 other test pass
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][562] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][563], [PASS][564]) +1 other test ( 2 pass )
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [INCOMPLETE][565] ([Intel XE#2049]) -> [PASS][566] +1 other test pass
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-8/igt@kms_flip@plain-flip-ts-check.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [FAIL][567] ([Intel XE#3149] / [Intel XE#886]) -> ([PASS][568], [PASS][569])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][570] ([Intel XE#886]) -> ([PASS][571], [PASS][572]) +2 other tests ( 2 pass )
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][573] ([Intel XE#4543]) -> [PASS][574] +8 other tests pass
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#656]) -> ([PASS][576], [PASS][577])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#656]) -> [PASS][579] +1 other test pass
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][580] ([Intel XE#3012]) -> [PASS][581]
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][582] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][583]
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#836]) -> [PASS][585]
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes@plane-32:
    - shard-adlp:         [DMESG-WARN][586] ([Intel XE#4173]) -> [PASS][587] +5 other tests pass
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-1/igt@kms_pm_rpm@universal-planes@plane-32.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_pm_rpm@universal-planes@plane-32.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][588] ([Intel XE#2932]) -> [PASS][589] +1 other test pass
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][590] ([Intel XE#1499]) -> [PASS][591]
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [FAIL][592] ([Intel XE#4278]) -> ([PASS][593], [PASS][594]) +1 other test ( 2 pass )
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#1392]) -> [PASS][596]
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1392]) -> ([PASS][598], [PASS][599]) +2 other tests ( 2 pass )
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][600] -> ([PASS][601], [PASS][602])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][603] ([Intel XE#1794]) -> [PASS][604]
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][605] ([Intel XE#1794]) -> [PASS][606]
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#787]) -> ([SKIP][608], [SKIP][609]) ([Intel XE#455] / [Intel XE#787]) +6 other tests ( 2 skip )
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#787]) -> [SKIP][611] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][613], [SKIP][614]) ([Intel XE#787]) +1 other test ( 2 skip )
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][615] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> ([PASS][616], [INCOMPLETE][617]) ([Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][618] ([Intel XE#1727] / [Intel XE#3113]) -> [INCOMPLETE][619] ([Intel XE#3113] / [Intel XE#4212])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][621] ([Intel XE#787]) +3 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#4418]) -> [SKIP][623] ([Intel XE#4440])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#455]) -> [FAIL][625] ([Intel XE#1178])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_content_protection@legacy.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][626] ([Intel XE#1178]) -> ([FAIL][627], [SKIP][628]) ([Intel XE#1178] / [Intel XE#2341])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][629] ([Intel XE#1178]) -> ([FAIL][630], [SKIP][631]) ([Intel XE#1178] / [Intel XE#455])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-463/igt@kms_content_protection@srm.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_content_protection@srm.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][632] ([Intel XE#1188]) -> ([SKIP][633], [FAIL][634]) ([Intel XE#1188] / [Intel XE#455])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-432/igt@kms_content_protection@uevent.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_content_protection@uevent.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][635] ([Intel XE#1188]) -> ([SKIP][636], [FAIL][637]) ([Intel XE#1188] / [Intel XE#2341])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-7/igt@kms_content_protection@uevent.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_content_protection@uevent.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][638] ([Intel XE#2291]) -> ([SKIP][639], [PASS][640]) ([Intel XE#2291])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][641] ([Intel XE#2316]) -> [FAIL][642] ([Intel XE#3321])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#310]) -> ([PASS][644], [FAIL][645]) ([Intel XE#301])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][646] ([Intel XE#3321]) -> ([FAIL][647], [PASS][648]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][649] ([Intel XE#2316]) -> ([PASS][650], [SKIP][651]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][652] ([Intel XE#4543]) -> [DMESG-FAIL][653] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][654] ([Intel XE#651]) -> [SKIP][655] ([Intel XE#656]) +3 other tests skip
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][656] ([Intel XE#2311]) -> ([SKIP][657], [SKIP][658]) ([Intel XE#2311] / [Intel XE#2312]) +12 other tests ( 2 skip )
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][659] ([Intel XE#2311]) -> [SKIP][660] ([Intel XE#2312]) +5 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][661] ([Intel XE#2312]) -> [SKIP][662] ([Intel XE#2311]) +10 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][663] ([Intel XE#2312]) -> ([SKIP][664], [SKIP][665]) ([Intel XE#2311]) +2 other tests ( 2 skip )
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#651]) -> ([SKIP][667], [SKIP][668]) ([Intel XE#651] / [Intel XE#656]) +9 other tests ( 2 skip )
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][669] ([Intel XE#2312]) -> ([SKIP][670], [SKIP][671]) ([Intel XE#4141]) +1 other test ( 2 skip )
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][672] ([Intel XE#4141]) -> ([SKIP][673], [SKIP][674]) ([Intel XE#2312] / [Intel XE#4141]) +8 other tests ( 2 skip )
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][675] ([Intel XE#4141]) -> ([SKIP][676], [SKIP][677]) ([Intel XE#2312])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][678] ([Intel XE#4141]) -> [SKIP][679] ([Intel XE#2312]) +3 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#656]) -> ([PASS][681], [SKIP][682]) ([Intel XE#656])
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][683] ([Intel XE#2312]) -> [SKIP][684] ([Intel XE#4141]) +4 other tests skip
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][685] ([Intel XE#2312]) -> ([SKIP][686], [SKIP][687]) ([Intel XE#2311] / [Intel XE#2312]) +5 other tests ( 2 skip )
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
    - shard-dg2-set2:     [SKIP][688] ([Intel XE#656]) -> ([SKIP][689], [SKIP][690]) ([Intel XE#651])
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][691] ([Intel XE#656]) -> ([SKIP][692], [SKIP][693]) ([Intel XE#651] / [Intel XE#656])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][694] ([Intel XE#651]) -> ([SKIP][695], [SKIP][696]) ([Intel XE#656])
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][697] ([Intel XE#656]) -> [SKIP][698] ([Intel XE#651]) +6 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][699] ([Intel XE#2311]) -> ([SKIP][700], [SKIP][701]) ([Intel XE#2312]) +3 other tests ( 2 skip )
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][702] ([Intel XE#2313]) -> ([SKIP][703], [SKIP][704]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][705] ([Intel XE#2312]) -> [SKIP][706] ([Intel XE#2313]) +2 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][707] ([Intel XE#2313]) -> ([SKIP][708], [SKIP][709]) ([Intel XE#2312] / [Intel XE#2313]) +12 other tests ( 2 skip )
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][710] ([Intel XE#2313]) -> [SKIP][711] ([Intel XE#2312]) +7 other tests skip
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][712] ([Intel XE#656]) -> [SKIP][713] ([Intel XE#653]) +2 other tests skip
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][714] ([Intel XE#2312]) -> ([SKIP][715], [SKIP][716]) ([Intel XE#2313]) +8 other tests ( 2 skip )
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][717] ([Intel XE#2312]) -> ([SKIP][718], [SKIP][719]) ([Intel XE#2312] / [Intel XE#2313]) +5 other tests ( 2 skip )
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][720] ([Intel XE#656]) -> ([SKIP][721], [SKIP][722]) ([Intel XE#653]) +3 other tests ( 2 skip )
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#653]) -> ([SKIP][724], [SKIP][725]) ([Intel XE#653] / [Intel XE#656]) +9 other tests ( 2 skip )
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][726] ([Intel XE#656]) -> ([SKIP][727], [SKIP][728]) ([Intel XE#653] / [Intel XE#656]) +2 other tests ( 2 skip )
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#653]) -> [SKIP][730] ([Intel XE#656]) +1 other test skip
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][731] ([Intel XE#455]) -> ([PASS][732], [SKIP][733]) ([Intel XE#455])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][734] ([Intel XE#2493]) -> [SKIP][735] ([Intel XE#4596])
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][736] ([Intel XE#1500]) -> ([SKIP][737], [SKIP][738]) ([Intel XE#1500] / [Intel XE#362])
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][739] ([Intel XE#771]) -> [FAIL][740] ([Intel XE#899]) +2 other tests fail
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][741] ([Intel XE#1392]) -> ([SKIP][742], [PASS][743]) ([Intel XE#1392])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][744] ([Intel XE#1173]) -> ([FAIL][745], [SKIP][746]) ([Intel XE#1061] / [Intel XE#1173])
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8285/shard-dg2-463/igt@xe_peer2peer@read.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_peer2peer@read.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_peer2peer@read.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
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
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
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
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4570]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8285 -> IGTPW_12840

  IGTPW_12840: 12840
  IGT_8285: 8285
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/index.html

--===============6472593722946448666==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Test async changes mid=
frame</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146795/">https://patchwork.freedesktop.org/series/146795/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12840/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8285_FULL -&gt; XEIGTPW_12840_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12840_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12840_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
840_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg=
2-433/igt@kms_plane_lowres@tiling-4.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_plane_lowre=
s@tiling-4.html">INCOMPLETE</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail=
-vm_bind_ioctl_ops_create.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@xe_fault_injection@vm-bind=
-fail-vm_bind_ioctl_ops_create.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8285_FULL and XEIGTPW_12840=
_FULL:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.92, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-hdmi-a-6:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-position-change:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.88, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12840_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_3d.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767=
</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_async_flips@test-cursor.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
40/shard-lnl-8/igt@kms_async_flips@test-cursor.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_atomic@plane-primary-overla=
y-mutable-zpos.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutab=
le-zpos.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12840/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/61=
9">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_big_fb@4-tiled-=
max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotat=
e-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/sha=
rd-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-=
270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12840/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Int=
el XE#1407</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/=
shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other t=
ests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-=
offset-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset=
-overflow.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-32bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-3=
2bpp-rotate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_big_fb@y=
f-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE=
#1124</a>) +2 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_big_fb@yf-ti=
led-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_bw@connected-linear-tiling-=
2-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_bw@connected-linear-tiling-=
2-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 2 skip =
)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-=
2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-=
2560x1440p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_bw@connected-linear-tiling-=
4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_bw@connected-linear-tiling-=
4-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_bw@connected-linear-tiling-=
4-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays=
-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays=
-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12840/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12840/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x=
1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays=
-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12840/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2160x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_bw@linear-tiling-4-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled=
-mtl-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled=
-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen1=
2-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-anoth=
er-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +64 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-anoth=
er-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +171 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12840/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-=
ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-t=
iled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12840/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 othe=
r test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel=
 XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tile=
d-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_chamelium_color@ctm-blue-to=
-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-lnl-6/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">In=
tel XE#306</a>) +1 other test ( 2 skip )</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_chamelium_color@ctm-blue-to=
-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_chamelium_color@ctm-green-t=
o-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12840/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325"=
>Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-str=
ess-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-=
single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_chamelium_hpd@common-hpd-af=
ter-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12840/shard-lnl-3/igt@kms_chamelium_hpd@common-hpd-after-suspen=
d.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-h=
ibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm-=
disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12840/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#=
2252</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12840/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Inte=
l XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_content_protection@atomic-dpm=
s@pipe-a-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12840/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_content_protection@dp-mst-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_content_protection@legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_content_protection@legacy@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
40/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">=
Intel XE#4173</a>) +8 other tests dmesg-warn</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_cursor_crc@cursor-offscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen=
-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12840/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen=
-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12840/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32=
x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12840/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Int=
el XE#1424</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_cursor_crc@cursor-random-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +23 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32=
x32.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12840/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movemen=
t-512x170.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_cursor_edge_walk@256x256-ri=
ght-edge@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_cursor_legacy@2x-long-flip-=
vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-=
vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cu=
rsor-atomic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12840/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12840/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_cursor_legacy@2x-long-non=
blocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_cursor_legacy=
@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip=
</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_cursor_legacy@forked-move.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shar=
d-dg2-436/igt@kms_cursor_legacy@forked-move.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_cur=
sor_legacy@forked-move.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) +1 other test ( =
1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_display_modes@extended-mode=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_display_modes@extended-mode=
-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12840/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/430=
2">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12840/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel X=
E#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pi=
pe-a-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-436/igt@kms_dp_linktrain_fallback@dp-fallback.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
840/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2=
-436/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-9/igt@kms_dp_linktrain_fallback@dsc-f=
allback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-f=
allback.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12840/shard-lnl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
0/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) =
+1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12840/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats=
-with-bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12840/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840=
/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_feature_discovery@display-4=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_feature_discovery@display-4=
x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12840/shard-lnl-2/igt@kms_feature_discovery@display-4x.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel X=
E#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12840/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#14=
21</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-436/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-flip-vs-=
expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +=
1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-v=
blank@bc-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank@bc-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests ( 1 fail, 1 =
pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip@2x-flip-vs-modeset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/310">Intel XE#310</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard=
-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/s=
hard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@k=
ms_flip@2x-plain-flip-fb-recreate.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other te=
sts ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ac-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-r=
ecreate-interruptible@ac-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_flip@2x-pl=
ain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-v=
blank@a-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12840/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/sha=
rd-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shar=
d-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_flip@=
flip-vs-expired-vblank.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests ( 2 fail )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@b-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/20=
49">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdm=
i-a3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible=
@a-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible=
@a-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2882">Intel XE#2882</a>) +1 other test ( 1 fail, 1 pass )</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-=
7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng@pipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip_scaled_crc@fl=
ip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-x=
tile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-9/igt@kms_flip_sca=
led_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html"=
>DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp=
-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_flip_scaled_crc@=
flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@k=
ms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1401">Intel XE#1401</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p=
-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_frontbuffer_trac=
king@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_frontbuffer_trac=
king@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +=
9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +40 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-move.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-spr-indfb-move.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests ( 1 pa=
ss, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-mmap-wc.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
c-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_frontbuffer_tracking=
@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrr=
s-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-=
fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-=
1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_=
tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)=
 +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p=
-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p=
-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_trac=
king@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +=
13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +26 other tests=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
0/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@=
kms_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_hdr@static-toggle-suspend.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-lnl-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12840/shard-lnl-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#=
4298</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_joiner@basic-max-non-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12840/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_joiner@invalid-modeset-forc=
e-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra=
-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_plane@pixel-format-source-c=
lamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_plane@pixel-format-source-c=
lamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-466/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2=
-432/igt@kms_plane_cursor@overlay.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_plane_cursor@=
overlay.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-9/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-6=
4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12840/shard-adlp-1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size=
-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1471">Intel XE#1471</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12840/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-si=
ze-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/59=
9">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_plane_multiple@tiling-y.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
40/shard-lnl-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
40/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-d=
g2-434/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</=
a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-9/igt@kms_plane_scaling@plane-downsca=
le-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_plane_scaling@plane-downsca=
le-factor-0-25-with-modifiers@pipe-b.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_plane_scalin=
g@plane-downscale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-pixel-format.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_plane_scalin=
g@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_plane=
_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">In=
tel XE#2763</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_pm_backlight@basic-brightne=
ss.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12840/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel =
XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12840/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#23=
91</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-=
lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Int=
el XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move-s=
f-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2893">Intel XE#2893</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-pla=
ne-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-pla=
ne-move-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-update-sf@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) +2 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-pl=
ane-move-continuous-exceed-sf@pipe-b-edp-1.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_psr2_s=
f@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">FAIL<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570">=
Intel XE#4570</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_psr2_sf@psr2-cursor-plane-m=
ove-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
0/shard-lnl-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_psr@fbc-pr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-o=
noff.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">I=
ntel XE#4568</a>) +3 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_psr@pr-dpms.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl=
-6/igt@kms_psr@pr-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_psr@psr-cursor-plane-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_psr@psr-sprite-plane-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_psr@psr2-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard=
-dg2-432/igt@kms_psr@psr2-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_psr_stress_test@flip-primar=
y-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_rotation_crc@primary-4-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_rotation_crc@primary-4-tile=
d-reflect-x-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12840/shard-lnl-1/igt@kms_rotation_crc@primary-4-tiled-refl=
ect-x-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12840/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-re=
flect-x-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_rotation_crc@sprite-rotatio=
n-90-pos-100-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-po=
s-100-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-=
center.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12840/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/241=
3">Intel XE#2413</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-f=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@kms_setmode@invalid-clone-exclu=
sive-crtc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12840/shard-lnl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_setmode@invalid-clone-singl=
e-crtc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12840/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
5">Intel XE#1435</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-434/igt@kms_setmode@invalid-clone-single-crtc.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
840/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2=
-432/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12840/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1435">Intel XE#1435</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12840/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_tiled_display@basic-test-p=
attern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12840/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE=
#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/s=
hard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">In=
tel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12840/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@kms_vrr@cmrr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE=
#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/44=
59">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel=
 XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_vrr@negative-basic.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/sh=
ard-lnl-2/igt@kms_vrr@negative-basic.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_writeback@writeback-fb-id-x=
rgb2101010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@kms_writeback@writeback-fb-id-x=
rgb2101010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-lnl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12840/shard-dg2-435/igt@kms_writeback@writeback-invalid-param=
eters.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@testdisplay.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear=
-0x369.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12840/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
3">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-=
0xfffe.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12840/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
6">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@xe_create@multigpu-create-massi=
ve-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@xe_eudebug@basic-exec-queues.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_eudebug@basic-vm-access-par=
ameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@xe_eudebug@basic-vm-access-para=
meters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@xe_eudebug@basic-vm-access-para=
meters-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_eudebug@basic-vm-access-parameters-=
userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufen=
ce-delay-ack.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12840/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-=
ack.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_eudebug@read-metadata.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@xe_eudebug_online@breakpoint-man=
y-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@xe_eudebug_online@interrupt-oth=
er.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12840/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel=
 XE#2905</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_eudebug_online@resume-dss.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
840/shard-lnl-8/igt@xe_eudebug_online@resume-dss.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12840/shard-lnl-3/igt@xe_eudebug_online@set-breakpoint-si=
gint-debugger.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-sram-target-sram.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@xe_eudebug_online@writ=
es-caching-vram-bb-sram-target-sram.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other =
test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@xe_evict@evict-beng-large-exter=
nal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-s=
tandalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-s=
tandalone-instantfree-samefd.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_evict_ccs@evict-overc=
ommit-standalone-instantfree-samefd.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-rebind.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-=
many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-=
null.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">I=
ntel XE#2322</a>) +3 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exe=
c-null.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
2">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-=
null-defer-mmap.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12840/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-null-d=
efer-mmap.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate-race.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-on=
ce-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@xe_exec_ba=
sic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexe=
cqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@xe_exec_fault_mode@many-userp=
tr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12840/shard-dg2-464/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel =
XE#288</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindex=
ecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +26 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">=
Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@xe_mmap@pci-membarrier-bad-page=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@xe_mmap@small-bar.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Inte=
l XE#512</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_mmap@small-bar.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-l=
nl-5/igt@xe_mmap@small-bar.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-8/igt@xe_module_load@many-reload.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adl=
p-8/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-4/igt@xe_oa@buffer-size.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@x=
e_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12840/shard-lnl-5/igt@xe_oa@buffer-size.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel X=
E#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_oa@non-zero-reason.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541=
">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_oa@oa-exponents.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shar=
d-dg2-435/igt@xe_oa@oa-exponents.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-2/igt@xe_oa@privileged-forked-access-=
vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-1/igt@xe_oa@syncs-syncobj-wait.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
>Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4501">Intel XE#4501</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@xe_pm@d3cold-mocs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@xe_pm@d3cold-mocs.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-l=
nl-5/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12840/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#22=
84</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366=
">Intel XE#366</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840=
/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 o=
ther test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-9=
/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycl=
es.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12840/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_query@multigpu-query-invalid=
-cs-cycles.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-lnl-2/igt@xe_query@multigpu-query-invalid-cs-cycles.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@xe_query@multigpu-query-topology=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw=
-version-huc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12840/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-=
huc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-1/igt@xe_sriov_auto_provisioning@self=
config-reprovision-reduce-numvfs.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-7/igt@xe_sriov_auto_provis=
ioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-lnl-3/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-l=
nl-3/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_wedged@wedg=
ed-mode-toggle.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_async_flips@async-flip-suspe=
nd-resume.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@kms_async_flip=
s@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/ig=
t@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html=
">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-18=
0-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-4/igt@kms_big_fb@x-t=
iled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12840/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-ato=
mic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12840/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atom=
ic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12840/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PA=
SS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa=
-varying-size.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12840/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840=
/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel =
XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12840/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-4=
34/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316=
">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a>=
) +4 other tests ( 2 pass )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-rac=
e-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-=
dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_flip@2x-wf_vblank-=
ts-check-interruptible@ac-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-inte=
rruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12840/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840=
/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a>) +1 =
other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblan=
k@c-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12840/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"=
>PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12840/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdm=
i-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html=
">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel X=
E#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard=
-bmg-8/igt@kms_flip@flip-vs-suspend.html">PASS</a>) +1 other test ( 2 pass =
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-6/igt@kms_flip@flip-vs-susp=
end-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"=
>Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c=
-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a>)=
 +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-8/igt@kms_flip@plain-flip-ts-check.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Int=
el XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12840/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3=
149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/88=
6">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12840/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-l=
nl-7/igt@kms_flip@wf_vblank-ts-check.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Inte=
l XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-l=
nl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a>) +2 other tests =
( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adlp-8/igt@kms_frontbuffe=
r_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +8 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-435/igt@kms_frontb=
uffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Inte=
l XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12840/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">I=
ntel XE#2685</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3307">Intel XE#3307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_plane_scaling@intel-max-src=
-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#=
836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-32:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-1/igt@kms_pm_rpm@universal-planes@plane-32.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12840/shard-adlp-4/igt@kms_pm_rpm@universal-planes@plane-32.=
html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-e=
dp-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-5/igt@kms_vblank@ts-continuat=
ion-dpms-suspend@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
0/shard-bmg-2/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-d=
rm_xe_engine_class_compute.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-lnl-6/igt@xe_com=
pute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/=
shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engin=
e_class_compute.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@xe_exec_basic@m=
ultigpu-many-execqueues-many-vm-null-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@xe_exec_basic@mult=
igpu-many-execqueues-many-vm-null-rebind.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@xe_exec_ba=
sic@multigpu-many-execqueues-many-vm-null-rebind.html">PASS</a>) +2 other t=
ests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr-i=
nvalidate.html">DMESG-WARN</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12840/shard-lnl-8/igt@xe_exec_threads@threads-hang-sh=
ared-vm-userptr-invalidate.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12840/shard-lnl-2/igt@xe_exec_threads@threads-ha=
ng-shared-vm-userptr-invalidate.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/sh=
ard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1=
794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2840/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe=
-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_ccs@bad-aux-strid=
e-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_ccs@bad-au=
x-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-=
rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_ccs@crc=
-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-cc=
s-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt=
@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/s=
hard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-=
hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shar=
d-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-46=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#=
2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_ccs=
@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418=
">Intel XE#4418</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12840/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12840/shard-dg2-432/igt@kms_content_protection@legacy.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1=
178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12840/shard-bmg-2/igt@kms_content_protection@lic-type-0.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-b=
mg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel X=
E#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-463/igt@kms_content_protection@srm.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#=
1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12840/shard-dg2-466/igt@kms_content_protection@srm.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt=
@kms_content_protection@srm.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-432/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel =
XE#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12840/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-4=
32/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-7/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12840/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt=
@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flip=
a-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-var=
ying-size.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12840/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">In=
tel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">In=
tel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12840/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/sha=
rd-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">I=
ntel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12840/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/s=
hard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#231=
6</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-adl=
p-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other test=
s dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-1/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel =
XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffe=
r_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_=
frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +5 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontb=
uffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
6">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2312">Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-3/igt@kms_frontbuffer_t=
racking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-2/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-8/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-bmg-6/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-463/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-466/igt@kms_frontb=
uffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-436/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_frontbuffer_trackin=
g@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/sh=
ard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-434/igt@kms_hdr@invalid=
-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel =
XE#2493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12840/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE=
#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12840/shard-dg2-464/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12840/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_exec_basic@mul=
tigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-433/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8285/shard-dg2-463/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12840/sh=
ard-dg2-464/igt@xe_peer2peer@read.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12840/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8285 -&gt; IGTPW_12840</li>
</ul>
<p>IGTPW_12840: 12840<br />
  IGT_8285: 8285<br />
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8</p>

</body>
</html>

--===============6472593722946448666==--
