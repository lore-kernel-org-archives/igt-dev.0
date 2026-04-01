Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAE3D35154
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 07:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2586010EC14;
	Wed,  1 Apr 2026 07:44:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B3010EC14;
 Wed,  1 Apr 2026 07:44:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7234436449863346686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Skip_runtime_PM_active_check_on_headless_systems?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 01 Apr 2026 07:44:45 -0000
Message-ID: <177502948541.421728.10270003748184069733@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331181606.22367-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260331181606.22367-1-mohammed.thasleem@intel.com>
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

--===============7234436449863346686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Skip runtime PM active check on headless systems
URL   : https://patchwork.freedesktop.org/series/164192/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8839_FULL -> XEIGTPW_14898_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14898_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#6266]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#2142]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_multi_queue@many-queues-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#6874])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-close-fd.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          [SKIP][8] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][9] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-6/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          [SKIP][10] ([Intel XE#977]) -> [SKIP][11] ([Intel XE#7590] / [Intel XE#977])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-8/igt@xe_pat@pat-index-xelp.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          [SKIP][12] ([Intel XE#979]) -> [SKIP][13] ([Intel XE#7590] / [Intel XE#979])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-6/igt@xe_pat@pat-index-xelpg.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-1/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8839 -> IGTPW_14898
  * Linux: xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d -> xe-4829-278bbcb469a2ab0d521e910e4ecefc8372a05c1e

  IGTPW_14898: a04ec4a6af9722203d46a6c6e0af392448e52643 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8839: 8839
  xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d: e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d
  xe-4829-278bbcb469a2ab0d521e910e4ecefc8372a05c1e: 278bbcb469a2ab0d521e910e4ecefc8372a05c1e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/index.html

--===============7234436449863346686==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Skip runtime PM active check on headless systems</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164192/">https://patchwork.freedesktop.org/series/164192/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8839_FULL -&gt; XEIGTPW_14898_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14898_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-8/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-6/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14898/shard-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8839 -&gt; IGTPW_14898</li>
<li>Linux: xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d -&gt; xe-4829-278bbcb469a2ab0d521e910e4ecefc8372a05c1e</li>
</ul>
<p>IGTPW_14898: a04ec4a6af9722203d46a6c6e0af392448e52643 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8839: 8839<br />
  xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d: e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d<br />
  xe-4829-278bbcb469a2ab0d521e910e4ecefc8372a05c1e: 278bbcb469a2ab0d521e910e4ecefc8372a05c1e</p>

</body>
</html>

--===============7234436449863346686==--
