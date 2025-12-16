Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C68D5C0C0
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 03:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4E10E5AA;
	Tue, 16 Dec 2025 03:56:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF57210E5AA;
 Tue, 16 Dec 2025 03:56:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1936725245899866290=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fvm=3A_Add_?=
 =?utf-8?q?drm=5Fxe=5Fvm=5Fget=5Fproperty_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 16 Dec 2025 03:56:47 -0000
Message-ID: <176585740757.91565.4768821947465675933@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215230905.164341-6-jonathan.cavitt@intel.com>
In-Reply-To: <20251215230905.164341-6-jonathan.cavitt@intel.com>
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

--===============1936725245899866290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Add drm_xe_vm_get_property tests
URL   : https://patchwork.freedesktop.org/series/159053/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8666_BAT -> XEIGTPW_14215_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14215_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14215_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14215_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - bat-ptl-1:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/bat-ptl-1/igt@runner@aborted.html
    - bat-ptl-2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/bat-ptl-2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14215_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8666/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8666 -> IGTPW_14215
  * Linux: xe-4239-c4e22b127f18ea8765c4fabc251d019dd3aa41a4 -> xe-4250-5dd9dbd1824c3a520036488257ff25a6495ac1fe

  IGTPW_14215: 1b8fa67947d88a30d3dee8f741b24e1d14eeceef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8666: 8666
  xe-4239-c4e22b127f18ea8765c4fabc251d019dd3aa41a4: c4e22b127f18ea8765c4fabc251d019dd3aa41a4
  xe-4250-5dd9dbd1824c3a520036488257ff25a6495ac1fe: 5dd9dbd1824c3a520036488257ff25a6495ac1fe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/index.html

--===============1936725245899866290==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Add drm_xe_vm_get_property tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159053/">https://patchwork.freedesktop.org/series/159053/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8666_BAT -&gt; XEIGTPW_14215_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14215_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14215_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14215_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/bat-ptl-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/bat-ptl-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14215_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8666/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14215/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8666 -&gt; IGTPW_14215</li>
<li>Linux: xe-4239-c4e22b127f18ea8765c4fabc251d019dd3aa41a4 -&gt; xe-4250-5dd9dbd1824c3a520036488257ff25a6495ac1fe</li>
</ul>
<p>IGTPW_14215: 1b8fa67947d88a30d3dee8f741b24e1d14eeceef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8666: 8666<br />
  xe-4239-c4e22b127f18ea8765c4fabc251d019dd3aa41a4: c4e22b127f18ea8765c4fabc251d019dd3aa41a4<br />
  xe-4250-5dd9dbd1824c3a520036488257ff25a6495ac1fe: 5dd9dbd1824c3a520036488257ff25a6495ac1fe</p>

</body>
</html>

--===============1936725245899866290==--
