Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A965C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 20:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF6A10ED7B;
	Tue,  8 Sep 2026 20:38:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BD910ED79;
 Tue,  8 Sep 2026 20:37:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2925673896919998853=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fsurvivabil?=
 =?utf-8?q?ity=3A_update_ignored_dmesg_regex_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Sep 2026 20:37:27 -0000
Message-ID: <178889984733.137999.12145267595314778185@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908185406.1023993-4-sk.anirban@intel.com>
In-Reply-To: <20260908185406.1023993-4-sk.anirban@intel.com>
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

--===============2925673896919998853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_survivability: update ignored dmesg regex (rev5)
URL   : https://patchwork.freedesktop.org/series/170062/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9086_BAT -> XEIGTPW_15809_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15809_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15809_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15809_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_survivability@runtime-survivability:
    - bat-adlp-7:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-adlp-7/igt@xe_survivability@runtime-survivability.html
    - bat-atsm-2:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-atsm-2/igt@xe_survivability@runtime-survivability.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-bmg-vm/igt@xe_survivability@runtime-survivability.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15809_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_survivability@runtime-survivability:
    - bat-lnl-2:          NOTRUN -> [SKIP][4] ([Intel XE#8415])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-lnl-2/igt@xe_survivability@runtime-survivability.html
    - bat-wcl-2:          NOTRUN -> [SKIP][5] ([Intel XE#8415])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-wcl-2/igt@xe_survivability@runtime-survivability.html
    - bat-nvls-1:         NOTRUN -> [SKIP][6] ([Intel XE#8432])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-nvls-1/igt@xe_survivability@runtime-survivability.html
    - bat-nvls-2:         NOTRUN -> [SKIP][7] ([Intel XE#8432])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-nvls-2/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-2:          NOTRUN -> [SKIP][8] ([Intel XE#8415] / [Intel XE#8432])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-ptl-2/igt@xe_survivability@runtime-survivability.html
    - bat-wcl-1:          NOTRUN -> [SKIP][9] ([Intel XE#8415])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-wcl-1/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-1:          NOTRUN -> [SKIP][10] ([Intel XE#8415] / [Intel XE#8432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-ptl-1/igt@xe_survivability@runtime-survivability.html
    - bat-lnl-1:          NOTRUN -> [SKIP][11] ([Intel XE#8415])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-lnl-1/igt@xe_survivability@runtime-survivability.html

  * igt@xe_waitfence@engine:
    - bat-wcl-2:          [PASS][12] -> [FAIL][13] ([Intel XE#9103])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9086/bat-wcl-2/igt@xe_waitfence@engine.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-wcl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103


Build changes
-------------

  * IGT: IGT_9086 -> IGTPW_15809
  * Linux: xe-5707-761d71119125b00057aac2d8b43c28353c8b89be -> xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada

  IGTPW_15809: e5772447f0abc7229349f0075157eaf819b79337 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5707-761d71119125b00057aac2d8b43c28353c8b89be: 761d71119125b00057aac2d8b43c28353c8b89be
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/index.html

--===============2925673896919998853==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_survivability: update ignored dmesg regex (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170062/">https://patchwork.freedesktop.org/series/170062/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9086_BAT -&gt; XEIGTPW_15809_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15809_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15809_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15809_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_survivability@runtime-survivability:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-adlp-7/igt@xe_survivability@runtime-survivability.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-atsm-2/igt@xe_survivability@runtime-survivability.html">SKIP</a></li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-bmg-vm/igt@xe_survivability@runtime-survivability.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15809_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-lnl-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-wcl-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-nvls-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-nvls-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-ptl-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-wcl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-ptl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-lnl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9086/bat-wcl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15809/bat-wcl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9086 -&gt; IGTPW_15809</li>
<li>Linux: xe-5707-761d71119125b00057aac2d8b43c28353c8b89be -&gt; xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada</li>
</ul>
<p>IGTPW_15809: e5772447f0abc7229349f0075157eaf819b79337 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5707-761d71119125b00057aac2d8b43c28353c8b89be: 761d71119125b00057aac2d8b43c28353c8b89be<br />
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada</p>

</body>
</html>

--===============2925673896919998853==--
