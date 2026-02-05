Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E45ECD98A
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 17:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAAE10E93C;
	Thu,  5 Feb 2026 17:25:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F37F10E93C;
 Thu,  5 Feb 2026 17:25:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4763334689960278482=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lsgpu=3A_Report_upstream_po?=
 =?utf-8?q?rt_link_bandwidth_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Feb 2026 17:25:24 -0000
Message-ID: <177031232450.228376.11043437242812544785@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205145427.1338534-8-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20260205145427.1338534-8-janusz.krzysztofik@linux.intel.com>
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

--===============4763334689960278482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lsgpu: Report upstream port link bandwidth (rev8)
URL   : https://patchwork.freedesktop.org/series/160415/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8739_BAT -> XEIGTPW_14507_BAT
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

  Here are the changes found in XEIGTPW_14507_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8739/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14507/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8739 -> IGTPW_14507
  * Linux: xe-4506-05230cfcdb1abc225c8e085cd4de470c4b97232f -> xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f

  IGTPW_14507: 14507
  IGT_8739: 8739
  xe-4506-05230cfcdb1abc225c8e085cd4de470c4b97232f: 05230cfcdb1abc225c8e085cd4de470c4b97232f
  xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f: 7fc41c69853312d5cb58afe7efd7943b6dfb092f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14507/index.html

--===============4763334689960278482==
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
<tr><td><b>Series:</b></td><td>lsgpu: Report upstream port link bandwidth (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160415/">https://patchwork.freedesktop.org/series/160415/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14507/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14507/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8739_BAT -&gt; XEIGTPW_14507_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14507_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8739/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14507/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8739 -&gt; IGTPW_14507</li>
<li>Linux: xe-4506-05230cfcdb1abc225c8e085cd4de470c4b97232f -&gt; xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f</li>
</ul>
<p>IGTPW_14507: 14507<br />
  IGT_8739: 8739<br />
  xe-4506-05230cfcdb1abc225c8e085cd4de470c4b97232f: 05230cfcdb1abc225c8e085cd4de470c4b97232f<br />
  xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f: 7fc41c69853312d5cb58afe7efd7943b6dfb092f</p>

</body>
</html>

--===============4763334689960278482==--
