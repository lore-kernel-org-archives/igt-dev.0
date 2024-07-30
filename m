Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2668C3DA70
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 13:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7963510E4DC;
	Tue, 30 Jul 2024 13:54:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C59210E4DC;
 Tue, 30 Jul 2024 13:54:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0179159102584187493=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel=3A_Add_tests_to_ru?=
 =?utf-8?q?n_suspend_without_display_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Jul 2024 13:54:52 -0000
Message-ID: <172234769211.429013.1151413346398968497@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
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

--===============0179159102584187493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add tests to run suspend without display (rev3)
URL   : https://patchwork.freedesktop.org/series/130239/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7942_BAT -> XEIGTPW_11493_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11493_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_intel_bb@blit-simple:
    - {bat-lnl-2}:        [DMESG-WARN][1] ([Intel XE#1705]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/bat-lnl-2/igt@xe_intel_bb@blit-simple.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][3] ([Intel XE#2418]) -> [ABORT][4] ([Intel XE#2418] / [Intel XE#2421])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [ABORT][5] ([Intel XE#2418]) -> [ABORT][6] ([Intel XE#2418] / [Intel XE#2421])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [ABORT][7] ([Intel XE#2418]) -> [ABORT][8] ([Intel XE#2418] / [Intel XE#2421])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421


Build changes
-------------

  * IGT: IGT_7942 -> IGTPW_11493
  * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33

  IGTPW_11493: 11493
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
  xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33: 277a79bf0ef669d9b96f6787906f4e5edb827a33

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/index.html

--===============0179159102584187493==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add tests to run suspend without display (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130239/">https://patchwork.freedesktop.org/series/130239/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7942_BAT -&gt; XEIGTPW_11493_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11493_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@blit-simple:<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/bat-lnl-2/igt@xe_intel_bb@blit-simple.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7942 -&gt; IGTPW_11493</li>
<li>Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -&gt; xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33</li>
</ul>
<p>IGTPW_11493: 11493<br />
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d<br />
  xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33: 277a79bf0ef669d9b96f6787906f4e5edb827a33</p>

</body>
</html>

--===============0179159102584187493==--
