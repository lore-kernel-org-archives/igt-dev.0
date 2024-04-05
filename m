Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20C7C67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 17:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B2F10ED62;
	Fri,  5 Apr 2024 17:25:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B178510ED62;
 Fri,  5 Apr 2024 17:25:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9065535163453808827=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/device=5Freset=3A_move_l?=
 =?utf-8?q?ater_skips_into_subtests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Apr 2024 17:25:36 -0000
Message-ID: <171233793672.1239329.2354145778124088065@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405125605.10425-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240405125605.10425-1-kamil.konieczny@linux.intel.com>
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

--===============9065535163453808827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/device_reset: move later skips into subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/132040/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7801_BAT -> XEIGTPW_10984_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10984_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#616])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7801/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10984/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [TIMEOUT][3] ([Intel XE#1259] / [Intel XE#1473]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7801/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10984/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * IGT: IGT_7801 -> IGTPW_10984
  * Linux: xe-1046-5714711c6612120bd9c306824ec807d322c0735b -> xe-1047-6cdd3c6cb168eb0c12808db45124f036eca2e9a5

  IGTPW_10984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/index.html
  IGT_7801: 7801
  xe-1046-5714711c6612120bd9c306824ec807d322c0735b: 5714711c6612120bd9c306824ec807d322c0735b
  xe-1047-6cdd3c6cb168eb0c12808db45124f036eca2e9a5: 6cdd3c6cb168eb0c12808db45124f036eca2e9a5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10984/index.html

--===============9065535163453808827==
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
<tr><td><b>Series:</b></td><td>tests/device_reset: move later skips into subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132040/">https://patchwork.freedesktop.org/series/132040/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10984/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10984/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7801_BAT -&gt; XEIGTPW_10984_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10984_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7801/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10984/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7801/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10984/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7801 -&gt; IGTPW_10984</li>
<li>Linux: xe-1046-5714711c6612120bd9c306824ec807d322c0735b -&gt; xe-1047-6cdd3c6cb168eb0c12808db45124f036eca2e9a5</li>
</ul>
<p>IGTPW_10984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/index.html<br />
  IGT_7801: 7801<br />
  xe-1046-5714711c6612120bd9c306824ec807d322c0735b: 5714711c6612120bd9c306824ec807d322c0735b<br />
  xe-1047-6cdd3c6cb168eb0c12808db45124f036eca2e9a5: 6cdd3c6cb168eb0c12808db45124f036eca2e9a5</p>

</body>
</html>

--===============9065535163453808827==--
