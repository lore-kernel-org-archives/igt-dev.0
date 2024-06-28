Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DBCC3064D
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 14:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A08410E21D;
	Fri, 28 Jun 2024 14:11:47 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDCE10E21D;
 Fri, 28 Jun 2024 14:11:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2760536993635921861=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Ffb=3A_Align_tile4_st?=
 =?utf-8?q?ride_on_Xe2_as_if_it_was_always_compressed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jun 2024 14:11:46 -0000
Message-ID: <171958390639.186137.6863036726628994114@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240628131405.2653544-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240628131405.2653544-1-juhapekka.heikkila@gmail.com>
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

--===============2760536993635921861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb: Align tile4 stride on Xe2 as if it was always compressed
URL   : https://patchwork.freedesktop.org/series/135520/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7907_BAT -> XEIGTPW_11329_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11329_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - {bat-lnl-1}:        [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7907/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11329/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7907 -> IGTPW_11329
  * Linux: xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c -> xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299

  IGTPW_11329: 11329
  IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c: 42f35e623e6590cf8ec493373e4664ae4e32123c
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11329/index.html

--===============2760536993635921861==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb: Align tile4 stride on Xe2 as if it was always compressed</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135520/">https://patchwork.freedesktop.org/series/135520/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11329/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11329/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7907_BAT -&gt; XEIGTPW_11329_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11329_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7907/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11329/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7907 -&gt; IGTPW_11329</li>
<li>Linux: xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c -&gt; xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299</li>
</ul>
<p>IGTPW_11329: 11329<br />
  IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c: 42f35e623e6590cf8ec493373e4664ae4e32123c<br />
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299</p>

</body>
</html>

--===============2760536993635921861==--
