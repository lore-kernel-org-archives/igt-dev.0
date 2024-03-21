Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E281C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3B310F70D;
	Thu, 21 Mar 2024 18:07:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188C210F70D;
 Thu, 21 Mar 2024 18:07:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0564551634273616718=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Update_test_documentation_for_?=
 =?utf-8?q?i915_tests_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Katarzyna Piecielska" <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Mar 2024 18:07:18 -0000
Message-ID: <171104443810.941104.11279937656937623200@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

--===============0564551634273616718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update test documentation for i915 tests (rev5)
URL   : https://patchwork.freedesktop.org/series/130665/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7774_BAT -> XEIGTPW_10874_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10874_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-threads-small:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#1259])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7774/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10874/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259


Build changes
-------------

  * IGT: IGT_7774 -> IGTPW_10874
  * Linux: xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2 -> xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31

  IGTPW_10874: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/index.html
  IGT_7774: 7774
  xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2: 9ae91289c9ed219b53a3fbd25be9f414651ce4f2
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10874/index.html

--===============0564551634273616718==
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
<tr><td><b>Series:</b></td><td>Update test documentation for i915 tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130665/">https://patchwork.freedesktop.org/series/130665/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10874/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10874/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7774_BAT -&gt; XEIGTPW_10874_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10874_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7774/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10874/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7774 -&gt; IGTPW_10874</li>
<li>Linux: xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2 -&gt; xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31</li>
</ul>
<p>IGTPW_10874: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/index.html<br />
  IGT_7774: 7774<br />
  xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2: 9ae91289c9ed219b53a3fbd25be9f414651ce4f2<br />
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31</p>

</body>
</html>

--===============0564551634273616718==--
