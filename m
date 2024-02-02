Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C330C4828D
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 01:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F0310EE7E;
	Fri,  2 Feb 2024 01:38:54 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935E010EE6C;
 Fri,  2 Feb 2024 01:38:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7615382376644105702=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_live_test_renames?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 02 Feb 2024 01:38:53 -0000
Message-ID: <170683793360.935547.4957279217615616506@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
In-Reply-To: <20240202004529.552806-1-lucas.demarchi@intel.com>
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

--===============7615382376644105702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: live test renames
URL   : https://patchwork.freedesktop.org/series/129449/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7701_BAT -> XEIGTPW_10631_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_10631_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_live_ktest@xe_dmabuf} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-pvc-2/igt@xe_live_ktest@xe_dmabuf.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-dg2-oem2/igt@xe_live_ktest@xe_dmabuf.html
    - bat-atsm-2:         NOTRUN -> [SKIP][3] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-atsm-2/igt@xe_live_ktest@xe_dmabuf.html

  * {igt@xe_live_ktest@xe_migrate} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  
New tests
---------

  New tests have been introduced between XEIGT_7701_BAT and XEIGTPW_10631_BAT:

### New IGT tests (3) ###

  * igt@xe_live_ktest@xe_bo:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_live_ktest@xe_dmabuf:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_live_ktest@xe_migrate:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10631_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-atsm-2:         [SKIP][5] ([Intel XE#1130]) -> [SKIP][6] ([Intel XE#288])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * IGT: IGT_7701 -> IGTPW_10631
  * Linux: xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde -> xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb

  IGTPW_10631: 10631
  IGT_7701: 7701
  xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde: 3e58a4940c44430f20cad20ead5e1b77ed209cde
  xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb: 18a9fefd9e05291cbe792d358bbdc04dc6d21adb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/index.html

--===============7615382376644105702==
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
<tr><td><b>Series:</b></td><td>live test renames</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129449/">https://patchwork.freedesktop.org/series/129449/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7701_BAT -&gt; XEIGTPW_10631_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10631_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_live_ktest@xe_dmabuf} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-pvc-2/igt@xe_live_ktest@xe_dmabuf.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-dg2-oem2/igt@xe_live_ktest@xe_dmabuf.html">SKIP</a> +2 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-atsm-2/igt@xe_live_ktest@xe_dmabuf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_migrate} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7701_BAT and XEIGTPW_10631_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dmabuf:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10631_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10631/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7701 -&gt; IGTPW_10631</li>
<li>Linux: xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde -&gt; xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb</li>
</ul>
<p>IGTPW_10631: 10631<br />
  IGT_7701: 7701<br />
  xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde: 3e58a4940c44430f20cad20ead5e1b77ed209cde<br />
  xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb: 18a9fefd9e05291cbe792d358bbdc04dc6d21adb</p>

</body>
</html>

--===============7615382376644105702==--
