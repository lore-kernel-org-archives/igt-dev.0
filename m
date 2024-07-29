Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0A6C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 12:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A95210E177;
	Mon, 29 Jul 2024 12:08:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2010E2FB;
 Mon, 29 Jul 2024 12:08:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0663280189785457004=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_I915=5FFORMAT=5FMOD=5F4=5F?=
 =?utf-8?q?TILED=5FXE2=5FCCS_modifier_for_Intel_hw_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jul 2024 12:08:30 -0000
Message-ID: <172225491082.416367.6766448918472507435@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725181622.3457403-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240725181622.3457403-1-juhapekka.heikkila@gmail.com>
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

--===============0663280189785457004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add I915_FORMAT_MOD_4_TILED_XE2_CCS modifier for Intel hw (rev2)
URL   : https://patchwork.freedesktop.org/series/136523/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7940_BAT -> XEIGTPW_11483_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11483_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11483_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11483_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-lnl-1:          [PASS][1] -> [SKIP][2] +7 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  
#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][5] ([Intel XE#1091]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-1:          [SKIP][7] ([Intel XE#2229]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - {bat-bmg-1}:        [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-bmg-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-bmg-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * {igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit}:
    - bat-lnl-1:          [SKIP][11] ([Intel XE#2229]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11483_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][13] -> [ABORT][14] ([Intel XE#2418])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][15] -> [SKIP][16] ([Intel XE#1885])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#324])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - bat-lnl-1:          [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#1620] / [Intel XE#1760]) +1 other test dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html

  * igt@runner@aborted:
    - bat-pvc-2:          NOTRUN -> [FAIL][21] ([Intel XE#2103])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-pvc-2/igt@runner@aborted.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][22] ([Intel XE#2103])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-dg2-oem2/igt@runner@aborted.html
    - bat-atsm-2:         NOTRUN -> [FAIL][23] ([Intel XE#2103])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-atsm-2/igt@runner@aborted.html

  * igt@xe_huc_copy@huc_copy:
    - bat-lnl-1:          [PASS][24] -> [SKIP][25] ([Intel XE#1130]) +170 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_huc_copy@huc_copy.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_huc_copy@huc_copy.html

  
#### Warnings ####

  * igt@xe_evict@evict-threads-small:
    - bat-lnl-1:          [SKIP][26] ([Intel XE#688]) -> [SKIP][27] ([Intel XE#1130]) +17 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_evict@evict-threads-small.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_evict@evict-threads-small.html

  * igt@xe_mmap@vram:
    - bat-lnl-1:          [SKIP][28] ([Intel XE#1416]) -> [SKIP][29] ([Intel XE#1130])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_mmap@vram.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][30] ([Intel XE#1420]) -> [SKIP][31] ([Intel XE#1130])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-1:          [SKIP][32] ([Intel XE#977]) -> [SKIP][33] ([Intel XE#1130])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][34] ([Intel XE#979]) -> [SKIP][35] ([Intel XE#1130])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2103
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7940 -> IGTPW_11483
  * Linux: xe-1672-220554a8ef7ac26fbfc4f141816679d742a0d232 -> xe-1681-6f226dd91cbd83b14b375dac4246f617f0b98288

  IGTPW_11483: 11483
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1672-220554a8ef7ac26fbfc4f141816679d742a0d232: 220554a8ef7ac26fbfc4f141816679d742a0d232
  xe-1681-6f226dd91cbd83b14b375dac4246f617f0b98288: 6f226dd91cbd83b14b375dac4246f617f0b98288

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/index.html

--===============0663280189785457004==
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
<tr><td><b>Series:</b></td><td>Add I915_FORMAT_MOD_4_TILED_XE2_CCS modifier for Intel hw (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136523/">https://patchwork.freedesktop.org/series/136523/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7940_BAT -&gt; XEIGTPW_11483_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11483_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11483_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11483_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-bmg-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-bmg-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit}:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11483_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-pvc-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2103">Intel XE#2103</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-dg2-oem2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2103">Intel XE#2103</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-atsm-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2103">Intel XE#2103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +170 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11483/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7940 -&gt; IGTPW_11483</li>
<li>Linux: xe-1672-220554a8ef7ac26fbfc4f141816679d742a0d232 -&gt; xe-1681-6f226dd91cbd83b14b375dac4246f617f0b98288</li>
</ul>
<p>IGTPW_11483: 11483<br />
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1672-220554a8ef7ac26fbfc4f141816679d742a0d232: 220554a8ef7ac26fbfc4f141816679d742a0d232<br />
  xe-1681-6f226dd91cbd83b14b375dac4246f617f0b98288: 6f226dd91cbd83b14b375dac4246f617f0b98288</p>

</body>
</html>

--===============0663280189785457004==--
