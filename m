Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471B3D0BB7A
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 09:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CF610E8DC;
	Thu, 24 Oct 2024 09:20:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EED510E0FA;
 Thu, 24 Oct 2024 09:20:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8584657973462407673=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_rename_drm=5Ffdinfo_into_i915?=
 =?utf-8?q?=5Ffdinfo_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 24 Oct 2024 09:20:56 -0000
Message-ID: <172976165631.1325975.8167977419149148154@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
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

--===============8584657973462407673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: rename drm_fdinfo into i915_fdinfo (rev2)
URL   : https://patchwork.freedesktop.org/series/140053/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8082_full -> XEIGTPW_11967_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8082_full and XEIGTPW_11967_full:

### New IGT tests (44) ###

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_threads@threads-rebind-err:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_threads@threads-userptr-rebind-err:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_query@query-cs-cycles:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_query@query-invalid-cs-cycles:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8082 -> IGTPW_11967

  IGTPW_11967: cbdcb770dafad19d15b79ad1b4ff91819def477e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11967/index.html

--===============8584657973462407673==
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
<tr><td><b>Series:</b></td><td>rename drm_fdinfo into i915_fdinfo (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140053/">https://patchwork.freedesktop.org/series/140053/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11967/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11967/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8082_full -&gt; XEIGTPW_11967_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8082_full and XEIGTPW_11967_full:</p>
<h3>New IGT tests (44)</h3>
<ul>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind-err:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind-err:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-cs-cycles:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-cs-cycles:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8082 -&gt; IGTPW_11967</li>
</ul>
<p>IGTPW_11967: cbdcb770dafad19d15b79ad1b4ff91819def477e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52</p>

</body>
</html>

--===============8584657973462407673==--
