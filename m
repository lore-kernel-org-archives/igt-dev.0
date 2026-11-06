Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED180606A339
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 17:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ED0112F29;
	Fri,  6 Nov 2026 17:00:05 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941AE112F14;
 Fri,  6 Nov 2026 16:58:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1911971453092710195=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fbo=5Fshr?=
 =?utf-8?q?ink=3A_Add_a_user-space_shrinker_test_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Nov 2026 16:58:58 -0000
Message-ID: <179398433860.133912.18063927581502243683@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106131226.40643-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261106131226.40643-1-thomas.hellstrom@linux.intel.com>
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
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1911971453092710195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_bo_shrink: Add a user-space shrinker test (rev4)
URL   : https://patchwork.freedesktop.org/series/176563/
State : success

== Summary ==

CI Bug Log - changes from IGT_9181 -> IGTPW_16118
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16118/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

New tests
---------

  New tests have been introduced between IGT_9181 and IGTPW_16118:

### New IGT tests (34) ###

  * igt@kms_flip@basic-flip-vs-dpms@a-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_flip@basic-plain-flip@a-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_flip@basic-plain-flip@a-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_flip@basic-plain-flip@b-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_flip@basic-plain-flip@b-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_flip@basic-plain-flip@c-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@basic-plain-flip@c-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_flip@basic-plain-flip@d-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@basic-plain-flip@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  

Known issues
------------

  Here are the changes found in IGTPW_16118 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-kbl-7567u:       [ABORT][1] ([i915#17788]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9181/fi-kbl-7567u/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16118/fi-kbl-7567u/igt@i915_selftest@live.html

  
  [i915#17788]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17788


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9181 -> IGTPW_16118
  * Linux: CI_DRM_19463 -> CI_DRM_19465

  CI-20190529: 20190529
  CI_DRM_19463: 7797f00bc4da28646c612b8130ccd5192548ceea @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19465: ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16118: 1c555b1b65518cf2f7d37daee37d1456e0884b29 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9181: 9181

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16118/index.html

--===============1911971453092710195==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_bo_shrink: Add a user-space shrinker test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176563/">https://patchwork.freedesktop.org/series/176563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16118/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16118/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9181 -&gt; IGTPW_16118</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16118/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_9181 and IGTPW_16118:</p>
<h3>New IGT tests (34)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16118 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9181/fi-kbl-7567u/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17788">i915#17788</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16118/fi-kbl-7567u/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9181 -&gt; IGTPW_16118</li>
<li>Linux: CI_DRM_19463 -&gt; CI_DRM_19465</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19463: 7797f00bc4da28646c612b8130ccd5192548ceea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19465: ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16118: 1c555b1b65518cf2f7d37daee37d1456e0884b29 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9181: 9181</p>

</body>
</html>

--===============1911971453092710195==--
