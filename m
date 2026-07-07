Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F190C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 12:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4621F897FD;
	Tue,  7 Jul 2026 12:54:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B409910E4B0;
 Tue,  7 Jul 2026 12:54:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5446063926130068145=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_Tolerate_?=
 =?utf-8?q?bandwidth-limited_MPO_scale_combinations_in_mpo-scale?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "James Lin" <pinglei.lin@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Jul 2026 12:54:24 -0000
Message-ID: <178342886473.158539.5253276181301555660@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707074312.3492-1-PingLei.Lin@amd.com>
In-Reply-To: <20260707074312.3492-1-PingLei.Lin@amd.com>
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

--===============5446063926130068145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Tolerate bandwidth-limited MPO scale combinations in mpo-scale
URL   : https://patchwork.freedesktop.org/series/169914/
State : success

== Summary ==

CI Bug Log - changes from IGT_8991 -> IGTPW_15480
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15480/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-kbl-7567u bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15480 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-adls-6:         [DMESG-FAIL][1] ([i915#14808]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/bat-adls-6/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15480/bat-adls-6/igt@i915_selftest@live.html

  
  [i915#14808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8991 -> IGTPW_15480
  * Linux: CI_DRM_18772 -> CI_DRM_18774

  CI-20190529: 20190529
  CI_DRM_18772: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18774: 96e9ac36699d58791b67aea5e1d258074ea63165 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15480: 2ac9b025ecdb9931abe7e97f12bfd89c362af6ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15480/index.html

--===============5446063926130068145==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Tolerate bandwidth-limited MPO scale combinations in mpo-scale</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169914/">https://patchwork.freedesktop.org/series/169914/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15480/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15480/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8991 -&gt; IGTPW_15480</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15480/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-kbl-7567u bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15480 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/bat-adls-6/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808">i915#14808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15480/bat-adls-6/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8991 -&gt; IGTPW_15480</li>
<li>Linux: CI_DRM_18772 -&gt; CI_DRM_18774</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18772: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18774: 96e9ac36699d58791b67aea5e1d258074ea63165 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15480: 2ac9b025ecdb9931abe7e97f12bfd89c362af6ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5446063926130068145==--
