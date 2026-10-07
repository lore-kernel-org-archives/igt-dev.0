Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B333CCA6002
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 21:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CA510E2E9;
	Wed,  7 Oct 2026 21:57:29 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6818110E2E9;
 Wed,  7 Oct 2026 21:56:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5201560564907063010=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Fix_dmesg_ignore_regexes_?=
 =?utf-8?q?with_backslash_escapes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Oct 2026 21:56:40 -0000
Message-ID: <179141020041.250171.16513266323755784871@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
In-Reply-To: <20261007210603.1350158-1-shuicheng.lin@intel.com>
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

--===============5201560564907063010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix dmesg ignore regexes with backslash escapes
URL   : https://patchwork.freedesktop.org/series/175714/
State : success

== Summary ==

CI Bug Log - changes from IGT_9134 -> IGTPW_15957
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15957/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15957 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [FAIL][1] ([i915#16664]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9134/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15957/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9134 -> IGTPW_15957
  * Linux: CI_DRM_19294 -> CI_DRM_19296

  CI-20190529: 20190529
  CI_DRM_19294: c55090c5898a23460a6b17613532bef0ec028ea7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19296: e2193f15b4b009baae0b7cb7fc337a6fe80dd211 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15957: aceade775f4b2f8e3dadd2442c56c5a7f2138e45 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15957/index.html

--===============5201560564907063010==
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
<tr><td><b>Series:</b></td><td>Fix dmesg ignore regexes with backslash escapes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175714/">https://patchwork.freedesktop.org/series/175714/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15957/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15957/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9134 -&gt; IGTPW_15957</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15957/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15957 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9134/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664">i915#16664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15957/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9134 -&gt; IGTPW_15957</li>
<li>Linux: CI_DRM_19294 -&gt; CI_DRM_19296</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19294: c55090c5898a23460a6b17613532bef0ec028ea7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19296: e2193f15b4b009baae0b7cb7fc337a6fe80dd211 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15957: aceade775f4b2f8e3dadd2442c56c5a7f2138e45 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5201560564907063010==--
