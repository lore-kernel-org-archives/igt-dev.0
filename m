Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7DF606A33B
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 15:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1F110F6B0;
	Tue, 27 Oct 2026 15:51:31 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C8410F6B0;
 Tue, 27 Oct 2026 15:50:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0467478221360760740=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_tests_for_a?=
 =?utf-8?q?mdgpu_userq_list_and_change_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Francis" <david.francis@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Oct 2026 15:50:39 -0000
Message-ID: <179311623992.77490.10670549151067136700@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027140633.2184445-1-David.Francis@amd.com>
In-Reply-To: <20261027140633.2184445-1-David.Francis@amd.com>
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

--===============0467478221360760740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: tests for amdgpu userq list and change (rev2)
URL   : https://patchwork.freedesktop.org/series/176502/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9167_BAT -> XEIGTPW_16053_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_16053_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2] ([Intel XE#9663]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9167/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16053/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
  [Intel XE#9663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663


Build changes
-------------

  * IGT: IGT_9167 -> IGTPW_16053
  * Linux: xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e -> xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32

  IGTPW_16053: 16053
  IGT_9167: 9167
  xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e: d645db52a6b60d0f0d921077f0233085b41b3a1e
  xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16053/index.html

--===============0467478221360760740==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: tests for amdgpu userq list and change (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176502/">https://patchwork.freedesktop.org/series/176502/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16053/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16053/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9167_BAT -&gt; XEIGTPW_16053_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16053_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9167/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16053/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663">Intel XE#9663</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9167 -&gt; IGTPW_16053</li>
<li>Linux: xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e -&gt; xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32</li>
</ul>
<p>IGTPW_16053: 16053<br />
  IGT_9167: 9167<br />
  xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e: d645db52a6b60d0f0d921077f0233085b41b3a1e<br />
  xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32</p>

</body>
</html>

--===============0467478221360760740==--
