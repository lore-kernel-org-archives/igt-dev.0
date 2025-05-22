Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A134C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 19:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B28810E71B;
	Thu, 22 May 2025 19:30:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D312010E710;
 Thu, 22 May 2025 19:30:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3597417703362171819=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Feu=5Fstall?=
 =?utf-8?q?=3A_Skip_test_on_SR-IOV_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 May 2025 19:30:32 -0000
Message-ID: <174794223285.14856.855360100748959579@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
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

--===============3597417703362171819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_eu_stall: Skip test on SR-IOV VF
URL   : https://patchwork.freedesktop.org/series/149400/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8376_BAT -> XEIGTPW_13173_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13173_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-small-cm:
    - bat-lnl-2:          NOTRUN -> [SKIP][1] ([Intel XE#688]) +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-2:          NOTRUN -> [SKIP][2] ([Intel XE#2229]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@vram:
    - bat-lnl-2:          NOTRUN -> [SKIP][3] ([Intel XE#1416])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-2:          NOTRUN -> [SKIP][4] ([Intel XE#1420] / [Intel XE#2838])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-2:          NOTRUN -> [SKIP][5] ([Intel XE#977])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-2:          NOTRUN -> [SKIP][6] ([Intel XE#2236] / [Intel XE#979])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-2:          NOTRUN -> [SKIP][7] ([Intel XE#3342])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
    - bat-lnl-2:          [INCOMPLETE][8] ([Intel XE#4966]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8376/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html

  
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8376 -> IGTPW_13173

  IGTPW_13173: 9ba8ef47242291878a619f67df24a44816655c59 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8376: ec202132760d1c4dd968fbafbac962b08ff7289f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3129-08cbef6f5828542709e4eb2c6c74835f272a5733: 08cbef6f5828542709e4eb2c6c74835f272a5733

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/index.html

--===============3597417703362171819==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_eu_stall: Skip test on SR-IOV VF</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149400/">https://patchwork.freedesktop.org/series/149400/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8376_BAT -&gt; XEIGTPW_13173_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13173_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8376/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13173/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8376 -&gt; IGTPW_13173</li>
</ul>
<p>IGTPW_13173: 9ba8ef47242291878a619f67df24a44816655c59 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8376: ec202132760d1c4dd968fbafbac962b08ff7289f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3129-08cbef6f5828542709e4eb2c6c74835f272a5733: 08cbef6f5828542709e4eb2c6c74835f272a5733</p>

</body>
</html>

--===============3597417703362171819==--
