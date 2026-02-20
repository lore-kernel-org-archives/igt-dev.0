Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B593BC5B55D
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 20:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4977A10E839;
	Fri, 20 Feb 2026 20:43:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319DC10E839;
 Fri, 20 Feb 2026 20:43:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4860312224226409549=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Improve_eudebug_test_cleanu?=
 =?utf-8?q?p_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Feb 2026 20:43:43 -0000
Message-ID: <177162022318.271423.4748914198682893635@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
In-Reply-To: <20260220153748.210381-7-christoph.manszewski@intel.com>
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

--===============4860312224226409549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve eudebug test cleanup (rev4)
URL   : https://patchwork.freedesktop.org/series/161086/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8764_BAT -> XEIGTPW_14585_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14585_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][1] ([Intel XE#455]) -> [SKIP][2] ([Intel XE#2244] / [Intel XE#455])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8764/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14585/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#455]) -> [SKIP][4] ([Intel XE#2244] / [Intel XE#455])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8764/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14585/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8764 -> IGTPW_14585
  * Linux: xe-4577-157c1f59af33fb9acf6e0e055e7317b634711120 -> xe-4583-822a5d8092375e2d59dbdc34380b785dd37af6f5

  IGTPW_14585: 14585
  IGT_8764: 8764
  xe-4577-157c1f59af33fb9acf6e0e055e7317b634711120: 157c1f59af33fb9acf6e0e055e7317b634711120
  xe-4583-822a5d8092375e2d59dbdc34380b785dd37af6f5: 822a5d8092375e2d59dbdc34380b785dd37af6f5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14585/index.html

--===============4860312224226409549==
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
<tr><td><b>Series:</b></td><td>Improve eudebug test cleanup (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161086/">https://patchwork.freedesktop.org/series/161086/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14585/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14585/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8764_BAT -&gt; XEIGTPW_14585_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14585_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8764/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14585/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8764/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14585/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8764 -&gt; IGTPW_14585</li>
<li>Linux: xe-4577-157c1f59af33fb9acf6e0e055e7317b634711120 -&gt; xe-4583-822a5d8092375e2d59dbdc34380b785dd37af6f5</li>
</ul>
<p>IGTPW_14585: 14585<br />
  IGT_8764: 8764<br />
  xe-4577-157c1f59af33fb9acf6e0e055e7317b634711120: 157c1f59af33fb9acf6e0e055e7317b634711120<br />
  xe-4583-822a5d8092375e2d59dbdc34380b785dd37af6f5: 822a5d8092375e2d59dbdc34380b785dd37af6f5</p>

</body>
</html>

--===============4860312224226409549==--
