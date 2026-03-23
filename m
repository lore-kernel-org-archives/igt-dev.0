Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8CEF483D3
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0610E59F;
	Mon, 23 Mar 2026 16:38:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D3B10E59F;
 Mon, 23 Mar 2026 16:38:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4608469779645389303=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/kms=3A_make_for=5Feach?=
 =?utf-8?q?=5Fcrtc=5Fwith=5Fsingle=5Foutput=28=29_independent_of_pipes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Mar 2026 16:38:29 -0000
Message-ID: <177428390951.387756.17439325348964641346@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1774267502.git.jani.nikula@intel.com>
In-Reply-To: <cover.1774267502.git.jani.nikula@intel.com>
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

--===============4608469779645389303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: make for_each_crtc_with_single_output() independent of pipes
URL   : https://patchwork.freedesktop.org/series/163695/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8819_BAT -> XEIGTPW_14835_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14835_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8819/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-bmg-2:          [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8819/bat-bmg-2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/bat-bmg-2/igt@xe_waitfence@reltime.html
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#6520]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8819/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8819 -> IGTPW_14835
  * Linux: xe-4762-5cb7d14d9bd2061386a0192a4649626a3e3a5ec3 -> xe-4763-ad0e76efae0da3432314b19f2d56c93149fba7e8

  IGTPW_14835: cb142a14b79e1740cae45cad1f17ae97a7a18267 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8819: 8819
  xe-4762-5cb7d14d9bd2061386a0192a4649626a3e3a5ec3: 5cb7d14d9bd2061386a0192a4649626a3e3a5ec3
  xe-4763-ad0e76efae0da3432314b19f2d56c93149fba7e8: ad0e76efae0da3432314b19f2d56c93149fba7e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/index.html

--===============4608469779645389303==
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
<tr><td><b>Series:</b></td><td>lib/kms: make for_each_crtc_with_single_output() independent of pipes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163695/">https://patchwork.freedesktop.org/series/163695/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8819_BAT -&gt; XEIGTPW_14835_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14835_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8819/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8819/bat-bmg-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/bat-bmg-2/igt@xe_waitfence@reltime.html">PASS</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8819/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14835/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8819 -&gt; IGTPW_14835</li>
<li>Linux: xe-4762-5cb7d14d9bd2061386a0192a4649626a3e3a5ec3 -&gt; xe-4763-ad0e76efae0da3432314b19f2d56c93149fba7e8</li>
</ul>
<p>IGTPW_14835: cb142a14b79e1740cae45cad1f17ae97a7a18267 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8819: 8819<br />
  xe-4762-5cb7d14d9bd2061386a0192a4649626a3e3a5ec3: 5cb7d14d9bd2061386a0192a4649626a3e3a5ec3<br />
  xe-4763-ad0e76efae0da3432314b19f2d56c93149fba7e8: ad0e76efae0da3432314b19f2d56c93149fba7e8</p>

</body>
</html>

--===============4608469779645389303==--
