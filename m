Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBB3CD3436
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 23:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966ED10E09E;
	Mon,  4 May 2026 23:59:51 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E9B10E129;
 Mon,  4 May 2026 23:59:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1143994837970768852=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_xe=5Fexec=5Fsystem=5Fallo?=
 =?utf-8?q?cator=3A_fix_PREFETCH=5FSPLIT=5FVMA_bo=5Fsize_for_PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 May 2026 23:59:35 -0000
Message-ID: <177793917585.37015.11811713267179131736@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504223717.1080309-1-jia.yao@intel.com>
In-Reply-To: <20260504223717.1080309-1-jia.yao@intel.com>
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

--===============1143994837970768852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_exec_system_allocator: fix PREFETCH_SPLIT_VMA bo_size for PVC
URL   : https://patchwork.freedesktop.org/series/165937/
State : success

== Summary ==

CI Bug Log - changes from IGT_8883 -> IGTPW_15097
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): bat-dg2-13 bat-atsm-1 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15097 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8883/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][3] ([i915#12061]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8883/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8883 -> IGTPW_15097
  * Linux: CI_DRM_18409 -> CI_DRM_18410

  CI-20190529: 20190529
  CI_DRM_18409: 9160312bed536c4b78ad3736fc1aaf25ed78bccd @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18410: 5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15097: a9c1e8c2eb4b291cd637a45162bc23316367a4d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8883: 8214859d2c4ecf8f81a08a3d2cd26f0a50d2b513 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/index.html

--===============1143994837970768852==
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
<tr><td><b>Series:</b></td><td>xe_exec_system_allocator: fix PREFETCH_SPLIT_VMA bo_size for PVC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165937/">https://patchwork.freedesktop.org/series/165937/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8883 -&gt; IGTPW_15097</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): bat-dg2-13 bat-atsm-1 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15097 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8883/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8883/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15097/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8883 -&gt; IGTPW_15097</li>
<li>Linux: CI_DRM_18409 -&gt; CI_DRM_18410</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18409: 9160312bed536c4b78ad3736fc1aaf25ed78bccd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18410: 5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15097: a9c1e8c2eb4b291cd637a45162bc23316367a4d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8883: 8214859d2c4ecf8f81a08a3d2cd26f0a50d2b513 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1143994837970768852==--
