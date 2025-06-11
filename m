Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D0DC71136
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 19:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AA310E707;
	Wed, 11 Jun 2025 19:01:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C974710E706;
 Wed, 11 Jun 2025 19:01:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2473277710181560307=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Fix_?=
 =?utf-8?q?skip_condition_to_account_for_padded_BO_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jun 2025 19:01:28 -0000
Message-ID: <174966848881.68882.11524777832443314335@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611100158.15197-1-lukasz.laguna@intel.com>
In-Reply-To: <20250611100158.15197-1-lukasz.laguna@intel.com>
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

--===============2473277710181560307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Fix skip condition to account for padded BO size
URL   : https://patchwork.freedesktop.org/series/150086/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8404_BAT -> XEIGTPW_13272_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13272_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - bat-bmg-2:          [FAIL][1] ([Intel XE#5080]) -> [FAIL][2] ([Intel XE#5234])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8404/bat-bmg-2/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13272/bat-bmg-2/igt@runner@aborted.html
    - bat-bmg-1:          [FAIL][3] ([Intel XE#5080]) -> [FAIL][4] ([Intel XE#5234])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8404/bat-bmg-1/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13272/bat-bmg-1/igt@runner@aborted.html

  
  [Intel XE#5080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080
  [Intel XE#5234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5234


Build changes
-------------

  * IGT: IGT_8404 -> IGTPW_13272
  * Linux: xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60 -> xe-3230-a08a2132ed7ae776652df710008606631989bc60

  IGTPW_13272: e7fde96cf281775701d23c2ff70b06a47d25f9ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60: 7bc153635620254b73cfe8714ce42768b2bf6d60
  xe-3230-a08a2132ed7ae776652df710008606631989bc60: a08a2132ed7ae776652df710008606631989bc60

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13272/index.html

--===============2473277710181560307==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Fix skip condition to account for padded BO size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150086/">https://patchwork.freedesktop.org/series/150086/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13272/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13272/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8404_BAT -&gt; XEIGTPW_13272_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13272_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8404/bat-bmg-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080">Intel XE#5080</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13272/bat-bmg-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5234">Intel XE#5234</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8404/bat-bmg-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080">Intel XE#5080</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13272/bat-bmg-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5234">Intel XE#5234</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8404 -&gt; IGTPW_13272</li>
<li>Linux: xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60 -&gt; xe-3230-a08a2132ed7ae776652df710008606631989bc60</li>
</ul>
<p>IGTPW_13272: e7fde96cf281775701d23c2ff70b06a47d25f9ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60: 7bc153635620254b73cfe8714ce42768b2bf6d60<br />
  xe-3230-a08a2132ed7ae776652df710008606631989bc60: a08a2132ed7ae776652df710008606631989bc60</p>

</body>
</html>

--===============2473277710181560307==--
