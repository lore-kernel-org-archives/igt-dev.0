Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8BECCD1BF
	for <igt-dev@archiver.kernel.org>; Sat, 25 Oct 2025 00:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BC310EB52;
	Sat, 25 Oct 2025 00:14:13 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C7F10EB50;
 Sat, 25 Oct 2025 00:14:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1930493552159017544=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fatomic=5Ftransi?=
 =?utf-8?q?tion=3A_Fix_dynamic_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ngai-Mint Kwan" <ngai-mint.kwan@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 25 Oct 2025 00:14:11 -0000
Message-ID: <176135125160.54487.4601023957145931358@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024233732.55832-1-ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20251024233732.55832-1-ngai-mint.kwan@linux.intel.com>
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

--===============1930493552159017544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition: Fix dynamic subtest
URL   : https://patchwork.freedesktop.org/series/156518/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8596_BAT -> XEIGTPW_13941_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_13941_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          NOTRUN -> [SKIP][3] ([Intel XE#2504])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@multigpu-basic-client:
    - bat-bmg-3:          NOTRUN -> [SKIP][4] ([Intel XE#4837]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          NOTRUN -> [FAIL][5] ([Intel XE#6433]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/bat-bmg-3/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#6433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433


Build changes
-------------

  * IGT: IGT_8596 -> IGTPW_13941
  * Linux: xe-3973-e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4 -> xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a

  IGTPW_13941: 13941
  IGT_8596: 8596
  xe-3973-e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4: e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4
  xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a: d827507f9c3c65785556819d50eb5131b2bf6a3a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/index.html

--===============1930493552159017544==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition: Fix dynamic subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156518/">https://patchwork.freedesktop.org/series/156518/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8596_BAT -&gt; XEIGTPW_13941_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13941_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13941/bat-bmg-3/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) +3 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8596 -&gt; IGTPW_13941</li>
<li>Linux: xe-3973-e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4 -&gt; xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a</li>
</ul>
<p>IGTPW_13941: 13941<br />
  IGT_8596: 8596<br />
  xe-3973-e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4: e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4<br />
  xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a: d827507f9c3c65785556819d50eb5131b2bf6a3a</p>

</body>
</html>

--===============1930493552159017544==--
