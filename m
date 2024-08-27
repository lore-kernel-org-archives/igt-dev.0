Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646B6C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 18:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8F010E407;
	Tue, 27 Aug 2024 18:11:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B5F10E3FF;
 Tue, 27 Aug 2024 18:11:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0469183126675477692=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel/xe=5Fexec=5Ffault?=
 =?utf-8?q?=5Fmode=3A_Don=27t_return_early_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Aug 2024 18:11:48 -0000
Message-ID: <172478230812.807790.8600017685780496101@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827144837.19718-1-nirmoy.das@intel.com>
In-Reply-To: <20240827144837.19718-1-nirmoy.das@intel.com>
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

--===============0469183126675477692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_fault_mode: Don't return early (rev2)
URL   : https://patchwork.freedesktop.org/series/137836/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7993_BAT -> XEIGTPW_11646_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11646_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11646_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11646_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11646_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#324]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-adlp-7:         [DMESG-WARN][5] -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7993 -> IGTPW_11646
  * Linux: xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b -> xe-1837-2c3fbd94c8b2eda2275211dfa8ead639a4e3e161

  IGTPW_11646: a39cfe9b9122645f83de0ece652e2a81591d95d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b: 0f7dbe16a23882ef9c928d9650ea0613925e710b
  xe-1837-2c3fbd94c8b2eda2275211dfa8ead639a4e3e161: 2c3fbd94c8b2eda2275211dfa8ead639a4e3e161

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/index.html

--===============0469183126675477692==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_fault_mode: Don&#x27;t return early (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137836/">https://patchwork.freedesktop.org/series/137836/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7993_BAT -&gt; XEIGTPW_11646_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11646_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11646_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11646_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11646_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7993 -&gt; IGTPW_11646</li>
<li>Linux: xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b -&gt; xe-1837-2c3fbd94c8b2eda2275211dfa8ead639a4e3e161</li>
</ul>
<p>IGTPW_11646: a39cfe9b9122645f83de0ece652e2a81591d95d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b: 0f7dbe16a23882ef9c928d9650ea0613925e710b<br />
  xe-1837-2c3fbd94c8b2eda2275211dfa8ead639a4e3e161: 2c3fbd94c8b2eda2275211dfa8ead639a4e3e161</p>

</body>
</html>

--===============0469183126675477692==--
