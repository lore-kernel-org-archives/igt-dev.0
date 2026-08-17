Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7841C5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 13:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1DF10E7D1;
	Mon, 17 Aug 2026 13:28:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CEB10E7D4;
 Mon, 17 Aug 2026 13:28:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6952220200528723199=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_BO_Allocation_and_VM_?=
 =?utf-8?q?Bind_stress_infra?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Aug 2026 13:28:18 -0000
Message-ID: <178697329891.59130.11361712402331475172@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260817053107.887805-1-sobin.thomas@intel.com>
In-Reply-To: <20260817053107.887805-1-sobin.thomas@intel.com>
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

--===============6952220200528723199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add BO Allocation and VM Bind stress infra
URL   : https://patchwork.freedesktop.org/series/172310/
State : success

== Summary ==

CI Bug Log - changes from IGT_9057 -> IGTPW_15687
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15687/index.html

Participating hosts (36 -> 32)
------------------------------

  Missing    (4): bat-dg2-13 bat-jsl-5 fi-snb-2520m bat-adlp-6 

Known issues
------------

  Here are the changes found in IGTPW_15687 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@perf:
    - fi-kbl-7567u:       [DMESG-WARN][1] ([i915#13735]) -> [PASS][2] +13 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9057/fi-kbl-7567u/igt@i915_selftest@live@perf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15687/fi-kbl-7567u/igt@i915_selftest@live@perf.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9057 -> IGTPW_15687
  * Linux: CI_DRM_19000 -> CI_DRM_19006

  CI-20190529: 20190529
  CI_DRM_19000: 9832bc7a458a4a67e68dcf96927588859c1994f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19006: b801f94c49ffdb0f65e37baf31d68570356d4983 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15687: 15687
  IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15687/index.html

--===============6952220200528723199==
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
<tr><td><b>Series:</b></td><td>Add BO Allocation and VM Bind stress infra</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172310/">https://patchwork.freedesktop.org/series/172310/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15687/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15687/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9057 -&gt; IGTPW_15687</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15687/index.html</p>
<h2>Participating hosts (36 -&gt; 32)</h2>
<p>Missing    (4): bat-dg2-13 bat-jsl-5 fi-snb-2520m bat-adlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15687 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@perf:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9057/fi-kbl-7567u/igt@i915_selftest@live@perf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15687/fi-kbl-7567u/igt@i915_selftest@live@perf.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9057 -&gt; IGTPW_15687</li>
<li>Linux: CI_DRM_19000 -&gt; CI_DRM_19006</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19000: 9832bc7a458a4a67e68dcf96927588859c1994f3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19006: b801f94c49ffdb0f65e37baf31d68570356d4983 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15687: 15687<br />
  IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6952220200528723199==--
