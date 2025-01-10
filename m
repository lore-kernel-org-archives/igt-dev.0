Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F421E7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 07:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AFF10EFF6;
	Fri, 10 Jan 2025 07:46:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FED10EFF6;
 Fri, 10 Jan 2025 07:46:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6581647093001140164=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fjoiner=3A?=
 =?utf-8?q?_switch_modeset_from_uj_to_bj_and_vice-versa?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jan 2025 07:46:35 -0000
Message-ID: <173649519500.1875123.5837889909238569121@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
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

--===============6581647093001140164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa
URL   : https://patchwork.freedesktop.org/series/143367/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8186_BAT -> XEIGTPW_12423_BAT
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

  Here are the changes found in XEIGTPW_12423_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-userptr-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3958])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3958]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [DMESG-WARN][5] ([Intel XE#3970]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#3958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8186 -> IGTPW_12423
  * Linux: xe-2471-0ca002b6f088ddd9bdde5630662526a50b7ef917 -> xe-2472-4c299eeff0b03f0e988491bc9102594620e67d42

  IGTPW_12423: 2132aaf8f6cffe66afb76cea4f7ee9a5328a7d9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8186: 2c6b2f0ed4075aa1ac3d341d612e41343cff4e4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2471-0ca002b6f088ddd9bdde5630662526a50b7ef917: 0ca002b6f088ddd9bdde5630662526a50b7ef917
  xe-2472-4c299eeff0b03f0e988491bc9102594620e67d42: 4c299eeff0b03f0e988491bc9102594620e67d42

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/index.html

--===============6581647093001140164==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143367/">https://patchwork.freedesktop.org/series/143367/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8186_BAT -&gt; XEIGTPW_12423_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12423_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_intel_bb@render@render-xmajor-256:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12423/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8186 -&gt; IGTPW_12423</li>
<li>Linux: xe-2471-0ca002b6f088ddd9bdde5630662526a50b7ef917 -&gt; xe-2472-4c299eeff0b03f0e988491bc9102594620e67d42</li>
</ul>
<p>IGTPW_12423: 2132aaf8f6cffe66afb76cea4f7ee9a5328a7d9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8186: 2c6b2f0ed4075aa1ac3d341d612e41343cff4e4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2471-0ca002b6f088ddd9bdde5630662526a50b7ef917: 0ca002b6f088ddd9bdde5630662526a50b7ef917<br />
  xe-2472-4c299eeff0b03f0e988491bc9102594620e67d42: 4c299eeff0b03f0e988491bc9102594620e67d42</p>

</body>
</html>

--===============6581647093001140164==--
