Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69FCCA0FEB
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 13:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4B410E6A5;
	Fri, 30 Aug 2024 13:17:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041F510EA9D;
 Fri, 30 Aug 2024 13:17:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0754661941206512585=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fexec=5Ffault?=
 =?utf-8?q?=5Fmode=3A_Don=27t_return_early_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Aug 2024 13:17:43 -0000
Message-ID: <172502386300.854668.834051063185466333@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829180051.3286-1-nirmoy.das@intel.com>
In-Reply-To: <20240829180051.3286-1-nirmoy.das@intel.com>
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

--===============0754661941206512585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_fault_mode: Don't return early (rev6)
URL   : https://patchwork.freedesktop.org/series/137836/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7999_BAT -> XEIGTPW_11668_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11668_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - bat-bmg-1:          [SKIP][3] ([Intel XE#2134]) -> [PASS][4] +4 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@fbdev@write.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@fbdev@write.html

  * igt@kms_flip@basic-plain-flip:
    - bat-bmg-1:          [SKIP][5] ([Intel XE#2482]) -> [PASS][6] +3 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@kms_flip@basic-plain-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-1:          [SKIP][7] ([Intel XE#2434] / [Intel XE#2548]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-bmg-1:          [SKIP][9] ([Intel XE#2648]) -> [PASS][10] +12 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          [SKIP][11] ([Intel XE#2648]) -> [SKIP][12] ([Intel XE#2244])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@kms_dsc@dsc-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@kms_dsc@dsc-basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2648]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2648


Build changes
-------------

  * IGT: IGT_7999 -> IGTPW_11668
  * Linux: xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c -> xe-1866-2c1b4f4d497c7c28266d94a00170aad1bbaec5e3

  IGTPW_11668: d6bbfe65f78beb5af98e57ca9fb229c6b01154dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c: c9ae06dbcb2accfef0eec7d34d80063f9c97b18c
  xe-1866-2c1b4f4d497c7c28266d94a00170aad1bbaec5e3: 2c1b4f4d497c7c28266d94a00170aad1bbaec5e3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/index.html

--===============0754661941206512585==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_fault_mode: Don&#x27;t return early (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137836/">https://patchwork.freedesktop.org/series/137836/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7999_BAT -&gt; XEIGTPW_11668_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11668_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@fbdev@write.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@kms_flip@basic-plain-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2648">Intel XE#2648</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7999/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2648">Intel XE#2648</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11668/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7999 -&gt; IGTPW_11668</li>
<li>Linux: xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c -&gt; xe-1866-2c1b4f4d497c7c28266d94a00170aad1bbaec5e3</li>
</ul>
<p>IGTPW_11668: d6bbfe65f78beb5af98e57ca9fb229c6b01154dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c: c9ae06dbcb2accfef0eec7d34d80063f9c97b18c<br />
  xe-1866-2c1b4f4d497c7c28266d94a00170aad1bbaec5e3: 2c1b4f4d497c7c28266d94a00170aad1bbaec5e3</p>

</body>
</html>

--===============0754661941206512585==--
