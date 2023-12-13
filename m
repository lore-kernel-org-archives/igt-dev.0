Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8433883568896779455=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL3hlX3F1ZXJ5OiBGaXggeGVf?=
 =?utf-8?b?c3VwcG9ydHNfZmF1bHRzKCk=?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Welty, Brian" <brian.welty@intel.com>
Date: Wed, 13 Dec 2023 08:27:02 -0000
Message-ID: <170245602260.10264.9118432746531793640@emeril.freedesktop.org>
References: <20231207012623.15901-1-brian.welty@intel.com>
In-Reply-To: <20231207012623.15901-1-brian.welty@intel.com>
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

--===============8433883568896779455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe_query: Fix xe_supports_faults()
URL   : https://patchwork.freedesktop.org/series/127467/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13990 -> IGTPW_10361
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html

Participating hosts (37 -> 32)
------------------------------

  Missing    (5): bat-adls-5 bat-dg1-5 bat-dg2-9 fi-snb-2520m fi-pnv-d510 

New tests
---------

  New tests have been introduced between CI_DRM_13990 and IGTPW_10361:

### New IGT tests (12) ###

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.01] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-7:
    - Statuses : 1 abort(s)
    - Exec time: [1.94] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  

Known issues
------------

  Here are the changes found in IGTPW_10361 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-5:
    - bat-adlp-11:        [PASS][1] -> [DMESG-FAIL][2] ([i915#6868])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-5.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-5.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5:
    - bat-adlp-11:        [PASS][3] -> [FAIL][4] ([i915#9666]) +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-7 (NEW):
    - bat-adlp-11:        NOTRUN -> [ABORT][5] ([i915#8668])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-7.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@d-dp6:
    - bat-adlp-11:        [DMESG-FAIL][6] ([i915#6868]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html

  * igt@kms_flip@basic-flip-vs-modeset@d-dp6:
    - bat-adlp-11:        [DMESG-WARN][8] ([i915#9782]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html

  
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9666]: https://gitlab.freedesktop.org/drm/intel/issues/9666
  [i915#9782]: https://gitlab.freedesktop.org/drm/intel/issues/9782


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7626 -> IGTPW_10361

  CI-20190529: 20190529
  CI_DRM_13990: 85d33d0ad82a5c1a71492f14a5ceb67ada6a22d8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html

--===============8433883568896779455==
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
<tr><td><b>Series:</b></td><td>lib/xe_query: Fix xe_supports_faults()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127467/">https://patchwork.freedesktop.org/series/127467/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13990 -&gt; IGTPW_10361</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html</p>
<h2>Participating hosts (37 -&gt; 32)</h2>
<p>Missing    (5): bat-adls-5 bat-dg1-5 bat-dg2-9 fi-snb-2520m fi-pnv-d510 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13990 and IGTPW_10361:</p>
<h3>New IGT tests (12)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-7:</p>
<ul>
<li>Statuses : 1 abort(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10361 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9666">i915#9666</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-7 (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-7.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9782">i915#9782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7626 -&gt; IGTPW_10361</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13990: 85d33d0ad82a5c1a71492f14a5ceb67ada6a22d8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html<br />
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8433883568896779455==--
