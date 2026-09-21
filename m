Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67035C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 16:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1467C10EA2E;
	Mon, 21 Sep 2026 16:58:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8701310E2B6;
 Mon, 21 Sep 2026 16:57:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2455005381554767669=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_intel-ci=3A_Add_multigpu_?=
 =?utf-8?q?svm_to_CRI_Core_blocklist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Venkateswara Rao Muppidi" <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Sep 2026 16:57:17 -0000
Message-ID: <179000983754.188434.12571219039552227562@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
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

--===============2455005381554767669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Add multigpu svm to CRI Core blocklist
URL   : https://patchwork.freedesktop.org/series/174617/
State : success

== Summary ==

CI Bug Log - changes from IGT_9104 -> IGTPW_15870
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-8 bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15870 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@too-high:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +37 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_addfb_basic@too-high.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/bat-apl-1/igt@kms_addfb_basic@too-high.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#13735] / [i915#180]) +21 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][5] -> [FAIL][6] ([i915#16664])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9104 -> IGTPW_15870

  CI-20190529: 20190529
  CI_DRM_19193: ab82471ddff094939d9981e0647332562c7e1c9b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15870: 15870
  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/index.html

--===============2455005381554767669==
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
<tr><td><b>Series:</b></td><td>intel-ci: Add multigpu svm to CRI Core blocklist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174617/">https://patchwork.freedesktop.org/series/174617/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9104 -&gt; IGTPW_15870</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-8 bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15870 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/bat-apl-1/igt@kms_addfb_basic@too-high.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +37 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +21 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664">i915#16664</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9104 -&gt; IGTPW_15870</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19193: ab82471ddff094939d9981e0647332562c7e1c9b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15870: 15870<br />
  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2455005381554767669==--
