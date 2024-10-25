Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9B7D149C7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 16:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6349410EB1E;
	Fri, 25 Oct 2024 16:32:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1F810EB1C;
 Fri, 25 Oct 2024 16:32:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8169486963359055326=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_scripts/run-test=3A_Keep_origi?=
 =?utf-8?q?nal_prune_behaviour_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: george.zhang@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 25 Oct 2024 16:32:41 -0000
Message-ID: <172987396155.1333232.668250235599561117@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025151121.9160-1-george.zhang@amd.com>
In-Reply-To: <20241025151121.9160-1-george.zhang@amd.com>
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

--===============8169486963359055326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: scripts/run-test: Keep original prune behaviour (rev2)
URL   : https://patchwork.freedesktop.org/series/140446/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8085_BAT -> XEIGTPW_11984_BAT
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

  Here are the changes found in XEIGTPW_11984_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3230])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-bmg-2:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3230])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#2229]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-1:          NOTRUN -> [INCOMPLETE][6] ([Intel XE#2874] / [Intel XE#2998])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#2229])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          NOTRUN -> [SKIP][8] ([Intel XE#2229])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#2229]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-pvc-2:          [DMESG-WARN][10] ([Intel XE#3230]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-2:          [DMESG-WARN][12] ([Intel XE#3230]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [DMESG-WARN][14] ([Intel XE#3230]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-adlp-7:         [DMESG-WARN][16] ([Intel XE#3230]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-atsm-2:         [DMESG-WARN][18] ([Intel XE#3230]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [SKIP][20] ([Intel XE#1192]) -> [PASS][21] +2 other tests pass
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [SKIP][22] ([Intel XE#1192]) -> [PASS][23] +2 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [SKIP][24] ([Intel XE#1192]) -> [PASS][25] +2 other tests pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-bmg-1:          [SKIP][26] ([Intel XE#1192]) -> [INCOMPLETE][27] ([Intel XE#2874] / [Intel XE#2998])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-1/igt@xe_live_ktest@xe_bo.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-1/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230


Build changes
-------------

  * IGT: IGT_8085 -> IGTPW_11984
  * Linux: xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea -> xe-2129-553d1fdcca6731b35b3c6ba632a83f6cdc9fd83b

  IGTPW_11984: 33fee8f868a00d8df3855572c5be5b4b92b52ae9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8085: 3247b453e5ada80715d4689ed12f5527a0995ee6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea: 7cadd167321b3267a9803aba88f115fc9809d4ea
  xe-2129-553d1fdcca6731b35b3c6ba632a83f6cdc9fd83b: 553d1fdcca6731b35b3c6ba632a83f6cdc9fd83b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/index.html

--===============8169486963359055326==
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
<tr><td><b>Series:</b></td><td>scripts/run-test: Keep original prune behaviour (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140446/">https://patchwork.freedesktop.org/series/140446/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8085_BAT -&gt; XEIGTPW_11984_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11984_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8085/bat-bmg-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11984/bat-bmg-1/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8085 -&gt; IGTPW_11984</li>
<li>Linux: xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea -&gt; xe-2129-553d1fdcca6731b35b3c6ba632a83f6cdc9fd83b</li>
</ul>
<p>IGTPW_11984: 33fee8f868a00d8df3855572c5be5b4b92b52ae9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8085: 3247b453e5ada80715d4689ed12f5527a0995ee6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea: 7cadd167321b3267a9803aba88f115fc9809d4ea<br />
  xe-2129-553d1fdcca6731b35b3c6ba632a83f6cdc9fd83b: 553d1fdcca6731b35b3c6ba632a83f6cdc9fd83b</p>

</body>
</html>

--===============8169486963359055326==--
