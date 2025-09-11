Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA872CAC58E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 02:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559FD10E9F7;
	Thu, 11 Sep 2025 02:05:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EEA10E9F7;
 Thu, 11 Sep 2025 02:05:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7054289036037035154=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/1=5D_tests/intel/xe=5Feu=5Fstall=3A_Use_the_fastest_sampli?=
 =?utf-8?q?ng_rate_from_the_query_IOCTL_data?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Sep 2025 02:05:29 -0000
Message-ID: <175755632900.323828.8359050470373531479@1538d3639d33>
X-Patchwork-Hint: ignore
References: <6701e36ca7746494aa9358448652be7fc819d51f.1757554496.git.harish.chegondi@intel.com>
In-Reply-To: <6701e36ca7746494aa9358448652be7fc819d51f.1757554496.git.harish.chegondi@intel.com>
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

--===============7054289036037035154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/1] tests/intel/xe_eu_stall: Use the fastest sampling rate from the query IOCTL data
URL   : https://patchwork.freedesktop.org/series/154350/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8532_BAT -> XEIGTPW_13727_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13727_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][1] ([Intel XE#5783]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8532/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13727/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8532 -> IGTPW_13727
  * Linux: xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6 -> xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225

  IGTPW_13727: 13727
  IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6: 85cfc47b2b83d80db129438ad20d86008bb36ff6
  xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225: e925396dbb0b8094e00ca3d47a375538d429b225

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13727/index.html

--===============7054289036037035154==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/1] tests/intel/xe_eu_stall: Use the fastest sampling rate from the query IOCTL data</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154350/">https://patchwork.freedesktop.org/series/154350/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13727/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13727/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8532_BAT -&gt; XEIGTPW_13727_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13727_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8532/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13727/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8532 -&gt; IGTPW_13727</li>
<li>Linux: xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6 -&gt; xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225</li>
</ul>
<p>IGTPW_13727: 13727<br />
  IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6: 85cfc47b2b83d80db129438ad20d86008bb36ff6<br />
  xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225: e925396dbb0b8094e00ca3d47a375538d429b225</p>

</body>
</html>

--===============7054289036037035154==--
