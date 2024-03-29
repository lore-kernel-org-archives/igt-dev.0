Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F286C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 22:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D3510E3D6;
	Fri, 29 Mar 2024 22:41:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DF510E3D6;
 Fri, 29 Mar 2024 22:41:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3173874553420690294=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/xe=5Fexec=5Fthreads=3A_R?=
 =?utf-8?q?educe_copy_=26_paste?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Mar 2024 22:41:49 -0000
Message-ID: <171175210968.1081852.11660441728696860285@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240329211449.924460-1-lucas.demarchi@intel.com>
In-Reply-To: <20240329211449.924460-1-lucas.demarchi@intel.com>
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

--===============3173874553420690294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_threads: Reduce copy & paste
URL   : https://patchwork.freedesktop.org/series/131831/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7791_BAT -> XEIGTPW_10954_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10954_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_gt_freq@freq_basic_api:
    - {bat-lnl-1}:        [FAIL][1] ([Intel XE#1415]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7791/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10954/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1415


Build changes
-------------

  * IGT: IGT_7791 -> IGTPW_10954
  * Linux: xe-1016-96000ec64d7e08436f2cafc89711c907576710f4 -> xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036

  IGTPW_10954: 10954
  IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1016-96000ec64d7e08436f2cafc89711c907576710f4: 96000ec64d7e08436f2cafc89711c907576710f4
  xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036: b334e21cd00347d48ee5e8e8ab0a69c91f97b036

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10954/index.html

--===============3173874553420690294==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_threads: Reduce copy &amp; paste</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131831/">https://patchwork.freedesktop.org/series/131831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10954/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10954/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7791_BAT -&gt; XEIGTPW_10954_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10954_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7791/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1415">Intel XE#1415</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10954/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7791 -&gt; IGTPW_10954</li>
<li>Linux: xe-1016-96000ec64d7e08436f2cafc89711c907576710f4 -&gt; xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036</li>
</ul>
<p>IGTPW_10954: 10954<br />
  IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1016-96000ec64d7e08436f2cafc89711c907576710f4: 96000ec64d7e08436f2cafc89711c907576710f4<br />
  xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036: b334e21cd00347d48ee5e8e8ab0a69c91f97b036</p>

</body>
</html>

--===============3173874553420690294==--
