Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDC5FD9E25
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 23:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C90110E0CF;
	Thu, 26 Feb 2026 23:52:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E95310E0CF;
 Thu, 26 Feb 2026 23:52:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0643156596316069149=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Bash_autocompletion_featu?=
 =?utf-8?q?re_for_igt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Sokolowski" <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Feb 2026 23:52:05 -0000
Message-ID: <177214992516.293233.8174939765022086126@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260226133916.33621-1-jan.sokolowski@intel.com>
In-Reply-To: <20260226133916.33621-1-jan.sokolowski@intel.com>
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

--===============0643156596316069149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Bash autocompletion feature for igt
URL   : https://patchwork.freedesktop.org/series/162218/
State : success

== Summary ==

CI Bug Log - changes from IGT_8774 -> IGTPW_14626
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14626/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): bat-dg2-13 bat-dg2-9 bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_14626 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8774/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14626/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8774 -> IGTPW_14626
  * Linux: CI_DRM_18056 -> CI_DRM_18057

  CI-20190529: 20190529
  CI_DRM_18056: 340c78371713a8fdd88fbfe77fd0f7165294c31f @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18057: e42f7566b0d3eba44a6aeeae2c810025c66c44ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14626: 8ccfc0864f4ce8f3f62addc161041289a3776350 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14626/index.html

--===============0643156596316069149==
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
<tr><td><b>Series:</b></td><td>Bash autocompletion feature for igt</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162218/">https://patchwork.freedesktop.org/series/162218/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14626/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14626/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8774 -&gt; IGTPW_14626</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14626/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): bat-dg2-13 bat-dg2-9 bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14626 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8774/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14626/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8774 -&gt; IGTPW_14626</li>
<li>Linux: CI_DRM_18056 -&gt; CI_DRM_18057</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18056: 340c78371713a8fdd88fbfe77fd0f7165294c31f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18057: e42f7566b0d3eba44a6aeeae2c810025c66c44ed @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14626: 8ccfc0864f4ce8f3f62addc161041289a3776350 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0643156596316069149==--
