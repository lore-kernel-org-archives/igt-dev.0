Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332B0C982C9
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 18:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6DE10ED0B;
	Wed, 16 Sep 2026 18:02:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A72510ECDA;
 Wed, 16 Sep 2026 18:02:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8570347149980819293=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Bump_debian_version_to_book?=
 =?utf-8?q?worm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Sep 2026 18:02:09 -0000
Message-ID: <178958172942.173806.8204212773287249024@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
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

--===============8570347149980819293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Bump debian version to bookworm (rev2)
URL   : https://patchwork.freedesktop.org/series/174271/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9099_BAT -> XEIGTPW_15852_BAT
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

  Here are the changes found in XEIGTPW_15852_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-wcl-2:          NOTRUN -> [FAIL][1] ([Intel XE#9062])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15852/bat-wcl-2/igt@runner@aborted.html

  
  [Intel XE#9062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9062


Build changes
-------------

  * IGT: IGT_9099 -> IGTPW_15852
  * Linux: xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 -> xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5

  IGTPW_15852: a685485e93f286244352c3bedf02200dc695d3b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9099: 9099
  xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8
  xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5: bb38af66c2f21340a7c081afbb7ace249357fbb5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15852/index.html

--===============8570347149980819293==
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
<tr><td><b>Series:</b></td><td>Bump debian version to bookworm (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174271/">https://patchwork.freedesktop.org/series/174271/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15852/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15852/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9099_BAT -&gt; XEIGTPW_15852_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15852_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15852/bat-wcl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9062">Intel XE#9062</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9099 -&gt; IGTPW_15852</li>
<li>Linux: xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 -&gt; xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5</li>
</ul>
<p>IGTPW_15852: a685485e93f286244352c3bedf02200dc695d3b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9099: 9099<br />
  xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8<br />
  xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5: bb38af66c2f21340a7c081afbb7ace249357fbb5</p>

</body>
</html>

--===============8570347149980819293==--
