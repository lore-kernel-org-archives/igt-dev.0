Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19CCC55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 22:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AE210E08B;
	Wed,  5 Aug 2026 22:38:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDF910E244;
 Wed,  5 Aug 2026 22:37:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0624969213973951741=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_platform-specific_joine?=
 =?utf-8?q?r_exception_mode_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Aug 2026 22:37:32 -0000
Message-ID: <178596945204.23279.8863686193797161777@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805083454.708311-1-sowmiya.s@intel.com>
In-Reply-To: <20260805083454.708311-1-sowmiya.s@intel.com>
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

--===============0624969213973951741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add platform-specific joiner exception mode handling (rev3)
URL   : https://patchwork.freedesktop.org/series/170996/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9038_BAT -> XEIGTPW_15634_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 15)
------------------------------

  Additional (4): bat-bmg-1 bat-bmg-2 bat-ptl-vm bat-nvls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15634_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-nvls-2}:       [SKIP][1] ([Intel XE#8740]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9038/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15634_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#2134]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][4] ([Intel XE#2233])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-1:          NOTRUN -> [SKIP][5] ([Intel XE#2233])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][6] ([Intel XE#2489] / [Intel XE#3419]) +13 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          NOTRUN -> [SKIP][7] ([Intel XE#8265])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          NOTRUN -> [SKIP][8] ([Intel XE#2482]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][9] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-1:          NOTRUN -> [SKIP][10] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-2:          NOTRUN -> [SKIP][11] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         NOTRUN -> [SKIP][12] ([Intel XE#5764]) +10 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - bat-ptl-vm:         NOTRUN -> [SKIP][13] ([Intel XE#7482]) +17 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_multi_queue@exec-sanity:
    - bat-bmg-1:          NOTRUN -> [SKIP][14] ([Intel XE#8364]) +13 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - bat-ptl-vm:         NOTRUN -> [SKIP][15] ([Intel XE#8364]) +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@priority:
    - bat-bmg-2:          NOTRUN -> [SKIP][16] ([Intel XE#8364]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_exec_multi_queue@priority.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][17] ([Intel XE#2229])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          NOTRUN -> [SKIP][18] ([Intel XE#2229])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-ptl-vm:         NOTRUN -> [SKIP][19] ([Intel XE#5775])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-vm:         NOTRUN -> [SKIP][20] ([Intel XE#5776])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         NOTRUN -> [SKIP][21] ([Intel XE#5777] / [Intel XE#7590])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          NOTRUN -> [SKIP][22] ([Intel XE#1420] / [Intel XE#7590])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          NOTRUN -> [SKIP][23] ([Intel XE#1420] / [Intel XE#7590])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          NOTRUN -> [SKIP][24] ([Intel XE#2245] / [Intel XE#7590])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          NOTRUN -> [SKIP][25] ([Intel XE#2245] / [Intel XE#7590])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][26] ([Intel XE#5771] / [Intel XE#7590])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         NOTRUN -> [SKIP][27] ([Intel XE#5780] / [Intel XE#7590])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          NOTRUN -> [SKIP][28] ([Intel XE#2236] / [Intel XE#7590])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          NOTRUN -> [SKIP][29] ([Intel XE#2236] / [Intel XE#7590])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - {bat-nvls-2}:       [SKIP][30] ([Intel XE#8740]) -> [PASS][31] +38 other tests pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9038/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740
  [Intel XE#8741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741
  [Intel XE#8743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743
  [Intel XE#8744]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744
  [Intel XE#8745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745
  [Intel XE#8746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746
  [Intel XE#8747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747
  [Intel XE#8748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748
  [Intel XE#8755]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755
  [Intel XE#8756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756
  [Intel XE#8757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757
  [Intel XE#8758]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758
  [Intel XE#8759]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8759


Build changes
-------------

  * IGT: IGT_9038 -> IGTPW_15634
  * Linux: xe-5544-ae224fc6fb21a5ff9481d608839e03f1f2c13b22 -> xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18

  IGTPW_15634: 15634
  IGT_9038: 9038
  xe-5544-ae224fc6fb21a5ff9481d608839e03f1f2c13b22: ae224fc6fb21a5ff9481d608839e03f1f2c13b22
  xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18: ff9b76577dfe70713faaa2f19a30424ec9a51a18

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/index.html

--===============0624969213973951741==
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
<tr><td><b>Series:</b></td><td>Add platform-specific joiner exception mode handling (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170996/">https://patchwork.freedesktop.org/series/170996/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9038_BAT -&gt; XEIGTPW_15634_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 15)</h2>
<p>Additional (4): bat-bmg-1 bat-bmg-2 bat-ptl-vm bat-nvls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15634_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>{bat-nvls-2}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9038/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740">Intel XE#8740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15634_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@exec-sanity:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-4-tiled:<ul>
<li>{bat-nvls-2}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9038/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740">Intel XE#8740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15634/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> +38 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9038 -&gt; IGTPW_15634</li>
<li>Linux: xe-5544-ae224fc6fb21a5ff9481d608839e03f1f2c13b22 -&gt; xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18</li>
</ul>
<p>IGTPW_15634: 15634<br />
  IGT_9038: 9038<br />
  xe-5544-ae224fc6fb21a5ff9481d608839e03f1f2c13b22: ae224fc6fb21a5ff9481d608839e03f1f2c13b22<br />
  xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18: ff9b76577dfe70713faaa2f19a30424ec9a51a18</p>

</body>
</html>

--===============0624969213973951741==--
