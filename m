Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EC1C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 05:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B351130C7;
	Tue, 23 Apr 2024 05:06:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6361130C7;
 Tue, 23 Apr 2024 05:06:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0547362562627701407=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_Intel_blitter_framebuffer_cop?=
 =?utf-8?q?ying_sanitizing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Apr 2024 05:06:49 -0000
Message-ID: <171384880918.1590396.11646341937315964892@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
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

--===============0547362562627701407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel blitter framebuffer copying sanitizing
URL   : https://patchwork.freedesktop.org/series/132733/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7815_full -> XEIGTPW_11051_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_11051_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11051_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 1)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11051_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11051_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-1024:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#1201] / [i915#6077])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_addfb_basic@bad-pitch-1024.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_addfb_basic@bad-pitch-1024.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-7.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#306])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#307])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][16] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1135] / [Intel XE#1201])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1195])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_flip@dpms-vs-vblank-race.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@dpms-vs-vblank-race@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][20] ([Intel XE#1195])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_flip@dpms-vs-vblank-race@a-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#1226])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_lease@empty-lease:
    - shard-dg2-set2:     [PASS][24] -> [SKIP][25] ([Intel XE#1201] / [Intel XE#1226]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_lease@empty-lease.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_lease@empty-lease.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#616]) +6 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][29] -> [FAIL][30] ([Intel XE#361])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][33] -> [SKIP][34] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prop_blob@invalid-set-prop:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#1201] / [Intel XE#780])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_prop_blob@invalid-set-prop.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_prop_blob@invalid-set-prop.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1127] / [Intel XE#1201])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#1214])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#756])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#821])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][47] -> [TIMEOUT][48] ([Intel XE#1473] / [Intel XE#821])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#1259])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@xe_evict@evict-beng-threads-small-multi-vm.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][51] -> [INCOMPLETE][52] ([Intel XE#1195] / [Intel XE#1473])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#1069])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#255])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#1201])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#1043] / [Intel XE#845])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_pm@s4-multiple-execs.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][62] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][64] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-dg2-set2:     [DMESG-WARN][66] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][67] +7 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:
    - shard-dg2-set2:     [FAIL][68] ([Intel XE#650]) -> [PASS][69] +122 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][70] ([Intel XE#1214]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-dg2-set2:     [SKIP][72] ([Intel XE#1201] / [Intel XE#687]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_getfb@getfb2-accept-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][75] +9 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][78] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [FAIL][80] ([Intel XE#1259]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][82] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][84] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr:
    - shard-dg2-set2:     [ABORT][86] ([Intel XE#1304] / [Intel XE#1364]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  * {igt@xe_pm@s2idle-vm-bind-userptr}:
    - shard-dg2-set2:     [INCOMPLETE][90] ([Intel XE#1195] / [Intel XE#1694]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [FAIL][92] ([Intel XE#650]) -> [SKIP][93] ([Intel XE#1201] / [Intel XE#801]) +7 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][95] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][97] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][99] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][100] ([Intel XE#650]) -> [INCOMPLETE][101] ([Intel XE#1195]) +1 other test incomplete
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][103] ([Intel XE#1201] / [Intel XE#1226])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#373])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#1226]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][108] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#1226])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#1226]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1235]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1235]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#653])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#1226]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][124] ([Intel XE#616]) -> [DMESG-FAIL][125] ([Intel XE#1162]) +1 other test dmesg-fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][126] ([Intel XE#581]) -> [FAIL][127] ([Intel XE#616])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_plane_cursor@primary.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][131] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][133] ([Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [TIMEOUT][134] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909]) -> [INCOMPLETE][135] ([Intel XE#1195] / [Intel XE#909])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][136] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][137] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#1226])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#1226])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#1226]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#929])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-render.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][147] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][148] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][149] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][150] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][151] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [DMESG-WARN][152] ([Intel XE#1214]) -> [ABORT][153] ([Intel XE#1205] / [Intel XE#1216])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@xe_module_load@unload.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_module_load@unload.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][154] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][155] ([Intel XE#1162])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7815 -> IGTPW_11051
  * Linux: xe-1137-ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a -> xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa

  IGTPW_11051: 11051
  IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1137-ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a: ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a
  xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa: 5b3637fab551c28eef3e80d371ea7500e2aafbaa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132733v1/index.html

--===============0547362562627701407==
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
<tr><td><b>Series:</b></td><td>Intel blitter framebuffer copying sanitizing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132733/">https://patchwork.freedesktop.org/series/132733/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132733v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132733v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7815_full -&gt; XEIGTPW_11051_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_11051_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11051_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 1)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11051_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11051_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-1024:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_addfb_basic@bad-pitch-1024.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_addfb_basic@bad-pitch-1024.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_flip@dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_flip@dpms-vs-vblank-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_flip@dpms-vs-vblank-race@a-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_lease@empty-lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_lease@empty-lease.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-set-prop:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_prop_blob@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_prop_blob@invalid-set-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@xe_evict@evict-beng-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@xe_evict@evict-beng-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html">PASS</a> +122 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_getfb@getfb2-accept-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364">Intel XE#1364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s2idle-vm-bind-userptr}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-464/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-434/igt@xe_module_load@unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216">Intel XE#1216</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11051/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7815 -&gt; IGTPW_11051</li>
<li>Linux: xe-1137-ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a -&gt; xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa</li>
</ul>
<p>IGTPW_11051: 11051<br />
  IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1137-ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a: ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a<br />
  xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa: 5b3637fab551c28eef3e80d371ea7500e2aafbaa</p>

</body>
</html>

--===============0547362562627701407==--
