Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2190FEEE272
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 23:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D176910EC75;
	Thu, 12 Sep 2024 23:17:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E552510EC75;
 Thu, 12 Sep 2024 23:17:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1779236205557440334=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Fixup_xe=5Fdma=5Fbuf=5Fsync_to?=
 =?utf-8?q?_new_KMD_behavior?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 23:17:24 -0000
Message-ID: <172618304493.994193.4825488026823265000@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912223110.1054974-1-matthew.brost@intel.com>
In-Reply-To: <20240912223110.1054974-1-matthew.brost@intel.com>
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

--===============1779236205557440334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fixup xe_dma_buf_sync to new KMD behavior
URL   : https://patchwork.freedesktop.org/series/138612/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8015_BAT -> XEIGTPW_11736_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11736_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11736_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11736_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-bmg-1:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-adlp-7:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-lnl-2:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-atsm-2:         [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-adlp-vf:        [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-lnl-1:          [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - bat-adlp-vf:        [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - {bat-bmg-2}:        [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-bmg-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-bmg-2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_8015 -> IGTPW_11736
  * Linux: xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8 -> xe-1940-e55e4cc47de4150012eec3e54b6d710967d66510

  IGTPW_11736: 11736
  IGT_8015: 8015
  xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8: 7fc279c7cf796102479291b06b2969d3c27deeb8
  xe-1940-e55e4cc47de4150012eec3e54b6d710967d66510: e55e4cc47de4150012eec3e54b6d710967d66510

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/index.html

--===============1779236205557440334==
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
<tr><td><b>Series:</b></td><td>Fixup xe_dma_buf_sync to new KMD behavior</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138612/">https://patchwork.freedesktop.org/series/138612/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8015_BAT -&gt; XEIGTPW_11736_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11736_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11736_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11736_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a></li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_dma_buf_sync@export-dma-buf-once:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8015/bat-bmg-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11736/bat-bmg-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8015 -&gt; IGTPW_11736</li>
<li>Linux: xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8 -&gt; xe-1940-e55e4cc47de4150012eec3e54b6d710967d66510</li>
</ul>
<p>IGTPW_11736: 11736<br />
  IGT_8015: 8015<br />
  xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8: 7fc279c7cf796102479291b06b2969d3c27deeb8<br />
  xe-1940-e55e4cc47de4150012eec3e54b6d710967d66510: e55e4cc47de4150012eec3e54b6d710967d66510</p>

</body>
</html>

--===============1779236205557440334==--
