Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50EEC02185
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 08:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588110E214;
	Fri, 17 Jan 2025 08:12:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1700810E214;
 Fri, 17 Jan 2025 08:12:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3094332579513899332=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Foa=3A_Exte?=
 =?utf-8?q?nd_non-zero-reason_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jan 2025 08:12:44 -0000
Message-ID: <173710156408.588873.9606655810189257823@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117005424.3038122-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250117005424.3038122-1-ashutosh.dixit@intel.com>
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

--===============3094332579513899332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Extend non-zero-reason test
URL   : https://patchwork.freedesktop.org/series/143640/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8195_BAT -> XEIGTPW_12453_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12453_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#4078]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12453/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078


Build changes
-------------

  * IGT: IGT_8195 -> IGTPW_12453
  * Linux: xe-2497-2334d1179d652eb4032fcb0d8e6f53cbc6a1011c -> xe-2503-d8c883b9b7702b39eb913a72fd7158ad9a6ea11f

  IGTPW_12453: 8f67778e3bb90960a69048a954529e876fa23f64 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8195: 8195
  xe-2497-2334d1179d652eb4032fcb0d8e6f53cbc6a1011c: 2334d1179d652eb4032fcb0d8e6f53cbc6a1011c
  xe-2503-d8c883b9b7702b39eb913a72fd7158ad9a6ea11f: d8c883b9b7702b39eb913a72fd7158ad9a6ea11f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12453/index.html

--===============3094332579513899332==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Extend non-zero-reason test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143640/">https://patchwork.freedesktop.org/series/143640/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12453/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12453/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8195_BAT -&gt; XEIGTPW_12453_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12453_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12453/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8195 -&gt; IGTPW_12453</li>
<li>Linux: xe-2497-2334d1179d652eb4032fcb0d8e6f53cbc6a1011c -&gt; xe-2503-d8c883b9b7702b39eb913a72fd7158ad9a6ea11f</li>
</ul>
<p>IGTPW_12453: 8f67778e3bb90960a69048a954529e876fa23f64 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8195: 8195<br />
  xe-2497-2334d1179d652eb4032fcb0d8e6f53cbc6a1011c: 2334d1179d652eb4032fcb0d8e6f53cbc6a1011c<br />
  xe-2503-d8c883b9b7702b39eb913a72fd7158ad9a6ea11f: d8c883b9b7702b39eb913a72fd7158ad9a6ea11f</p>

</body>
</html>

--===============3094332579513899332==--
