Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F75D767F4
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 17:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D411A10E41F;
	Thu, 31 Oct 2024 17:51:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DCB10E16B;
 Thu, 31 Oct 2024 17:51:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9051876971617261085=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/kms=5Fvrr=3A_data-=3Esw?=
 =?utf-8?q?itch_modes=5BLOW=5FRR=5FMODE=5D_not_initialized_for_lobf_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 31 Oct 2024 17:51:05 -0000
Message-ID: <173039706566.1385523.11847131897976432399@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031121355.3419367-1-jouni.hogander@intel.com>
In-Reply-To: <20241031121355.3419367-1-jouni.hogander@intel.com>
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

--===============9051876971617261085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: data->switch modes[LOW_RR_MODE] not initialized for lobf test
URL   : https://patchwork.freedesktop.org/series/140767/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8091_full -> XEIGTPW_12014_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12014_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12014_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12014_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12014_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#1885])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#1885])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@core_hotunplug@hotrebind-lateclose.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1466])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][16] -> [DMESG-WARN][17] ([Intel XE#877])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#316]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124]) +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +69 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2907]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1195] / [Intel XE#1727])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#3113])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1195])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][35] ([Intel XE#3113])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1195])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#306])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#306])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +10 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#307]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1188]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#3007]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#309])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#1541])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][50] ([Intel XE#3184]) +1 other test dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-d.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][51] ([Intel XE#2141]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#701])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#703])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#301]) +8 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#301]) +4 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#301]) +13 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][59] -> [ABORT][60] ([Intel XE#2625])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1421]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#2882]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#886]) +3 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#3267]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][69] -> [INCOMPLETE][70] ([Intel XE#1195] / [Intel XE#2049])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#2882])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#886])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a6.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2293] / [Intel XE#2380])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1401] / [Intel XE#1745])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#651]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#651]) +27 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#2351] / [Intel XE#2890])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#658])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#656]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#653]) +38 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2313])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#605])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#1503])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1450] / [Intel XE#2568])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1450]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2925])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2890]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@lease-uevent:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#3202])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-4/igt@kms_lease@lease-uevent.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@kms_lease@lease-uevent.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2486])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [PASS][97] -> [DMESG-WARN][98] ([Intel XE#2566] / [Intel XE#877])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-bmg:          [PASS][99] -> [DMESG-WARN][100] ([Intel XE#877])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2763]) +8 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2763]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2763]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#870])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1122]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#718])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#1430])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1129])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2446])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_pm_rpm@legacy-planes.html
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#2446])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_pm_rpm@legacy-planes.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2893])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1489]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#1489]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#327]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1127])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sequence@queue-busy:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#2467]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-5/igt@kms_sequence@queue-busy.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_sequence@queue-busy.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1435])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#362])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#2443]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#455]) +18 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1126])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2905])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2905]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2905]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#688])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-bmg:          [PASS][135] -> [SKIP][136] ([Intel XE#1130]) +9 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@many-null:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#1130]) +6 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@xe_exec_basic@many-null.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_exec_basic@many-null.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-lnl:          [PASS][139] -> [FAIL][140] ([Intel XE#3160])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [PASS][141] -> [FAIL][142] ([Intel XE#3160]) +2 other tests fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [FAIL][143] ([Intel XE#3160])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#288]) +30 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#2360])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [PASS][146] -> [INCOMPLETE][147] ([Intel XE#2998]) +1 other test incomplete
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          [PASS][148] -> [SKIP][149] ([Intel XE#1192])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@xe_live_ktest@xe_dma_buf.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#560])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2541]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-bmg:          NOTRUN -> [FAIL][152] ([Intel XE#2249])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#2838] / [Intel XE#979])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#979])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#2284] / [Intel XE#366])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1130]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     NOTRUN -> [ABORT][157] ([Intel XE#1358]) +1 other test abort
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][158] -> [ABORT][159] ([Intel XE#1358] / [Intel XE#1794])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][160] -> [ABORT][161] ([Intel XE#1794])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@xe_pm@s4-mocs.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][162] -> [FAIL][163] ([Intel XE#958])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#944]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_vm@large-misaligned-binds-4194304:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#1130])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_vm@large-misaligned-binds-4194304.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-lnl:          [DMESG-WARN][166] -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@core_hotunplug@unplug-rescan.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-1/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_3d:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#2423]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_3d.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_3d.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2423] / [i915#2575]) -> [PASS][171] +11 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_atomic@atomic-invalid-params.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][172] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][173] +2 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][174] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][176] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#1195]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][180] ([Intel XE#3113]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [FAIL][182] ([Intel XE#1475]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-lnl:          [FAIL][184] ([Intel XE#1475]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][186] ([Intel XE#301]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [ABORT][188] -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [FAIL][190] ([Intel XE#2882]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][192] ([Intel XE#886]) -> [PASS][193] +3 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][194] ([Intel XE#301]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [INCOMPLETE][196] ([Intel XE#2635]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp2:
    - shard-bmg:          [INCOMPLETE][198] -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp2.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2890]) -> [PASS][201] +4 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][203] +3 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#455]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [SKIP][206] ([Intel XE#3007]) -> [PASS][207] +16 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][208] ([Intel XE#616]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_plane_cursor@viewport.html
    - shard-lnl:          [FAIL][210] ([Intel XE#1471]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@kms_plane_cursor@viewport.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-1/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:
    - shard-lnl:          [FAIL][212] ([Intel XE#1874]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-1/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][214] ([Intel XE#718]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [ABORT][216] ([Intel XE#2625]) -> [PASS][217] +3 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][218] ([Intel XE#899]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][220] ([Intel XE#2443]) -> [PASS][221] +3 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_vrr@flip-basic.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [FAIL][222] ([Intel XE#2667]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][224] ([Intel XE#1473]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][226] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [FAIL][228] ([Intel XE#3160]) -> [PASS][229] +2 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][230] ([Intel XE#3320]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [FAIL][232] ([Intel XE#3160]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-bmg:          [SKIP][234] ([Intel XE#1130]) -> [PASS][235] +36 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [SKIP][236] ([Intel XE#1192]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][238] ([Intel XE#2514]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html
    - shard-bmg:          [FAIL][240] ([Intel XE#2514]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [DMESG-WARN][242] ([Intel XE#3184]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-5/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1130]) -> [PASS][245] +31 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [ABORT][246] ([Intel XE#1794]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@xe_pm@s3-mocs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][248] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][250] ([Intel XE#1794]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_tlb@basic-tlb:
    - shard-lnl:          [CRASH][252] ([Intel XE#3212]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-8/igt@xe_tlb@basic-tlb.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@xe_tlb@basic-tlb.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][254] ([Intel XE#2327]) -> [SKIP][255] ([Intel XE#2231] / [Intel XE#2890]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#316]) -> [SKIP][257] ([Intel XE#2890])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2890]) -> [SKIP][259] ([Intel XE#1124]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][260] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][261] ([Intel XE#1124]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][262] ([Intel XE#3007]) -> [SKIP][263] ([Intel XE#367])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2423] / [i915#2575]) -> [SKIP][265] ([Intel XE#367])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][266] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][267] ([Intel XE#2887]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2890]) -> [SKIP][269] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-bmg:          [SKIP][270] ([Intel XE#2887]) -> [SKIP][271] ([Intel XE#2231] / [Intel XE#2890])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][272] ([Intel XE#3007]) -> [SKIP][273] ([Intel XE#2325])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2423] / [i915#2575]) -> [SKIP][275] ([Intel XE#306])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-to-red.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-bmg:          [SKIP][276] ([Intel XE#3007]) -> [SKIP][277] ([Intel XE#2252]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2423] / [i915#2575]) -> [SKIP][279] ([Intel XE#373]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][280] ([Intel XE#2252]) -> [SKIP][281] ([Intel XE#3007])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#373]) -> [SKIP][283] ([Intel XE#2423] / [i915#2575])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][284] ([Intel XE#3007]) -> [SKIP][285] ([Intel XE#2390])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [INCOMPLETE][286] ([Intel XE#1195] / [Intel XE#2715]) -> [FAIL][287] ([Intel XE#1178]) +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@kms_content_protection@legacy.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][288] ([Intel XE#2321]) -> [SKIP][289] ([Intel XE#3007])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#308]) -> [SKIP][291] ([Intel XE#2423] / [i915#2575])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2423] / [i915#2575]) -> [SKIP][293] ([Intel XE#455]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_cursor_crc@cursor-random-max-size.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-bmg:          [SKIP][294] ([Intel XE#3007]) -> [SKIP][295] ([Intel XE#2320])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][296] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][297] ([Intel XE#2141])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][298] ([Intel XE#886]) -> [FAIL][299] ([Intel XE#3036]) +1 other test fail
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][300] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][301] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2890]) -> [SKIP][303] ([Intel XE#455]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#651]) -> [SKIP][305] ([Intel XE#2890]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][306] ([Intel XE#2311]) -> [SKIP][307] ([Intel XE#2231] / [Intel XE#2890]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][308] ([Intel XE#2333]) -> [SKIP][309] ([Intel XE#2231] / [Intel XE#2890])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][310] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][311] ([Intel XE#2333]) +2 other tests fail
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][312] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][313] ([Intel XE#2311]) +5 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2890]) -> [SKIP][315] ([Intel XE#651]) +4 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][316] ([Intel XE#2352]) -> [SKIP][317] ([Intel XE#2231] / [Intel XE#2890])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#658]) -> [SKIP][319] ([Intel XE#2351] / [Intel XE#2890])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][320] ([Intel XE#2313]) -> [SKIP][321] ([Intel XE#2231] / [Intel XE#2890])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2890]) -> [SKIP][323] ([Intel XE#653]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-bmg:          [SKIP][324] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][325] ([Intel XE#2313]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][326] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][327] ([Intel XE#2934])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2890]) -> [SKIP][329] ([Intel XE#2925])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][330] ([Intel XE#2927]) -> [SKIP][331] ([Intel XE#2231] / [Intel XE#2890])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][332] ([Intel XE#3007]) -> [SKIP][333] ([Intel XE#2763])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2423] / [i915#2575]) -> [SKIP][335] ([Intel XE#2763] / [Intel XE#455])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][336] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][337] ([Intel XE#2392])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2890]) -> [SKIP][339] ([Intel XE#1129])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][340] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][341] ([Intel XE#1489]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#2890]) -> [SKIP][343] ([Intel XE#1489]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2890]) -> [SKIP][345] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-plane-move.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][346] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][347] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_psr@pr-sprite-render.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_psr@pr-sprite-render.html
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][349] ([Intel XE#2850] / [Intel XE#929])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_psr@pr-sprite-render.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-dpms:
    - shard-bmg:          [SKIP][350] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][351] ([Intel XE#2231] / [Intel XE#2890])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_psr@psr-dpms.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][352] ([Intel XE#3007]) -> [SKIP][353] ([Intel XE#2329])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2423] / [i915#2575]) -> [SKIP][355] ([Intel XE#327])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][356] ([Intel XE#3007]) -> [SKIP][357] ([Intel XE#2413])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][358] ([Intel XE#1729]) -> [SKIP][359] ([Intel XE#2426])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][360] ([Intel XE#2426]) -> [SKIP][361] ([Intel XE#2509])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          [FAIL][362] ([Intel XE#2443]) -> [SKIP][363] ([Intel XE#1499])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-3/igt@kms_vrr@lobf.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_vrr@lobf.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][364] ([Intel XE#1130]) -> [SKIP][365] ([Intel XE#2905]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_eudebug@basic-read-event.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_eudebug@basic-read-event.html
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#1130]) -> [SKIP][367] ([Intel XE#2905]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_eudebug@basic-read-event.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          [SKIP][368] ([Intel XE#2905]) -> [SKIP][369] ([Intel XE#1130]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@xe_eudebug@discovery-race-vmbind.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_eudebug@discovery-race-vmbind.html
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#2905]) -> [SKIP][371] ([Intel XE#1130]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-464/igt@xe_eudebug@discovery-race-vmbind.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-bmg:          [SKIP][372] ([Intel XE#1130]) -> [SKIP][373] ([Intel XE#2322])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#1130]) -> [SKIP][375] ([Intel XE#288]) +5 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
    - shard-bmg:          [SKIP][376] ([Intel XE#1130]) -> [FAIL][377] ([Intel XE#3320])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2360]) -> [SKIP][379] ([Intel XE#1130])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#1130]) -> [SKIP][381] ([Intel XE#2541])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_oa@mi-rpc.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_oa@mi-rpc.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#1130]) -> [SKIP][383] ([Intel XE#944])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-bmg:          [SKIP][384] ([Intel XE#1130]) -> [SKIP][385] ([Intel XE#944])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#1130]) -> [FAIL][387] ([Intel XE#2922])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_tlb@basic-tlb.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_tlb@basic-tlb.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3036]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3202]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3202
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#3267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#3320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8091 -> IGTPW_12014
  * Linux: xe-2149-54ceaf112b111612f3a7430132b2395fcce62414 -> xe-2151-fa53c85519aa642bf10aa1692a1b99d1930d2809

  IGTPW_12014: 12014
  IGT_8091: 8091
  xe-2149-54ceaf112b111612f3a7430132b2395fcce62414: 54ceaf112b111612f3a7430132b2395fcce62414
  xe-2151-fa53c85519aa642bf10aa1692a1b99d1930d2809: fa53c85519aa642bf10aa1692a1b99d1930d2809

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/index.html

--===============9051876971617261085==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: data-&gt;switch modes[LOW_RR_MODE] not initialized for lobf test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140767/">https://patchwork.freedesktop.org/series/140767/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8091_full -&gt; XEIGTPW_12014_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12014_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12014_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12014_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12014_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267">Intel XE#3267</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-4/igt@kms_lease@lease-uevent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@kms_lease@lease-uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3202">Intel XE#3202</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-5/igt@kms_sequence@queue-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_sequence@queue-busy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467">Intel XE#2467</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_eudebug@discovery-empty-clients.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@xe_exec_basic@many-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_exec_basic@many-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_pm@s2idle-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-4194304:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_vm@large-misaligned-binds-4194304.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-1/igt@core_hotunplug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_3d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_atomic@atomic-invalid-params.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_atomic@atomic-invalid-params.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-1/igt@kms_plane_cursor@viewport.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-1/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-1/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@kms_vrr@flip-basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@xe_evict@evict-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@xe_live_ktest@xe_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-5/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@xe_pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-8/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-4/igt@xe_tlb@basic-tlb.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-434/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036">Intel XE#3036</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-8/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-435/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-3/igt@kms_vrr@lobf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-lnl-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-433/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-2/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-464/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-464/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-433/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12014/shard-dg2-463/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8091 -&gt; IGTPW_12014</li>
<li>Linux: xe-2149-54ceaf112b111612f3a7430132b2395fcce62414 -&gt; xe-2151-fa53c85519aa642bf10aa1692a1b99d1930d2809</li>
</ul>
<p>IGTPW_12014: 12014<br />
  IGT_8091: 8091<br />
  xe-2149-54ceaf112b111612f3a7430132b2395fcce62414: 54ceaf112b111612f3a7430132b2395fcce62414<br />
  xe-2151-fa53c85519aa642bf10aa1692a1b99d1930d2809: fa53c85519aa642bf10aa1692a1b99d1930d2809</p>

</body>
</html>

--===============9051876971617261085==--
