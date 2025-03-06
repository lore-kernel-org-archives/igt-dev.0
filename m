Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998B0C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 08:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE1610E13D;
	Thu,  6 Mar 2025 08:21:36 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC69B10E13D;
 Thu,  6 Mar 2025 08:21:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1019828823109488012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Xe=3A_Add_tests_for_PXP_=28?=
 =?utf-8?q?rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Mar 2025 08:21:34 -0000
Message-ID: <174124929476.66397.10178224043350823592@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
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

--===============1019828823109488012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe: Add tests for PXP (rev5)
URL   : https://patchwork.freedesktop.org/series/142450/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8262_BAT -> XEIGTPW_12714_BAT
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

  Here are the changes found in XEIGTPW_12714_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12714/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8262 -> IGTPW_12714

  IGTPW_12714: 12714
  IGT_8262: 8262
  xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12714/index.html

--===============1019828823109488012==
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
<tr><td><b>Series:</b></td><td>Xe: Add tests for PXP (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142450/">https://patchwork.freedesktop.org/series/142450/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12714/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12714/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8262_BAT -&gt; XEIGTPW_12714_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12714_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12714/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8262 -&gt; IGTPW_12714</li>
</ul>
<p>IGTPW_12714: 12714<br />
  IGT_8262: 8262<br />
  xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c</p>

</body>
</html>

--===============1019828823109488012==--
