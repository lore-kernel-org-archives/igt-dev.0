Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Mar 2020 13:45:36 -0000
Message-ID: <158505753687.5748.15713432971293976172@emeril.freedesktop.org>
References: <20200324125233.56308-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200324125233.56308-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frc6=5Fresidency=3A_Make_ringbuffer_rc6_fast?=
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

Series: i915/i915_pm_rc6_residency: Make ringbuffer rc6 fast
URL   : https://patchwork.freedesktop.org/series/75011/
State : success

== Summary ==

CI Bug Log - changes from IGT_5534 -> IGTPW_4345
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4345/index.html

Known issues
------------

  Here are the changes found in IGTPW_4345 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-8700k:       [DMESG-FAIL][1] ([i915#481]) -> [DMESG-FAIL][2] ([i915#730] / [i915#933])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4345/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
    - fi-cfl-guc:         [INCOMPLETE][3] ([fdo#106070] / [i915#424]) -> [DMESG-FAIL][4] ([i915#481])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4345/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html

  
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#481]: https://gitlab.freedesktop.org/drm/intel/issues/481
  [i915#730]: https://gitlab.freedesktop.org/drm/intel/issues/730
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933


Participating hosts (46 -> 37)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (10): fi-glk-dsi fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bsw-kefka fi-skl-lmem fi-icl-guc fi-byt-clapper fi-bdw-samus fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5534 -> IGTPW_4345

  CI-20190529: 20190529
  CI_DRM_8182: e5245084567cd7f6f93b07baaebf8a2b4d914620 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4345: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4345/index.html
  IGT_5534: cc5d8b4a1bd398fc68271fd9fefc939181db6a2d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4345/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
