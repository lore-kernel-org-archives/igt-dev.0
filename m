Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F115CA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 20:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB72110E222;
	Thu, 14 Aug 2025 20:03:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A31310E219;
 Thu, 14 Aug 2025 20:03:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7653989634858379667=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/xe/xe=5Fspin=3A_Add_add?=
 =?utf-8?q?itional_MI=5FARB=5FCHECK_to_preemptable_spin_init?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 Aug 2025 20:03:51 -0000
Message-ID: <175520183134.237772.11136328457911118986@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250814185009.52614-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250814185009.52614-2-jonathan.cavitt@intel.com>
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

--===============7653989634858379667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_spin: Add additional MI_ARB_CHECK to preemptable spin init
URL   : https://patchwork.freedesktop.org/series/152962/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8494_BAT -> XEIGTPW_13585_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13585_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8494/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8494/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][5] ([Intel XE#5783]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8494/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
    - {bat-ptl-2}:        [FAIL][7] ([Intel XE#5783]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8494/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8494 -> IGTPW_13585
  * Linux: xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb -> xe-3546-626cbc58a40f062739195b03416cd0702fae339b

  IGTPW_13585: eca77ae8703e396662501bb72e0bbee0930b49ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8494: 8494
  xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb: 7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb
  xe-3546-626cbc58a40f062739195b03416cd0702fae339b: 626cbc58a40f062739195b03416cd0702fae339b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/index.html

--===============7653989634858379667==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_spin: Add additional MI_ARB_CHECK to preemptable spin init</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152962/">https://patchwork.freedesktop.org/series/152962/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8494_BAT -&gt; XEIGTPW_13585_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13585_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8494/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8494/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8494/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8494/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13585/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8494 -&gt; IGTPW_13585</li>
<li>Linux: xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb -&gt; xe-3546-626cbc58a40f062739195b03416cd0702fae339b</li>
</ul>
<p>IGTPW_13585: eca77ae8703e396662501bb72e0bbee0930b49ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8494: 8494<br />
  xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb: 7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb<br />
  xe-3546-626cbc58a40f062739195b03416cd0702fae339b: 626cbc58a40f062739195b03416cd0702fae339b</p>

</body>
</html>

--===============7653989634858379667==--
