Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD8DCDD1B8
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 14:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E549910ECBC;
	Fri, 27 Sep 2024 14:51:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6D010ECBC;
 Fri, 27 Sep 2024 14:51:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3269375525692305426=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fsysfs=5Ftimes?=
 =?utf-8?q?lice=5Fduration=3A_Add_test_to_validate_timeslice_duration_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Sep 2024 14:51:24 -0000
Message-ID: <172744868410.1111184.9595435774302581540@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927064041.1813376-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240927064041.1813376-1-sai.gowtham.ch@intel.com>
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

--===============3269375525692305426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_timeslice_duration: Add test to validate timeslice duration (rev2)
URL   : https://patchwork.freedesktop.org/series/139187/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8035_BAT -> XEIGTPW_11822_BAT
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

  Here are the changes found in XEIGTPW_11822_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8035/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11822/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-1:          [INCOMPLETE][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8035/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11822/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8035 -> IGTPW_11822
  * Linux: xe-1983-6bd25f52157328ac4b7b09a3946281957afe3bfd -> xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b

  IGTPW_11822: f957fd9bb9e81fae158e7b84b03afc0c729d6d13 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1983-6bd25f52157328ac4b7b09a3946281957afe3bfd: 6bd25f52157328ac4b7b09a3946281957afe3bfd
  xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11822/index.html

--===============3269375525692305426==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_timeslice_duration: Add test to validate timeslice duration (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139187/">https://patchwork.freedesktop.org/series/139187/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11822/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11822/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8035_BAT -&gt; XEIGTPW_11822_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11822_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8035/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11822/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8035/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11822/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8035 -&gt; IGTPW_11822</li>
<li>Linux: xe-1983-6bd25f52157328ac4b7b09a3946281957afe3bfd -&gt; xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b</li>
</ul>
<p>IGTPW_11822: f957fd9bb9e81fae158e7b84b03afc0c729d6d13 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1983-6bd25f52157328ac4b7b09a3946281957afe3bfd: 6bd25f52157328ac4b7b09a3946281957afe3bfd<br />
  xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b</p>

</body>
</html>

--===============3269375525692305426==--
