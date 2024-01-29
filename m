Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CA9C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 07:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7E911259E;
	Mon, 29 Jan 2024 07:29:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB41E112578;
 Mon, 29 Jan 2024 07:29:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4071042550397042406=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fexec=5Fatomic?=
 =?utf-8?q?=3A_Skip_on_unsupported_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Mon, 29 Jan 2024 07:29:45 -0000
Message-ID: <170651338569.789335.5593375492503250084@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129064823.8358-1-nirmoy.das@intel.com>
In-Reply-To: <20240129064823.8358-1-nirmoy.das@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============4071042550397042406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_atomic: Skip on unsupported config
URL   : https://patchwork.freedesktop.org/series/129253/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7694_BAT -> XEIGTPW_10597_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10597_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_atomic@basic-dec-all}:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7694/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10597/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html
    - bat-atsm-2:         [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7694/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10597/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7694 -> IGTPW_10597

  IGTPW_10597: 10597
  IGT_7694: 814cd9883b94be1c61d830b2c1279dc2265476bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10597/index.html

--===============4071042550397042406==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_atomic: Skip on unsupported config</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129253/">https://patchwork.freedesktop.org/series/129253/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10597/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10597/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7694_BAT -&gt; XEIGTPW_10597_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10597_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_atomic@basic-dec-all}:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7694/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10597/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7694/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10597/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7694 -&gt; IGTPW_10597</li>
</ul>
<p>IGTPW_10597: 10597<br />
  IGT_7694: 814cd9883b94be1c61d830b2c1279dc2265476bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a</p>

</body>
</html>

--===============4071042550397042406==--
