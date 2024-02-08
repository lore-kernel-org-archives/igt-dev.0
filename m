Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF243C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 17:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8943310E9AB;
	Thu,  8 Feb 2024 17:03:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B199010E9AB;
 Thu,  8 Feb 2024 17:03:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3290844713414040954=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fasync=5Fflip=3A_Re?=
 =?utf-8?q?duce_the_clobbering_area_used_for_CRC_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 08 Feb 2024 17:03:06 -0000
Message-ID: <170741178673.1109599.1146784518857307247@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240208121039.13701-1-vandita.kulkarni@intel.com>
In-Reply-To: <20240208121039.13701-1-vandita.kulkarni@intel.com>
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

--===============3290844713414040954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flip: Reduce the clobbering area used for CRC test
URL   : https://patchwork.freedesktop.org/series/129666/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7706_BAT -> XEIGTPW_10650_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10650_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#906]) +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7706/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#616])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7706/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#400] / [Intel XE#616]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7706/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906


Build changes
-------------

  * IGT: IGT_7706 -> IGTPW_10650

  IGTPW_10650: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html
  IGT_7706: dd38bc402e08b8a6c9ef26a2f5b8a9a9034cb435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-748-aed7e9419a8e3775ed46af4cff2de11d7e76c960: aed7e9419a8e3775ed46af4cff2de11d7e76c960

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/index.html

--===============3290844713414040954==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flip: Reduce the clobbering area used for CRC test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129666/">https://patchwork.freedesktop.org/series/129666/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7706_BAT -&gt; XEIGTPW_10650_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10650_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7706/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7706/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7706/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10650/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7706 -&gt; IGTPW_10650</li>
</ul>
<p>IGTPW_10650: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html<br />
  IGT_7706: dd38bc402e08b8a6c9ef26a2f5b8a9a9034cb435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-748-aed7e9419a8e3775ed46af4cff2de11d7e76c960: aed7e9419a8e3775ed46af4cff2de11d7e76c960</p>

</body>
</html>

--===============3290844713414040954==--
