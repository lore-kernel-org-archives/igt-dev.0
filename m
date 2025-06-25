Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB05C7EE30
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 13:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119C910E725;
	Wed, 25 Jun 2025 13:11:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6D610E71F;
 Wed, 25 Jun 2025 13:11:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1793237758509343175=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_extend_link_training_test_c?=
 =?utf-8?q?ases_for_eDP_connector?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jun 2025 13:11:50 -0000
Message-ID: <175085711088.107859.12660700078345380913@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
In-Reply-To: <20250625123402.3929358-1-kunal1.joshi@intel.com>
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

--===============1793237758509343175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend link training test cases for eDP connector
URL   : https://patchwork.freedesktop.org/series/150748/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8425_BAT -> XEIGTPW_13350_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13350_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_link_training@non-uhbr-mst} (NEW):
    - bat-lnl-1:          NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-lnl-1/igt@kms_link_training@non-uhbr-mst.html

  * {igt@kms_link_training@non-uhbr-sst} (NEW):
    - bat-bmg-1:          NOTRUN -> [SKIP][2] +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-bmg-1/igt@kms_link_training@non-uhbr-sst.html
    - bat-adlp-7:         NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-adlp-7/igt@kms_link_training@non-uhbr-sst.html

  * {igt@kms_link_training@uhbr-sst} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-adlp-7/igt@kms_link_training@uhbr-sst.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-dg2-oem2/igt@kms_link_training@uhbr-sst.html

  * {igt@kms_linktrain_fallback@lt-fallback} (NEW):
    - bat-lnl-1:          NOTRUN -> [FAIL][6] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-lnl-1/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-dg2-oem2/igt@kms_linktrain_fallback@lt-fallback.html

  
New tests
---------

  New tests have been introduced between XEIGT_8425_BAT and XEIGTPW_13350_BAT:

### New IGT tests (6) ###

  * igt@kms_link_training@non-uhbr-mst:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_link_training@non-uhbr-sst:
    - Statuses : 2 fail(s) 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 20.12] s

  * igt@kms_link_training@uhbr-mst:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_link_training@uhbr-sst:
    - Statuses : 1 fail(s) 7 skip(s)
    - Exec time: [0.0, 20.15] s

  * igt@kms_linktrain_fallback@dsc-fallback:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_linktrain_fallback@lt-fallback:
    - Statuses : 2 fail(s) 1 incomplete(s) 5 skip(s)
    - Exec time: [0.0, 20.09] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13350_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_link_training@non-uhbr-mst} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#1024]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-pvc-2/igt@kms_link_training@non-uhbr-mst.html

  * {igt@kms_link_training@non-uhbr-sst} (NEW):
    - bat-bmg-2:          NOTRUN -> [SKIP][9] ([Intel XE#3419]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-bmg-2/igt@kms_link_training@non-uhbr-sst.html
    - bat-lnl-2:          NOTRUN -> [SKIP][10] ([Intel XE#2235]) +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-lnl-2/igt@kms_link_training@non-uhbr-sst.html

  * {igt@kms_linktrain_fallback@dsc-fallback} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#1024]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-atsm-2/igt@kms_linktrain_fallback@dsc-fallback.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419


Build changes
-------------

  * IGT: IGT_8425 -> IGTPW_13350

  IGTPW_13350: 00089dacbf78c7ff3db14ef4d24efea066708fca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8425: 8425
  xe-3303-e4196e8184ee5a9c70c136f659dccef786c263b3: e4196e8184ee5a9c70c136f659dccef786c263b3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/index.html

--===============1793237758509343175==
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
<tr><td><b>Series:</b></td><td>extend link training test cases for eDP connector</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150748/">https://patchwork.freedesktop.org/series/150748/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8425_BAT -&gt; XEIGTPW_13350_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13350_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_link_training@non-uhbr-mst} (NEW):</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-lnl-1/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@non-uhbr-sst} (NEW):</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-bmg-1/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-adlp-7/igt@kms_link_training@non-uhbr-sst.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-sst} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-adlp-7/igt@kms_link_training@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-dg2-oem2/igt@kms_link_training@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@lt-fallback} (NEW):</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-lnl-1/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-dg2-oem2/igt@kms_linktrain_fallback@lt-fallback.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8425_BAT and XEIGTPW_13350_BAT:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_link_training@non-uhbr-mst:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@non-uhbr-sst:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 20.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@uhbr-mst:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@uhbr-sst:</p>
<ul>
<li>Statuses : 1 fail(s) 7 skip(s)</li>
<li>Exec time: [0.0, 20.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_linktrain_fallback@lt-fallback:</p>
<ul>
<li>Statuses : 2 fail(s) 1 incomplete(s) 5 skip(s)</li>
<li>Exec time: [0.0, 20.09] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13350_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_link_training@non-uhbr-mst} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-pvc-2/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@non-uhbr-sst} (NEW):</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-bmg-2/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +5 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-lnl-2/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@dsc-fallback} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13350/bat-atsm-2/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8425 -&gt; IGTPW_13350</li>
</ul>
<p>IGTPW_13350: 00089dacbf78c7ff3db14ef4d24efea066708fca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8425: 8425<br />
  xe-3303-e4196e8184ee5a9c70c136f659dccef786c263b3: e4196e8184ee5a9c70c136f659dccef786c263b3</p>

</body>
</html>

--===============1793237758509343175==--
