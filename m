Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A165CA0EC0
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 10:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ABF10E42B;
	Mon, 18 Aug 2025 10:07:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E49B10E41F;
 Mon, 18 Aug 2025 10:07:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1895168550998678716=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Shaders_migration_to_separa?=
 =?utf-8?q?te_headers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Aug 2025 10:07:00 -0000
Message-ID: <175551162063.243428.15708931038965582978@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818073114.1014041-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250818073114.1014041-6-zbigniew.kempczynski@intel.com>
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

--===============1895168550998678716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Shaders migration to separate headers (rev2)
URL   : https://patchwork.freedesktop.org/series/152864/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8495_BAT -> XEIGTPW_13587_BAT
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

  Here are the changes found in XEIGTPW_13587_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-lnl-1:          NOTRUN -> [FAIL][1] ([Intel XE#5945])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-lnl-1/igt@runner@aborted.html
    - bat-bmg-2:          NOTRUN -> [FAIL][2] ([Intel XE#5945])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-bmg-2/igt@runner@aborted.html
    - bat-bmg-1:          NOTRUN -> [FAIL][3] ([Intel XE#5945])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-bmg-1/igt@runner@aborted.html
    - bat-adlp-7:         NOTRUN -> [FAIL][4] ([Intel XE#5945])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-adlp-7/igt@runner@aborted.html
    - bat-lnl-2:          NOTRUN -> [FAIL][5] ([Intel XE#5945])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-lnl-2/igt@runner@aborted.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][6] ([Intel XE#5945])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-dg2-oem2/igt@runner@aborted.html
    - bat-atsm-2:         NOTRUN -> [FAIL][7] ([Intel XE#5945])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-atsm-2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945


Build changes
-------------

  * IGT: IGT_8495 -> IGTPW_13587
  * Linux: xe-3551-7582d01b3cb80604bd700c37237effb7b5c6fe6e -> xe-3567-2109e38df4c111216f291cde8fd0f7eede4ebd62

  IGTPW_13587: 13587
  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3551-7582d01b3cb80604bd700c37237effb7b5c6fe6e: 7582d01b3cb80604bd700c37237effb7b5c6fe6e
  xe-3567-2109e38df4c111216f291cde8fd0f7eede4ebd62: 2109e38df4c111216f291cde8fd0f7eede4ebd62

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/index.html

--===============1895168550998678716==
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
<tr><td><b>Series:</b></td><td>Shaders migration to separate headers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152864/">https://patchwork.freedesktop.org/series/152864/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8495_BAT -&gt; XEIGTPW_13587_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13587_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-lnl-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-bmg-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-bmg-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-adlp-7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-lnl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-dg2-oem2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/bat-atsm-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8495 -&gt; IGTPW_13587</li>
<li>Linux: xe-3551-7582d01b3cb80604bd700c37237effb7b5c6fe6e -&gt; xe-3567-2109e38df4c111216f291cde8fd0f7eede4ebd62</li>
</ul>
<p>IGTPW_13587: 13587<br />
  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3551-7582d01b3cb80604bd700c37237effb7b5c6fe6e: 7582d01b3cb80604bd700c37237effb7b5c6fe6e<br />
  xe-3567-2109e38df4c111216f291cde8fd0f7eede4ebd62: 2109e38df4c111216f291cde8fd0f7eede4ebd62</p>

</body>
</html>

--===============1895168550998678716==--
