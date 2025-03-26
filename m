Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E49BC28B30
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 04:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35B210E102;
	Wed, 26 Mar 2025 04:04:07 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A043010E102;
 Wed, 26 Mar 2025 04:04:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5932877624311049647=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/7=5D_lib=3A_take_out_duplicate_assert?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Mar 2025 04:04:06 -0000
Message-ID: <174296184665.3802.3483459102845981943@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
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

--===============5932877624311049647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/7] lib: take out duplicate assert
URL   : https://patchwork.freedesktop.org/series/146755/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8284_BAT -> XEIGTPW_12835_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12835_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12835_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12835_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +7 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_intel_bb@simple-bb-ctx:
    - bat-adlp-vf:        [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-adlp-vf/igt@xe_intel_bb@simple-bb-ctx.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-adlp-vf/igt@xe_intel_bb@simple-bb-ctx.html
    - bat-lnl-1:          [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-lnl-1/igt@xe_intel_bb@simple-bb-ctx.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-lnl-1/igt@xe_intel_bb@simple-bb-ctx.html

  * igt@xe_pat@pat-index-xe2@dw:
    - bat-bmg-2:          [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-bmg-2/igt@xe_pat@pat-index-xe2@dw.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-bmg-2/igt@xe_pat@pat-index-xe2@dw.html
    - bat-bmg-1:          [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-bmg-1/igt@xe_pat@pat-index-xe2@dw.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-bmg-1/igt@xe_pat@pat-index-xe2@dw.html
    - bat-lnl-2:          [PASS][11] -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-pvc-2:          [PASS][13] -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-adlp-7:         [PASS][15] -> [FAIL][16] +7 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-adlp-7/igt@xe_pat@pat-index-xelp.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-adlp-7/igt@xe_pat@pat-index-xelp.html
    - bat-atsm-2:         [PASS][17] -> [FAIL][18] +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-atsm-2/igt@xe_pat@pat-index-xelp.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-atsm-2/igt@xe_pat@pat-index-xelp.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12835_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [PASS][19] -> [ABORT][20] ([Intel XE#3970])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8284 -> IGTPW_12835

  IGTPW_12835: 12835
  IGT_8284: 8284
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/index.html

--===============5932877624311049647==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/7] lib: take out duplicate assert</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146755/">https://patchwork.freedesktop.org/series/146755/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8284_BAT -&gt; XEIGTPW_12835_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12835_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12835_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12835_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb-ctx:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-adlp-vf/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-adlp-vf/igt@xe_intel_bb@simple-bb-ctx.html">FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-lnl-1/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-lnl-1/igt@xe_intel_bb@simple-bb-ctx.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@dw:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-bmg-2/igt@xe_pat@pat-index-xe2@dw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-bmg-2/igt@xe_pat@pat-index-xe2@dw.html">FAIL</a> +2 other tests fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-bmg-1/igt@xe_pat@pat-index-xe2@dw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-bmg-1/igt@xe_pat@pat-index-xe2@dw.html">FAIL</a> +2 other tests fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">FAIL</a> +7 other tests fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-atsm-2/igt@xe_pat@pat-index-xelp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-atsm-2/igt@xe_pat@pat-index-xelp.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12835_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12835/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8284 -&gt; IGTPW_12835</li>
</ul>
<p>IGTPW_12835: 12835<br />
  IGT_8284: 8284<br />
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7</p>

</body>
</html>

--===============5932877624311049647==--
