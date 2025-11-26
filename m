Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EFED1039D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 12:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6033010E5B4;
	Wed, 26 Nov 2025 12:13:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93E610E5B4;
 Wed, 26 Nov 2025 12:13:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7859513748404560572=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Redesign_of_the_xe=5Fdebugf?=
 =?utf-8?q?s_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Nov 2025 12:13:46 -0000
Message-ID: <176415922668.30121.16211655688127202063@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126102827.47844-1-piotr.piorkowski@intel.com>
In-Reply-To: <20251126102827.47844-1-piotr.piorkowski@intel.com>
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

--===============7859513748404560572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Redesign of the xe_debugfs test (rev3)
URL   : https://patchwork.freedesktop.org/series/157493/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8638_BAT -> XEIGTPW_14117_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-adlp-vm bat-adlp-7 

New tests
---------

  New tests have been introduced between XEIGT_8638_BAT and XEIGTPW_14117_BAT:

### New IGT tests (4) ###

  * igt@xe_debugfs@info-read:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_debugfs@root-dir:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_debugfs@tile-dir:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_debugfs@tile-dir@tile-0:
    - Statuses : 9 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14117_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14117/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14117/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8638 -> IGTPW_14117
  * Linux: xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362 -> xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d

  IGTPW_14117: 9cd2f8c626afd44ab5d7cbe38e20159bc3d8182d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362
  xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d: a945aa869cd59483dfe3c15587758c9bc1e72b0d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14117/index.html

--===============7859513748404560572==
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
<tr><td><b>Series:</b></td><td>Redesign of the xe_debugfs test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157493/">https://patchwork.freedesktop.org/series/157493/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14117/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14117/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8638_BAT -&gt; XEIGTPW_14117_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-adlp-vm bat-adlp-7 </p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8638_BAT and XEIGTPW_14117_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_debugfs@info-read:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@root-dir:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@tile-dir:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@tile-dir@tile-0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14117_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14117/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14117/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8638 -&gt; IGTPW_14117</li>
<li>Linux: xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362 -&gt; xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d</li>
</ul>
<p>IGTPW_14117: 9cd2f8c626afd44ab5d7cbe38e20159bc3d8182d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362<br />
  xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d: a945aa869cd59483dfe3c15587758c9bc1e72b0d</p>

</body>
</html>

--===============7859513748404560572==--
