Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD39FEB26F7
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 18:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3958610E5F1;
	Tue, 10 Feb 2026 18:30:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6981610E5F2;
 Tue, 10 Feb 2026 18:30:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3477211612507694232=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fsys?=
 =?utf-8?q?tem=5Fallocator=3A_Add_helpers_to_enable_and_reset_hugepages_for_?=
 =?utf-8?q?test_execution?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Feb 2026 18:30:34 -0000
Message-ID: <177074823441.242846.10137845287103701813@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210103436.739323-1-nishit.sharma@intel.com>
In-Reply-To: <20260210103436.739323-1-nishit.sharma@intel.com>
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

--===============3477211612507694232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Add helpers to enable and reset hugepages for test execution
URL   : https://patchwork.freedesktop.org/series/161428/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8746_BAT -> XEIGTPW_14529_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14529_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14529_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14529_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8746/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14529/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  


Build changes
-------------

  * IGT: IGT_8746 -> IGTPW_14529
  * Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 -> xe-4540-83567893a1553b91cc76ab3bff0579f521e17861

  IGTPW_14529: 2a4a8ba3c629acd1efd775363316065d46c268d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8746: 8746
  xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2
  xe-4540-83567893a1553b91cc76ab3bff0579f521e17861: 83567893a1553b91cc76ab3bff0579f521e17861

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14529/index.html

--===============3477211612507694232==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Add helpers to enable and reset hugepages for test execution</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161428/">https://patchwork.freedesktop.org/series/161428/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14529/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14529/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8746_BAT -&gt; XEIGTPW_14529_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14529_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14529_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14529_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8746/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14529/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8746 -&gt; IGTPW_14529</li>
<li>Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 -&gt; xe-4540-83567893a1553b91cc76ab3bff0579f521e17861</li>
</ul>
<p>IGTPW_14529: 2a4a8ba3c629acd1efd775363316065d46c268d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8746: 8746<br />
  xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2<br />
  xe-4540-83567893a1553b91cc76ab3bff0579f521e17861: 83567893a1553b91cc76ab3bff0579f521e17861</p>

</body>
</html>

--===============3477211612507694232==--
