Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49A7CA5FA3
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 21:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB3C10E99D;
	Mon, 28 Sep 2026 21:00:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698CB10E99D;
 Mon, 28 Sep 2026 20:59:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9027898810483196466=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tools/gputop=3A_add_i915_PM?=
 =?utf-8?q?U_engine_monitoring_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 28 Sep 2026 20:59:28 -0000
Message-ID: <179062916842.215488.18060511944658965155@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
In-Reply-To: <cover.1790331690.git.sebastian.brzezinka@intel.com>
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

--===============9027898810483196466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/gputop: add i915 PMU engine monitoring (rev2)
URL   : https://patchwork.freedesktop.org/series/174991/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9114_BAT -> XEIGTPW_15910_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15910_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15910_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15910_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15910/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15910_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][3] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15910/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069


Build changes
-------------

  * IGT: IGT_9114 -> IGTPW_15910

  IGTPW_15910: e1994f6a4ab23339bcc3ae1b6357344bbd30d7cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a: 972eeb850a4ca07aba05ccb805db28a33eab2c9a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15910/index.html

--===============9027898810483196466==
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
<tr><td><b>Series:</b></td><td>tools/gputop: add i915 PMU engine monitoring (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174991/">https://patchwork.freedesktop.org/series/174991/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15910/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15910/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9114_BAT -&gt; XEIGTPW_15910_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15910_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15910_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15910_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15910/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15910_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15910/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9114 -&gt; IGTPW_15910</li>
</ul>
<p>IGTPW_15910: e1994f6a4ab23339bcc3ae1b6357344bbd30d7cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a: 972eeb850a4ca07aba05ccb805db28a33eab2c9a</p>

</body>
</html>

--===============9027898810483196466==--
