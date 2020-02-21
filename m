Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Feb 2020 12:20:30 -0000
Message-ID: <158228763090.7917.8236804953323088854@emeril.freedesktop.org>
References: <20200221094321.2534304-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200221094321.2534304-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?Exercise_I915=5FCONTEXT=5FPARAM=5FRINGSIZE_=28rev2=29?=
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

Series: i915: Exercise I915_CONTEXT_PARAM_RINGSIZE (rev2)
URL   : https://patchwork.freedesktop.org/series/73750/
State : success

== Summary ==

CI Bug Log - changes from IGT_5457 -> IGTPW_4206
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/index.html

Known issues
------------

  Here are the changes found in IGTPW_4206 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [PASS][1] -> [FAIL][2] ([i915#694])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][3] -> [FAIL][4] ([CI#94])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_sanitycheck:
    - fi-icl-u3:          [DMESG-WARN][7] ([i915#585]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-tgl-y:           [DMESG-WARN][9] ([CI#94] / [i915#402]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][11] ([fdo#111407]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bwr-2160:        [FAIL][13] ([i915#34]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5457 -> IGTPW_4206

  CI-20190529: 20190529
  CI_DRM_7980: 27a7d60b2dd30ef9901b912893835949fd369432 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4206: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/index.html
  IGT_5457: 3e686098d928aa928f668e00fa01e92234e173ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ctx_ringsize@active
+igt@gem_ctx_ringsize@clone
+igt@gem_ctx_ringsize@create
+igt@gem_ctx_ringsize@idempotent
+igt@gem_ctx_ringsize@idle
+igt@gem_ctx_ringsize@invalid

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
