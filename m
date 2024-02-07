Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CCAC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 23:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171D010E21B;
	Wed,  7 Feb 2024 23:51:32 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA24410E21B;
 Wed,  7 Feb 2024 23:51:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7200522175708993007=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_tests/intel/xe=5Flive=5Fktest=3A_Rename_subtest_to_matc?=
 =?utf-8?q?h_suite?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Feb 2024 23:51:30 -0000
Message-ID: <170734989082.1088348.12208925069675822562@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240207224643.250958-1-lucas.demarchi@intel.com>
In-Reply-To: <20240207224643.250958-1-lucas.demarchi@intel.com>
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

--===============7200522175708993007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/intel/xe_live_ktest: Rename subtest to match suite
URL   : https://patchwork.freedesktop.org/series/129652/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7705_BAT -> XEIGTPW_10649_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10649_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][1] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/bat-dg2-oem2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * {igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][2] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/bat-atsm-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html

  
New tests
---------

  New tests have been introduced between XEIGT_7705_BAT and XEIGTPW_10649_BAT:

### New IGT tests (10) ###

  * igt@xe_live_ktest@xe_bo:
    - Statuses : 3 pass(s)
    - Exec time: [0.99, 3.78] s

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.25] s

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.48] s

  * igt@xe_live_ktest@xe_dma_buf:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 3.46] s

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.66] s

  * igt@xe_live_ktest@xe_migrate:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 3.42] s

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.64] s

  * igt@xe_live_ktest@xe_mocs:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.07, 3.46] s

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.01, 0.69] s

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.00, 0.12] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7705 -> IGTPW_10649
  * Linux: xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222 -> xe-746-eb1e13ab1374d4785d5f2b2584d88e6e05311229

  IGTPW_10649: 10649
  IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222: e33f766ecfa1aee40eec83b3a146eb84a5e23222
  xe-746-eb1e13ab1374d4785d5f2b2584d88e6e05311229: eb1e13ab1374d4785d5f2b2584d88e6e05311229

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/index.html

--===============7200522175708993007==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/intel/xe_live_ktest: Rename subtest to match suite</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129652/">https://patchwork.freedesktop.org/series/129652/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7705_BAT -&gt; XEIGTPW_10649_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10649_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/bat-dg2-oem2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10649/bat-atsm-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7705_BAT and XEIGTPW_10649_BAT:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.99, 3.78] s</li>
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
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 3.46] s</li>
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
<li>Exec time: [0.03, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.07, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.01, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.00, 0.12] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7705 -&gt; IGTPW_10649</li>
<li>Linux: xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222 -&gt; xe-746-eb1e13ab1374d4785d5f2b2584d88e6e05311229</li>
</ul>
<p>IGTPW_10649: 10649<br />
  IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222: e33f766ecfa1aee40eec83b3a146eb84a5e23222<br />
  xe-746-eb1e13ab1374d4785d5f2b2584d88e6e05311229: eb1e13ab1374d4785d5f2b2584d88e6e05311229</p>

</body>
</html>

--===============7200522175708993007==--
