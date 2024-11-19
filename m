Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68040D6C2B7
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 23:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2812310E06C;
	Tue, 19 Nov 2024 23:24:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9028D10E06C;
 Tue, 19 Nov 2024 23:24:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3849732662824686331=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel/xe=5Foa=3A_Refacto?=
 =?utf-8?q?rs_related_to_OA_buffer_size_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 Nov 2024 23:24:49 -0000
Message-ID: <173205868960.487737.5078836848987207177@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119090405.951437-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241119090405.951437-1-sai.teja.pottumuttu@intel.com>
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

--===============3849732662824686331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Refactors related to OA buffer size (rev2)
URL   : https://patchwork.freedesktop.org/series/141471/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8118_BAT -> XEIGTPW_12141_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12141_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12141_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12141_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] +56 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12141_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#3517])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-lnl-1:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3466])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_addfb_basic@too-high:
    - bat-lnl-1:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#3466] / [Intel XE#3514])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@kms_addfb_basic@too-high.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@kms_addfb_basic@too-high.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][11] -> [SKIP][12] ([Intel XE#3443] / [Intel XE#455]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:
    - bat-lnl-1:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#3514]) +103 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][17] -> [DMESG-WARN][18] ([Intel XE#358]) +4 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-lnl-1:          [DMESG-FAIL][19] ([Intel XE#3466]) -> [PASS][20] +32 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_threads@threads-basic:
    - bat-lnl-1:          [DMESG-WARN][21] ([Intel XE#3466]) -> [PASS][22] +3 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_threads@threads-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@xe_exec_threads@threads-basic.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][23] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][24] ([Intel XE#1192])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8118 -> IGTPW_12141
  * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2254-ccf64319402f90f68549e2047a7f985a46436e41

  IGTPW_12141: 12141
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/index.html

--===============3849732662824686331==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Refactors related to OA buffer size (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141471/">https://patchwork.freedesktop.org/series/141471/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8118_BAT -&gt; XEIGTPW_12141_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12141_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12141_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12141_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</a> +56 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12141_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@kms_addfb_basic@too-high.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514">Intel XE#3514</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514">Intel XE#3514</a>) +103 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12141/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8118 -&gt; IGTPW_12141</li>
<li>Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -&gt; xe-2254-ccf64319402f90f68549e2047a7f985a46436e41</li>
</ul>
<p>IGTPW_12141: 12141<br />
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd<br />
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41</p>

</body>
</html>

--===============3849732662824686331==--
