Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34A6C4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 23:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C05D10EC92;
	Wed,  7 Feb 2024 23:26:59 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228D410EC92;
 Wed,  7 Feb 2024 23:26:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2901929276291881611=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Flive=5Fktest?=
 =?utf-8?q?=3A_Rename_subtest_to_match_suite_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Feb 2024 23:26:58 -0000
Message-ID: <170734841813.1088348.16511002918832856397@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240207224343.250877-1-lucas.demarchi@intel.com>
In-Reply-To: <20240207224343.250877-1-lucas.demarchi@intel.com>
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

--===============2901929276291881611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_live_ktest: Rename subtest to match suite (rev2)
URL   : https://patchwork.freedesktop.org/series/129642/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7705_BAT -> XEIGTPW_10648_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_7705_BAT and XEIGTPW_10648_BAT:

### New IGT tests (7) ###

  * igt@xe_live_ktest@xe_bo:
    - Statuses : 3 pass(s)
    - Exec time: [1.01, 3.76] s

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.63] s

  * igt@xe_live_ktest@xe_dma_buf:
    - Statuses : 3 pass(s)
    - Exec time: [0.04, 3.32] s

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.66] s

  * igt@xe_live_ktest@xe_migrate:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 3.31] s

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.64] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7705 -> IGTPW_10648
  * Linux: xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222 -> xe-746-eb1e13ab1374d4785d5f2b2584d88e6e05311229

  IGTPW_10648: 10648
  IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222: e33f766ecfa1aee40eec83b3a146eb84a5e23222
  xe-746-eb1e13ab1374d4785d5f2b2584d88e6e05311229: eb1e13ab1374d4785d5f2b2584d88e6e05311229

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10648/index.html

--===============2901929276291881611==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_live_ktest: Rename subtest to match suite (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129642/">https://patchwork.freedesktop.org/series/129642/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10648/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10648/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7705_BAT -&gt; XEIGTPW_10648_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7705_BAT and XEIGTPW_10648_BAT:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.01, 3.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.04, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7705 -&gt; IGTPW_10648</li>
<li>Linux: xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222 -&gt; xe-746-eb1e13ab1374d4785d5f2b2584d88e6e05311229</li>
</ul>
<p>IGTPW_10648: 10648<br />
  IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222: e33f766ecfa1aee40eec83b3a146eb84a5e23222<br />
  xe-746-eb1e13ab1374d4785d5f2b2584d88e6e05311229: eb1e13ab1374d4785d5f2b2584d88e6e05311229</p>

</body>
</html>

--===============2901929276291881611==--
