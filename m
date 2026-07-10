Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B49C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 20:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4278410E250;
	Fri, 10 Jul 2026 20:26:55 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C11410E22D;
 Fri, 10 Jul 2026 20:25:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0997914897319599085=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/2=5D_tools/intel=5Fgpu=5Ffrequency=3A_include_limits=2Eh?=
 =?utf-8?q?_to_fix_musl_build?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernd Kuhls" <bernd@kuhls.net>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jul 2026 20:25:58 -0000
Message-ID: <178371515863.175735.2398098268050111661@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260710184619.2347456-1-bernd@kuhls.net>
In-Reply-To: <20260710184619.2347456-1-bernd@kuhls.net>
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

--===============0997914897319599085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tools/intel_gpu_frequency: include limits.h to fix musl build
URL   : https://patchwork.freedesktop.org/series/170207/
State : success

== Summary ==

CI Bug Log - changes from IGT_9002 -> IGTPW_15512
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15512 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9002/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9002 -> IGTPW_15512
  * Linux: CI_DRM_18802 -> CI_DRM_18804

  CI-20190529: 20190529
  CI_DRM_18802: 08cdb6010efc9b2f58f740fc59dadc8c119f8b55 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18804: 6d76f5afea7406e978db1fc356a9b88d0d8989d1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15512: e2fb065095459e7199e2511687af5e36853891dd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9002: 9002

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/index.html

--===============0997914897319599085==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tools/intel_gpu_frequency: include limits.h to fix musl build</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170207/">https://patchwork.freedesktop.org/series/170207/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9002 -&gt; IGTPW_15512</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15512 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_rpm@basic-rte:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9002/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15512/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9002 -&gt; IGTPW_15512</li>
<li>Linux: CI_DRM_18802 -&gt; CI_DRM_18804</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18802: 08cdb6010efc9b2f58f740fc59dadc8c119f8b55 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18804: 6d76f5afea7406e978db1fc356a9b88d0d8989d1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15512: e2fb065095459e7199e2511687af5e36853891dd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9002: 9002</p>

</body>
</html>

--===============0997914897319599085==--
