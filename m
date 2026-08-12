Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5FEC5CFCF
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 13:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A75610EFE4;
	Wed, 12 Aug 2026 13:38:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4521610EFDF;
 Wed, 12 Aug 2026 13:38:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3709959137081773191=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_intel-ci=3A_Move_hotunplug_?=
 =?utf-8?q?subtest_to_the_end_of_xe=2Efastfeedback_testlist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: aditya.chauhan@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Aug 2026 13:38:18 -0000
Message-ID: <178654189827.43868.8081815896389045454@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260812103912.1481362-1-aditya.chauhan@intel.com>
In-Reply-To: <20260812103912.1481362-1-aditya.chauhan@intel.com>
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

--===============3709959137081773191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Move hotunplug subtest to the end of xe.fastfeedback testlist
URL   : https://patchwork.freedesktop.org/series/172064/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9052_BAT -> XEIGTPW_15663_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-nvls-1 

Known issues
------------

  Here are the changes found in XEIGTPW_15663_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-small-multi-vm:
    - bat-nvls-2:         NOTRUN -> [SKIP][1] ([Intel XE#8777]) +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_live_ktest@xe_bo:
    - bat-nvls-2:         NOTRUN -> [SKIP][2] ([Intel XE#8792])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/bat-nvls-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-nvls-2:         NOTRUN -> [SKIP][3] ([Intel XE#8791] / [Intel XE#8792])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-nvls-2:         NOTRUN -> [SKIP][4] ([Intel XE#8791])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
  [Intel XE#8777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777
  [Intel XE#8791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791
  [Intel XE#8792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792


Build changes
-------------

  * IGT: IGT_9052 -> IGTPW_15663
  * Linux: xe-5578-aabf41c0ea0ad661a2e384e51955b24343f6ca25 -> xe-5580-96ddbb14986632af742523e68f90d51c138c57f0

  IGTPW_15663: 162b764a2c5a294ff3fd49fc040f0db70fc5f735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9052: 9052
  xe-5578-aabf41c0ea0ad661a2e384e51955b24343f6ca25: aabf41c0ea0ad661a2e384e51955b24343f6ca25
  xe-5580-96ddbb14986632af742523e68f90d51c138c57f0: 96ddbb14986632af742523e68f90d51c138c57f0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/index.html

--===============3709959137081773191==
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
<tr><td><b>Series:</b></td><td>intel-ci: Move hotunplug subtest to the end of xe.fastfeedback testlist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172064/">https://patchwork.freedesktop.org/series/172064/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9052_BAT -&gt; XEIGTPW_15663_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15663_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777">Intel XE#8777</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/bat-nvls-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15663/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9052 -&gt; IGTPW_15663</li>
<li>Linux: xe-5578-aabf41c0ea0ad661a2e384e51955b24343f6ca25 -&gt; xe-5580-96ddbb14986632af742523e68f90d51c138c57f0</li>
</ul>
<p>IGTPW_15663: 162b764a2c5a294ff3fd49fc040f0db70fc5f735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9052: 9052<br />
  xe-5578-aabf41c0ea0ad661a2e384e51955b24343f6ca25: aabf41c0ea0ad661a2e384e51955b24343f6ca25<br />
  xe-5580-96ddbb14986632af742523e68f90d51c138c57f0: 96ddbb14986632af742523e68f90d51c138c57f0</p>

</body>
</html>

--===============3709959137081773191==--
