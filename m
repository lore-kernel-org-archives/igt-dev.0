Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7E0D148B7
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 07:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8B110E69C;
	Thu,  8 Jan 2026 07:32:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F15310E30D;
 Thu,  8 Jan 2026 07:32:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4771697606124511770=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_implement_sel?=
 =?utf-8?q?ective_sync_skipping_for_error_injection_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 08 Jan 2026 07:32:25 -0000
Message-ID: <176785754525.135415.6230725694743373803@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108063451.4110907-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260108063451.4110907-1-Jesse.Zhang@amd.com>
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

--===============4771697606124511770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: implement selective sync skipping for error injection tests (rev3)
URL   : https://patchwork.freedesktop.org/series/159680/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8692_BAT -> XEIGTPW_14313_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14313_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14313/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8692 -> IGTPW_14313
  * Linux: xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f -> xe-4344-bbd2596084d7d562841571575239ef867c69bdce

  IGTPW_14313: 03e7ad4a5764281b69c5784b1262101766311060 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8692: 8692
  xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f: 77ca0c5f244b2796408d20cf3c0741094304e09f
  xe-4344-bbd2596084d7d562841571575239ef867c69bdce: bbd2596084d7d562841571575239ef867c69bdce

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14313/index.html

--===============4771697606124511770==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: implement selective sync skipping for error injection tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159680/">https://patchwork.freedesktop.org/series/159680/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14313/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14313/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8692_BAT -&gt; XEIGTPW_14313_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14313_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14313/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8692 -&gt; IGTPW_14313</li>
<li>Linux: xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f -&gt; xe-4344-bbd2596084d7d562841571575239ef867c69bdce</li>
</ul>
<p>IGTPW_14313: 03e7ad4a5764281b69c5784b1262101766311060 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8692: 8692<br />
  xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f: 77ca0c5f244b2796408d20cf3c0741094304e09f<br />
  xe-4344-bbd2596084d7d562841571575239ef867c69bdce: bbd2596084d7d562841571575239ef867c69bdce</p>

</body>
</html>

--===============4771697606124511770==--
