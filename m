Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Mar 2020 11:39:51 -0000
Message-ID: <158556839142.13827.9038111087476143130@emeril.freedesktop.org>
References: <20200330092117.810776-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200330092117.810776-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_i915/gem=5Fbad=5Freloc=3A_Redu?=
 =?utf-8?q?ce_negative_testing?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] i915/gem_bad_reloc: Reduce negative testing
URL   : https://patchwork.freedesktop.org/series/75221/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8213 -> IGTPW_4371
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8213 and IGTPW_4371:

### New IGT tests (4) ###

  * igt@gem_exec_parallel@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_parallel@engines@basic:
    - Statuses : 40 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.85] s

  * igt@gem_exec_parallel@engines@contexts:
    - Statuses : 38 pass(s) 4 skip(s)
    - Exec time: [0.0, 6.65] s

  * igt@gem_exec_parallel@engines@fds:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0, 6.35] s

  

Known issues
------------

  Here are the changes found in IGTPW_4371 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-skl-6770hq:      [PASS][1] -> [DMESG-WARN][2] ([i915#203]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/fi-skl-6770hq/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/fi-skl-6770hq/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-u2:          [PASS][3] -> [INCOMPLETE][4] ([fdo#108569])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/fi-icl-u2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][5] -> [FAIL][6] ([i915#262])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [PASS][7] -> [SKIP][8] ([fdo#109271]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-skl-6770hq:      [PASS][9] -> [DMESG-WARN][10] ([i915#106] / [i915#165])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262


Participating hosts (47 -> 44)
------------------------------

  Additional (4): fi-byt-j1900 fi-kbl-7560u fi-glk-dsi fi-bsw-n3050 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5544 -> IGTPW_4371

  CI-20190529: 20190529
  CI_DRM_8213: 3cebf14c87d0d4508d4cc9c49db14061af752c37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4371: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/index.html
  IGT_5544: 477c562fc9932939083d732b77dd7b083c6bc0a1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_bad_reloc@negative-reloc
+igt@gem_bad_reloc@negative-reloc-lut
+igt@gem_exec_async@concurrent-writes
+igt@gem_exec_capture@capture
+igt@gem_exec_parallel@engines
-igt@gem_bad_reloc@negative-reloc-blt
-igt@gem_bad_reloc@negative-reloc-bsd
-igt@gem_bad_reloc@negative-reloc-bsd1
-igt@gem_bad_reloc@negative-reloc-bsd2
-igt@gem_bad_reloc@negative-reloc-default
-igt@gem_bad_reloc@negative-reloc-lut-blt
-igt@gem_bad_reloc@negative-reloc-lut-bsd
-igt@gem_bad_reloc@negative-reloc-lut-bsd1
-igt@gem_bad_reloc@negative-reloc-lut-bsd2
-igt@gem_bad_reloc@negative-reloc-lut-default
-igt@gem_bad_reloc@negative-reloc-lut-render
-igt@gem_bad_reloc@negative-reloc-lut-vebox
-igt@gem_bad_reloc@negative-reloc-render
-igt@gem_bad_reloc@negative-reloc-vebox
-igt@gem_exec_async@concurrent-writes-blt
-igt@gem_exec_async@concurrent-writes-bsd
-igt@gem_exec_async@concurrent-writes-bsd1
-igt@gem_exec_async@concurrent-writes-bsd2
-igt@gem_exec_async@concurrent-writes-render
-igt@gem_exec_async@concurrent-writes-vebox
-igt@gem_exec_capture@capture-blt
-igt@gem_exec_capture@capture-bsd
-igt@gem_exec_capture@capture-bsd1
-igt@gem_exec_capture@capture-bsd2
-igt@gem_exec_capture@capture-render
-igt@gem_exec_capture@capture-vebox
-igt@gem_exec_parallel@bcs0
-igt@gem_exec_parallel@bcs0-contexts
-igt@gem_exec_parallel@bcs0-fds
-igt@gem_exec_parallel@rcs0
-igt@gem_exec_parallel@rcs0-contexts
-igt@gem_exec_parallel@rcs0-fds
-igt@gem_exec_parallel@vcs0
-igt@gem_exec_parallel@vcs0-contexts
-igt@gem_exec_parallel@vcs0-fds
-igt@gem_exec_parallel@vcs1
-igt@gem_exec_parallel@vcs1-contexts
-igt@gem_exec_parallel@vcs1-fds
-igt@gem_exec_parallel@vcs2
-igt@gem_exec_parallel@vcs2-contexts
-igt@gem_exec_parallel@vcs2-fds
-igt@gem_exec_parallel@vecs0
-igt@gem_exec_parallel@vecs0-contexts
-igt@gem_exec_parallel@vecs0-fds

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4371/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
