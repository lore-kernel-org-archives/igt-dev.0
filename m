Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744FECD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 16:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0F910F38F;
	Tue,  2 Apr 2024 16:13:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E1B10F010;
 Tue,  2 Apr 2024 16:12:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4451969773087475674=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Filr=3A_F?=
 =?utf-8?q?ix_eDP_PSR_not_be_re-enabled_after_test_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Apr 2024 16:12:59 -0000
Message-ID: <171207437992.1154304.11014445381262316464@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402152040.29149-1-hersenxs.wu@amd.com>
In-Reply-To: <20240402152040.29149-1-hersenxs.wu@amd.com>
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

--===============4451969773087475674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled after test (rev4)
URL   : https://patchwork.freedesktop.org/series/131298/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14516 -> IGTPW_10966
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/index.html

Participating hosts (37 -> 33)
------------------------------

  Additional (1): fi-cfl-8109u 
  Missing    (5): fi-snb-2520m bat-dg2-11 fi-bsw-nick bat-mtlp-8 bat-arls-3 

Known issues
------------

  Here are the changes found in IGTPW_10966 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_pm_rpm@basic-rte:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] +14 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/fi-cfl-8109u/igt@kms_pm_rpm@basic-rte.html

  
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7796 -> IGTPW_10966

  CI-20190529: 20190529
  CI_DRM_14516: 5100fcc57dc5d45b246a0aeb068f4f8062d29b09 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10966: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/index.html
  IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/index.html

--===============4451969773087475674==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled after test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131298/">https://patchwork.freedesktop.org/series/131298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14516 -&gt; IGTPW_10966</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/index.html</p>
<h2>Participating hosts (37 -&gt; 33)</h2>
<p>Additional (1): fi-cfl-8109u <br />
  Missing    (5): fi-snb-2520m bat-dg2-11 fi-bsw-nick bat-mtlp-8 bat-arls-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10966 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/fi-cfl-8109u/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7796 -&gt; IGTPW_10966</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14516: 5100fcc57dc5d45b246a0aeb068f4f8062d29b09 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10966: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10966/index.html<br />
  IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4451969773087475674==--
