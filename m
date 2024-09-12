Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FFDEEB566
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 08:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D1C10E15B;
	Thu, 12 Sep 2024 08:35:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A9410E15B;
 Thu, 12 Sep 2024 08:35:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4601285138001161356=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_add_test_to_validate_fallback_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 08:35:50 -0000
Message-ID: <172613015046.990568.15783809300240254709@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
In-Reply-To: <20240912062839.760661-1-kunal1.joshi@intel.com>
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

--===============4601285138001161356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate fallback (rev5)
URL   : https://patchwork.freedesktop.org/series/134660/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8013_BAT -> XEIGTPW_11728_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11728_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11728_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11728_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fallback@dp-fallback (NEW):
    - {bat-bmg-2}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-bmg-2/igt@kms_fallback@dp-fallback.html
    - bat-adlp-7:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-adlp-7/igt@kms_fallback@dp-fallback.html
    - bat-bmg-1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-bmg-1/igt@kms_fallback@dp-fallback.html
    - bat-lnl-2:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-lnl-2/igt@kms_fallback@dp-fallback.html
    - bat-lnl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-lnl-1/igt@kms_fallback@dp-fallback.html

  
New tests
---------

  New tests have been introduced between XEIGT_8013_BAT and XEIGTPW_11728_BAT:

### New IGT tests (1) ###

  * igt@kms_fallback@dp-fallback:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 11.77] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11728_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_fallback@dp-fallback (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#1024])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-atsm-2/igt@kms_fallback@dp-fallback.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#2463])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-adlp-vf/igt@kms_fallback@dp-fallback.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [FAIL][8] ([Intel XE#1069]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8013/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463


Build changes
-------------

  * IGT: IGT_8013 -> IGTPW_11728
  * Linux: xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8 -> xe-1932-1b37d4587b45639327eeb4cce29f77d487f7700a

  IGTPW_11728: 11728
  IGT_8013: 8013
  xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8: 45bec37c098c2f6232d233c8116236f09327d2b8
  xe-1932-1b37d4587b45639327eeb4cce29f77d487f7700a: 1b37d4587b45639327eeb4cce29f77d487f7700a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/index.html

--===============4601285138001161356==
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
<tr><td><b>Series:</b></td><td>add test to validate fallback (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134660/">https://patchwork.freedesktop.org/series/134660/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8013_BAT -&gt; XEIGTPW_11728_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11728_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11728_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11728_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_fallback@dp-fallback (NEW):<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-bmg-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-adlp-7/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-bmg-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-lnl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-lnl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8013_BAT and XEIGTPW_11728_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_fallback@dp-fallback:<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 11.77] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11728_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_fallback@dp-fallback (NEW):<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-atsm-2/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-adlp-vf/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8013/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11728/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8013 -&gt; IGTPW_11728</li>
<li>Linux: xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8 -&gt; xe-1932-1b37d4587b45639327eeb4cce29f77d487f7700a</li>
</ul>
<p>IGTPW_11728: 11728<br />
  IGT_8013: 8013<br />
  xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8: 45bec37c098c2f6232d233c8116236f09327d2b8<br />
  xe-1932-1b37d4587b45639327eeb4cce29f77d487f7700a: 1b37d4587b45639327eeb4cce29f77d487f7700a</p>

</body>
</html>

--===============4601285138001161356==--
