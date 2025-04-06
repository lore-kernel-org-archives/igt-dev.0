Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7FDC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 16:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB7210E068;
	Sun,  6 Apr 2025 16:45:24 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C430010E068;
 Sun,  6 Apr 2025 16:45:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4397158228191255250=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/i915/fbc=3A_update_fbc?=
 =?utf-8?q?_support_based_on_psr_mode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 16:45:22 -0000
Message-ID: <174395792277.41102.5134332229639913470@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327080358.559968-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250327080358.559968-1-vinod.govindapillai@intel.com>
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

--===============4397158228191255250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915/fbc: update fbc support based on psr mode (rev2)
URL   : https://patchwork.freedesktop.org/series/146845/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8289_FULL -> XEIGTPW_12853_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12853_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12853_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12853_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][1] -> ([INCOMPLETE][2], [PASS][3]) +1 other test ( 1 incomplete, 1 pass )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_plane_lowres@tiling-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [PASS][4] -> ([FAIL][5], [PASS][6])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_pm_rpm@i2c.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_pm_rpm@i2c.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_pm_rpm@i2c.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          NOTRUN -> ([PASS][7], [ABORT][8])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12853_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#3767]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][10] -> ([FAIL][11], [PASS][12]) ([Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> ([SKIP][13], [SKIP][14]) ([Intel XE#3768])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3279])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> ([SKIP][16], [SKIP][17]) ([Intel XE#1407]) +2 other tests ( 2 skip )
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#2327]) +1 other test ( 2 skip )
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1124]) +9 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> ([SKIP][21], [SKIP][22]) ([Intel XE#3658])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-bmg:          [PASS][23] -> ([INCOMPLETE][24], [PASS][25]) ([Intel XE#3225])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2327]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#316])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#316]) +3 other tests ( 2 skip )
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][30] ([Intel XE#4543]) +3 other tests dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#610])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][32] -> [DMESG-FAIL][33] ([Intel XE#4543]) +10 other tests dmesg-fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#1124]) +12 other tests ( 2 skip )
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1124]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1124])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#619])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#607])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> ([SKIP][42], [SKIP][43]) ([Intel XE#1477])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#1124]) +6 other tests ( 2 skip )
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#1124]) +6 other tests ( 2 skip )
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][48] -> ([SKIP][49], [PASS][50]) ([Intel XE#2191])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> ([PASS][51], [SKIP][52]) ([Intel XE#2314] / [Intel XE#2894])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#2191])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2314] / [Intel XE#2894])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#2191]) +1 other test ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> ([SKIP][57], [SKIP][58]) ([Intel XE#1512]) +1 other test ( 2 skip )
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#367])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> ([SKIP][60], [SKIP][61]) ([Intel XE#367]) +1 other test ( 2 skip )
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#367]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#367])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#367])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][67], [SKIP][68]) ([Intel XE#455] / [Intel XE#787]) +27 other tests ( 2 skip )
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455] / [Intel XE#787]) +34 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#2907]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][71], [SKIP][72]) ([Intel XE#2669]) +7 other tests ( 2 skip )
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#787]) +172 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#2887]) +8 other tests ( 2 skip )
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#2907])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][78], [SKIP][79]) ([Intel XE#2652] / [Intel XE#787]) +17 other tests ( 2 skip )
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#3442])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#3432]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#787]) +23 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2887]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2887]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][89], [SKIP][90]) ([Intel XE#787]) +74 other tests ( 2 skip )
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][91] -> ([INCOMPLETE][92], [INCOMPLETE][93]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][94] ([Intel XE#2705] / [Intel XE#4212])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][95], [INCOMPLETE][96]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][97] -> ([PASS][98], [INCOMPLETE][99]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][100] -> [INCOMPLETE][101] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#2724])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#373]) +3 other tests ( 2 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([Intel XE#2325])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#306])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-lnl:          NOTRUN -> ([SKIP][110], [SKIP][111]) ([Intel XE#306]) +1 other test ( 2 skip )
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_chamelium_color@ctm-limited-range.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#306]) +1 other test ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#306]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#373]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2252]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][117], [SKIP][118]) ([Intel XE#2252]) +4 other tests ( 2 skip )
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#373]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#373]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][121], [SKIP][122]) ([Intel XE#373]) +3 other tests ( 2 skip )
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][123], [FAIL][124]) ([Intel XE#1178])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][125], [SKIP][126]) ([Intel XE#307])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> ([SKIP][127], [SKIP][128]) ([Intel XE#307])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-0.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#307])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> ([SKIP][130], [SKIP][131]) ([Intel XE#2390])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][132] ([Intel XE#1178]) +5 other tests fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][133], [FAIL][134]) ([Intel XE#1178])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][135], [FAIL][136]) ([Intel XE#3304])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][137], [FAIL][138]) ([Intel XE#1178] / [Intel XE#455])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_content_protection@srm.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][139] ([Intel XE#1178]) +2 other tests fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [PASS][140] -> [DMESG-WARN][141] ([Intel XE#4173]) +10 other tests dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#308])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([Intel XE#1424]) +1 other test ( 2 skip )
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2321])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([Intel XE#2320]) +3 other tests ( 2 skip )
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2320])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][149], [PASS][150]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
    - shard-lnl:          NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#309]) +1 other test ( 2 skip )
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#309])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2291])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][155] -> ([PASS][156], [SKIP][157]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2286])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [PASS][159] -> ([INCOMPLETE][160], [PASS][161]) ([Intel XE#3226])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> ([SKIP][162], [PASS][163]) ([Intel XE#2291])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][164] -> ([SKIP][165], [SKIP][166]) ([Intel XE#309])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][167] -> ([PASS][168], [SKIP][169]) ([Intel XE#309]) +7 other tests ( 1 pass, 1 skip )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][170] -> [SKIP][171] ([Intel XE#2291]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][172] -> ([SKIP][173], [SKIP][174]) ([Intel XE#2291])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][175], [SKIP][176]) ([Intel XE#2286])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> ([SKIP][177], [SKIP][178]) ([Intel XE#4354])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][179], [SKIP][180]) ([Intel XE#4356])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][181] -> ([SKIP][182], [SKIP][183]) ([Intel XE#4331])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> ([SKIP][184], [SKIP][185]) ([Intel XE#2244]) +1 other test ( 2 skip )
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#4422])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][187], [SKIP][188]) ([Intel XE#4422])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> ([SKIP][189], [SKIP][190]) ([Intel XE#4422])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> ([SKIP][191], [SKIP][192]) ([Intel XE#776])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#776]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][194], [SKIP][195]) ([Intel XE#1135])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][196] -> ([PASS][197], [SKIP][198]) ([Intel XE#310]) +4 other tests ( 1 pass, 1 skip )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [PASS][199] -> [SKIP][200] ([Intel XE#2316]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][201] ([Intel XE#310]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     NOTRUN -> ([PASS][202], [SKIP][203]) ([Intel XE#310]) +1 other test ( 1 pass, 1 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][204], [PASS][205]) ([Intel XE#3321])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][206], [FAIL][207]) ([Intel XE#3321]) +3 other tests ( 2 fail )
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][208] -> [FAIL][209] ([Intel XE#301] / [Intel XE#3321])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][210] -> [FAIL][211] ([Intel XE#301]) +1 other test fail
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][212] -> ([FAIL][213], [PASS][214]) ([Intel XE#3321])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][215] -> ([PASS][216], [FAIL][217]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][218] -> ([FAIL][219], [FAIL][220]) ([Intel XE#3321])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][221], [SKIP][222]) ([Intel XE#310])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [PASS][223] -> [SKIP][224] ([Intel XE#310])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][225] -> ([SKIP][226], [SKIP][227]) ([Intel XE#2316])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#310]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][229] -> ([PASS][230], [SKIP][231]) ([Intel XE#2316]) +7 other tests ( 1 pass, 1 skip )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][232], [PASS][233]) ([Intel XE#2882])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][234] -> ([PASS][235], [FAIL][236]) ([Intel XE#2882])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][237] -> ([INCOMPLETE][238], [FAIL][239]) ([Intel XE#2049] / [Intel XE#2882]) +1 other test ( 1 fail, 1 incomplete )
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][240] -> [FAIL][241] ([Intel XE#2882])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][242], [INCOMPLETE][243]) ([Intel XE#2049])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-dp2-hdmi-a3.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#1421]) +1 other test ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][246], [INCOMPLETE][247]) ([Intel XE#2049]) +1 other test ( 1 incomplete, 1 pass )
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [PASS][248] -> ([PASS][249], [FAIL][250]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [FAIL][251] ([Intel XE#3321]) +2 other tests fail
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][252] -> ([FAIL][253], [FAIL][254]) ([Intel XE#301]) +1 other test ( 2 fail )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][255] ([Intel XE#1401] / [Intel XE#1745])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#1401])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][257], [SKIP][258]) ([Intel XE#2293] / [Intel XE#2380]) +3 other tests ( 2 skip )
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][259] ([Intel XE#455]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][260], [SKIP][261]) ([Intel XE#1401]) +4 other tests ( 2 skip )
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#1397] / [Intel XE#1745]) +1 other test ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#1397]) +1 other test ( 2 skip )
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][266] -> [DMESG-FAIL][267] ([Intel XE#324] / [Intel XE#4543]) +1 other test dmesg-fail
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#2293] / [Intel XE#2380])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][269] ([Intel XE#2293])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#1401] / [Intel XE#1745]) +4 other tests ( 2 skip )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][272], [SKIP][273]) ([Intel XE#455]) +12 other tests ( 2 skip )
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][274] ([Intel XE#455]) +20 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][275], [SKIP][276]) ([Intel XE#2293]) +3 other tests ( 2 skip )
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> ([SKIP][277], [SKIP][278]) ([Intel XE#651]) +3 other tests ( 2 skip )
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][279] ([Intel XE#656]) +20 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
    - shard-bmg:          NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][282], [SKIP][283]) ([Intel XE#651] / [Intel XE#656]) +3 other tests ( 2 skip )
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][284] ([Intel XE#651]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][285] ([Intel XE#656]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][286], [SKIP][287]) ([Intel XE#651]) +15 other tests ( 2 skip )
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][288], [SKIP][289]) ([Intel XE#2311]) +13 other tests ( 2 skip )
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#4141]) +6 other tests ( 2 skip )
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][292] ([Intel XE#4141]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([PASS][293], [SKIP][294]) ([Intel XE#656]) +4 other tests ( 1 pass, 1 skip )
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][295], [SKIP][296]) ([Intel XE#2312] / [Intel XE#4141])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
    - shard-dg2-set2:     [PASS][297] -> [SKIP][298] ([Intel XE#656]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][299] -> ([PASS][300], [SKIP][301]) ([Intel XE#656]) +5 other tests ( 1 pass, 1 skip )
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][302] ([Intel XE#2312]) +4 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][303] ([Intel XE#1151])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][304] ([Intel XE#651]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][305] ([Intel XE#2311]) +7 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#656]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][307], [SKIP][308]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][309], [SKIP][310]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][311] ([Intel XE#651])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][312], [SKIP][313]) ([Intel XE#653] / [Intel XE#656]) +4 other tests ( 2 skip )
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][314] ([Intel XE#653]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> ([SKIP][315], [SKIP][316]) ([Intel XE#656]) +20 other tests ( 2 skip )
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][317] ([Intel XE#653]) +6 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][318], [SKIP][319]) ([Intel XE#653]) +20 other tests ( 2 skip )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][320] ([Intel XE#2313]) +11 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][321], [SKIP][322]) ([Intel XE#2312] / [Intel XE#2313]) +7 other tests ( 2 skip )
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][323], [SKIP][324]) ([Intel XE#2313]) +14 other tests ( 2 skip )
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> ([SKIP][325], [SKIP][326]) ([Intel XE#1503])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_hdr@invalid-metadata-sizes.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][327] ([Intel XE#4298])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][328] ([Intel XE#346])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][329] ([Intel XE#2925])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> ([SKIP][330], [SKIP][331]) ([Intel XE#2934])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][332] ([Intel XE#4173]) +1 other test dmesg-warn
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> ([SKIP][333], [SKIP][334]) ([Intel XE#4329])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> ([SKIP][335], [SKIP][336]) ([Intel XE#599])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_plane_lowres@tiling-yf.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [PASS][337] -> [SKIP][338] ([Intel XE#4596])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-4.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     NOTRUN -> [SKIP][339] ([Intel XE#4596])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][340] -> ([SKIP][341], [PASS][342]) ([Intel XE#2571])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> ([SKIP][343], [SKIP][344]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][345], [SKIP][346]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][347], [SKIP][348]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> ([SKIP][349], [SKIP][350]) ([Intel XE#870]) +1 other test ( 2 skip )
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][351] ([Intel XE#870])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][352] ([Intel XE#870])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][353], [SKIP][354]) ([Intel XE#1122])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][355] ([Intel XE#1129])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
    - shard-lnl:          [PASS][356] -> ([PASS][357], [FAIL][358]) ([Intel XE#718])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][359], [SKIP][360]) ([Intel XE#3309])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][361] ([Intel XE#3309])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][362] ([Intel XE#3309])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> ([FAIL][363], [FAIL][364]) ([Intel XE#1430])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> ([SKIP][365], [SKIP][366]) ([Intel XE#1439] / [Intel XE#836])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][367], [SKIP][368]) ([Intel XE#2893]) +2 other tests ( 2 skip )
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#1489]) +7 other tests ( 2 skip )
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> ([SKIP][371], [SKIP][372]) ([Intel XE#1489]) +5 other tests ( 2 skip )
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][373] ([Intel XE#1489])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][374] ([Intel XE#1489]) +3 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][375] ([Intel XE#1489]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][376], [SKIP][377]) ([Intel XE#2850] / [Intel XE#929]) +16 other tests ( 2 skip )
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_psr@fbc-pr-dpms.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> ([SKIP][378], [SKIP][379]) ([Intel XE#2234] / [Intel XE#2850]) +6 other tests ( 2 skip )
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_psr@fbc-pr-no-drrs.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][380] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html
    - shard-lnl:          NOTRUN -> ([FAIL][381], [SKIP][382]) ([Intel XE#1406] / [Intel XE#4568])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][383], [FAIL][384]) ([Intel XE#4568] / [Intel XE#4609])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][385] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][386] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][387], [SKIP][388]) ([Intel XE#1406]) +1 other test ( 2 skip )
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@kms_psr@pr-basic.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_psr@pr-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][389], [SKIP][390]) ([Intel XE#2414])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][391] ([Intel XE#1127])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][392] ([Intel XE#2330])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][393], [SKIP][394]) ([Intel XE#3414]) +1 other test ( 2 skip )
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-lnl:          NOTRUN -> ([SKIP][395], [SKIP][396]) ([Intel XE#3414] / [Intel XE#3904])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-270.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][397], [SKIP][398]) ([Intel XE#3414] / [Intel XE#3904]) +3 other tests ( 2 skip )
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> ([SKIP][399], [SKIP][400]) ([Intel XE#1435])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][401] -> [FAIL][402] ([Intel XE#771] / [Intel XE#899])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][403] -> [FAIL][404] ([Intel XE#899])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][405] -> ([PASS][406], [FAIL][407]) ([Intel XE#4459]) +1 other test ( 1 fail, 1 pass )
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][408], [SKIP][409]) ([Intel XE#1499]) +1 other test ( 2 skip )
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][410], [SKIP][411]) ([Intel XE#2168])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_vrr@lobf.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][412] ([Intel XE#1499])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][413] ([Intel XE#756])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][414], [SKIP][415]) ([Intel XE#756])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> ([SKIP][416], [SKIP][417]) ([Intel XE#756])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_writeback@writeback-pixel-formats.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][418] ([Intel XE#455] / [Intel XE#488])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][419], [SKIP][420]) ([Intel XE#1280] / [Intel XE#455]) +1 other test ( 2 skip )
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][421] ([Intel XE#1123])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][422] ([Intel XE#1126])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         NOTRUN -> [SKIP][423] ([Intel XE#944]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@xe_create@multigpu-create-massive-size.html
    - shard-lnl:          NOTRUN -> ([SKIP][424], [SKIP][425]) ([Intel XE#944]) +1 other test ( 2 skip )
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@xe_create@multigpu-create-massive-size.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][426], [SKIP][427]) ([Intel XE#2905]) +9 other tests ( 2 skip )
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_eudebug@basic-close.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> ([SKIP][428], [SKIP][429]) ([Intel XE#2905]) +5 other tests ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@xe_eudebug@basic-connect.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> ([SKIP][430], [SKIP][431]) ([Intel XE#2905]) +8 other tests ( 2 skip )
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@xe_eudebug@basic-read-event.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][432] ([Intel XE#2905] / [Intel XE#3889]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][433] ([Intel XE#2905]) +4 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][434] ([Intel XE#2905]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][435] ([Intel XE#2905])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][436] ([Intel XE#4518])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         NOTRUN -> [SKIP][437] ([Intel XE#4519])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-bmg:          NOTRUN -> ([SKIP][438], [SKIP][439]) ([Intel XE#4518])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][440] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][441] ([Intel XE#688])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
    - shard-lnl:          NOTRUN -> ([SKIP][442], [SKIP][443]) ([Intel XE#688]) +3 other tests ( 2 skip )
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          NOTRUN -> ([SKIP][444], [SKIP][445]) ([Intel XE#2322]) +3 other tests ( 2 skip )
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][446] -> [SKIP][447] ([Intel XE#1392]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> ([PASS][448], [INCOMPLETE][449]) ([Intel XE#2594])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][450], [PASS][451]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][452] ([Intel XE#1392]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][453] ([Intel XE#2322]) +5 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][454] ([Intel XE#1392]) +2 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
    - shard-dg2-set2:     [PASS][455] -> ([PASS][456], [SKIP][457]) ([Intel XE#1392]) +4 other tests ( 1 pass, 1 skip )
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> ([SKIP][458], [SKIP][459]) ([Intel XE#1392]) +1 other test ( 2 skip )
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][460] ([Intel XE#288]) +9 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][461] ([Intel XE#288]) +6 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][462], [SKIP][463]) ([Intel XE#288]) +22 other tests ( 2 skip )
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][464], [SKIP][465]) ([Intel XE#2360])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][466] ([Intel XE#2905]) +2 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> ([SKIP][467], [SKIP][468]) ([Intel XE#2229])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][469] ([Intel XE#4045])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@xe_mmap@pci-membarrier.html
    - shard-adlp:         NOTRUN -> [SKIP][470] ([Intel XE#4045])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> ([SKIP][471], [SKIP][472]) ([Intel XE#586])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@xe_mmap@small-bar.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][473] ([Intel XE#1416])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@xe_mmap@vram.html
    - shard-adlp:         NOTRUN -> [SKIP][474] ([Intel XE#1008])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> ([SKIP][475], [SKIP][476]) ([Intel XE#2457])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@xe_module_load@force-load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][477] -> [DMESG-WARN][478] ([Intel XE#2953] / [Intel XE#4173])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-8/igt@xe_module_load@many-reload.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-lnl:          NOTRUN -> [FAIL][479] ([Intel XE#4541])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][480] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@short-reads:
    - shard-dg2-set2:     NOTRUN -> [SKIP][481] ([Intel XE#2541] / [Intel XE#3573])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_oa@short-reads.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][482] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][483], [SKIP][484]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests ( 2 skip )
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][485], [SKIP][486]) ([Intel XE#2541] / [Intel XE#3573]) +5 other tests ( 2 skip )
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][487], [SKIP][488]) ([Intel XE#2838] / [Intel XE#979])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][489] ([Intel XE#1061])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][490], [SKIP][491]) ([Intel XE#2284] / [Intel XE#366]) +1 other test ( 2 skip )
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][492] ([Intel XE#2284])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@xe_pm@d3cold-mocs.html
    - shard-bmg:          NOTRUN -> [SKIP][493] ([Intel XE#2284])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][494] ([Intel XE#2284] / [Intel XE#366])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][495] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> ([SKIP][496], [SKIP][497]) ([Intel XE#2284] / [Intel XE#366])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][498] -> [ABORT][499] ([Intel XE#1794]) +1 other test abort
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][500], [SKIP][501]) ([Intel XE#579])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][502] ([Intel XE#579])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          NOTRUN -> ([SKIP][503], [SKIP][504]) ([Intel XE#579])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> ([SKIP][505], [SKIP][506]) ([Intel XE#944]) +2 other tests ( 2 skip )
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][507], [SKIP][508]) ([Intel XE#944]) +2 other tests ( 2 skip )
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][509] ([Intel XE#4130])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][510], [SKIP][511]) ([Intel XE#4130])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][512] ([Intel XE#4130])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][513], [SKIP][514]) ([Intel XE#3342])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][515] ([Intel XE#4273])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][516] -> ([PASS][517], [ABORT][518]) ([Intel XE#3084])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][519] ([Intel XE#4543]) -> [PASS][520] +2 other tests pass
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#2191]) -> ([PASS][522], [PASS][523])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][524] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][525]
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm:
    - shard-dg2-set2:     [INCOMPLETE][526] -> [PASS][527] +1 other test pass
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][528] ([Intel XE#2291]) -> ([PASS][529], [PASS][530])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [INCOMPLETE][531] ([Intel XE#3226]) -> ([PASS][532], [PASS][533]) +1 other test ( 2 pass )
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#309]) -> ([PASS][535], [PASS][536])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][537] ([Intel XE#2291]) -> [PASS][538] +1 other test pass
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-adlp:         [DMESG-WARN][539] ([Intel XE#4173]) -> [PASS][540] +1 other test pass
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#4302]) -> ([PASS][542], [PASS][543])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_display_modes@extended-mode-basic.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][544] ([Intel XE#1340]) -> ([PASS][545], [PASS][546])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][547] ([Intel XE#2316]) -> ([PASS][548], [PASS][549]) +6 other tests ( 2 pass )
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][550] ([Intel XE#2316]) -> [PASS][551] +3 other tests pass
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][552] ([Intel XE#301]) -> ([PASS][553], [PASS][554]) +1 other test ( 2 pass )
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#310]) -> ([PASS][556], [PASS][557]) +3 other tests ( 2 pass )
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_flip@2x-plain-flip.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_flip@2x-plain-flip.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][558] ([Intel XE#3149] / [Intel XE#886]) -> ([PASS][559], [PASS][560])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][561] ([Intel XE#301]) -> [PASS][562] +1 other test pass
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][563] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][564] +2 other tests pass
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][565] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][566], [PASS][567])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [INCOMPLETE][568] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][569]
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][570] ([Intel XE#886]) -> ([PASS][571], [PASS][572]) +6 other tests ( 2 pass )
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:
    - shard-adlp:         [FAIL][573] ([Intel XE#2882]) -> [PASS][574] +3 other tests pass
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-9/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][575] ([Intel XE#4543]) -> [PASS][576] +6 other tests pass
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#656]) -> ([PASS][578], [PASS][579]) +5 other tests ( 2 pass )
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#656]) -> [PASS][581] +1 other test pass
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-swap:
    - shard-dg2-set2:     [FAIL][582] ([Intel XE#4426]) -> ([PASS][583], [PASS][584])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@static-swap.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_hdr@static-swap.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-swap@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][585] ([Intel XE#4426]) -> [PASS][586]
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@static-swap@pipe-a-dp-4.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_hdr@static-swap@pipe-a-dp-4.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [INCOMPLETE][587] -> ([PASS][588], [PASS][589]) +1 other test ( 2 pass )
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_plane_lowres@tiling-x.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_plane_lowres@tiling-x.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][590] ([Intel XE#4540]) -> [PASS][591] +1 other test pass
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][592] ([Intel XE#2883]) -> ([PASS][593], [PASS][594]) +6 other tests ( 2 pass )
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_setmode@basic.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_setmode@basic.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][595] ([Intel XE#2883]) -> ([PASS][596], [PASS][597]) +2 other tests ( 2 pass )
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][598] ([Intel XE#1499]) -> [PASS][599]
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_vrr@negative-basic.html
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#455]) -> [PASS][601]
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#1392]) -> [PASS][603]
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [SKIP][604] ([Intel XE#1392]) -> ([PASS][605], [PASS][606]) +1 other test ( 2 pass )
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][607] ([Intel XE#1794]) -> [PASS][608]
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][609] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][610], [SKIP][611]) ([Intel XE#2314] / [Intel XE#2894])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][613] ([Intel XE#787]) +2 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][615], [SKIP][616]) ([Intel XE#787]) +4 other tests ( 2 skip )
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#787]) -> ([SKIP][618], [SKIP][619]) ([Intel XE#455] / [Intel XE#787]) +11 other tests ( 2 skip )
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#787]) -> [SKIP][621] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][622] ([Intel XE#1727] / [Intel XE#3113]) -> ([INCOMPLETE][623], [INCOMPLETE][624]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#4418]) -> ([SKIP][626], [SKIP][627]) ([Intel XE#4418] / [Intel XE#4440])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][628] ([Intel XE#2341]) -> ([FAIL][629], [FAIL][630]) ([Intel XE#1178])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_content_protection@atomic.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_content_protection@atomic.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][631] ([Intel XE#1178]) -> ([FAIL][632], [SKIP][633]) ([Intel XE#1178] / [Intel XE#455])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][634] ([Intel XE#1178]) -> ([SKIP][635], [FAIL][636]) ([Intel XE#1178] / [Intel XE#2341])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][637] ([Intel XE#1188]) -> ([SKIP][638], [SKIP][639]) ([Intel XE#455])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_content_protection@uevent.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_content_protection@uevent.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][640] ([Intel XE#2291]) -> ([SKIP][641], [PASS][642]) ([Intel XE#2291])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][643] ([Intel XE#4302]) -> ([SKIP][644], [PASS][645]) ([Intel XE#4302])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][646] ([Intel XE#3321]) -> ([PASS][647], [FAIL][648]) ([Intel XE#3321]) +2 other tests ( 1 fail, 1 pass )
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#310]) -> ([PASS][650], [SKIP][651]) ([Intel XE#310]) +1 other test ( 1 pass, 1 skip )
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][652] ([Intel XE#2316]) -> ([PASS][653], [SKIP][654]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][655] ([Intel XE#2316]) -> ([FAIL][656], [INCOMPLETE][657]) ([Intel XE#2049] / [Intel XE#2882])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][658] ([Intel XE#301]) -> ([PASS][659], [FAIL][660]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][661] ([Intel XE#301]) -> ([PASS][662], [FAIL][663]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][664] ([Intel XE#301] / [Intel XE#3149]) -> ([PASS][665], [FAIL][666]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][667] ([Intel XE#4543]) -> [DMESG-FAIL][668] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][669] ([Intel XE#2312]) -> [SKIP][670] ([Intel XE#2311]) +4 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][671] ([Intel XE#651]) -> [SKIP][672] ([Intel XE#656]) +3 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#651]) -> ([SKIP][674], [SKIP][675]) ([Intel XE#651] / [Intel XE#656]) +11 other tests ( 2 skip )
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][676] ([Intel XE#656]) -> ([SKIP][677], [SKIP][678]) ([Intel XE#651] / [Intel XE#656]) +4 other tests ( 2 skip )
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][679] ([Intel XE#2312]) -> ([SKIP][680], [SKIP][681]) ([Intel XE#2311] / [Intel XE#2312]) +9 other tests ( 2 skip )
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][682] ([Intel XE#656]) -> ([SKIP][683], [SKIP][684]) ([Intel XE#651]) +7 other tests ( 2 skip )
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][685] ([Intel XE#2312]) -> [SKIP][686] ([Intel XE#4141])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][687] ([Intel XE#4141]) -> ([SKIP][688], [SKIP][689]) ([Intel XE#2312])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][690] ([Intel XE#2312]) -> ([SKIP][691], [SKIP][692]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][693] ([Intel XE#2312]) -> ([SKIP][694], [SKIP][695]) ([Intel XE#2312] / [Intel XE#4141]) +2 other tests ( 2 skip )
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][696] ([Intel XE#4141]) -> ([SKIP][697], [SKIP][698]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][699] ([Intel XE#4141]) -> [SKIP][700] ([Intel XE#2312]) +4 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][701] ([Intel XE#2311]) -> ([SKIP][702], [SKIP][703]) ([Intel XE#2311] / [Intel XE#2312]) +11 other tests ( 2 skip )
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][704] ([Intel XE#2311]) -> [SKIP][705] ([Intel XE#2312]) +6 other tests skip
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][706] ([Intel XE#656]) -> [SKIP][707] ([Intel XE#651]) +3 other tests skip
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][708] ([Intel XE#2311]) -> ([SKIP][709], [SKIP][710]) ([Intel XE#2312])
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][711] ([Intel XE#2312]) -> ([SKIP][712], [SKIP][713]) ([Intel XE#2311]) +9 other tests ( 2 skip )
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][714] ([Intel XE#656]) -> ([SKIP][715], [SKIP][716]) ([Intel XE#653] / [Intel XE#656]) +2 other tests ( 2 skip )
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][717] ([Intel XE#2312]) -> ([SKIP][718], [SKIP][719]) ([Intel XE#2313]) +6 other tests ( 2 skip )
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][720] ([Intel XE#2312]) -> [SKIP][721] ([Intel XE#2313]) +9 other tests skip
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][722] ([Intel XE#2312]) -> ([SKIP][723], [SKIP][724]) ([Intel XE#2312] / [Intel XE#2313]) +7 other tests ( 2 skip )
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][725] ([Intel XE#2313]) -> ([SKIP][726], [SKIP][727]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][728] ([Intel XE#653]) -> [SKIP][729] ([Intel XE#656]) +3 other tests skip
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][730] ([Intel XE#2313]) -> [SKIP][731] ([Intel XE#2312]) +3 other tests skip
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][732] ([Intel XE#4439]) -> ([SKIP][733], [SKIP][734]) ([Intel XE#1158] / [Intel XE#4439])
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          [SKIP][735] ([Intel XE#4439]) -> ([SKIP][736], [SKIP][737]) ([Intel XE#2350] / [Intel XE#4439])
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][738] ([Intel XE#2313]) -> ([SKIP][739], [SKIP][740]) ([Intel XE#2312] / [Intel XE#2313]) +11 other tests ( 2 skip )
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][741] ([Intel XE#653]) -> ([SKIP][742], [SKIP][743]) ([Intel XE#653] / [Intel XE#656]) +9 other tests ( 2 skip )
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][744] ([Intel XE#656]) -> [SKIP][745] ([Intel XE#653]) +6 other tests skip
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][746] ([Intel XE#656]) -> ([SKIP][747], [SKIP][748]) ([Intel XE#653]) +7 other tests ( 2 skip )
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][749] ([Intel XE#653]) -> ([SKIP][750], [SKIP][751]) ([Intel XE#656]) +3 other tests ( 2 skip )
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][752] ([Intel XE#3544]) -> [SKIP][753] ([Intel XE#3374] / [Intel XE#3544])
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][754] ([Intel XE#455]) -> ([SKIP][755], [PASS][756]) ([Intel XE#455])
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#4328]) -> ([PASS][758], [SKIP][759]) ([Intel XE#4328])
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][760] ([Intel XE#455]) -> [SKIP][761] ([Intel XE#4596])
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][762] ([Intel XE#4596]) -> [SKIP][763] ([Intel XE#2493])
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][764] ([Intel XE#718]) -> ([FAIL][765], [PASS][766]) ([Intel XE#718])
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [FAIL][767] ([Intel XE#4570]) -> ([FAIL][768], [SKIP][769]) ([Intel XE#2893] / [Intel XE#4570] / [Intel XE#4608]) +9 other tests ( 1 fail, 1 skip )
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          [FAIL][770] ([Intel XE#4570]) -> ([FAIL][771], [SKIP][772]) ([Intel XE#4570] / [Intel XE#4608]) +18 other tests ( 1 fail, 1 skip )
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [FAIL][773] ([Intel XE#4570]) -> [SKIP][774] ([Intel XE#2893] / [Intel XE#4608])
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          [FAIL][775] ([Intel XE#4570]) -> [SKIP][776] ([Intel XE#4608]) +2 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][777] ([Intel XE#4568]) -> ([FAIL][778], [SKIP][779]) ([Intel XE#4568] / [Intel XE#4609]) +12 other tests ( 1 fail, 1 skip )
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          [FAIL][780] ([Intel XE#4568]) -> ([FAIL][781], [SKIP][782]) ([Intel XE#1406] / [Intel XE#4568]) +12 other tests ( 1 fail, 1 skip )
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][783] ([Intel XE#362]) -> ([FAIL][784], [FAIL][785]) ([Intel XE#1729])
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][786] ([Intel XE#2426]) -> ([SKIP][787], [SKIP][788]) ([Intel XE#2426] / [Intel XE#2509])
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][789] ([Intel XE#1500]) -> ([SKIP][790], [SKIP][791]) ([Intel XE#362])
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][792] ([Intel XE#771]) -> ([FAIL][793], [FAIL][794]) ([Intel XE#771] / [Intel XE#899]) +2 other tests ( 2 fail )
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][795] ([Intel XE#771]) -> ([FAIL][796], [PASS][797]) ([Intel XE#899])
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-dg2-set2:     [SKIP][798] ([Intel XE#1392]) -> ([PASS][799], [SKIP][800]) ([Intel XE#1392])
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][801] ([Intel XE#4541]) -> ([FAIL][802], [PASS][803]) ([Intel XE#4541])
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/shard-lnl-6/igt@xe_oa@buffer-size.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_oa@buffer-size.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@xe_oa@buffer-size.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4570]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8289 -> IGTPW_12853

  IGTPW_12853: 12853
  IGT_8289: 8289
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/index.html

--===============4397158228191255250==
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
<tr><td><b>Series:</b></td><td>lib/i915/fbc: update fbc support based on ps=
r mode (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146845/">https://patchwork.freedesktop.org/series/146845/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12853/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8289_FULL -&gt; XEIGTPW_12853_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12853_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12853_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
853_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg=
2-435/igt@kms_plane_lowres@tiling-4.html">INCOMPLETE</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_plane=
_lowres@tiling-4.html">PASS</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt=
@kms_pm_rpm@i2c.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_pm_rpm@i2c.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail=
-vm_bind_ioctl_ops_create.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@xe_fault_injection@vm-bind-=
fail-vm_bind_ioctl_ops_create.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12853_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-=
4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_async_flips@async-flip=
-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_async_=
flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel =
XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_async_flips@invalid-async-f=
lip-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_atomic_transition@plane-all-=
modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate=
-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12853/shard-lnl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Int=
el XE#1407</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate=
-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12853/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_big_fb@4-tiled-=
max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shar=
d-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-0.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@k=
ms_big_fb@linear-8bpp-rotate-0.html">PASS</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12853/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dm=
esg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-1=
80-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12853/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-=
32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +10 other te=
sts dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_big_fb@y-tiled-max-h=
w-stride-32bpp-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tes=
ts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
53/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-=
offset-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset=
-overflow.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_big_fb@yf-tile=
d-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560=
x1440p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12853/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displ=
ays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-dis=
plays-2560x1440p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_bw@connected-linear-tiling-=
2-displays-3840x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_bw@connected-linear-tiling-=
2-displays-3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@kms_bw@connected-linear-tiling-=
4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 2 s=
kip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_bw@connected-linear-tiling-=
4-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_bw@connected-linear-tiling-=
4-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test ( 2 skip =
)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays=
-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12853/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-3840x2160=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays=
-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays=
-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12853/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-1920x1080=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_bw@linear-tiling-4-displa=
ys-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12853/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x=
1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@bad-aux-stride=
-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +27 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-ti=
led-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-til=
ed-bmg-ccs@pipe-c-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +7 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +172 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-lnl-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_ccs@crc-primary-rot=
ation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-=
lnl-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-dg2-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-dg2-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf=
-tiled-ccs@pipe-b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs@pipe-b-dp-4.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +74 other tests ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12853/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">I=
NCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"=
>Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_ccs@random-ccs-data-=
4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#=
3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel=
 XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled=
-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cdclk@mode-transition-all-o=
utputs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/272=
4">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_chamelium_audio@hdmi-audi=
o-edid.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio-edid.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to=
-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">I=
ntel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_chamelium_color@ctm-limite=
d-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_chamelium_color@ctm-limited=
-range.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-lnl-8/igt@kms_chamelium_color@ctm-limited-range.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306=
">Intel XE#306</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306=
">Intel XE#306</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@kms_chamelium_color@degamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-str=
ess-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-ch=
ange-during-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-chan=
ge-during-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_chamelium_frames@hdmi-cmp-pl=
anes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-with-=
enabled-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12853/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-with-enabled-m=
ode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_content_protection@atomic@p=
ipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12853/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-=
0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_content_protection@dp-mst-l=
ic-type-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12853/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/307">Intel XE#307</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@kms_content_protection@dp-mst-l=
ic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_content_protection@dp-mst-t=
ype-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12853/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390"=
>Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_content_protection@legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_content_protection@lic-ty=
pe-0.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_content_protection@lic-type-0@=
pipe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_content_protection@srm.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
853/shard-dg2-434/igt@kms_content_protection@srm.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
53/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">=
Intel XE#4173</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_crc@cursor-offscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-=
128x42.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
4">Intel XE#1424</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-mov=
ement-32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12853/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-32x1=
0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12853/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-l=
egacy.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a>) +1 other test ( 1 pass, 1 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-=
flip-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12853/shard-lnl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legac=
y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +1 other test ( 2 skip )</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_cursor_legacy@2x-cursor-vs-=
flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12853/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2291">Intel XE#2291</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12853/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.htm=
l">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12853/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_legacy@cursor=
a-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12853/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-at=
omic-transitions.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic-transitions.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) +7 other tests ( 1 pass, 1 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12853/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard=
-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_=
cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-m=
st.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12853/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel=
 XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12853/shard-dg2-463/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#=
4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_dp_linktrain_fallback@dp-fallback.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
853/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2=
-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with=
-bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-dirtyfb-tests.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-b=
mg-2/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@kms_fbcon_fbt@psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
76">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
853/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2853/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard=
-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-=
vs-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/310">Intel XE#310</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_flip@2x-flip-vs-=
expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_flip@2x-flip-vs-=
expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +=
3 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other tes=
t fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdm=
i-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a=
3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-v=
s-hang.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310=
">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-d=
g2-464/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-=
bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_flip@2x-f=
lip-vs-wf_vblank.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/s=
hard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@k=
ms_flip@2x-plain-flip-fb-recreate.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +7 other te=
sts ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recre=
ate-interruptible@ab-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip@2x-plain-fl=
ip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ab-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-r=
ecreate-interruptible@ab-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_flip@2x-pl=
ain-flip-fb-recreate-interruptible@ab-hdmi-a6-dp4.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ac-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-r=
ecreate-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE=
#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2882">Intel XE#2882</a>) +1 other test ( 1 fail, 1 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-re=
create-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recre=
ate-interruptible@bd-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip@2x-plain-fl=
ip-fb-recreate-interruptible@bd-dp2-hdmi-a3.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip@2x-plain-flip-interrup=
tible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12853/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"=
>Intel XE#1421</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-=
vblank@a-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank@a-=
dp4.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2049">Intel XE#2049</a>) +1 other test ( 1 incomplete, 1 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12853/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/sha=
rd-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-=
interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-int=
erruptible@b-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@b-hdmi-a6.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fai=
l )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#14=
01</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-=
yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_flip_scaled_c=
rc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"=
>Intel XE#2380</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-ln=
l-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling@pipe-a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +4 other tests ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-=
linear-to-32bpp-linear-downscaling.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_flip_scaled_cr=
c@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">In=
tel XE#1745</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-=
linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/ig=
t@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-=
default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-x=
tile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@kms_flip_sca=
led_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html"=
>DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip_scaled_crc@=
flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/i=
gt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pip=
e-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1=
p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +20 other tests sk=
ip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-r=
gb101010-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests ( 2 skip =
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 othe=
r tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-s=
hrfb-draw-render.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +=
1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcps=
r-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_frontbuffer_tracking=
@fbcpsr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +20 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p=
-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_frontbuffer_=
tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)=
 +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p=
-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)=
 +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rg=
b565-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_hdr@invalid-metadata-sizes.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12853/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#15=
03</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_joiner@invalid-modeset-big=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_joiner@invalid-modeset-forc=
e-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_joiner@invalid-modeset-forc=
e-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_joiner@invalid-modeset-force-ultra=
-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_pipe_crc_basic@disable-crc-=
after-crtc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888=
-ytiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12853/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_plane_lowres@tiling-yf.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1285=
3/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shar=
d-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
53/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-75@pipe-b.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_plane_scaling@planes-downs=
cale-factor-0-75@pipe-b.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_plane_sc=
aling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE=
#2763</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_plane_sc=
aling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE=
#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_pm_backlight@bad-brightness=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12853/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12853/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel X=
E#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@k=
ms_pm_dc@dc5-psr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12853/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#=
3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flops.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-=
bmg-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-=
lpsp.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane=
-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_psr2_sf@psr2-primary-plane-=
update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_psr@fbc-pr-dpms.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/sha=
rd-dg2-434/igt@kms_psr@fbc-pr-dpms.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_psr@fbc-pr-no-drrs.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/sh=
ard-bmg-4/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-m=
ove.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12853/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4568">Intel XE#4568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-m=
ove@edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12853/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4568">Intel XE#4568</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-7/igt@kms_psr@pr-basic.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-ln=
l-8/igt@kms_psr@pr-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_psr_stress_test@invalidate-=
primary-flip-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12853/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
414">Intel XE#3414</a>) +1 other test ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@kms_rotation_crc@sprite-rotatio=
n-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12853/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"=
>Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_setmode@invalid-clone-singl=
e-crtc-stealing.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc=
-stealing.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/s=
hard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">In=
tel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12853/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-=
1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shar=
d-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other tes=
t ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-=
432/igt@kms_vrr@lobf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_writeback@writeback-fb-id=
-xrgb2101010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12853/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101=
010.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_writeback@writeback-pixel-f=
ormats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756=
">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_compute_preempt@compute-pr=
eempt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12853/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280"=
>Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0=
x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x=
fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@xe_create@multigpu-create-massi=
ve-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@xe_create@multigpu-create-massi=
ve-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12853/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
44">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_eudebug@basic-close.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/=
shard-dg2-463/igt@xe_eudebug@basic-close.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@xe_eudebug@basic-connect.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/=
shard-lnl-4/igt@xe_eudebug@basic-connect.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@xe_eudebug@basic-read-event.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
53/shard-bmg-6/igt@xe_eudebug@basic-read-event.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>=
) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@xe_eudebug@basic-vm-access-param=
eters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-vm-des=
troy-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@xe_eudebug_online@interrupt-othe=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@xe_eudebug_online@single-step-on=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@xe_eudebug_sriov@deny-sriov.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
53/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@xe_evict@evict-beng-large-exter=
nal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-s=
tandalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-s=
tandalone-nofree-reopen.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit=
-standalone-nofree-reopen.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic=
-defer-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12853/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_exec_basic@mu=
ltigpu-no-exec-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2=
594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_exec_basic@multig=
pu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 ot=
her test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip<=
/li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-rebind.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindex=
ecqueue-userptr-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests (=
 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@xe_exec_basic@multigpu-once-use=
rptr-invalidate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12853/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-i=
nvalidate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@xe_exec_fault_mode@many-execque=
ues-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@xe_exec_fault_mode@many-userpt=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_exec_fault_mode@once-rebin=
d-prefetch.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/288">Intel XE#288</a>) +22 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple=
-batch-store-lr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12853/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch=
-store-lr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint=
-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_migr=
ate_kunit.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12853/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@xe_mmap@pci-membarrier.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045"=
>Intel XE#4045</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@xe_mmap@pci-membarrier.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045=
">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@xe_mmap@small-bar.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-b=
mg-1/igt@xe_mmap@small-bar.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@xe_mmap@vram.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#=
1416</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-2/igt@xe_mmap@vram.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE=
#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@xe_module_load@force-load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853=
/shard-bmg-4/igt@xe_module_load@force-load.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-8/igt@xe_module_load@many-reload.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adl=
p-8/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-9/igt@xe_oa@rc6-disable.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Int=
el XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_oa@short-reads.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">In=
tel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-1/igt@xe_oa@syncs-syncobj-cfg.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/254=
1">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12853/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4501">Intel XE#4501</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_oa@whitelisted-registers-u=
serspace-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspa=
ce-config.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/=
shard-dg2-436/igt@xe_pat@pat-index-xehpc.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#9=
79</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">In=
tel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853=
/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE=
#366</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@xe_pm@d3cold-mocs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_pm@s2idle-d3cold-basic-exec.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12853/shard-lnl-7/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#22=
84</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366=
">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-9=
/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test ab=
ort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2853/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</=
a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
579">Intel XE#579</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
53/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@xe_query@multigpu-query-invalid=
-cs-cycles.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12853/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-=
guc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclu=
sive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_sriov_auto_provisioning@exclusive=
-ranges.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@xe_sriov_auto_provisioning@sel=
fconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
853/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@xe_sriov_flr@flr-vfs-parallel.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-l=
nl-6/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-5/igt@xe_wedged@wedge=
d-mode-toggle.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
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
e/IGT_8289/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_async_flips@async-flip-suspe=
nd-resume.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_bw@connected-linear-=
tiling-2-displays-1920x1080p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_bw@connected-linea=
r-tiling-2-displays-1920x1080p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-466/igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm.html"=
>INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12853/shard-dg2-464/igt@kms_color@deep-color@pipe-a-hdmi-a-6-ctm.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-le=
gacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-bmg-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3226">Intel XE#3226</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_cursor_legacy@2x-lo=
ng-cursor-vs-flip-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_cursor_legacy@2x-long-=
cursor-vs-flip-atomic.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-=
vs-cursor-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-atomic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-curs=
or-crc-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302=
">Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12853/shard-dg2-466/igt@kms_display_modes@extended-mode-basic.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2853/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel=
 XE#1340</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg=
-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank-interruptible.html">PASS</a>) +6 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-v=
blank@bc-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vb=
lank@bc-hdmi-a6-dp4.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853=
/shard-dg2-432/igt@kms_flip@2x-plain-flip.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@=
2x-plain-flip.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip@flip-vs-ab=
solute-wf_vblank-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_flip@flip-vs-absol=
ute-wf_vblank-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@flip-vs-expired-vbl=
ank-interruptible@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_flip@flip-vs-expired-vbl=
ank@c-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel X=
E#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard=
-bmg-6/igt@kms_flip@flip-vs-suspend.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-dp2.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">I=
ntel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-dp2.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/886">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreat=
e-interruptible@a-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreat=
e-interruptible@a-edp1.html">PASS</a>) +6 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-9/igt@kms_flip@plain-flip-fb-recreate-interruptible@c=
-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_flip@plain-flip-fb-r=
ecreate-interruptible@c-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adlp-8/igt@kms_frontbuffe=
r_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +6 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a>) +5 other tests ( 2=
 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-435/igt@kms_hdr@static-swap.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426">Intel XE#4426</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/=
shard-dg2-432/igt@kms_hdr@static-swap.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_hdr@stati=
c-swap.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-435/igt@kms_hdr@static-swap@pipe-a-dp-4.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426">Inte=
l XE#4426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12853/shard-dg2-466/igt@kms_hdr@static-swap@pipe-a-dp-4.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-432/igt@kms_plane_lowres@tiling-x.html">INCOMPLETE</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/sh=
ard-dg2-432/igt@kms_plane_lowres@tiling-x.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_plane=
_lowres@tiling-x.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4540">Intel XE#4540</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_plane_scaling@intel-=
max-src-size@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-2/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shar=
d-bmg-3/igt@kms_setmode@basic.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_setmode@basic.html"=
>PASS</a>) +6 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12853/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-7/i=
gt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>) +2 other tests ( 2 pass )=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1285=
3/shard-bmg-2/igt@kms_vrr@negative-basic.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/=
shard-dg2-466/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_exec_basic@multigpu-no=
-exec-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12853/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-rebi=
nd.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12853/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-rebind.html">PA=
SS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-a=
dlp-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_bw@connect=
ed-linear-tiling-2-displays-1920x1080p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_bw@connect=
ed-linear-tiling-2-displays-1920x1080p.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#28=
94</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pi=
pe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/i=
gt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
853/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs=
@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/sh=
ard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pi=
pe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_ccs@missing-cc=
s-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_ccs@ran=
dom-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_ccs@ra=
ndom-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418=
">Intel XE#4418</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12853/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2853/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Int=
el XE#4418</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12853/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt=
@kms_content_protection@atomic.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12853/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/s=
hard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12853/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-b=
mg-2/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel X=
E#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel =
XE#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12853/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-4=
64/igt@kms_content_protection@uevent.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12853/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-lega=
cy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12853/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/229=
1">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12853/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853=
/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#=
4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ac-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank=
@ac-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests ( 1 fail, 1 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12853/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt=
@kms_flip@2x-flip-vs-modeset.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test ( 1 =
pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-i=
nterruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-i=
nterruptible.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
d-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_flip@flip-vs-expire=
d-vblank-interruptible@d-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_flip@flip-vs-e=
xpired-vblank-interruptible@d-hdmi-a6.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other =
tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12853/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853=
/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblan=
k@c-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12853/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-adl=
p-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other test=
s dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_track=
ing@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_frontbuffe=
r_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracking=
@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_trac=
king@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_track=
ing@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-436/igt@kms_frontbuffe=
r_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#414=
1</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_frontbuffer_t=
racking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-7/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_track=
ing@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-434/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">In=
tel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-8/igt@k=
ms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-2/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer_t=
racking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/443=
9">Intel XE#4439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12853/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12853/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">=
Intel XE#1158</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4439">Intel XE#4439</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439"=
>Intel XE#4439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
53/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel =
XE#2350</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-435/igt@kms_frontbuffer_t=
racking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-466/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_frontbuffer=
_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@km=
s_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2853/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/sh=
ard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-463/igt@kms_hdr@invalid=
-hdr.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4328">Intel XE#4328</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12853/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12853/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joi=
ner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12853/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE=
#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12853/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE=
#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard=
-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4570">Intel XE#4570</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@kms_psr2_sf@fbc=
-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@k=
ms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893"=
>Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4570">Intel XE#4570</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +9 other tests ( 1 fail, 1 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-1/igt@k=
ms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp=
-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12853/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-=
exceed-fully-sf@pipe-b-edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4570">Intel XE#4570</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1=
8 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-sf.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4570">Intel XE#4570</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-c=
ursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-sf@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-2/igt@kms_psr2_=
sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">I=
ntel XE#4608</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">I=
ntel XE#4568</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12853/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/s=
hard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#456=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609=
">Intel XE#4609</a>) +12 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Int=
el XE#4568</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12853/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-move.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard=
-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Inte=
l XE#4568</a>) +12 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12853/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853=
/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE=
#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12853/shard-bmg-1/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12853/shard-bmg-4/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12853/shard-dg2-464/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@=
pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12853/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-=
a-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests ( 2 fail )</=
li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12853/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@=
pipe-b-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12853/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-=
b-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-433/igt@xe_exec_basic@mult=
igpu-many-execqueues-many-vm-null-rebind.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shard-dg2-432/igt@xe_exec_ba=
sic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8289/shard-lnl-6/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12853/shar=
d-lnl-5/igt@xe_oa@buffer-size.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12853/shard-lnl-3/igt@xe_oa@buffer-size.html"=
>PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4541">Intel XE#4541</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8289 -&gt; IGTPW_12853</li>
</ul>
<p>IGTPW_12853: 12853<br />
  IGT_8289: 8289<br />
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8</p>

</body>
</html>

--===============4397158228191255250==--
