Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB9FC71148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 02:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6ED10E0AE;
	Fri, 13 Jun 2025 02:08:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7357010E097;
 Fri, 13 Jun 2025 02:08:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5560940885823633780=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fc?=
 =?utf-8?q?ompute=5Fmode=3A_Fix_assertion_of_batch_buffer_size_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jun 2025 02:08:42 -0000
Message-ID: <174978052244.74585.4845113356134335752@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613001943.3704187-1-shuicheng.lin@intel.com>
In-Reply-To: <20250613001943.3704187-1-shuicheng.lin@intel.com>
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

--===============5560940885823633780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_compute_mode: Fix assertion of batch buffer size (rev4)
URL   : https://patchwork.freedesktop.org/series/150134/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8409 -> IGTPW_13287
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13287 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13287, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13287/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13287:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2] +49 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8409/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13287/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8409 -> IGTPW_13287
  * Linux: CI_DRM_16694 -> CI_DRM_16696

  CI-20190529: 20190529
  CI_DRM_16694: aca8df1835568921d5f108fe9fd16b1d282a74b2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16696: 190bbece34ea123c98a27f5692e8ce8e9559200e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13287: 8ed063184c0f78f416eb7329e66f9a0496e64a1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13287/index.html

--===============5560940885823633780==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_compute_mode: Fix assertion of batch buffer size (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150134/">https://patchwork.freedesktop.org/series/150134/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13287/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13287/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8409 -&gt; IGTPW_13287</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13287 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13287, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13287/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13287:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8409/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13287/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> +49 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8409 -&gt; IGTPW_13287</li>
<li>Linux: CI_DRM_16694 -&gt; CI_DRM_16696</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16694: aca8df1835568921d5f108fe9fd16b1d282a74b2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16696: 190bbece34ea123c98a27f5692e8ce8e9559200e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13287: 8ed063184c0f78f416eb7329e66f9a0496e64a1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5560940885823633780==--
