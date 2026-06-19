Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9A6CD98FA
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 00:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA7A10E0EA;
	Fri, 19 Jun 2026 00:34:59 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C1410E0EA;
 Fri, 19 Jun 2026 00:34:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0905907146344467109=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/intel=5Fchipset=3A_Exte?=
 =?utf-8?q?nd_intel=5Fget=5Fpci=5Fdevice_to_PCI_accelerator_class_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Jun 2026 00:34:34 -0000
Message-ID: <178182927434.94877.12241472648461809955@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618235403.396430-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260618235403.396430-1-ashutosh.dixit@intel.com>
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

--===============0905907146344467109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_chipset: Extend intel_get_pci_device to PCI accelerator class (rev5)
URL   : https://patchwork.freedesktop.org/series/168385/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8974_BAT -> XEIGTPW_15403_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15403_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15403_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15403_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-wcl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8974/bat-wcl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15403/bat-wcl-1/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_8974 -> IGTPW_15403
  * Linux: xe-5280-24209d838338d162bb25aadfd637b11747a357ca -> xe-5281-1f50384666a6193297d506b8df628ca428a48d42

  IGTPW_15403: 9ea5bb1614123c1c69f3283da4903e4f7090f71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8974: 8974
  xe-5280-24209d838338d162bb25aadfd637b11747a357ca: 24209d838338d162bb25aadfd637b11747a357ca
  xe-5281-1f50384666a6193297d506b8df628ca428a48d42: 1f50384666a6193297d506b8df628ca428a48d42

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15403/index.html

--===============0905907146344467109==
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
<tr><td><b>Series:</b></td><td>lib/intel_chipset: Extend intel_get_pci_device to PCI accelerator class (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168385/">https://patchwork.freedesktop.org/series/168385/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15403/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15403/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8974_BAT -&gt; XEIGTPW_15403_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15403_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15403_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15403_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8974/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15403/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8974 -&gt; IGTPW_15403</li>
<li>Linux: xe-5280-24209d838338d162bb25aadfd637b11747a357ca -&gt; xe-5281-1f50384666a6193297d506b8df628ca428a48d42</li>
</ul>
<p>IGTPW_15403: 9ea5bb1614123c1c69f3283da4903e4f7090f71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8974: 8974<br />
  xe-5280-24209d838338d162bb25aadfd637b11747a357ca: 24209d838338d162bb25aadfd637b11747a357ca<br />
  xe-5281-1f50384666a6193297d506b8df628ca428a48d42: 1f50384666a6193297d506b8df628ca428a48d42</p>

</body>
</html>

--===============0905907146344467109==--
