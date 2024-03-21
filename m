Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0DCC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 07:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A06110E119;
	Thu, 21 Mar 2024 07:19:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B6810E119;
 Thu, 21 Mar 2024 07:19:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8963876330201685626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Added_invalid-va_tests_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Mar 2024 07:19:05 -0000
Message-ID: <171100554578.938557.8854548697133070674@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321055229.2705239-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240321055229.2705239-1-priyanka.dandamudi@intel.com>
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

--===============8963876330201685626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added invalid-va tests (rev2)
URL   : https://patchwork.freedesktop.org/series/131065/
State : success

== Summary ==

CI Bug Log - changes from IGT_7773 -> IGTPW_10871
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/index.html

Participating hosts (38 -> 35)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (4): bat-dg1-7 fi-cfl-8109u bat-jsl-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10871 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][1] ([i915#10462])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-kbl-8809g:       NOTRUN -> [INCOMPLETE][2] ([i915#10454])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-kbl-8809g/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][3] ([i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][5] +39 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][6] -> [ABORT][7] ([i915#7911])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][8] +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [DMESG-WARN][9] ([i915#180] / [i915#1982] / [i915#8585]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@i915_module_load@reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [WARN][11] ([i915#10436]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-apl-guc:         [ABORT][13] ([i915#10461]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@i915_selftest@live@gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - fi-apl-guc:         [DMESG-WARN][15] ([i915#9730]) -> [PASS][16] +64 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-apl-guc:         [DMESG-WARN][17] ([i915#180] / [i915#8585]) -> [PASS][18] +11 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - fi-apl-guc:         [DMESG-WARN][19] ([i915#180] / [i915#1982]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - fi-apl-guc:         [DMESG-WARN][21] ([i915#180]) -> [PASS][22] +23 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
  [i915#10454]: https://gitlab.freedesktop.org/drm/intel/issues/10454
  [i915#10461]: https://gitlab.freedesktop.org/drm/intel/issues/10461
  [i915#10462]: https://gitlab.freedesktop.org/drm/intel/issues/10462
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#9157]: https://gitlab.freedesktop.org/drm/intel/issues/9157
  [i915#9730]: https://gitlab.freedesktop.org/drm/intel/issues/9730


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7773 -> IGTPW_10871

  CI-20190529: 20190529
  CI_DRM_14459: b8290992108644cb99d7d9db2921bb25369ead3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10871: 10871
  IGT_7773: 7773


Testlist changes
----------------

+igt@xe_exec_fault_mode@invalid-va
+igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/index.html

--===============8963876330201685626==
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
<tr><td><b>Series:</b></td><td>Added invalid-va tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131065/">https://patchwork.freedesktop.org/series/131065/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7773 -&gt; IGTPW_10871</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (4): bat-dg1-7 fi-cfl-8109u bat-jsl-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10871 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10462">i915#10462</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-kbl-8809g/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10454">i915#10454</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10436">i915#10436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@i915_selftest@live@gem_contexts.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10461">i915#10461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> +64 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/fi-apl-guc/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10871/fi-apl-guc/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7773 -&gt; IGTPW_10871</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14459: b8290992108644cb99d7d9db2921bb25369ead3c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10871: 10871<br />
  IGT_7773: 7773</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_fault_mode@invalid-va<br />
+igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault</p>

</body>
</html>

--===============8963876330201685626==--
