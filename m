Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB0BC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 17:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902AE10E58D;
	Mon, 21 Jul 2025 17:37:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC76F10E578;
 Mon, 21 Jul 2025 17:37:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1745681113011491595=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5F*=3A_Apply?=
 =?utf-8?q?_NEEDS=5FVISIBLE=5FVRAM_in_remaining_affected_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Jul 2025 17:37:02 -0000
Message-ID: <175311942282.177614.14638058238482961794@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250721092716.11880-1-lukasz.laguna@intel.com>
In-Reply-To: <20250721092716.11880-1-lukasz.laguna@intel.com>
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

--===============1745681113011491595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in remaining affected tests
URL   : https://patchwork.freedesktop.org/series/151879/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8468_BAT -> XEIGTPW_13502_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13502_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13502_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13502_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13502_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip:
    - bat-adlp-7:         [DMESG-WARN][9] ([Intel XE#4543]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@kms_flip@basic-plain-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@kms_flip@basic-plain-flip.html

  
#### Warnings ####

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         [SKIP][11] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][12] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_evict@evict-small-cm.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][13] ([Intel XE#688]) -> [SKIP][14] ([Intel XE#5563] / [Intel XE#688])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][15] ([Intel XE#288]) -> [SKIP][16] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         [SKIP][17] ([Intel XE#2229]) -> [SKIP][18] ([Intel XE#2229] / [Intel XE#5488])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][19] ([Intel XE#1008]) -> [SKIP][20] ([Intel XE#1008] / [Intel XE#5591])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_mmap@vram.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_mmap@vram.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_8468 -> IGTPW_13502
  * Linux: xe-3440-338efc39ef3f17f6759817c857a95054334eae09 -> xe-3447-62dc6f672f79c0b74acd61dd86936f8e5e6fdb0d

  IGTPW_13502: cd87e3856adc7ae0c4307735824144181dfaa162 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8468: 8468
  xe-3440-338efc39ef3f17f6759817c857a95054334eae09: 338efc39ef3f17f6759817c857a95054334eae09
  xe-3447-62dc6f672f79c0b74acd61dd86936f8e5e6fdb0d: 62dc6f672f79c0b74acd61dd86936f8e5e6fdb0d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/index.html

--===============1745681113011491595==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in remaining affected tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151879/">https://patchwork.freedesktop.org/series/151879/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8468_BAT -&gt; XEIGTPW_13502_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13502_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13502_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13502_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13502_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@kms_flip@basic-plain-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13502/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8468 -&gt; IGTPW_13502</li>
<li>Linux: xe-3440-338efc39ef3f17f6759817c857a95054334eae09 -&gt; xe-3447-62dc6f672f79c0b74acd61dd86936f8e5e6fdb0d</li>
</ul>
<p>IGTPW_13502: cd87e3856adc7ae0c4307735824144181dfaa162 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8468: 8468<br />
  xe-3440-338efc39ef3f17f6759817c857a95054334eae09: 338efc39ef3f17f6759817c857a95054334eae09<br />
  xe-3447-62dc6f672f79c0b74acd61dd86936f8e5e6fdb0d: 62dc6f672f79c0b74acd61dd86936f8e5e6fdb0d</p>

</body>
</html>

--===============1745681113011491595==--
