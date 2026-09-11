Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B619C88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 22:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BB610E1F8;
	Fri, 11 Sep 2026 22:00:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236A110E1F8;
 Fri, 11 Sep 2026 21:59:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0344436104014208192=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fsurvivabil?=
 =?utf-8?q?ity=3A_update_ignored_dmesg_regex_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Sep 2026 21:59:29 -0000
Message-ID: <178916396913.152712.18348856030635298655@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260911113448.1300864-4-sk.anirban@intel.com>
In-Reply-To: <20260911113448.1300864-4-sk.anirban@intel.com>
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

--===============0344436104014208192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_survivability: update ignored dmesg regex (rev7)
URL   : https://patchwork.freedesktop.org/series/170062/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9093_BAT -> XEIGTPW_15834_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15834_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15834_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15834_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_survivability@runtime-survivability:
    - bat-adlp-7:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-adlp-7/igt@xe_survivability@runtime-survivability.html
    - bat-atsm-2:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-atsm-2/igt@xe_survivability@runtime-survivability.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-bmg-vm/igt@xe_survivability@runtime-survivability.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15834_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_survivability@runtime-survivability:
    - bat-lnl-2:          NOTRUN -> [SKIP][4] ([Intel XE#8415])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-lnl-2/igt@xe_survivability@runtime-survivability.html
    - bat-wcl-2:          NOTRUN -> [SKIP][5] ([Intel XE#8415])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-wcl-2/igt@xe_survivability@runtime-survivability.html
    - bat-nvls-1:         NOTRUN -> [SKIP][6] ([Intel XE#8432])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-nvls-1/igt@xe_survivability@runtime-survivability.html
    - bat-nvls-2:         NOTRUN -> [SKIP][7] ([Intel XE#8432])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-nvls-2/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-2:          NOTRUN -> [SKIP][8] ([Intel XE#8415] / [Intel XE#8432])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-ptl-2/igt@xe_survivability@runtime-survivability.html
    - bat-wcl-1:          NOTRUN -> [SKIP][9] ([Intel XE#8415])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-wcl-1/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-1:          NOTRUN -> [SKIP][10] ([Intel XE#8415] / [Intel XE#8432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-ptl-1/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][11] ([Intel XE#8415] / [Intel XE#8432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html
    - bat-lnl-1:          NOTRUN -> [SKIP][12] ([Intel XE#8415])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-lnl-1/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432


Build changes
-------------

  * IGT: IGT_9093 -> IGTPW_15834
  * Linux: xe-5736-d9e9da243a3d5fa370e267ee800471a5d1946778 -> xe-5737-f9dbf10ba445ce9399f8a782ba43326cba66d869

  IGTPW_15834: 15834
  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5736-d9e9da243a3d5fa370e267ee800471a5d1946778: d9e9da243a3d5fa370e267ee800471a5d1946778
  xe-5737-f9dbf10ba445ce9399f8a782ba43326cba66d869: f9dbf10ba445ce9399f8a782ba43326cba66d869

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/index.html

--===============0344436104014208192==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_survivability: update ignored dmesg regex (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170062/">https://patchwork.freedesktop.org/series/170062/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9093_BAT -&gt; XEIGTPW_15834_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15834_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15834_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15834_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_survivability@runtime-survivability:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-adlp-7/igt@xe_survivability@runtime-survivability.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-atsm-2/igt@xe_survivability@runtime-survivability.html">SKIP</a></li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-bmg-vm/igt@xe_survivability@runtime-survivability.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15834_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_survivability@runtime-survivability:<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-lnl-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-wcl-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-nvls-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-nvls-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-ptl-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-wcl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-ptl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15834/bat-lnl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9093 -&gt; IGTPW_15834</li>
<li>Linux: xe-5736-d9e9da243a3d5fa370e267ee800471a5d1946778 -&gt; xe-5737-f9dbf10ba445ce9399f8a782ba43326cba66d869</li>
</ul>
<p>IGTPW_15834: 15834<br />
  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5736-d9e9da243a3d5fa370e267ee800471a5d1946778: d9e9da243a3d5fa370e267ee800471a5d1946778<br />
  xe-5737-f9dbf10ba445ce9399f8a782ba43326cba66d869: f9dbf10ba445ce9399f8a782ba43326cba66d869</p>

</body>
</html>

--===============0344436104014208192==--
