Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F123C3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 06:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244C610E8BC;
	Thu,  8 May 2025 06:36:16 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4893010E8AF;
 Thu,  8 May 2025 06:36:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3242505022422952751=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_lib/amdgpu=3A_add_timeout_support_for_user_queue_subm?=
 =?utf-8?q?issions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 08 May 2025 06:36:15 -0000
Message-ID: <174668617528.58639.5035399240341209248@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
In-Reply-To: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
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

--===============3242505022422952751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/amdgpu: add timeout support for user queue submissions
URL   : https://patchwork.freedesktop.org/series/148744/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8357_BAT -> XEIGTPW_13092_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13092_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/bat-adlp-vf/igt@xe_pat@pat-index-xelp.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13092/bat-adlp-vf/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13092/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8357 -> IGTPW_13092

  IGTPW_13092: 13092
  IGT_8357: 8357
  xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3: ca0305cadc2d34c8887b891b96226af17571b2a3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13093/index.html

--===============3242505022422952751==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] lib/amdgpu: add timeout support for user queue submissions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148744/">https://patchwork.freedesktop.org/series/148744/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13093/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13093/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8357_BAT -&gt; XEIGTPW_13092_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13092_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/bat-adlp-vf/igt@xe_pat@pat-index-xelp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13092/bat-adlp-vf/igt@xe_pat@pat-index-xelp.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13092/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8357 -&gt; IGTPW_13092</li>
</ul>
<p>IGTPW_13092: 13092<br />
  IGT_8357: 8357<br />
  xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3: ca0305cadc2d34c8887b891b96226af17571b2a3</p>

</body>
</html>

--===============3242505022422952751==--
