Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2C7D5B86E
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 21:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBE310E160;
	Mon, 15 Dec 2025 21:08:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BBE10E160;
 Mon, 15 Dec 2025 21:08:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0779441032763042149=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/i915=5Fpm=5Frps=3A_?=
 =?utf-8?q?Improve_sysfs_error_reporting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 15 Dec 2025 21:08:29 -0000
Message-ID: <176583290922.91038.15070282382663900210@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
In-Reply-To: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
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

--===============0779441032763042149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915_pm_rps: Improve sysfs error reporting
URL   : https://patchwork.freedesktop.org/series/159017/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8666 -> IGTPW_14209
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14209 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14209, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14209:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@guc:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8666/bat-arlh-2/igt@i915_selftest@live@guc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/bat-arlh-2/igt@i915_selftest@live@guc.html

  
Known issues
------------

  Here are the changes found in IGTPW_14209 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4] ([i915#14837])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8666/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/bat-arlh-2/igt@i915_selftest@live.html

  
  [i915#14837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14837


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8666 -> IGTPW_14209
  * Linux: CI_DRM_17678 -> CI_DRM_17687

  CI-20190529: 20190529
  CI_DRM_17678: c4e22b127f18ea8765c4fabc251d019dd3aa41a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17687: 89b7f1ac50d51d9c2334e119fe40de41b366333f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14209: a3a464827708a7ddb2839ad07da4467aa4cc7e4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8666: 8666

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/index.html

--===============0779441032763042149==
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
<tr><td><b>Series:</b></td><td>tests/i915_pm_rps: Improve sysfs error reporting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159017/">https://patchwork.freedesktop.org/series/159017/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8666 -&gt; IGTPW_14209</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14209 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14209, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14209:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@guc:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8666/bat-arlh-2/igt@i915_selftest@live@guc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/bat-arlh-2/igt@i915_selftest@live@guc.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14209 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8666/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14209/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14837">i915#14837</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8666 -&gt; IGTPW_14209</li>
<li>Linux: CI_DRM_17678 -&gt; CI_DRM_17687</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17678: c4e22b127f18ea8765c4fabc251d019dd3aa41a4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17687: 89b7f1ac50d51d9c2334e119fe40de41b366333f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14209: a3a464827708a7ddb2839ad07da4467aa4cc7e4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8666: 8666</p>

</body>
</html>

--===============0779441032763042149==--
