Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCA6D60CFA
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F7210E190;
	Mon, 18 Nov 2024 23:15:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8FD10E190;
 Mon, 18 Nov 2024 23:15:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0445384275669396920=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Force_connector/crtc_attrs_to_?=
 =?utf-8?q?default_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Nov 2024 23:15:47 -0000
Message-ID: <173197174733.88190.14578669405721136196@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
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

--===============0445384275669396920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Force connector/crtc attrs to default (rev4)
URL   : https://patchwork.freedesktop.org/series/137234/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8115_BAT -> XEIGTPW_12124_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12124_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-bmg-1:          [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#2687] / [Intel XE#3371])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_intel_bb@render@render-linear-256:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#358]) +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][5] ([Intel XE#1033]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [DMESG-WARN][7] ([Intel XE#358]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358


Build changes
-------------

  * IGT: IGT_8115 -> IGTPW_12124
  * Linux: xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4 -> xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6

  IGTPW_12124: ddeaf3b9a25308dbfb50a26e5985a1e060aefe49 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/index.html

--===============0445384275669396920==
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
<tr><td><b>Series:</b></td><td>Force connector/crtc attrs to default (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137234/">https://patchwork.freedesktop.org/series/137234/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8115_BAT -&gt; XEIGTPW_12124_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12124_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-linear-256:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12124/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8115 -&gt; IGTPW_12124</li>
<li>Linux: xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4 -&gt; xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6</li>
</ul>
<p>IGTPW_12124: ddeaf3b9a25308dbfb50a26e5985a1e060aefe49 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4<br />
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6</p>

</body>
</html>

--===============0445384275669396920==--
