Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF2C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 06:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA61810E275;
	Mon,  1 Jul 2024 06:31:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE3E10E24B;
 Mon,  1 Jul 2024 06:31:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4587995716763109254=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_PSR_testing_improvement_by_?=
 =?utf-8?q?checking_sink_status?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Jul 2024 06:31:08 -0000
Message-ID: <171981546851.1690.6085709470546854595@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701051301.3344927-1-jouni.hogander@intel.com>
In-Reply-To: <20240701051301.3344927-1-jouni.hogander@intel.com>
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

--===============4587995716763109254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PSR testing improvement by checking sink status
URL   : https://patchwork.freedesktop.org/series/135581/
State : success

== Summary ==

CI Bug Log - changes from IGT_7908 -> IGTPW_11344
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): fi-glk-j4005 fi-snb-2520m fi-kbl-8809g 

Known issues
------------

  Here are the changes found in IGTPW_11344 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@client:
    - bat-arls-1:         [DMESG-WARN][1] ([i915#10341]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/bat-arls-1/igt@i915_selftest@live@client.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/bat-arls-1/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@execlists:
    - bat-arls-1:         [DMESG-FAIL][3] ([i915#10262]) -> [PASS][4] +11 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/bat-arls-1/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/bat-arls-1/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [ABORT][5] ([i915#9500]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
    - bat-dg2-8:          [FAIL][7] ([i915#11379]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html

  
  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11379]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11379
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7908 -> IGTPW_11344

  CI-20190529: 20190529
  CI_DRM_15013: 0318a12ff6fb8c321458aa2b373e9322896ee951 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11344: 11344
  IGT_7908: 7908

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/index.html

--===============4587995716763109254==
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
<tr><td><b>Series:</b></td><td>PSR testing improvement by checking sink status</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135581/">https://patchwork.freedesktop.org/series/135581/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7908 -&gt; IGTPW_11344</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): fi-glk-j4005 fi-snb-2520m fi-kbl-8809g </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11344 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/bat-arls-1/igt@i915_selftest@live@client.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/bat-arls-1/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/bat-arls-1/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/bat-arls-1/igt@i915_selftest@live@execlists.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/bat-arls-2/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11379">i915#11379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11344/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7908 -&gt; IGTPW_11344</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15013: 0318a12ff6fb8c321458aa2b373e9322896ee951 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11344: 11344<br />
  IGT_7908: 7908</p>

</body>
</html>

--===============4587995716763109254==--
