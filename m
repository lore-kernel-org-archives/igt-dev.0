Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 23:35:45 -0000
Message-ID: <158034094513.5462.8180511184268816239@emeril.freedesktop.org>
References: <20200129222456.1503424-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200129222456.1503424-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Freloc=3A_Add_SIGINT_injection?=
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

Series: i915/gem_exec_reloc: Add SIGINT injection
URL   : https://patchwork.freedesktop.org/series/72745/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5405 -> IGTPW_4036
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4036 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4036, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4036:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-bsw-nick/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4036 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][2] -> [TIMEOUT][3] ([fdo#112271] / [i915#816])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [TIMEOUT][4] ([fdo#112271]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_execlists:
    - fi-skl-guc:         [INCOMPLETE][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-skl-guc/igt@i915_selftest@live_execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-skl-guc/igt@i915_selftest@live_execlists.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][8] ([fdo#111096] / [i915#323]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [FAIL][10] ([i915#694]) -> [TIMEOUT][11] ([fdo#112271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][12] ([i915#725]) -> [DMESG-FAIL][13] ([i915#553] / [i915#725])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (46 -> 46)
------------------------------

  Additional (6): fi-bdw-gvtdvm fi-snb-2520m fi-gdg-551 fi-elk-e7500 fi-bsw-nick fi-skl-6700k2 
  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-tgl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5405 -> IGTPW_4036

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4036: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/index.html
  IGT_5405: add505d102f5d27e38cb4d926524664e161c2a1a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_reloc@cpu-gtt-interruptible
+igt@gem_exec_reloc@cpu-interruptible
+igt@gem_exec_reloc@cpu-read-interruptible
+igt@gem_exec_reloc@cpu-wc-interruptible
+igt@gem_exec_reloc@gtt-cpu-interruptible
+igt@gem_exec_reloc@gtt-interruptible
+igt@gem_exec_reloc@gtt-read-interruptible
+igt@gem_exec_reloc@gtt-wc-interruptible
+igt@gem_exec_reloc@range-interruptible
+igt@gem_exec_reloc@wc-cpu-interruptible
+igt@gem_exec_reloc@wc-gtt-interruptible
+igt@gem_exec_reloc@wc-interruptible
+igt@gem_exec_reloc@wc-read-interruptible
+igt@gem_exec_reloc@write-cpu-interruptible
+igt@gem_exec_reloc@write-gtt-interruptible
+igt@gem_exec_reloc@write-read-interruptible
+igt@gem_exec_reloc@write-wc-interruptible

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
