Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7E3C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 13:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000D510EA60;
	Thu, 11 Jul 2024 13:14:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF71E10EA60;
 Thu, 11 Jul 2024 13:14:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5356782157516592615=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Use_display_alignment_for_f?=
 =?utf-8?q?b_size_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Jul 2024 13:14:08 -0000
Message-ID: <172070364884.126278.13006448314677662216@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711110210.207882-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240711110210.207882-1-zbigniew.kempczynski@intel.com>
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

--===============5356782157516592615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use display alignment for fb size calculation
URL   : https://patchwork.freedesktop.org/series/135994/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15062 -> IGTPW_11399
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): bat-kbl-2 fi-kbl-8809g fi-snb-2520m fi-tgl-1115g4 

Known issues
------------

  Here are the changes found in IGTPW_11399 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@dmabuf:
    - bat-jsl-1:          [INCOMPLETE][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15062/bat-jsl-1/igt@i915_selftest@live@dmabuf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/bat-jsl-1/igt@i915_selftest@live@dmabuf.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-5:         [DMESG-WARN][3] ([i915#11349] / [i915#11570]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15062/bat-arls-5/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/bat-arls-5/igt@i915_selftest@live@hangcheck.html

  
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11570]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11570


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7924 -> IGTPW_11399

  CI-20190529: 20190529
  CI_DRM_15062: fddd0bd57d92132ca9b2ec029561bb4d9b72a56b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11399: 11399
  IGT_7924: 6e6ecdef9f167ff987f6d323f3ff6429c01b25e0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/index.html

--===============5356782157516592615==
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
<tr><td><b>Series:</b></td><td>Use display alignment for fb size calculation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135994/">https://patchwork.freedesktop.org/series/135994/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15062 -&gt; IGTPW_11399</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): bat-kbl-2 fi-kbl-8809g fi-snb-2520m fi-tgl-1115g4 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11399 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15062/bat-jsl-1/igt@i915_selftest@live@dmabuf.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/bat-jsl-1/igt@i915_selftest@live@dmabuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15062/bat-arls-5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11570">i915#11570</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11399/bat-arls-5/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7924 -&gt; IGTPW_11399</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15062: fddd0bd57d92132ca9b2ec029561bb4d9b72a56b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11399: 11399<br />
  IGT_7924: 6e6ecdef9f167ff987f6d323f3ff6429c01b25e0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5356782157516592615==--
