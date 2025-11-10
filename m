Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA227CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 14:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369A510E0B1;
	Mon, 10 Nov 2025 14:02:43 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAEA10E0B7;
 Mon, 10 Nov 2025 14:02:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6566847524427058142=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_Update_bl?=
 =?utf-8?q?ocklists_for_xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Nov 2025 14:02:41 -0000
Message-ID: <176278336182.35467.7592841609492241463@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110121225.8849-1-himanshu.girotra@intel.com>
In-Reply-To: <20251110121225.8849-1-himanshu.girotra@intel.com>
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

--===============6566847524427058142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Update blocklists for xe (rev2)
URL   : https://patchwork.freedesktop.org/series/157304/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8617_BAT -> XEIGTPW_14030_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14030_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8617/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14030/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  * igt@xe_waitfence@engine:
    - bat-pvc-2:          [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8617/bat-pvc-2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14030/bat-pvc-2/igt@xe_waitfence@engine.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8617 -> IGTPW_14030
  * Linux: xe-4078-fcb872dc4c32b52110822e0ecab0aa846fc44892 -> xe-4080-2a3c89b0d3805cb7102e55c00463489e7b97f13c

  IGTPW_14030: 14030
  IGT_8617: 8617
  xe-4078-fcb872dc4c32b52110822e0ecab0aa846fc44892: fcb872dc4c32b52110822e0ecab0aa846fc44892
  xe-4080-2a3c89b0d3805cb7102e55c00463489e7b97f13c: 2a3c89b0d3805cb7102e55c00463489e7b97f13c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14030/index.html

--===============6566847524427058142==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Update blocklists for xe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157304/">https://patchwork.freedesktop.org/series/157304/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14030/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14030/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8617_BAT -&gt; XEIGTPW_14030_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14030_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8617/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14030/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8617/bat-pvc-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14030/bat-pvc-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8617 -&gt; IGTPW_14030</li>
<li>Linux: xe-4078-fcb872dc4c32b52110822e0ecab0aa846fc44892 -&gt; xe-4080-2a3c89b0d3805cb7102e55c00463489e7b97f13c</li>
</ul>
<p>IGTPW_14030: 14030<br />
  IGT_8617: 8617<br />
  xe-4078-fcb872dc4c32b52110822e0ecab0aa846fc44892: fcb872dc4c32b52110822e0ecab0aa846fc44892<br />
  xe-4080-2a3c89b0d3805cb7102e55c00463489e7b97f13c: 2a3c89b0d3805cb7102e55c00463489e7b97f13c</p>

</body>
</html>

--===============6566847524427058142==--
