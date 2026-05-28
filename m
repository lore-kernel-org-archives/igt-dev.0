Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12EBCD5BC9
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 00:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255F210EB02;
	Thu, 28 May 2026 00:36:55 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BB110EB01;
 Thu, 28 May 2026 00:36:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6384414540568709162=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fpat=3A_dyn?=
 =?utf-8?q?amic_PAT_index_selection_for_pat-index-auto_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 May 2026 00:36:34 -0000
Message-ID: <177992859486.18055.14271427240969097538@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527210052.161768-1-zongyao.bai@intel.com>
In-Reply-To: <20260527210052.161768-1-zongyao.bai@intel.com>
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

--===============6384414540568709162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: dynamic PAT index selection for pat-index-auto (rev2)
URL   : https://patchwork.freedesktop.org/series/166367/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8939_BAT -> XEIGTPW_15266_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15266_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15266_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15266_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@pat-index-auto (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/bat-adlp-7/igt@xe_pat@pat-index-auto.html
    - bat-atsm-2:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/bat-atsm-2/igt@xe_pat@pat-index-auto.html

  
New tests
---------

  New tests have been introduced between XEIGT_8939_BAT and XEIGTPW_15266_BAT:

### New IGT tests (4) ###

  * igt@xe_pat@pat-index-auto:
    - Statuses : 10 pass(s) 2 skip(s)
    - Exec time: [0.0, 25.51] s

  * igt@xe_pat@pat-index-auto@blt:
    - Statuses : 10 pass(s)
    - Exec time: [2.65, 8.96] s

  * igt@xe_pat@pat-index-auto@dw:
    - Statuses : 10 pass(s)
    - Exec time: [0.99, 5.21] s

  * igt@xe_pat@pat-index-auto@render:
    - Statuses : 10 pass(s)
    - Exec time: [3.08, 12.10] s

  



Build changes
-------------

  * IGT: IGT_8939 -> IGTPW_15266
  * Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -> xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6

  IGTPW_15266: 02e26a03723e44ee1ab79b6477b993b35f681082 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8939: 8939
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb
  xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 7570b524ddecbe5db4af0c493a047e21bab6b3d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/index.html

--===============6384414540568709162==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: dynamic PAT index selection for pat-index-auto (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166367/">https://patchwork.freedesktop.org/series/166367/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8939_BAT -&gt; XEIGTPW_15266_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15266_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15266_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15266_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pat@pat-index-auto (NEW):<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/bat-adlp-7/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8939_BAT and XEIGTPW_15266_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_pat@pat-index-auto:</p>
<ul>
<li>Statuses : 10 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 25.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto@blt:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [2.65, 8.96] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto@dw:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.99, 5.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto@render:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [3.08, 12.10] s</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8939 -&gt; IGTPW_15266</li>
<li>Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -&gt; xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6</li>
</ul>
<p>IGTPW_15266: 02e26a03723e44ee1ab79b6477b993b35f681082 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8939: 8939<br />
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb<br />
  xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 7570b524ddecbe5db4af0c493a047e21bab6b3d6</p>

</body>
</html>

--===============6384414540568709162==--
