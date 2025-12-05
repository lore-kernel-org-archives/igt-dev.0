Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F31D339B2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 18:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6782B10EB93;
	Fri,  5 Dec 2025 18:33:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A05C10EB93;
 Fri,  5 Dec 2025 18:33:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0254812213177647798=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fbw=3A_Correct_s?=
 =?utf-8?q?kip_message_for_mx_pipe_count?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Dec 2025 18:33:25 -0000
Message-ID: <176495960555.62145.15603550937478422619@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251204182034.307117-1-alex.hung@amd.com>
In-Reply-To: <20251204182034.307117-1-alex.hung@amd.com>
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

--===============0254812213177647798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw: Correct skip message for mx pipe count
URL   : https://patchwork.freedesktop.org/series/158513/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8656_BAT -> XEIGTPW_14160_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14160_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8656/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14160/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8656/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14160/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8656 -> IGTPW_14160
  * Linux: xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf -> xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead

  IGTPW_14160: 9f336490af536ee623b8ed8f26bca82d94bc816f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8656: 1fa8aeb0848614e6204602c5fe2949e049f087c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf: a36e2c7fed2132052900236e8c7aa563d339baaf
  xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead: abc20a831a03dc608256340159c23e01ee6b6ead

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14160/index.html

--===============0254812213177647798==
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
<tr><td><b>Series:</b></td><td>tests/kms_bw: Correct skip message for mx pipe count</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158513/">https://patchwork.freedesktop.org/series/158513/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14160/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14160/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8656_BAT -&gt; XEIGTPW_14160_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14160_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8656/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14160/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8656/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14160/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8656 -&gt; IGTPW_14160</li>
<li>Linux: xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf -&gt; xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead</li>
</ul>
<p>IGTPW_14160: 9f336490af536ee623b8ed8f26bca82d94bc816f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8656: 1fa8aeb0848614e6204602c5fe2949e049f087c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf: a36e2c7fed2132052900236e8c7aa563d339baaf<br />
  xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead: abc20a831a03dc608256340159c23e01ee6b6ead</p>

</body>
</html>

--===============0254812213177647798==--
