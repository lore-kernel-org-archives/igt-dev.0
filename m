Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D3BD1BDD9
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 18:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B783010E4AB;
	Mon,  4 Nov 2024 18:14:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD18610E4AB;
 Mon,  4 Nov 2024 18:14:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6379425250826280657=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fccs=3A_add_s?=
 =?utf-8?q?uspend_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Nov 2024 18:14:54 -0000
Message-ID: <173074409489.1406741.2838435731227874793@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031150901.325042-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241031150901.325042-1-juhapekka.heikkila@gmail.com>
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

--===============6379425250826280657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_ccs: add suspend tests (rev3)
URL   : https://patchwork.freedesktop.org/series/140731/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8094_BAT -> XEIGTPW_12020_BAT
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

  Here are the changes found in XEIGTPW_12020_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2874]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8094/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12020/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-2:          [INCOMPLETE][3] ([Intel XE#2874] / [Intel XE#2998]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8094/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12020/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998


Build changes
-------------

  * IGT: IGT_8094 -> IGTPW_12020

  IGTPW_12020: 111c48a1bb65b29b7d69771933a37b796f0a4456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12020/index.html

--===============6379425250826280657==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_ccs: add suspend tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140731/">https://patchwork.freedesktop.org/series/140731/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12020/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12020/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8094_BAT -&gt; XEIGTPW_12020_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12020_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8094/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12020/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8094/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12020/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8094 -&gt; IGTPW_12020</li>
</ul>
<p>IGTPW_12020: 111c48a1bb65b29b7d69771933a37b796f0a4456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f</p>

</body>
</html>

--===============6379425250826280657==--
