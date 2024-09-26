Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37649CDE020
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 16:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD1810EB90;
	Thu, 26 Sep 2024 16:04:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F62E10EB90;
 Thu, 26 Sep 2024 16:04:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5087633841770409570=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_new_test_to_validate_adapt?=
 =?utf-8?q?ive_sharpness_filter_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 16:04:49 -0000
Message-ID: <172736668938.1107989.5865363035113226490@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926144600.1212192-1-swati2.sharma@intel.com>
In-Reply-To: <20240926144600.1212192-1-swati2.sharma@intel.com>
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

--===============5087633841770409570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new test to validate adaptive sharpness filter (rev7)
URL   : https://patchwork.freedesktop.org/series/130218/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8032_BAT -> XEIGTPW_11815_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_11815_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11815_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11815_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-1:          [SKIP][1] ([Intel XE#2236]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_pat@pat-index-xelpg:
    - {bat-bmg-2}:        [SKIP][3] ([Intel XE#2236]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11815_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-lnl-1:          [PASS][5] -> [FAIL][6] ([Intel XE#1649]) +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][7] ([Intel XE#2235]) -> [SKIP][8] ([Intel XE#2235] / [Intel XE#2548])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-adlp-vf:        [SKIP][9] ([Intel XE#2849]) -> [SKIP][10] ([Intel XE#2460] / [Intel XE#2849]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849


Build changes
-------------

  * IGT: IGT_8032 -> IGTPW_11815
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334

  IGTPW_11815: 6ac58ddb39122e17f94066b60bf54e123494168a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: ec87b409d3a9358c9a079186d528fad3f7d64334

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/index.html

--===============5087633841770409570==
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
<tr><td><b>Series:</b></td><td>Add new test to validate adaptive sharpness filter (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130218/">https://patchwork.freedesktop.org/series/130218/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8032_BAT -&gt; XEIGTPW_11815_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_11815_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11815_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11815_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pat@pat-index-xelpg:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_pat@pat-index-xelpg:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11815_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@psr-primary-page-flip@edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +5 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11815/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460">Intel XE#2460</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGTPW_11815</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334</li>
</ul>
<p>IGTPW_11815: 6ac58ddb39122e17f94066b60bf54e123494168a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: ec87b409d3a9358c9a079186d528fad3f7d64334</p>

</body>
</html>

--===============5087633841770409570==--
