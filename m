Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE9BD609D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 17:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3257410E842;
	Tue, 16 Dec 2025 17:45:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45A10E842;
 Tue, 16 Dec 2025 17:45:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1165220564913485561=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/i915=5Fpm=5Frps=3A_?=
 =?utf-8?q?Improve_sysfs_error_reporting_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 16 Dec 2025 17:45:45 -0000
Message-ID: <176590714595.94731.14900196049139928960@a3b018990fe9>
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

--===============1165220564913485561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915_pm_rps: Improve sysfs error reporting (rev3)
URL   : https://patchwork.freedesktop.org/series/159017/
State : success

== Summary ==

CI Bug Log - changes from IGT_8667 -> IGTPW_14220
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_14220 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8667/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@guc_multi_lrc:
    - fi-kbl-7567u:       [DMESG-WARN][3] ([i915#13735]) -> [PASS][4] +8 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8667/fi-kbl-7567u/igt@i915_selftest@live@guc_multi_lrc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/fi-kbl-7567u/igt@i915_selftest@live@guc_multi_lrc.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8667 -> IGTPW_14220
  * Linux: CI_DRM_17691 -> CI_DRM_17692

  CI-20190529: 20190529
  CI_DRM_17691: 4bae139bb961fd9df698b3bf15bf39f9bf9800a1 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17692: 2dc4a4ece453df925f995df5eac747a29081c180 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14220: 3e90b22e67b100c5af7c254577e6fcce40041e88 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8667: 2d7ec9a36c550c48af4bdd6e748f6753369ab8ff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/index.html

--===============1165220564913485561==
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
<tr><td><b>Series:</b></td><td>tests/i915_pm_rps: Improve sysfs error reporting (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159017/">https://patchwork.freedesktop.org/series/159017/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8667 -&gt; IGTPW_14220</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14220 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8667/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@guc_multi_lrc:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8667/fi-kbl-7567u/igt@i915_selftest@live@guc_multi_lrc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14220/fi-kbl-7567u/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8667 -&gt; IGTPW_14220</li>
<li>Linux: CI_DRM_17691 -&gt; CI_DRM_17692</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17691: 4bae139bb961fd9df698b3bf15bf39f9bf9800a1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17692: 2dc4a4ece453df925f995df5eac747a29081c180 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14220: 3e90b22e67b100c5af7c254577e6fcce40041e88 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8667: 2d7ec9a36c550c48af4bdd6e748f6753369ab8ff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1165220564913485561==--
