Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BC3C2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 04:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A7610E134;
	Mon,  5 Jan 2026 04:49:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD8D10E134;
 Mon,  5 Jan 2026 04:49:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8396190040728307011=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fres?=
 =?utf-8?q?et=3A_Add_spin-deadline_section?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Jan 2026 04:49:46 -0000
Message-ID: <176758858691.124887.17330900351565755784@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105035325.1306847-1-matthew.brost@intel.com>
In-Reply-To: <20260105035325.1306847-1-matthew.brost@intel.com>
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

--===============8396190040728307011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_reset: Add spin-deadline section
URL   : https://patchwork.freedesktop.org/series/159616/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8681_BAT -> XEIGTPW_14281_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14281_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14281/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8681 -> IGTPW_14281
  * Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -> xe-4326-5fc5192372599f11da8dee072fd8beb4414f8eca

  IGTPW_14281: 14281
  IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1f3db65eb346d9babb
  xe-4326-5fc5192372599f11da8dee072fd8beb4414f8eca: 5fc5192372599f11da8dee072fd8beb4414f8eca

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14281/index.html

--===============8396190040728307011==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_reset: Add spin-deadline section</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159616/">https://patchwork.freedesktop.org/series/159616/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14281/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14281/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8681_BAT -&gt; XEIGTPW_14281_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14281_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14281/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8681 -&gt; IGTPW_14281</li>
<li>Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -&gt; xe-4326-5fc5192372599f11da8dee072fd8beb4414f8eca</li>
</ul>
<p>IGTPW_14281: 14281<br />
  IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1f3db65eb346d9babb<br />
  xe-4326-5fc5192372599f11da8dee072fd8beb4414f8eca: 5fc5192372599f11da8dee072fd8beb4414f8eca</p>

</body>
</html>

--===============8396190040728307011==--
