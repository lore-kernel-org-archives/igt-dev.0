Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Feb 2020 12:17:08 -0000
Message-ID: <158271942847.21012.5805302482034337244@emeril.freedesktop.org>
References: <20200225230548.1330092-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200225230548.1330092-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?sw=5Fsync=3A_Fix_race_condition_for_multi-producer_termination?=
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

Series: tests/sw_sync: Fix race condition for multi-producer termination
URL   : https://patchwork.freedesktop.org/series/73931/
State : success

== Summary ==

CI Bug Log - changes from IGT_5467 -> IGTPW_4224
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/index.html

Known issues
------------

  Here are the changes found in IGTPW_4224 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][1] ([i915#877]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (49 -> 45)
------------------------------

  Additional (1): fi-tgl-y 
  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5467 -> IGTPW_4224

  CI-20190529: 20190529
  CI_DRM_8005: 81f641f60edbfa1ccb169689206f0af360a06e31 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4224: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/index.html
  IGT_5467: 2684f182424582c66e67bcbbda77cd60901627b8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
