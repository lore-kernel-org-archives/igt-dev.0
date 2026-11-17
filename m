Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98336606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 20:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB9C10F952;
	Tue, 17 Nov 2026 20:20:23 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0D910E65A;
 Tue, 17 Nov 2026 20:19:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5703629136983801701=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/core=5Fsysfs=3A_Creat?=
 =?utf-8?q?e_listing_while_reading?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Nov 2026 20:19:17 -0000
Message-ID: <179494675783.39806.6843256983173737497@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117194250.72855-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20261117194250.72855-1-kamil.konieczny@linux.intel.com>
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

--===============5703629136983801701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_sysfs: Create listing while reading
URL   : https://patchwork.freedesktop.org/series/178819/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9196_BAT -> XEIGTPW_16167_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_16167_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_16167_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16167_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_sysfs@read-all-entries:
    - bat-ptl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-1/igt@core_sysfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-1/igt@core_sysfs@read-all-entries.html
    - bat-lnl-1:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-lnl-1/igt@core_sysfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-lnl-1/igt@core_sysfs@read-all-entries.html
    - bat-bmg-2:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-bmg-2/igt@core_sysfs@read-all-entries.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-bmg-2/igt@core_sysfs@read-all-entries.html
    - bat-adlp-7:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-adlp-7/igt@core_sysfs@read-all-entries.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-adlp-7/igt@core_sysfs@read-all-entries.html
    - bat-bmg-1:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-bmg-1/igt@core_sysfs@read-all-entries.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-bmg-1/igt@core_sysfs@read-all-entries.html
    - bat-lnl-2:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-lnl-2/igt@core_sysfs@read-all-entries.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-lnl-2/igt@core_sysfs@read-all-entries.html
    - bat-atsm-2:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-atsm-2/igt@core_sysfs@read-all-entries.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-atsm-2/igt@core_sysfs@read-all-entries.html
    - bat-ptl-vm:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-vm/igt@core_sysfs@read-all-entries.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-vm/igt@core_sysfs@read-all-entries.html
    - bat-wcl-2:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-wcl-2/igt@core_sysfs@read-all-entries.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-wcl-2/igt@core_sysfs@read-all-entries.html
    - bat-nvls-1:         [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-nvls-1/igt@core_sysfs@read-all-entries.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-nvls-1/igt@core_sysfs@read-all-entries.html
    - bat-nvls-2:         [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-nvls-2/igt@core_sysfs@read-all-entries.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-nvls-2/igt@core_sysfs@read-all-entries.html
    - bat-ptl-2:          [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-2/igt@core_sysfs@read-all-entries.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-2/igt@core_sysfs@read-all-entries.html
    - bat-wcl-1:          [PASS][25] -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-wcl-1/igt@core_sysfs@read-all-entries.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-wcl-1/igt@core_sysfs@read-all-entries.html

  


Build changes
-------------

  * IGT: IGT_9196 -> IGTPW_16167
  * Linux: xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda -> xe-6163-79504010d899136eff374b34e1fedcb8e5d57fe0

  IGTPW_16167: 16167
  IGT_9196: 9196
  xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda: ccb10a534282f16c6d068bc06e5c722680045dda
  xe-6163-79504010d899136eff374b34e1fedcb8e5d57fe0: 79504010d899136eff374b34e1fedcb8e5d57fe0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/index.html

--===============5703629136983801701==
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
<tr><td><b>Series:</b></td><td>tests/core_sysfs: Create listing while reading</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178819/">https://patchwork.freedesktop.org/series/178819/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9196_BAT -&gt; XEIGTPW_16167_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_16167_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_16167_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16167_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_sysfs@read-all-entries:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-1/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-1/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-lnl-1/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-lnl-1/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-bmg-2/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-bmg-2/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-adlp-7/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-adlp-7/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-bmg-1/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-bmg-1/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-lnl-2/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-lnl-2/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-atsm-2/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-atsm-2/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-vm/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-vm/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-wcl-2/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-wcl-2/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-nvls-1/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-nvls-1/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-nvls-2/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-nvls-2/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-2/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-2/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-wcl-1/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-wcl-1/igt@core_sysfs@read-all-entries.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9196 -&gt; IGTPW_16167</li>
<li>Linux: xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda -&gt; xe-6163-79504010d899136eff374b34e1fedcb8e5d57fe0</li>
</ul>
<p>IGTPW_16167: 16167<br />
  IGT_9196: 9196<br />
  xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda: ccb10a534282f16c6d068bc06e5c722680045dda<br />
  xe-6163-79504010d899136eff374b34e1fedcb8e5d57fe0: 79504010d899136eff374b34e1fedcb8e5d57fe0</p>

</body>
</html>

--===============5703629136983801701==--
