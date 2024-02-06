Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C34C48297
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 11:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38DF10FC28;
	Tue,  6 Feb 2024 11:08:22 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF4810F469;
 Tue,  6 Feb 2024 11:08:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0049468998748441463=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/kunit=3A_Support_writable_?=
 =?utf-8?q?filter*_parameters_of_kunit_module_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Feb 2024 11:08:22 -0000
Message-ID: <170721770211.1055288.15188107011819615537@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
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

--===============0049468998748441463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kunit: Support writable filter* parameters of kunit module (rev4)
URL   : https://patchwork.freedesktop.org/series/129174/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7704_BAT -> XEIGTPW_10636_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10636_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10636_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10636_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@bo:
    - bat-adlp-7:         [PASS][1] -> [TIMEOUT][2] +2 other tests timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-adlp-7/igt@xe_live_ktest@bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-adlp-7/igt@xe_live_ktest@bo.html

  * igt@xe_live_ktest@migrate:
    - bat-pvc-2:          [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-pvc-2/igt@xe_live_ktest@migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-pvc-2/igt@xe_live_ktest@migrate.html
    - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] +2 other tests timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
    - bat-atsm-2:         [PASS][7] -> [TIMEOUT][8] +2 other tests timeout
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-atsm-2/igt@xe_live_ktest@migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-atsm-2/igt@xe_live_ktest@migrate.html

  


Build changes
-------------

  * IGT: IGT_7704 -> IGTPW_10636
  * Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -> xe-736-b1651bcc3e78d3eca42061e8cf6bf1fea6843026

  IGTPW_10636: 10636
  IGT_7704: 7704
  xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f
  xe-736-b1651bcc3e78d3eca42061e8cf6bf1fea6843026: b1651bcc3e78d3eca42061e8cf6bf1fea6843026

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/index.html

--===============0049468998748441463==
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
<tr><td><b>Series:</b></td><td>lib/kunit: Support writable filter* parameters of kunit module (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129174/">https://patchwork.freedesktop.org/series/129174/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7704_BAT -&gt; XEIGTPW_10636_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10636_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10636_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10636_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-adlp-7/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-adlp-7/igt@xe_live_ktest@bo.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-pvc-2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-pvc-2/igt@xe_live_ktest@migrate.html">TIMEOUT</a> +2 other tests timeout</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">TIMEOUT</a> +2 other tests timeout</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-atsm-2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-atsm-2/igt@xe_live_ktest@migrate.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7704 -&gt; IGTPW_10636</li>
<li>Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -&gt; xe-736-b1651bcc3e78d3eca42061e8cf6bf1fea6843026</li>
</ul>
<p>IGTPW_10636: 10636<br />
  IGT_7704: 7704<br />
  xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f<br />
  xe-736-b1651bcc3e78d3eca42061e8cf6bf1fea6843026: b1651bcc3e78d3eca42061e8cf6bf1fea6843026</p>

</body>
</html>

--===============0049468998748441463==--
