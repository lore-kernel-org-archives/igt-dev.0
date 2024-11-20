Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3950FD743C6
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 19:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C268E10E075;
	Wed, 20 Nov 2024 19:33:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A974D10E075;
 Wed, 20 Nov 2024 19:33:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/syncobj=5Fwait=3A_Up?=
 =?utf-8?q?date_invalid-wait-zero-handles_test_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 20 Nov 2024 19:33:45 -0000
Message-ID: <173213122570.818432.14436221159998973355@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120103507.7653-1-krzysztof.niemiec@intel.com>
In-Reply-To: <20241120103507.7653-1-krzysztof.niemiec@intel.com>
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

== Series Details ==

Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev5)
URL   : https://patchwork.freedesktop.org/series/140727/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8118_full -> XEIGTPW_12146_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12146_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12146_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12146_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@core_hotunplug@hotreplug-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5] +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_plane_lowres@tiling-none@pipe-d-dp-4.html

  * igt@syncobj_basic@bad-pad-fd-to-handle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][9] +3 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@syncobj_basic@bad-pad-fd-to-handle.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_prime_self_import@reimport-vs-gem_close-race:
    - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_prime_self_import@reimport-vs-gem_close-race.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@xe_prime_self_import@reimport-vs-gem_close-race.html

  * igt@xe_query@query-config:
    - shard-bmg:          [PASS][14] -> [DMESG-WARN][15] +1 other test dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_query@query-config.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@xe_query@query-config.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][16] ([Intel XE#2136]) -> [DMESG-WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_plane_lowres@tiling-none.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_plane_lowres@tiling-none.html

  * igt@xe_vm@large-misaligned-binds-2097152:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#1130]) -> [DMESG-WARN][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_vm@large-misaligned-binds-2097152.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@xe_vm@large-misaligned-binds-2097152.html

  
New tests
---------

  New tests have been introduced between XEIGT_8118_full and XEIGTPW_12146_full:

### New IGT tests (13) ###

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-ctm:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.66] s

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-degamma:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.62] s

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-gamma:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.73] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-ctm:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.63] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-degamma:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.59] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-gamma:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.66] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-ctm:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.64] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-degamma:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.63] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-gamma:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.73] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-ctm:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.65] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-degamma:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.68] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-gamma:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [22.73] s

  * igt@syncobj_wait@wait-zero-handles:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12146_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][22] ([Intel XE#3440])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@core_getversion@basic.html

  * igt@fbdev@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2134])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@fbdev@read.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][24] -> [SKIP][25] ([Intel XE#2134])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@fbdev@write.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3279])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1407])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2327]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#316])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1124]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2191]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2314] / [Intel XE#2894])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2314] / [Intel XE#2894])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#367])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#367]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +8 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2887]) +11 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#3433]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#787]) +125 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373]) +7 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2325])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2252]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#3278])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#307])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#1178]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1188])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2320]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2321])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#2423] / [i915#2575]) +102 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][59] ([Intel XE#3466]) +2 other tests dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-edp-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1424]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2321])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2291])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2291]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#309]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][66] ([Intel XE#877])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#2705] / [Intel XE#3468])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1340])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([i915#3804])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#3070])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2244]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2244])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1138])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1137])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#3486])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1421]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][79] -> [INCOMPLETE][80] ([Intel XE#2597] / [Intel XE#3468])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][81] -> [DMESG-FAIL][82] ([Intel XE#3468]) +9 other tests dmesg-fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][83] ([Intel XE#3468]) +6 other tests dmesg-fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#2316]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2316])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][87] ([Intel XE#3468]) +2 other tests dmesg-fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@kms_flip@absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          [PASS][88] -> [DMESG-WARN][89] ([Intel XE#2932]) +3 other tests dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#2882]) +2 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_flip@plain-flip-ts-check.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#886]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1397] / [Intel XE#1745])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1397])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2380]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#455]) +8 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1401] / [Intel XE#1745])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1401])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#651]) +8 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2312]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2136]) +33 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][106] ([Intel XE#2333]) +6 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2311]) +18 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#656]) +21 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#651]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2352])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#653]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2313]) +13 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-edp-1:
    - shard-lnl:          [PASS][113] -> [DMESG-WARN][114] ([Intel XE#3466]) +19 other tests dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_hdr@bpc-switch@pipe-a-edp-1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_hdr@bpc-switch@pipe-a-edp-1.html

  * igt@kms_lease@lessee-list@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][115] ([Intel XE#1727])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_lease@lessee-list@pipe-d-dp-4.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-lnl:          [PASS][116] -> [DMESG-WARN][117] ([Intel XE#2566] / [Intel XE#3466]) +1 other test dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2763]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2763]) +11 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2763]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#718])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][124] -> [INCOMPLETE][125] ([Intel XE#3468]) +1 other test incomplete
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_pm_rpm@cursor.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#2446]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][128] -> [DMESG-WARN][129] ([Intel XE#1727] / [Intel XE#3468])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1439] / [Intel XE#3141])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][131] -> [DMESG-WARN][132] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_pm_rpm@i2c.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][133] -> [DMESG-WARN][134] ([Intel XE#3468]) +1 other test dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2893]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#1489]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1122])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2387]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1128])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2136]) +28 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1406]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2850] / [Intel XE#929])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#3414]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#3414]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#3414]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2330])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#1499])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#756]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#756])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@syncobj_wait@invalid-multi-wait-unsubmitted-signaled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2423] / [i915#2575]) +129 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@syncobj_wait@invalid-multi-wait-unsubmitted-signaled.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][153] -> [SKIP][154] ([Intel XE#2423]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@testdisplay.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1123])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][156] ([Intel XE#3468]) +26 other tests dmesg-warn
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#2905]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2905]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][159] ([Intel XE#1473])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
    - shard-bmg:          NOTRUN -> [TIMEOUT][160] ([Intel XE#1473])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#688]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#1130]) +60 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2322]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1392]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][165] ([Intel XE#3466])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html

  * igt@xe_exec_fault_mode@once-basic-prefetch:
    - shard-lnl:          [PASS][166] -> [DMESG-FAIL][167] ([Intel XE#3466]) +2 other tests dmesg-fail
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@xe_exec_fault_mode@once-basic-prefetch.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@xe_exec_fault_mode@once-basic-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#288]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [PASS][169] -> [FAIL][170] ([Intel XE#1630])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][171] -> [DMESG-WARN][172] ([Intel XE#3467] / [Intel XE#3468])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][173] ([Intel XE#3467])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][174] -> [SKIP][175] ([Intel XE#2229]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][176] ([Intel XE#1999]) +1 other test fail
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2457])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@xe_module_load@force-load.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][178] -> [DMESG-WARN][179] ([Intel XE#3467])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_module_load@unload.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@xe_module_load@unload.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#2541]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2248])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][182] ([Intel XE#1173])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#2284] / [Intel XE#366])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [PASS][184] -> [DMESG-WARN][185] ([Intel XE#1616] / [Intel XE#3468])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm@s2idle-multiple-execs.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][186] -> [DMESG-FAIL][187] ([Intel XE#1727] / [Intel XE#3468])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_pm@s3-mocs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][188] -> [DMESG-WARN][189] ([Intel XE#3468] / [Intel XE#569]) +1 other test dmesg-warn
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][190] -> [DMESG-WARN][191] ([Intel XE#2280] / [Intel XE#3468])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm@s4-mocs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@xe_pm@s4-mocs.html
    - shard-dg2-set2:     [PASS][192] -> [DMESG-WARN][193] ([Intel XE#2280] / [Intel XE#3468])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_pm@s4-mocs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@xe_pm@s4-mocs.html
    - shard-lnl:          [PASS][194] -> [ABORT][195] ([Intel XE#1794])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][196] -> [DMESG-WARN][197] ([Intel XE#2280])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#584])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-4/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [PASS][199] -> [FAIL][200] ([Intel XE#2564]) +1 other test fail
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#944]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#3342])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][203] -> [SKIP][204] ([Intel XE#1130]) +163 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_vm@mixed-userptr-misaligned-binds-1611661312:
    - shard-bmg:          [PASS][205] -> [DMESG-WARN][206] ([Intel XE#3468]) +60 other tests dmesg-warn
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][207] ([Intel XE#2919])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2423]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_getstats.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@core_getstats.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [DMESG-WARN][210] ([Intel XE#3521]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@core_hotunplug@hotreplug.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1885]) -> [PASS][213] +2 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#3453]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#2134]) -> [PASS][217] +1 other test pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@fbdev@eof.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@fbdev@eof.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#2423] / [i915#2575]) -> [PASS][219] +113 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-FAIL][220] ([Intel XE#3468]) -> [PASS][221] +24 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][222] ([Intel XE#3466]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][224] ([Intel XE#2705]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          [DMESG-WARN][226] -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][228] ([Intel XE#2597]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][230] ([Intel XE#3468]) -> [PASS][231] +112 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-8/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][232] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [FAIL][234] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - shard-lnl:          [FAIL][236] ([Intel XE#886]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [INCOMPLETE][238] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][241] +16 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [INCOMPLETE][242] ([Intel XE#1195] / [Intel XE#3468]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2136]) -> [PASS][245] +24 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][246] ([Intel XE#1503]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [DMESG-WARN][248] ([Intel XE#3466]) -> [PASS][249] +34 other tests pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-1/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][250] ([Intel XE#2566]) -> [PASS][251] +1 other test pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][252] ([Intel XE#1430]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][254] ([Intel XE#2864]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#2446]) -> [PASS][257] +3 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [FAIL][258] ([Intel XE#3536]) -> [PASS][259] +1 other test pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][260] ([Intel XE#2883]) -> [PASS][261] +2 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][262] ([Intel XE#899]) -> [PASS][263] +1 other test pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [INCOMPLETE][264] ([Intel XE#1727]) -> [PASS][265] +3 other tests pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_vblank@query-busy.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_vblank@query-busy.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-dg2-set2:     [DMESG-WARN][266] ([Intel XE#1727]) -> [PASS][267] +3 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_evict@evict-small-multi-vm.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-lnl:          [DMESG-FAIL][268] ([Intel XE#3466]) -> [PASS][269] +4 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][270] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][271] +1 other test pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][272] ([Intel XE#2998]) -> [PASS][273] +1 other test pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][274] ([Intel XE#3467]) -> [PASS][275] +3 other tests pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-3/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     [FAIL][276] ([Intel XE#2136]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][278] ([Intel XE#569]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][280] ([Intel XE#569]) -> [PASS][281] +1 other test pass
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][282] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [DMESG-FAIL][284] ([Intel XE#1727]) -> [PASS][285] +1 other test pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-bmg:          [DMESG-WARN][286] ([Intel XE#1727]) -> [PASS][287] +9 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-3/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#1130]) -> [PASS][289] +194 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#316]) -> [SKIP][291] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][293] ([Intel XE#316]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#2136]) -> [SKIP][295] ([Intel XE#316]) +5 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#316]) -> [SKIP][297] ([Intel XE#2136]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#1124]) -> [SKIP][299] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2136]) -> [SKIP][301] ([Intel XE#610])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][303] ([Intel XE#1124]) +6 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1124]) -> [SKIP][305] ([Intel XE#2136]) +9 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][307] ([Intel XE#619]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2136]) -> [SKIP][309] ([Intel XE#1124]) +5 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2423] / [i915#2575]) -> [SKIP][311] ([Intel XE#367]) +6 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2191]) -> [SKIP][313] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2423] / [i915#2575]) -> [SKIP][315] ([Intel XE#2191]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#367]) -> [SKIP][317] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2136]) -> [SKIP][319] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][321] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2136]) -> [SKIP][323] ([Intel XE#2907])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][325] ([Intel XE#2136]) +8 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][327] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#3442]) -> [SKIP][329] ([Intel XE#2136])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][330] ([Intel XE#616]) -> [SKIP][331] ([Intel XE#2136])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][333] ([Intel XE#314])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2423] / [i915#2575]) -> [SKIP][335] ([Intel XE#306]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#306]) -> [SKIP][337] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#373]) -> [SKIP][339] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2423] / [i915#2575]) -> [SKIP][341] ([Intel XE#373]) +11 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#2423] / [i915#2575]) -> [SKIP][343] ([Intel XE#455]) +6 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_content_protection@content-type-change.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2423] / [i915#2575]) -> [SKIP][345] ([Intel XE#307])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][346] ([Intel XE#1178]) -> [INCOMPLETE][347] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_content_protection@srm.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@kms_content_protection@srm.html
    - shard-dg2-set2:     [FAIL][348] ([Intel XE#1178]) -> [SKIP][349] ([Intel XE#2423] / [i915#2575])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_content_protection@srm.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#2423] / [i915#2575]) -> [FAIL][351] ([Intel XE#1188])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_content_protection@uevent.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][352] ([Intel XE#1188]) -> [SKIP][353] ([Intel XE#2341])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_content_protection@uevent.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2423] / [i915#2575]) -> [SKIP][355] ([Intel XE#308]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#308]) -> [SKIP][357] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [INCOMPLETE][358] ([Intel XE#1195] / [Intel XE#3226]) -> [SKIP][359] ([Intel XE#2423] / [i915#2575])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][360] ([Intel XE#877]) -> [SKIP][361] ([Intel XE#2291])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [FAIL][362] ([Intel XE#1475]) -> [SKIP][363] ([Intel XE#2423] / [i915#2575])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2423] / [i915#2575]) -> [SKIP][365] ([Intel XE#323]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#323]) -> [SKIP][367] ([Intel XE#2423] / [i915#2575])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#455]) -> [SKIP][369] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][371] ([Intel XE#455]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [DMESG-FAIL][372] ([Intel XE#3468]) -> [FAIL][373] ([Intel XE#1695])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#776]) -> [SKIP][375] ([Intel XE#2136]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2423] / [i915#2575]) -> [SKIP][377] ([Intel XE#701])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2423] / [i915#2575]) -> [SKIP][379] ([Intel XE#1135])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_feature_discovery@psr1.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#1135]) -> [SKIP][381] ([Intel XE#2423] / [i915#2575])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_feature_discovery@psr2.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][382] ([Intel XE#301]) -> [SKIP][383] ([Intel XE#2423] / [i915#2575])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][384] ([Intel XE#1727]) -> [SKIP][385] ([Intel XE#2423] / [i915#2575])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][386] ([Intel XE#3468]) -> [DMESG-FAIL][387] ([Intel XE#3468])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][388] ([Intel XE#3468]) -> [FAIL][389] ([Intel XE#3486])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][390] ([Intel XE#1195] / [Intel XE#3468]) -> [SKIP][391] ([Intel XE#2136] / [Intel XE#2351])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#455]) -> [SKIP][393] ([Intel XE#2136]) +3 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2136]) -> [SKIP][395] ([Intel XE#455]) +4 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][396] ([i915#5274]) -> [SKIP][397] ([Intel XE#2423] / [i915#2575])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][398] ([Intel XE#2311]) -> [SKIP][399] ([Intel XE#2312]) +14 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#651]) -> [SKIP][401] ([Intel XE#2136]) +15 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2136]) -> [SKIP][403] ([Intel XE#651]) +22 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#651]) -> [SKIP][405] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][407] ([Intel XE#651]) +15 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2-set2:     [INCOMPLETE][408] ([Intel XE#1195]) -> [SKIP][409] ([Intel XE#2136])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
    - shard-bmg:          [INCOMPLETE][410] ([Intel XE#3468]) -> [FAIL][411] ([Intel XE#2333])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [DMESG-FAIL][412] ([Intel XE#3468]) -> [SKIP][413] ([Intel XE#2312]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][414] ([Intel XE#2333]) -> [DMESG-FAIL][415] ([Intel XE#3468]) +4 other tests dmesg-fail
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][416] ([Intel XE#2333]) -> [SKIP][417] ([Intel XE#2312]) +4 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [DMESG-FAIL][418] ([Intel XE#3468]) -> [FAIL][419] ([Intel XE#2333]) +6 other tests fail
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#658]) -> [SKIP][421] ([Intel XE#2136] / [Intel XE#2351])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2136]) -> [SKIP][423] ([Intel XE#653]) +32 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][425] ([Intel XE#653]) +7 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#653]) -> [SKIP][427] ([Intel XE#2136]) +21 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#653]) -> [SKIP][429] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][430] ([Intel XE#2313]) -> [SKIP][431] ([Intel XE#2312]) +16 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#455]) -> [SKIP][433] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2136]) -> [SKIP][435] ([Intel XE#346]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2136]) -> [SKIP][437] ([Intel XE#2925])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#2136]) -> [SKIP][439] ([Intel XE#2927])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@lessee-list:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][441] ([Intel XE#1727])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_lease@lessee-list.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_lease@lessee-list.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#2423] / [i915#2575]) -> [SKIP][443] ([Intel XE#356])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][444] ([Intel XE#616]) -> [SKIP][445] ([Intel XE#2423] / [i915#2575])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_plane_cursor@primary.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][447] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2136]) -> [SKIP][449] ([Intel XE#870])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#870]) -> [SKIP][451] ([Intel XE#2136]) +2 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_pm_backlight@fade.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][453] ([Intel XE#1122])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2136]) -> [SKIP][455] ([Intel XE#1129])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][457] ([Intel XE#908])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [ABORT][458] ([Intel XE#3468]) -> [SKIP][459] ([Intel XE#2446]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#2446]) -> [DMESG-FAIL][461] ([Intel XE#3468])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [ABORT][462] ([Intel XE#3468]) -> [DMESG-WARN][463] ([Intel XE#3468])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#1489]) -> [SKIP][465] ([Intel XE#2136]) +10 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#2136]) -> [SKIP][467] ([Intel XE#1489]) +13 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1122]) -> [SKIP][469] ([Intel XE#2136])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][471] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-blt.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][473] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-render.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][475] ([Intel XE#2351]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#2136]) -> [SKIP][477] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr2-basic.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][479] ([Intel XE#2136]) +9 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][481] ([Intel XE#2939])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#2136]) -> [SKIP][483] ([Intel XE#2939])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#2423] / [i915#2575]) -> [SKIP][485] ([Intel XE#1127])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#1127]) -> [SKIP][487] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#3414]) -> [SKIP][489] ([Intel XE#2423] / [i915#2575])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2423] / [i915#2575]) -> [SKIP][491] ([Intel XE#3414]) +2 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vblank@query-idle:
    - shard-bmg:          [DMESG-FAIL][492] ([Intel XE#3468]) -> [DMESG-WARN][493] ([Intel XE#3468])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_vblank@query-idle.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_vblank@query-idle.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][494] -> [SKIP][495] ([Intel XE#1499])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#2423] / [i915#2575]) -> [SKIP][497] ([Intel XE#756])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#756]) -> [SKIP][499] ([Intel XE#2423] / [i915#2575])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#2423] / [i915#2575]) -> [SKIP][501] ([Intel XE#1091] / [Intel XE#2849])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][503] ([Intel XE#1130])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#1130]) -> [SKIP][505] ([Intel XE#1123])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#1123]) -> [SKIP][507] ([Intel XE#1130])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#1130]) -> [SKIP][509] ([Intel XE#1126]) +1 other test skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#2905]) -> [SKIP][511] ([Intel XE#1130]) +12 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][512] ([Intel XE#1600]) -> [SKIP][513] ([Intel XE#1130])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][514] ([Intel XE#2364]) -> [DMESG-FAIL][515] ([Intel XE#3468])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][516] ([Intel XE#1473]) -> [SKIP][517] ([Intel XE#1130])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#1130]) -> [DMESG-WARN][519] ([Intel XE#1727])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@twice-userptr:
    - shard-dg2-set2:     [DMESG-WARN][520] ([Intel XE#1727]) -> [SKIP][521] ([Intel XE#1130]) +3 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_exec_basic@twice-userptr.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#288]) -> [SKIP][523] ([Intel XE#1130]) +28 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#1130]) -> [SKIP][525] ([Intel XE#288]) +32 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#1130]) -> [SKIP][527] ([Intel XE#2360])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#1130]) -> [SKIP][529] ([Intel XE#2905]) +16 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][530] ([Intel XE#3467]) -> [SKIP][531] ([Intel XE#1130]) +5 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [DMESG-WARN][532] ([Intel XE#3343]) -> [SKIP][533] ([Intel XE#1130]) +1 other test skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][534] ([Intel XE#3343]) -> [DMESG-WARN][535] ([Intel XE#3343] / [Intel XE#3468])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#1130]) -> [DMESG-WARN][537] ([Intel XE#3343]) +1 other test dmesg-warn
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#1130]) -> [DMESG-WARN][539] ([Intel XE#3467]) +3 other tests dmesg-warn
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [DMESG-FAIL][540] ([Intel XE#3467]) -> [DMESG-FAIL][541] ([Intel XE#3467] / [Intel XE#3468])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][542] ([Intel XE#3499]) -> [DMESG-FAIL][543] ([Intel XE#3467]) +1 other test dmesg-fail
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][544] ([Intel XE#3499]) -> [FAIL][545] ([Intel XE#3499] / [Intel XE#3539]) +4 other tests fail
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
    - shard-bmg:          [FAIL][546] ([Intel XE#3499]) -> [DMESG-FAIL][547] ([Intel XE#3467] / [Intel XE#3468])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][548] ([Intel XE#3467]) -> [DMESG-WARN][549] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#1192]) -> [FAIL][551] ([Intel XE#1999])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][552] ([Intel XE#2136]) -> [DMESG-WARN][553] ([Intel XE#3467])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_module_load@reload.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@xe_module_load@reload.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#2541]) -> [SKIP][555] ([Intel XE#1130]) +9 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#1130]) -> [SKIP][557] ([Intel XE#2541]) +9 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_oa@invalid-create-userspace-config.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#1130]) -> [SKIP][559] ([Intel XE#2839] / [Intel XE#977])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#1130]) -> [SKIP][561] ([Intel XE#2838] / [Intel XE#979])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#1061]) -> [FAIL][563] ([Intel XE#1173])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_peer2peer@read.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#1130]) -> [DMESG-WARN][565] ([Intel XE#3468])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-463/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-FAIL][566] ([Intel XE#3468]) -> [SKIP][567] ([Intel XE#1130])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][569] ([Intel XE#1130])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][570] ([Intel XE#569]) -> [SKIP][571] ([Intel XE#1130])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#1130]) -> [DMESG-WARN][573] ([Intel XE#3468] / [Intel XE#569])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#1130]) -> [SKIP][575] ([Intel XE#944]) +3 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#944]) -> [SKIP][577] ([Intel XE#1130]) +1 other test skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-434/igt@xe_query@multigpu-query-invalid-extension.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2564
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3536
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8118 -> IGTPW_12146
  * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2254-ccf64319402f90f68549e2047a7f985a46436e41

  IGTPW_12146: 12146
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/index.html
