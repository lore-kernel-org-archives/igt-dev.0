Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283A2CCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 13:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98B610E90A;
	Fri,  3 Oct 2025 13:56:07 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D8D10E909;
 Fri,  3 Oct 2025 13:56:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7700750798258091327=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Ffb/intel=3A_Use_c?=
 =?utf-8?q?orrect_MOCS_for_displayable_surfaces_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Oct 2025 13:56:06 -0000
Message-ID: <175949976620.3102.3365962261744545531@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251003130517.40414-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251003130517.40414-1-tvrtko.ursulin@igalia.com>
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

--===============7700750798258091327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb/intel: Use correct MOCS for displayable surfaces (rev2)
URL   : https://patchwork.freedesktop.org/series/155372/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8573_BAT -> XEIGTPW_13862_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13862_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_module_load@load:
    - {bat-ptl-vm}:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8573/bat-ptl-vm/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13862/bat-ptl-vm/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_8573 -> IGTPW_13862

  IGTPW_13862: 13862
  IGT_8573: 8573
  xe-3863-fc2ab5b39b79dce447c0e0a0cc9b808618559a37: fc2ab5b39b79dce447c0e0a0cc9b808618559a37

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13862/index.html

--===============7700750798258091327==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb/intel: Use correct MOCS for displayable surfaces (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155372/">https://patchwork.freedesktop.org/series/155372/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13862/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13862/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8573_BAT -&gt; XEIGTPW_13862_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13862_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8573/bat-ptl-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13862/bat-ptl-vm/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8573 -&gt; IGTPW_13862</li>
</ul>
<p>IGTPW_13862: 13862<br />
  IGT_8573: 8573<br />
  xe-3863-fc2ab5b39b79dce447c0e0a0cc9b808618559a37: fc2ab5b39b79dce447c0e0a0cc9b808618559a37</p>

</body>
</html>

--===============7700750798258091327==--
