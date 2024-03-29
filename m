Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33D5CD1283
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 22:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9699710E32D;
	Fri, 29 Mar 2024 22:07:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D910E32D;
 Fri, 29 Mar 2024 22:07:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6830744376344374041=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/xe=5Fspin=3A_Fix_doc_white?=
 =?utf-8?q?spaces_and_typo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Mar 2024 22:07:50 -0000
Message-ID: <171175007060.1081852.3617278045895049568@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240329211243.924363-1-lucas.demarchi@intel.com>
In-Reply-To: <20240329211243.924363-1-lucas.demarchi@intel.com>
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

--===============6830744376344374041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe_spin: Fix doc whitespaces and typo
URL   : https://patchwork.freedesktop.org/series/131830/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7791_BAT -> XEIGTPW_10953_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10953_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_force_connector_basic@force-connector-state:
    - {bat-lnl-1}:        NOTRUN -> [SKIP][1] +6 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10953/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10953_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_7791 -> IGTPW_10953
  * Linux: xe-1016-96000ec64d7e08436f2cafc89711c907576710f4 -> xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036

  IGTPW_10953: 10953
  IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1016-96000ec64d7e08436f2cafc89711c907576710f4: 96000ec64d7e08436f2cafc89711c907576710f4
  xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036: b334e21cd00347d48ee5e8e8ab0a69c91f97b036

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10953/index.html

--===============6830744376344374041==
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
<tr><td><b>Series:</b></td><td>lib/xe_spin: Fix doc whitespaces and typo</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131830/">https://patchwork.freedesktop.org/series/131830/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10953/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10953/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7791_BAT -&gt; XEIGTPW_10953_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10953_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10953/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10953_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7791 -&gt; IGTPW_10953</li>
<li>Linux: xe-1016-96000ec64d7e08436f2cafc89711c907576710f4 -&gt; xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036</li>
</ul>
<p>IGTPW_10953: 10953<br />
  IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1016-96000ec64d7e08436f2cafc89711c907576710f4: 96000ec64d7e08436f2cafc89711c907576710f4<br />
  xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036: b334e21cd00347d48ee5e8e8ab0a69c91f97b036</p>

</body>
</html>

--===============6830744376344374041==--
