Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3341DCDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 10:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34D710E09B;
	Wed, 24 Jun 2026 10:39:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908A510E063;
 Wed, 24 Jun 2026 10:39:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5507483442565421678=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tools=3A_remove_unnecessary?=
 =?utf-8?q?_shared_library?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Jun 2026 10:39:26 -0000
Message-ID: <178229756658.110778.10776541817763261152@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
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

--===============5507483442565421678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools: remove unnecessary shared library
URL   : https://patchwork.freedesktop.org/series/169086/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8982_BAT -> XEIGTPW_15438_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  Additional (1): bat-ptl-vm 
  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_15438_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         NOTRUN -> [SKIP][1] ([Intel XE#5764]) +10 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - bat-ptl-vm:         NOTRUN -> [SKIP][2] ([Intel XE#7482]) +17 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - bat-ptl-vm:         NOTRUN -> [SKIP][3] ([Intel XE#8364]) +13 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [PASS][4] -> [ABORT][5] ([Intel XE#8007] / [Intel XE#8023]) +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8982/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-ptl-vm:         NOTRUN -> [SKIP][6] ([Intel XE#5775])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-vm:         NOTRUN -> [SKIP][7] ([Intel XE#5776])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         NOTRUN -> [SKIP][8] ([Intel XE#5777] / [Intel XE#7590])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-vm:         NOTRUN -> [SKIP][9] ([Intel XE#5771] / [Intel XE#7590])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         NOTRUN -> [SKIP][10] ([Intel XE#5780] / [Intel XE#7590])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364


Build changes
-------------

  * IGT: IGT_8982 -> IGTPW_15438
  * Linux: xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36 -> xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82

  IGTPW_15438: d3aa1e1874101fcf8fafc97fe59758d5ee66eb60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8982: 48befce9e6b0c0d371c4812bfff34a61319f68f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36: e7cd62086ec5a70cefb8b8b00964096692bfab36
  xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82: b2817f6a1517bc9ecdef5229b84e8a44d983de82

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/index.html

--===============5507483442565421678==
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
<tr><td><b>Series:</b></td><td>tools: remove unnecessary shared library</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169086/">https://patchwork.freedesktop.org/series/169086/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8982_BAT -&gt; XEIGTPW_15438_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>Additional (1): bat-ptl-vm <br />
  Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15438_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8982/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15438/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8982 -&gt; IGTPW_15438</li>
<li>Linux: xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36 -&gt; xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82</li>
</ul>
<p>IGTPW_15438: d3aa1e1874101fcf8fafc97fe59758d5ee66eb60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8982: 48befce9e6b0c0d371c4812bfff34a61319f68f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36: e7cd62086ec5a70cefb8b8b00964096692bfab36<br />
  xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82: b2817f6a1517bc9ecdef5229b84e8a44d983de82</p>

</body>
</html>

--===============5507483442565421678==--
