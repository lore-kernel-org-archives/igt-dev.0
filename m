Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEADC02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 16:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564D610EB7B;
	Fri,  7 Feb 2025 16:38:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977B510E047;
 Fri,  7 Feb 2025 16:38:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1361346624892568098=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/pciids=3A_Sync_pci_id_c?=
 =?utf-8?q?hanges_for_DG2/MTL/BMG/PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Feb 2025 16:38:04 -0000
Message-ID: <173894628461.2725377.6528884131413703676@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207001432.48524-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250207001432.48524-1-matthew.s.atwood@intel.com>
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

--===============1361346624892568098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/144333/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8224_BAT -> XEIGTPW_12558_BAT
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

  Here are the changes found in XEIGTPW_12558_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [SKIP][2] ([Intel XE#1192]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@large-split-binds-268435456:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970]) +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][6] ([Intel XE#1192])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8224 -> IGTPW_12558
  * Linux: xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380 -> xe-2613-f2401c718ce075408a723b147cac70aad2a8246f

  IGTPW_12558: 12558
  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380: a7df3eccb725a8d72f8f3ed87ee7ad9419b17380
  xe-2613-f2401c718ce075408a723b147cac70aad2a8246f: f2401c718ce075408a723b147cac70aad2a8246f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/index.html

--===============1361346624892568098==
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
<tr><td><b>Series:</b></td><td>lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144333/">https://patchwork.freedesktop.org/series/144333/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8224_BAT -&gt; XEIGTPW_12558_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12558_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-268435456:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12558/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8224 -&gt; IGTPW_12558</li>
<li>Linux: xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380 -&gt; xe-2613-f2401c718ce075408a723b147cac70aad2a8246f</li>
</ul>
<p>IGTPW_12558: 12558<br />
  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380: a7df3eccb725a8d72f8f3ed87ee7ad9419b17380<br />
  xe-2613-f2401c718ce075408a723b147cac70aad2a8246f: f2401c718ce075408a723b147cac70aad2a8246f</p>

</body>
</html>

--===============1361346624892568098==--
