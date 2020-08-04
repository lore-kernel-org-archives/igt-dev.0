Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Aug 2020 18:27:31 -0000
Message-ID: <159656565150.12581.13553899132315359411@emeril.freedesktop.org>
References: <20200804180030.70087-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200804180030.70087-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_HAX_i915/perf=3A_add_tests_for_trigger?=
 =?utf-8?q?ed_OA_reports?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0507545548=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0507545548==
Content-Type: multipart/alternative;
 boundary="===============3201898463028974852=="

--===============3201898463028974852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] HAX i915/perf: add tests for triggered OA reports
URL   : https://patchwork.freedesktop.org/series/80253/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8841 -> IGTPW_4851
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4851:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@closed-fd-and-unmapped-access} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][1] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-tgl-dsi/igt@perf@closed-fd-and-unmapped-access.html

  * {igt@perf@map-oa-buffer} (NEW):
    - fi-icl-y:           NOTRUN -> [SKIP][2] +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-icl-y/igt@perf@map-oa-buffer.html

  * {igt@perf@non-privileged-access-vaddr} (NEW):
    - fi-icl-u2:          NOTRUN -> [SKIP][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-icl-u2/igt@perf@non-privileged-access-vaddr.html
    - fi-tgl-y:           NOTRUN -> [SKIP][4] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-tgl-y/igt@perf@non-privileged-access-vaddr.html

  * {igt@perf@non-privileged-map-oa-buffer} (NEW):
    - fi-tgl-u2:          NOTRUN -> [SKIP][5] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-tgl-u2/igt@perf@non-privileged-map-oa-buffer.html

  * {igt@perf@oa-regs-not-whitelisted} (NEW):
    - fi-cml-s:           NOTRUN -> [SKIP][6] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-cml-s/igt@perf@oa-regs-not-whitelisted.html
    - fi-cml-u2:          NOTRUN -> [SKIP][7] +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-cml-u2/igt@perf@oa-regs-not-whitelisted.html

  * {igt@perf@triggered-oa-reports-paranoid-1} (NEW):
    - {fi-ehl-1}:         NOTRUN -> [SKIP][8] +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-ehl-1/igt@perf@triggered-oa-reports-paranoid-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8841 and IGTPW_4851:

### New IGT tests (9) ###

  * igt@perf@closed-fd-and-unmapped-access:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@perf@invalid-map-oa-buffer:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@perf@map-oa-buffer:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@perf@non-privileged-access-vaddr:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@perf@non-privileged-map-oa-buffer:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@perf@oa-regs-not-whitelisted:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@perf@oa-regs-whitelisted:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@perf@triggered-oa-reports-paranoid-0:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@perf@triggered-oa-reports-paranoid-1:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (45 -> 38)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5757 -> IGTPW_4851

  CI-20190529: 20190529
  CI_DRM_8841: 7530f9dbf9161936dd90afe68d6627515347e5b8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4851: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/index.html
  IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@closed-fd-and-unmapped-access
+igt@perf@invalid-map-oa-buffer
+igt@perf@map-oa-buffer
+igt@perf@non-privileged-access-vaddr
+igt@perf@non-privileged-map-oa-buffer
+igt@perf@oa-regs-not-whitelisted
+igt@perf@oa-regs-whitelisted
+igt@perf@triggered-oa-reports-paranoid-0
+igt@perf@triggered-oa-reports-paranoid-1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/index.html

--===============3201898463028974852==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] HAX i915/perf: add tests for triggered OA reports</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80253/">https://patchwork.freedesktop.org/series/80253/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8841 -&gt; IGTPW_4851</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4851:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@perf@closed-fd-and-unmapped-access} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-tgl-dsi/igt@perf@closed-fd-and-unmapped-access.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@perf@map-oa-buffer} (NEW):</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-icl-y/igt@perf@map-oa-buffer.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@perf@non-privileged-access-vaddr} (NEW):</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-icl-u2/igt@perf@non-privileged-access-vaddr.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-tgl-y/igt@perf@non-privileged-access-vaddr.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@perf@non-privileged-map-oa-buffer} (NEW):</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-tgl-u2/igt@perf@non-privileged-map-oa-buffer.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@perf@oa-regs-not-whitelisted} (NEW):</p>
<ul>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-cml-s/igt@perf@oa-regs-not-whitelisted.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-cml-u2/igt@perf@oa-regs-not-whitelisted.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@perf@triggered-oa-reports-paranoid-1} (NEW):</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/fi-ehl-1/igt@perf@triggered-oa-reports-paranoid-1.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8841 and IGTPW_4851:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@perf@closed-fd-and-unmapped-access:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-map-oa-buffer:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@map-oa-buffer:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@non-privileged-access-vaddr:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@oa-regs-not-whitelisted:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@oa-regs-whitelisted:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@triggered-oa-reports-paranoid-0:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@triggered-oa-reports-paranoid-1:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 38)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5757 -&gt; IGTPW_4851</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8841: 7530f9dbf9161936dd90afe68d6627515347e5b8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4851: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4851/index.html<br />
  IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@perf@closed-fd-and-unmapped-access<br />
+igt@perf@invalid-map-oa-buffer<br />
+igt@perf@map-oa-buffer<br />
+igt@perf@non-privileged-access-vaddr<br />
+igt@perf@non-privileged-map-oa-buffer<br />
+igt@perf@oa-regs-not-whitelisted<br />
+igt@perf@oa-regs-whitelisted<br />
+igt@perf@triggered-oa-reports-paranoid-0<br />
+igt@perf@triggered-oa-reports-paranoid-1</p>

</body>
</html>

--===============3201898463028974852==--

--===============0507545548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0507545548==--
