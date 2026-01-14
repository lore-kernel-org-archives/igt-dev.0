Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C75D31A3C
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 10:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723F7892C8;
	Wed, 14 Jan 2026 10:03:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8970892C8;
 Wed, 14 Jan 2026 10:03:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3121571191422572751=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Extend_multi_queue_feature_?=
 =?utf-8?q?validation_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Jan 2026 10:03:50 -0000
Message-ID: <176838503081.153896.3609779377523576706@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
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

--===============3121571191422572751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend multi queue feature validation support (rev3)
URL   : https://patchwork.freedesktop.org/series/159287/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8700_BAT -> XEIGTPW_14340_BAT
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

  Here are the changes found in XEIGTPW_14340_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [SKIP][4] ([Intel XE#261] / [Intel XE#688]) +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        [SKIP][5] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [SKIP][6] ([Intel XE#261] / [Intel XE#688]) +9 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-adlp-vm:        [SKIP][7] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][8] ([Intel XE#288]) +32 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][9] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][10] ([Intel XE#288]) +32 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_8700 -> IGTPW_14340

  IGTPW_14340: 14340
  IGT_8700: 8700
  xe-4381-128c57f68ef105cefa8e8e3dd7078f275d59fd4a: 128c57f68ef105cefa8e8e3dd7078f275d59fd4a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/index.html

--===============3121571191422572751==
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
<tr><td><b>Series:</b></td><td>Extend multi queue feature validation support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159287/">https://patchwork.freedesktop.org/series/159287/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8700_BAT -&gt; XEIGTPW_14340_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14340_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8700/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14340/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8700 -&gt; IGTPW_14340</li>
</ul>
<p>IGTPW_14340: 14340<br />
  IGT_8700: 8700<br />
  xe-4381-128c57f68ef105cefa8e8e3dd7078f275d59fd4a: 128c57f68ef105cefa8e8e3dd7078f275d59fd4a</p>

</body>
</html>

--===============3121571191422572751==--
