Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA75C02182
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 01:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB0610E110;
	Wed, 22 Jan 2025 01:45:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9715C10E0F3;
 Wed, 22 Jan 2025 01:45:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2205823151468229177=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_igt=5Frunner=27s_cmdlin?=
 =?utf-8?q?e_to_results_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 Jan 2025 01:45:48 -0000
Message-ID: <173751034861.2843429.758902358360854781@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
In-Reply-To: <20250121225733.808978-1-lucas.demarchi@intel.com>
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

--===============2205823151468229177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add igt_runner's cmdline to results (rev2)
URL   : https://patchwork.freedesktop.org/series/143699/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8204_BAT -> XEIGTPW_12476_BAT
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

  Here are the changes found in XEIGTPW_12476_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@bind-execqueues-independent:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970] / [Intel XE#4078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12476/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-userptr-rebind:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#4078]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12476/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078


Build changes
-------------

  * IGT: IGT_8204 -> IGTPW_12476
  * Linux: xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e -> xe-2524-44010d7f04695da899c2860de32625a71011fbab

  IGTPW_12476: 12476
  IGT_8204: b8f853f36eed19149b36e5d70c63095c6da12ffe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e: 1895bff23f876faf3d3be7da46172eb4bb49453e
  xe-2524-44010d7f04695da899c2860de32625a71011fbab: 44010d7f04695da899c2860de32625a71011fbab

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12476/index.html

--===============2205823151468229177==
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
<tr><td><b>Series:</b></td><td>Add igt_runner&#x27;s cmdline to results (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143699/">https://patchwork.freedesktop.org/series/143699/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12476/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12476/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8204_BAT -&gt; XEIGTPW_12476_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12476_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12476/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12476/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8204 -&gt; IGTPW_12476</li>
<li>Linux: xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e -&gt; xe-2524-44010d7f04695da899c2860de32625a71011fbab</li>
</ul>
<p>IGTPW_12476: 12476<br />
  IGT_8204: b8f853f36eed19149b36e5d70c63095c6da12ffe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e: 1895bff23f876faf3d3be7da46172eb4bb49453e<br />
  xe-2524-44010d7f04695da899c2860de32625a71011fbab: 44010d7f04695da899c2860de32625a71011fbab</p>

</body>
</html>

--===============2205823151468229177==--
