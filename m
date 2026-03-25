Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668B8106B53C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 13:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1914A10E1B4;
	Wed, 25 Mar 2026 13:44:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5D810E1EE;
 Wed, 25 Mar 2026 13:44:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6685992606543946329=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel/xe=5Fvm=3A_Add?=
 =?utf-8?q?_support_for_overcommit_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Mar 2026 13:44:18 -0000
Message-ID: <177444625894.397331.18199880400276787897@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325060339.2499618-1-sobin.thomas@intel.com>
In-Reply-To: <20260325060339.2499618-1-sobin.thomas@intel.com>
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

--===============6685992606543946329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Add support for overcommit tests (rev3)
URL   : https://patchwork.freedesktop.org/series/163579/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8824_FULL -> XEIGTPW_14846_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14846_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14846_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14846_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][1] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
New tests
---------

  New tests have been introduced between XEIGT_8824_FULL and XEIGTPW_14846_FULL:

### New IGT tests (5) ###

  * igt@xe_vm@overcommit-fault-vram-lr-fault:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@overcommit-fault-vram-lr-fault-no-overcommit:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_vm@overcommit-nonfault-vram-no-lr:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14846_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#3718] / [Intel XE#7265]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][4] ([Intel XE#301]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - shard-lnl:          [DMESG-WARN][6] -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-7/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/shard-lnl-8/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265


Build changes
-------------

  * IGT: IGT_8824 -> IGTPW_14846
  * Linux: xe-4774-0be244ee3139de3578e9acc56e1b917a4bd162cd -> xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe

  IGTPW_14846: 2af6f72c995b5c7261dd7dc1d9e96d000cd84fb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8824: 8824
  xe-4774-0be244ee3139de3578e9acc56e1b917a4bd162cd: 0be244ee3139de3578e9acc56e1b917a4bd162cd
  xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe: 14e4110238694e33cbb1e4fc54d034cd5b45f3fe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/index.html

--===============6685992606543946329==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Add support for overcommit tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163579/">https://patchwork.freedesktop.org/series/163579/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8824_FULL -&gt; XEIGTPW_14846_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14846_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14846_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14846_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@overcommit-nonfault-vram-lr-defer (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8824_FULL and XEIGTPW_14846_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-fault:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-fault-no-overcommit:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-no-lr:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14846_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_async_flips@alternate-sync-async-flip:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8824/shard-lnl-7/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14846/shard-lnl-8/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8824 -&gt; IGTPW_14846</li>
<li>Linux: xe-4774-0be244ee3139de3578e9acc56e1b917a4bd162cd -&gt; xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe</li>
</ul>
<p>IGTPW_14846: 2af6f72c995b5c7261dd7dc1d9e96d000cd84fb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8824: 8824<br />
  xe-4774-0be244ee3139de3578e9acc56e1b917a4bd162cd: 0be244ee3139de3578e9acc56e1b917a4bd162cd<br />
  xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe: 14e4110238694e33cbb1e4fc54d034cd5b45f3fe</p>

</body>
</html>

--===============6685992606543946329==--
