Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041E6CFB452
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 18:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A9410E409;
	Mon,  7 Oct 2024 18:50:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860FB10E408;
 Mon,  7 Oct 2024 18:50:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5565654079392676818=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Fix_xe=5Feudebug=5Fonline?=
 =?utf-8?q?=40interrupt-other_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Oct 2024 18:50:37 -0000
Message-ID: <172832703754.1199953.11021084887756311716@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007102734.5452-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241007102734.5452-1-dominik.karol.piatkowski@intel.com>
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

--===============5565654079392676818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix xe_eudebug_online@interrupt-other test (rev3)
URL   : https://patchwork.freedesktop.org/series/139158/
State : success

== Summary ==

CI Bug Log - changes from IGT_8054 -> IGTPW_11878
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11878/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): bat-dg1-6 

Known issues
------------

  Here are the changes found in IGTPW_11878 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-adlp-11:        [PASS][1] -> [INCOMPLETE][2] ([i915#9413]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-adlp-11/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11878/bat-adlp-11/igt@i915_selftest@live@workarounds.html

  
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8054 -> IGTPW_11878
  * Linux: CI_DRM_15484 -> CI_DRM_15485

  CI-20190529: 20190529
  CI_DRM_15484: 92d12099cc768f36cf676ee1b014442a5c5ba965 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15485: 39a016b276ce8adac629cc6c31892d0b7d2af634 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11878: 681a10e5c212d465305d5dd663b5e7c6d8ebfa52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11878/index.html

--===============5565654079392676818==
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
<tr><td><b>Series:</b></td><td>Fix xe_eudebug_online@interrupt-other test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139158/">https://patchwork.freedesktop.org/series/139158/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11878/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11878/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8054 -&gt; IGTPW_11878</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11878/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): bat-dg1-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11878 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-adlp-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11878/bat-adlp-11/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8054 -&gt; IGTPW_11878</li>
<li>Linux: CI_DRM_15484 -&gt; CI_DRM_15485</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15484: 92d12099cc768f36cf676ee1b014442a5c5ba965 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15485: 39a016b276ce8adac629cc6c31892d0b7d2af634 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11878: 681a10e5c212d465305d5dd663b5e7c6d8ebfa52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5565654079392676818==--
