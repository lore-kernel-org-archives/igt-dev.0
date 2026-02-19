Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A1CE9A04A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 15:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8704A10E6FA;
	Thu, 19 Feb 2026 15:27:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1FC10E6F6;
 Thu, 19 Feb 2026 15:27:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7126390651804714460=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Close_any_open_drm_device_a?=
 =?utf-8?q?fter_engine_initialization_in_GPUTOP_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Feb 2026 15:27:42 -0000
Message-ID: <177151486235.267024.10085364745620936868@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219094804.835429-1-soham.purkait@intel.com>
In-Reply-To: <20260219094804.835429-1-soham.purkait@intel.com>
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

--===============7126390651804714460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Close any open drm device after engine initialization in GPUTOP (rev9)
URL   : https://patchwork.freedesktop.org/series/158161/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8762_BAT -> XEIGTPW_14574_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in XEIGTPW_14574_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2] ([Intel XE#7249])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][3] ([Intel XE#6566]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-bmg-3/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  
#### Possible fixes ####

  * igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p:
    - bat-bmg-3:          [INCOMPLETE][4] -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/bat-bmg-3/igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-bmg-3/igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][6] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][7] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        [SKIP][8] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][9] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249


Build changes
-------------

  * IGT: IGT_8762 -> IGTPW_14574

  IGTPW_14574: c87c09e19d314e91dbb3e76710a3f607e14ef450 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8762: d3c67e0f1fa76ac3d71095825bbc9df0d307e4fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f: c81e41f7aca96f583296a2a875f0179484b7a81f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/index.html

--===============7126390651804714460==
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
<tr><td><b>Series:</b></td><td>Close any open drm device after engine initialization in GPUTOP (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158161/">https://patchwork.freedesktop.org/series/158161/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8762_BAT -&gt; XEIGTPW_14574_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14574_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-bmg-3/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/bat-bmg-3/igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-bmg-3/igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14574/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8762 -&gt; IGTPW_14574</li>
</ul>
<p>IGTPW_14574: c87c09e19d314e91dbb3e76710a3f607e14ef450 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8762: d3c67e0f1fa76ac3d71095825bbc9df0d307e4fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f: c81e41f7aca96f583296a2a875f0179484b7a81f</p>

</body>
</html>

--===============7126390651804714460==--
