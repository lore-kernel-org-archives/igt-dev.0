Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56B7C3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 18:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749E810E0C5;
	Fri,  5 Jul 2024 18:32:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C6710E0C5;
 Fri,  5 Jul 2024 18:32:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5718748353911866804=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_lib/igt=5Fdevice=5Fscan=3A_Sk?=
 =?utf-8?q?ip_attributes_in_subdirectories_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jul 2024 18:32:15 -0000
Message-ID: <172020433591.31861.12101555817633761528@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705141044.115059-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240705141044.115059-1-marcin.bernatowicz@linux.intel.com>
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

--===============5718748353911866804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_device_scan: Skip attributes in subdirectories (rev2)
URL   : https://patchwork.freedesktop.org/series/135769/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7917_full -> XEIGTPW_11375_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11375_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_crc@cursor-offscreen-128x128:
    - {shard-lnl}:        [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-128x128.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-128x128.html

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race:
    - {shard-lnl}:        [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-4/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-3/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-7/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11375_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1214] / [Intel XE#877])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] ([Intel XE#1214]) +3 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][10] -> [TIMEOUT][11] ([Intel XE#1473] / [Intel XE#392])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][12] -> [TIMEOUT][13] ([Intel XE#1473]) +1 other test timeout
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#2046])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#1999]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - {shard-lnl}:        [FAIL][17] ([Intel XE#1659]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-lnl}:        [INCOMPLETE][19] -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#1551]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - {shard-lnl}:        [FAIL][23] ([Intel XE#886]) -> [PASS][24] +2 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][25] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4}:
    - {shard-lnl}:        [DMESG-WARN][27] ([Intel XE#324]) -> [PASS][28] +7 other tests pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html

  * {igt@kms_plane@plane-position-hole@pipe-a-plane-3}:
    - {shard-lnl}:        [DMESG-FAIL][29] ([Intel XE#324]) -> [PASS][30] +1 other test pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][31] ([Intel XE#361]) -> [PASS][32] +1 other test pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - {shard-lnl}:        [SKIP][33] ([Intel XE#870]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - {shard-lnl}:        [FAIL][35] ([Intel XE#718]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - {shard-lnl}:        [FAIL][37] ([Intel XE#899]) -> [PASS][38] +1 other test pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][39] ([Intel XE#1600]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_pm@s4-exec-after:
    - {shard-lnl}:        [ABORT][41] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - {shard-lnl}:        [ABORT][43] ([Intel XE#1794]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-1/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     [SKIP][45] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][46] ([Intel XE#1201])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@kms_content_protection@mei-interface.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-436/igt@kms_content_protection@mei-interface.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][47] ([Intel XE#1551]) -> [FAIL][48] ([Intel XE#616]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][49] ([Intel XE#1192] / [Intel XE#1201]) -> [FAIL][50] ([Intel XE#1999])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1829
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046
  [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
  [Intel XE#2155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2155
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_7917 -> IGTPW_11375

  IGTPW_11375: 11375
  IGT_7917: a1743ac7ed91ce40d742a351b1600da4f75972b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1567-cdd1a80a2d16d5213af20a29eb7570a7651db7dc: cdd1a80a2d16d5213af20a29eb7570a7651db7dc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/index.html

--===============5718748353911866804==
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
<tr><td><b>Series:</b></td><td>lib/igt_device_scan: Skip attributes in subdirectories (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135769/">https://patchwork.freedesktop.org/series/135769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7917_full -&gt; XEIGTPW_11375_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11375_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-128x128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-128x128.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-4/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-3/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-7/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11375_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046">Intel XE#2046</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-a-plane-3}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-434/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-436/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11375/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7917 -&gt; IGTPW_11375</li>
</ul>
<p>IGTPW_11375: 11375<br />
  IGT_7917: a1743ac7ed91ce40d742a351b1600da4f75972b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1567-cdd1a80a2d16d5213af20a29eb7570a7651db7dc: cdd1a80a2d16d5213af20a29eb7570a7651db7dc</p>

</body>
</html>

--===============5718748353911866804==--
