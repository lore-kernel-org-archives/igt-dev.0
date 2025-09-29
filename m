Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329A0CAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 18:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C562010E0B8;
	Mon, 29 Sep 2025 18:44:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEB810E0B8;
 Mon, 29 Sep 2025 18:44:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7524234943127133670=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsurvivabil?=
 =?utf-8?q?ity=3A_Add_xe=5Fsurvivability_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Sep 2025 18:44:06 -0000
Message-ID: <175917144683.376532.7064613236753938227@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250929175230.753899-5-sk.anirban@intel.com>
In-Reply-To: <20250929175230.753899-5-sk.anirban@intel.com>
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

--===============7524234943127133670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_survivability: Add xe_survivability test (rev3)
URL   : https://patchwork.freedesktop.org/series/154342/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8556_BAT -> XEIGTPW_13840_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13840_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_survivability@i2c-functionality} (NEW):
    - bat-bmg-2:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-bmg-2/igt@xe_survivability@i2c-functionality.html
    - bat-bmg-1:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-bmg-1/igt@xe_survivability@i2c-functionality.html
    - bat-lnl-2:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-lnl-2/igt@xe_survivability@i2c-functionality.html
    - {bat-ptl-2}:        NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-ptl-2/igt@xe_survivability@i2c-functionality.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html

  * {igt@xe_survivability@runtime-survivability} (NEW):
    - bat-bmg-2:          NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-bmg-2/igt@xe_survivability@runtime-survivability.html
    - bat-adlp-7:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-adlp-7/igt@xe_survivability@runtime-survivability.html
    - bat-atsm-2:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-atsm-2/igt@xe_survivability@runtime-survivability.html
    - {bat-ptl-1}:        NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-ptl-1/igt@xe_survivability@runtime-survivability.html
    - {bat-ptl-vm}:       NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html
    - bat-lnl-1:          NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-lnl-1/igt@xe_survivability@runtime-survivability.html

  
New tests
---------

  New tests have been introduced between XEIGT_8556_BAT and XEIGTPW_13840_BAT:

### New IGT tests (2) ###

  * igt@xe_survivability@i2c-functionality:
    - Statuses : 2 fail(s) 9 skip(s)
    - Exec time: [0.0, 0.76] s

  * igt@xe_survivability@runtime-survivability:
    - Statuses : 1 dmesg-warn(s) 1 pass(s) 9 skip(s)
    - Exec time: [0.0, 2.18] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13840_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [FAIL][13] ([Intel XE#5507]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8556/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507


Build changes
-------------

  * IGT: IGT_8556 -> IGTPW_13840
  * Linux: xe-3836-e2a896e95ea5f65aa137dcf117bfd0d61176c8ce -> xe-3840-27e0bd03f98552006988ca6a2c20f06866d9d10b

  IGTPW_13840: 13840
  IGT_8556: e5eda2a187432a54f5e6fada18e4187e5175a10c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3836-e2a896e95ea5f65aa137dcf117bfd0d61176c8ce: e2a896e95ea5f65aa137dcf117bfd0d61176c8ce
  xe-3840-27e0bd03f98552006988ca6a2c20f06866d9d10b: 27e0bd03f98552006988ca6a2c20f06866d9d10b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/index.html

--===============7524234943127133670==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_survivability: Add xe_survivability test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154342/">https://patchwork.freedesktop.org/series/154342/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8556_BAT -&gt; XEIGTPW_13840_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13840_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_survivability@i2c-functionality} (NEW):</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-bmg-2/igt@xe_survivability@i2c-functionality.html">FAIL</a></li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-bmg-1/igt@xe_survivability@i2c-functionality.html">FAIL</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-lnl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>{bat-ptl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-ptl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_survivability@runtime-survivability} (NEW):</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-bmg-2/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-adlp-7/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-atsm-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>{bat-ptl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-ptl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>{bat-ptl-vm}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-lnl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8556_BAT and XEIGTPW_13840_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>Statuses : 2 fail(s) 9 skip(s)</li>
<li>Exec time: [0.0, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13840_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8556/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13840/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8556 -&gt; IGTPW_13840</li>
<li>Linux: xe-3836-e2a896e95ea5f65aa137dcf117bfd0d61176c8ce -&gt; xe-3840-27e0bd03f98552006988ca6a2c20f06866d9d10b</li>
</ul>
<p>IGTPW_13840: 13840<br />
  IGT_8556: e5eda2a187432a54f5e6fada18e4187e5175a10c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3836-e2a896e95ea5f65aa137dcf117bfd0d61176c8ce: e2a896e95ea5f65aa137dcf117bfd0d61176c8ce<br />
  xe-3840-27e0bd03f98552006988ca6a2c20f06866d9d10b: 27e0bd03f98552006988ca6a2c20f06866d9d10b</p>

</body>
</html>

--===============7524234943127133670==--
