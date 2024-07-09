Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513BEC2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 09:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0C610E4DA;
	Tue,  9 Jul 2024 09:36:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADB789BF4;
 Tue,  9 Jul 2024 09:36:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6330902850556267913=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_fix_amd_dispa?=
 =?utf-8?q?tch_issue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Jul 2024 09:36:17 -0000
Message-ID: <172051777716.85397.245454397248672985@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240709082322.1873739-1-jesse.zhang@amd.com>
In-Reply-To: <20240709082322.1873739-1-jesse.zhang@amd.com>
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

--===============6330902850556267913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: fix amd dispatch issue
URL   : https://patchwork.freedesktop.org/series/135885/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15047 -> IGTPW_11384
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11384/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): bat-kbl-2 bat-dg2-11 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_11384 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         NOTRUN -> [INCOMPLETE][1] ([i915#11320])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11384/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
  [i915#11320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7920 -> IGTPW_11384

  CI-20190529: 20190529
  CI_DRM_15047: fe74acc80d474524b2da613714a8d1a25adf648c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11384: 11384
  IGT_7920: 7920

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11384/index.html

--===============6330902850556267913==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: fix amd dispatch issue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135885/">https://patchwork.freedesktop.org/series/135885/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11384/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11384/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15047 -&gt; IGTPW_11384</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11384/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): bat-kbl-2 bat-dg2-11 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11384 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11384/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320">i915#11320</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7920 -&gt; IGTPW_11384</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15047: fe74acc80d474524b2da613714a8d1a25adf648c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11384: 11384<br />
  IGT_7920: 7920</p>

</body>
</html>

--===============6330902850556267913==--
