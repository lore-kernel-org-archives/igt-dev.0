Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DC6CD343F
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 20:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB9010E2C3;
	Tue, 12 May 2026 20:02:01 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C5B10E29D;
 Tue, 12 May 2026 20:01:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0054851055905991641=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv1?=
 =?utf-8?q?=2C1/1=5D_tests/intel/xe=5Fexec=5Fbasic=3A_skip_test_when_no_GTs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Legowski" <jakub.legowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 20:01:44 -0000
Message-ID: <177861610497.63850.2854866558010530090@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511133359.198762-1-jakub.legowski@intel.com>
In-Reply-To: <20260511133359.198762-1-jakub.legowski@intel.com>
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

--===============0054851055905991641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v1,1/1] tests/intel/xe_exec_basic: skip test when no GTs
URL   : https://patchwork.freedesktop.org/series/166396/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8906_BAT -> XEIGTPW_15163_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in XEIGTPW_15163_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][1] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vm:        NOTRUN -> [SKIP][2] ([Intel XE#5563] / [Intel XE#688])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][3] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vm:        NOTRUN -> [SKIP][4] ([Intel XE#2229] / [Intel XE#5488])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-vm:        NOTRUN -> [SKIP][5] ([Intel XE#1008] / [Intel XE#5591])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        NOTRUN -> [SKIP][6] ([Intel XE#977])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-vm:        NOTRUN -> [SKIP][7] ([Intel XE#2838] / [Intel XE#979])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-vm:        NOTRUN -> [SKIP][8] ([Intel XE#979])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8906 -> IGTPW_15163
  * Linux: xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472 -> xe-5049-5297e46fb8ee731657b6cbae24b3cde8ad094aa5

  IGTPW_15163: 869b268bded68eb2c983b25d44e9fcebd3279b5b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8906: 6c27cc975b64ea72a6f46aa53cb3201fb73ce7cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472: 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472
  xe-5049-5297e46fb8ee731657b6cbae24b3cde8ad094aa5: 5297e46fb8ee731657b6cbae24b3cde8ad094aa5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/index.html

--===============0054851055905991641==
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
<tr><td><b>Series:</b></td><td>series starting with [v1,1/1] tests/intel/xe_exec_basic: skip test when no GTs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166396/">https://patchwork.freedesktop.org/series/166396/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8906_BAT -&gt; XEIGTPW_15163_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15163_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15163/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8906 -&gt; IGTPW_15163</li>
<li>Linux: xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472 -&gt; xe-5049-5297e46fb8ee731657b6cbae24b3cde8ad094aa5</li>
</ul>
<p>IGTPW_15163: 869b268bded68eb2c983b25d44e9fcebd3279b5b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8906: 6c27cc975b64ea72a6f46aa53cb3201fb73ce7cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472: 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472<br />
  xe-5049-5297e46fb8ee731657b6cbae24b3cde8ad094aa5: 5297e46fb8ee731657b6cbae24b3cde8ad094aa5</p>

</body>
</html>

--===============0054851055905991641==--
