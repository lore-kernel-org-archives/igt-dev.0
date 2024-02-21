Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A214C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 15:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAA110E47D;
	Wed, 21 Feb 2024 15:00:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBEC10E52F;
 Wed, 21 Feb 2024 15:00:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8573639318278161708=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Add_tests_to_query_firmware?=
 =?utf-8?q?_version_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Feb 2024 15:00:18 -0000
Message-ID: <170852761806.178729.3687144801003400549@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221135033.7-1-francois.dugast@intel.com>
In-Reply-To: <20240221135033.7-1-francois.dugast@intel.com>
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

--===============8573639318278161708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tests to query firmware version (rev4)
URL   : https://patchwork.freedesktop.org/series/129647/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14308 -> IGTPW_10711
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10711 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-8:          [PASS][1] -> [DMESG-FAIL][2] ([i915#9500])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14308/bat-dg2-8/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/bat-dg2-8/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@ccs0:
    - {bat-arls-1}:       [DMESG-WARN][3] ([i915#10194]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14308/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#9500]: https://gitlab.freedesktop.org/drm/intel/issues/9500


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7719 -> IGTPW_10711

  CI-20190529: 20190529
  CI_DRM_14308: e520d7c9e8738c2d1f6602cf43d6e761e5a93668 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10711: 10711
  IGT_7719: 7719


Testlist changes
----------------

+igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz
+igt@xe_query@multigpu-query-uc-fw-version-guc
+igt@xe_query@multigpu-query-uc-fw-version-huc
+igt@xe_query@query-invalid-uc-fw-version-mbz
+igt@xe_query@query-uc-fw-version-guc
+igt@xe_query@query-uc-fw-version-huc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/index.html

--===============8573639318278161708==
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
<tr><td><b>Series:</b></td><td>Add tests to query firmware version (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129647/">https://patchwork.freedesktop.org/series/129647/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14308 -&gt; IGTPW_10711</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10711 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14308/bat-dg2-8/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/bat-dg2-8/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9500">i915#9500</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_fence@basic-busy@ccs0:<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14308/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10711/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7719 -&gt; IGTPW_10711</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14308: e520d7c9e8738c2d1f6602cf43d6e761e5a93668 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10711: 10711<br />
  IGT_7719: 7719</p>
<h2>Testlist changes</h2>
<p>+igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz<br />
+igt@xe_query@multigpu-query-uc-fw-version-guc<br />
+igt@xe_query@multigpu-query-uc-fw-version-huc<br />
+igt@xe_query@query-invalid-uc-fw-version-mbz<br />
+igt@xe_query@query-uc-fw-version-guc<br />
+igt@xe_query@query-uc-fw-version-huc</p>

</body>
</html>

--===============8573639318278161708==--
