Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 25 Feb 2020 13:39:55 -0000
Message-ID: <158263799501.5722.16100551323573703029@emeril.freedesktop.org>
References: <20200225114454.337180-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200225114454.337180-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcGVyZjog?=
 =?utf-8?q?Avoid_the_regular_drm=5Fopen=5Fdriver_exithandler?=
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

Series: perf: Avoid the regular drm_open_driver exithandler
URL   : https://patchwork.freedesktop.org/series/73897/
State : success

== Summary ==

CI Bug Log - changes from IGT_5465 -> IGTPW_4222
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4222/index.html

Known issues
------------

  Here are the changes found in IGTPW_4222 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_linear_blits@basic:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5465/fi-tgl-y/igt@gem_render_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4222/fi-tgl-y/igt@gem_render_linear_blits@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [INCOMPLETE][3] ([fdo#106070] / [i915#424]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5465/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4222/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@prime_vgem@basic-fence-wait-default:
    - fi-tgl-y:           [DMESG-WARN][5] ([CI#94] / [i915#402]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5465/fi-tgl-y/igt@prime_vgem@basic-fence-wait-default.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4222/fi-tgl-y/igt@prime_vgem@basic-fence-wait-default.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460


Participating hosts (51 -> 45)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5465 -> IGTPW_4222

  CI-20190529: 20190529
  CI_DRM_8004: 1a2e0cce5af4a9ad9694995610ed64578ccc430f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4222: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4222/index.html
  IGT_5465: c719274a5e3a31d5b44aed433ef3833a536a507a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4222/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
