Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA8C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 09:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5B110E9B6;
	Fri, 28 Mar 2025 09:41:28 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B07610E9B6;
 Fri, 28 Mar 2025 09:41:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5530959719536239836=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Ffb=3A_simulate_i9?=
 =?utf-8?q?15_linear_fb_behavior_on_xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Mar 2025 09:41:27 -0000
Message-ID: <174315488703.14472.9880195666262446217@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
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

--===============5530959719536239836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb: simulate i915 linear fb behavior on xe (rev2)
URL   : https://patchwork.freedesktop.org/series/146882/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8291_BAT -> XEIGTPW_12869_BAT
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

  Here are the changes found in XEIGTPW_12869_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12869/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8291 -> IGTPW_12869
  * Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -> xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0

  IGTPW_12869: 2f89a84ed0465a162ed8d65c47c377a2a2546343 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b8904066baed6a1ae874
  xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0: f823caa91ed490160b8e87792d3bb26ae3e87de0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12869/index.html

--===============5530959719536239836==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb: simulate i915 linear fb behavior on xe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146882/">https://patchwork.freedesktop.org/series/146882/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12869/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12869/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8291_BAT -&gt; XEIGTPW_12869_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12869_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12869/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8291 -&gt; IGTPW_12869</li>
<li>Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -&gt; xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0</li>
</ul>
<p>IGTPW_12869: 2f89a84ed0465a162ed8d65c47c377a2a2546343 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b8904066baed6a1ae874<br />
  xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0: f823caa91ed490160b8e87792d3bb26ae3e87de0</p>

</body>
</html>

--===============5530959719536239836==--
