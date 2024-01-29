Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEFCC47DA9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 12:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC10F10E99A;
	Mon, 29 Jan 2024 12:14:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A7C10E99A;
 Mon, 29 Jan 2024 12:14:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2230503367755329880=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fexec=5Fatomic?=
 =?utf-8?q?=3A_Skip_on_unsupported_config_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Mon, 29 Jan 2024 12:14:34 -0000
Message-ID: <170653047481.790842.2468232645516628639@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129080155.31648-1-nirmoy.das@intel.com>
In-Reply-To: <20240129080155.31648-1-nirmoy.das@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============2230503367755329880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_atomic: Skip on unsupported config (rev2)
URL   : https://patchwork.freedesktop.org/series/129253/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7697_BAT -> XEIGTPW_10598_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10598_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_atomic@basic-inc-all}:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7697/bat-dg2-oem2/igt@xe_exec_atomic@basic-inc-all.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/bat-dg2-oem2/igt@xe_exec_atomic@basic-inc-all.html
    - bat-atsm-2:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7697/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10598_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_exec_atomic@basic-dec-all}:
    - bat-pvc-2:          [SKIP][5] ([Intel XE#1172]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7697/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#1033]) -> [DMESG-FAIL][8] ([Intel XE#1033])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7697/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1172


Build changes
-------------

  * IGT: IGT_7697 -> IGTPW_10598
  * Linux: xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a -> xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82

  IGTPW_10598: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10598/index.html
  IGT_7697: b0cc8160ebdc87ce08b7fd83bb3c99ff7a4d8610 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a
  xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82: a0325b172ae7077c52b074d9b531f4e3aa585d82

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/index.html

--===============2230503367755329880==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_atomic: Skip on unsupported config (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129253/">https://patchwork.freedesktop.org/series/129253/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7697_BAT -&gt; XEIGTPW_10598_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10598_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_atomic@basic-inc-all}:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7697/bat-dg2-oem2/igt@xe_exec_atomic@basic-inc-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/bat-dg2-oem2/igt@xe_exec_atomic@basic-inc-all.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7697/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10598_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_exec_atomic@basic-dec-all}:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7697/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1172">Intel XE#1172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7697/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10598/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7697 -&gt; IGTPW_10598</li>
<li>Linux: xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a -&gt; xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82</li>
</ul>
<p>IGTPW_10598: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10598/index.html<br />
  IGT_7697: b0cc8160ebdc87ce08b7fd83bb3c99ff7a4d8610 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a<br />
  xe-696-a0325b172ae7077c52b074d9b531f4e3aa585d82: a0325b172ae7077c52b074d9b531f4e3aa585d82</p>

</body>
</html>

--===============2230503367755329880==--
