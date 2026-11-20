Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DFF606A688
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 22:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E547011293E;
	Fri, 20 Nov 2026 22:36:21 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0721110E09A;
 Fri, 20 Nov 2026 22:35:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3340923603262501901=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/core=5Fdebugfs=3A_Cre?=
 =?utf-8?q?ate_listing_while_reading_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Nov 2026 22:35:17 -0000
Message-ID: <179521411702.62469.10399882124906007701@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3340923603262501901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_debugfs: Create listing while reading (rev2)
URL   : https://patchwork.freedesktop.org/series/179138/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9201_BAT -> XEIGTPW_16194_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_16194_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_16194_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16194_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_debugfs@read-all-entries:
    - bat-wcl-2:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-wcl-2/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-wcl-2/igt@core_debugfs@read-all-entries.html
    - bat-nvls-1:         [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-nvls-1/igt@core_debugfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-nvls-1/igt@core_debugfs@read-all-entries.html
    - bat-nvls-2:         [PASS][5] -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-nvls-2/igt@core_debugfs@read-all-entries.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-nvls-2/igt@core_debugfs@read-all-entries.html
    - bat-ptl-2:          [PASS][7] -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-ptl-2/igt@core_debugfs@read-all-entries.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-ptl-2/igt@core_debugfs@read-all-entries.html
    - bat-wcl-1:          [PASS][9] -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-wcl-1/igt@core_debugfs@read-all-entries.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-wcl-1/igt@core_debugfs@read-all-entries.html
    - bat-ptl-1:          [PASS][11] -> [TIMEOUT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-ptl-1/igt@core_debugfs@read-all-entries.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-ptl-1/igt@core_debugfs@read-all-entries.html
    - bat-bmg-2:          [PASS][13] -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-bmg-2/igt@core_debugfs@read-all-entries.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-bmg-2/igt@core_debugfs@read-all-entries.html
    - bat-adlp-7:         [PASS][15] -> [TIMEOUT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-adlp-7/igt@core_debugfs@read-all-entries.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-adlp-7/igt@core_debugfs@read-all-entries.html
    - bat-bmg-1:          [PASS][17] -> [TIMEOUT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-bmg-1/igt@core_debugfs@read-all-entries.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-bmg-1/igt@core_debugfs@read-all-entries.html
    - bat-atsm-2:         [PASS][19] -> [TIMEOUT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-atsm-2/igt@core_debugfs@read-all-entries.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-atsm-2/igt@core_debugfs@read-all-entries.html

  


Build changes
-------------

  * IGT: IGT_9201 -> IGTPW_16194
  * Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -> xe-6198-d706b8b5a4276d637251224ed2d5ff30a982fa0a

  IGTPW_16194: 16194
  IGT_9201: 9201
  xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418
  xe-6198-d706b8b5a4276d637251224ed2d5ff30a982fa0a: d706b8b5a4276d637251224ed2d5ff30a982fa0a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/index.html

--===============3340923603262501901==
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
<tr><td><b>Series:</b></td><td>tests/core_debugfs: Create listing while reading (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179138/">https://patchwork.freedesktop.org/series/179138/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9201_BAT -&gt; XEIGTPW_16194_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_16194_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_16194_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16194_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-wcl-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-wcl-2/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-nvls-1/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-nvls-1/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-nvls-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-nvls-2/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-ptl-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-ptl-2/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-wcl-1/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-wcl-1/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-ptl-1/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-ptl-1/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-bmg-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-bmg-2/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-adlp-7/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-adlp-7/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-bmg-1/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-bmg-1/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-atsm-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-atsm-2/igt@core_debugfs@read-all-entries.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9201 -&gt; IGTPW_16194</li>
<li>Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -&gt; xe-6198-d706b8b5a4276d637251224ed2d5ff30a982fa0a</li>
</ul>
<p>IGTPW_16194: 16194<br />
  IGT_9201: 9201<br />
  xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418<br />
  xe-6198-d706b8b5a4276d637251224ed2d5ff30a982fa0a: d706b8b5a4276d637251224ed2d5ff30a982fa0a</p>

</body>
</html>

--===============3340923603262501901==--
