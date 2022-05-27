Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2949156018664281377=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Fri, 27 May 2022 11:29:41 -0000
Message-ID: <165365098177.25502.9918595595668889635@emeril.freedesktop.org>
References: <20220527075304.2226456-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220527075304.2226456-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWxf?=
 =?utf-8?q?gpu=5Ftop=3A_Don=27t_show_client_header_if_no_kernel_support?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2949156018664281377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel_gpu_top: Don't show client header if no kernel support
URL   : https://patchwork.freedesktop.org/series/104447/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11705_full -> IGTPW_7178_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/index.html

Participating hosts (13 -> 9)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7178_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@fbdev@pan:
    - {shard-dg1}:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-dg1-18/igt@fbdev@pan.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@fbdev@pan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - {shard-dg1}:        NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_force_connector_basic@force-edid:
    - {shard-dg1}:        NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@kms_force_connector_basic@force-edid.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11705_full and IGTPW_7178_full:

### New IGT tests (121) ###

  * igt@gem_exec_balancer@hog:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.55] s

  * igt@gem_exec_balancer@sliced:
    - Statuses : 6 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.65] s

  * igt@gem_exec_endless@dispatch:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_endless@dispatch@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_endless@dispatch@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_endless@dispatch@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_endless@dispatch@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_endless@dispatch@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-concurrent0:
    - Statuses : 3 pass(s)
    - Exec time: [5.39, 5.45] s

  * igt@gem_exec_reloc@basic-concurrent16:
    - Statuses : 6 pass(s)
    - Exec time: [5.40, 5.46] s

  * igt@gem_exec_schedule@preempt-engines:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@preempt-engines@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.46] s

  * igt@gem_exec_schedule@preempt-engines@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.32] s

  * igt@gem_exec_schedule@preempt-engines@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.27] s

  * igt@gem_exec_schedule@preempt-engines@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@gem_exec_schedule@preempt-engines@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.30] s

  * igt@gem_exec_schedule@submit-early-slice:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@submit-golden-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-golden-slice@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@submit-golden-slice@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@submit-golden-slice@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@submit-golden-slice@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@submit-golden-slice@vecs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-late-slice@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_exec_schedule@submit-late-slice@vecs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@i915_pciid:
    - Statuses : 4 pass(s)
    - Exec time: [0.05, 0.12] s

  * igt@i915_pm_lpsp@kms-lpsp:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-vga:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-fence:
    - Statuses : 5 pass(s) 3 warn(s)
    - Exec time: [12.21, 18.27] s

  * igt@i915_query@engine-info:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@i915_query@engine-info-invalid:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.30, 4.06] s

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - Statuses : 8 pass(s)
    - Exec time: [1.30, 5.02] s

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.24] s

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.27] s

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.57, 6.50] s

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.40, 6.48] s

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.28] s

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - Statuses : 8 skip(s)
    - Exec time: [0.02, 0.24] s

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - Statuses : 3 pass(s)
    - Exec time: [1.97, 9.23] s

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - Statuses : 8 pass(s)
    - Exec time: [1.67, 9.27] s

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - Statuses : 8 skip(s)
    - Exec time: [0.02, 0.29] s

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.27] s

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - Statuses : 7 pass(s)
    - Exec time: [1.10, 4.32] s

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - Statuses : 8 pass(s)
    - Exec time: [1.11, 4.34] s

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.28] s

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - Statuses : 8 skip(s)
    - Exec time: [0.01, 0.23] s

  * igt@kms_big_fb@linear-addfb:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.18, 4.02] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - Statuses : 3 pass(s)
    - Exec time: [1.22, 3.79] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - Statuses : 8 skip(s)
    - Exec time: [0.01, 0.28] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.28] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - Statuses : 7 pass(s)
    - Exec time: [1.37, 5.43] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - Statuses : 7 pass(s)
    - Exec time: [1.39, 5.42] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.28] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - Statuses : 8 skip(s)
    - Exec time: [0.01, 0.29] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.62, 5.03] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - Statuses : 8 skip(s)
    - Exec time: [0.02, 0.28] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.27] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - Statuses : 7 pass(s)
    - Exec time: [1.09, 3.68] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - Statuses : 3 pass(s)
    - Exec time: [1.13, 3.35] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - Statuses : 8 skip(s)
    - Exec time: [0.01, 0.29] s

  * igt@kms_big_fb@x-tiled-addfb:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - Statuses : 6 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.15] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.38] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - Statuses : 4 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.74] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - Statuses : 4 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.68] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.60] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.41] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.46] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.37] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.54] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.89] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.59] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@kms_big_fb@y-tiled-addfb:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - Statuses : 6 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.22] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.44] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.68] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.67] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - Statuses : 4 pass(s) 4 skip(s)
    - Exec time: [0.0, 5.74] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.46] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 5.55] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_chamelium@hdmi-audio:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  

