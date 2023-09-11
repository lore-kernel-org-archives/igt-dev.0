Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6513225751779212424=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 11 Sep 2023 10:28:53 -0000
Message-ID: <169442813316.31367.11710486283996555819@emeril.freedesktop.org>
References: <20230911092731.1962039-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230911092731.1962039-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/kms=5Ffbt=3A_Convert_basic_test_to_dynamic?=
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

--===============6513225751779212424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_fbt: Convert basic test to dynamic
URL   : https://patchwork.freedesktop.org/series/123527/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13617 -> IGTPW_9763
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (1): bat-adlp-11 
  Missing    (2): bat-dg2-9 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9763:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_frontbuffer_tracking@basic@4} (NEW):
    - bat-adlp-6:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-6/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-skl-6600u/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-apl-guc:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-apl-guc/igt@kms_frontbuffer_tracking@basic@4.html
    - bat-dg1-5:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-dg1-5/igt@kms_frontbuffer_tracking@basic@4.html
    - bat-jsl-3:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-jsl-3/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-glk-j4005/igt@kms_frontbuffer_tracking@basic@4.html
    - bat-adlp-9:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-9/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-skl-guc:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-skl-guc/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic@4.html
    - bat-adln-1:         NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adln-1/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][13] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][14] +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic@4.html
    - bat-rplp-1:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-rplp-1/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic@4.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic@4.html
    - bat-adlp-11:        NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_frontbuffer_tracking@basic@4.html
    - bat-jsl-1:          NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-jsl-1/igt@kms_frontbuffer_tracking@basic@4.html

  * {igt@kms_frontbuffer_tracking@basic@y} (NEW):
    - fi-ivb-3770:        NOTRUN -> [FAIL][20] +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic@y.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic@y.html
    - fi-ilk-650:         NOTRUN -> [FAIL][22] +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-ilk-650/igt@kms_frontbuffer_tracking@basic@y.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][23] +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic@y.html
    - bat-dg2-11:         NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-dg2-11/igt@kms_frontbuffer_tracking@basic@y.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13617 and IGTPW_9763:

### New IGT tests (4) ###

  * igt@kms_frontbuffer_tracking@basic@4:
    - Statuses : 22 fail(s) 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@basic@linear:
    - Statuses : 1 fail(s) 23 pass(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@basic@x:
    - Statuses : 1 fail(s) 22 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@basic@y:
    - Statuses : 7 fail(s) 17 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9763 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-adlp-11:        NOTRUN -> [SKIP][25] ([i915#7456])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@debugfs_test@basic-hwmon.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-11:        NOTRUN -> [SKIP][26] ([i915#3282])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@gem_tiled_pread_basic.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-11:         [PASS][27] -> [ABORT][28] ([i915#7913])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13617/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@flip:
    - bat-adlp-11:        NOTRUN -> [DMESG-FAIL][29] ([i915#6868])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-11:        NOTRUN -> [FAIL][30] ([i915#9047])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-adlp-11:        NOTRUN -> [SKIP][31] ([i915#3546])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adlp-11:        NOTRUN -> [SKIP][32] ([i915#4103])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-11:        NOTRUN -> [SKIP][33] ([i915#4093]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html

  * {igt@kms_frontbuffer_tracking@basic@x} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic@x.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-11:        NOTRUN -> [SKIP][35] ([i915#4369])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html
    - fi-kbl-guc:         [PASS][36] -> [FAIL][37] ([IGT#3] / [i915#6121])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13617/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        NOTRUN -> [ABORT][38] ([i915#8668])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9047]: https://gitlab.freedesktop.org/drm/intel/issues/9047


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7478 -> IGTPW_9763

  CI-20190529: 20190529
  CI_DRM_13617: 232c052bbad9247620eb164d559c1e0a9eae0353 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9763: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/index.html
  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/index.html

--===============6513225751779212424==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_fbt: Convert basic test to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123527/">https://patchwork.freedesktop.org/series/123527/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13617 -&gt; IGTPW_9763</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (1): bat-adlp-11 <br />
  Missing    (2): bat-dg2-9 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9763:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_frontbuffer_tracking@basic@4} (NEW):</p>
<ul>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-6/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-skl-6600u/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-apl-guc/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-dg1-5/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-jsl-3/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-glk-j4005/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-9/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-skl-guc/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adln-1/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a> +3 other tests fail</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-rplp-1/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-jsl-1/igt@kms_frontbuffer_tracking@basic@4.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@basic@y} (NEW):</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic@y.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic@y.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-ilk-650/igt@kms_frontbuffer_tracking@basic@y.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic@y.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-dg2-11/igt@kms_frontbuffer_tracking@basic@y.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13617 and IGTPW_9763:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic@4:</p>
<ul>
<li>Statuses : 22 fail(s) 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic@linear:</p>
<ul>
<li>Statuses : 1 fail(s) 23 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic@x:</p>
<ul>
<li>Statuses : 1 fail(s) 22 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic@y:</p>
<ul>
<li>Statuses : 7 fail(s) 17 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9763 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13617/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_busy@basic@flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_busy@basic@modeset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9047">i915#9047</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@basic@x} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-elk-e7500/igt@kms_frontbuffer_tracking@basic@x.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4369">i915#4369</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13617/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7478 -&gt; IGTPW_9763</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13617: 232c052bbad9247620eb164d559c1e0a9eae0353 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9763: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9763/index.html<br />
  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6513225751779212424==--
