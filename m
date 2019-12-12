Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 10:53:18 -0000
Message-ID: <157614799875.32008.6176779546097913330@emeril.freedesktop.org>
References: <20191212102924.1194130-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191212102924.1194130-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?Rename_gem=5Fexec=5Fparse_and_gem=5Fexec=5Fparse=5Fblt?=
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

Series: i915: Rename gem_exec_parse and gem_exec_parse_blt
URL   : https://patchwork.freedesktop.org/series/70819/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7549 -> IGTPW_3853
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_3853 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3853, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3853:

### IGT changes ###

#### Warnings ####

  * igt@gem_exec_parse@basic-allowed:
    - fi-icl-u2:          [SKIP][1] ([fdo#109289]) -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-icl-u2/igt@gem_exec_parse@basic-allowed.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-icl-u2/igt@gem_exec_parse@basic-allowed.html

  * igt@gem_exec_parse@basic-rejected:
    - fi-icl-u3:          [SKIP][3] ([fdo#109289]) -> [SKIP][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-icl-u3/igt@gem_exec_parse@basic-rejected.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-icl-u3/igt@gem_exec_parse@basic-rejected.html
    - fi-icl-y:           [SKIP][5] ([fdo#109289]) -> [SKIP][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-icl-y/igt@gem_exec_parse@basic-rejected.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-icl-y/igt@gem_exec_parse@basic-rejected.html
    - fi-icl-guc:         [SKIP][7] ([fdo#109289]) -> [SKIP][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-icl-guc/igt@gem_exec_parse@basic-rejected.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-icl-guc/igt@gem_exec_parse@basic-rejected.html
    - fi-cml-u2:          [SKIP][9] ([fdo#109289]) -> [SKIP][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-cml-u2/igt@gem_exec_parse@basic-rejected.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-cml-u2/igt@gem_exec_parse@basic-rejected.html
    - fi-cml-s:           [SKIP][11] ([fdo#109289]) -> [SKIP][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-cml-s/igt@gem_exec_parse@basic-rejected.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-cml-s/igt@gem_exec_parse@basic-rejected.html

  
Known issues
------------

  Here are the changes found in IGTPW_3853 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parse@basic-allowed:
    - fi-byt-n2820:       [PASS][13] -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-byt-n2820/igt@gem_exec_parse@basic-allowed.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-byt-n2820/igt@gem_exec_parse@basic-allowed.html
    - fi-hsw-peppy:       [PASS][15] -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-hsw-peppy/igt@gem_exec_parse@basic-allowed.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-hsw-peppy/igt@gem_exec_parse@basic-allowed.html

  * igt@gem_exec_parse@basic-rejected:
    - fi-byt-j1900:       [PASS][17] -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-byt-j1900/igt@gem_exec_parse@basic-rejected.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-byt-j1900/igt@gem_exec_parse@basic-rejected.html
    - fi-hsw-4770:        [PASS][19] -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-hsw-4770/igt@gem_exec_parse@basic-rejected.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-hsw-4770/igt@gem_exec_parse@basic-rejected.html
    - fi-ivb-3770:        [PASS][21] -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-ivb-3770/igt@gem_exec_parse@basic-rejected.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-ivb-3770/igt@gem_exec_parse@basic-rejected.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [PASS][23] -> [DMESG-FAIL][24] ([i915#722])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-skl-lmem:        [PASS][25] -> [DMESG-WARN][26] ([i915#592])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-skl-lmem/igt@i915_selftest@live_sanitycheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-skl-lmem/igt@i915_selftest@live_sanitycheck.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - {fi-tgl-u}:         [INCOMPLETE][27] ([fdo#111593]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-tgl-u/igt@gem_exec_gttfill@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-tgl-u/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][29] ([i915#563]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][31] ([i915#553] / [i915#725]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u3:          [INCOMPLETE][33] ([fdo#108569] / [i915#140]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-icl-u3/igt@i915_selftest@live_hangcheck.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-icl-u3/igt@i915_selftest@live_hangcheck.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][35] ([fdo#111096] / [i915#323]) -> [FAIL][36] ([fdo#111407])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-x1275:       [DMESG-WARN][37] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][38] ([i915#62] / [i915#92]) +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-kbl-x1275:       [DMESG-WARN][39] ([i915#62] / [i915#92]) -> [DMESG-WARN][40] ([i915#62] / [i915#92] / [i915#95]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#592]: https://gitlab.freedesktop.org/drm/intel/issues/592
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (48 -> 43)
------------------------------

  Additional (1): fi-cfl-guc 
  Missing    (6): fi-tgl-guc fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5346 -> IGTPW_3853

  CI-20190529: 20190529
  CI_DRM_7549: 9573e1b7d1cb54cc984cf5c4f93a743641d868da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3853: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/index.html
  IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gen7_exec_parse@basic-allocation
+igt@gen7_exec_parse@basic-allowed
+igt@gen7_exec_parse@basic-offset
+igt@gen7_exec_parse@basic-rejected
+igt@gen7_exec_parse@batch-without-end
+igt@gen7_exec_parse@bitmasks
+igt@gen7_exec_parse@chained-batch
+igt@gen7_exec_parse@cmd-crossing-page
+igt@gen7_exec_parse@load-register-reg
+igt@gen7_exec_parse@oacontrol-tracking
+igt@gen7_exec_parse@test-lri-oacontrol
+igt@gen7_exec_parse@test-lri-oastatus2
+igt@gen7_exec_parse@test-lri-so_write_offset_0
+igt@gen9_exec_parse@allowed-all
+igt@gen9_exec_parse@allowed-single
+igt@gen9_exec_parse@basic-rejected
+igt@gen9_exec_parse@basic-rejected-ctx-param
+igt@gen9_exec_parse@batch-invalid-length
+igt@gen9_exec_parse@batch-without-end
+igt@gen9_exec_parse@batch-zero-length
+igt@gen9_exec_parse@bb-chained
+igt@gen9_exec_parse@bb-secure
+igt@gen9_exec_parse@bb-start-cmd
+igt@gen9_exec_parse@bb-start-far
+igt@gen9_exec_parse@bb-start-out
+igt@gen9_exec_parse@bb-start-param
+igt@gen9_exec_parse@cmd-crossing-page
+igt@gen9_exec_parse@secure-batches
+igt@gen9_exec_parse@unaligned-access
+igt@gen9_exec_parse@unaligned-jump
+igt@gen9_exec_parse@valid-registers
-igt@gem_exec_parse@basic-allocation
-igt@gem_exec_parse@basic-allowed
-igt@gem_exec_parse@basic-offset
-igt@gem_exec_parse@basic-rejected
-igt@gem_exec_parse@batch-without-end
-igt@gem_exec_parse@bitmasks
-igt@gem_exec_parse@chained-batch
-igt@gem_exec_parse@cmd-crossing-page
-igt@gem_exec_parse@load-register-reg
-igt@gem_exec_parse@oacontrol-tracking
-igt@gem_exec_parse@test-lri-oacontrol
-igt@gem_exec_parse@test-lri-oastatus2
-igt@gem_exec_parse@test-lri-so_write_offset_0
-igt@gem_exec_parse_blt@allowed-all
-igt@gem_exec_parse_blt@allowed-single
-igt@gem_exec_parse_blt@basic-rejected
-igt@gem_exec_parse_blt@basic-rejected-ctx-param
-igt@gem_exec_parse_blt@batch-invalid-length
-igt@gem_exec_parse_blt@batch-without-end
-igt@gem_exec_parse_blt@batch-zero-length
-igt@gem_exec_parse_blt@bb-chained
-igt@gem_exec_parse_blt@bb-secure
-igt@gem_exec_parse_blt@bb-start-cmd
-igt@gem_exec_parse_blt@bb-start-far
-igt@gem_exec_parse_blt@bb-start-out
-igt@gem_exec_parse_blt@bb-start-param
-igt@gem_exec_parse_blt@cmd-crossing-page
-igt@gem_exec_parse_blt@secure-batches
-igt@gem_exec_parse_blt@unaligned-access
-igt@gem_exec_parse_blt@unaligned-jump
-igt@gem_exec_parse_blt@valid-registers

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
