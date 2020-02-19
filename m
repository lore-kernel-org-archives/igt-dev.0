Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 15:59:57 -0000
Message-ID: <158212799741.21060.3807400582212396836@emeril.freedesktop.org>
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200219142445.69061-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdHMvY29y?=
 =?utf-8?q?e=5Fsetmaster=3A_new_test_for_drop/set_master_semantics_=28rev2?=
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: ts/core_setmaster: new test for drop/set master semantics (rev2)
URL   : https://patchwork.freedesktop.org/series/73650/
State : success

== Summary ==

CI Bug Log - changes from IGT_5451 -> IGTPW_4186
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/index.html

Known issues
------------

  Here are the changes found in IGTPW_4186 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-ivb-3770:        [PASS][1] -> [DMESG-FAIL][2] ([i915#722])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/fi-ivb-3770/igt@i915_selftest@live_gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/fi-ivb-3770/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [INCOMPLETE][3] ([i915#694] / [i915#816]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gtt:
    - fi-icl-guc:         [TIMEOUT][5] ([fdo#112271]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/fi-icl-guc/igt@i915_selftest@live_gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/fi-icl-guc/igt@i915_selftest@live_gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (52 -> 46)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5451 -> IGTPW_4186

  CI-20190529: 20190529
  CI_DRM_7965: e2896d5957301e0411d7048e724d4dc5c96450ea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4186: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/index.html
  IGT_5451: 1c42f971d37a066da3e588783611ab08d5afbded @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@core_setmaster@master-drop-set-root
+igt@core_setmaster@master-drop-set-shared-fd
+igt@core_setmaster@master-drop-set-user

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
