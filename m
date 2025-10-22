Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A67CCD1BB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 14:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6031D10E7CD;
	Wed, 22 Oct 2025 14:26:33 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF2410E7CD;
 Wed, 22 Oct 2025 14:26:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1104343487896674410=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fres?=
 =?utf-8?q?et=3A_Fix_uninitialized_var?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 Oct 2025 14:26:32 -0000
Message-ID: <176114319263.42904.15346747777450098368@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251022114655.70478-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251022114655.70478-1-kamil.konieczny@linux.intel.com>
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

--===============1104343487896674410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_reset: Fix uninitialized var
URL   : https://patchwork.freedesktop.org/series/156333/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8594_BAT -> XEIGTPW_13928_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13928_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13928_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  Additional (1): bat-bmg-3 
  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13928_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p} (NEW):
    - bat-bmg-3:          NOTRUN -> [FAIL][1] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
New tests
---------

  New tests have been introduced between XEIGT_8594_BAT and XEIGTPW_13928_BAT:

### New IGT tests (4) ###

  * igt@xe_peer2peer@read@read-gpua-system-gpub-vram01-p2p:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-vram01-p2p:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13928_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-7:         [PASS][2] -> [DMESG-WARN][3] ([Intel XE#4543]) +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8594/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          NOTRUN -> [SKIP][4] ([Intel XE#2504])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@multigpu-basic-client:
    - bat-bmg-3:          NOTRUN -> [SKIP][5] ([Intel XE#4837]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837


Build changes
-------------

  * IGT: IGT_8594 -> IGTPW_13928
  * Linux: xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad -> xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700

  IGTPW_13928: 13928
  IGT_8594: 8594
  xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad: 76e60b5ce41fc1bcabf7941a57303d541bffd6ad
  xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700: b3696aee36c443dbea93e1068b9c3c765bc8e700

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/index.html

--===============1104343487896674410==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_reset: Fix uninitialized var</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156333/">https://patchwork.freedesktop.org/series/156333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8594_BAT -&gt; XEIGTPW_13928_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13928_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13928_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-3 <br />
  Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13928_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p} (NEW):<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8594_BAT and XEIGTPW_13928_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_peer2peer@read@read-gpua-system-gpub-vram01-p2p:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-vram01-p2p:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13928_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8594/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8594 -&gt; IGTPW_13928</li>
<li>Linux: xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad -&gt; xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700</li>
</ul>
<p>IGTPW_13928: 13928<br />
  IGT_8594: 8594<br />
  xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad: 76e60b5ce41fc1bcabf7941a57303d541bffd6ad<br />
  xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700: b3696aee36c443dbea93e1068b9c3c765bc8e700</p>

</body>
</html>

--===============1104343487896674410==--
