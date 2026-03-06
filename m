Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E20AF513ED
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 00:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEC410EC74;
	Fri,  6 Mar 2026 00:46:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4425910EC74;
 Fri,  6 Mar 2026 00:46:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8292030160277621589=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/kms=3A_convert_output-?=
 =?utf-8?q?=3Epending=5Fpipe_to_output-=3Epending=5Fcrtc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Mar 2026 00:46:22 -0000
Message-ID: <177275798225.323437.5670521708962795150@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305140851.2318968-1-jani.nikula@intel.com>
In-Reply-To: <20260305140851.2318968-1-jani.nikula@intel.com>
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

--===============8292030160277621589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: convert output->pending_pipe to output->pending_crtc
URL   : https://patchwork.freedesktop.org/series/162679/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8782_BAT -> XEIGTPW_14682_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14682_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14682_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14682_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-ptl-2:          [PASS][1] -> [CRASH][2] +12 other tests crash
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-wcl-1:          [PASS][3] -> [CRASH][4] +12 other tests crash
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-adlp-7:         [PASS][5] -> [CRASH][6] +12 other tests crash
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-lnl-1:          [PASS][7] -> [CRASH][8] +12 other tests crash
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-bmg-1:          [PASS][9] -> [CRASH][10] +12 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][11] -> [CRASH][12] +12 other tests crash
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  


Build changes
-------------

  * IGT: IGT_8782 -> IGTPW_14682
  * Linux: xe-4665-d927c128e21f0543a0998af896d9fe22629b3532 -> xe-4666-704ff20b65b8a8037c10332bad4ecabbfeab7cdc

  IGTPW_14682: 2f598f4edb1dc7709cd5ec998b64847f9bd87445 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4665-d927c128e21f0543a0998af896d9fe22629b3532: d927c128e21f0543a0998af896d9fe22629b3532
  xe-4666-704ff20b65b8a8037c10332bad4ecabbfeab7cdc: 704ff20b65b8a8037c10332bad4ecabbfeab7cdc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/index.html

--===============8292030160277621589==
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
<tr><td><b>Series:</b></td><td>lib/kms: convert output-&gt;pending_pipe to output-&gt;pending_crtc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162679/">https://patchwork.freedesktop.org/series/162679/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8782_BAT -&gt; XEIGTPW_14682_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14682_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14682_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14682_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">CRASH</a> +12 other tests crash</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">CRASH</a> +12 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">CRASH</a> +12 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">CRASH</a> +12 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">CRASH</a> +12 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14682/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">CRASH</a> +12 other tests crash</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8782 -&gt; IGTPW_14682</li>
<li>Linux: xe-4665-d927c128e21f0543a0998af896d9fe22629b3532 -&gt; xe-4666-704ff20b65b8a8037c10332bad4ecabbfeab7cdc</li>
</ul>
<p>IGTPW_14682: 2f598f4edb1dc7709cd5ec998b64847f9bd87445 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4665-d927c128e21f0543a0998af896d9fe22629b3532: d927c128e21f0543a0998af896d9fe22629b3532<br />
  xe-4666-704ff20b65b8a8037c10332bad4ecabbfeab7cdc: 704ff20b65b8a8037c10332bad4ecabbfeab7cdc</p>

</body>
</html>

--===============8292030160277621589==--
