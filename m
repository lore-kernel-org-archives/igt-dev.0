Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C021099B35
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 18:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E69010E161;
	Fri, 20 Mar 2026 18:58:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A0410E161;
 Fri, 20 Mar 2026 18:58:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8394061911601489355=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_Vebox_engine_copy_on?=
 =?utf-8?q?_Intel_Xe_driver_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Mar 2026 18:58:20 -0000
Message-ID: <177403310050.382001.17186801078033123729@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
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

--===============8394061911601489355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable Vebox engine copy on Intel Xe driver (rev9)
URL   : https://patchwork.freedesktop.org/series/161376/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8815_BAT -> XEIGTPW_14827_BAT
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

  Here are the changes found in XEIGTPW_14827_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14827/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8815 -> IGTPW_14827
  * Linux: xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8 -> xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4

  IGTPW_14827: 14827
  IGT_8815: 8815
  xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8: 7535044a2418d22b59be0eb64af0353971f16bd8
  xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4: f202c0d0dece0eeefb750a6a9d80f4b7442529f4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14827/index.html

--===============8394061911601489355==
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
<tr><td><b>Series:</b></td><td>Enable Vebox engine copy on Intel Xe driver (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161376/">https://patchwork.freedesktop.org/series/161376/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14827/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14827/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8815_BAT -&gt; XEIGTPW_14827_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14827_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14827/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8815 -&gt; IGTPW_14827</li>
<li>Linux: xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8 -&gt; xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4</li>
</ul>
<p>IGTPW_14827: 14827<br />
  IGT_8815: 8815<br />
  xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8: 7535044a2418d22b59be0eb64af0353971f16bd8<br />
  xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4: f202c0d0dece0eeefb750a6a9d80f4b7442529f4</p>

</body>
</html>

--===============8394061911601489355==--
