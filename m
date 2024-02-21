Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB423C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 04:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB1A10E424;
	Wed, 21 Feb 2024 04:32:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792E510E424;
 Wed, 21 Feb 2024 04:32:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3779174637369135082=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fccs=3A_Convert_?=
 =?utf-8?q?subtests_to_dynamic_subtests_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Feb 2024 04:32:57 -0000
Message-ID: <170848997749.132386.14301013838535441963@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221030542.17634-1-karthik.b.s@intel.com>
In-Reply-To: <20240221030542.17634-1-karthik.b.s@intel.com>
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

--===============3779174637369135082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_ccs: Convert subtests to dynamic subtests (rev4)
URL   : https://patchwork.freedesktop.org/series/129982/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14305 -> IGTPW_10706
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10706/index.html

Participating hosts (40 -> 36)
------------------------------

  Missing    (4): bat-mtlp-8 bat-kbl-2 fi-apl-guc fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10706:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_fence@basic-await@ccs0:
    - {bat-arls-2}:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14305/bat-arls-2/igt@gem_exec_fence@basic-await@ccs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10706/bat-arls-2/igt@gem_exec_fence@basic-await@ccs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7718 -> IGTPW_10706

  CI-20190529: 20190529
  CI_DRM_14305: 4b8a238dee9c18201f3652695414587cd2ef6d8f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10706: 10706
  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 95 lines
--- 1520 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10706/index.html

--===============3779174637369135082==
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
<tr><td><b>Series:</b></td><td>tests/kms_ccs: Convert subtests to dynamic subtests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129982/">https://patchwork.freedesktop.org/series/129982/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10706/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10706/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14305 -&gt; IGTPW_10706</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10706/index.html</p>
<h2>Participating hosts (40 -&gt; 36)</h2>
<p>Missing    (4): bat-mtlp-8 bat-kbl-2 fi-apl-guc fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10706:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_fence@basic-await@ccs0:<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14305/bat-arls-2/igt@gem_exec_fence@basic-await@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10706/bat-arls-2/igt@gem_exec_fence@basic-await@ccs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7718 -&gt; IGTPW_10706</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14305: 4b8a238dee9c18201f3652695414587cd2ef6d8f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10706: 10706<br />
  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 95 lines<br />
--- 1520 lines</p>

</body>
</html>

--===============3779174637369135082==--
