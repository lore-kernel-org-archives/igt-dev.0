Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76CFC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 12:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA5B10E1A8;
	Wed, 24 Jan 2024 12:43:36 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4411810E1A8;
 Wed, 24 Jan 2024 12:43:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3351331129005328747=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_d3_mmap_test_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Wed, 24 Jan 2024 12:43:35 -0000
Message-ID: <170610021527.695948.2534386892260969938@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240124115019.2067089-1-anshuman.gupta@intel.com>
In-Reply-To: <20240124115019.2067089-1-anshuman.gupta@intel.com>
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

--===============3351331129005328747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add d3 mmap test (rev5)
URL   : https://patchwork.freedesktop.org/series/124115/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7690_BAT -> XEIGTPW_10582_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_10582_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pm@d3-mmap-system} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-adlp-7/igt@xe_pm@d3-mmap-system.html
    - bat-pvc-2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-pvc-2/igt@xe_pm@d3-mmap-system.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-dg2-oem2/igt@xe_pm@d3-mmap-system.html
    - bat-atsm-2:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-atsm-2/igt@xe_pm@d3-mmap-system.html

  * {igt@xe_pm@d3-mmap-vram} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-adlp-7/igt@xe_pm@d3-mmap-vram.html

  
New tests
---------

  New tests have been introduced between XEIGT_7690_BAT and XEIGTPW_10582_BAT:

### New IGT tests (2) ###

  * igt@xe_pm@d3-mmap-system:
    - Statuses : 4 fail(s)
    - Exec time: [0.14, 10.58] s

  * igt@xe_pm@d3-mmap-vram:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.32, 3.92] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7690 -> IGTPW_10582
  * Linux: xe-669-741c439503ee0986a7b7c5b590cbd9813b8841f6 -> xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb

  IGTPW_10582: 10582
  IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-669-741c439503ee0986a7b7c5b590cbd9813b8841f6: 741c439503ee0986a7b7c5b590cbd9813b8841f6
  xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb: 0496fe20d8ed5e73ed186d293ef67e7bae4658eb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/index.html

--===============3351331129005328747==
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
<tr><td><b>Series:</b></td><td>Add d3 mmap test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124115/">https://patchwork.freedesktop.org/series/124115/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7690_BAT -&gt; XEIGTPW_10582_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10582_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_pm@d3-mmap-system} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-adlp-7/igt@xe_pm@d3-mmap-system.html">FAIL</a></li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-pvc-2/igt@xe_pm@d3-mmap-system.html">FAIL</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-dg2-oem2/igt@xe_pm@d3-mmap-system.html">FAIL</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-atsm-2/igt@xe_pm@d3-mmap-system.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@d3-mmap-vram} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10582/bat-adlp-7/igt@xe_pm@d3-mmap-vram.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7690_BAT and XEIGTPW_10582_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.14, 10.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.32, 3.92] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7690 -&gt; IGTPW_10582</li>
<li>Linux: xe-669-741c439503ee0986a7b7c5b590cbd9813b8841f6 -&gt; xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb</li>
</ul>
<p>IGTPW_10582: 10582<br />
  IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-669-741c439503ee0986a7b7c5b590cbd9813b8841f6: 741c439503ee0986a7b7c5b590cbd9813b8841f6<br />
  xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb: 0496fe20d8ed5e73ed186d293ef67e7bae4658eb</p>

</body>
</html>

--===============3351331129005328747==--
