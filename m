Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEF9C79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 15:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D429C10E431;
	Mon,  5 Jan 2026 15:12:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BBF10E430;
 Mon,  5 Jan 2026 15:12:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2329266985576323936=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_xe3p_compute_kernels_an?=
 =?utf-8?q?d_preemption_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Jan 2026 15:12:08 -0000
Message-ID: <176762592835.126412.5228304394043583216@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
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

--===============2329266985576323936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add xe3p compute kernels and preemption support (rev2)
URL   : https://patchwork.freedesktop.org/series/159522/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8683_BAT -> XEIGTPW_14286_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-bmg-1 

Known issues
------------

  Here are the changes found in XEIGTPW_14286_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          NOTRUN -> [ABORT][1] ([Intel XE#6922] / [Intel XE#6930])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14286/bat-bmg-1/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-ptl-1:          [SKIP][2] -> [PASS][3] +3 other tests pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8683/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14286/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html

  
  [Intel XE#6922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922
  [Intel XE#6930]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6930


Build changes
-------------

  * IGT: IGT_8683 -> IGTPW_14286

  IGTPW_14286: 14286
  IGT_8683: 8683
  xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e: f5136cded03e959ebb00a1160e5f00973c38007e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14286/index.html

--===============2329266985576323936==
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
<tr><td><b>Series:</b></td><td>Add xe3p compute kernels and preemption support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159522/">https://patchwork.freedesktop.org/series/159522/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14286/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14286/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8683_BAT -&gt; XEIGTPW_14286_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14286_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14286/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922">Intel XE#6922</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6930">Intel XE#6930</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_force_connector_basic@force-edid:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8683/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14286/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8683 -&gt; IGTPW_14286</li>
</ul>
<p>IGTPW_14286: 14286<br />
  IGT_8683: 8683<br />
  xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e: f5136cded03e959ebb00a1160e5f00973c38007e</p>

</body>
</html>

--===============2329266985576323936==--
