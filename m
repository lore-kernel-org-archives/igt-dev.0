Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Mar 2020 13:06:08 -0000
Message-ID: <158514156871.29633.3231927528370764754@emeril.freedesktop.org>
References: <20200325123318.240545-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200325123318.240545-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Only_show_the_kmsg_underflow/overflow_message_once?=
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

Series: runner: Only show the kmsg underflow/overflow message once
URL   : https://patchwork.freedesktop.org/series/75072/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8186 -> IGTPW_4349
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/index.html

Known issues
------------

  Here are the changes found in IGTPW_4349 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-guc:         [DMESG-FAIL][1] ([i915#730] / [i915#933]) -> [DMESG-FAIL][2] ([i915#943])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html

  
  [i915#730]: https://gitlab.freedesktop.org/drm/intel/issues/730
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933
  [i915#943]: https://gitlab.freedesktop.org/drm/intel/issues/943


Participating hosts (44 -> 42)
------------------------------

  Additional (4): fi-skl-lmem fi-bwr-2160 fi-skl-6600u fi-snb-2600 
  Missing    (6): fi-bdw-5557u fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5537 -> IGTPW_4349

  CI-20190529: 20190529
  CI_DRM_8186: 1abdd8c4027177dd054471cf58a5e9ec3f2df46d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4349: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/index.html
  IGT_5537: 190245120758e754813d76b2c6c613413a0dba29 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
