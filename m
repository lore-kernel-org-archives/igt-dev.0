Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8519664211223607641=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Fri, 08 Sep 2023 15:51:17 -0000
Message-ID: <169418827739.14897.12731421888010324875@emeril.freedesktop.org>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Fix_IGT_?=
 =?utf-8?q?Kunit_implementation_issues_=28rev2=29?=
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
List-ID: <igt-dev@lists.freedesktop.org>

--===============8519664211223607641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix IGT Kunit implementation issues (rev2)
URL   : https://patchwork.freedesktop.org/series/123434/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7476_BAT -> XEIGTPW_9754_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_9754_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9754_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9754_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_live_ktest@dmabuf:
    - bat-atsm-2:         [SKIP][1] ([Intel XE#483]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-atsm-2/igt@xe_live_ktest@dmabuf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-atsm-2/igt@xe_live_ktest@dmabuf.html
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#483]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html
    - bat-atsm-2:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-atsm-2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9754_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#483]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-dg2-oem2/igt@xe_live_ktest@bo.html
    - bat-atsm-2:         [SKIP][9] ([Intel XE#483]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-atsm-2/igt@xe_live_ktest@bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-atsm-2/igt@xe_live_ktest@bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483


Build changes
-------------

  * IGT: IGT_7476 -> IGTPW_9754

  IGTPW_9754: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9754/index.html
  IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68020896bdbe0cab459

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/index.html

--===============8519664211223607641==
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
<tr><td><b>Series:</b></td><td>Fix IGT Kunit implementation issues (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123434/">https://patchwork.freedesktop.org/series/123434/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7476_BAT -&gt; XEIGTPW_9754_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_9754_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9754_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9754_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_live_ktest@dmabuf:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-atsm-2/igt@xe_live_ktest@dmabuf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-atsm-2/igt@xe_live_ktest@dmabuf.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-atsm-2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9754_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-atsm-2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9754/bat-atsm-2/igt@xe_live_ktest@bo.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7476 -&gt; IGTPW_9754</li>
</ul>
<p>IGTPW_9754: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9754/index.html<br />
  IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68020896bdbe0cab459</p>

</body>
</html>

--===============8519664211223607641==--
