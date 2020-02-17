Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 15:59:09 -0000
Message-ID: <158195514976.16572.267553498839178950@emeril.freedesktop.org>
References: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBV?=
 =?utf-8?q?pdate_selftests_to_use_dynamic_subtests_=28rev3=29?=
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

Series: lib: Update selftests to use dynamic subtests (rev3)
URL   : https://patchwork.freedesktop.org/series/73486/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5445 -> IGTPW_4165
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4165 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4165, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4165/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4165:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-r:           NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4165/fi-kbl-r/igt@gem_exec_suspend@basic-s0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4165 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_gtt:
    - fi-bwr-2160:        [PASS][2] -> [SKIP][3] ([fdo#109271]) +31 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5445/fi-bwr-2160/igt@i915_selftest@live_gtt.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4165/fi-bwr-2160/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_mman:
    - fi-gdg-551:         [PASS][4] -> [SKIP][5] ([fdo#109271]) +31 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5445/fi-gdg-551/igt@i915_selftest@live_mman.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4165/fi-gdg-551/igt@i915_selftest@live_mman.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][6] ([i915#45]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5445/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4165/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-kbl-r 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5445 -> IGTPW_4165

  CI-20190529: 20190529
  CI_DRM_7954: d7c1791394faaa869d3442705413dac8c0ecd677 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4165: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4165/index.html
  IGT_5445: 21e523814d692978d6d04ba85eadd67fcbd88b7e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@dmabuf@all
+igt@drm_mm@all
+igt@i915_selftest@live
+igt@i915_selftest@mock
+igt@i915_selftest@perf
+igt@kms_selftest@all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4165/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
