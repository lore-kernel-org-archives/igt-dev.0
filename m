Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C418D340BA
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 16:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B100010E59A;
	Tue, 27 Jan 2026 16:47:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4456810E0DB;
 Tue, 27 Jan 2026 16:47:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4072323453947085612=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Fkms=3A_pipe_vs_CR?=
 =?utf-8?q?TC_index_cleanups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jan 2026 16:47:13 -0000
Message-ID: <176953243327.197106.15290626704128869910@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1769514879.git.jani.nikula@intel.com>
In-Reply-To: <cover.1769514879.git.jani.nikula@intel.com>
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

--===============4072323453947085612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: pipe vs CRTC index cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/160345/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8720_BAT -> XEIGTPW_14428_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14428_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14428/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * IGT: IGT_8720 -> IGTPW_14428
  * Linux: xe-4452-1a13a943d42ab743e72246f5d765f31cbd609e27 -> xe-4453-e37acbcead81d2ee84f731c72241e62788b57552

  IGTPW_14428: 14428
  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4452-1a13a943d42ab743e72246f5d765f31cbd609e27: 1a13a943d42ab743e72246f5d765f31cbd609e27
  xe-4453-e37acbcead81d2ee84f731c72241e62788b57552: e37acbcead81d2ee84f731c72241e62788b57552

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14428/index.html

--===============4072323453947085612==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: pipe vs CRTC index cleanups (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160345/">https://patchwork.freedesktop.org/series/160345/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14428/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14428/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8720_BAT -&gt; XEIGTPW_14428_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14428_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14428/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8720 -&gt; IGTPW_14428</li>
<li>Linux: xe-4452-1a13a943d42ab743e72246f5d765f31cbd609e27 -&gt; xe-4453-e37acbcead81d2ee84f731c72241e62788b57552</li>
</ul>
<p>IGTPW_14428: 14428<br />
  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4452-1a13a943d42ab743e72246f5d765f31cbd609e27: 1a13a943d42ab743e72246f5d765f31cbd609e27<br />
  xe-4453-e37acbcead81d2ee84f731c72241e62788b57552: e37acbcead81d2ee84f731c72241e62788b57552</p>

</body>
</html>

--===============4072323453947085612==--
