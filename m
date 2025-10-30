Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7814FCCF9E3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 20:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216FE10EA1E;
	Thu, 30 Oct 2025 20:54:19 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0E110EA1E;
 Thu, 30 Oct 2025 20:54:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3237431440317014425=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fsurvivabil?=
 =?utf-8?q?ity=3A_Add_xe=5Fsurvivability_test_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Oct 2025 20:54:17 -0000
Message-ID: <176185765796.1743.5587604084686254325@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030180015.3790528-5-sk.anirban@intel.com>
In-Reply-To: <20251030180015.3790528-5-sk.anirban@intel.com>
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

--===============3237431440317014425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_survivability: Add xe_survivability test (rev9)
URL   : https://patchwork.freedesktop.org/series/154342/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8603_BAT -> XEIGTPW_13966_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13966_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13966_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13966_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_survivability@i2c-functionality (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-lnl-2/igt@xe_survivability@i2c-functionality.html
    - bat-ptl-2:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-ptl-2/igt@xe_survivability@i2c-functionality.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html

  * igt@xe_survivability@runtime-survivability (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-adlp-7/igt@xe_survivability@runtime-survivability.html
    - bat-atsm-2:         NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-atsm-2/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-1:          NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-ptl-1/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html
    - bat-lnl-1:          NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-lnl-1/igt@xe_survivability@runtime-survivability.html

  
New tests
---------

  New tests have been introduced between XEIGT_8603_BAT and XEIGTPW_13966_BAT:

### New IGT tests (2) ###

  * igt@xe_survivability@i2c-functionality:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 2.22] s

  * igt@xe_survivability@runtime-survivability:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 4.26] s

  



Build changes
-------------

  * IGT: IGT_8603 -> IGTPW_13966
  * Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -> xe-4014-c228329c56db24dda529f2499987b3a179d1f032

  IGTPW_13966: 4f867c68b78bcd6afa6f6419acd8eb3b989a2be0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63
  xe-4014-c228329c56db24dda529f2499987b3a179d1f032: c228329c56db24dda529f2499987b3a179d1f032

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/index.html

--===============3237431440317014425==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_survivability: Add xe_survivability test (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154342/">https://patchwork.freedesktop.org/series/154342/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8603_BAT -&gt; XEIGTPW_13966_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13966_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13966_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13966_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_survivability@i2c-functionality (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-lnl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-ptl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-adlp-7/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-atsm-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-ptl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13966/bat-lnl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8603_BAT and XEIGTPW_13966_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 4.26] s</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8603 -&gt; IGTPW_13966</li>
<li>Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -&gt; xe-4014-c228329c56db24dda529f2499987b3a179d1f032</li>
</ul>
<p>IGTPW_13966: 4f867c68b78bcd6afa6f6419acd8eb3b989a2be0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63<br />
  xe-4014-c228329c56db24dda529f2499987b3a179d1f032: c228329c56db24dda529f2499987b3a179d1f032</p>

</body>
</html>

--===============3237431440317014425==--
