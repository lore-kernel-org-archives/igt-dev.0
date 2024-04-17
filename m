Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A6DC001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 22:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2342E10F620;
	Wed, 17 Apr 2024 22:27:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043EE10F4B6;
 Wed, 17 Apr 2024 22:27:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1831599058964353421=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_L3_bank_mask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Apr 2024 22:27:21 -0000
Message-ID: <171339284101.1483750.4228609894231855186@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417145049.7-1-francois.dugast@intel.com>
In-Reply-To: <20240417145049.7-1-francois.dugast@intel.com>
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

--===============1831599058964353421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: L3 bank mask
URL   : https://patchwork.freedesktop.org/series/132564/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7811_BAT -> XEIGTPW_11035_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (0 -> 1)
------------------------------

  Additional (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_11035_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7811 -> IGTPW_11035

  IGTPW_11035: 30521c53e242c9f762516ab67335ffb470abff47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7811: 2d95df5757eb99a42ea9ac30fd74001dee804d03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3: 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11035/index.html

--===============1831599058964353421==
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
<tr><td><b>Series:</b></td><td>L3 bank mask</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132564/">https://patchwork.freedesktop.org/series/132564/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11035/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11035/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7811_BAT -&gt; XEIGTPW_11035_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (0 -&gt; 1)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11035_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7811 -&gt; IGTPW_11035</li>
</ul>
<p>IGTPW_11035: 30521c53e242c9f762516ab67335ffb470abff47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7811: 2d95df5757eb99a42ea9ac30fd74001dee804d03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3: 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3</p>

</body>
</html>

--===============1831599058964353421==--
