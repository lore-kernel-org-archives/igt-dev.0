Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F302606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 16:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D7D10E257;
	Fri, 30 Oct 2026 16:05:23 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C1010E257;
 Fri, 30 Oct 2026 16:04:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2004093137160490958=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fatomic=5Freset?=
 =?utf-8?q?=3A_Add_tests_for_DRM=5FMODE=5FATOMIC=5FRESET_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Oct 2026 16:04:28 -0000
Message-ID: <179337626867.95051.7005990941782888864@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030105135.268065-1-mripard@kernel.org>
In-Reply-To: <20261030105135.268065-1-mripard@kernel.org>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2004093137160490958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_reset: Add tests for DRM_MODE_ATOMIC_RESET (rev3)
URL   : https://patchwork.freedesktop.org/series/174250/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9172_BAT -> XEIGTPW_16078_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-nvls-2 

Known issues
------------

  Here are the changes found in XEIGTPW_16078_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([Intel XE#288]) +32 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16078/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-atsm-2:         [ABORT][2] ([Intel XE#9663]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9172/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16078/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#9663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663


Build changes
-------------

  * IGT: IGT_9172 -> IGTPW_16078

  IGTPW_16078: 16078
  IGT_9172: 9172
  xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9: eea36991e0c743ff65da0735c827bb8d57de78f9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16078/index.html

--===============2004093137160490958==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_reset: Add tests for DRM_MODE_ATOMIC_RESET (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174250/">https://patchwork.freedesktop.org/series/174250/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16078/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16078/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9172_BAT -&gt; XEIGTPW_16078_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-nvls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16078_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-prefetch:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16078/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9172/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663">Intel XE#9663</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16078/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9172 -&gt; IGTPW_16078</li>
</ul>
<p>IGTPW_16078: 16078<br />
  IGT_9172: 9172<br />
  xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9: eea36991e0c743ff65da0735c827bb8d57de78f9</p>

</body>
</html>

--===============2004093137160490958==--
