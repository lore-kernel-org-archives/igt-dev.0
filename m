Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADCDCCFA12
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 01:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B971210E0C4;
	Thu, 26 Sep 2024 01:22:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1AF10E0C4;
 Thu, 26 Sep 2024 01:22:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6662888904222351391=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel/xe=5Fpm=5Fresidenc?=
 =?utf-8?q?y=3A_Add_an_assertion_on_MI=5FSTORE_execution_time_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 01:22:53 -0000
Message-ID: <172731377304.1103596.4200422612749572791@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924080357.1961472-1-karthik.poosa@intel.com>
In-Reply-To: <20240924080357.1961472-1-karthik.poosa@intel.com>
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

--===============6662888904222351391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm_residency: Add an assertion on MI_STORE execution time (rev2)
URL   : https://patchwork.freedesktop.org/series/139006/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8032_BAT -> XEIGTPW_11791_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11791_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11791_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11791_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11791/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11791_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#1649]) +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11791/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649


Build changes
-------------

  * IGT: IGT_8032 -> IGTPW_11791
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b

  IGTPW_11791: 13bf9bf05e7cbc0b1b939235772a2fc40b470d90 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11791/index.html

--===============6662888904222351391==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm_residency: Add an assertion on MI_STORE execution time (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139006/">https://patchwork.freedesktop.org/series/139006/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11791/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11791/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8032_BAT -&gt; XEIGTPW_11791_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11791_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11791_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11791_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11791/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11791_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@psr-primary-page-flip@edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11791/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGTPW_11791</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b</li>
</ul>
<p>IGTPW_11791: 13bf9bf05e7cbc0b1b939235772a2fc40b470d90 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b</p>

</body>
</html>

--===============6662888904222351391==--
