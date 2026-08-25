Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1802BC5DF81
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 00:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF77A10E189;
	Tue, 25 Aug 2026 00:33:51 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D2910E189;
 Tue, 25 Aug 2026 00:33:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7733217418341061109=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fdebug=3A_f?=
 =?utf-8?q?ix_NULL_dereference_in_GT_register-save-restore_debugfs_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Aug 2026 00:33:14 -0000
Message-ID: <178761799459.80933.8695370632805236177@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260824105249.503725-1-nishit.sharma@intel.com>
In-Reply-To: <20260824105249.503725-1-nishit.sharma@intel.com>
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

--===============7733217418341061109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_debug: fix NULL dereference in GT register-save-restore debugfs check
URL   : https://patchwork.freedesktop.org/series/172663/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9071_BAT -> XEIGTPW_15724_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15724_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15724_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15724_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue:
    - bat-wcl-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9071/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15724/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15724_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][3] ([Intel XE#8762]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9071/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15724/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762


Build changes
-------------

  * IGT: IGT_9071 -> IGTPW_15724
  * Linux: xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762 -> xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad

  IGTPW_15724: 15724
  IGT_9071: 9071
  xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762: b830d7b865d1dcc0c199feef72cbe7bf7b208762
  xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15724/index.html

--===============7733217418341061109==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_debug: fix NULL dereference in GT register-save-restore debugfs check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172663/">https://patchwork.freedesktop.org/series/172663/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15724/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15724/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9071_BAT -&gt; XEIGTPW_15724_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15724_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15724_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15724_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9071/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15724/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15724_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9071/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15724/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9071 -&gt; IGTPW_15724</li>
<li>Linux: xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762 -&gt; xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad</li>
</ul>
<p>IGTPW_15724: 15724<br />
  IGT_9071: 9071<br />
  xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762: b830d7b865d1dcc0c199feef72cbe7bf7b208762<br />
  xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad</p>

</body>
</html>

--===============7733217418341061109==--
