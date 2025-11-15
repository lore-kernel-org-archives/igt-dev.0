Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEC1CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 02:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEC610EB76;
	Sat, 15 Nov 2025 02:26:07 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778E410E0CC;
 Sat, 15 Nov 2025 02:26:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2188499063773553831=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_IGT_tests_for_the_KMS_Color?=
 =?utf-8?q?_Pipeline_API_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 15 Nov 2025 02:26:06 -0000
Message-ID: <176317356646.60064.15794152046547462301@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251115001841.3563993-1-alex.hung@amd.com>
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
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

--===============2188499063773553831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT tests for the KMS Color Pipeline API (rev11)
URL   : https://patchwork.freedesktop.org/series/123448/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8625_BAT -> XEIGTPW_14064_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8625_BAT and XEIGTPW_14064_BAT:

### New IGT tests (2) ###

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - Statuses : 5 pass(s) 5 skip(s)
    - Exec time: [0.0, 23.65] s

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - Statuses : 5 pass(s) 7 skip(s)
    - Exec time: [0.0, 0.47] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14064_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8625/bat-pvc-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/bat-pvc-2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][3] ([Intel XE#6506]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8625/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#6520]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8625/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8625 -> IGTPW_14064
  * Linux: xe-4109-16e6b8504714d434a99e753d66296419516338ed -> xe-4112-0602386d452aeaa5f0abadb7d2805ea45f97d9f6

  IGTPW_14064: 2b48a9303b8681cda93419afa08b39823bc3f82e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8625: 69d0aa3606a205aec90d6145bb20cbae755e8559 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4109-16e6b8504714d434a99e753d66296419516338ed: 16e6b8504714d434a99e753d66296419516338ed
  xe-4112-0602386d452aeaa5f0abadb7d2805ea45f97d9f6: 0602386d452aeaa5f0abadb7d2805ea45f97d9f6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/index.html

--===============2188499063773553831==
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
<tr><td><b>Series:</b></td><td>IGT tests for the KMS Color Pipeline API (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123448/">https://patchwork.freedesktop.org/series/123448/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8625_BAT -&gt; XEIGTPW_14064_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8625_BAT and XEIGTPW_14064_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>Statuses : 5 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 23.65] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>Statuses : 5 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14064_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8625/bat-pvc-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/bat-pvc-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8625/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8625/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14064/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8625 -&gt; IGTPW_14064</li>
<li>Linux: xe-4109-16e6b8504714d434a99e753d66296419516338ed -&gt; xe-4112-0602386d452aeaa5f0abadb7d2805ea45f97d9f6</li>
</ul>
<p>IGTPW_14064: 2b48a9303b8681cda93419afa08b39823bc3f82e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8625: 69d0aa3606a205aec90d6145bb20cbae755e8559 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4109-16e6b8504714d434a99e753d66296419516338ed: 16e6b8504714d434a99e753d66296419516338ed<br />
  xe-4112-0602386d452aeaa5f0abadb7d2805ea45f97d9f6: 0602386d452aeaa5f0abadb7d2805ea45f97d9f6</p>

</body>
</html>

--===============2188499063773553831==--
