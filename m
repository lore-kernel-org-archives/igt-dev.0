Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F969606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 03:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C460E10E17B;
	Thu, 29 Oct 2026 03:14:04 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC8410E17B;
 Thu, 29 Oct 2026 03:13:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2970843084374130287=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/imagination=3A_Add_?=
 =?utf-8?q?query_Firmware_information_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brajesh Gupta" <brajesh.gupta@imgtec.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Oct 2026 03:13:13 -0000
Message-ID: <179324359312.84791.15198424859289482010@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029-b4-fw_info-v1-1-0eb3c0969a7f@imgtec.com>
In-Reply-To: <20261029-b4-fw_info-v1-1-0eb3c0969a7f@imgtec.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2970843084374130287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/imagination: Add query Firmware information test
URL   : https://patchwork.freedesktop.org/series/177067/
State : success

== Summary ==

CI Bug Log - changes from IGT_9170 -> IGTPW_16065
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16065/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16065 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@active:
    - fi-bsw-nick:        [PASS][1] -> [DMESG-FAIL][2] ([i915#14808]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9170/fi-bsw-nick/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16065/fi-bsw-nick/igt@i915_selftest@live@active.html

  
  [i915#14808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9170 -> IGTPW_16065
  * Linux: CI_DRM_19407 -> CI_DRM_19410

  CI-20190529: 20190529
  CI_DRM_19407: fbed42265ffde9b162e21ed7ff0cfce070e19aaa @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19410: 114156ff58b8db80a36355fd6a28725dc7e20584 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16065: 16065
  IGT_9170: 9170

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16065/index.html

--===============2970843084374130287==
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
<tr><td><b>Series:</b></td><td>tests/imagination: Add query Firmware information test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177067/">https://patchwork.freedesktop.org/series/177067/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16065/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16065/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9170 -&gt; IGTPW_16065</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16065/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16065 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@active:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9170/fi-bsw-nick/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16065/fi-bsw-nick/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808">i915#14808</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9170 -&gt; IGTPW_16065</li>
<li>Linux: CI_DRM_19407 -&gt; CI_DRM_19410</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19407: fbed42265ffde9b162e21ed7ff0cfce070e19aaa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19410: 114156ff58b8db80a36355fd6a28725dc7e20584 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16065: 16065<br />
  IGT_9170: 9170</p>

</body>
</html>

--===============2970843084374130287==--
