Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423F0C49EA1
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 19:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021C410E43F;
	Tue, 30 Jul 2024 19:43:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929A310E303;
 Tue, 30 Jul 2024 19:43:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5289039033698061585=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_vmwgfx_prime_tests_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zack Rusin" <zack.rusin@broadcom.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Jul 2024 19:43:53 -0000
Message-ID: <172236863359.450882.2549528200866825318@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730190037.1134020-1-zack.rusin@broadcom.com>
In-Reply-To: <20240730190037.1134020-1-zack.rusin@broadcom.com>
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

--===============5289039033698061585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add vmwgfx prime tests (rev5)
URL   : https://patchwork.freedesktop.org/series/133402/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7942_BAT -> XEIGTPW_11499_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11499_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11499_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11499_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@nullptr:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@fbdev@nullptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-bmg-1/igt@fbdev@nullptr.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11499_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_intel_bb@blit-simple:
    - {bat-lnl-2}:        [DMESG-WARN][3] ([Intel XE#1705]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-lnl-2/igt@xe_intel_bb@blit-simple.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][5] ([Intel XE#2418]) -> [ABORT][6] ([Intel XE#2418] / [Intel XE#2421])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [ABORT][7] ([Intel XE#2418]) -> [ABORT][8] ([Intel XE#2418] / [Intel XE#2421])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [ABORT][9] ([Intel XE#2418]) -> [ABORT][10] ([Intel XE#2418] / [Intel XE#2421])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421


Build changes
-------------

  * IGT: IGT_7942 -> IGTPW_11499
  * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af

  IGTPW_11499: 11499
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
  xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af: acd846e309e206a4dbc83e4b857b6604aa0741af

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/index.html

--===============5289039033698061585==
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
<tr><td><b>Series:</b></td><td>Add vmwgfx prime tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133402/">https://patchwork.freedesktop.org/series/133402/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7942_BAT -&gt; XEIGTPW_11499_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11499_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11499_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11499_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@fbdev@nullptr:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-bmg-1/igt@fbdev@nullptr.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11499_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@blit-simple:<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-lnl-2/igt@xe_intel_bb@blit-simple.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7942 -&gt; IGTPW_11499</li>
<li>Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -&gt; xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af</li>
</ul>
<p>IGTPW_11499: 11499<br />
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d<br />
  xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af: acd846e309e206a4dbc83e4b857b6604aa0741af</p>

</body>
</html>

--===============5289039033698061585==--
