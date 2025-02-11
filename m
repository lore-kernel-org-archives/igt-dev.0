Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69799C021A2
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5EA10E17D;
	Tue, 11 Feb 2025 20:09:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51AD10E17D;
 Tue, 11 Feb 2025 20:09:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0697442972271339458=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_add_dsc-fallback_test_=28re?=
 =?utf-8?q?v4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Feb 2025 20:09:11 -0000
Message-ID: <173930455193.1042362.8015987166574885461@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

--===============0697442972271339458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add dsc-fallback test (rev4)
URL   : https://patchwork.freedesktop.org/series/143877/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8228_BAT -> XEIGTPW_12576_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12576_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12576_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12576_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dp_linktrain_fallback@dsc-fallback (NEW):
    - bat-lnl-1:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-lnl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-bmg-1:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-dg2-oem2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  
New tests
---------

  New tests have been introduced between XEIGT_8228_BAT and XEIGTPW_12576_BAT:

### New IGT tests (1) ###

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12576_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#1024]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-atsm-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][5] ([Intel XE#2463]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-adlp-vf/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#1024]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-pvc-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#3419]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-lnl-2:          NOTRUN -> [SKIP][8] ([Intel XE#2235]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419


Build changes
-------------

  * IGT: IGT_8228 -> IGTPW_12576
  * Linux: xe-2634-93f37b8d57cb5f1db7818eb395ad810ad1ed8b77 -> xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee

  IGTPW_12576: 12576
  IGT_8228: 8228
  xe-2634-93f37b8d57cb5f1db7818eb395ad810ad1ed8b77: 93f37b8d57cb5f1db7818eb395ad810ad1ed8b77
  xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee: e1c145994c41ed6dd5265bc0a7a276fe1834f3ee

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/index.html

--===============0697442972271339458==
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
<tr><td><b>Series:</b></td><td>add dsc-fallback test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143877/">https://patchwork.freedesktop.org/series/143877/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8228_BAT -&gt; XEIGTPW_12576_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12576_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12576_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12576_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_dp_linktrain_fallback@dsc-fallback (NEW):<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-lnl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-dg2-oem2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8228_BAT and XEIGTPW_12576_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dp_linktrain_fallback@dsc-fallback:<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12576_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-atsm-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-adlp-vf/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-pvc-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +1 other test skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8228 -&gt; IGTPW_12576</li>
<li>Linux: xe-2634-93f37b8d57cb5f1db7818eb395ad810ad1ed8b77 -&gt; xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee</li>
</ul>
<p>IGTPW_12576: 12576<br />
  IGT_8228: 8228<br />
  xe-2634-93f37b8d57cb5f1db7818eb395ad810ad1ed8b77: 93f37b8d57cb5f1db7818eb395ad810ad1ed8b77<br />
  xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee: e1c145994c41ed6dd5265bc0a7a276fe1834f3ee</p>

</body>
</html>

--===============0697442972271339458==--
