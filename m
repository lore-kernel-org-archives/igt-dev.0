Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1875EB1076
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 21:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4EF10E23E;
	Tue, 10 Mar 2026 21:23:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AFB10E23E;
 Tue, 10 Mar 2026 21:23:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6185904023545214240=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib=3A_Add_NVL-P_=28Novalak?=
 =?utf-8?q?e-P=29_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Mar 2026 21:23:22 -0000
Message-ID: <177317780259.341309.1055942789025470604@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310165113.8994-1-himanshu.girotra@intel.com>
In-Reply-To: <20260310165113.8994-1-himanshu.girotra@intel.com>
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

--===============6185904023545214240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: Add NVL-P (Novalake-P) support
URL   : https://patchwork.freedesktop.org/series/162971/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8792_BAT -> XEIGTPW_14719_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14719_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14719_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14719_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-wcl-1:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1:
    - bat-wcl-1:          [PASS][3] -> [FAIL][4] +7 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html

  * igt@xe_intel_bb@bb-with-allocator:
    - bat-wcl-1:          [PASS][5] -> [SKIP][6] +10 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@xe_intel_bb@bb-with-allocator.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_intel_bb@bb-with-allocator.html

  * igt@xe_intel_bb@render:
    - bat-wcl-2:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-2/igt@xe_intel_bb@render.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_intel_bb@render.html
    - bat-wcl-1:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@xe_intel_bb@render.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_intel_bb@render.html

  * igt@xe_pat@pat-index-xelp@blt:
    - bat-wcl-2:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@pat-index-xelp@blt.html
    - bat-wcl-1:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_pat@pat-index-xelp@blt.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-wcl-2:          NOTRUN -> [FAIL][13] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@pat-index-xelp@render.html
    - bat-wcl-1:          NOTRUN -> [FAIL][14] +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_pat@pat-index-xelp@render.html

  * igt@xe_pat@pat-sanity:
    - bat-wcl-2:          [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-2/igt@xe_pat@pat-sanity.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@pat-sanity.html

  * igt@xe_pat@prime-self-import-coh:
    - bat-wcl-2:          [PASS][17] -> [SKIP][18] +10 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-2/igt@xe_pat@prime-self-import-coh.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@prime-self-import-coh.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xelp:
    - bat-wcl-1:          [SKIP][19] ([Intel XE#7242]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-2:          [SKIP][21] ([Intel XE#7242]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@pat-index-xelp.html

  
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242


Build changes
-------------

  * IGT: IGT_8792 -> IGTPW_14719
  * Linux: xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7 -> xe-4693-ab86ea7989502faeabd9bceb2264d8dbfed6e8ce

  IGTPW_14719: 14719
  IGT_8792: 8792
  xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7: bf3ba6a508ffb59323357535a459eb64f02d94f7
  xe-4693-ab86ea7989502faeabd9bceb2264d8dbfed6e8ce: ab86ea7989502faeabd9bceb2264d8dbfed6e8ce

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/index.html

--===============6185904023545214240==
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
<tr><td><b>Series:</b></td><td>lib: Add NVL-P (Novalake-P) support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162971/">https://patchwork.freedesktop.org/series/162971/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8792_BAT -&gt; XEIGTPW_14719_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14719_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14719_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14719_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@bb-with-allocator:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@xe_intel_bb@bb-with-allocator.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_intel_bb@bb-with-allocator.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-2/igt@xe_intel_bb@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_intel_bb@render.html">INCOMPLETE</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@xe_intel_bb@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_intel_bb@render.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@pat-index-xelp@blt.html">SKIP</a></li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_pat@pat-index-xelp@blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@pat-index-xelp@render.html">FAIL</a> +1 other test fail</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_pat@pat-index-xelp@render.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sanity:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-2/igt@xe_pat@pat-sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@pat-sanity.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-2/igt@xe_pat@prime-self-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@prime-self-import-coh.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">FAIL</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8792/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14719/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8792 -&gt; IGTPW_14719</li>
<li>Linux: xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7 -&gt; xe-4693-ab86ea7989502faeabd9bceb2264d8dbfed6e8ce</li>
</ul>
<p>IGTPW_14719: 14719<br />
  IGT_8792: 8792<br />
  xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7: bf3ba6a508ffb59323357535a459eb64f02d94f7<br />
  xe-4693-ab86ea7989502faeabd9bceb2264d8dbfed6e8ce: ab86ea7989502faeabd9bceb2264d8dbfed6e8ce</p>

</body>
</html>

--===============6185904023545214240==--
