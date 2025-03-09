Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB25FC282D1
	for <igt-dev@archiver.kernel.org>; Sun,  9 Mar 2025 08:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD0910E012;
	Sun,  9 Mar 2025 08:34:07 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1BB10E012;
 Sun,  9 Mar 2025 08:34:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7038186057457872654=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Add_log_information_to_dc5_psr_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 09 Mar 2025 08:34:05 -0000
Message-ID: <174150924583.8450.14798374530551367062@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250226065202.84015-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250226065202.84015-1-mohammed.thasleem@intel.com>
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

--===============7038186057457872654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Add log information to dc5 psr test (rev2)
URL   : https://patchwork.freedesktop.org/series/145456/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8265_BAT -> XEIGTPW_12730_BAT
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

  Here are the changes found in XEIGTPW_12730_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#1008])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_mmap@vram.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#2468])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#3342])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@bind-execqueues-independent:
    - bat-adlp-vf:        NOTRUN -> [ABORT][4] ([Intel XE#4491])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [ABORT][5] ([Intel XE#4491]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8265/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8265 -> IGTPW_12730
  * Linux: xe-2778-f811577f424491a57b1e8669bde62998227d6907 -> xe-2779-23e0800ae0844e14894062d767edd6d50cab35f7

  IGTPW_12730: 12730
  IGT_8265: bfefe166535d69ca10d32e6ba0093260df21ee3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2778-f811577f424491a57b1e8669bde62998227d6907: f811577f424491a57b1e8669bde62998227d6907
  xe-2779-23e0800ae0844e14894062d767edd6d50cab35f7: 23e0800ae0844e14894062d767edd6d50cab35f7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/index.html

--===============7038186057457872654==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Add log information to dc5 psr test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145456/">https://patchwork.freedesktop.org/series/145456/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8265_BAT -&gt; XEIGTPW_12730_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12730_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@render@render-xmajor-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8265/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12730/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8265 -&gt; IGTPW_12730</li>
<li>Linux: xe-2778-f811577f424491a57b1e8669bde62998227d6907 -&gt; xe-2779-23e0800ae0844e14894062d767edd6d50cab35f7</li>
</ul>
<p>IGTPW_12730: 12730<br />
  IGT_8265: bfefe166535d69ca10d32e6ba0093260df21ee3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2778-f811577f424491a57b1e8669bde62998227d6907: f811577f424491a57b1e8669bde62998227d6907<br />
  xe-2779-23e0800ae0844e14894062d767edd6d50cab35f7: 23e0800ae0844e14894062d767edd6d50cab35f7</p>

</body>
</html>

--===============7038186057457872654==--
