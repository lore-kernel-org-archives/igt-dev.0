Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8049C61CE8
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 03:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D68E10E142;
	Fri, 13 Jun 2025 03:30:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48A10E142;
 Fri, 13 Jun 2025 03:30:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4634908015534154242=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fcom?=
 =?utf-8?q?pute=5Fmode=3A_Fix_assertion_of_batch_buffer_size_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jun 2025 03:30:16 -0000
Message-ID: <174978541617.74658.1771111667606482471@1538d3639d33>
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

--===============4634908015534154242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_compute_mode: Fix assertion of batch buffer size (rev4)
URL   : https://patchwork.freedesktop.org/series/150134/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8409_BAT -> XEIGTPW_13287_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8409 -> IGTPW_13287
  * Linux: xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2 -> xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6

  IGTPW_13287: 8ed063184c0f78f416eb7329e66f9a0496e64a1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2: aca8df1835568921d5f108fe9fd16b1d282a74b2
  xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13287/index.html

--===============4634908015534154242==
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
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13287/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13287/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8409_BAT -&gt; XEIGTPW_13287_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8409 -&gt; IGTPW_13287</li>
<li>Linux: xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2 -&gt; xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6</li>
</ul>
<p>IGTPW_13287: 8ed063184c0f78f416eb7329e66f9a0496e64a1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3243-aca8df1835568921d5f108fe9fd16b1d282a74b2: aca8df1835568921d5f108fe9fd16b1d282a74b2<br />
  xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6</p>

</body>
</html>

--===============4634908015534154242==--
