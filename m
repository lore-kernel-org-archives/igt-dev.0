Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD5CA9EC5
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 00:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA0910E6C4;
	Tue, 13 Oct 2026 00:34:11 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FF510E6C4;
 Tue, 13 Oct 2026 00:33:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4845378786874912303=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/5=5D_lib/igt=5Ffb=3A_add_igt=5Fformat=5Fget=5Fsubsampling?=
 =?utf-8?q?=28=29_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Oct 2026 00:33:21 -0000
Message-ID: <179185160160.14539.2052444486988975763@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
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

--===============4845378786874912303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/5] lib/igt_fb: add igt_format_get_subsampling() function
URL   : https://patchwork.freedesktop.org/series/175949/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9140_BAT -> XEIGTPW_15972_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15972_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9140 -> IGTPW_15972
  * Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -> xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58

  IGTPW_15972: 80a8a47f8c2349c00d8b7deb47e7df1e53fcb035 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1
  xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58: dcbee9cfcd4097656a88dbaf196fbc5403764a58

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/index.html

--===============4845378786874912303==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/5] lib/igt_fb: add igt_format_get_subsampling() function</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175949/">https://patchwork.freedesktop.org/series/175949/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9140_BAT -&gt; XEIGTPW_15972_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15972_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9140/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15972/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9140 -&gt; IGTPW_15972</li>
<li>Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -&gt; xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58</li>
</ul>
<p>IGTPW_15972: 80a8a47f8c2349c00d8b7deb47e7df1e53fcb035 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1<br />
  xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58: dcbee9cfcd4097656a88dbaf196fbc5403764a58</p>

</body>
</html>

--===============4845378786874912303==--