Known issues
------------

  Here are the changes found in IGTPW_7178_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@block-copy-inplace:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#3555] / [i915#5325])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-glk:          NOTRUN -> [SKIP][6] ([fdo#109271]) +91 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [FAIL][7] ([i915#5784])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@sliced (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][8] ([i915#4771])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-18/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][9] ([i915#2842]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([fdo#109283])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-apl7/igt@gem_exec_suspend@basic-s3@smem.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl2/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][14] -> [DMESG-WARN][15] ([i915#118])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-glk4/igt@gem_exec_whisper@basic-fds-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-iclb:         [PASS][16] -> [INCOMPLETE][17] ([i915#5304] / [i915#5498])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked-all.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#2190])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#4613]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk8/igt@gem_lmem_swapping@verify.html
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl2/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#284])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@gem_media_vme.html

  * igt@gem_mmap_wc@coherency:
    - shard-snb:          [PASS][24] -> [SKIP][25] ([fdo#109271]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-snb2/igt@gem_mmap_wc@coherency.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-snb6/igt@gem_mmap_wc@coherency.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#4270]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@gem_pxp@create-regular-context-2.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#4270])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb7/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#768]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb8/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-glk:          NOTRUN -> [FAIL][29] ([i915#4171])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk7/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@input-checking:
    - shard-glk:          NOTRUN -> [DMESG-WARN][30] ([i915#4991])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk8/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3297]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#3297])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-glk:          NOTRUN -> [FAIL][33] ([i915#3318])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk8/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109289]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#2856]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#2527] / [i915#2856]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#1902])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@i915_pm_lpsp@screens-disabled.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#1902])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111644] / [i915#1397] / [i915#2411])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109293] / [fdo#109506])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109303])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109303])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][43] ([i915#2373])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][44] ([i915#1759])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][45] ([i915#5591])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#5286]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#5286]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90 (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][48] ([fdo#111614]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglu-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270 (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90 (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][50] ([i915#3638]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-12/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111614]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270 (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][52] ([i915#1836])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0 (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][53] ([fdo#111615]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglu-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
    - {shard-dg1}:        NOTRUN -> [SKIP][54] ([i915#4538]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-18/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270 (NEW):
    - {shard-dg1}:        [SKIP][55] ([i915#4538]) -> [SKIP][56] ([i915#1836])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#110723])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3689]) +14 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#6095]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3886]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3689] / [i915#3886]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3886]) +8 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [i915#3886]) +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3886]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-snb:          NOTRUN -> [SKIP][65] ([fdo#109271]) +98 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-snb5/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111615] / [i915#3689]) +9 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb2/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl1/igt@kms_chamelium@dp-mode-timings.html
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk8/igt@kms_chamelium@dp-mode-timings.html
    - shard-snb:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-snb6/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@hdmi-audio (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][70] ([fdo#111827])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglu-8/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-hpd-after-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_chamelium@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#1149]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +19 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][75] ([i915#1319])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl4/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109300] / [fdo#111066])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#1063])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][78] ([i915#1319])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109279] / [i915#3359]) +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][80] -> [DMESG-WARN][81] ([i915#180]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#3319]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [fdo#109279])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#3359]) +11 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-iclb:         [PASS][86] -> [FAIL][87] ([i915#2346])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][88] -> [FAIL][89] ([i915#2346] / [i915#533])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#533]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278]) +28 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#4103]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#5287]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#5287]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][95] ([i915#180])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109274] / [fdo#111825]) +21 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109274]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][98] ([i915#180]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#2587])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [PASS][100] -> [FAIL][101] ([i915#4911])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109280] / [fdo#111825]) +42 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109280]) +21 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][104] -> [SKIP][105] ([i915#433])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#3555])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb7/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#533])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][108] ([fdo#108145] / [i915#265]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][109] ([i915#265])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#111615] / [fdo#112054])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#3536])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#3536])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#111615]) +6 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#5288]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-c-tiling-4.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#111068] / [i915#658])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#658]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#658])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#1911]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][119] -> [SKIP][120] ([fdo#109441]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][121] ([i915#132] / [i915#3467]) +4 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109441]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#111615] / [i915#5289]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-glk:          [PASS][124] -> [FAIL][125] ([i915#1888] / [i915#65])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-glk4/igt@kms_rotation_crc@sprite-rotation-90.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-kbl:          NOTRUN -> [SKIP][126] ([fdo#109271]) +274 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271]) +78 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl4/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#3555]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][129] ([i915#2437])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][130] ([fdo#109271] / [i915#2437])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][131] ([i915#2530]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb8/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][132] ([i915#2530]) +6 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@nouveau_crc@pipe-d-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][133] ([fdo#109278] / [i915#2530]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@nouveau_crc@pipe-d-source-rg.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> [SKIP][134] ([fdo#109289]) +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-iclb:         NOTRUN -> [SKIP][135] ([fdo#109291])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb6/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][136] ([fdo#109291]) +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@prime_nv_pcopy@test3_1.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][137] ([fdo#109295]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglb:         NOTRUN -> [SKIP][138] ([fdo#109295]) +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@prime_vgem@fence-read-hang.html

  * igt@syncobj_timeline@transfer-timeline-point:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][139] ([i915#5098])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl2/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][140] ([i915#5098])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk9/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-snb:          NOTRUN -> [DMESG-FAIL][141] ([i915#5098])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-snb5/igt@syncobj_timeline@transfer-timeline-point.html

  * igt@sysfs_clients@busy:
    - shard-tglb:         NOTRUN -> [SKIP][142] ([i915#2994]) +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@sysfs_clients@busy.html
    - shard-iclb:         NOTRUN -> [SKIP][143] ([i915#2994])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb4/igt@sysfs_clients@busy.html
    - shard-kbl:          NOTRUN -> [SKIP][144] ([fdo#109271] / [i915#2994]) +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@fair-7:
    - shard-glk:          NOTRUN -> [SKIP][145] ([fdo#109271] / [i915#2994])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk7/igt@sysfs_clients@fair-7.html

  
#### Possible fixes ####

  * igt@gem_exec_capture@pi@rcs0:
    - shard-iclb:         [INCOMPLETE][146] ([i915#3371]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb6/igt@gem_exec_capture@pi@rcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb4/igt@gem_exec_capture@pi@rcs0.html
    - {shard-tglu}:       [INCOMPLETE][148] ([i915#3371]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-tglu-5/igt@gem_exec_capture@pi@rcs0.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglu-6/igt@gem_exec_capture@pi@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [FAIL][150] ([i915#2842]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          [FAIL][152] ([i915#2842]) -> [PASS][153] +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][154] ([i915#2842]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-snb:          [SKIP][156] ([fdo#109271]) -> [PASS][157] +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][158] ([i915#5566] / [i915#716]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][160] ([fdo#109271]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270 (NEW):
    - shard-glk:          [FAIL][162] ([i915#1888] / [i915#5138]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-glk2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-glk8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][164] ([i915#180]) -> [PASS][165] +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_plane_cursor@pipe-c-overlay-size-64:
    - {shard-dg1}:        [SKIP][166] ([i915#2575]) -> [PASS][167] +13 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-dg1-15/igt@kms_plane_cursor@pipe-c-overlay-size-64.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@kms_plane_cursor@pipe-c-overlay-size-64.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - {shard-dg1}:        [FAIL][168] -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-dg1-18/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-16/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [SKIP][170] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][172] ([fdo#109441]) -> [PASS][173] +1 similar issue
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb3/igt@kms_psr@psr2_dpms.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [SKIP][174] ([i915#5519]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [DMESG-WARN][176] ([i915#5614]) -> [SKIP][177] ([i915#4525])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][178] ([i915#4525]) -> [DMESG-WARN][179] ([i915#5614]) +2 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][180] ([i915#3614]) -> [DMESG-WARN][181] ([i915#180])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-iclb:         [SKIP][182] ([fdo#109278] / [i915#6095]) -> [SKIP][183] ([fdo#109278]) +8 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][184] ([fdo#111068] / [i915#658]) -> [SKIP][185] ([i915#2920])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [FAIL][186] ([i915#5939]) -> [SKIP][187] ([fdo#109642] / [fdo#111068] / [i915#658])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][201], [FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205], [FAIL][206], [FAIL][207], [FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl1/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl1/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl3/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl4/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl4/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl6/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl6/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl6/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl6/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl7/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl7/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl7/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl7/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl3/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl3/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl4/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl4/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3371]: https://gitlab.freedesktop.org/drm/intel/issues/3371
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4241]: https://gitlab.freedesktop.org/drm/intel/issues/4241
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5304]: https://gitlab.freedesktop.org/drm/intel/issues/5304
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5353]: https://gitlab.freedesktop.org/drm/intel/issues/5353
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5498]: https://gitlab.freedesktop.org/drm/intel/issues/5498
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6495 -> IGTPW_7178
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11705: 18a2e6dbca526f996da04741cf5ef169e810a50e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7178: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/index.html
  IGT_6495: 7e2033da45f024a0348e6034fcb7f70a91b80ee9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/index.html

--===============2949156018664281377==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>intel_gpu_top: Don&#39;t show client header =
if no kernel support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104447/">https://patchwork.freedesktop.org/series/104447/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7178/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11705_full -&gt; IGTPW_7178_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/index.=
html</p>
<h2>Participating hosts (13 -&gt; 9)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7178=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-dg1-18/igt@fbdev@pan.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@fbdev@pa=
n.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@kms_addfb_basic@addfb25-y-tiled-l=
egacy.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@kms_force_connector_basic@force-e=
did.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11705_full and IGTPW_7178_=
full:</p>
<h3>New IGT tests (121)</h3>
<ul>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>Statuses : 6 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.39, 5.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [5.40, 5.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.06, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@vecs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vecs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vecs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@i915_pciid:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.05, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-vga:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>Statuses : 5 pass(s) 3 warn(s)</li>
<li>Exec time: [12.21, 18.27] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@engine-info:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@engine-info-invalid:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.30, 4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.30, 5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.02, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.57, 6.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.40, 6.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.02, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.97, 9.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.67, 9.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.02, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.10, 4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.11, 4.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.01, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-addfb:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.18, 4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.22, 3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.01, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.37, 5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.39, 5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.01, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.62, 5.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.02, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.02, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.09, 3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.13, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.01, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 6 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 6 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 5.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-hd=
mi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-b-hd=
mi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-c-hd=
mi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-d-hd=
mi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7178_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@gem_ccs@block-copy-inplace.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-glk4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +91 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#=
5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-dg1-18/igt@gem_exec_balancer@sliced.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4771">i9=
15#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb7/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@gem_exec_params@no-blt.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#=
109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-apl7/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-=
apl2/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-glk4/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-=
glk2/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked-all.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7178/shard-iclb1/igt@gem_exec_whisper@basic-queues-forked-all.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5304">i=
915#5304</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
498">i915#5498</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl3/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-ran=
dom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-glk8/igt@gem_lmem_swapping@verify.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-apl2/igt@gem_lmem_swapping@verify.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-snb2/igt@gem_mmap_wc@coherency.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-snb6/igt@=
gem_mmap_wc@coherency.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglb6/igt@gem_pxp@create-regular-context-2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb7/igt@gem_pxp@create-regular-context-2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb8/igt@gem_render_copy@linear-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-glk7/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/417=
1">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-glk8/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@gem_userptr_blits@readonly-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb6/igt@gem_userptr_blits@unsync-unmap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-glk8/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@gen7_exec_parse@cmd-crossing-page.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@gen9_exec_parse@bb-chained.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">i=
915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@gen9_exec_parse@bb-start-out.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527"=
>i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglb5/igt@i915_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902"=
>i915#1902</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb2/igt@i915_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902"=
>i915#1902</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglb5/igt@i915_query@query-topology-known-pci=
-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109303">fdo#109303</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb3/igt@i915_query@query-topology-known-pci=
-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109303">fdo#109303</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
73">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@i915_selftest@live@hangcheck.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_big_fb@4-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5286">i915#5286</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90 (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglu-4/igt@kms_big_fb@linear-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270 (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111614">fdo#111614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90 (NEW):</p>
<ul>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-dg1-12/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3638">i915#3638</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270 (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-dg1-19/igt@kms_big_fb@x-tiled-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1836">i915#1836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0 (NEW):</p>
<ul>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglu-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +2 similar issues</p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-dg1-18/igt@kms_big_fb@yf-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4538">i915#4538</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270 (NEW):</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4538">i=
915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7178/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#18=
36</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3689">i915#3689</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-glk5/igt@kms_ccs@pipe-b-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-snb5/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +98 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb2/igt@kms_ccs@pipe-d-bad-rotation-90-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-apl1/igt@kms_chamelium@dp-mode-timings.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-glk8/igt@kms_chamelium@dp-mode-timings.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-snb6/igt@kms_chamelium@dp-mode-timings.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglu-8/igt@kms_chamelium@hdmi-audio.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">f=
do#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_chamelium@hdmi-hpd-after-suspe=
nd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">f=
do#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1149">i915#1149</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-apl4/igt@kms_content_protection@lic.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_content_protection@lic.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">f=
do#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_content_protection@lic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i9=
15#1063</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_content_protection@lic.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/=
shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-onscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3319">i915#3319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb7/igt@kms_cursor_legacy@2x-long-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7178/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7178/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor=
-atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@kms_cursor_legacy@pipe-d-single-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@kms_cursor_legacy@pipe-d-single-mo=
ve.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/4103">i915#4103</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb210101=
0-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb1/igt@kms_draw_crc@draw-method-xrgb210101=
0-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb6/igt@kms_flip@2x-blocking-absolute-wf_v=
blank-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_flip@2x-single-buffer-flip-vs-=
dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_flip@flip-vs-suspend-interrupti=
ble@a-dp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-=
ytile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-64bpp-ytile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4911">i915#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +42 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-t=
glb8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb7/igt@kms_hdr@static-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3=
555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-apl6/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_plane_lowres@pipe-a-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@kms_plane_lowres@pipe-b-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-b-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5288">i915#5288</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-kbl7/igt@kms_psr2_sf@cursor-plane-update-sf.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i=
915#1911</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb5/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb2/igt@kms_psr@psr2_primary_mmap_cpu.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132"=
>i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3467">i915#3467</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5289">i915#5289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-glk4/igt@kms_rotation_crc@sprite-rotation-90.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/s=
hard-glk6/igt@kms_rotation_crc@sprite-rotation-90.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65">i915#65</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-kbl4/igt@kms_scaling_modes@scaling-mode-full=
-aspect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>) +274 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-apl4/igt@kms_vblank@pipe-d-ts-continuation-i=
dle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +78 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@kms_vrr@flip-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#35=
55</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglb6/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-kbl3/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb8/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@nouveau_crc@pipe-c-source-outp-com=
plete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@nouveau_crc@pipe-d-source-rg.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278=
">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2530">i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb5/igt@perf@unprivileged-single-ctx-count=
ers.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb6/igt@prime_nv_api@i915_nv_import_vs_clo=
se.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb8/igt@prime_nv_pcopy@test3_1.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-iclb3/igt@prime_vgem@fence-flip-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-tglb3/igt@prime_vgem@fence-read-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@transfer-timeline-point:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-apl2/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-glk9/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-snb5/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-tglb8/igt@sysfs_clients@busy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994<=
/a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-iclb4/igt@sysfs_clients@busy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994<=
/a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7178/shard-kbl7/igt@sysfs_clients@busy.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i91=
5#2994</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7178/shard-glk7/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_capture@pi@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11705/shard-iclb6/igt@gem_exec_capture@pi@rcs0.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3371">i915#3371=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/=
shard-iclb4/igt@gem_exec_capture@pi@rcs0.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11705/shard-tglu-5/igt@gem_exec_capture@pi@rcs0.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3371">i915#337=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178=
/shard-tglu-6/igt@gem_exec_capture@pi@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
178/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
178/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/s=
hard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7178/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-uc=
.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-glk6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7178/shard-glk5/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-apl=
2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270 (NEW):</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-glk2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i91=
5#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/513=
8">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7178/shard-glk8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7178/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a=
> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-overlay-size-64:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-dg1-15/igt@kms_plane_cursor@pipe-c-overlay-size-64.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2575=
">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7178/shard-dg1-19/igt@kms_plane_cursor@pipe-c-overlay-size-64.html">P=
ASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-dg1-18/igt@kms_plane_lowres@pipe-b-tiling-x.html">FAIL<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/sh=
ard-dg1-16/igt@kms_plane_lowres@pipe-b-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#1=
09642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11106=
8">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7178/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb3/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb=
2/igt@kms_psr@psr2_dpms.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7178/shard-tglb5/igt@kms_psr_stress_test@invalidate-primar=
y-flip-overlay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/561=
4">i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7178/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#=
4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7178/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i91=
5#5614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-kbl4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3614">i915#3=
614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
78/shard-kbl4/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_til=
ed_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-iclb2/igt@kms_ccs@pipe-c-crc-pri=
mary-rotation-180-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +8 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7178/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#29=
20</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11705/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/sha=
rd-iclb3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11705/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11705/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11705/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl6/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11705/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_117=
05/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl7/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/=
shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_11705/shard-kbl7/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11705/sha=
rd-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7178/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl3/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7178/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178=
/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-=
kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7178/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7178/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7178/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/shard-kbl7/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6495 -&gt; IGTPW_7178</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11705: 18a2e6dbca526f996da04741cf5ef169e810a50e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7178: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7178/index.htm=
l<br />
  IGT_6495: 7e2033da45f024a0348e6034fcb7f70a91b80ee9 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2949156018664281377==--
