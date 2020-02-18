Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 Feb 2020 14:17:00 -0000
Message-ID: <158203542010.31430.14113392741845810248@emeril.freedesktop.org>
References: <1581969803-15387-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1581969803-15387-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_limit_maximum_used_plane_size_=28rev2?=
 =?utf-8?q?=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_rotation_crc: limit maximum used plane size (rev2)
URL   : https://patchwork.freedesktop.org/series/73547/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5446 -> IGTPW_4170
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4170 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4170, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4170:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_reset:
    - fi-bwr-2160:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/fi-bwr-2160/igt@i915_selftest@live_reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/fi-bwr-2160/igt@i915_selftest@live_reset.html

  
Known issues
------------

  Here are the changes found in IGTPW_4170 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bwr-2160:        [PASS][3] -> [FAIL][4] ([i915#34])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][5] ([i915#45]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@contexts:
    - {fi-ehl-1}:         [INCOMPLETE][7] ([i915#937]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/fi-ehl-1/igt@gem_exec_parallel@contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/fi-ehl-1/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][9] ([fdo#108569]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/fi-icl-y/igt@i915_selftest@live_execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][11] ([i915#877]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-bxt-dsi:         [TIMEOUT][13] ([fdo#112271]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/fi-bxt-dsi/igt@i915_selftest@live_gtt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/fi-bxt-dsi/igt@i915_selftest@live_gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (52 -> 42)
------------------------------

  Missing    (10): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bsw-kefka fi-skl-lmem fi-byt-clapper fi-bsw-nick fi-bdw-samus fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5446 -> IGTPW_4170

  CI-20190529: 20190529
  CI_DRM_7958: af30970548f72cf8a37886f009e0cfe02b23c8a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4170: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/index.html
  IGT_5446: 7a05faa0be53fa1544ec950290129d20e4101c72 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4170/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
