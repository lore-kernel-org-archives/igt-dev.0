Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2AECD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 06:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE9410E198;
	Tue, 12 May 2026 06:41:53 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483F910E198;
 Tue, 12 May 2026 06:41:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0967903191764673520=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpat=3A_dyn?=
 =?utf-8?q?amic_PAT_index_selection_for_pat-index-auto?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 06:41:36 -0000
Message-ID: <177856809628.60084.17700088344253604950@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
In-Reply-To: <20260511233622.2074382-1-zongyao.bai@intel.com>
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

--===============0967903191764673520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: dynamic PAT index selection for pat-index-auto
URL   : https://patchwork.freedesktop.org/series/166367/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8903_BAT -> XEIGTPW_15155_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15155_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pat@pat-index-auto} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/bat-adlp-7/igt@xe_pat@pat-index-auto.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/bat-adlp-vm/igt@xe_pat@pat-index-auto.html
    - bat-atsm-2:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/bat-atsm-2/igt@xe_pat@pat-index-auto.html

  
New tests
---------

  New tests have been introduced between XEIGT_8903_BAT and XEIGTPW_15155_BAT:

### New IGT tests (4) ###

  * igt@xe_pat@pat-index-auto:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.56] s

  * igt@xe_pat@pat-index-auto@blt:
    - Statuses : 9 pass(s)
    - Exec time: [1.49, 4.86] s

  * igt@xe_pat@pat-index-auto@dw:
    - Statuses : 9 pass(s)
    - Exec time: [0.71, 1.98] s

  * igt@xe_pat@pat-index-auto@render:
    - Statuses : 9 pass(s)
    - Exec time: [1.91, 5.79] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_8903 -> IGTPW_15155
  * Linux: xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565 -> xe-5044-767b83aa80c6d7eaa1204a866b287b56a1a33122

  IGTPW_15155: 6c2d3b992cff4ab9b8917f254ae543b72344fba5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565: f8ee23694aa6be213355905a78f79bb1b0861565
  xe-5044-767b83aa80c6d7eaa1204a866b287b56a1a33122: 767b83aa80c6d7eaa1204a866b287b56a1a33122

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/index.html

--===============0967903191764673520==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: dynamic PAT index selection for pat-index-auto</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166367/">https://patchwork.freedesktop.org/series/166367/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8903_BAT -&gt; XEIGTPW_15155_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15155_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_pat@pat-index-auto} (NEW):<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/bat-adlp-7/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/bat-adlp-vm/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8903_BAT and XEIGTPW_15155_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_pat@pat-index-auto:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto@blt:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.49, 4.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto@dw:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.71, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto@render:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.91, 5.79] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8903 -&gt; IGTPW_15155</li>
<li>Linux: xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565 -&gt; xe-5044-767b83aa80c6d7eaa1204a866b287b56a1a33122</li>
</ul>
<p>IGTPW_15155: 6c2d3b992cff4ab9b8917f254ae543b72344fba5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565: f8ee23694aa6be213355905a78f79bb1b0861565<br />
  xe-5044-767b83aa80c6d7eaa1204a866b287b56a1a33122: 767b83aa80c6d7eaa1204a866b287b56a1a33122</p>

</body>
</html>

--===============0967903191764673520==--
