Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C6C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 23:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B635A10E29B;
	Mon, 17 Feb 2025 23:42:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BCB10E22A;
 Mon, 17 Feb 2025 23:42:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3546633868599686430=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_PMU_tests_to_validate_e?=
 =?utf-8?q?ngine_activity_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Feb 2025 23:42:56 -0000
Message-ID: <173983577627.3400696.12614638705445415196@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217142021.951467-1-riana.tauro@intel.com>
In-Reply-To: <20250217142021.951467-1-riana.tauro@intel.com>
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

--===============3546633868599686430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PMU tests to validate engine activity (rev3)
URL   : https://patchwork.freedesktop.org/series/144711/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8235_BAT -> XEIGTPW_12618_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12618_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3:
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#877]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:
    - bat-adlp-vf:        [DMESG-WARN][5] ([Intel XE#3970]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8235 -> IGTPW_12618
  * Linux: xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5 -> xe-2677-c282b8face163244076dac30e4c9ffd74dc89044

  IGTPW_12618: 12618
  IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5
  xe-2677-c282b8face163244076dac30e4c9ffd74dc89044: c282b8face163244076dac30e4c9ffd74dc89044

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/index.html

--===============3546633868599686430==
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
<tr><td><b>Series:</b></td><td>Add PMU tests to validate engine activity (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144711/">https://patchwork.freedesktop.org/series/144711/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8235_BAT -&gt; XEIGTPW_12618_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12618_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@render@render-xmajor-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12618/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8235 -&gt; IGTPW_12618</li>
<li>Linux: xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5 -&gt; xe-2677-c282b8face163244076dac30e4c9ffd74dc89044</li>
</ul>
<p>IGTPW_12618: 12618<br />
  IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5<br />
  xe-2677-c282b8face163244076dac30e4c9ffd74dc89044: c282b8face163244076dac30e4c9ffd74dc89044</p>

</body>
</html>

--===============3546633868599686430==--
